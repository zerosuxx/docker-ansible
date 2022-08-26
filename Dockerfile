FROM alpine

RUN apk add --no-cache \
    ansible \
    bash \
    openssh \
    sshpass \
    nano \
    make \
    py3-jmespath

RUN mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

RUN adduser -D ansible

USER ansible

RUN mkdir ~/.ssh

ENV PATH=/home/ansible/.local/bin:$PATH
ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV EDITOR=nano
