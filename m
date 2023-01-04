Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BD65D2A6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2tR-00088u-BP; Wed, 04 Jan 2023 07:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pD2tP-00088X-LL
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:29:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pD2tN-00048S-Qs
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:29:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z16so16292026wrw.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oz4Z0GianJo8e5hN+RgPZ5WTzImFj0aP/gupTzPHLpY=;
 b=jsIx9UWqWfi2+JJ42KOb7TtjNQSLFhCgJ2GjJHJZ2b35Lfj1/EouUJL3PshSmrUlpU
 /hXZ14OVNaCjjRThlh6MTXzyL3gTLR7SlyRVrVOCrGiDcSr5GuKi7DhePL8ii2mhFZCu
 rReFMM5rj1BSSvvJp+QFbIC3OCC/0u1gblSc5lCrF9J5Xfwg0MVRFedHvmSol06C8qNq
 YoNXqup6HNnUGKVcvZa3GJr21Fz/ToFtHIqVYeh2kOTSKNdtSlv/aEiDsh2/zx6K1Rzt
 OdrF/PRX8Zp2LR6aJZEm1j9bjLeEfwEjNDJHjkqUnxWRsTPLzB8Lb8nNIqN7SqCzgfrI
 VnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oz4Z0GianJo8e5hN+RgPZ5WTzImFj0aP/gupTzPHLpY=;
 b=jaQwf4/SFpqvLsD9GalmvR+3JwNm6IQtAQ1hfigkcwQUaL2j4DacTz6YPv549IdPKH
 ggRCpY4M2WJYKAxxrUUnWj6QBJKPJOg7OT0HDHggTemQz0e/8Q0KMnkPAPOOXWy0wcuw
 Or+ulj8ez/6q0TnnztF8B2kqrujrkjEOimf7vRC6RYHNpRKxJA24KyM1l04saMIPf22j
 ZLaZeYjUtaZDay3TX+OOFv3kLMSqB+b0OqhBun7RIg91T4AWA9jIcx/vhS02QlUqAV3n
 +CaKD5YtzG93POWReqwvrxib9N3Vd9hxr3GfiNMeCz/xy5jT53wDgYCiheVWPc/yzzEe
 rhtg==
X-Gm-Message-State: AFqh2kqLzZY9Oti7EU4uDSAwQqzQDuSkkmO4QAN68LpIS1vHG2qoMu+U
 +ZZMuKQ+k1Yn0z+P5cQDLmhSzg==
X-Google-Smtp-Source: AMrXdXuRJ2I7m0cXeiwrgVgxlrxcUeqj5bUVBLkw/wsEh7BFz4UFuRp/bg0Qs+1+bfoaZZVAWKFIQQ==
X-Received: by 2002:a5d:4e83:0:b0:29f:b589:157c with SMTP id
 e3-20020a5d4e83000000b0029fb589157cmr3347883wru.5.1672835351865; 
 Wed, 04 Jan 2023 04:29:11 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adffd91000000b002882600e8a0sm19431617wrr.12.2023.01.04.04.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 04:29:11 -0800 (PST)
Date: Wed, 4 Jan 2023 12:29:10 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y7VxFpoTjwNaolTG@myrica>
References: <20221219125720.1369027-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219125720.1369027-1-smostafa@google.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Mostafa,

On Mon, Dec 19, 2022 at 12:57:20PM +0000, Mostafa Saleh wrote:
> GBPA register can be used to globally abort all
> transactions.
> 
> Only UPDATE and ABORT bits are considered in this patch.

That's fair, although it effectively implements all bits since
smmuv3_translate() ignores memory attributes anyway

> 
> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> be zero(Do not abort incoming transactions).
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h |  4 ++++
>  hw/arm/smmuv3.c          | 14 ++++++++++++++
>  include/hw/arm/smmuv3.h  |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index bce161870f..71f70141e8 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
>  REG32(CR1,                 0x28)
>  REG32(CR2,                 0x2c)
>  REG32(STATUSR,             0x40)
> +REG32(GBPA,                0x44)
> +    FIELD(GBPA, ABORT,        20, 1)
> +    FIELD(GBPA, UPDATE,       31, 1)
> +
>  REG32(IRQ_CTRL,            0x50)
>      FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
>      FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 955b89c8d5..2843bc3da9 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->gerror = 0;
>      s->gerrorn = 0;
>      s->statusr = 0;
> +    s->gbpa = 0;
>  }
>  
>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> @@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> +    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
> +        status = SMMU_TRANS_ABORT;
> +        goto epilogue;
> +    }
> +

GBPA is only taken into account when SMMU_CR0.SMMUEN is 0 (6.3.9.6 SMMUEN)

>      cfg = smmuv3_get_config(sdev, &event);
>      if (!cfg) {
>          status = SMMU_TRANS_ERROR;
> @@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>      case A_GERROR_IRQ_CFG2:
>          s->gerror_irq_cfg2 = data;
>          return MEMTX_OK;
> +    case A_GBPA:
> +        /* Ignore update bit as write is synchronous. */

We could also ignore a write that has Update=0, since that's required for
SMMUv3.2+ implementations (6.3.14.1 Update procedure)

> +        s->gbpa = data & ~R_GBPA_UPDATE_MASK;

Do we need to synchronize with concurrent transactions here?
I couldn't find if QEMU already serializes MMIO writes and IOMMU
translation.

"Transactions arriving at the SMMU after completion of a GPBA update are
guaranteed to take the new attributes written." The guest tests completion
by reading the Update bit:

	vCPU (host CPU 0)		Device thread (host CPU 1)

	(a) read GBPA.abort = 1
	(b) write GBPA.{update,abort} = {1,0}
	(c) read GBPA.update = 0
	(d) launch DMA			(e) execute DMA
					(f) translation must read GBPA.abort = 0

I guess memory barriers after (b) and before (f) would ensure that. But I
wonder if SMMUEN also needs additional synchronization, and in that case a
rwlock would probably be simpler.

Thanks,
Jean

> +        return MEMTX_OK;
>      case A_STRTAB_BASE: /* 64b */
>          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
>          return MEMTX_OK;
> @@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>      case A_STATUSR:
>          *data = s->statusr;
>          return MEMTX_OK;
> +    case A_GBPA:
> +        *data = s->gbpa;
> +        return MEMTX_OK;
>      case A_IRQ_CTRL:
>      case A_IRQ_CTRL_ACK:
>          *data = s->irq_ctrl;
> @@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
>          VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
>          VMSTATE_UINT32(cr0ack, SMMUv3State),
>          VMSTATE_UINT32(statusr, SMMUv3State),
> +        VMSTATE_UINT32(gbpa, SMMUv3State),
>          VMSTATE_UINT32(irq_ctrl, SMMUv3State),
>          VMSTATE_UINT32(gerror, SMMUv3State),
>          VMSTATE_UINT32(gerrorn, SMMUv3State),
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index f1921fdf9e..9899fa1860 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -46,6 +46,7 @@ struct SMMUv3State {
>      uint32_t cr[3];
>      uint32_t cr0ack;
>      uint32_t statusr;
> +    uint32_t gbpa;
>      uint32_t irq_ctrl;
>      uint32_t gerror;
>      uint32_t gerrorn;
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 
> 

