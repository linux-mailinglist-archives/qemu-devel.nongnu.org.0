Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31770245180
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 18:48:21 +0200 (CEST)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6zLw-0003aR-8M
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 12:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1k6zKP-00029l-Ki; Sat, 15 Aug 2020 12:46:45 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1k6zKO-0007Pz-5K; Sat, 15 Aug 2020 12:46:45 -0400
Received: by mail-oi1-x244.google.com with SMTP id l84so10993842oig.10;
 Sat, 15 Aug 2020 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yFwLmxJnp3jOYVVvDIrDmut0VUohVTnthkzH21KEIkk=;
 b=HBQer5BVwfux9u196xt8sNQtKViz/PInG8YS5j/JvmGEv/AVvltpOcwa9eKSDvCv4g
 qtb0nZyPEb4wCpvzqTNeOf12owr9PIK1Yze8k6VDaF8lH4MxsEtvQTGQU3LK/uivNrS7
 sXrV78TEiAbWmACTgdAtBwlxGp+a9YZ8ezyTou9oIzsSCMZhISc8rSHC/aSyM74XHgef
 4jxC/s464+PObf35+hndDKMkf8qJyDg6dc1Z/myKs6HL9fU03pHqoSBVwGnRjMBM9ZJB
 YR5xJHWy4eYpqsJD/ua+pmBU+0E0NvIOANEWSQvvkXrGcbOruSJq3gK2zh3taxMJgJA+
 /etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yFwLmxJnp3jOYVVvDIrDmut0VUohVTnthkzH21KEIkk=;
 b=Xg5r6+0huWWnDZB6DDeo0jt0jLQ1yTxJEHdR2WH9owS5pT/D3G45LWRbAzHrcr1wyO
 ipqLMZkA10lY9UxLMELhgrp3H74YJFbGw7L0cScL+J/IbNm1UrSOp76LVv86Z+DIGpga
 Z/ES3C/2aeS3WYb9/MNC2X7YgYyBLUriwSrVSq4I0UGHT+zfiyVjGncmQoKfhZ+hZjHG
 Vpw9Ojeyoiaipe/OOJn8lqhVfONu7ECXzYAqpV9T5Xv53M/2brT7BhjZ+qvafJw3WK/T
 fovb0RRPkTnygKlJNeqFD5HiwST7yCq7CsVUU/xS2JHssjUvHytt1lqfpdZQuyNsbzlb
 xYAg==
X-Gm-Message-State: AOAM532uCWvAfXBuD/8Pq2xBCkbYeBuDSs7pd+wAcQ0J7HeL8/0RYcto
 2RRwPvHAtnEgxyps6und1UWdfUfl4FuFHmvF3WIkAgOO34c=
X-Google-Smtp-Source: ABdhPJzzuYVetT4+ZXhwBckUjnr0zqO2Fan7+qwCeZLvdzBqJLb6ag3pJK87esozpa6kAB+Apk0RpxIPbQ+4TVtYzx0=
X-Received: by 2002:aca:fd46:: with SMTP id b67mr3337749oii.150.1597461832007; 
 Fri, 14 Aug 2020 20:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200814082841.27000-1-f4bug@amsat.org>
 <20200814082841.27000-7-f4bug@amsat.org>
In-Reply-To: <20200814082841.27000-7-f4bug@amsat.org>
From: Li Qiang <liq3ea@gmail.com>
Date: Sat, 15 Aug 2020 11:23:16 +0800
Message-ID: <CAKXe6SJ_EhUOEOaX4SH6c0o8nHZc79PYzBXDyFihbRvtMs=w=Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw/ide/pci: Replace magic '512' value by
 BDRV_SECTOR_SIZE
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Qemu Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =E4=BA=8E2020=E5=B9=B48=E6=9C=
=8814=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=884:33=E5=86=99=E9=81=93=
=EF=BC=9A
>
> Use self-explicit definitions instead of magic '512' value.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/ide/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ide/pci.c b/hw/ide/pci.c
> index 5e85c4ad17..b50091b615 100644
> --- a/hw/ide/pci.c
> +++ b/hw/ide/pci.c
> @@ -138,7 +138,7 @@ static int32_t bmdma_prepare_buf(const IDEDMA *dma, i=
nt32_t limit)
>      int l, len;
>
>      pci_dma_sglist_init(&s->sg, pci_dev,
> -                        s->nsector / (BMDMA_PAGE_SIZE / 512) + 1);
> +                        s->nsector / (BMDMA_PAGE_SIZE / BDRV_SECTOR_SIZE=
) + 1);
>      s->io_buffer_size =3D 0;
>      for(;;) {
>          if (bm->cur_prd_len =3D=3D 0) {
> --
> 2.21.3
>
>

