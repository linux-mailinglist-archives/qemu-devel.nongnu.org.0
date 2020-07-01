Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F421012F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 03:03:49 +0200 (CEST)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqRAC-0004uZ-1e
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 21:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqR94-0003rU-Ns; Tue, 30 Jun 2020 21:02:38 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:46159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqR93-0002AX-2G; Tue, 30 Jun 2020 21:02:38 -0400
Received: by mail-il1-x143.google.com with SMTP id a6so2830991ilq.13;
 Tue, 30 Jun 2020 18:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vq3Ye6+ixYUl8G3eozsMz28+mjGSZgqXYVHucg7p8xc=;
 b=ZAao25qzlJWaXpBfhZPDSMQ3inFcB0D/0Aqma5geioJfMVZ3T/NUMdl/QRYo//3E9N
 JE/NGFiYyhgdfegDxwJ2KYsYgBdsSzKiBG+YYxyp7yiV3uEnnN53CQiU2Ru6vUh0zQBm
 AYztqqpTcvWTXtSZAyyPkGOcK1L1IS9wwMdLvHD3LTGkCS3QP1I1T5EfnRbfU6KxYO5m
 4wCCcmgqy4+zaQC3n9Ce1ko0iovzGQdUaP8bu8hA+23UgB5Uhz4ENW0sDa2wuxVoTD+G
 6cfGmm+rkoM35GsUVBJHbrSi8Ctj4OsJIXlD/uB6bFVDpAgogPRLNhP00fwHN76l1Hkn
 eldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vq3Ye6+ixYUl8G3eozsMz28+mjGSZgqXYVHucg7p8xc=;
 b=M4iZGFUpcv4hKRQu/7pDfQoy8hfT92JretOgImuwEWTsLE4KQ7ftsuv64dJ0VRa7I3
 KuaXdrn+oviXkaUHxeAxMPTw8eQ5t6wrHmbUPX7skNZVtzW5sl5srrEzgc8hqyoTNHom
 hTfCXrPezP7qr5aXdWyoX4/c5y/VcKhrpd7NHxtHe0Vqiya1xGsn5pKFLoNihD2wbEx0
 xaPboe/muAdcBF/5tb8r/MiAIMZZeqDyCcp4RiKBgW6t6J1CRL6D5ZCO0skE2+pI2w/N
 L+9Kf0cZjgJhsgZKsrPFThi1j+M2DtKbKJLvkt3n6SHW74JN9jobDiB3Z1AofgFadXl1
 JU4w==
X-Gm-Message-State: AOAM531levdP6Z7rUA6uEF6nk+hCig2+/J5PZ6LsgtSjdrKtrmToi8y4
 3SPGQWCRWx2zcHBR4NlauRxhgWJrTcAQIX/NwK4=
X-Google-Smtp-Source: ABdhPJx+FB3ZoDbusEeYP6mNR/M8SuSq6vUUSWfrGkBIKNJkNRDH4Q3VT4++ZFzqIoWDzOjnEiy8WnyQhShXPDNZ7ow=
X-Received: by 2002:a92:bb84:: with SMTP id x4mr5593365ilk.177.1593565355778; 
 Tue, 30 Jun 2020 18:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-16-peter.maydell@linaro.org>
In-Reply-To: <20200628142429.17111-16-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jun 2020 17:52:51 -0700
Message-ID: <CAKmqyKPESaqQGAHJ4bPMapgm_nKQUujrcR7nXCYpaG8sERTxkA@mail.gmail.com>
Subject: Re: [PATCH 15/17] hw/arm/pxa2xx_pic: Use LOG_GUEST_ERROR for bad
 guest register accesses
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 28, 2020 at 7:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Instead of using printf() for logging guest accesses to invalid
> register offsets in the pxa2xx PIC device, use the usual
> qemu_log_mask(LOG_GUEST_ERROR,...).
>
> This was the only user of the REG_FMT macro in pxa.h, so we can
> remove that.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/pxa.h | 1 -
>  hw/arm/pxa2xx_pic.c  | 9 +++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
> index f6dfb5c0cf0..8843e5f9107 100644
> --- a/include/hw/arm/pxa.h
> +++ b/include/hw/arm/pxa.h
> @@ -184,7 +184,6 @@ struct PXA2xxI2SState {
>  };
>
>  # define PA_FMT                        "0x%08lx"
> -# define REG_FMT               "0x" TARGET_FMT_plx
>
>  PXA2xxState *pxa270_init(MemoryRegion *address_space, unsigned int sdram_size,
>                           const char *revision);
> diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
> index 105c5e63f2f..ceee6aa48db 100644
> --- a/hw/arm/pxa2xx_pic.c
> +++ b/hw/arm/pxa2xx_pic.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> +#include "qemu/log.h"
>  #include "cpu.h"
>  #include "hw/arm/pxa.h"
>  #include "hw/sysbus.h"
> @@ -166,7 +167,9 @@ static uint64_t pxa2xx_pic_mem_read(void *opaque, hwaddr offset,
>      case ICHP: /* Highest Priority register */
>          return pxa2xx_pic_highest(s);
>      default:
> -        printf("%s: Bad register offset " REG_FMT "\n", __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "pxa2xx_pic_mem_read: bad register offset 0x%" HWADDR_PRIx
> +                      "\n", offset);
>          return 0;
>      }
>  }
> @@ -199,7 +202,9 @@ static void pxa2xx_pic_mem_write(void *opaque, hwaddr offset,
>          s->priority[32 + ((offset - IPR32) >> 2)] = value & 0x8000003f;
>          break;
>      default:
> -        printf("%s: Bad register offset " REG_FMT "\n", __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "pxa2xx_pic_mem_write: bad register offset 0x%"
> +                      HWADDR_PRIx "\n", offset);
>          return;
>      }
>      pxa2xx_pic_update(opaque);
> --
> 2.20.1
>
>

