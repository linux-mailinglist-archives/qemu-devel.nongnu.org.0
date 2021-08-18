Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16FF3EFF5D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:39:28 +0200 (CEST)
Received: from localhost ([::1]:57736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGH6d-0004ct-U8
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGH5a-0003xL-Tx
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:38:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38552
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGH5Y-0001OO-VS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:38:22 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGH5D-000CJd-GN; Wed, 18 Aug 2021 09:38:04 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-17-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <14f3edd3-04c7-6c91-d37e-7f229026b855@ilande.co.uk>
Date: Wed, 18 Aug 2021 09:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 16/55] target/sparc: Split out build_sfsr
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/08/2021 05:14, Richard Henderson wrote:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/mmu_helper.c | 72 +++++++++++++++++++++++++--------------
>   1 file changed, 46 insertions(+), 26 deletions(-)
> 
> diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
> index a44473a1c7..5b2fda534a 100644
> --- a/target/sparc/mmu_helper.c
> +++ b/target/sparc/mmu_helper.c
> @@ -526,16 +526,60 @@ static inline int ultrasparc_tag_match(SparcTLBEntry *tlb,
>       return 0;
>   }
>   
> +static uint64_t build_sfsr(CPUSPARCState *env, int mmu_idx, int rw)
> +{
> +    uint64_t sfsr = SFSR_VALID_BIT;
> +
> +    switch (mmu_idx) {
> +    case MMU_PHYS_IDX:
> +        sfsr |= SFSR_CT_NOTRANS;
> +        break;
> +    case MMU_USER_IDX:
> +    case MMU_KERNEL_IDX:
> +        sfsr |= SFSR_CT_PRIMARY;
> +        break;
> +    case MMU_USER_SECONDARY_IDX:
> +    case MMU_KERNEL_SECONDARY_IDX:
> +        sfsr |= SFSR_CT_SECONDARY;
> +        break;
> +    case MMU_NUCLEUS_IDX:
> +        sfsr |= SFSR_CT_NUCLEUS;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (rw == 1) {
> +        sfsr |= SFSR_WRITE_BIT;
> +    } else if (rw == 4) {
> +        sfsr |= SFSR_NF_BIT;
> +    }
> +
> +    if (env->pstate & PS_PRIV) {
> +        sfsr |= SFSR_PR_BIT;
> +    }
> +
> +    if (env->dmmu.sfsr & SFSR_VALID_BIT) { /* Fault status register */
> +        sfsr |= SFSR_OW_BIT; /* overflow (not read before another fault) */
> +    }
> +
> +    /* FIXME: ASI field in SFSR must be set */
> +
> +    return sfsr;
> +}
> +
>   static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
>                                        int *prot, MemTxAttrs *attrs,
>                                        target_ulong address, int rw, int mmu_idx)
>   {
>       CPUState *cs = env_cpu(env);
>       unsigned int i;
> +    uint64_t sfsr;
>       uint64_t context;
> -    uint64_t sfsr = 0;
>       bool is_user = false;
>   
> +    sfsr = build_sfsr(env, mmu_idx, rw);
> +
>       switch (mmu_idx) {
>       case MMU_PHYS_IDX:
>           g_assert_not_reached();
> @@ -544,29 +588,18 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
>           /* fallthru */
>       case MMU_KERNEL_IDX:
>           context = env->dmmu.mmu_primary_context & 0x1fff;
> -        sfsr |= SFSR_CT_PRIMARY;
>           break;
>       case MMU_USER_SECONDARY_IDX:
>           is_user = true;
>           /* fallthru */
>       case MMU_KERNEL_SECONDARY_IDX:
>           context = env->dmmu.mmu_secondary_context & 0x1fff;
> -        sfsr |= SFSR_CT_SECONDARY;
>           break;
> -    case MMU_NUCLEUS_IDX:
> -        sfsr |= SFSR_CT_NUCLEUS;
> -        /* FALLTHRU */
>       default:
>           context = 0;
>           break;
>       }
>   
> -    if (rw == 1) {
> -        sfsr |= SFSR_WRITE_BIT;
> -    } else if (rw == 4) {
> -        sfsr |= SFSR_NF_BIT;
> -    }
> -
>       for (i = 0; i < 64; i++) {
>           /* ctx match, vaddr match, valid? */
>           if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical)) {
> @@ -616,22 +649,9 @@ static int get_physical_address_data(CPUSPARCState *env, hwaddr *physical,
>                   return 0;
>               }
>   
> -            if (env->dmmu.sfsr & SFSR_VALID_BIT) { /* Fault status register */
> -                sfsr |= SFSR_OW_BIT; /* overflow (not read before
> -                                        another fault) */
> -            }
> -
> -            if (env->pstate & PS_PRIV) {
> -                sfsr |= SFSR_PR_BIT;
> -            }
> -
> -            /* FIXME: ASI field in SFSR must be set */
> -            env->dmmu.sfsr = sfsr | SFSR_VALID_BIT;
> -
> +            env->dmmu.sfsr = sfsr;
>               env->dmmu.sfar = address; /* Fault address register */
> -
>               env->dmmu.tag_access = (address & ~0x1fffULL) | context;
> -
>               return 1;
>           }
>       }

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

