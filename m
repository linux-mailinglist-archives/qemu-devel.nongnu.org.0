Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE83B79DC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:28:27 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLHO-0007To-2e
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLGO-0006pe-4m
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLGK-0003qt-Cm
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625002038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8fUVKBEbySoHzCFBC8l7jobBJ977iZ9+R18n3GgJ2pY=;
 b=PJqynXiqwfqVe/R4xQ2UDjny/bTrWID4pboifwqaIqdtykR/rrU6OduQOSAelZRL7QdnDC
 ZRlfC4J5LuL8LlDUae8ZoHCaKpW4IS3R09JI2b39VmqHS/Qmt2uh+4VebKDkluMU3DYQD4
 H8ccEC56vw481GVFE61NUPa0IME01q8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-zdFGflwUORC5wLBUnQ5YsA-1; Tue, 29 Jun 2021 17:27:16 -0400
X-MC-Unique: zdFGflwUORC5wLBUnQ5YsA-1
Received: by mail-ot1-f71.google.com with SMTP id
 l13-20020a9d734d0000b02903db3d2b53faso121007otk.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 14:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fUVKBEbySoHzCFBC8l7jobBJ977iZ9+R18n3GgJ2pY=;
 b=Y7fW/p3XLOJFWwBMX/Oj1uJrI5+IuZkRnoTKNGM3QBhKy39BSmFuw4ciu1Ltzmg3QY
 nOjZUvTlQcv2AZF98ACKejxv9bCc3rlaaY/FDaIIsaPTbVGpmXJro5vCAZKEh0EgE00q
 eS+1AIM4ORYVJNeFwOjslmYjrEyEPMqIfSjEwPVuSFdFnkePidwi3FzP/aoVk6RyPCEJ
 Mn+ziWvdYINEexwjRqTOnpvRtzNisAY9+bBUeP1brJd7oZpfqon1IP792SdhbiEkRlIY
 mFLamGQwx/HBH4nncaExpdZ77MOY9IVvJTwiKLBBm+a9wKjYF8qLvzVbVhGJNX1ltXiz
 yYGA==
X-Gm-Message-State: AOAM533/YgbUIKg3PO26yrb1SW7Yd7maJMoFZ/KaPeIvuy8jAlmu4eaz
 LFEaBvJPD+fk0UlQBSHn9xVbQVWVFLYLoVQi4dZdpxArdn0/IZSHRR/77/iKm5Fk6K6Y4A877k5
 R8VLTNFkzEiG8V8V/bO1BQEDqEzfBQL8=
X-Received: by 2002:aca:2212:: with SMTP id b18mr16123861oic.52.1625002035578; 
 Tue, 29 Jun 2021 14:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT+rhKCrm7Y4LXtSM1nn6qwwgWuElN8FO/ePdeR/zxMXdXilcGiapLbuMavA/SxMcIEPNdQMiFxQeQX1poLGU=
X-Received: by 2002:aca:2212:: with SMTP id b18mr16123849oic.52.1625002035372; 
 Tue, 29 Jun 2021 14:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-8-jsnow@redhat.com>
 <e8531bbc-aa56-784e-1fe7-f4c4ce5fdd62@redhat.com>
In-Reply-To: <e8531bbc-aa56-784e-1fe7-f4c4ce5fdd62@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Jun 2021 17:27:04 -0400
Message-ID: <CAFn=p-YNQE-t=KmY8kkVGxsfF6RYy2Ph42kHYOgf3TJ0u-Bcvg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] python: update help text for check-tox
To: Wainer Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000013f97f05c5ee45ee"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013f97f05c5ee45ee
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 4:25 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

