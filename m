Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C2B3A0109
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:51:35 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgp4-0007ME-K1
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqgmN-000601-V6
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lqgmF-0000qV-Vu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623178118;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCU+3BySUhJ2WjvfaKjaaW4bpAkC4mLwkGJhxRk/pmY=;
 b=H+p0AMG1v7bcCLj58Su9BxMPMyOzIAsn19IOeQ0nm5bbFP+SWmouVDPGx7wWESuy9f0pUZ
 dLpXigq0SSDjwH30/yvCC7qnp0kws8PUOEVot7FXX20MgiDSPjvTHyJl4F5J20NXhUJF2N
 FCNfe8UjebuvpYAnfteP9LLdEUQ9XUE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-j9G53Q6FMz2qjX37VJbh4g-1; Tue, 08 Jun 2021 14:48:35 -0400
X-MC-Unique: j9G53Q6FMz2qjX37VJbh4g-1
Received: by mail-qk1-f199.google.com with SMTP id
 k125-20020a3788830000b02903a65618d46cso15701098qkd.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 11:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XCU+3BySUhJ2WjvfaKjaaW4bpAkC4mLwkGJhxRk/pmY=;
 b=Bb1zWatffCaxfQuFibBF9wVq8WNeVysdnB6oatw0+aQp08tV0zxuxrXfGIuxnisxmP
 LnD4Fg8XQ70x6CZOQuq8W9M1W76xHy095yv6WaqpY2PXAF2YMEwAHHJ671tY75EXB8oI
 nrYvUk6QcNTaeE3E11W2TZWnHFNgrZZFAbagfC+uEJJ+Tj7wUzxKQCZ75b+qJtlh5BYv
 ccj/7JZ1FUSZavs1pJL0vVypxHRStAeU6gTxIlGZh58B+/aUJz7kFhHeAti1AP9cgXvB
 YwqtdhjofjAV8gBp2ASe3EhhM6SdLEdFjcivxll/EGOapyo9myTsd6lLt8KqmVIYHpLr
 ttpw==
X-Gm-Message-State: AOAM531WzyGpD3gqDpF5dlZ/5MTsO1edBZi6ySvmfKJSubboRGXtzA4F
 reUHywfXoylCRHjTeSIFtwHbsLIKXz1pOEFEnLXmuRnwHoam+XR2Zw2x50Bg/zXrXvEBu8O5Mb1
 TE373plb/Ru4s5ek=
X-Received: by 2002:ad4:51d1:: with SMTP id p17mr1694839qvq.55.1623178115337; 
 Tue, 08 Jun 2021 11:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE2xm7DG6kcqV65u7YXd7YJngKIyTqTpz+o2Dyb6o5Y/vAPo3GuHHGP4kwzlmsaHqk6m3HaA==
X-Received: by 2002:ad4:51d1:: with SMTP id p17mr1694800qvq.55.1623178115075; 
 Tue, 08 Jun 2021 11:48:35 -0700 (PDT)
Received: from wainer-laptop.localdomain ([201.90.138.4])
 by smtp.gmail.com with ESMTPSA id c26sm11266115qtj.41.2021.06.08.11.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:48:34 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <eee53288-6f8e-1d33-68a1-83a5f78316d1@redhat.com>
Date: Tue, 8 Jun 2021 15:48:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/8/21 12:14 AM, Cleber Rosa wrote:
> To run basic jobs on custom runners, the environment needs to be
> properly set up.  The most common requirement is having the right
> packages installed.
>
> The playbook introduced here covers the QEMU's project s390x and
> aarch64 machines.  At the time this is being proposed, those machines
> have already had this playbook applied to them.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   docs/devel/ci.rst                      | 30 ++++++++
>   scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
>   scripts/ci/setup/inventory.template    |  1 +
>   3 files changed, 129 insertions(+)
>   create mode 100644 scripts/ci/setup/build-environment.yml
>   create mode 100644 scripts/ci/setup/inventory.template
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 585b7bf4b8..35c6b5e269 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>   The GitLab CI jobs definition for the custom runners are located under::
>   
>     .gitlab-ci.d/custom-runners.yml
> +
> +Machine Setup Howto
> +-------------------
> +
> +For all Linux based systems, the setup can be mostly automated by the
> +execution of two Ansible playbooks.  Create an ``inventory`` file
> +under ``scripts/ci/setup``, such as this::
Missing to mention the template file.
> +
> +  fully.qualified.domain
> +  other.machine.hostname
> +
> +You may need to set some variables in the inventory file itself.  One
> +very common need is to tell Ansible to use a Python 3 interpreter on
> +those hosts.  This would look like::
> +
> +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
> +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
> +
> +Build environment
> +~~~~~~~~~~~~~~~~~
> +
> +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> +set up machines with the environment needed to perform builds and run
> +QEMU tests.  It covers a number of different Linux distributions and
> +FreeBSD.
> +
> +To run the playbook, execute::
> +
> +  cd scripts/ci/setup
> +  ansible-playbook -i inventory build-environment.yml
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> new file mode 100644
> index 0000000000..664f2f0519
> --- /dev/null
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -0,0 +1,98 @@
> +---
> +- name: Installation of basic packages to build QEMU
> +  hosts: all

