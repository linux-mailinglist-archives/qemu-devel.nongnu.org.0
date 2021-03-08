Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998A330689
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 04:46:47 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ6r0-0005ta-6B
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 22:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJ6pu-0005Nq-P9
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:45:38 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJ6pt-0003Z5-77
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:45:38 -0500
Received: by mail-ed1-x52a.google.com with SMTP id dm26so12543117edb.12
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 19:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qw4c5DeqbHXyeQolSCmjXmjW3AYjVNO5anziBtYFLfg=;
 b=G4GZHRlgpcjPCWRTtersLTh84AGeQo2TZc+4rIi18Sot2ebgolgCUQnm6fas8wzxxc
 iPBm3ibyAXSacDXq53QG5Io59U3dJde6PUsWVjX7OCQeCkqAuTgnc9/dvKbvsmTcNK5y
 9xWFyqNa4SLNQjrvWy919wltKUpck/oxou1xZPF+c1FmU8LlI5mlPN1o6IKjX4LH9j7l
 cqOgxC03YGLL8mirDLK9PgaaUyFKeF1Baqa7Em4wuyWDF/1D6ltrbD1lRueSLbZa2Atr
 G7DYLRCwv75oHzS0+UrYw8V2tY1y2tTfhVLX+zq5OrAKIalknaBEJNZPvAEtm80gejhg
 scMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qw4c5DeqbHXyeQolSCmjXmjW3AYjVNO5anziBtYFLfg=;
 b=XZh5H1Cd8Q5sPWumvCRHym2p09e7aiPF1H3RcdzN6XzyvwOgH6PBsgzC5Jdn/loJyb
 GNfuo6rqG454l7k2CjKT9v7TgFSCzzt1DmU7OzlupwK0KQqPLuoCmdytOynxJwXto8df
 mn5S1p34/Yh+34I3GYQbYsjflxKurJxc+KF96dCeBjfDgSdiNQi6BrxRQHPIni1MX1LF
 q38ZNMDwlKfaNAfTysgoAKV4OpONWJBGryYbfgqddgTTgfBneIOaiBo2gTNp8YOgqrUd
 H3XB0QfvauUFECE2WUrsp4y3YKJlHxKDsWo1iVI1RUCBf92PB7WWrwuSpnJZWHaPZ/Lg
 PoPA==
X-Gm-Message-State: AOAM530RTKWwqcWkco14ouIwySYAzzGgO7smam5HVPBpIDt5cOtsT7og
 lI0PUxeZpK9APb6Y08oegq4nrJX7zx34Oq8KMMY=
X-Google-Smtp-Source: ABdhPJwq6hHV54qECN53ZXi2jsaBH97K5wMU4iH6oYxvhIw99hsHync7Yj6RcOiw9CMLj44LfMBw2bMOlnjJ8+sxZds=
X-Received: by 2002:a05:6402:2d0:: with SMTP id
 b16mr20424928edx.194.1615175134756; 
 Sun, 07 Mar 2021 19:45:34 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
In-Reply-To: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 8 Mar 2021 12:45:24 +0900
Message-ID: <CAMVc7JVh9zzPs6zxjNFuxZSZzqzYu13H=9NBH6__X+h-eQivfg@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 4:57 Christian Schoenebeck <qe=
mu_oss@crudebyte.com>:
>
> DisplaySurface pointer passed to gd_switch() can be NULL, so check this
> before trying to dereference it.
>
> Fixes: c821a58ee7 ("ui/console: Pass placeholder surface to display")
> Reported-by: Coverity (CID 1448421)
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  ui/gtk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 3edaf041de..a27b27d004 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -567,7 +567,7 @@ static void gd_switch(DisplayChangeListener *dcl,
>      }
>      vc->gfx.ds =3D surface;
>
> -    if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
> +    if (surface && surface->format =3D=3D PIXMAN_x8r8g8b8) {
>          /*
>           * PIXMAN_x8r8g8b8 =3D=3D CAIRO_FORMAT_RGB24
>           *
> @@ -580,7 +580,7 @@ static void gd_switch(DisplayChangeListener *dcl,
>               surface_width(surface),
>               surface_height(surface),
>               surface_stride(surface));
> -    } else {
> +    } else if (surface) {
>          /* Must convert surface, use pixman to do it. */
>          vc->gfx.convert =3D pixman_image_create_bits(PIXMAN_x8r8g8b8,
>                                                     surface_width(surface=
),
> --
> 2.20.1
>

When will the DisplaySurface pointer passed to gd_switch() be NULL?
Also, it affects other displays so it should be fixed in ui/console.c,
or fix all relevant displays.

