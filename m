Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704A3EFF99
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:51:55 +0200 (CEST)
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHIf-0007SC-Uc
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHFy-0003hM-E2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:49:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38580
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHFv-0002Dw-7R
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:49:06 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGHFZ-000CNB-Ic; Wed, 18 Aug 2021 09:48:46 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-19-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <cb68d3ea-b2da-cbbf-a6c3-0cecf014f69f@ilande.co.uk>
Date: Wed, 18 Aug 2021 09:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 18/55] target/sparc: Implement do_unaligned_access for
 user-only
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

> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/cpu_loop.c | 11 +++++++++++
>   target/sparc/cpu.c          |  2 +-
>   target/sparc/mmu_helper.c   |  4 +++-
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index 02532f198d..612e77807e 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -272,6 +272,17 @@ void cpu_loop (CPUSPARCState *env)
>                   queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>               }
>               break;
> +        case TT_UNALIGNED:
> +            info.si_signo = TARGET_SIGBUS;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_BUS_ADRALN;
> +#ifdef TARGET_SPARC64
> +            info._sifields._sigfault._addr = env->dmmu.sfar;
> +#else
> +            info._sifields._sigfault._addr = env->mmuregs[4];
> +#endif
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            break;
>           case EXCP_DEBUG:
>               info.si_signo = TARGET_SIGTRAP;
>               info.si_errno = 0;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec74..d33d41e837 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -865,11 +865,11 @@ static const struct TCGCPUOps sparc_tcg_ops = {
>       .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
>       .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
>       .tlb_fill = sparc_cpu_tlb_fill,
> +    .do_unaligned_access = sparc_cpu_do_unaligned_access,
>   
>   #ifndef CONFIG_USER_ONLY
>       .do_interrupt = sparc_cpu_do_interrupt,
>       .do_transaction_failed = sparc_cpu_do_transaction_failed,
> -    .do_unaligned_access = sparc_cpu_do_unaligned_access,
>   #endif /* !CONFIG_USER_ONLY */
>   };
>   #endif /* CONFIG_TCG */
> diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
> index 2f260b0085..6b4aa32181 100644
> --- a/target/sparc/mmu_helper.c
> +++ b/target/sparc/mmu_helper.c
> @@ -946,6 +946,7 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       }
>       return phys_addr;
>   }
> +#endif /* CONFIG_USER_ONLY */
>   
>   void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                                    MMUAccessType access_type,
> @@ -956,7 +957,9 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>       CPUSPARCState *env = &cpu->env;
>   
>   #ifdef TARGET_SPARC64
> +#ifndef CONFIG_USER_ONLY
>       env->dmmu.sfsr = build_sfsr(env, mmu_idx, access_type);
> +#endif
>       env->dmmu.sfar = addr;
>   #else
>       env->mmuregs[4] = addr;
> @@ -964,4 +967,3 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>   
>       cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
>   }
> -#endif /* CONFIG_USER_ONLY */

I'm fairly weak on the user side, however the setting of the fault address looks okay 
to me so:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

