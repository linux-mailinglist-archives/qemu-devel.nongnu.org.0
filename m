Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED826F71A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:54:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pud9T-00015L-64; Thu, 04 May 2023 13:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pud9R-00015B-LZ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:53:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pud9P-00043s-Rt
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683222833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fUf/IbI+PHustUAVK8cU6IP8Jr2sjNc9jgQgLXLRPk=;
 b=AfC2cpMNvgKFl518rRU9k2wRbeHdw3mnzQzuB4Q63jDFQ5iC0XdNGGiVRL6viAQv1pI8tO
 TDB9kXjB9cBZ2viiPyTY6f904smJ5GvUi1t6SAkUuSeRttqhmDLsmPm5jQ6buVw7/iZbwV
 wXO32/0djLXr5cZ92jt8aBgTkjXHVG4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-kVvGaz3cOJu1WZDchqLY1Q-1; Thu, 04 May 2023 13:53:50 -0400
X-MC-Unique: kVvGaz3cOJu1WZDchqLY1Q-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6435b851de0so462087b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683222830; x=1685814830;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7fUf/IbI+PHustUAVK8cU6IP8Jr2sjNc9jgQgLXLRPk=;
 b=UiWheO4wuBWmWVeKaP0EiuVioLnNBQq9YGTVyterND5M9EwTKdKGbUlNXBfi8cgf1x
 7bfDm6jIJgE/7X2V2D/CFbuaADc8HHXba3eHm6VxgNJtaLlaVgao3hfF+86krVBIG5Or
 qu13YVmdTwndZrhJIHxEYwXQOnz3fsBisUnN4LwbT92DXvpg79WoSKGZYqpqfgNqiNDr
 GC2fH2/0DxnTwk95tLRGo1mv8xTx/KJwalCXugl9vhfJnFzrNkjC6Elv0PTA+0F22wjq
 RCKOdtIo8Qoi9de6AcHv8cC4AI/A8dCDuZxkXpbYQZvotRlmc62/szboHoVWXZfu4Ft4
 jLOA==
X-Gm-Message-State: AC+VfDy4qhdFa56R52kgB1WVFtY8XNxxJ7NGNqI1cyGeyHmNWdWhNEmm
 HSRgKLuKWyTZVkoVnQVEQETuAV7E7ro6/ANYrSFB41AjBM+J2m6RVCbwQGXP1TN4MlqxtHxqM+L
 aUVQhkNZMPHJZi11PZ5s4A+7/nLmfE+I=
X-Received: by 2002:a05:6a00:2e81:b0:641:699:f34c with SMTP id
 fd1-20020a056a002e8100b006410699f34cmr4038214pfb.17.1683222829829; 
 Thu, 04 May 2023 10:53:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ogBZ8U0xpvNyntlQVffjsVoox7znCfYMjMNuXhuXtjWgp/lVGQ/DDpsjUM9Uz53G2/m5qgFt2GuaauLuyUBA=
X-Received: by 2002:a05:6a00:2e81:b0:641:699:f34c with SMTP id
 fd1-20020a056a002e8100b006410699f34cmr4038197pfb.17.1683222829511; Thu, 04
 May 2023 10:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230504174816.GA581920@fedora>
In-Reply-To: <20230504174816.GA581920@fedora>
From: John Snow <jsnow@redhat.com>
Date: Thu, 4 May 2023 13:53:38 -0400
Message-ID: <CAFn=p-ZhsUgMrK+w+ibP68q-v093SDEfhqxHsfTtFfS3qxD9ow@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-devel <qemu-devel@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Content-Type: multipart/alternative; boundary="000000000000d4cadd05fae1da3b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000d4cadd05fae1da3b
Content-Type: text/plain; charset="UTF-8"

On Thu, May 4, 2023, 1:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Tue, May 02, 2023 at 11:23:27AM +0200, Mads Ynddal wrote:
> > From: Mads Ynddal <m.ynddal@samsung.com>
> >
> > I wanted to use simpletrace.py for an internal project, so I tried to
> update
> > and polish the code. Some of the commits resolve specific issues, while
> some
> > are more subjective.
>
> An internal project based on qemu.git or a completely separate codebase?
>
> Sometimes I've wondered whether tracetool should be extracted from
> qemu.git and moved into its own QEMU-independent place. That way other
> C/C++ applications and libraries could use it easily.
>
> Now that Alex Bennee removed the vcpu trace events that were specific to
> QEMU, the tracing code is less tightly coupled to QEMU. There are
> probably still a number of places that need to be cleaned up in order
> for the tracing code to be independent of QEMU though.
>
> If there is interest in doing this, I support the effort, although I'm
> not sure how much time I have to actually do the work myself.
>

I meant internal, but if there's interest in fully extracting it, I have a
playbook for that now based on my efforts to do the same for qemu.qmp and I
can offer good stewardship for that process.

I only suggest moving it under python/ so that we have it type checked and
tested against python deprecations as part of CI as a preventative measure
against rot.

(Stuff in python/ is rigorously checked, stuff in scripts/ is not.)

--js


