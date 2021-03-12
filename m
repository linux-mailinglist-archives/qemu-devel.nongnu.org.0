Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A21338B69
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:23:53 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKftY-0007VM-QO
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKfrz-0006f5-4Z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKfrx-0002nh-6y
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615548132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7B6wd510BIeDCiXtWQBWuYLe+3N2kW4Pnu+WFuWs91M=;
 b=hWI+o+ZX1AzjEQE01SRLzlGe2LVFwgSQbYvlS5SXzJYeN9/UxKSaQEFZoqSlKValzYJ5pX
 Y2mGh3J1YyqU7i0W0osKSNJGWBwYDQN7zt9/N4Io25W4kYyhIMCb33OTWooz7zZ4QSqYXD
 1xF9CfJq/qG1E+kRL8LzSSDXnvAnkTY=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-eV62-UUUMFeAeT6KZm_2nw-1; Fri, 12 Mar 2021 06:22:09 -0500
X-MC-Unique: eV62-UUUMFeAeT6KZm_2nw-1
Received: by mail-il1-f200.google.com with SMTP id v20so17794035ile.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 03:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7B6wd510BIeDCiXtWQBWuYLe+3N2kW4Pnu+WFuWs91M=;
 b=erghyXQctex2rLzuN770ZFyvzjU1m4+vIFpuAHvA/rn6u4oRPMFSh/82SSlb2J8Jme
 nCNZd4ReI+DfY4WESlBeKqgeWb4kj7i3RnnoRD8eI6U4aVGhuyAlZ4tSgFxkc/PS/Xr0
 fzXuBQFz3xA8ebguxdYDuuEmuuFAOVzQcDrzQkIshyRb2y3omlaK6gTBzv4TztrLztIk
 JK8M+AUaM0VxRDtFSwxMsgKGisqRlvetUdLMkJCHwfdUoO7V31nIqaG3Zrvowz0S7wTA
 ypLzHfuQ1V3LJ1hbltAb4FT6rV65TkH/qsdVg26Umcvg9JTTElPHFRiO5ekMIqTCFblR
 6Nfw==
X-Gm-Message-State: AOAM530FcPOA8pgzIViFqZSO7lSLMTT1wEdEbp9KXj1PffHP55Z0ZA+F
 XxXM0jY0nNXdiHEKRJ1WxP0/nRfSmYTth414tVqiG+rs5tNXimq9NSEm6vp8AngmeIpOwce06V1
 RUmXW2bTtTO/MdplVSeqirpnr8bPW7K8=
X-Received: by 2002:a05:6602:2f0c:: with SMTP id
 q12mr9521001iow.82.1615548128731; 
 Fri, 12 Mar 2021 03:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8GF2RqPAZp4u+jAquoQzNxFqSEblyd/nbcs3HE/fRC0shRPuP3+nNhg769vbvVUSZ8j093Uuv5y2HptOf3t4=
X-Received: by 2002:a05:6602:2f0c:: with SMTP id
 q12mr9520987iow.82.1615548128526; 
 Fri, 12 Mar 2021 03:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312100108.2706195-8-marcandre.lureau@redhat.com>
 <e5fced43-4f2f-554a-986c-115b6b909e85@redhat.com>
In-Reply-To: <e5fced43-4f2f-554a-986c-115b6b909e85@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 12 Mar 2021 15:21:57 +0400
Message-ID: <CAMxuvawzXeuw39EZ6k0LJt+3rYXz+SZsWGe4oZLgO6NDj8yOvQ@mail.gmail.com>
Subject: Re: [PATCH 07/27] ui: make gl_block use a counter
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000519d6905bd551ce4"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000519d6905bd551ce4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 2:12 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 3/12/21 11:00 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Track multiple callers blocking requests.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  ui/console.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/ui/console.c b/ui/console.c
> > index 53eba2019e..fedb9d8b13 100644
> > --- a/ui/console.c
> > +++ b/ui/console.c
> > @@ -128,7 +128,7 @@ struct QemuConsole {
> >      DisplaySurface *surface;
> >      int dcls;
> >      DisplayChangeListener *gl;
> > -    bool gl_block;
> > +    int gl_block;
> >      int window_id;
> >
> >      /* Graphic console state.  */
> > @@ -288,10 +288,19 @@ void graphic_hw_gl_block(QemuConsole *con, bool
> block)
> >  {
> >      assert(con !=3D NULL);
> >
> > -    con->gl_block =3D block;
> > -    if (con->hw_ops->gl_block) {
> > -        con->hw_ops->gl_block(con->hw, block);
> > +    if (block) {
> > +        con->gl_block++;
> > +    } else {
> > +        con->gl_block--;
> > +    }
> > +    assert(con->gl_block >=3D 0);
> > +    if (!con->hw_ops->gl_block) {
> > +        return;
> > +    }
> > +    if ((block && con->gl_block !=3D 1) || (!block && con->gl_block !=
=3D
> 0)) {
>
> Dubious condition check... Could you rewrite it KISS for review?
>

Well, I have no good idea :) Break in two if-return blocks?


> > +        return;
> >      }
> > +    con->hw_ops->gl_block(con->hw, block);
> >  }
> >
> >  void graphic_hw_gl_flushed(QemuConsole *con)
> >
>
>

--000000000000519d6905bd551ce4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 2:12 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 3/12/21 11:00 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" t=
arget=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Track multiple callers blocking requests.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 ui/console.c | 17 +++++++++++++----<br>
&gt;=C2=A0 1 file changed, 13 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/ui/console.c b/ui/console.c<br>
&gt; index 53eba2019e..fedb9d8b13 100644<br>
&gt; --- a/ui/console.c<br>
&gt; +++ b/ui/console.c<br>
&gt; @@ -128,7 +128,7 @@ struct QemuConsole {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DisplaySurface *surface;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int dcls;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DisplayChangeListener *gl;<br>
&gt; -=C2=A0 =C2=A0 bool gl_block;<br>
&gt; +=C2=A0 =C2=A0 int gl_block;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int window_id;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Graphic console state.=C2=A0 */<br>
&gt; @@ -288,10 +288,19 @@ void graphic_hw_gl_block(QemuConsole *con, bool =
block)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(con !=3D NULL);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 con-&gt;gl_block =3D block;<br>
&gt; -=C2=A0 =C2=A0 if (con-&gt;hw_ops-&gt;gl_block) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&gt;hw_ops-&gt;gl_block(con-&gt;hw, b=
lock);<br>
&gt; +=C2=A0 =C2=A0 if (block) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&gt;gl_block++;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 con-&gt;gl_block--;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 assert(con-&gt;gl_block &gt;=3D 0);<br>
&gt; +=C2=A0 =C2=A0 if (!con-&gt;hw_ops-&gt;gl_block) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if ((block &amp;&amp; con-&gt;gl_block !=3D 1) || (!blo=
ck &amp;&amp; con-&gt;gl_block !=3D 0)) {<br>
<br>
Dubious condition check... Could you rewrite it KISS for review?<br></block=
quote><div><br></div><div>Well, I have no good idea :) Break in two if-retu=
rn blocks?<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 con-&gt;hw_ops-&gt;gl_block(con-&gt;hw, block);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void graphic_hw_gl_flushed(QemuConsole *con)<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000519d6905bd551ce4--


