Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD63EFF81
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:48:44 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHFb-0001u2-F9
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHEB-0000Rc-P6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:47:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38568
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHE9-0000iC-V0
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:47:15 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHDo-000CML-0X; Wed, 18 Aug 2021 09:46:57 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-18-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <300951db-bc99-a3bb-f2af-af8451c7d4d0@ilande.co.uk>
Date: Wed, 18 Aug 2021 09:47:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 17/55] target/sparc: Set fault address in
 sparc_cpu_do_unaligned_access
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

> We ought to have been recording the virtual address for reporting
> to the guest trap handler.  Move the function to mmu_helper.c, so
> that we can re-use code shared with get_physical_address_data.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/ldst_helper.c | 13 -------------
>   target/sparc/mmu_helper.c  | 18 ++++++++++++++++++
>   2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 974afea041..ea163200a4 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -1953,16 +1953,3 @@ void sparc_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                             is_asi, size, retaddr);
>   }
>   #endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                                 MMUAccessType access_type,
> -                                                 int mmu_idx,
> -                                                 uintptr_t retaddr)
> -{
> -    SPARCCPU *cpu = SPARC_CPU(cs);
> -    CPUSPARCState *env = &cpu->env;
> -
> -    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
> -}
> -#endif
> diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
> index 5b2fda534a..2f260b0085 100644
> --- a/target/sparc/mmu_helper.c
> +++ b/target/sparc/mmu_helper.c
> @@ -946,4 +946,22 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       }
>       return phys_addr;
>   }
> +
> +void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                                 MMUAccessType access_type,
> +                                                 int mmu_idx,
> +                                                 uintptr_t retaddr)
> +{
> +    SPARCCPU *cpu = SPARC_CPU(cs);
> +    CPUSPARCState *env = &cpu->env;
> +
> +#ifdef TARGET_SPARC64
> +    env->dmmu.sfsr = build_sfsr(env, mmu_idx, access_type);
> +    env->dmmu.sfar = addr;
> +#else
> +    env->mmuregs[4] = addr;
>   #endif
> +
> +    cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
> +}
> +#endif /* CONFIG_USER_ONLY */

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

