Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55140695A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:54:46 +0200 (CEST)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdF7-0006gG-8o
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mOdDj-00060O-Gx
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:53:19 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mOdDh-0005a4-RJ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:53:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g74so779171wmg.5
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oQZh9s3yOaG5nbnCI4Vp5UwwdSMyB08g0Q6v7PDzNc=;
 b=FbGbpAXMNGTETZ4VDHwOhOJb6gp88uqNlzkV2fAYivjw2dYlrH3XSWp7ooWerFn7Uz
 HZuIbUWMB3mAMfY70FtV95uJPO092eLzkLaByxim1EcJxtC9EZUAGU9YdxDBe/+ctPyh
 daI7CrzPNWE8YXB2xvi1SybbG5vzw33GB8bDMyuk2Y6IdC1Tp2pxnty8srAd5EZr3jNi
 hLubJp+gF+EngkStYU+8u6WyNS4Fo//8dndRnV4gmJdBdztZGqGnip0qRmaKuafV2wxn
 32Up43z6EyuqWm4oTVpoEKiHFXVKUApmE4zkmO5AreXXLbZyJDLExZOsv/f9DWQQH9Yk
 MzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oQZh9s3yOaG5nbnCI4Vp5UwwdSMyB08g0Q6v7PDzNc=;
 b=gs1UTsGu5Ij5LJvNsuwwCPByHuXPdWtKmvPHuIUjsmyn5YRfOIU5qamwpcXIeVX3bD
 yUSCl8xR4JawP8lKfn0agYgtcYh1v3bRbR9Bjv7CRWezGG1+0wmnEEUQxMaVY8c3KSiW
 oc9i8vlFOCuNopHz3Q6js1210jv6RegOLOf/e37f4vNEQP8ioG4dTmSvnfzkcahE7zvr
 sO7XX77yQp/Km7YqhHZuvkaUbODLUCygMscG7DM4s4OTFwamP/OC99DW1y7MvY/rmq7y
 2haUDeFcmP43vPXsUVvJbXu3Q/lX2k7XwVAfuWss/IjNxUXLQVvsqd26dfOQseJPbmZW
 pB+Q==
X-Gm-Message-State: AOAM531VowLit9UM4YuQcc9MMwYOTyQW9NX/vYhxkuWtrpCN2+4TLojp
 OeJ3Y4XeFW9jytxIIFGhiMjrAVRbv+izL+KEwRQ=
X-Google-Smtp-Source: ABdhPJzjMV6ESDcNkUg+5YPmiYJSLpdVv045vEcIKANKbScQ53t0VbUxCQdjKWBuYn1mt86M0AIu84TumQh+0V0LgGE=
X-Received: by 2002:a1c:f206:: with SMTP id s6mr7390524wmc.15.1631267595762;
 Fri, 10 Sep 2021 02:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210910094203.3582378-1-kraxel@redhat.com>
In-Reply-To: <20210910094203.3582378-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 10 Sep 2021 13:53:03 +0400
Message-ID: <CAJ+F1C+9Nt-7x7CLvpWcq-wx4_4VJ6fdTzURN+GsOc3cagTbsQ@mail.gmail.com>
Subject: Re: [PATCH] qxl: fix pre-save logic
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009440ea05cba11596"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009440ea05cba11596
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 1:43 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Oops.  Logic is backwards.
>
> Fixes: 39b8a183e2f3 ("qxl: remove assert in qxl_pre_save.")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/610
> Resolves: https://bugzilla.redhat.com//show_bug.cgi?id=3D2002907
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Argh..
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/display/qxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 43482d4364ba..29c80b4289b7 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2252,7 +2252,7 @@ static int qxl_pre_save(void *opaque)
>      } else {
>          d->last_release_offset =3D (uint8_t *)d->last_release - ram_star=
t;
>      }
> -    if (d->last_release_offset < d->vga.vram_size) {
> +    if (d->last_release_offset >=3D d->vga.vram_size) {
>          return 1;
>      }
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009440ea05cba11596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 10, 2021 at 1:43 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Oops.=C2=
=A0 Logic is backwards.<br>
<br>
Fixes: 39b8a183e2f3 (&quot;qxl: remove assert in qxl_pre_save.&quot;)<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/610" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/610</a><br>
Resolves: <a href=3D"https://bugzilla.redhat.com//show_bug.cgi?id=3D2002907=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com//show_bu=
g.cgi?id=3D2002907</a><br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Argh..</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/qxl.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
index 43482d4364ba..29c80b4289b7 100644<br>
--- a/hw/display/qxl.c<br>
+++ b/hw/display/qxl.c<br>
@@ -2252,7 +2252,7 @@ static int qxl_pre_save(void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;last_release_offset =3D (uint8_t *)=
d-&gt;last_release - ram_start;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (d-&gt;last_release_offset &lt; d-&gt;vga.vram_size) {<br=
>
+=C2=A0 =C2=A0 if (d-&gt;last_release_offset &gt;=3D d-&gt;vga.vram_size) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009440ea05cba11596--

