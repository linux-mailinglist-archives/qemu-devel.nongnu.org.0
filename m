Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0735E573613
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 14:09:36 +0200 (CEST)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBbBO-0003vC-Us
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 08:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBb8s-0001PA-GB
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBb8i-0000nV-Ec
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657714007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5LzDuBrQBsSYiehUVGpKzoFmPslVM9Tf8WR3VCp4Mg=;
 b=AbLJGms1Wsxcjx/mNUEKZJ+jn3+9WvqPm2LPrFSE5ejS6huSIWYClZhtekp9dzxds/Pkfx
 EkcmHdIhtEiugfp8XSU0iG7cLBGshg4EonU0iCg9DQZ+EDRKtyWfKOLOr0i0aHX9KQav30
 nwT+SgpPtagUID33Sxgwt8a7z6KBSiY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-ejf0lnyIOu2je1tqWjzXaQ-1; Wed, 13 Jul 2022 08:06:46 -0400
X-MC-Unique: ejf0lnyIOu2je1tqWjzXaQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-31cbcba2f28so92651387b3.19
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 05:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5LzDuBrQBsSYiehUVGpKzoFmPslVM9Tf8WR3VCp4Mg=;
 b=XXcbk4oClJeNGBlNGMoRMk+8TA/c7t6a9Kzu88HbK9wq0O6Tfgn8eet55dkxgI9clE
 C1WaEB1R1+g3YJ9BlPeEOmzBuOCPWRS55Cx+NCy03IhKPk8p4RLGfBRDG5MtDDriIY5o
 S1x3cURTCXLHAseLU5dKQvle8Q1q/ApgRHwWztocTdZOJXfCUSwHKLhWCEEycxnpGkx7
 psQgljT4TwLx9HvsdSG37CaivHW6tjUpBon/tP0UK5vAxfG72l0kI+3CvmKGZnwRo+EI
 janwa6NRfwzMxsWOL8cn1t84pmNiW3uFSU0FUn7sEvGRZOf6PGxtgQuCIVecH6DOZev3
 4SWQ==
X-Gm-Message-State: AJIora+GEsBeK6vKLLH5CbRg1T5P2GnP2de5CWdEWFgG5Acr2dDUe8dm
 15ERBec4QootVvZcG8Q+gMRazj8P36rvvLLSeFBRBzUFxgSvH7k3cIAlApF14xw2TgFlhPo6yPb
 YELnK2Di/0b4QIIFEevidLuwhZQ5xaJI=
X-Received: by 2002:a81:5d05:0:b0:31c:e010:fbc with SMTP id
 r5-20020a815d05000000b0031ce0100fbcmr3732423ywb.381.1657714005727; 
 Wed, 13 Jul 2022 05:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulcQ4WnhMc0v9+hHNKGoGJdjoX6y8TxoIZxdBYGl+ZjWZFZcCllyfZJpKqMEm8HJx9Y6auRyhOMHL1eEX5+l0=
X-Received: by 2002:a81:5d05:0:b0:31c:e010:fbc with SMTP id
 r5-20020a815d05000000b0031ce0100fbcmr3732399ywb.381.1657714005503; Wed, 13
 Jul 2022 05:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
 <20220713101908.2212307-2-kkostiuk@redhat.com>
 <Ys6gl74SLea6dsfU@redhat.com>
 <CAPMcbCretrK9i5tA7joRXaKa0f7HruO=SNa18sZqZPmCZK9ypA@mail.gmail.com>
 <Ys6ysTAqLt9zLjkO@redhat.com>
