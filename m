Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E707C69E540
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:57:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVwU-0000D3-Ox; Tue, 21 Feb 2023 11:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUVwS-0000CI-PD
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:56:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUVwQ-0002Cb-Du
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676998593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LyLyLB1YOLCiZMy9dq6oW8Wn05D/6wYqFp5ua35NJk8=;
 b=TPfO+cG60PXF6uJM7IBZhv6lMSvy0PCXZ9iGcfPUzv9K6Tv1ekQBWvzBF+COtcnYicaRQp
 buXZ7m1Vo71HpKEqm7HP+N8oMC7eHSV+a7Yn8yHH6t2xQFG1TAMdjLgwhqF1cLqo9LYgN8
 1t6DDYr2GUM1mi3F1R27nfIhd2ile04=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259--1_9I-i3MyC_EEZvnnw6rg-1; Tue, 21 Feb 2023 11:56:32 -0500
X-MC-Unique: -1_9I-i3MyC_EEZvnnw6rg-1
Received: by mail-pj1-f71.google.com with SMTP id
 ep2-20020a17090ae64200b0023699c4353eso2400239pjb.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LyLyLB1YOLCiZMy9dq6oW8Wn05D/6wYqFp5ua35NJk8=;
 b=Q7w3Q5gQcdqhKxmHwb/jpt7zzuPYJCSUA5LpieNS0NWWz3MkeCAY2t0MBJn2gXAmah
 CCNmc7jPYKRZA/8mRBGtt8cn+wvUUkT4Wq35DY+W0DcWG09djwizYUu73da0lJbe6INA
 rIBNliWOks/iigGvqftOXs78erozadgn5bDUqiRtnvYueC6gOlgvJDKn8TD7dR7oZy1b
 W9Gy6sB4ALAv8BA3epFhtHlQOKeRCdMSvEOapbBb3mfZQTm7gVMj/ydN73CJ5a8KOF9N
 sBhf7IOEWPLg6Hk+7P83n5I1PzMhrFnQeCuspPco+jC+geYwEzJp/vOWfTTC0qUIccrq
 XeXw==
X-Gm-Message-State: AO0yUKWNzVL0H1I52/c63X5IrsuxmQHcF6cp3Zglk9wDBkDsS6YaRD7q
 rmLrmB0QTak6qXxuHj4qywjrcHgCJSa1cj5zv5bQ57r/I9pY3p0sYCz6b5O92Gd60FG84lh67lg
 4TH3E6aVph6UtMyJrEMrBfUOxKP1mJINFBo3+
X-Received: by 2002:a17:90b:380b:b0:233:a695:f441 with SMTP id
 mq11-20020a17090b380b00b00233a695f441mr1022746pjb.54.1676998590152; 
 Tue, 21 Feb 2023 08:56:30 -0800 (PST)
X-Google-Smtp-Source: AK7set9PB3+fMZttNj0Pyh6URgefdJJP/2QOUXb/8v0VO4OKYVXmhNtwg73ujY2iYwhl+K0/f2HHTIcY88hniQUh1F0=
X-Received: by 2002:a17:90b:380b:b0:233:a695:f441 with SMTP id
 mq11-20020a17090b380b00b00233a695f441mr1022738pjb.54.1676998589483; Tue, 21
 Feb 2023 08:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-6-jsnow@redhat.com>
 <2c63f79d-b46d-841b-bed3-0dca33eab2c0@redhat.com>
In-Reply-To: <2c63f79d-b46d-841b-bed3-0dca33eab2c0@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 21 Feb 2023 11:56:17 -0500
Message-ID: <CAFn=p-Zt-7zHw1R5rJUkOs5QUvk0GkP3fw8vC2nD0+aQ4p8kcw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000373a4705f538a96b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000373a4705f538a96b
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023, 6:31 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 2/21/23 02:24, John Snow wrote:
> > Once upon a time, "sphinx-build" on certain RPM platforms invoked
> > specifically a Python 2.x version, while "sphinx-build-3" was a distro
> > shim for the Python 3.x version.
> >
> > These days, none of our supported platforms utilize a 2.x version, so it
> > should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
> > which will prefer pip/venv installed versions of sphinx if they're
> > available.
> >
> > This adds an extremely convenient ability to test document building
> > ability in QEMU across multiple versions of Sphinx for the purposes of
> > compatibility testing.
>
> Can we just use "$PYTHON -m sphinx.cmd.build" instead, to ensure that we
> don't
> escape the virtual environment?  Or even better, we could have a simple
> script
> like this:
>
> #! /usr/bin/env python3
>
> from pkg_resources import load_entry_point
>
> if __name__ == '__main__':
>      if sys.argv[1] == '--check':
>          try:
>              load_entry_point(sys.argv[2], 'console_scripts', sys.argv[3])
>              sys.exit(0)
>          except ImportError:
>              sys.exit(1)
>      else:
>          entry_point = load_entry_point(sys.argv[1], 'console_scripts',
> sys.argv[2])
>          # The second argument to python-run.py becomes sys.argv[0]
>          del sys.argv[0:1]
>          sys.exit(entry_point())
>
> then docs/meson.build can do this:
>
> python_run = find_program('scripts/python-run.py')
> build_docs = false
> if get_feature('docs') \
>    .require(run_command(python_run, '--check', 'sphinx', 'sphinx-build',
>                         check: false).returncode() == 0,
>             error: 'Could not find sphinx installation') \
>    .allowed()
>    # The sphinx module is installed
>    SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir,
>                   python_run, 'sphinx', 'sphinx-build', '-q']
>    ...
>    build_docs = (sphinx_build_test_out.returncode() == 0)
>    ...
> endif
>
> This again ensures that sphinx-build will not escape the virtual
> environment
> if there is one.  configure can also use the script to run meson, though
> that
> can come later.
>
> Paolo
>

