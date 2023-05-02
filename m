Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468616F4A73
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:38:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvo5-0007Ib-PK; Tue, 02 May 2023 15:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ptvo4-0007Hq-49
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ptvo2-0002wl-E4
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683056216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9KuBUMzDoH7uXTxbHO+yxd7G2m2wxkZfxL6w1uD4/U=;
 b=jRou0IXXgqpOEDqzs/tgiiYA+uGtk/OrdD5uWTwTY3h7pMGgkP7dXELMD9AeVHegwyMg33
 c6LKIzPSyXBc37jxEIgZcCoxCjxDCp3XcFgu/QaxmEhURxHf0S2ML89M9XHLseT1J0KJ9F
 NqKwVdHIOH4RVke5H58xVOyrdnXIw0Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-fR1JyGDpPnK8wAyukVLpCQ-1; Tue, 02 May 2023 15:36:54 -0400
X-MC-Unique: fR1JyGDpPnK8wAyukVLpCQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50bcd24504eso2016973a12.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 12:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683056213; x=1685648213;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z9KuBUMzDoH7uXTxbHO+yxd7G2m2wxkZfxL6w1uD4/U=;
 b=WB8excEg8ShL6DSGD6l4bxuOJr3WcD4K0jyRx5q9QzCxtMgAPQgKLRFV+xkSdbGVEZ
 dY7JETwVksPYLYJ4ZyvbOg020G8ZEJt4J8fKEJr0xpIx7vlU44I/FdoW/11vqJkumjYV
 Rby3ItkO8bwNF4rrw+P2ZoGl/4RVhOqVziURkk6tw05A/V4uQ90fbkaxPo4ZXYOu8153
 SX3by1nm7QW9/JDAbBa7k94SeFTN7+SDlKDrgKxRC0Ot6PKl2/APbRmExLjnFQf7iMPt
 /l4b3LAditAT8M86nw2rwGUA/CyVtGhd5eQq3oaJCAZ4pjcMb+8i0OoPIwr/p2qd2WaQ
 Ve/Q==
X-Gm-Message-State: AC+VfDzVO+vuT0dlLQfCI+c0jlfovQyU59LprEvNZt+a1wkaSRlK0EJU
 Xs1eS2xVyUCsVkF50SCvU1+7teCO92RsUh5av8AKuzyV5li2/41epdoh79QuTN/7sO4wmzK1Tzn
 aMWf3OOZt3WdZ+2Swu0qsj9mb1ei8aSY=
X-Received: by 2002:aa7:cd8c:0:b0:506:be3f:ebb1 with SMTP id
 x12-20020aa7cd8c000000b00506be3febb1mr9913262edv.26.1683056213063; 
 Tue, 02 May 2023 12:36:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+geHfUbDmKQQlFEtIBONg4epabCtvMzNu7dZ31RV9l9heh+rKvwy0GdgYdWlRUENuKD7QjmpFAmPKb95nRzc=
X-Received: by 2002:aa7:cd8c:0:b0:506:be3f:ebb1 with SMTP id
 x12-20020aa7cd8c000000b00506be3febb1mr9913244edv.26.1683056212820; Tue, 02
 May 2023 12:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230502135548.2451309-1-peter.maydell@linaro.org>
In-Reply-To: <20230502135548.2451309-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 2 May 2023 23:36:41 +0400
Message-ID: <CAMxuvayLKQAaRyZZXdgKvAJtgwRcxsFUnQ-S5yB8qBRvJrgrRg@mail.gmail.com>
Subject: Re: [PATCH] ui: Fix pixel colour channel order for PNG screenshots
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Kshitij Suri <kshitij.suri@nutanix.com>
Content-Type: multipart/alternative; boundary="000000000000b3db9905fabb0ff4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000b3db9905fabb0ff4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 2, 2023 at 5:56=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> When we take a PNG screenshot the ordering of the colour channels in
> the data is not correct, resulting in the image having weird
> colouring compared to the actual display.  (Specifically, on a
> little-endian host the blue and red channels are swapped; on
> big-endian everything is wrong.)
>
> This happens because the pixman idea of the pixel data and the libpng
> idea differ.  PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,
> with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bits
> 0-7.  This means that on little-endian systems the bytes in memory
> are
>    B G R A
> and on big-endian systems they are
>    A R G B
>
> libpng, on the other hand, thinks of pixels as being a series of
> values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA
> always wants bytes in the order
>    R G B A
>
> This isn't the same as the pixman order for either big or little
> endian hosts.
>
> The alpha channel is also unnecessary bulk in the output PNG file,
> because there is no alpha information in a screenshot.
>
> To handle the endianness issue, we already define in ui/qemu-pixman.h
> various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent
> byte-order pixel channel formats.  So we can use PIXMAN_BE_r8g8b8 and
> PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of
>     R G B
> and 3 bytes per pixel.
>
> (PPM format screenshots get this right; they already use the
> PIXMAN_BE_r8g8b8 format.)
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1622
> Fixes: 9a0a119a382867 ("Added parameter to take screenshot with screendum=
p
> as PNG")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> Disclaimer: I don't have a BE system that I have convenient
> graphics output from that I can use to test the screenshot
> format there.
> ---
>  ui/console.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 6e8a3cdc62d..e173731e205 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -311,7 +311,7 @@ static bool png_save(int fd, pixman_image_t *image,
> Error **errp)
>      png_struct *png_ptr;
>      png_info *info_ptr;
>      g_autoptr(pixman_image_t) linebuf =3D
> -                            qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8,
> width);
> +        qemu_pixman_linebuf_create(PIXMAN_BE_r8g8b8, width);
>      uint8_t *buf =3D (uint8_t *)pixman_image_get_data(linebuf);
>      FILE *f =3D fdopen(fd, "wb");
>      int y;
> @@ -341,7 +341,7 @@ static bool png_save(int fd, pixman_image_t *image,
> Error **errp)
>      png_init_io(png_ptr, f);
>
>      png_set_IHDR(png_ptr, info_ptr, width, height, 8,
> -                 PNG_COLOR_TYPE_RGB_ALPHA, PNG_INTERLACE_NONE,
> +                 PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
>                   PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);
>
>      png_write_info(png_ptr, info_ptr);
> --
> 2.34.1
>
>

