Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9889E3A19DF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:35:23 +0200 (CEST)
Received: from localhost ([::1]:39574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Ek-0006IT-MA
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lr06Z-0004Eq-3u
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:26:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lr06W-0004IM-IW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:26:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id a20so26028488wrc.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Us8HJRnFCqCL9bOsyEyJdvkRVTnTyNkt7yxbcd123S0=;
 b=WCjv+Ib6FG1/l3l4KAf3WYEEg/mvRanOq8h2k2/sMDXzm2tkDQkztJDwMvEUWokzM0
 A+37LF7sXvHi/aoVHlKPUT+O/sFfHMXigzvhj7wlkbno5FTi7V0AmQRYSGMjf5O3Dj3P
 Z0v+1otv2Xxshk+LMKJ98A/06nc3WRmh5YKkwzw0OFVNwjo2ol+mnFxpB+Jgz8QpZoQZ
 /aRFdzqRYQ8f3sA7GftFdqN9wKnIE1DPBntqLPcv8Jh4NKTdK50wC8h7rbcSKmxYUBEh
 ShN/IDyAMI0lI5Vm9xDTUiL7F2q26CDtpv1KkjS56dj1WvP2uL28bQSITdSZpYHRXfQm
 ZjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Us8HJRnFCqCL9bOsyEyJdvkRVTnTyNkt7yxbcd123S0=;
 b=O+02FMxPoPYjLPAy4lP6V4DUPBxDshkE++losloS5/SNC9O+s1E+oBBjEPLrVQHPki
 U/b2jYzO5dXyYMHhQxXmwmZJQMKkeaz5U7akdAxctRn8gsz0MGMMokXARMxaa9wIJ3m9
 ftIY2kzq8x/UnK6zRU2ZaYJdF/njvGXeIllnFJMduPHLUfrCEeCXShnc/ypzgNqcXe4b
 UK0+Rn8H9jF5KEfrVMgdj2kUqdr8tk4EJ2awtqEbMU86um5x0jvO2PSkSPd8HSwf7Dcc
 9Pi7OOt/Gf8O67HnDvdhjaXtRzoIuqF+yFtXQNqXR4HByEdVlq6aB7FxWwPH08lHob8X
 n3+w==
X-Gm-Message-State: AOAM530c9QX9odp1QRqNHusFTTSmAJVqF70SPD3zl5fEVK5shScfA9Qn
 2M21q37s5sojLd+HlxeLHmYR5A==
X-Google-Smtp-Source: ABdhPJwlpg5WZUNcy7m2rNBoeOR8O68HbBizD65qN423rOV7r2L6lDVAtI3eoiBUiK3T0etHaBBqLA==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr435126wrq.82.1623252410404;
 Wed, 09 Jun 2021 08:26:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k25sm8069397wmi.36.2021.06.09.08.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:26:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB2171FF7E;
 Wed,  9 Jun 2021 16:26:48 +0100 (BST)
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com> <87wnr3i2hy.fsf@linaro.org>
 <CA+bd_6JO2URtPSAe4faWx_0ybWAXVki45ho7vh1oHo2jyi59zw@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa Junior <crosa@redhat.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
Date: Wed, 09 Jun 2021 16:26:30 +0100
In-reply-to: <CA+bd_6JO2URtPSAe4faWx_0ybWAXVki45ho7vh1oHo2jyi59zw@mail.gmail.com>
Message-ID: <87tum7hxdz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa Junior <crosa@redhat.com> writes:

> On Wed, Jun 9, 2021 at 9:36 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>  Cleber Rosa <crosa@redhat.com> writes:
>
>  > To run basic jobs on custom runners, the environment needs to be
>  > properly set up.  The most common requirement is having the right
>  > packages installed.
>  >
>  > The playbook introduced here covers the QEMU's project s390x and
>  > aarch64 machines.  At the time this is being proposed, those machines
>  > have already had this playbook applied to them.
>  >
>  > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>  > ---
>  >  docs/devel/ci.rst                      | 30 ++++++++
>  >  scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
>  >  scripts/ci/setup/inventory.template    |  1 +
>  >  3 files changed, 129 insertions(+)
>  >  create mode 100644 scripts/ci/setup/build-environment.yml
>  >  create mode 100644 scripts/ci/setup/inventory.template
>  >
>  > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>  > index 585b7bf4b8..35c6b5e269 100644
>  > --- a/docs/devel/ci.rst
>  > +++ b/docs/devel/ci.rst
>  > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>  >  The GitLab CI jobs definition for the custom runners are located unde=
r::
>  >=20=20
>  >    .gitlab-ci.d/custom-runners.yml
>  > +
>  > +Machine Setup Howto
>  > +-------------------
>  > +
>  > +For all Linux based systems, the setup can be mostly automated by the
>  > +execution of two Ansible playbooks.  Create an ``inventory`` file
>  > +under ``scripts/ci/setup``, such as this::
>  > +
>  > +  fully.qualified.domain
>  > +  other.machine.hostname
>  > +
>  > +You may need to set some variables in the inventory file itself.  One
>  > +very common need is to tell Ansible to use a Python 3 interpreter on
>  > +those hosts.  This would look like::
>  > +
>  > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
>  > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
>  > +
>  > +Build environment
>  > +~~~~~~~~~~~~~~~~~
>  > +
>  > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>  > +set up machines with the environment needed to perform builds and run
>  > +QEMU tests.  It covers a number of different Linux distributions and
>  > +FreeBSD.
>  > +
>  > +To run the playbook, execute::
>  > +
>  > +  cd scripts/ci/setup
>  > +  ansible-playbook -i inventory build-environment.yml
>
>  I tried this to re-update aarch64.ci.qemu.org and another ubuntu box I
>  have up and running as a VM and I got a failure when checking facts:
>
>    14:26:26 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=9A=
1=E2=80=A6(+1/-1) + ansible-playbook -i inventory build-environment.yml
>
>    PLAY [Installation of basic packages to build QEMU]
>  ************************************************************************=
*************************************************
>
>    TASK [Gathering Facts]
>  ************************************************************************=
***************************************************************************=
***
>=20=20
>    ok: [aarch64.ci.qemu.org]
>    ok: [hackbox-ubuntu-2004]
>
>    TASK [Update apt cache]
>  ************************************************************************=
***************************************************************************=
**
>=20=20
>    fatal: [aarch64.ci.qemu.org]: FAILED! =3D> {"msg": "The conditional ch=
eck 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error
>  was: error while evaluating conditional (ansible_facts['distribution'] =
=3D=3D 'Ubuntu'): 'dict object' has no attribute 'distribution'\n\nThe
>  error appears to have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup=
/build-environment.yml': line 5, column 7, but may\nbe
>  elsewhere in the file depending on the exact syntax problem.\n\nThe offe=
nding line appears to be:\n\n  tasks:\n    - name: Update apt
>  cache\n      ^ here\n"}
>    fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional ch=
eck 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error
>  was: error while evaluating conditional (ansible_facts['distribution'] =
=3D=3D 'Ubuntu'): 'dict object' has no attribute 'distribution'\n\nThe
>  error appears to have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup=
/build-environment.yml': line 5, column 7, but may\nbe
>  elsewhere in the file depending on the exact syntax problem.\n\nThe offe=
nding line appears to be:\n\n  tasks:\n    - name: Update apt
>  cache\n      ^ here\n"}
>            to retry, use: --limit @/home/alex/lsrc/qemu.git/scripts/ci/se=
tup/build-environment.retry
>
>    PLAY RECAP
>  ************************************************************************=
***************************************************************************=
***************
>=20=20
>    aarch64.ci.qemu.org        : ok=3D1    changed=3D0    unreachable=3D0 =
   failed=3D1
>    hackbox-ubuntu-2004        : ok=3D1    changed=3D0    unreachable=3D0 =
   failed=3D1
>
> Hi Alex,
>
> Thanks for checking this version out.  It looks like this is similar to w=
hat happened to you during v5 and hackmox-ubuntu-2004.  Because I
> had no issues running the playbook against aarch64.ci.qemu.org, I am now =
betting that this is an issue with the ansible installation on the
> "controller" machine, that is, the one that drives the playbook execution=
 (the "zen" host, according to your output).
>
> About the error, the syntax itself is correct[1], but I bet there may be =
differences between ansible versions.  Could you please share the
> output of "ansible --version" on that machine?

15:41:21 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=9A1=E2=
=80=A6(+1/-1) 4 + ansible --version
ansible 2.7.7
  config file =3D /etc/ansible/ansible.cfg
  configured module search path =3D ['/home/alex/.ansible/plugins/modules',=
 '/usr/share/ansible/plugins/modules']
  ansible python module location =3D /usr/lib/python3/dist-packages/ansible
  executable location =3D /usr/bin/ansible
  python version =3D 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0]

My machine is Debian stable (aka Buster)

>
> Thanks again,
> - Cleber.
>
> [1] - https://docs.ansible.com/ansible/latest/user_guide/playbooks_condit=
ionals.html#ansible-facts-distribution
>=20=20
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

