Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE66535080
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:23:13 +0200 (CEST)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuEOO-00067I-Ic
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEGd-0000P3-Hp
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:15:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEGY-0000UW-Uw
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653574505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xp2UpmwVux/+/4VXJHs/qf1i8d4GnriKqGGVTHZVtzo=;
 b=iqNCXOAuOBImJzoiggaD+b2dcGK4i+03/8iU80omGTxb1SJLoiGTpIwous/JddYYDfzovb
 Cb8D/DsvWGnAt7TE2lhlH7jVAgAHXkTlKcvou1Z/N9fT04UVV8aFHHeu9iSOTGL5EtynlZ
 0CNAvE1V3m9QdileG0/9+m4c4b7Jwag=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-rtQ6N20ANFiFAg-ORtmxuw-1; Thu, 26 May 2022 10:15:03 -0400
X-MC-Unique: rtQ6N20ANFiFAg-ORtmxuw-1
Received: by mail-vk1-f198.google.com with SMTP id
 m65-20020a1f5844000000b0035adfd2bc2dso52471vkb.8
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 07:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xp2UpmwVux/+/4VXJHs/qf1i8d4GnriKqGGVTHZVtzo=;
 b=Z025Sncwxtrsd4RjGWf4HcvMk3HtgxgI4Rz7X4r1OGjaRCyZRmwxaNrDX+Iq1yIM8v
 dBUomhxCLCOG3TjuuTNw0v9R6J5kmDExxqxvcR6jla0aNf/WbXM7uLZVb3Ts0JDtINBX
 Eo/v6CSAdUWa1VLihSp6Eg/IZLHu3GMu7RbDGTXl0cr0cJl265rQqD3ogkj+fE/q94bi
 NgIgS+wUz2suzhOTyQwnVyuOrcZLwxNRQ4vVgsmrIUUE+cLhi6yJAy7SUKs1bpfeWq5Z
 NW9S6Yb1HXIMWzFZU4EiWndG2uU99WAjRStuhw6p5pauLXwgMkfI+HyOtFyEcQWPSUH0
 IV0g==
X-Gm-Message-State: AOAM5337LFcrlxH5//AatE7Nx7VLyqJjWLCjs5hTl4t1qoKaK52umysB
 nmT0LCwDJFX6E+SkRf2dm7RZwTzNuma/Z0Xnp/b3ZltoKsoPTtvnuLfTAHFMWZZ+F/1cCUT9TAh
 7xMaPVSHbMIJ88JKEX4p01rBeQmKmEtc=
X-Received: by 2002:ab0:2905:0:b0:369:1fcf:2ee9 with SMTP id
 v5-20020ab02905000000b003691fcf2ee9mr3054904uap.119.1653574503315; 
 Thu, 26 May 2022 07:15:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKDEmyroID8DjhTyM01eI5C83TqvPSHP9bwPt95CYRK0xa1YYnz5l5RP69sV1eF0vLZYu/WL9kGjrQtDEF7OM=
X-Received: by 2002:ab0:2905:0:b0:369:1fcf:2ee9 with SMTP id
 v5-20020ab02905000000b003691fcf2ee9mr3054881uap.119.1653574503077; Thu, 26
 May 2022 07:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-10-jsnow@redhat.com>
 <319df99e-42d8-64dd-fbe8-a6f9311f3630@redhat.com>
