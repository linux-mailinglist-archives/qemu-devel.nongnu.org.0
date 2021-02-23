Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBB32307B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:18:44 +0100 (CET)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcGh-0002U6-Tg
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcFt-00021O-BR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:17:53 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEcFq-0003rZ-3O
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:17:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id m1so3342809wml.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fIhVg4Dvqjl5OcQaWAjFch13JeDdGgKavbp0DOgVbpY=;
 b=D+svOJSCarRKM9ABTq9Dm1j111b03f5T8DR/x4fu4D+90f8W5fC1xgR0zcKKb7mRJF
 CnSsIA6zcMIUJIwAZEY6ptDxWrQpRTq/L1EC75aK6ynnjZM4EB+vViMnAQ3llTklsHgD
 2wpyienpEDUWPSCXd9gfUA0nNRmkni0G8l+6P2XZEWW+JJUUlI1qu8IwpkV94i1DAzKz
 CvH8nuqm8PiQSE1iXe2wOS+1P9gTaLT0Emtwr9htYwoQYGnZcPsis4Ob0686skdzsTCz
 YQgbDzoFrDe2g8+Nn4dd10CZm9XYGkQhAeuSfmjwNX5y+Kcl/UrAjlBtTMohR1BKJIc4
 dj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fIhVg4Dvqjl5OcQaWAjFch13JeDdGgKavbp0DOgVbpY=;
 b=suLggXF70eTgWv8PD84ZmxyymQi1Z6jZmQ/g5XYUHQx6zdhvjoAXNAisXd3eB0+2Xl
 tB/N+ZQeNBQwkwfj9P2KssOZO8qx9watRRHHgQu5OMG81JVh6tLgRy5TtJnzOQvO8vbR
 wUHEVpGXY6mG3T7x7Ak3FzrZTHNiQMw07AKl+oT7ZxezZ/hUQTdjTlQrwdlnZFHDnIP2
 c3aCdu1nrickWxsaXZu7h4r2BsT4Afblc6eO8hYHR/A0S2H68BgUboGTYGa+jLB8BHZC
 ZQoV4G2nqnUeiZHmH3YaAuYwmAaAOptnP90CLzXYAJXjPU2xQf5A/KBjiESYPtUlmus/
 hmng==
X-Gm-Message-State: AOAM5319PcUpkBzQvornIAxUdMKf/xvFwOVrTwSBCwk3zSeIYSrCUBlx
 gXWT+RuUQ6wQFhUPXxBh69nwdw==
X-Google-Smtp-Source: ABdhPJzA34wwPu4iA5W3QrBFSE8dnXDtBIiXVP5W8DUpiEdz6Q3WCoiWIAl7DTgTP+e6LvLJqBFZOQ==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr72299wmb.14.1614104268355;
 Tue, 23 Feb 2021 10:17:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x18sm31673417wrs.16.2021.02.23.10.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:17:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 787721FF7E;
 Tue, 23 Feb 2021 18:17:46 +0000 (GMT)
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com> <87im6i4znx.fsf@linaro.org>
 <20210223170851.GB987581@amachine.somewhere>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Tue, 23 Feb 2021 18:16:18 +0000
