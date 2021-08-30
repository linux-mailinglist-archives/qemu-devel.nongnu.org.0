Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3798A3FB5BC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 14:16:20 +0200 (CEST)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKgD4-00057C-Ml
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 08:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mKg9o-00049q-DD; Mon, 30 Aug 2021 08:12:57 -0400
Received: from [201.28.113.2] (port=54711 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mKg9m-0008QG-80; Mon, 30 Aug 2021 08:12:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 30 Aug 2021 09:12:46 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D962680121D;
 Mon, 30 Aug 2021 09:12:45 -0300 (-03)
Subject: Re: [PATCH v2 09/16] PPC64/TCG: Implement 'rfebb' instruction
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-10-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <1445a679-2871-933c-e06f-1e7f36f3a0eb@eldorado.org.br>
Date: Mon, 30 Aug 2021 09:12:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824163032.394099-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Aug 2021 12:12:46.0394 (UTC)
 FILETIME=[57C691A0:01D79D98]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: gustavo.romero@linaro.org, richard.henderson@linaro.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2021 13:30, Daniel Henrique Barboza wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> An Event-Based Branch (EBB) allows applications to change the NIA when a
> event-based exception occurs. Event-based exceptions are enabled by
> setting the Branch Event Status and Control Register (BESCR). If the
> event-based exception is enabled when the exception occurs, an EBB
> happens.
> 
> The EBB will:
> 
> - set the Global Enable (GE) bit of BESCR to 0;
> - set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to the
>    effective address of the NIA that would have executed if the EBB
>    didn't happen;
> - Instruction fetch and execution will continue in the effective address
>    contained in the Event-Based Branch Handler Register (EBBHR).
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
>   target/ppc/cpu.h                       | 13 +++++++++++
>   target/ppc/excp_helper.c               | 24 +++++++++++++++++++
>   target/ppc/helper.h                    |  1 +
>   target/ppc/insn32.decode               |  5 ++++
>   target/ppc/translate.c                 |  2 ++
>   target/ppc/translate/branch-impl.c.inc | 32 ++++++++++++++++++++++++++
>   6 files changed, 77 insertions(+)
>   create mode 100644 target/ppc/translate/branch-impl.c.inc
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 105ee75a01..9d5eb9ead4 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -363,6 +363,19 @@ typedef struct ppc_v3_pate_t {
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
> index 7b6ac16eef..058b063d8a 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1281,6 +1281,30 @@ void helper_hrfid(CPUPPCState *env)
>   }
>   #endif
> 
> +#ifdef CONFIG_TCG
> +void helper_rfebb(CPUPPCState *env, target_ulong s)
> +{
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

Hi Daniel,

Should we check msr_is_64bit and crop EBBRR here? Also, I believe this 
helper should be inside a #if defined(TARGET_PPC64) ...

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

... as its DEF_HELPER is.

>   DEF_HELPER_2(store_lpcr, void, env, tl)
>   DEF_HELPER_2(store_pcr, void, env, tl)
>   DEF_HELPER_2(store_mmcr0, void, env, tl)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 9fd8d6b817..bd0b88b0b6 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -124,3 +124,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
>   ## Vector Bit Manipulation Instruction
> 
>   VCFUGED         000100 ..... ..... ..... 10101001101    @VX
> +
> +### rfebb
> +&RFEBB          s:uint8_t
> +@RFEBB          ......-------------- s:1 .......... -   &RFEBB
> +RFEBB           010011-------------- .   0010010010 -   @RFEBB

Maybe it only makes sense with Book I instructions, but we've been 
naming fmt_def/arg_def according to the instruction format, so I'd 
suggest naming it @XL/&XL or @XL_s/&XL_s.

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d45ce79a3e..d4cfc567cf 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7643,6 +7643,8 @@ static int times_4(DisasContext *ctx, int x)
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
> index 0000000000..2e309e9889
> --- /dev/null
> +++ b/target/ppc/translate/branch-impl.c.inc
> @@ -0,0 +1,32 @@
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
> +    return true;

That would be a no-op for !TARGET_PPC64, I think it's more appropriate 
to call gen_invalid(ctx) or let REQUIRE_INSNS_FLAGS2 handle this. I'm 
not sure what should be done in the CONFIG_USER_ONLY case.

> +}
> +#endif
> --
> 2.31.1
> 
> 

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