> >
> > I've tried to divide it into commits so we can discuss the
> > individual changes, and I'm ready to pull things out, if it isn't needed.
> >
> > v2:
> >  * Added myself as maintainer of simpletrace.py
> >  * Improve docstring on `process`
> >  * Changed call to `process` in scripts/analyse-locks-simpletrace.py to
> reflect new argument types
> >  * Replaced `iteritems()` with `items()` in
> scripts/analyse-locks-simpletrace.py to support Python 3
> >
> > Mads Ynddal (12):
> >   simpletrace: Improve parsing of sys.argv; fix files never closed.
> >   simpletrace: Annotate magic constants from QEMU code
> >   simpletrace: changed naming of edict and idtoname to improve
> >     readability
> >   simpletrace: update code for Python 3.11
> >   simpletrace: Changed Analyzer class to become context-manager
> >   simpletrace: Simplify construction of tracing methods
> >   simpletrace: Improved error handling on struct unpack
> >   simpletrace: define exception and add handling
> >   simpletrace: Refactor to separate responsibilities
> >   MAINTAINERS: add maintainer of simpletrace.py
> >   scripts/analyse-locks-simpletrace.py: changed iteritems() to items()
> >   scripts/analyse-locks-simpletrace.py: reflect changes to process in
> >     simpletrace.py
> >
> >  MAINTAINERS                          |   8 +-
> >  scripts/analyse-locks-simpletrace.py |   5 +-
> >  scripts/simpletrace.py               | 307 ++++++++++++---------------
> >  3 files changed, 150 insertions(+), 170 deletions(-)
> >
> > --
> > 2.38.1
> >
>

--000000000000d4cadd05fae1da3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 4, 2023, 1:48 PM Stefan Hajnoczi &lt;<a hr=
ef=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Tue, May 02, 2023 at 11:23:27AM +0200,=
 Mads Ynddal wrote:<br>
&gt; From: Mads Ynddal &lt;<a href=3D"mailto:m.ynddal@samsung.com" target=
=3D"_blank" rel=3D"noreferrer">m.ynddal@samsung.com</a>&gt;<br>
&gt; <br>
&gt; I wanted to use simpletrace.py for an internal project, so I tried to =
update<br>
&gt; and polish the code. Some of the commits resolve specific issues, whil=
e some<br>
&gt; are more subjective.<br>
<br>
An internal project based on qemu.git or a completely separate codebase?<br=
>
<br>
Sometimes I&#39;ve wondered whether tracetool should be extracted from<br>
qemu.git and moved into its own QEMU-independent place. That way other<br>
C/C++ applications and libraries could use it easily.<br>
<br>
Now that Alex Bennee removed the vcpu trace events that were specific to<br=
>
QEMU, the tracing code is less tightly coupled to QEMU. There are<br>
probably still a number of places that need to be cleaned up in order<br>
for the tracing code to be independent of QEMU though.<br>
<br>
If there is interest in doing this, I support the effort, although I&#39;m<=
br>
not sure how much time I have to actually do the work myself.<br></blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I meant intern=
al, but if there&#39;s interest in fully extracting it, I have a playbook f=
or that now based on my efforts to do the same for qemu.qmp and I can offer=
 good stewardship for that process.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I only suggest moving it under python/ so that we have it type =
checked and tested against python deprecations as part of CI as a preventat=
ive measure against rot.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>(Stuff in python/ is rigorously checked, stuff in scripts/ is not.)</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
&gt; <br>
&gt; I&#39;ve tried to divide it into commits so we can discuss the<br>
&gt; individual changes, and I&#39;m ready to pull things out, if it isn&#3=
9;t needed.<br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 * Added myself as maintainer of simpletrace.py<br>
&gt;=C2=A0 * Improve docstring on `process`<br>
&gt;=C2=A0 * Changed call to `process` in scripts/analyse-locks-simpletrace=
.py to reflect new argument types<br>
&gt;=C2=A0 * Replaced `iteritems()` with `items()` in scripts/analyse-locks=
-simpletrace.py to support Python 3<br>
&gt; <br>
&gt; Mads Ynddal (12):<br>
&gt;=C2=A0 =C2=A0simpletrace: Improve parsing of sys.argv; fix files never =
closed.<br>
&gt;=C2=A0 =C2=A0simpletrace: Annotate magic constants from QEMU code<br>
&gt;=C2=A0 =C2=A0simpletrace: changed naming of edict and idtoname to impro=
ve<br>
&gt;=C2=A0 =C2=A0 =C2=A0readability<br>
&gt;=C2=A0 =C2=A0simpletrace: update code for Python 3.11<br>
&gt;=C2=A0 =C2=A0simpletrace: Changed Analyzer class to become context-mana=
ger<br>
&gt;=C2=A0 =C2=A0simpletrace: Simplify construction of tracing methods<br>
&gt;=C2=A0 =C2=A0simpletrace: Improved error handling on struct unpack<br>
&gt;=C2=A0 =C2=A0simpletrace: define exception and add handling<br>
&gt;=C2=A0 =C2=A0simpletrace: Refactor to separate responsibilities<br>
&gt;=C2=A0 =C2=A0MAINTAINERS: add maintainer of simpletrace.py<br>
&gt;=C2=A0 =C2=A0scripts/analyse-locks-simpletrace.py: changed iteritems() =
to items()<br>
&gt;=C2=A0 =C2=A0scripts/analyse-locks-simpletrace.py: reflect changes to p=
rocess in<br>
&gt;=C2=A0 =C2=A0 =C2=A0simpletrace.py<br>
&gt; <br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 scripts/analyse-locks-simpletrace.py |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 scripts/simpletrace.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 307 ++++++++++++---------------<br>
&gt;=C2=A0 3 files changed, 150 insertions(+), 170 deletions(-)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.38.1<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000d4cadd05fae1da3b--