> Hi John,
>
> On 6/29/21 1:42 PM, John Snow wrote:
> > Move it up near the check-pipenv help text, and update it to suggest
> parity.
> >
> > (At the time I first added it, I wasn't sure if I would be keeping it,
> > but I've come to appreciate it as it has actually helped uncover bugs I
> > would not have noticed without it. It should stay.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >   python/Makefile | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/Makefile b/python/Makefile
> > index 07ad73ccd0..d2cfa6ad8f 100644
> > --- a/python/Makefile
> > +++ b/python/Makefile
> > @@ -9,13 +9,17 @@ help:
> >       @echo "    Requires: Python 3.6 and pipenv."
> >       @echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
> >       @echo ""
> > +     @echo "make check-tox:"
> > +     @echo "    Run tests against multiple python versions."
> > +     @echo "    These tests use the newest dependencies."
> > +     @echo "    Requires: Python 3.6 - 3.10, and tox."
> > +     @echo "    Hint (Fedora): 'sudo dnf install python3-tox
> python3.10'"
> > +     @echo ""
>
> Somewhat related... in my system I don't have all supported python
> versions installed, thus check-tox fails.
>
> Instead, maybe, you could configure tox (as below) to test to whatever
> supported versions the developer have installed in the system; and on
> absence of some versions it won't fail the tests entirely.
>
> diff --git a/python/setup.cfg b/python/setup.cfg
> index e730f208d3..1db8aaf340 100644
> --- a/python/setup.cfg
> +++ b/python/setup.cfg
> @@ -123,6 +123,7 @@ multi_line_output=3
>
>   [tox:tox]
>   envlist = py36, py37, py38, py39, py310
> +skip_missing_interpreters=true
>

Didn't know this was an option, to be honest ... I wonder if it can be
toggled on/off easily? I like the idea that it will fail if we don't set up
the CI environment correctly instead of succeeding quietly.

Though, you're right, some is better than none. Send a patch if you want?

--js

--00000000000013f97f05c5ee45ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 4:25 PM Waine=
r dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi John,<br>
<br>
On 6/29/21 1:42 PM, John Snow wrote:<br>
&gt; Move it up near the check-pipenv help text, and update it to suggest p=
arity.<br>
&gt;<br>
&gt; (At the time I first added it, I wasn&#39;t sure if I would be keeping=
 it,<br>
&gt; but I&#39;ve come to appreciate it as it has actually helped uncover b=
ugs I<br>
&gt; would not have noticed without it. It should stay.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@redhat.co=
m" target=3D"_blank">willianr@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/Makefile | 8 ++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/python/Makefile b/python/Makefile<br>
&gt; index 07ad73ccd0..d2cfa6ad8f 100644<br>
&gt; --- a/python/Makefile<br>
&gt; +++ b/python/Makefile<br>
&gt; @@ -9,13 +9,17 @@ help:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Requires: Python 3=
.6 and pipenv.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Hint (Fedora): &#3=
9;sudo dnf install python3.6 pipenv&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;make check-tox:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Run tests against multi=
ple python versions.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 These tests use the new=
est dependencies.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Requires: Python 3.6 - =
3.10, and tox.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;=C2=A0 =C2=A0 Hint (Fedora): &#39;sud=
o dnf install python3-tox python3.10&#39;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo &quot;&quot;<br>
<br>
Somewhat related... in my system I don&#39;t have all supported python <br>
versions installed, thus check-tox fails.<br>
<br>
Instead, maybe, you could configure tox (as below) to test to whatever <br>
supported versions the developer have installed in the system; and on <br>
absence of some versions it won&#39;t fail the tests entirely.<br>
<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index e730f208d3..1db8aaf340 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -123,6 +123,7 @@ multi_line_output=3D3<br>
<br>
=C2=A0=C2=A0[tox:tox]<br>
=C2=A0=C2=A0envlist =3D py36, py37, py38, py39, py310<br>
+skip_missing_interpreters=3Dtrue<br></blockquote><div><br></div><div>Didn&=
#39;t know this was an option, to be honest ... I wonder if it can be toggl=
ed on/off easily? I like the idea that it will fail if we don&#39;t set up =
the CI environment correctly instead of succeeding quietly.<br></div><div><=
br></div><div>Though, you&#39;re right, some is better than none. Send a pa=
tch if you want?</div><div><br></div><div>--js<br></div></div></div>

--00000000000013f97f05c5ee45ee--


