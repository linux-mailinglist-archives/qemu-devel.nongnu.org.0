Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0384686000
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 07:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN6k3-000777-Oa; Wed, 01 Feb 2023 01:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN6jw-00076c-1k; Wed, 01 Feb 2023 01:37:04 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN6jt-0008S7-P8; Wed, 01 Feb 2023 01:37:03 -0500
Received: by mail-ej1-x631.google.com with SMTP id hx15so28835013ejc.11;
 Tue, 31 Jan 2023 22:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6xttjhg1EkEM5Km8fh/iM+JYDGcTWhp1TGEZkbucWw=;
 b=UwJys4FRvCEnPI17L1FhrA9TMq/5MufmsSVEjhTNyD79xog5OoHau6asNbhGHq1FVs
 dhY4BvnocWshJR6DhchuaiHS2HRKUAeBEL4hM+ZlUyxoN5ci95Xqt0QReZWhNndZ0BHs
 igNyvkDaU4xGuVc1E8GQ+FoIwyt96ss6lIJQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6xttjhg1EkEM5Km8fh/iM+JYDGcTWhp1TGEZkbucWw=;
 b=GmMXPkSS1q1eJF2uyP5Djf51dfIIqHXaauaNdQK2fzP40Y8dA367Ze0Db5m5qZoPF+
 mkKEFy3Em/E7jiUFwpLCH+bLpmfukss63wJTPB2ni0NjD2lSHiWbICW1HqSbq0Wtlute
 IY5FRSEM0OYwz6Udpbt2m1/xaXm6svtWuSTE9NWo/MuGOqIcC7R9lou4tEQ9XOX7SyaS
 GX5tHiqcOmaz1DoEyVUdVEOrYrLKeIcVWwBKig5eTi8IhYCQBrnkXus1uiUjYI7I8RzG
 5el27sKfF7hdgXF7NUgWkmbBC7wGAkAdcoismTUTFjoYzY2BUV7z9w100cOZWFEinf34
 p1bA==
X-Gm-Message-State: AO0yUKX4SXiJcmCO4ncBwwcLpO6800XI3NSAIGZ+1SGEguWHvXc6DRkH
 2PXWxLkGeeog80HS7XmISd3bdC8yNKnFHf6cHEoWBULO
X-Google-Smtp-Source: AK7set9UwdgwP0ASdzMKfS9hBhG+qFd8fnopktqiIwXSguc7f9jji0nQVekP91D3FtApBV1C3V0j0oevmwMiW79/Uhk=
X-Received: by 2002:a17:907:2391:b0:87f:5802:fd72 with SMTP id
 vf17-20020a170907239100b0087f5802fd72mr293671ejb.237.1675230049990; Tue, 31
 Jan 2023 21:40:49 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-6-clg@kaod.org>
In-Reply-To: <20230119123449.531826-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:40:37 +0000
Message-ID: <CACPK8Xd_V-SMDidG7c9Z5578Nq8oc5sakRW10Vm9Wq_+uGLBuQ@mail.gmail.com>
Subject: Re: [PATCH 05/25] m25p80: Add the is25wp256 SFPD table
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>, Michael Walle <michael@walle.cc>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 at 12:36, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
>
> Generated from hardware using the following command and then padding
> with 0xff to fill out a power-of-2:
>         xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20221221122213.1458540-1-linux@roeck-us.net>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I wonder if we could update the code so the padding is assumed.

> ---
>  hw/block/m25p80_sfdp.h |  2 ++
>  hw/block/m25p80.c      |  3 ++-
>  hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index df7adfb5ce..011a880f66 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -26,4 +26,6 @@ uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
>
>  uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
>
> +uint8_t m25p80_sfdp_is25wp256(uint32_t addr);
> +
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 68a757abf3..dc5ffbc4ff 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -222,7 +222,8 @@ static const FlashPartInfo known_devices[] =3D {
>      { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
>      { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
>      { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
> -    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K),
> +      .sfdp_read =3D m25p80_sfdp_is25wp256 },
>
>      /* Macronix */
>      { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 77615fa29e..b33811a4f5 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -330,3 +330,43 @@ static const uint8_t sfdp_w25q01jvq[] =3D {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(w25q01jvq);
> +
> +/*
> + * Integrated Silicon Solution (ISSI)
> + */
> +
> +static const uint8_t sfdp_is25wp256[] =3D {
> +    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
> +    0x00, 0x06, 0x01, 0x10, 0x30, 0x00, 0x00, 0xff,
> +    0x9d, 0x05, 0x01, 0x03, 0x80, 0x00, 0x00, 0x02,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xf9, 0xff, 0xff, 0xff, 0xff, 0x0f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x80, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
> +    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0xff, 0x23, 0x4a, 0xc9, 0x00,
> +    0x82, 0xd8, 0x11, 0xce, 0xcc, 0xcd, 0x68, 0x46,
> +    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xae, 0xd5, 0x5c,
> +    0x4a, 0x42, 0x2c, 0xff, 0xf0, 0x30, 0xfa, 0xa9,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0x50, 0x19, 0x50, 0x16, 0x9f, 0xf9, 0xc0, 0x64,
> +    0x8f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(is25wp256);
> --
> 2.39.0
>
>

