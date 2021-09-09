Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02426404B44
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 13:50:41 +0200 (CEST)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIZi-0002KA-0O
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 07:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOIXF-0001T2-I3; Thu, 09 Sep 2021 07:48:05 -0400
Received: from [201.28.113.2] (port=60788 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mOIXD-0008Gu-6C; Thu, 09 Sep 2021 07:48:05 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 9 Sep 2021 08:47:58 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 02A1A80121D;
 Thu,  9 Sep 2021 08:47:57 -0300 (-03)
Subject: Re: [PATCH v3 08/15] PPC64/TCG: Implement 'rfebb' instruction
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210903203116.80628-1-danielhb413@gmail.com>
 <20210903203116.80628-9-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <7baa1efb-f8e2-fdfb-8ade-9794bff914a0@eldorado.org.br>
Date: Thu, 9 Sep 2021 08:47:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903203116.80628-9-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 Sep 2021 11:47:58.0587 (UTC)
 FILETIME=[891ABCB0:01D7A570]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.975,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2021 17:31, Daniel Henrique Barboza wrote:
> An Event-Based Branch (EBB) allows applications to change the NIA when a
> event-based exception occurs. Event-based exceptions are enabled by
> setting the Branch Event Status and Control Register (BESCR). If the
> event-based exception is enabled when the exception occurs, an EBB
> happens.
> 
> The following operations happens during an EBB:
> 
> - Global Enable (GE) bit of BESCR is set to 0;
> - bits 0-61 of the Event-Based Branch Return Register (EBBRR) are set
> to the the effective address of the NIA that would have executed if the EBB
> didn't happen;
> - Instruction fetch and execution will continue in the effective address
> contained in the Event-Based Branch Handler Register (EBBHR).
> 
> The EBB Handler will process the event and then execute the Return From
> Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
> redirects execution to the address pointed in EBBRR. This process is
> described in the PowerISA v3.1, Book II, Chapter 6 [1].
> 
> This patch implements the rfebb instruction. Descriptions of all
> relevant BESCR bits are also added - this patch is only using BESCR_GE,
> but the next patches will use the remaining bits.
> 
> [1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h                       | 13 ++++++++++
>   target/ppc/excp_helper.c               | 31 ++++++++++++++++++++++++
>   target/ppc/helper.h                    |  1 +
>   target/ppc/insn32.decode               |  5 ++++
>   target/ppc/translate.c                 |  2 ++
>   target/ppc/translate/branch-impl.c.inc | 33 ++++++++++++++++++++++++++
>   6 files changed, 85 insertions(+)
>   create mode 100644 target/ppc/translate/branch-impl.c.inc
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 93f4a46827..26624508fa 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -368,6 +368,19 @@ typedef struct ppc_v3_pate_t {
>   /* PMU uses CTRL_RUN to sample PM_RUN_INST_CMPL */
>   #define CTRL_RUN PPC_BIT(63)
> 
> +/* EBB/BESCR bits */
> +/* Global Enable */
> +#define BESCR_GE PPC_BIT(0)
> +/* External Event-based Exception Enable */
> +#define BESCR_EE PPC_BIT(30)
> +/* Performance Monitor Event-based Exception Enable */
> +#define BESCR_PME PPC_BIT(31)
> +/* External Event-based Exception Occurred */
> +#define BESCR_EEO PPC_BIT(62)
> +/* Performance Monitor Event-based Exception Occurred */
> +#define BESCR_PMEO PPC_BIT(63)
> +#define BESCR_INVALID PPC_BITMASK(32, 33)
> +
>   /* LPCR bits */
>   #define LPCR_VPM0         PPC_BIT(0)
>   #define LPCR_VPM1         PPC_BIT(1)
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7b6ac16eef..22f9835383 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1281,6 +1281,37 @@ void helper_hrfid(CPUPPCState *env)
>   }
>   #endif
> 
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +void helper_rfebb(CPUPPCState *env, target_ulong s)
> +{
> +    target_ulong msr = env->msr;
> +
> +    /*
> +     * Handling of BESCR bits 32:33 according to PowerISA v3.1:
> +     *
> +     * "If BESCR 32:33 != 0b00 the instruction is treated as if
> +     *  the instruction form were invalid."
> +     */
> +    if (env->spr[SPR_BESCR] & BESCR_INVALID) {
> +        raise_exception_err(env, POWERPC_EXCP_PROGRAM,
> +                            POWERPC_EXCP_INVAL | POWERPC_EXCP_INVAL_INVAL);
> +    }
> +
> +    env->nip = env->spr[SPR_EBBRR];
> +
> +    /* Switching to 32-bit ? Crop the nip */
> +    if (!msr_is_64bit(env, msr)) {
> +        env->nip = (uint32_t)env->spr[SPR_EBBRR];
> +    }
> +
> +    if (s) {
> +        env->spr[SPR_BESCR] |= BESCR_GE;
> +    } else {
> +        env->spr[SPR_BESCR] &= ~BESCR_GE;
> +    }
> +}
> +#endif
> +
>   /*****************************************************************************/
>   /* Embedded PowerPC specific helpers */
>   void helper_40x_rfci(CPUPPCState *env)
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 47dbbe6da1..91a86992a5 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -18,6 +18,7 @@ DEF_HELPER_2(pminsn, void, env, i32)
>   DEF_HELPER_1(rfid, void, env)
>   DEF_HELPER_1(rfscv, void, env)
>   DEF_HELPER_1(hrfid, void, env)
> +DEF_HELPER_2(rfebb, void, env, tl)
>   DEF_HELPER_2(store_lpcr, void, env, tl)
>   DEF_HELPER_2(store_pcr, void, env, tl)
>   DEF_HELPER_2(store_mmcr0, void, env, tl)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 9fd8d6b817..deb7374ea4 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -124,3 +124,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>   ## Vector Bit Manipulation Instruction
> 
>   VCFUGED         000100 ..... ..... ..... 10101001101    @VX
> +
> +### rfebb
> +&XL_s           s:uint8_t
> +@XL_s           ......-------------- s:1 .......... -   &XL_s
> +RFEBB           010011-------------- .   0010010010 -   @XL_s

nit: Since the arg_fmt is now XL_s...

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 866b1d2b34..7a3104ecf9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7636,6 +7636,8 @@ static int times_4(DisasContext *ctx, int x)
> 
>   #include "translate/spe-impl.c.inc"
> 
> +#include "translate/branch-impl.c.inc"
> +
>   /* Handles lfdp, lxsd, lxssp */
>   static void gen_dform39(DisasContext *ctx)
>   {
> diff --git a/target/ppc/translate/branch-impl.c.inc b/target/ppc/translate/branch-impl.c.inc
> new file mode 100644
> index 0000000000..9c991d9abb
> --- /dev/null
> +++ b/target/ppc/translate/branch-impl.c.inc
> @@ -0,0 +1,33 @@
> +/*
> + * Power ISA decode for branch instructions
> + *
> + *  Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +
> +static bool trans_RFEBB(DisasContext *ctx, arg_RFEBB *arg)

I think it's a bit more readable to use arg_XL_s instead of arg_RFEBB. 
Anyway,

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
> +
> +    gen_icount_io_start(ctx);
> +    gen_update_cfar(ctx, ctx->cia);
> +    gen_helper_rfebb(cpu_env, cpu_gpr[arg->s]);
> +
> +    ctx->base.is_jmp = DISAS_CHAIN;
> +
> +    return true;
> +}
> +#else
> +static bool trans_RFEBB(DisasContext *ctx, arg_RFEBB *arg)
> +{
> +    gen_invalid(ctx);
> +    return true;
> +}
> +#endif
> --
> 2.31.1
> 


-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

