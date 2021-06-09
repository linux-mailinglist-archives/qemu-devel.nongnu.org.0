Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A993A1704
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:22:30 +0200 (CEST)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqz6D-000837-0F
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqz5H-0007NH-JA
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqz5D-0005al-1a
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623248484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dHHilFabl/mSsHDDbV0zipUSLmu57PsqQi+zMvDAl+8=;
 b=fDV1vNdxHwnmekfSiPRd53pJ5E5/2vIZci8ry5sarl9Qz4nE+yUnnQFRtptZfrW4SoiFtB
 Sh1+/h7XPiGrZsEOJRXUXz0ss/9HXiGW4XJGXEr+1G3OG63fjF/CgBEbWeHlZ0sDH5azus
 VTC5CqkrosAmwrRB9GRmMmEdHBH2c7U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-SRb_1_knOgKeVClNkm0ysw-1; Wed, 09 Jun 2021 10:21:21 -0400
X-MC-Unique: SRb_1_knOgKeVClNkm0ysw-1
Received: by mail-ej1-f72.google.com with SMTP id
 p18-20020a1709067852b02903dab2a3e1easo8120837ejm.17
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHHilFabl/mSsHDDbV0zipUSLmu57PsqQi+zMvDAl+8=;
 b=uMjCtDI56a51PSOwcvYZh4q57Q2lk5MhMpNWUzPj6gokOBVPkhKPy1bqa7eZPxgfKu
 5k3fDrf+tpbq3T8V9MXQqbc4jLFRb4XFSCfEY71penCtpbhMd2eIyJrcimQLw6S2Bj41
 Um1abgdpYsxkHARI2GtDkLSIlFQfI+PsBB5wCJ/2RU+mfGLtSbqfP9ORqIKqOFw5hxIr
 9EkmX5C71lT/rHlkUC9mkQ3LDfMaNNmcixCFuXJVo5vgr/IpEBnap8/J8aEIrMmsDKCF
 23GuFntCUmRnn9TUUYD0Mp6qjUDZuiQnyerWTXFRPCgQDdmdRLlzk6lJ5Ae/JR7ctcNS
 jQpQ==
X-Gm-Message-State: AOAM533bpnb/+evIJDLlZdMsc92VB0OSTacMlieLDrjcVaxadFkUep2F
 eqsw6PD5MfMIS+8DZAznPtvzpYr5K1ZN55OIQpLQ0EmMdvP6ZGdNVdKUEvr808YCZofV9eIY+fi
 Qzk+AmeaSQ83yEDarHh2UD4TMpy75EtE=
X-Received: by 2002:a17:906:b212:: with SMTP id
 p18mr118276ejz.109.1623248480382; 
 Wed, 09 Jun 2021 07:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqQFDhn0wddMbeAqoPPEKGgJAAQ1EnDVU5C+MIOLbbxqIdGwcK2DJF70QwJT6NrOA86Lse+93WqqsMjUCpBYQ=
X-Received: by 2002:a17:906:b212:: with SMTP id
 p18mr118232ejz.109.1623248480184; 
 Wed, 09 Jun 2021 07:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com>
 <87wnr3i2hy.fsf@linaro.org>