In-reply-to: <20210223170851.GB987581@amachine.somewhere>
Message-ID: <871rd64pit.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Cleber Rosa <crosa@redhat.com> writes:
>>=20
>> > To run basic jobs on custom runners, the environment needs to be
>> > properly set up.  The most common requirement is having the right
>> > packages installed.
>> >
>> > The playbook introduced here covers the QEMU's project s390x and
>> > aarch64 machines.  At the time this is being proposed, those machines
>> > have already had this playbook applied to them.
>> >
>> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> > ---
>> >  docs/devel/ci.rst                      | 30 ++++++++++
>> >  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
>> >  scripts/ci/setup/inventory             |  1 +
>> >  3 files changed, 107 insertions(+)
>> >  create mode 100644 scripts/ci/setup/build-environment.yml
>> >  create mode 100644 scripts/ci/setup/inventory
>> >
>> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>> > index 585b7bf4b8..a556558435 100644
>> > --- a/docs/devel/ci.rst
>> > +++ b/docs/devel/ci.rst
>> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>> >  The GitLab CI jobs definition for the custom runners are located unde=
r::
>> >=20=20
>> >    .gitlab-ci.d/custom-runners.yml
>> > +
>> > +Machine Setup Howto
>> > +-------------------
>> > +
>> > +For all Linux based systems, the setup can be mostly automated by the
>> > +execution of two Ansible playbooks.  Start by adding your machines to
>> > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
>> > +
>> > +  fully.qualified.domain
>> > +  other.machine.hostname
>>=20
>> Is this really needed? Can't the host list be passed in the command
>> line? I find it off to imagine users wanting to configure whole fleets
>> of runners.
>>
>
> No, it's not needed.
>
> But, in my experience, it's the most common way people use
> ansible-playbook.  As with all most tools QEMU relies on, that are
> many different ways of using them.  IMO documenting more than one way
> to perform the same task makes the documentation unclear.
>
>> > +
>> > +You may need to set some variables in the inventory file itself.  One
>> > +very common need is to tell Ansible to use a Python 3 interpreter on
>> > +those hosts.  This would look like::
>> > +
>> > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
>> > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
>> > +
>> > +Build environment
>> > +~~~~~~~~~~~~~~~~~
>> > +
>> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>> > +set up machines with the environment needed to perform builds and run
>> > +QEMU tests.  It covers a number of different Linux distributions and
>> > +FreeBSD.
>> > +
>> > +To run the playbook, execute::
>> > +
>> > +  cd scripts/ci/setup
>> > +  ansible-playbook -i inventory build-environment.yml
>>=20
>> So I got somewhat there with a direct command line invocation:
>>=20
>>   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/s=
etup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/python=
3'
>>
>
> Yes, and the "-e" is another example of the multiple ways to achieve
> the same task.
>
>> although for some reason a single host -i fails...
>>=20
>> > diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup=
/build-environment.yml
>
> It requires a comma separated list, even if it's a list with a single
> item:
>
>    https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html#cmdo=
ption-ansible-playbook-i
>
>> > new file mode 100644
>> > index 0000000000..0197e0a48b
>> > --- /dev/null
>> > +++ b/scripts/ci/setup/build-environment.yml
>> > @@ -0,0 +1,76 @@
>> > +---
>> > +- name: Installation of basic packages to build QEMU
>> > +  hosts: all
>> > +  tasks:
>> > +    - name: Update apt cache
>> > +      apt:
>> > +        update_cache: yes
>> > +      when:
>> > +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>>=20
>> So are we limiting to Ubuntu here rather than say a Debian base?
>>
>
> You have a point, because this would certainly work and be applicable
> to Debian systems too.  But, this is a new addition on v5, and I'm
> limiting this patch to the machines that are available/connected right
> now to the QEMU project on GitLab.
>
> I can change that to "distribution_family =3D=3D Debian" if you think
> it's a good idea.  But IMO it'd make more sense for a patch
> introducing the package list for Debian systems to change that.
>
>> > +
>> > +    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
>> > +      package:
>> > +        name:
>> > +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
>> > +          - ccache
>> > +          - clang
>> > +          - gcc
>> > +          - gettext
>> > +          - git
>> > +          - glusterfs-common
>> > +          - libaio-dev
>> > +          - libattr1-dev
>> > +          - libbrlapi-dev
>> > +          - libbz2-dev
>> > +          - libcacard-dev
>> > +          - libcap-ng-dev
>> > +          - libcurl4-gnutls-dev
>> > +          - libdrm-dev
>> > +          - libepoxy-dev
>> > +          - libfdt-dev
>> > +          - libgbm-dev
>> > +          - libgtk-3-dev
>> > +          - libibverbs-dev
>> > +          - libiscsi-dev
>> > +          - libjemalloc-dev
>> > +          - libjpeg-turbo8-dev
>> > +          - liblzo2-dev
>> > +          - libncurses5-dev
>> > +          - libncursesw5-dev
>> > +          - libnfs-dev
>> > +          - libnss3-dev
>> > +          - libnuma-dev
>> > +          - libpixman-1-dev
>> > +          - librados-dev
>> > +          - librbd-dev
>> > +          - librdmacm-dev
>> > +          - libsasl2-dev
>> > +          - libsdl2-dev
>> > +          - libseccomp-dev
>> > +          - libsnappy-dev
>> > +          - libspice-protocol-dev
>> > +          - libssh-dev
>> > +          - libusb-1.0-0-dev
>> > +          - libusbredirhost-dev
>> > +          - libvdeplug-dev
>> > +          - libvte-2.91-dev
>> > +          - libzstd-dev
>> > +          - make
>> > +          - ninja-build
>> > +          - python3-yaml
>> > +          - python3-sphinx
>> > +          - sparse
>> > +          - xfslibs-dev
>> > +        state: present
>> > +      when:
>> > +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>> > +
>> > +    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on n=
on-s390x
>> > +      package:
>> > +        name:
>> > +          - libspice-server-dev
>> > +          - libxen-dev
>> > +        state: present
>> > +      when:
>> > +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>> > +        - ansible_facts['architecture'] !=3D 's390x'
>> > diff --git a/scripts/ci/setup/inventory b/scripts/ci/setup/inventory
>> > new file mode 100644
>> > index 0000000000..2fbb50c4a8
>> > --- /dev/null
>> > +++ b/scripts/ci/setup/inventory
>> > @@ -0,0 +1 @@
>> > +localhost
>>=20
>> I'm not sure we should have a default here because it will inevitably
>> cause someone to do something to their machine when trying to setup a
>> runner.
>>
>
> Fair enough.  Then I see two options:
>
> 1) follow the vars.yml.template example and only ship a
>    inventory.template file

I'd go with the template approach, that way someones local hacks can at
least live in their source tree without being overly bothered by
checkouts and updates.

>
> 2) use a placeholder with an impossible hostname such as
>    "my-qemu-runner.example.org" or "your-host-name-here"
>
>> --=20
>> Alex Benn=C3=A9e
>>=20
>
> Let me know what you think is more reasonable, and thanks for the
> review!
>
> Regards,
> - Cleber.


--=20
Alex Benn=C3=A9e

