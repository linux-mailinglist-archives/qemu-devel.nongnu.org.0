Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC43EFF54
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:37:48 +0200 (CEST)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGH51-0003BW-5v
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGH4C-0002XE-VG
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:36:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38540
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGH49-0000Ea-Fq
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:36:56 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGH3l-000CJ6-QZ; Wed, 18 Aug 2021 09:36:34 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-16-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2ae7e44e-a458-3c64-eca6-6076b75ee65d@ilande.co.uk>
Date: Wed, 18 Aug 2021 09:36:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 15/55] target/sparc: Remove DEBUG_UNALIGNED
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/08/2021 05:14, Richard Henderson wrote:

> The printf should have been qemu_log_mask, the parameters
> themselves no longer compile, and because this is placed
> before unwinding the PC is actively wrong.
> 
> We get better (and correct) logging on the other side of
> raising the exception, in sparc_cpu_do_interrupt.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/ldst_helper.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index 22327d7d72..974afea041 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -27,7 +27,6 @@
>   
>   //#define DEBUG_MMU
>   //#define DEBUG_MXCC
> -//#define DEBUG_UNALIGNED
>   //#define DEBUG_UNASSIGNED
>   //#define DEBUG_ASI
>   //#define DEBUG_CACHE_CONTROL
> @@ -364,10 +363,6 @@ static void do_check_align(CPUSPARCState *env, target_ulong addr,
>                              uint32_t align, uintptr_t ra)
>   {
>       if (addr & align) {
> -#ifdef DEBUG_UNALIGNED
> -        printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
> -               "\n", addr, env->pc);
> -#endif
>           cpu_raise_exception_ra(env, TT_UNALIGNED, ra);
>       }
>   }
> @@ -1968,10 +1963,6 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>       SPARCCPU *cpu = SPARC_CPU(cs);
>       CPUSPARCState *env = &cpu->env;
>   
> -#ifdef DEBUG_UNALIGNED
> -    printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
> -           "\n", addr, env->pc);
> -#endif
>       cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
>   }
>   #endif

Indeed. I suspect that this was originally intended for developers to capture that an 
unaligned access occurred rather than processing it correctly.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

