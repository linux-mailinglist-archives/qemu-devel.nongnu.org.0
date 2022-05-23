Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDA5315B1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:23:29 +0200 (CEST)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDeJ-0004Fx-Pu
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDYJ-0007wK-9l
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:17:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDYH-0007Tg-M0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653333433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TNH3qRuseBr8SrTpiGiPkcbhSPtFKm9suZIxJ3JuxUk=;
 b=VBkg6e74FeI6VGMx9yZr9433ov4gJDA8nV0ISlV4UP2l/mR8OO/AkrIQNZOnypwBnsuKfn
 LP50sCqICCJ/9i4joJsHUha27vPar4knxgJe+Vk6boUiltrcpXVxZuF9qrh+7CKWFHsfXH
 y48FJmjR4Xph7fcGCluhgMReQVOru2s=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-lPGJYsIiNU6BCTdeb1-2pg-1; Mon, 23 May 2022 15:17:11 -0400
X-MC-Unique: lPGJYsIiNU6BCTdeb1-2pg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2f4dfd09d7fso135262567b3.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 12:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TNH3qRuseBr8SrTpiGiPkcbhSPtFKm9suZIxJ3JuxUk=;
 b=iPxJ9/htitzl5FbvIueFd7DUVm6H3zFh5QxwuiVAtVRq6k5hQt5Z+wA+qQYa+HliQI
 8wtxtmPE+mMPPQakQ6KGk+KjEfo9T0PQdh32CKdMBkpOcmKIFsZWH3QXFlu2sCrCbwGx
 Pyevql+yshDD4hrOFpwQQuOWgUgDzEe+//y3Ggk9/qDOVvGJpn0wxlAwer8ddV4MBp6T
 RIZIOCR2oX6AXGS7AUI8HG4TojFqwSdjQo2hGDsmOAz8N1zHPacrf2x12OQVGDsnUaAc
 VnogL30CcNeoBSymLdXja+0boQVIlEE6OkbzhibCO06dfjlJeN8Qyd685m+nwBNFhlA1
 wlNw==
X-Gm-Message-State: AOAM531snU3OupBWUl/O6ul5MTXO+RGL5iayYUVZEDxKcdn3G8uj8l6Q
 yOVBl8a0j4qIJPz1hjpFmJUF4sDKi0OSVc1uGv/zWzejk5N2GPByRJTQonuh24QDEMVt+BS6wld
 W3o5BS5OLfNVUu99gbzuM8LWGVHhFcAk=
X-Received: by 2002:a05:6902:1009:b0:64f:b4b1:e9e5 with SMTP id
 w9-20020a056902100900b0064fb4b1e9e5mr9070327ybt.68.1653333430594; 
 Mon, 23 May 2022 12:17:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDQ+S8SHebWzwohxVb6vnqOt+bJCJaLX+r4e3PztEicAPDlTtk/cMKGkMGeMo5DK2o+lZY6CmkDoZgO6jBDho=
X-Received: by 2002:a05:6902:1009:b0:64f:b4b1:e9e5 with SMTP id
 w9-20020a056902100900b0064fb4b1e9e5mr9070309ybt.68.1653333430421; Mon, 23 May
 2022 12:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220523145610.809663-1-kkostiuk@redhat.com>
 <CAMxuvay25hx1vvKNWbRH=BmA2Jhd09sfbDc5jhAY4Ai9rQmwaw@mail.gmail.com>
In-Reply-To: <CAMxuvay25hx1vvKNWbRH=BmA2Jhd09sfbDc5jhAY4Ai9rQmwaw@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 23 May 2022 22:16:59 +0300
Message-ID: <CAPMcbCpyUgJ2V9b-=TqDCVrKVTCHN8yik=rMz4MtNEgHGS4bJA@mail.gmail.com>
Subject: Re: [PATCH] trivial: qga: Log version on start
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000d0e1f505dfb2afe5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000d0e1f505dfb2afe5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 8:35 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@redhat.com> wrote:

> On Mon, May 23, 2022 at 4:56 PM Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
> >
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> why not, and why not QEMU_FULL_VERSION? :)
>

QEMU_FULL_VERSION is good too, no specific reason to use QEMU_VERSION.


> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> > ---
> >  qga/main.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/qga/main.c b/qga/main.c
> > index 3b9546c185..a58368c75e 100644
> > --- a/qga/main.c
> > +++ b/qga/main.c
> > @@ -1271,6 +1271,8 @@ static GAState *initialize_agent(GAConfig *config=
,
> int socket_activation)
> >      g_log_set_fatal_mask(NULL, G_LOG_LEVEL_ERROR);
> >      ga_enable_logging(s);
> >
> > +    g_debug("Guest agent version %s started", QEMU_VERSION);
> > +
> >  #ifdef _WIN32
> >      /* On win32 the state directory is application specific (be it the
> default
> >       * or a user override). We got past the command line parsing; let'=
s
> create
> > --
> > 2.25.1
> >
>
>

--000000000000d0e1f505dfb2afe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 8:35 PM Marc-=
Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcan=
dre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, May 23, 2022 at 4:56 PM Konstantin Kostiuk &lt=
;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
<br>
why not, and why not QEMU_FULL_VERSION? :)<br></blockquote><div><br></div><=
div>QEMU_FULL_VERSION is good too, no specific reason to use QEMU_VERSION.<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 qga/main.c | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/qga/main.c b/qga/main.c<br>
&gt; index 3b9546c185..a58368c75e 100644<br>
&gt; --- a/qga/main.c<br>
&gt; +++ b/qga/main.c<br>
&gt; @@ -1271,6 +1271,8 @@ static GAState *initialize_agent(GAConfig *confi=
g, int socket_activation)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_log_set_fatal_mask(NULL, G_LOG_LEVEL_ERROR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ga_enable_logging(s);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 g_debug(&quot;Guest agent version %s started&quot;, QEM=
U_VERSION);<br>
&gt; +<br>
&gt;=C2=A0 #ifdef _WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* On win32 the state directory is application spe=
cific (be it the default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* or a user override). We got past the comma=
nd line parsing; let&#39;s create<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000d0e1f505dfb2afe5--


