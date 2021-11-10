Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90744BCC1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:21:45 +0100 (CET)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkirY-0004rr-Nv
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:21:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mkipv-0003Co-Cb; Wed, 10 Nov 2021 03:20:03 -0500
Received: from [2001:41c9:1:41f::167] (port=34260
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mkips-00006b-D8; Wed, 10 Nov 2021 03:20:02 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mkipf-00071K-9h; Wed, 10 Nov 2021 08:19:51 +0000
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c4d2f4e8-b001-519d-ab8c-47e80d1a78ec@ilande.co.uk>
Date: Wed, 10 Nov 2021 08:19:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 13:57, Lucas Mateus Castro (alqotel) wrote:

> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
> 
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
> The hardware used to compare QEMU's behavior to, was a Power9.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++++++++++
>   target/ppc/helper.h                |  1 +
>   target/ppc/translate/fp-impl.c.inc |  6 ++---
>   3 files changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index c4896cecc8..f086cb503f 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -414,6 +414,47 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
>       ppc_store_fpscr(env, val);
>   }
>   
> +void helper_fpscr_check_status(CPUPPCState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    target_ulong fpscr = env->fpscr;
> +    int error = 0;
> +
> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXSOFT;
> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
> +        error = POWERPC_EXCP_FP_OX;
> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
> +        error = POWERPC_EXCP_FP_UX;
> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
> +        error = POWERPC_EXCP_FP_XX;
> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
> +        error = POWERPC_EXCP_FP_ZX;
> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXSNAN;
> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXISI;
> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXIDI;
> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXZDZ;
> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXIMZ;
> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
> +        error = POWERPC_EXCP_FP_VXVC;
> +    }
> +
> +    if (error) {
> +        cs->exception_index = POWERPC_EXCP_PROGRAM;
> +        env->error_code = error | POWERPC_EXCP_FP;
> +        /* Deferred floating-point exception after target FPSCR update */
> +        if (fp_exceptions_enabled(env)) {
> +            raise_exception_err_ra(env, cs->exception_index,
> +                                   env->error_code, GETPC());
> +        }
> +    }
> +}
> +
>   static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
>   {
>       CPUState *cs = env_cpu(env);
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 4076aa281e..baa3715e73 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -61,6 +61,7 @@ DEF_HELPER_FLAGS_1(cntlzw32, TCG_CALL_NO_RWG_SE, i32, i32)
>   DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>   
>   DEF_HELPER_1(float_check_status, void, env)
> +DEF_HELPER_1(fpscr_check_status, void, env)
>   DEF_HELPER_1(reset_fpstatus, void, env)
>   DEF_HELPER_2(compute_fprf_float64, void, env, i64)
>   DEF_HELPER_3(store_fpscr, void, env, i64, i32)
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index 9f7868ee28..0a9b1ecc60 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -782,7 +782,7 @@ static void gen_mtfsb1(DisasContext *ctx)
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>   }
>   
>   /* mtfsf */
> @@ -818,7 +818,7 @@ static void gen_mtfsf(DisasContext *ctx)
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>       tcg_temp_free_i64(t1);
>   }
>   
> @@ -851,7 +851,7 @@ static void gen_mtfsfi(DisasContext *ctx)
>           tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
>       }
>       /* We can raise a deferred exception */
> -    gen_helper_float_check_status(cpu_env);
> +    gen_helper_fpscr_check_status(cpu_env);
>   }
>   
>   /***                         Floating-point load                           ***/

FWIW the real issue here is that gen_helper_reset_fpstatus() even exists at all: see 
the comments around enabling hardfloat in the PPC target by Emilio and Richard at 
https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04974.html and 
https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00064.html.

I have tried a few informal experiments on my MacOS images by completely removing all 
calls to gen_reset_fpstatus(), and whilst there were a few odd behaviours I was 
surprised to find that the basic OS was usable. The main issue I had was trying to 
come up with suitable test cases for the various instructions when my only available 
hardware is a G4 Mac Mini.

So yes this patch fixes one particular use case, but the real issue is that the PPC 
target floating point flags need a bit of work: however once this is done it should 
be possible for hardfloat to be enabled via a CPU option on suitable hosts which will 
bring a noticeable improvement in floating point performance.


ATB,

Mark.

