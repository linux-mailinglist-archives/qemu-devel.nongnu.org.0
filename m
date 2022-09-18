Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA985BBF53
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 20:33:35 +0200 (CEST)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZz6k-0007ba-3F
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 14:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZz5E-0005MH-Lw
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 14:32:00 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZz5C-0004YI-FX
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 14:32:00 -0400
Received: by mail-vs1-f42.google.com with SMTP id p4so9635502vsa.9
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 11:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rkbkgy/UPzxBtcdSCvh87xK7UPrqaoSB7OYsqVMiBzo=;
 b=LsjIibsBn1TIurSfgm96sdyNNFsPb92mjhoVUmwTnqP/bj789/r0MQamCqqBM3n4Wd
 FP4Jpp9Q5Ob/ua+13cGuWFmCAOByVqExUHi8hPGMXXtNHdyA1tvMbi7TZZkFpAL2bEEf
 vyawa76SPjjndc3r4ZHXSLuRfMGrQ5x7JZzSRP6LF8UQdUVUpzb3q3XpqRiMW3CCRod0
 1MZC0TvAEgWCEY/Zb0JXBVMpbp0bG7FkSOxb3Lf7ejvjvQzT85YwS5WS50R9+JL1jOo1
 J7dOHa325L+k6Qo0ZKr6k1FW/JSak4VPknHekM5yRWL5c7az9FVryLbu6c+ZvX4zC2Lh
 bHxA==
X-Gm-Message-State: ACrzQf0NXqBVaNfN2CJVyclKoGbFoqnx1+ne/lCiSc/pszsMPsI+r9rD
 tEyLmNBBoRfvCSW3m6pnLIkpAmu3mZUPqerfd8c=
X-Google-Smtp-Source: AMsMyM7MzaI7J7XdlzlCGXOfMKLVwhQ0L4Vx18rKjbihla/bxfpqAKxVdg0naN2nPscp9TOocbxZgPEsXVTgfIH/89Q=
X-Received: by 2002:a67:e085:0:b0:398:30a7:3be5 with SMTP id
 f5-20020a67e085000000b0039830a73be5mr4919079vsl.45.1663525917213; Sun, 18 Sep
 2022 11:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220918162308.25191-1-vr_qemu@t-online.de>
In-Reply-To: <20220918162308.25191-1-vr_qemu@t-online.de>
Date: Sun, 18 Sep 2022 20:31:45 +0200
Message-ID: <CAAdtpL5Hy=H7mN0rNPf3kgtOYp7GVNwwo0H35Tp65sCi77+8tg@mail.gmail.com>
Subject: Re: [PATCH] ui/console: fix three double frees in png_save()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, 
 Kshitij Suri <kshitij.suri@nutanix.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.42;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

+Kshitij

On Sun, Sep 18, 2022 at 6:24 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> The png_destroy_write_struct() function frees all memory used by
> libpng. Don't use the glib auto cleanup mechanism to free the
> memory allocated by libpng again. For the pixman image, use only the
> auto cleanup mechanism and remove the qemu_pixman_image_unref()
> function call to prevent another double free.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1210
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  ui/console.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 765892f84f..030e75bc71 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -304,8 +304,8 @@ static bool png_save(int fd, pixman_image_t *image, E=
rror **errp)
>  {
>      int width =3D pixman_image_get_width(image);
>      int height =3D pixman_image_get_height(image);
> -    g_autofree png_struct *png_ptr =3D NULL;
> -    g_autofree png_info *info_ptr =3D NULL;
> +    png_struct *png_ptr;
> +    png_info *info_ptr =3D NULL;

No need to NULL-initialize.

Fixes: 9a0a119a38 ("Added parameter to take screenshot with screendump as P=
NG")
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>      g_autoptr(pixman_image_t) linebuf =3D
>                              qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, =
width);
>      uint8_t *buf =3D (uint8_t *)pixman_image_get_data(linebuf);
> @@ -346,7 +346,6 @@ static bool png_save(int fd, pixman_image_t *image, E=
rror **errp)
>          qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
>          png_write_row(png_ptr, buf);
>      }
> -    qemu_pixman_image_unref(linebuf);
>
>      png_write_end(png_ptr, NULL);
>
> --
> 2.35.3
>
>