In-Reply-To: <319df99e-42d8-64dd-fbe8-a6f9311f3630@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 10:14:52 -0400
Message-ID: <CAFn=p-ZMwzcVSTDELNCPm6pCOS0PmRpZvUzGcyAumsXWFsCGAg@mail.gmail.com>
Subject: Re: [PATCH 9/9] tests: run 'device-crash-test' from tests/venv
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ddb10205dfead0af"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ddb10205dfead0af
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022, 8:14 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/26/22 02:09, John Snow wrote:
> > Remove the sys.path hacking from device-crash-test, and add in a little
> > user-friendly message for anyone who was used to running this script
> > directly from the source tree.
> >
> > Modify the GitLab job recipes to create the tests/venv first, then run
> > device-crash-test from that venv.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   .gitlab-ci.d/buildtest.yml |  8 +++++---
> >   scripts/device-crash-test  | 14 +++++++++++---
> >   2 files changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> > index e9620c30748..fde29c35aa3 100644
> > --- a/.gitlab-ci.d/buildtest.yml
> > +++ b/.gitlab-ci.d/buildtest.yml
> > @@ -110,7 +110,8 @@ crash-test-debian:
> >       IMAGE: debian-amd64
> >     script:
> >       - cd build
> > -    - scripts/device-crash-test -q ./qemu-system-i386
> > +    - make check-venv
> > +    - tests/venv/bin/python3 scripts/device-crash-test -q
> ./qemu-system-i386
> >
> >   build-system-fedora:
> >     extends: .native_build_job_template
> > @@ -155,8 +156,9 @@ crash-test-fedora:
> >       IMAGE: fedora
> >     script:
> >       - cd build
> > -    - scripts/device-crash-test -q ./qemu-system-ppc
> > -    - scripts/device-crash-test -q ./qemu-system-riscv32
> > +    - make check-venv
> > +    - tests/venv/bin/python3 scripts/device-crash-test -q
> ./qemu-system-ppc
> > +    - tests/venv/bin/python3 scripts/device-crash-test -q
> ./qemu-system-riscv32
> >
> >   build-system-centos:
> >     extends: .native_build_job_template
> > diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> > index a203b3fdea2..73bcb986937 100755
> > --- a/scripts/device-crash-test
> > +++ b/scripts/device-crash-test
> > @@ -33,10 +33,18 @@ import re
> >   import random
> >   import argparse
> >   from itertools import chain
> > +from pathlib import Path
> >
> > -sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
> > -from qemu.machine import QEMUMachine
> > -from qemu.qmp import ConnectError
> > +try:
> > +    from qemu.machine import QEMUMachine
> > +    from qemu.qmp import ConnectError
> > +except ModuleNotFoundError as exc:
> > +    path = Path(__file__).resolve()
> > +    print(f"Module '{exc.name}' not found.")
> > +    print("  Try 'make check-venv' from your build directory,")
> > +    print("  and then one way to run this script is like so:")
> > +    print(f'  > $builddir/tests/venv/bin/python3 "{path}"')
> > +    sys.exit(1)
> >
> >   logger = logging.getLogger('device-crash-test')
> >   dbg = logger.debug
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Even though I'd still prefer the venv to be setup early (so the
> check-venv change in buildtest.yml and the friendly message in the
> script will go away), this is a step in the right direction.
>
> Paolo
>

Agree, figured I'd do baby steps before I wound up with a 40 patch series,
and this gives Thomas et al a chance to find out if this ruins their
workflow.

(I'll probably keep the friendly message a little while more anyway,
though; to catch anyone who runs this script manually for a release or so.
I should add a section to our QEMU developer's guide and just link to it in
the message and explain the many, many ways you might enter a venv or
install the package.)

