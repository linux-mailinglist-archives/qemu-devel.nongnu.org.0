Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08253507C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:20:58 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuEMC-0003qh-Sy
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEIs-0001qy-Jb
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEIp-00010b-M3
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653574646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B4tM9i8zLDuzG8W11McPeUulRENt8+ftJg2SYkYds28=;
 b=efFs0MxoO9h1NJbL5ShS+BmNBDWbpF9NoWscDITANFvbLm7yJj7seLCRDJxvyQ2hRzUdOO
 sjB+PeSUuKutY0YM61hrH7zOEKZ2Fgk4BUKEWGP4B8l2GzP7oeKXFByVeQh5rKRXK5PCJC
 FqvlCh0m1e2nuAy+XTpk0XbD7keuif4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-ZyObJB_GM5CeFGQHLFvWyg-1; Thu, 26 May 2022 10:17:24 -0400
X-MC-Unique: ZyObJB_GM5CeFGQHLFvWyg-1
Received: by mail-ua1-f70.google.com with SMTP id
 z19-20020ab04913000000b0036868226b2fso908795uac.16
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 07:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4tM9i8zLDuzG8W11McPeUulRENt8+ftJg2SYkYds28=;
 b=8OTbfE1rkaevLtHfwYXR7oA4MZ9N5Su78zIoGmsm+D6Eczx3HUxd6WTlfrQjWRZ9vc
 2wcGfb8X66E7WOy019LRgcN30Zxiw0ua5O2JzUO55tAM2RD6yML+WiSesv0HybEDbjLA
 pj4V1LSaOVzIq0YIX+0MyYINPrzzhYcR48hva3nCa7Gs4Imv5oGY+c0+xXBAWA/aoOWW
 r4R/8gxSvCxxSc9cbgP533qBwuwVaUS/GEn2wBPkRDQg93ktV0pi44PHVQbYf2O1BLk+
 3TmhreUnbg6sV3HQabE5xeP5a8ps/AcvcJuLd0ufUeq383tB0knXg7lrEHi04qISS4G4
 UnFA==
X-Gm-Message-State: AOAM533Kt2IfJf2IZBtGpOTkF29u/i5rGzHEXX4bS2I74JRzU6pfUauO
 sdJlQyPj1m3i9iX2gJRnUsnUYfARaWqaHkDGlIkcU5k0s5DnB6zarVNBKjbg4UsllZ3boY3KojK
 V4DUMsHnyA2ORg7l5g0P55uZ2ajA2xEk=
X-Received: by 2002:a67:c21e:0:b0:337:d926:347b with SMTP id
 i30-20020a67c21e000000b00337d926347bmr5455607vsj.11.1653574644469; 
 Thu, 26 May 2022 07:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyc8N/7JmYpvunYDgeL7g1V6DYJwdXy5AQ6ufytXPTYsx9ayb4QOP16cbmMWnfS2h2t1ZJXlhwby5UoRLse3M=
X-Received: by 2002:a67:c21e:0:b0:337:d926:347b with SMTP id
 i30-20020a67c21e000000b00337d926347bmr5455596vsj.11.1653574644306; Thu, 26
 May 2022 07:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-6-jsnow@redhat.com>
 <fe05defa-4820-489c-200e-36fc0a3f69f6@redhat.com>
In-Reply-To: <fe05defa-4820-489c-200e-36fc0a3f69f6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 10:17:13 -0400
Message-ID: <CAFn=p-YZ8G0f3JBw0tRHn-cytVUA=z5VS9kzZaH4faqrsx+afA@mail.gmail.com>
Subject: Re: [PATCH 5/9] tests: add quiet-venv-pip macro
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000048ab9d05dfead962"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000048ab9d05dfead962
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022, 8:16 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/26/22 02:09, John Snow wrote:
> > Factor out the "test venv pip" macro; rewrite the "check-venv" rule to
> > be a little more compact. Replace the "PIP" pseudo-command output with
> > "VENVPIP" to make it 1% more clear that we are talking about using pip
> > to install something into a venv.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/Makefile.include | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 839ffde876a..052d7f56e9a 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -104,13 +104,13 @@ else
> >       AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
> >   endif
> >
> > +quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
> > +    $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
> > +    "VENVPIP","$1")
> > +
> >   $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
> > -     $(call quiet-command, \
> > -            $(PYTHON) -m venv $@, \
> > -            VENV, $@)
> > -     $(call quiet-command, \
> > -            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check
> install \
> > -            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
> > +     $(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
> > +     $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> >       $(call quiet-command, touch $@)
> >
> >   $(TESTS_RESULTS_DIR):
>
> Sooner or later I'd like quiet-command to be changed to English
> descriptions like the ones currently emitted during the ninja build, but
> stuff for later.
>
> Paolo
>

If it helps, this is a bit of a stopgap on the way to the configure-driven
version; ideally this goes away by the end of this little project.

(I just thought it made the recipes read nicer and reduced the chance for
anyone else getting the pip flags wrong in the interim.)

--js

>

--00000000000048ab9d05dfead962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 26, 2022, 8:16 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/26/22 02:09, John Snow wrote:<br>
&gt; Factor out the &quot;test venv pip&quot; macro; rewrite the &quot;chec=
k-venv&quot; rule to<br>
&gt; be a little more compact. Replace the &quot;PIP&quot; pseudo-command o=
utput with<br>
&gt; &quot;VENVPIP&quot; to make it 1% more clear that we are talking about=
 using pip<br>
&gt; to install something into a venv.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/Makefile.include | 12 ++++++------<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/Makefile.include b/tests/Makefile.include<br>
&gt; index 839ffde876a..052d7f56e9a 100644<br>
&gt; --- a/tests/Makefile.include<br>
&gt; +++ b/tests/Makefile.include<br>
&gt; @@ -104,13 +104,13 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AVOCADO_CMDLINE_TAGS=3D$(addprefix -t , $(AV=
OCADO_TAGS))<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +quiet-venv-pip =3D $(quiet-@)$(call quiet-command-run, \<br>
&gt; +=C2=A0 =C2=A0 $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $=
1, \<br>
&gt; +=C2=A0 =C2=A0 &quot;VENVPIP&quot;,&quot;$1&quot;)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0$(TESTS_VENV_DIR): $(TESTS_VENV_REQ)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(call quiet-command, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON) -m venv $@, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VENV, $@)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(call quiet-command, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m pip -q -=
-disable-pip-version-check install \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -r $(TESTS_VENV_REQ), PIP, =
$(TESTS_VENV_REQ))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call quiet-command, $(PYTHON) -m venv $@, VENV,=
 $@)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ=
))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command, touch $@)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0$(TESTS_RESULTS_DIR):<br>
<br>
Sooner or later I&#39;d like quiet-command to be changed to English <br>
descriptions like the ones currently emitted during the ninja build, but <b=
r>
stuff for later.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">If it helps, this is a bit of a stopgap on the way to the configure-dr=
iven version; ideally this goes away by the end of this little project.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">(I just thought it made the=
 recipes read nicer and reduced the chance for anyone else getting the pip =
flags wrong in the interim.)</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">--js</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
</blockquote></div></div></div>

--00000000000048ab9d05dfead962--


