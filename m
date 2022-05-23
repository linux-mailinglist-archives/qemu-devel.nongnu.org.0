Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616D9531147
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:17:38 +0200 (CEST)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8sL-0005P9-7K
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8pj-0003kI-2h
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:14:55 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:46528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8ph-0007s5-GC
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:14:54 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ff39b44b06so149249387b3.13
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2s/ym3qOHJmqG3ZdN+zD+tY8bcJl2nSDaLvl5Z/ACQU=;
 b=l6HBL4h9S9JF9w27Ak67mQCbAPqOeVk15ISsvnHoRYTD2XdIL1ptEypjFu4ncUIwfu
 +Sqhj31zza/oANJ35H2nGs+JEAcMd29s+tBWcBFVYfWYul4/aF2ghaEvZONCQ90iatwz
 dRaokLjGhujw1IUW5ztIDj0R8kCNWx2Iq6SUc3KBGAwiDQaV8j4kl3nzEw8Brfc48ntb
 OlsxFOnWY0M/EySRRTE+5JWp4UQKItIFLzIuDsdkBfNcStI4VyGR1FKg+fMB1jtb3g3D
 gk1d6mQ4/ym891bxsY0l6qNIf2uBu6cJ5ji2zNAk03beT4LnjcCcmyQDNwhJeFUYhGKc
 lrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2s/ym3qOHJmqG3ZdN+zD+tY8bcJl2nSDaLvl5Z/ACQU=;
 b=rbXXEV4+gBAQPKj9qDXsJNlFF8YuviHXGDuekKjJ+i2oHklBL4zvk3qwY5k8Zc9XVh
 tMm46U6sINTV0yCi/+cygVtmt6nUVOkS1AYm7BDPNzI+aU1qbB4GJTL0mGX84lhjCyH+
 UUn5vpS3FqwgaMGrsDgXUc2mVa46/fHKml+NxRvAUMLbvTopS/ij1rbVrINNIZfmVaaH
 q69853ZjsJtCxsH42nEAIDCSuAr3JpI/d0laIQ93Safxwv+OrWHqrhtdl1/hDxqQEyqf
 15IWKavH7UzsnjrWg0anj5Y98RVQhdyCEapzjVNye5mdcFI80KJTbzcr2fVj6HdmoZ+A
 zIYw==
X-Gm-Message-State: AOAM533RDgoOMIPBNMuPlPBe0Hb/9iOHKFII6H1HfrEZVqSA/T2GtPYY
 5yzrYSU0cxlmAcJWzU0UM+8187z2Me2plkxqJztJPQ==
X-Google-Smtp-Source: ABdhPJwEYE/aVQkvjHq0EG0s7owgkobplsEH+6zZmbg5yRx+17ew6TlyKjDmrMHZNNDN4sYolMhNHbVediug2gedaro=
X-Received: by 2002:a0d:e903:0:b0:2ff:43a3:90c8 with SMTP id
 s3-20020a0de903000000b002ff43a390c8mr23236948ywe.455.1653315292347; Mon, 23
 May 2022 07:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220520124200.2112699-1-uwu@icenowy.me>
In-Reply-To: <20220520124200.2112699-1-uwu@icenowy.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 15:14:41 +0100
Message-ID: <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/allwinner-sdhost: report FIFO water level as 1 when
 data ready
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 May 2022 at 13:42, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> U-Boot queries the FIFO water level to reduce checking status register
> when doing PIO SD card operation.
>
> Report a FIFO water level of 1 when data is ready, to prevent the code
> from trying to read 0 words from the FIFO each time.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  hw/sd/allwinner-sdhost.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index 041e45c680..b66fd9bce7 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -114,7 +114,9 @@ enum {
>  };
>
>  enum {
> +    SD_STAR_FIFO_EMPTY      = (1 << 2),
>      SD_STAR_CARD_PRESENT    = (1 << 8),
> +    SD_STAR_FIFO_LEVEL_1    = (1 << 17),
>  };

Is there documentation on this hardware available somewhere?
The Linux kernel driver for it doesn't seem to have a #define
for this bit 17.

In an ideal world we'd actually emulate the FIFO itself
(our pl181 and bcm2835_sdhost models do this, for example).

-- PMM