--000000000000ddb10205dfead0af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 26, 2022, 8:14 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/26/22 02:09, John Snow wrote:<br>
&gt; Remove the sys.path hacking from device-crash-test, and add in a littl=
e<br>
&gt; user-friendly message for anyone who was used to running this script<b=
r>
&gt; directly from the source tree.<br>
&gt; <br>
&gt; Modify the GitLab job recipes to create the tests/venv first, then run=
<br>
&gt; device-crash-test from that venv.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.gitlab-ci.d/buildtest.yml |=C2=A0 8 +++++---<br>
&gt;=C2=A0 =C2=A0scripts/device-crash-test=C2=A0 | 14 +++++++++++---<br>
&gt;=C2=A0 =C2=A02 files changed, 16 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml<b=
r>
&gt; index e9620c30748..fde29c35aa3 100644<br>
&gt; --- a/.gitlab-ci.d/buildtest.yml<br>
&gt; +++ b/.gitlab-ci.d/buildtest.yml<br>
&gt; @@ -110,7 +110,8 @@ crash-test-debian:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE: debian-amd64<br>
&gt;=C2=A0 =C2=A0 =C2=A0script:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- cd build<br>
&gt; -=C2=A0 =C2=A0 - scripts/device-crash-test -q ./qemu-system-i386<br>
&gt; +=C2=A0 =C2=A0 - make check-venv<br>
&gt; +=C2=A0 =C2=A0 - tests/venv/bin/python3 scripts/device-crash-test -q .=
/qemu-system-i386<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0build-system-fedora:<br>
&gt;=C2=A0 =C2=A0 =C2=A0extends: .native_build_job_template<br>
&gt; @@ -155,8 +156,9 @@ crash-test-fedora:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE: fedora<br>
&gt;=C2=A0 =C2=A0 =C2=A0script:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- cd build<br>
&gt; -=C2=A0 =C2=A0 - scripts/device-crash-test -q ./qemu-system-ppc<br>
&gt; -=C2=A0 =C2=A0 - scripts/device-crash-test -q ./qemu-system-riscv32<br=
>
&gt; +=C2=A0 =C2=A0 - make check-venv<br>
&gt; +=C2=A0 =C2=A0 - tests/venv/bin/python3 scripts/device-crash-test -q .=
/qemu-system-ppc<br>
&gt; +=C2=A0 =C2=A0 - tests/venv/bin/python3 scripts/device-crash-test -q .=
/qemu-system-riscv32<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0build-system-centos:<br>
&gt;=C2=A0 =C2=A0 =C2=A0extends: .native_build_job_template<br>
&gt; diff --git a/scripts/device-crash-test b/scripts/device-crash-test<br>
&gt; index a203b3fdea2..73bcb986937 100755<br>
&gt; --- a/scripts/device-crash-test<br>
&gt; +++ b/scripts/device-crash-test<br>
&gt; @@ -33,10 +33,18 @@ import re<br>
&gt;=C2=A0 =C2=A0import random<br>
&gt;=C2=A0 =C2=A0import argparse<br>
&gt;=C2=A0 =C2=A0from itertools import chain<br>
&gt; +from pathlib import Path<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -sys.path.append(os.path.join(os.path.dirname(__file__), &#39;..&#39;,=
 &#39;python&#39;))<br>
&gt; -from qemu.machine import QEMUMachine<br>
&gt; -from qemu.qmp import ConnectError<br>
&gt; +try:<br>
&gt; +=C2=A0 =C2=A0 from qemu.machine import QEMUMachine<br>
&gt; +=C2=A0 =C2=A0 from qemu.qmp import ConnectError<br>
&gt; +except ModuleNotFoundError as exc:<br>
&gt; +=C2=A0 =C2=A0 path =3D Path(__file__).resolve()<br>
&gt; +=C2=A0 =C2=A0 print(f&quot;Module &#39;{<a href=3D"http://exc.name" r=
el=3D"noreferrer noreferrer" target=3D"_blank">exc.name</a>}&#39; not found=
.&quot;)<br>
&gt; +=C2=A0 =C2=A0 print(&quot;=C2=A0 Try &#39;make check-venv&#39; from y=
our build directory,&quot;)<br>
&gt; +=C2=A0 =C2=A0 print(&quot;=C2=A0 and then one way to run this script =
is like so:&quot;)<br>
&gt; +=C2=A0 =C2=A0 print(f&#39;=C2=A0 &gt; $builddir/tests/venv/bin/python=
3 &quot;{path}&quot;&#39;)<br>
&gt; +=C2=A0 =C2=A0 sys.exit(1)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0logger =3D logging.getLogger(&#39;device-crash-test&#39;)<=
br>
&gt;=C2=A0 =C2=A0dbg =3D logger.debug<br>
<br>
Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
<br>
Even though I&#39;d still prefer the venv to be setup early (so the <br>
check-venv change in buildtest.yml and the friendly message in the <br>
script will go away), this is a step in the right direction.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Agree, figured I&#39;d do baby steps before I wound up with a 40 patch=
 series, and this gives Thomas et al a chance to find out if this ruins the=
ir workflow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I&#39;ll p=
robably keep the friendly message a little while more anyway, though; to ca=
tch anyone who runs this script manually for a release or so. I should add =
a section to our QEMU developer&#39;s guide and just link to it in the mess=
age and explain the many, many ways you might enter a venv or install the p=
ackage.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ddb10205dfead0af--