In-Reply-To: <87wnr3i2hy.fsf@linaro.org>
From: Cleber Rosa Junior <crosa@redhat.com>
Date: Wed, 9 Jun 2021 10:21:09 -0400
Message-ID: <CA+bd_6JO2URtPSAe4faWx_0ybWAXVki45ho7vh1oHo2jyi59zw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000b5b7105c455fd05"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b5b7105c455fd05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 9, 2021 at 9:36 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Cleber Rosa <crosa@redhat.com> writes:
>
> > To run basic jobs on custom runners, the environment needs to be
> > properly set up.  The most common requirement is having the right
> > packages installed.
> >
> > The playbook introduced here covers the QEMU's project s390x and
> > aarch64 machines.  At the time this is being proposed, those machines
> > have already had this playbook applied to them.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  docs/devel/ci.rst                      | 30 ++++++++
> >  scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
> >  scripts/ci/setup/inventory.template    |  1 +
> >  3 files changed, 129 insertions(+)
> >  create mode 100644 scripts/ci/setup/build-environment.yml
> >  create mode 100644 scripts/ci/setup/inventory.template
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 585b7bf4b8..35c6b5e269 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >  The GitLab CI jobs definition for the custom runners are located under=
::
> >
> >    .gitlab-ci.d/custom-runners.yml
> > +
> > +Machine Setup Howto
> > +-------------------
> > +
> > +For all Linux based systems, the setup can be mostly automated by the
> > +execution of two Ansible playbooks.  Create an ``inventory`` file
> > +under ``scripts/ci/setup``, such as this::
> > +
> > +  fully.qualified.domain
> > +  other.machine.hostname
> > +
> > +You may need to set some variables in the inventory file itself.  One
> > +very common need is to tell Ansible to use a Python 3 interpreter on
> > +those hosts.  This would look like::
> > +
> > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
> > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
> > +
> > +Build environment
> > +~~~~~~~~~~~~~~~~~
> > +
> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> > +set up machines with the environment needed to perform builds and run
> > +QEMU tests.  It covers a number of different Linux distributions and
> > +FreeBSD.
> > +
> > +To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory build-environment.yml
>
> I tried this to re-update aarch64.ci.qemu.org and another ubuntu box I
> have up and running as a VM and I got a failure when checking facts:
>
>   14:26:26 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=9A1=
=E2=80=A6(+1/-1)
> + ansible-playbook -i inventory build-environment.yml
>
>   PLAY [Installation of basic packages to build QEMU]
> *************************************************************************=
************************************************
>
>   TASK [Gathering Facts]
> *************************************************************************=
***************************************************************************=
**
>   ok: [aarch64.ci.qemu.org]
>   ok: [hackbox-ubuntu-2004]
>
>   TASK [Update apt cache]
> *************************************************************************=
***************************************************************************=
*
>   fatal: [aarch64.ci.qemu.org]: FAILED! =3D> {"msg": "The conditional che=
ck
> 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: er=
ror
> while evaluating conditional (ansible_facts['distribution'] =3D=3D 'Ubunt=
u'):
> 'dict object' has no attribute 'distribution'\n\nThe error appears to hav=
e
> been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.yml'=
:
> line 5, column 7, but may\nbe elsewhere in the file depending on the exac=
t
> syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    -
> name: Update apt cache\n      ^ here\n"}
>   fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional che=
ck
> 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: er=
ror
> while evaluating conditional (ansible_facts['distribution'] =3D=3D 'Ubunt=
u'):
> 'dict object' has no attribute 'distribution'\n\nThe error appears to hav=
e
> been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.yml'=
:
> line 5, column 7, but may\nbe elsewhere in the file depending on the exac=
t
> syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    -
> name: Update apt cache\n      ^ here\n"}
>           to retry, use: --limit
> @/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.retry
>
>   PLAY RECAP
> *************************************************************************=
***************************************************************************=
**************
>   aarch64.ci.qemu.org        : ok=3D1    changed=3D0    unreachable=3D0
> failed=3D1
>   hackbox-ubuntu-2004        : ok=3D1    changed=3D0    unreachable=3D0
> failed=3D1
>
>
>
Hi Alex,

Thanks for checking this version out.  It looks like this is similar to
what happened to you during v5 and hackmox-ubuntu-2004.  Because I had no
issues running the playbook against aarch64.ci.qemu.org, I am now betting
that this is an issue with the ansible installation on the "controller"
machine, that is, the one that drives the playbook execution (the "zen"
host, according to your output).

About the error, the syntax itself is correct[1], but I bet there may be
differences between ansible versions.  Could you please share the output of
"ansible --version" on that machine?

Thanks again,
- Cleber.

[1] -
https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.h=
tml#ansible-facts-distribution


> --
> Alex Benn=C3=A9e
>
>

--0000000000000b5b7105c455fd05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 9, 2021 at 9:36 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=3D"_blank">crosa=
@redhat.com</a>&gt; writes:<br>
<br>
&gt; To run basic jobs on custom runners, the environment needs to be<br>
&gt; properly set up.=C2=A0 The most common requirement is having the right=
<br>
&gt; packages installed.<br>
&gt;<br>
&gt; The playbook introduced here covers the QEMU&#39;s project s390x and<b=
r>
&gt; aarch64 machines.=C2=A0 At the time this is being proposed, those mach=
ines<br>
&gt; have already had this playbook applied to them.<br>
&gt;<br>
&gt; Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" tar=
get=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/devel/ci.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 ++++++++<br>
&gt;=C2=A0 scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 scripts/ci/setup/inventory.template=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 3 files changed, 129 insertions(+)<br>
&gt;=C2=A0 create mode 100644 scripts/ci/setup/build-environment.yml<br>
&gt;=C2=A0 create mode 100644 scripts/ci/setup/inventory.template<br>
&gt;<br>
&gt; diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst<br>
&gt; index 585b7bf4b8..35c6b5e269 100644<br>
&gt; --- a/docs/devel/ci.rst<br>
&gt; +++ b/docs/devel/ci.rst<br>
&gt; @@ -26,3 +26,33 @@ gitlab-runner, is called a &quot;custom runner&quot=
;.<br>
&gt;=C2=A0 The GitLab CI jobs definition for the custom runners are located=
 under::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 .gitlab-ci.d/custom-runners.yml<br>
&gt; +<br>
&gt; +Machine Setup Howto<br>
&gt; +-------------------<br>
&gt; +<br>
&gt; +For all Linux based systems, the setup can be mostly automated by the=
<br>
&gt; +execution of two Ansible playbooks.=C2=A0 Create an ``inventory`` fil=
e<br>
&gt; +under ``scripts/ci/setup``, such as this::<br>
&gt; +<br>
&gt; +=C2=A0 fully.qualified.domain<br>
&gt; +=C2=A0 other.machine.hostname<br>
&gt; +<br>
&gt; +You may need to set some variables in the inventory file itself.=C2=
=A0 One<br>
&gt; +very common need is to tell Ansible to use a Python 3 interpreter on<=
br>
&gt; +those hosts.=C2=A0 This would look like::<br>
&gt; +<br>
&gt; +=C2=A0 fully.qualified.domain ansible_python_interpreter=3D/usr/bin/p=
ython3<br>
&gt; +=C2=A0 other.machine.hostname ansible_python_interpreter=3D/usr/bin/p=
ython3<br>
&gt; +<br>
&gt; +Build environment<br>
&gt; +~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will<=
br>
&gt; +set up machines with the environment needed to perform builds and run=
<br>
&gt; +QEMU tests.=C2=A0 It covers a number of different Linux distributions=
 and<br>
&gt; +FreeBSD.<br>
&gt; +<br>
&gt; +To run the playbook, execute::<br>
&gt; +<br>
&gt; +=C2=A0 cd scripts/ci/setup<br>
&gt; +=C2=A0 ansible-playbook -i inventory build-environment.yml<br>
<br>
I tried this to re-update <a href=3D"http://aarch64.ci.qemu.org" rel=3D"nor=
eferrer" target=3D"_blank">aarch64.ci.qemu.org</a> and another ubuntu box I=
<br>
have up and running as a VM and I got a failure when checking facts:<br>
<br>
=C2=A0 14:26:26 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|=E2=9C=
=9A1=E2=80=A6(+1/-1) + ansible-playbook -i inventory build-environment.yml<=
br>
<br>
=C2=A0 PLAY [Installation of basic packages to build QEMU] ****************=
***************************************************************************=
******************************<br>
<br>
=C2=A0 TASK [Gathering Facts] *********************************************=
***************************************************************************=
******************************<br>
=C2=A0 ok: [<a href=3D"http://aarch64.ci.qemu.org" rel=3D"noreferrer" targe=
t=3D"_blank">aarch64.ci.qemu.org</a>]<br>
=C2=A0 ok: [hackbox-ubuntu-2004]<br>
<br>
=C2=A0 TASK [Update apt cache] ********************************************=
***************************************************************************=
******************************<br>
=C2=A0 fatal: [<a href=3D"http://aarch64.ci.qemu.org" rel=3D"noreferrer" ta=
rget=3D"_blank">aarch64.ci.qemu.org</a>]: FAILED! =3D&gt; {&quot;msg&quot;:=
 &quot;The conditional check &#39;ansible_facts[&#39;distribution&#39;] =3D=
=3D &#39;Ubuntu&#39;&#39; failed. The error was: error while evaluating con=
ditional (ansible_facts[&#39;distribution&#39;] =3D=3D &#39;Ubuntu&#39;): &=
#39;dict object&#39; has no attribute &#39;distribution&#39;\n\nThe error a=
ppears to have been in &#39;/home/alex/lsrc/qemu.git/scripts/ci/setup/build=
-environment.yml&#39;: line 5, column 7, but may\nbe elsewhere in the file =
depending on the exact syntax problem.\n\nThe offending line appears to be:=
\n\n=C2=A0 tasks:\n=C2=A0 =C2=A0 - name: Update apt cache\n=C2=A0 =C2=A0 =
=C2=A0 ^ here\n&quot;}<br>
=C2=A0 fatal: [hackbox-ubuntu-2004]: FAILED! =3D&gt; {&quot;msg&quot;: &quo=
t;The conditional check &#39;ansible_facts[&#39;distribution&#39;] =3D=3D &=
#39;Ubuntu&#39;&#39; failed. The error was: error while evaluating conditio=
nal (ansible_facts[&#39;distribution&#39;] =3D=3D &#39;Ubuntu&#39;): &#39;d=
ict object&#39; has no attribute &#39;distribution&#39;\n\nThe error appear=
s to have been in &#39;/home/alex/lsrc/qemu.git/scripts/ci/setup/build-envi=
ronment.yml&#39;: line 5, column 7, but may\nbe elsewhere in the file depen=
ding on the exact syntax problem.\n\nThe offending line appears to be:\n\n=
=C2=A0 tasks:\n=C2=A0 =C2=A0 - name: Update apt cache\n=C2=A0 =C2=A0 =C2=A0=
 ^ here\n&quot;}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to retry, use: --limit @/home/alex/lsrc/=
qemu.git/scripts/ci/setup/build-environment.retry<br>
<br>
=C2=A0 PLAY RECAP *********************************************************=
***************************************************************************=
******************************<br>
=C2=A0 <a href=3D"http://aarch64.ci.qemu.org" rel=3D"noreferrer" target=3D"=
_blank">aarch64.ci.qemu.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 : ok=3D1=C2=A0 =
=C2=A0 changed=3D0=C2=A0 =C2=A0 unreachable=3D0=C2=A0 =C2=A0 failed=3D1<br>
=C2=A0 hackbox-ubuntu-2004=C2=A0 =C2=A0 =C2=A0 =C2=A0 : ok=3D1=C2=A0 =C2=A0=
 changed=3D0=C2=A0 =C2=A0 unreachable=3D0=C2=A0 =C2=A0 failed=3D1<br>
<br>
<br></blockquote><div><br></div><div>Hi Alex,</div><div><br></div><div>Than=
ks for checking this version out.=C2=A0 It looks like this is similar to wh=
at happened to you during v5 and hackmox-ubuntu-2004.=C2=A0 Because I had n=
o issues running the playbook against <a href=3D"http://aarch64.ci.qemu.org=
">aarch64.ci.qemu.org</a>, I am now betting that this is an issue with the =
ansible installation on the &quot;controller&quot; machine, that is, the on=
e that drives the playbook execution (the &quot;zen&quot; host, according t=
o your output).</div><div><br></div><div>About the error, the syntax itself=
 is correct[1], but I bet there may be differences between ansible versions=
.=C2=A0 Could you please share the output of &quot;ansible --version&quot; =
on that machine?</div><div><br></div><div>Thanks again,</div><div>- Cleber.=
</div><div><br></div><div>[1] - <a href=3D"https://docs.ansible.com/ansible=
/latest/user_guide/playbooks_conditionals.html#ansible-facts-distribution">=
https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.h=
tml#ansible-facts-distribution</a></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div>

--0000000000000b5b7105c455fd05--


