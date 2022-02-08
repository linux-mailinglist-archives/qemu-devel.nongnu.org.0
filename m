Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8240C4AD5E4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:04:51 +0100 (CET)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOIj-0005Oz-18
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nHO1R-0005q1-R2; Tue, 08 Feb 2022 05:46:57 -0500
Received: from [2607:f8b0:4864:20::82c] (port=42604
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nHO1N-0001Rd-Ur; Tue, 08 Feb 2022 05:46:57 -0500
Received: by mail-qt1-x82c.google.com with SMTP id s1so14327724qtw.9;
 Tue, 08 Feb 2022 02:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6uVuRGWOjq8ZvJaXqdO3OwyDPlGcjes7iAlDFFhl1Y=;
 b=BibJHtOUa8EmkYTkDGeX9XNrpamCjyDu539zYeRvvZJ2Mp2KKh0PqO2TAZtuLrjBBX
 wQF1FD0+tISS+FwCD5pMZKo2ZqnnuXzKrB8UCv3kHBoLtKbWj//Y6zmL2UNUzj8BkILL
 IQ//R5WxcsjhQO9ugUIAZ7IG8oYeFGjVaxoXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6uVuRGWOjq8ZvJaXqdO3OwyDPlGcjes7iAlDFFhl1Y=;
 b=X0xPZftMWBT3nzG/7qtanRR9kZwjEpWVRNKWetzAMgdlp1RLP+m2G8uBXqBvcvNx6f
 G8leVn13j3vEyhIv6mPbdyvjr8293jqAXXr26rpv4oz/6SEltor1YzCAmOCtwP08zC6T
 g8MchfzB4YolhxQIw2IfREr1lVlHPQ8eh9O+Ff7NbsBtDmJReWaswOiOHIZJK3PtrKqT
 SEaHr0jl+CbF+JLyo+XUNjegxgVVgAWHVI4MPpE27wJALZ4ksSDEjUc0eDT1Qe6+/ZaJ
 4DKJEi94SFdUk7ODWMoU6GDWHGfje/EZSgAajmvMfR8aJ+lWfDnEv8nbZz8nVFisQ1yd
 A4jg==
X-Gm-Message-State: AOAM5326qpsQPFndTKlXjjR+0HO5dWBteAa8ZUdCHHwLVRWESKroZm1m
 wTEDH0OiQFuG4wK7tlQm91VuXtiMslBqcpK8v6Q=
X-Google-Smtp-Source: ABdhPJzu8wG8pDJacJ5XbeqnL5UU3tNtH01J32Qww6O+EGaQb5T2u+W7/SilH2MhPQHw6mChn4VksuABqdR8ts96jLo=
X-Received: by 2002:ac8:7c4c:: with SMTP id o12mr2459305qtv.475.1644317212286; 
 Tue, 08 Feb 2022 02:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
 <20220112080937.366835-2-troy_lee@aspeedtech.com>
In-Reply-To: <20220112080937.366835-2-troy_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Feb 2022 10:46:38 +0000
Message-ID: <CACPK8XeVROgaTAKvFMC_RSYF7Kjb0ra2xS0ZeJtU-wWWo9wo3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/misc: Supporting AST2600 HACE accumulative mode
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, hailin.wu@aspeedtech.com,
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Troy,

On Wed, 12 Jan 2022 at 08:10, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Accumulative mode will supply a initial state and append padding bit at
> the end of hash stream.  However, the crypto library will padding those
> bit automatically, so ripped it off from iov array.
>
> The aspeed ast2600 acculumative mode is described in datasheet
> ast2600v10.pdf section 25.6.4:
>  1. Allocationg and initiating accumulative hash digest write buffer
>     with initial state.
>     * Since QEMU crypto/hash api doesn't provide the API to set initial
>       state of hash library, and the initial state is already setted by
>       crypto library (gcrypt/glib/...), so skip this step.
>  2. Calculating accumulative hash digest.
>     (a) When receiving the last accumulative data, software need to add
>         padding message at the end of the accumulative data. Padding
>         message described in specific of MD5, SHA-1, SHA224, SHA256,
>         SHA512, SHA512/224, SHA512/256.
>         * Since the crypto library (gcrypt/glib) already pad the
>           padding message internally.
>         * This patch is to remove the padding message which fed byguest
>           machine driver.


I tested the latest aspeed SDK u-boot, loaded form mmc (with our mmc
model that lives in Cedric's tree) and qemu crashed:

#0  0x00007fe867d44932 in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#1  0x0000557aba2b6e22 in qcrypto_glib_hash_bytesv (alg=<optimized
out>, iov=0x7fe8662ee0b0, niov=1, result=0x7fe8662ee0a8,
resultlen=0x7fe8662ee0a0, errp=0x0) at ../crypto/hash-glib.c:68
#2  0x0000557ab9f549ea in do_hash_operation (s=s@entry=0x7fe866e1b3b0,
algo=5, sg_mode=sg_mode@entry=true, acc_mode=acc_mode@entry=true) at
../hw/misc/aspeed_hace.c:161
#3  0x0000557ab9f54dd1 in aspeed_hace_write (opaque=<optimized out>,
addr=12, data=262504, size=<optimized out>) at
../hw/misc/aspeed_hace.c:260