You will need to "become: yes" if the login user is not privileged, right?

Or mention on the documentation how the user should configure the 
connection for privileged login.

About privilege escalation with Ansible: 
https://docs.ansible.com/ansible/latest/user_guide/become.html

> +  tasks:

Just a tip: you can put all those task under a block 
(https://docs.ansible.com/ansible/latest/user_guide/playbooks_blocks.html) 
so check if "ansible_facts['distribution'] == 'Ubuntu'" only once.

I reviewed the remain of the playbook; it looks good to me.

> +    - name: Update apt cache
> +      apt:
> +        update_cache: yes
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +
> +    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
> +      package:
> +        name:
> +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> +          - ccache
> +          - gcc
> +          - gettext
> +          - git
> +          - glusterfs-common
> +          - libaio-dev
> +          - libattr1-dev
> +          - libbrlapi-dev
> +          - libbz2-dev
> +          - libcacard-dev
> +          - libcap-ng-dev
> +          - libcurl4-gnutls-dev
> +          - libdrm-dev
> +          - libepoxy-dev
> +          - libfdt-dev
> +          - libgbm-dev
> +          - libgtk-3-dev
> +          - libibverbs-dev
> +          - libiscsi-dev
> +          - libjemalloc-dev
> +          - libjpeg-turbo8-dev
> +          - liblzo2-dev
> +          - libncurses5-dev
> +          - libncursesw5-dev
> +          - libnfs-dev
> +          - libnss3-dev
> +          - libnuma-dev
> +          - libpixman-1-dev
> +          - librados-dev
> +          - librbd-dev
> +          - librdmacm-dev
> +          - libsasl2-dev
> +          - libsdl2-dev
> +          - libseccomp-dev
> +          - libsnappy-dev
> +          - libspice-protocol-dev
> +          - libssh-dev
> +          - libusb-1.0-0-dev
> +          - libusbredirhost-dev
> +          - libvdeplug-dev
> +          - libvte-2.91-dev
> +          - libzstd-dev
> +          - make
> +          - python3-yaml
> +          - python3-sphinx
> +          - python3-sphinx-rtd-theme
> +          - ninja-build
> +          - sparse
> +          - xfslibs-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +
> +    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x
> +      package:
> +        name:
> +          - libspice-server-dev
> +          - libxen-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +        - ansible_facts['architecture'] != 's390x'
> +
> +    - name: Install basic packages to build QEMU on Ubuntu 18.04
> +      package:
> +        name:
> +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> +          - clang
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +        - ansible_facts['distribution_version'] == '18.04'
> +
> +    - name: Install basic packages to build QEMU on Ubuntu 20.04
> +      package:
> +        name:
> +        # Originally from tests/docker/dockerfiles/ubuntu2004.docker
> +          - clang-10
> +          - genisoimage
> +          - liblttng-ust-dev
> +          - libslirp-dev
> +          - netcat-openbsd
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +        - ansible_facts['distribution_version'] == '20.04'
> diff --git a/scripts/ci/setup/inventory.template b/scripts/ci/setup/inventory.template
> new file mode 100644
> index 0000000000..2fbb50c4a8
> --- /dev/null
> +++ b/scripts/ci/setup/inventory.template
> @@ -0,0 +1 @@
> +localhost


