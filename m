Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37C526371
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:08:31 +0200 (CEST)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npVy1-0007L5-Sd
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npVsh-0002GP-CW
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npVsf-0008Ml-N2
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652450577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gxEXttkchO0QoLbiQoT2UHjLxLYfvKahCX4xo8ZSKgw=;
 b=h8DJDSJyOO5uKY7B2b3zjdTUMt8/gLgdWFEydadYFdSqRGtrpEIYk9c2mIQCoL8ROJUN/l
 KCLEK5cUdPQp1XW0QSeuh9DWRSZLzcSLKEos/SBJrLjr7NZ+XZ/w7I3twW1LbdmdTrRLxt
 Ok5bkup1SaMLVZxAruOPMCIUNjCkDes=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-5WpXmaYvOd6CPG36O-vdTA-1; Fri, 13 May 2022 10:02:55 -0400
X-MC-Unique: 5WpXmaYvOd6CPG36O-vdTA-1
Received: by mail-ua1-f69.google.com with SMTP id
 s14-20020ab02bce000000b0035d45862725so3787934uar.22
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gxEXttkchO0QoLbiQoT2UHjLxLYfvKahCX4xo8ZSKgw=;
 b=1X8ALCfaes9Us7haTWg1oaGQCI7lEtnygFMoGdY2iCRJ+Lofo+BaoQmIEadkbK2DcA
 zkkuoV4oKsO6N7eBxRftMY1VSuNKnLy2ZgaD/0X4d3OG04hYvGJUaNaa6GAC+huMGV0O
 hbhQdBpri6kOSoi4Cd3S2zJIwMPp/JU74vfUJwQPj0mMlENPAHqecaHFvMRwBvhwiJEp
 Y4NIZqfPdx8P+HVuh/ATdmOAh4ABcbxixoVECwMtqXnXHB2t2MdZSx+4REgz/JRvQBGn
 LZd5ulbqC7GYRQztSA8GhNxj53f0H/eGsqWWSTObaxiSmE2q12/E3fkY1KLZbE4O05Wx
 bw0A==
X-Gm-Message-State: AOAM5332rVWcEPzP1hXio4UN88qs5bMMUsUh7IvMKl28b9iv62ByHT+0
 bQGdh6nlqmfM5ovjEkuBNfcSviXfoW5GR915QttB7Bu9rLq3UEPwnozxWmyqBBbw9lR8YGqpjIg
 F/NpjHs/nxUAmpj49zboUP6LwrJqvcWc=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr2427017vsr.11.1652450570849; 
 Fri, 13 May 2022 07:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8Q6Vcf2+lVb3ASnRiAqpNh2pXPi4gkB25BDgrUYco4lkBMcHuv1adY6oO0FboTzPqt4fy35aYDn/g3twhRBU=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr2426454vsr.11.1652450564858; Fri, 13
 May 2022 07:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-5-jsnow@redhat.com>
 <1cf29802-0962-0b81-63c7-929641f593d4@redhat.com>
In-Reply-To: <1cf29802-0962-0b81-63c7-929641f593d4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 10:02:34 -0400
Message-ID: <CAFn=p-ZRxQ92nFEU=jx6VQ86PTNd3TzsxvpZJ=LW7Fo+=W2BQg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/9] tests: silence pip upgrade warnings during venv
 creation
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ed7a6305dee5207c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--000000000000ed7a6305dee5207c
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 4:27 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 02:06, John Snow wrote:
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index dbbf1ba535b..dfb678d379f 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -109,11 +109,11 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
> $(SRC_PATH)/python/setup.cfg
> >              $(PYTHON) -m venv $@, \
> >              VENV, $@)
> >       $(call quiet-command, \
> > -            $(TESTS_PYTHON) -m pip -q install \
> > +            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check
> install \
> >              -e "$(SRC_PATH)/python/", PIP, "$(SRC_PATH)/python/")
> >       $(call quiet-command, \
> > -            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
> > -            PIP, $(TESTS_VENV_REQ))
> > +            $(TESTS_PYTHON) -m pip -q --disable-pip-version-check
> install \
> > +            -r $(TESTS_VENV_REQ), PIP, $(TESTS_VENV_REQ))
> >       $(call quiet-command, touch $@)
>
> Really nitpicking but I would have placed this change before adding the
> second invocation of pip. :)
>
> Paolo
>

You're right. This RFC was a little disorganized, I wasn't sure I was going
to keep any of this code just yet, so it missed a cleanup pass.

(Forgive me, please!)

--000000000000ed7a6305dee5207c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 4:27 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/13/22 02:06, John Snow wrote:<br>
&gt; diff --git a/tests/Makefile.include b/tests/Makefile.include<br>
&gt; index dbbf1ba535b..dfb678d379f 100644<br>
&gt; --- a/tests/Makefile.include<br>
&gt; +++ b/tests/Makefile.include<br>
&gt; @@ -109,11 +109,11 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ) $(SRC_PATH)=
/python/setup.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON) -m venv $@, =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VENV, $@)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m pip -q i=
nstall \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m pip -q -=
-disable-pip-version-check install \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;$(SRC_PATH)/p=
ython/&quot;, PIP, &quot;$(SRC_PATH)/python/&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command, \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m pip -q i=
nstall -r $(TESTS_VENV_REQ), \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIP, $(TESTS_VENV_REQ))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TESTS_PYTHON) -m pip -q -=
-disable-pip-version-check install \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -r $(TESTS_VENV_REQ), PIP, =
$(TESTS_VENV_REQ))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call quiet-command, touch $@)<br>
<br>
Really nitpicking but I would have placed this change before adding the <br=
>
second invocation of pip. :)<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">You&#39;re right. This RFC was a little disorganized, I wasn&#39;t sur=
e I was going to keep any of this code just yet, so it missed a cleanup pas=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Forgive me, please!)=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ed7a6305dee5207c--


