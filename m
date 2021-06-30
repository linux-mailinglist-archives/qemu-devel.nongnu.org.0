Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C279F3B814E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 13:29:59 +0200 (CEST)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyYPm-0000zo-Ce
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 07:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyYOj-00008Z-HT
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:28:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lyYOh-0002zx-2P
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 07:28:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so187576wms.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 04:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bmtxOADxcGWNkE7eT8wjfA4JwRpiA/1Lp3Cy5nymiPQ=;
 b=x6sWjHVCv93KGecyyxA9cQnKheKdMN6IzePkwbqnG0/GPP8arh9LM9P8PGQfsse8nF
 se2rPAV7SfhAYo9xUXk0l9pJs/mj5BnLxJKHy/+569PeUrhkit3OMULdZctImWQK2lj7
 fh40CvK1wxUwlHwNbtu+7yrUSWejh7bPRVh/sLjFTNm2wjmkbWcAO+Iu/yOwG41LVEX/
 Ee4sphnA9ixydOhFA9y4CQ+0E2jbWsN6cmyZjbthSef267q18XPT+QI4yXbyGtJc3EkN
 xYeIyTED09QUAcifXNz1BkHHTZGz/96E6pVzqgMOHUg+m7IJnp/VD1UUaUxlS51ZZAsA
 xYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bmtxOADxcGWNkE7eT8wjfA4JwRpiA/1Lp3Cy5nymiPQ=;
 b=se8Q0V3ONf5gAtCJK8Z6xrbBgOgw7lkyIxWdFNkiMRCdZ2MH/B1+enhlq2rDUR3CTC
 be2loHXwlWdfH46Re+92NdTzwJoj3ipTnTJUqAhCQN4z6aPhFkomLE5ga/6LM7ENp/WW
 NFx3gQpiKDWK5uNJ6MqgxRTUiBatMMl6gNJtUU5KPEd+s3o2H7h/G0EFdNbHI+2my6tV
 cwGG38kRRFCL5tkBvpzwPnPA5MsOx4VtuKlWUjyXT2JMjwRbJTuHCE9F5Dpw9GJp+pfw
 +nJ6A3+aa6yk9xtvs+i0RsJpaUgWEmtbMjgrlJSXajATrVZIR8l4RL5VsPDGH/xKHs5v
 FpzQ==
X-Gm-Message-State: AOAM531a1Ts5rBQSGIATNOLGAG7YW1IcFcyw2bMO7aDCHBZ3fcu5Z8QC
 SslvvGNK1moov0d1inUFBByaTQ==
X-Google-Smtp-Source: ABdhPJyRyAFWL8Eaf/uQTCtnfA/C3tvDA8tuZQQbpHDXKPBklUMvAEBzT6vewuxDhUuaO9qgnBYSAQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr37699685wmh.151.1625052528781; 
 Wed, 30 Jun 2021 04:28:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm21285415wrw.46.2021.06.30.04.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 04:28:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 006481FF7E;
 Wed, 30 Jun 2021 12:28:46 +0100 (BST)
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-3-crosa@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v7 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Wed, 30 Jun 2021 11:30:06 +0100
In-reply-to: <20210630012619.115262-3-crosa@redhat.com>
Message-ID: <87v95vpp5d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

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
>  docs/devel/ci.rst                      |  40 +++++++++
>  scripts/ci/setup/.gitignore            |   2 +
>  scripts/ci/setup/build-environment.yml | 116 +++++++++++++++++++++++++
>  scripts/ci/setup/inventory.template    |   1 +
>  4 files changed, 159 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/build-environment.yml
>  create mode 100644 scripts/ci/setup/inventory.template
>
> diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> index 064ffa9988..bfedbb1025 100644
> --- a/docs/devel/ci.rst
> +++ b/docs/devel/ci.rst
> @@ -30,3 +30,43 @@ The GitLab CI jobs definition for the custom runners a=
re located under::
>  Custom runners entail custom machines.  To see a list of the machines
>  currently deployed in the QEMU GitLab CI and their maintainers, please
>  refer to the QEMU `wiki <https://wiki.qemu.org/AdminContacts>`__.
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
> +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
> +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3

I was able to put root@foo for the machines I had in my .ssh/config

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

If the above works maybe worth mentioning here because just having root
ssh is probably the easiest way to manage a box.=20

> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..ee088604d1
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1,2 @@
> +inventory
> +
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/bu=
ild-environment.yml
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
> +          - '((ansible_version.major =3D=3D 2) and (ansible_version.mino=
r >=3D 8)) or (ansible_version.major >=3D 3)'
> +        msg: "Unsuitable ansible version, please use version 2.8.0 or la=
ter"
> +
> +    - name: Update apt cache / upgrade packages via apt
> +      apt:
> +        update_cache: yes
> +        upgrade: yes
> +      when:
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
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
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> +
> +    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-=
s390x
> +      package:
> +        name:
> +          - libspice-server-dev
> +          - libxen-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> +        - ansible_facts['architecture'] !=3D 's390x'
> +
> +    - name: Install basic packages to build QEMU on Ubuntu 18.04
> +      package:
> +        name:
> +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> +          - clang
> +      when:
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> +        - ansible_facts['distribution_version'] =3D=3D '18.04'
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
> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> +        - ansible_facts['distribution_version'] =3D=3D '20.04'
> diff --git a/scripts/ci/setup/inventory.template b/scripts/ci/setup/inven=
tory.template
> new file mode 100644
> index 0000000000..2fbb50c4a8
> --- /dev/null
> +++ b/scripts/ci/setup/inventory.template
> @@ -0,0 +1 @@
> +localhost

Anyway:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

