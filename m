Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B045D23C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 01:50:44 +0100 (CET)
Received: from localhost ([::1]:52988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq2yJ-0002xs-NX
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 19:50:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mq2xS-00029T-Oe
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 19:49:50 -0500
Received: from [2001:738:2001:2001::2001] (port=18453 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mq2xQ-0006lr-4A
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 19:49:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A4B40748F58;
 Thu, 25 Nov 2021 01:49:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 688A7748F57; Thu, 25 Nov 2021 01:49:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 67689748F53;
 Thu, 25 Nov 2021 01:49:46 +0100 (CET)
Date: Thu, 25 Nov 2021 01:49:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 1/3] target/ppc: Fixed call to deferred exception
In-Reply-To: <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
Message-ID: <ad28911-f3e6-a95b-2541-4cacc1a3626e@eik.bme.hu>
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-2-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, danielhb413@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 pc@us.ibm.com, david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021, Lucas Mateus Castro (alqotel) wrote:
> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
> after updating the value of FPSCR, but helper_float_check_status
> checks fp_status and fp_status isn't updated based on FPSCR and
> since the value of fp_status is reset earlier in the instruction,
> it's always 0.
>
> Because of this helper_float_check_status would change the FI bit to 0
> as this bit checks if the last operation was inexact and
> float_flag_inexact is always 0.
>
> These instructions also don't throw exceptions correctly since
> helper_float_check_status throw exceptions based on fp_status.
>
> This commit created a new helper, helper_fpscr_check_status that checks
> FPSCR value instead of fp_status and checks for a larger variety of
> exceptions than do_float_check_status.
>
> Since fp_status isn't used, gen_reset_fpstatus() was removed.
>
> The hardware used to compare QEMU's behavior to was a Power9.
>
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
> target/ppc/fpu_helper.c            | 48 ++++++++++++++++++++++++++++++
> target/ppc/helper.h                |  1 +
> target/ppc/translate/fp-impl.c.inc |  9 ++----
> 3 files changed, 52 insertions(+), 6 deletions(-)
>
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index c4896cecc8..bb72715827 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -414,6 +414,54 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
>     ppc_store_fpscr(env, val);
> }
>
> +void helper_fpscr_check_status(CPUPPCState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    target_ulong fpscr = env->fpscr;
> +    int error = 0;
> +
> +    if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
> +        error = POWERPC_EXCP_FP_OX;
> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
> +        error = POWERPC_EXCP_FP_UX;
> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
> +        error = POWERPC_EXCP_FP_XX;
> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {

I wonder if these tests could be simplified by combining the masks if you 
want to test for both bits set so e.g. fpscr & (FP_ZX | FP_ZE) should be 
the same, shouldn't it?

Regards,
BALATON Zoltan

> +        error = POWERPC_EXCP_FP_ZX;
> +    } else if (fpscr & FP_VE) {
> +        if (fpscr & FP_VXSOFT) {
> +            error = POWERPC_EXCP_FP_VXSOFT;
> +        } else if (fpscr & FP_VXSNAN) {
> +            error = POWERPC_EXCP_FP_VXSNAN;
> +        } else if (fpscr & FP_VXISI) {
> +            error = POWERPC_EXCP_FP_VXISI;
> +        } else if (fpscr & FP_VXIDI) {
> +            error = POWERPC_EXCP_FP_VXIDI;
> +        } else if (fpscr & FP_VXZDZ) {
> +            error = POWERPC_EXCP_FP_VXZDZ;
> +        } else if (fpscr & FP_VXIMZ) {
> +            error = POWERPC_EXCP_FP_VXIMZ;
> +        } else if (fpscr & FP_VXVC) {
> +            error = POWERPC_EXCP_FP_VXVC;
> +        } else if (fpscr & FP_VXSQRT) {
> +            error = POWERPC_EXCP_FP_VXSQRT;
> +        } else if (fpscr & FP_VXCVI) {
> +            error = POWERPC_EXCP_FP_VXCVI;
> +        } else {
> +            return;
> +        }
> +    } else {
> +        return;
> +    }
> +    cs->exception_index = POWERPC_EXCP_PROGRAM;
> +    env->error_code = error | POWERPC_EXCP_FP;
> +    /* Deferred floating-point exception after target FPSCR update */
> +    if (fp_exceptions_enabled(env)) {
> +        raise_exception_err_ra(env, cs->exception_index,
> +                               env->error_code, GETPC());
> +    }
> +}
> +
> static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
> {
>     CPUState *cs = env_cpu(env);
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 627811cefc..632a81c676 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -63,6 +63,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, i32)
> DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
> DEF_HELPER_1(float_check_status, void, env)
> +DEF_HELPER_1(fpscr_check_status, void, env)
> DEF_HELPER_1(reset_fpstatus, void, env)
> DEF_HELPER_2(compute_fprf_float64, void, env, i64)
> DEF_HELPER_3(store_fpscr, void, env, i64, i32)
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index d1dbb1b96b..ca195fd9d2 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -769,7 +769,6 @@ static void gen_mtfsb1(DisasContext *ctx)
>         return;
>     }
>     crb = 31 - crbD(ctx->opcode);
> -    gen_reset_fpstatus();
>     /* XXX: we pretend we can only do IEEE floating-point computations */
>     if (likely(crb != FPSCR_FEX && crb != FPSCR_VX && crb != FPSCR_NI)) {
>         TCGv_i32 t0;
> @@ -782,7 +781,7 @@ static void gen_mtfsb1(DisasContext *ctx)
>         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>     }
>     /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
> }
>
> /* mtfsf */
> @@ -803,7 +802,6 @@ static void gen_mtfsf(DisasContext *ctx)
>         gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>         return;
>     }
> -    gen_reset_fpstatus();
>     if (l) {
>         t0 = tcg_const_i32((ctx->insns_flags2 & PPC2_ISA205) ? 0xffff : 0xff);
>     } else {
> @@ -818,7 +816,7 @@ static void gen_mtfsf(DisasContext *ctx)
>         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>     }
>     /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>     tcg_temp_free_i64(t1);
> }
>
> @@ -840,7 +838,6 @@ static void gen_mtfsfi(DisasContext *ctx)
>         return;
>     }
>     sh = (8 * w) + 7 - bf;
> -    gen_reset_fpstatus();
>     t0 = tcg_const_i64(((uint64_t)FPIMM(ctx->opcode)) << (4 * sh));
>     t1 = tcg_const_i32(1 << sh);
>     gen_helper_store_fpscr(cpu_env, t0, t1);
> @@ -851,7 +848,7 @@ static void gen_mtfsfi(DisasContext *ctx)
>         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>     }
>     /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
> }
>
> static void gen_qemu_ld32fs(DisasContext *ctx, TCGv_i64 dest, TCGv addr)
>