--000000000000b3db9905fabb0ff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 2, 2023 at 5:56=E2=80=AFP=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">When we take a PNG screenshot the ordering of the colour chann=
els in<br>
the data is not correct, resulting in the image having weird<br>
colouring compared to the actual display.=C2=A0 (Specifically, on a<br>
little-endian host the blue and red channels are swapped; on<br>
big-endian everything is wrong.)<br>
<br>
This happens because the pixman idea of the pixel data and the libpng<br>
idea differ.=C2=A0 PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,<b=
r>
with A in bits 24-31, R in bits 16-23, G in bits 8-15 and B in bits<br>
0-7.=C2=A0 This means that on little-endian systems the bytes in memory<br>
are<br>
=C2=A0 =C2=A0B G R A<br>
and on big-endian systems they are<br>
=C2=A0 =C2=A0A R G B<br>
<br>
libpng, on the other hand, thinks of pixels as being a series of<br>
values for each channel, so its format PNG_COLOR_TYPE_RGB_ALPHA<br>
always wants bytes in the order<br>
=C2=A0 =C2=A0R G B A<br>
<br>
This isn&#39;t the same as the pixman order for either big or little<br>
endian hosts.<br>
<br>
The alpha channel is also unnecessary bulk in the output PNG file,<br>
because there is no alpha information in a screenshot.<br>
<br>
To handle the endianness issue, we already define in ui/qemu-pixman.h<br>
various PIXMAN_BE_* and PIXMAN_LE_* values that give consistent<br>
byte-order pixel channel formats.=C2=A0 So we can use PIXMAN_BE_r8g8b8 and<=
br>
PNG_COLOR_TYPE_RGB, which both have an in-memory byte order of<br>
=C2=A0 =C2=A0 R G B<br>
and 3 bytes per pixel.<br>
<br>
(PPM format screenshots get this right; they already use the<br>
PIXMAN_BE_r8g8b8 format.)<br>
<br>
Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-stable=
@nongnu.org</a><br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1622" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/1622</a><br>
Fixes: 9a0a119a382867 (&quot;Added parameter to take screenshot with screen=
dump as PNG&quot;)<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Disclaimer: I don&#39;t have a BE system that I have convenient<br>
graphics output from that I can use to test the screenshot<br>
format there.<br>
---<br>
=C2=A0ui/console.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index 6e8a3cdc62d..e173731e205 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -311,7 +311,7 @@ static bool png_save(int fd, pixman_image_t *image, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0png_struct *png_ptr;<br>
=C2=A0 =C2=A0 =C2=A0png_info *info_ptr;<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(pixman_image_t) linebuf =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_pixman_linebuf_create(PIXMAN_BE_r8g8b8, w=
idth);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *buf =3D (uint8_t *)pixman_image_get_data(lineb=
uf);<br>
=C2=A0 =C2=A0 =C2=A0FILE *f =3D fdopen(fd, &quot;wb&quot;);<br>
=C2=A0 =C2=A0 =C2=A0int y;<br>
@@ -341,7 +341,7 @@ static bool png_save(int fd, pixman_image_t *image, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0png_init_io(png_ptr, f);<br>
<br>
=C2=A0 =C2=A0 =C2=A0png_set_IHDR(png_ptr, info_ptr, width, height, 8,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PNG_COLOR_TY=
PE_RGB_ALPHA, PNG_INTERLACE_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PNG_COLOR_TY=
PE_RGB, PNG_INTERLACE_NONE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PNG_COMPRESS=
ION_TYPE_BASE, PNG_FILTER_TYPE_BASE);<br>
<br>
=C2=A0 =C2=A0 =C2=A0png_write_info(png_ptr, info_ptr);<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000b3db9905fabb0ff4--


