Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0323B8A3A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 23:53:09 +0200 (CEST)
Received: from localhost ([::1]:44174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyi8q-0001vV-2c
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 17:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyi72-0001Fm-Qr
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 17:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyi6z-0005zM-Kp
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 17:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625089871;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1fX4WFbKWwML7/0N9C+A9HGjdzwgYB7a8SsPOFtwqI=;
 b=ZCIOwMWJw8D/QiftGlhWisqZJdFKgOkAU4LUwHypbOOKxmIsHOiEFgs0coZbAWEHAJn9rn
 LdVPhhNFa5LbqnQahYe5If9kxpe+Yy7W/BKuMss7WOrh9LX3NXJtgdZ3EhfslUlpcZEM3f
 FsDAU5+xzjM/E5Z2f3VgyrUCRPvvggw=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-KIgfB3srMIqDF_y2REJYMw-1; Wed, 30 Jun 2021 17:51:08 -0400
X-MC-Unique: KIgfB3srMIqDF_y2REJYMw-1
Received: by mail-pj1-f71.google.com with SMTP id
 br8-20020a17090b0f08b02901706e80711dso2072330pjb.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 14:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=X1fX4WFbKWwML7/0N9C+A9HGjdzwgYB7a8SsPOFtwqI=;
 b=IKMFpInQWdC8uLAorlxLFd2GqZCPcND8WAk/f8xvfv0+HNj7cORgrc+Jleu0PcVZVF
 daH6B1TYsEjqB5v5MAgpnpWkyvcJCGe9eABinWaiWlimd9o15GdR/0Xa5lmehfFcRgYO
 dmilcVVZJTJ0TkYbIEZsxbZ4QqCBg8E+2y9PAl0hlPKa47Br5cjloHe9wwsUinmhvvev
 seWuXHEav4QSqK27/sXw6a3NaOM0rjKowoSk2Lb7DTUapttgercNhM/fmzEozkomcqCJ
 2abTpyF69fgVuL7dk/b7ynqzj0p6QCEg8L1ojG/bnucYuNuseMzX+UkVgbwrdjbr1b4+
 gjew==
X-Gm-Message-State: AOAM532kkV6yPZxqnQ83xN5fWUQHpE0dekZIBNgwNVdpX0/smv594QOb
 sjQeOxsUBNEDNtWr1jcPkF8ujptvCWthjCN+r4+52F699QLIpiSoqAhH2MmYn1waeACzPJd6GqT
 XnShfAqHgcTw+D4Y=
X-Received: by 2002:a62:f24b:0:b029:309:d1a1:55fb with SMTP id
 y11-20020a62f24b0000b0290309d1a155fbmr29429893pfl.61.1625089867603; 
 Wed, 30 Jun 2021 14:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHR9gNKtNXg/FCtTYqcOXwIoXAcz1m/QGsHeFyQK6tKUU4VTK5UvNIVnfx1xTuFCH/GBKxMA==
X-Received: by 2002:a62:f24b:0:b029:309:d1a1:55fb with SMTP id
 y11-20020a62f24b0000b0290309d1a155fbmr29429865pfl.61.1625089867317; 
 Wed, 30 Jun 2021 14:51:07 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id p6sm7132773pjk.37.2021.06.30.14.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 14:51:06 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7df3e628-c8c2-9d49-129f-ac77187bbb5a@redhat.com>
Date: Wed, 30 Jun 2021 18:51:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210630012619.115262-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 10:26 PM, Cleber Rosa wrote:
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
>   docs/devel/ci.rst                      |  40 +++++++++
>   scripts/ci/setup/.gitignore            |   2 +
>   scripts/ci/setup/build-environment.yml | 116 +++++++++++++++++++++++++
>   scripts/ci/setup/inventory.template    |   1 +
>   4 files changed, 159 insertions(+)
>   create mode 100644 scripts/ci/setup/.gitignore
>   create mode 100644 scripts/ci/setup/build-environment.yml
>   create mode 100644 scripts/ci/setup/inventory.template

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 064ffa9988..bfedbb1025 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -30,3 +30,43 @@ The GitLab CI jobs definition for the custom runners are located under::
>   Custom runners entail custom machines.  To see a list of the machines
>   currently deployed in the QEMU GitLab CI and their maintainers, please
>   refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
> +
> +Machine Setup Howto
> +-------------------
> +
> +For all Linux based systems, the setup can be mostly automated by the
> +execution of two Ansible playbooks.  Create an ``inventory`` file
> +under ``scripts/ci/setup``, such as this::
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
> +QEMU tests.  This playbook consists on the installation of various
> +required packages (and a general package update while at it).  It
> +currently covers a number of different Linux distributions, but it can
> +be expanded to cover other systems.
> +
> +The minimum required version of Ansible successfully tested in this
> +playbook is 2.8.0 (a version check is embedded within the playbook
> +itself).  To run the playbook, execute::
> +
> +  cd scripts/ci/setup
> +  ansible-playbook -i inventory build-environment.yml
> +
> +Please note that most of the tasks in the playbook require superuser
> +privileges, such as those from the ``root`` account or those obtained
> +by ``sudo``.  If necessary, please refer to ``ansible-playbook``
> +options such as ``--become``, ``--become-method``, ``--become-user``
> +and ``--ask-become-pass``.
> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..ee088604d1
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1,2 @@
> +inventory
> +
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> new file mode 100644
> index 0000000000..581c1c75d1
> --- /dev/null
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -0,0 +1,116 @@
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +#
> +# This is an ansible playbook file.  Run it to set up systems with the
> +# environment needed to build QEMU.
> +---
> +- name: Installation of basic packages to build QEMU
> +  hosts: all
> +  tasks:
> +    - name: Check for suitable ansible version
> +      delegate_to: localhost
> +      assert:
> +        that:
> +          - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
> +        msg: "Unsuitable ansible version, please use version 2.8.0 or later"
> +
> +    - name: Update apt cache / upgrade packages via apt
> +      apt:
> +        update_cache: yes
> +        upgrade: yes
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