In-Reply-To: <Ys6ysTAqLt9zLjkO@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 13 Jul 2022 15:06:33 +0300
Message-ID: <CAPMcbCqqie_=cg2xdxjMh8vkKmdXr4BOMrpK8KsF9agwEhySTA@mail.gmail.com>
Subject: Re: [PULL 1/3] MAINTAINERS: Add myself as Guest Agent reviewer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007005f205e3ae9ed1"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--0000000000007005f205e3ae9ed1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 2:55 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Jul 13, 2022 at 02:31:08PM +0300, Konstantin Kostiuk wrote:
> > On Wed, Jul 13, 2022 at 1:38 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Wed, Jul 13, 2022 at 01:19:06PM +0300, Konstantin Kostiuk wrote:
> > > > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > > > Message-Id: <20220712092715.2136898-1-kkostiuk@redhat.com>
> > > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > > > ---
> > > >  MAINTAINERS | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 450abd0252..b1e73d99f3 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git
> > > qapi-next
> > > >
> > > >  QEMU Guest Agent
> > > >  M: Michael Roth <michael.roth@amd.com>
> > > > +R: Konstantin Kostiuk <kkostiuk@redhat.com>
> > >
> > > This pull request contains functional changes under qga/, which
> > > suggests you're acting as a (co-)maintainer for QGA, not merely
> > > a reviewer. I wouldn't normally expect reviewers to send pull
> > > requests for a subsystem. As such should this be "M:", to
> > > indicate co-maintainership and have an explicit ACK from
> > > Michael Roth.
> > >
> >
> > As the maintainer of the Windows part of the Guest Agent, I have added
> > myself
> > as a reviewer so I don't miss out on general patches for the Guest Agen=
t.
> > Some time ago, I asked Michael Roth if I could submit PRs for all guest
> > agent components and he allow me to do this.
> > If need I can add myself as a co-maintainer to Guest Agent not only
> > Guest Agent Windows.
>
> It sounds like you're defacto a co-maintainer already then and
> might as well ackowledge this in MAINTAINERS.
>

Ok. Will resend patch and pull.


>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000007005f205e3ae9ed1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 2022 at 2:55 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Jul 13, 2022 at 02:31:08PM +0300, Konstantin Kostiuk wrote:<b=
r>
&gt; On Wed, Jul 13, 2022 at 1:38 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Jul 13, 2022 at 01:19:06PM +0300, Konstantin Kostiuk wrot=
e:<br>
&gt; &gt; &gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Message-Id: &lt;<a href=3D"mailto:20220712092715.2136898-1-k=
kostiuk@redhat.com" target=3D"_blank">20220712092715.2136898-1-kkostiuk@red=
hat.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mail=
to:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 MAINTAINERS | 1 +<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; &gt; &gt; index 450abd0252..b1e73d99f3 100644<br>
&gt; &gt; &gt; --- a/MAINTAINERS<br>
&gt; &gt; &gt; +++ b/MAINTAINERS<br>
&gt; &gt; &gt; @@ -2880,6 +2880,7 @@ T: git <a href=3D"https://repo.or.cz/q=
emu/armbru.git" rel=3D"noreferrer" target=3D"_blank">https://repo.or.cz/qem=
u/armbru.git</a><br>
&gt; &gt; qapi-next<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 QEMU Guest Agent<br>
&gt; &gt; &gt;=C2=A0 M: Michael Roth &lt;<a href=3D"mailto:michael.roth@amd=
.com" target=3D"_blank">michael.roth@amd.com</a>&gt;<br>
&gt; &gt; &gt; +R: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat=
.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This pull request contains functional changes under qga/, which<b=
r>
&gt; &gt; suggests you&#39;re acting as a (co-)maintainer for QGA, not mere=
ly<br>
&gt; &gt; a reviewer. I wouldn&#39;t normally expect reviewers to send pull=
<br>
&gt; &gt; requests for a subsystem. As such should this be &quot;M:&quot;, =
to<br>
&gt; &gt; indicate co-maintainership and have an explicit ACK from<br>
&gt; &gt; Michael Roth.<br>
&gt; &gt;<br>
&gt; <br>
&gt; As the maintainer of the Windows part of the Guest Agent, I have added=
<br>
&gt; myself<br>
&gt; as a reviewer so I don&#39;t miss out on general patches for the Guest=
 Agent.<br>
&gt; Some time ago, I asked Michael Roth if I could submit PRs for all gues=
t<br>
&gt; agent components and he allow me to do this.<br>
&gt; If need I can add myself as a co-maintainer to Guest Agent not only<br=
>
&gt; Guest Agent Windows.<br>
<br>
It sounds like you&#39;re defacto a co-maintainer already then and<br>
might as well ackowledge this in MAINTAINERS.<br></blockquote><div><br></di=
v><div>Ok. Will resend patch and pull. <br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000007005f205e3ae9ed1--