WIthout your patch applied the HACE operation fails, as we do not have
support for accumulative mode, but we do not crash.

>
> Changes in v2:
> - Coding style
> - Add accumulative mode description in comment
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  hw/misc/aspeed_hace.c         | 43 ++++++++++++++++++++++++++++-------
>  include/hw/misc/aspeed_hace.h |  1 +
>  2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 10f00e65f4..0710f44621 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
> +#include "qemu/bswap.h"
>  #include "hw/misc/aspeed_hace.h"
>  #include "qapi/error.h"
>  #include "migration/vmstate.h"
> @@ -27,6 +28,7 @@
>
>  #define R_HASH_SRC      (0x20 / 4)
>  #define R_HASH_DEST     (0x24 / 4)
> +#define R_HASH_KEY_BUFF (0x28 / 4)
>  #define R_HASH_SRC_LEN  (0x2c / 4)
>
>  #define R_HASH_CMD      (0x30 / 4)
> @@ -94,7 +96,8 @@ static int hash_algo_lookup(uint32_t reg)
>      return -1;
>  }
>
> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
> +                              bool acc_mode)
>  {
>      struct iovec iov[ASPEED_HACE_MAX_SG];
>      g_autofree uint8_t *digest_buf;
> @@ -103,6 +106,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>
>      if (sg_mode) {
>          uint32_t len = 0;
> +        uint32_t total_len = 0;
>
>          for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
>              uint32_t addr, src;
> @@ -123,10 +127,26 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>                                          MEMTXATTRS_UNSPECIFIED, NULL);
>              addr &= SG_LIST_ADDR_MASK;
>
> -            iov[i].iov_len = len & SG_LIST_LEN_MASK;
> -            plen = iov[i].iov_len;
> +            plen = len & SG_LIST_LEN_MASK;
>              iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
>                                                  MEMTXATTRS_UNSPECIFIED);
> +
> +            if (acc_mode) {
> +                total_len += plen;
> +
> +                if (len & SG_LIST_LEN_LAST) {
> +                    /*
> +                     * In the padding message, the last 64/128 bit represents
> +                     * the total length of bitstream in big endian.
> +                     * SHA-224, SHA-256 are 64 bit
> +                     * SHA-384, SHA-512, SHA-512/224, SHA-512/256 are 128 bit
> +                     * However, we would not process such a huge bit stream.
> +                     */
> +                    plen -= total_len - (ldq_be_p(iov[i].iov_base + plen - 8) / 8);
> +                }
> +            }
> +
> +            iov[i].iov_len = plen;
>          }
>      } else {
>          hwaddr len = s->regs[R_HASH_SRC_LEN];
> @@ -210,6 +230,9 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>      case R_HASH_DEST:
>          data &= ahc->dest_mask;
>          break;
> +    case R_HASH_KEY_BUFF:
> +        data &= ahc->key_mask;
> +        break;
>      case R_HASH_SRC_LEN:
>          data &= 0x0FFFFFFF;
>          break;
> @@ -229,12 +252,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>          }
>          algo = hash_algo_lookup(data);
>          if (algo < 0) {
> -                qemu_log_mask(LOG_GUEST_ERROR,
> -                        "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> -                        __func__, data & ahc->hash_mask);
> -                break;
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                    "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
> +                    __func__, data & ahc->hash_mask);
> +            break;
>          }
> -        do_hash_operation(s, algo, data & HASH_SG_EN);
> +        do_hash_operation(s, algo, data & HASH_SG_EN,
> +                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
>
>          if (data & HASH_IRQ_EN) {
>              qemu_irq_raise(s->irq);
> @@ -333,6 +357,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x0FFFFFFF;
>      ahc->dest_mask = 0x0FFFFFF8;
> +    ahc->key_mask = 0x0FFFFFC0;
>      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>  }
>
> @@ -351,6 +376,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x3fffffff;
>      ahc->dest_mask = 0x3ffffff8;
> +    ahc->key_mask = 0x3FFFFFC0;
>      ahc->hash_mask = 0x000003ff; /* No SG or SHA512 modes */
>  }
>
> @@ -369,6 +395,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
>
>      ahc->src_mask = 0x7FFFFFFF;
>      ahc->dest_mask = 0x7FFFFFF8;
> +    ahc->key_mask = 0x7FFFFFF8;
>      ahc->hash_mask = 0x00147FFF;
>  }
>
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..2242945eb4 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -37,6 +37,7 @@ struct AspeedHACEClass {
>
>      uint32_t src_mask;
>      uint32_t dest_mask;
> +    uint32_t key_mask;
>      uint32_t hash_mask;
>  };
>
> --
> 2.25.1
>