Yeah, I proposed we use "python3 -m sphinx.cmd.build" once, but Peter did
not like the idea of Sphinx becoming a python dependency instead of being
treated as a black box.

Obviously circumstances are shifting somewhat and we may be more open to
treating Sphinx as a python dependency given that we need to enforce
compatibility with custom plugins written in qemu.git.

If I was trying to please absolutely nobody but me, I'd certainly use the
`$python -m sphinx` approach; especially because it means that for
qapi-gen, the code is run under the same environment in both cases (native
qapi-gen exec and sphinx doc building).

I'm for it, but lost appetite for making the argument some time back.

>

--000000000000373a4705f538a96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 21, 2023, 6:31 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 2/21/23 02:24, John Snow wrote:<br>
&gt; Once upon a time, &quot;sphinx-build&quot; on certain RPM platforms in=
voked<br>
&gt; specifically a Python 2.x version, while &quot;sphinx-build-3&quot; wa=
s a distro<br>
&gt; shim for the Python 3.x version.<br>
&gt; <br>
&gt; These days, none of our supported platforms utilize a 2.x version, so =
it<br>
&gt; should be safe to search for &#39;sphinx-build&#39; prior to &#39;sphi=
nx-build-3&#39;,<br>
&gt; which will prefer pip/venv installed versions of sphinx if they&#39;re=
<br>
&gt; available.<br>
&gt; <br>
&gt; This adds an extremely convenient ability to test document building<br=
>
&gt; ability in QEMU across multiple versions of Sphinx for the purposes of=
<br>
&gt; compatibility testing.<br>
<br>
Can we just use &quot;$PYTHON -m sphinx.cmd.build&quot; instead, to ensure =
that we don&#39;t<br>
escape the virtual environment?=C2=A0 Or even better, we could have a simpl=
e script<br>
like this:<br>
<br>
#! /usr/bin/env python3<br>
<br>
from pkg_resources import load_entry_point<br>
<br>
if __name__ =3D=3D &#39;__main__&#39;:<br>
=C2=A0 =C2=A0 =C2=A0if sys.argv[1] =3D=3D &#39;--check&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load_entry_point(sys.argv[2=
], &#39;console_scripts&#39;, sys.argv[3])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except ImportError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry_point =3D load_entry_point(sys.argv=
[1], &#39;console_scripts&#39;, sys.argv[2])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The second argument to python-run.py be=
comes sys.argv[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0del sys.argv[0:1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(entry_point())<br>
<br>
then docs/meson.build can do this:<br>
<br>
python_run =3D find_program(&#39;scripts/python-run.py&#39;)<br>
build_docs =3D false<br>
if get_feature(&#39;docs&#39;) \<br>
=C2=A0 =C2=A0.require(run_command(python_run, &#39;--check&#39;, &#39;sphin=
x&#39;, &#39;sphinx-build&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 check: false).returncode() =3D=3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error: &#39;Could not find sphinx=
 installation&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
=C2=A0 =C2=A0# The sphinx module is installed<br>
=C2=A0 =C2=A0SPHINX_ARGS =3D [&#39;env&#39;, &#39;CONFDIR=3D&#39; + qemu_co=
nfdir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python_run, =
&#39;sphinx&#39;, &#39;sphinx-build&#39;, &#39;-q&#39;]<br>
=C2=A0 =C2=A0...<br>
=C2=A0 =C2=A0build_docs =3D (sphinx_build_test_out.returncode() =3D=3D 0)<b=
r>
=C2=A0 =C2=A0...<br>
endif<br>
<br>
This again ensures that sphinx-build will not escape the virtual environmen=
t<br>
if there is one.=C2=A0 configure can also use the script to run meson, thou=
gh that<br>
can come later.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Yeah, I proposed we use &quot;python3 -m sphinx.cmd.build&quot; once, =
but Peter did not like the idea of Sphinx becoming a python dependency inst=
ead of being treated as a black box.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Obviously circumstances are shifting somewhat and we may be mo=
re open to treating Sphinx as a python dependency given that we need to enf=
orce compatibility with custom plugins written in qemu.git.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">If I was trying to please absolutely =
nobody but me, I&#39;d certainly use the `$python -m sphinx` approach; espe=
cially because it means that for qapi-gen, the code is run under the same e=
nvironment in both cases (native qapi-gen exec and sphinx doc building).</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m for it, but lost a=
ppetite for making the argument some time back.</div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000373a4705f538a96b--


