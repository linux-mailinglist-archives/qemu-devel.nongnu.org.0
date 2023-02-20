Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E890C69D271
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:59:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUAQn-000127-Su; Mon, 20 Feb 2023 12:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pUAQl-00011C-EK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pUAQj-0004Ho-9f
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676915904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pKlhqbadkHz4mHus36uh5OfoKuXzCndV0IBAs9GBYDs=;
 b=c/4LVZi8w1aKgWRdUH+AkSZLfchdU/gRN1jEWRvQ+HwLZgeeFx5cVndwyaxPkbeTc1aVbX
 gwq54PkLfmLqrZVuG7iQbLHHjnuzpYKXOkPGB9f7Mx92IRP3kQgYuOG4oLo/GOUZX1J8hY
 sFxAyB/8PfemBN30SDzzK8ElNQ5Mvtk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-eb4niR54MmKaVtuGdXtmKQ-1; Mon, 20 Feb 2023 12:58:22 -0500
X-MC-Unique: eb4niR54MmKaVtuGdXtmKQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 dk16-20020a0564021d9000b004aaa054d189so2355162edb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pKlhqbadkHz4mHus36uh5OfoKuXzCndV0IBAs9GBYDs=;
 b=OyFe85KqIR8XXaQVPkmEsWFT50MnhqEyBs+9TNUhyPzqO/w0bPA1ggP/N55NgM6ARU
 ySWHD2yLnavr25plJdfi89NNpxrQV/8htUDytID3OGBstNdC7pz5xmcHYwJRT1GfsTJp
 vygJmIrBHZKSssF7bOlIaf5tmueeQZ/jF82+xfXFEikS7lXEJAO+cXd/rIWcTIhjzFsQ
 ROT/YQiHNnyTFC/8CsFnFzSmWtj3E5suM5RiVBNjlUuFpQVNCLH0WXsxg33se+IklceT
 PlJBAFgB8Xd90a/qlN6+j1Io/CGziWjSVF2l7VJRTCGAVlAUmugvWZ/E8p27uKhneP1m
 LAaA==
X-Gm-Message-State: AO0yUKXi2OqScRjKXt4nV6NzmjcXlMrkNvKXuhHppDezDYG+lLK1n02a
 bTsqZivX9p8/dGyxXIbsRUeSJNIMZR0nswpTMofYvVrTtWexggWt6fY9dYKhs/HlEv2XO6JkeZ1
 2hGCv5jk5RGAO+I/J8yRyeswQ02DV6B4=
X-Received: by 2002:a17:906:28c7:b0:888:6294:a1fd with SMTP id
 p7-20020a17090628c700b008886294a1fdmr4380104ejd.2.1676915901126; 
 Mon, 20 Feb 2023 09:58:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+mvrUhA+ejxwji7loRHbBb/e/qyHxQtT0oZm+E+IYlrFH21OxrsKiy3ssUADVUVPzxj4wehfbVhTre9jY6YuU=
X-Received: by 2002:a17:906:28c7:b0:888:6294:a1fd with SMTP id
 p7-20020a17090628c700b008886294a1fdmr4380099ejd.2.1676915900861; Mon, 20 Feb
 2023 09:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20230220175605.43759-1-ernunes@redhat.com>
In-Reply-To: <20230220175605.43759-1-ernunes@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 20 Feb 2023 21:58:07 +0400
Message-ID: <CAMxuvawbD+QcSTMZ18wh+J361udTSaVwpZWAtX1LDtntR9ehrQ@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix passing y0_top parameter to scanout
To: Erico Nunes <ernunes@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000096e20805f52568cf"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--00000000000096e20805f52568cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 9:56 PM Erico Nunes <ernunes@redhat.com> wrote:

> The dmabuf->y0_top flag is passed to .dpy_gl_scanout_dmabuf(), however
> in the gtk ui both implementations dropped it when doing the next
> scanout_texture call.
>
> Fixes flipped linux console using vhost-user-gpu with the gtk ui
> display.
>
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>




> ---
>  ui/gtk-egl.c     | 2 +-
>  ui/gtk-gl-area.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index e84431790c..557668e418 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -256,7 +256,7 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl=
,
>      }
>
>      gd_egl_scanout_texture(dcl, dmabuf->texture,
> -                           false, dmabuf->width, dmabuf->height,
> +                           dmabuf->y0_top, dmabuf->width, dmabuf->height=
,
>                             0, 0, dmabuf->width, dmabuf->height);
>
>      if (dmabuf->allow_fences) {
> diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
> index 7696df1f6b..c384a1516b 100644
> --- a/ui/gtk-gl-area.c
> +++ b/ui/gtk-gl-area.c
> @@ -298,7 +298,7 @@ void gd_gl_area_scanout_dmabuf(DisplayChangeListener
> *dcl,
>      }
>
>      gd_gl_area_scanout_texture(dcl, dmabuf->texture,
> -                               false, dmabuf->width, dmabuf->height,
> +                               dmabuf->y0_top, dmabuf->width,
> dmabuf->height,
>                                 0, 0, dmabuf->width, dmabuf->height);
>
>      if (dmabuf->allow_fences) {
> --
> 2.39.2
>
>

--00000000000096e20805f52568cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 20, 2023 at 9:56 PM Erico=
 Nunes &lt;<a href=3D"mailto:ernunes@redhat.com">ernunes@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The dmab=
uf-&gt;y0_top flag is passed to .dpy_gl_scanout_dmabuf(), however<br>
in the gtk ui both implementations dropped it when doing the next<br>
scanout_texture call.<br>
<br>
Fixes flipped linux console using vhost-user-gpu with the gtk ui<br>
display.<br>
<br>
Signed-off-by: Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com" target=
=3D"_blank">ernunes@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk-egl.c=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0ui/gtk-gl-area.c | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c<br>
index e84431790c..557668e418 100644<br>
--- a/ui/gtk-egl.c<br>
+++ b/ui/gtk-egl.c<br>
@@ -256,7 +256,7 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,<=
br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0gd_egl_scanout_texture(dcl, dmabuf-&gt;texture,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0false, dmabuf-&gt;width, dmabuf-&gt;height,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dmabuf-&gt;y0_top, dmabuf-&gt;width, dmabuf-&gt;hei=
ght,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0, 0, dmabuf-&gt;width, dmabuf-&gt;height);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dmabuf-&gt;allow_fences) {<br>
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c<br>
index 7696df1f6b..c384a1516b 100644<br>
--- a/ui/gtk-gl-area.c<br>
+++ b/ui/gtk-gl-area.c<br>
@@ -298,7 +298,7 @@ void gd_gl_area_scanout_dmabuf(DisplayChangeListener *d=
cl,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0gd_gl_area_scanout_texture(dcl, dmabuf-&gt;texture,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false, dmabuf-&gt;width, dmabuf-&gt;h=
eight,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmabuf-&gt;y0_top, dmabuf-&gt;width, =
dmabuf-&gt;height,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0, dmabuf-&gt;width, dmabuf-&gt;h=
eight);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (dmabuf-&gt;allow_fences) {<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--00000000000096e20805f52568cf--


