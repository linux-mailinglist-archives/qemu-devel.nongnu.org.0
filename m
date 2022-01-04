Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3520484132
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:49:56 +0100 (CET)
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iKB-0007Y9-Od
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iGy-0004bb-ND
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:46:36 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:34281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iGw-0008GW-VF
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:46:36 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6srH-1mKPBP2ixL-018MV5; Tue, 04 Jan 2022 12:46:32 +0100
Message-ID: <541ba3fd-bac6-38dc-29e1-db8adbfe8600@vivier.eu>
Date: Tue, 4 Jan 2022 12:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/6] target/alpha: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J+Mnozi8AMfFSNmB5K57aDu1VIrlR7DX2uO8oi7wfOQrD0wvwH+
 gVyBmlJgQ4CJwPj2c0QQgbngpU2bh1/cC0ZwcqtRP1TpIsXcTL+goYxBIkvCRzHiEQZOMTs
 GBER4VVNTWjgqKG+G5QtkrwWYRC9TarBO4RygyRiQh/+YtQ/YKBvykyERo3wL50XyAe+kBU
 RNQ+b2AkGiFziDuGTjA0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hYtO8p4K29c=:ALJs3gZ+xHiWUAjHNKWnR1
 YiC4SOetL/E3nABcar9aMl2xkuxoHrcScdnCHdZyFGhRO+S/xQuOTVOiQ+9+exjlVJvw9EblB
 cqhjuc292VT8+ShB/lV8QUoNLLNVw6LQ/+vhPdK5C3tqs+/p9oyhUSIJt+V7XQrIPiyerWmSe
 eyvxK4yS48hT0J6DG615laBPYCmOCFFm62bVDNS3CnoIb6Wd2qBLwAwlzB3A2oElfC08h5yIz
 I0Vs7wmB7SS5SFZnAWuluF7XHC99cTzBvuF2TDtxY1Ay6AVl4iJu2t1I2m1x9izmxC0EBM4ea
 A0gISJR+C35LvTnK00b8fd4OVhT8nfO2PEZZjm85ubeG9PGmgThO5p4Z3LSVk2JH0bc2um8hZ
 vc8o89eV3ejV9U0GEe1JdOu++xM0sxf0hnJ7YVNe0FxWHYcVo6EvdmPzIoFufE+HtyZI/gKD2
 3BRW9mr3eGTkkJww7/ELqSJVsgv3VVTWjlIH812mdA6dROndLw5Czgs0oBBZRlJla1KoJGI2n
 8dDC3gEryELpKCJ9YyUsX2TOSAESWwBj/H4ifgGnUKKfASvDKR+0RTrLl6CMdCHBAbVLelGdz
 ZIUBviDwaXRSMOpRsqwm+Hj+ne5XAQ648s75lXvcuAwbeb/Boyp5Bns+KYykEKRpKYDk4gImq
 hMfNiTTDiEflMvTomWilQ0gcVLGlAMn1PL4UCxhogW1ibY7zX8tdauTP99Y3D2RpvEDE=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/12/2021 à 16:01, Richard Henderson a écrit :
> Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
> flag to set MO_UNALN for the instructions that the kernel
> handles in the unaligned trap.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/alpha/target_prctl.h |  2 +-
>   target/alpha/cpu.h              |  5 +++++
>   target/alpha/translate.c        | 31 ++++++++++++++++++++++---------
>   3 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/linux-user/alpha/target_prctl.h b/linux-user/alpha/target_prctl.h
> index eb53b31ad5..5629ddbf39 100644
> --- a/linux-user/alpha/target_prctl.h
> +++ b/linux-user/alpha/target_prctl.h
> @@ -1 +1 @@
> -/* No special prctl support required. */
> +#include "../generic/target_prctl_unalign.h"
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index afd975c878..e819211503 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -383,6 +383,8 @@ enum {
>   #define ENV_FLAG_TB_MASK \
>       (ENV_FLAG_PAL_MODE | ENV_FLAG_PS_USER | ENV_FLAG_FEN)
>   
> +#define TB_FLAG_UNALIGN       (1u << 1)
> +
>   static inline int cpu_mmu_index(CPUAlphaState *env, bool ifetch)
>   {
>       int ret = env->flags & ENV_FLAG_PS_USER ? MMU_USER_IDX : MMU_KERNEL_IDX;
> @@ -470,6 +472,9 @@ static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
>       *pc = env->pc;
>       *cs_base = 0;
>       *pflags = env->flags & ENV_FLAG_TB_MASK;
> +#ifdef CONFIG_USER_ONLY
> +    *pflags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
> +#endif
>   }
>   
>   #ifdef CONFIG_USER_ONLY
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index a4c3f43e72..208ae5fbd5 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -45,7 +45,9 @@ typedef struct DisasContext DisasContext;
>   struct DisasContext {
>       DisasContextBase base;
>   
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_USER_ONLY
> +    MemOp unalign;
> +#else
>       uint64_t palbr;
>   #endif
>       uint32_t tbflags;
> @@ -68,6 +70,12 @@ struct DisasContext {
>       TCGv sink;
>   };
>   
> +#ifdef CONFIG_USER_ONLY
> +#define UNALIGN(C)  (C)->unalign
> +#else
> +#define UNALIGN(C)  0
> +#endif
> +
>   /* Target-specific return values from translate_one, indicating the
>      state of the TB.  Note that DISAS_NEXT indicates that we are not
>      exiting the TB.  */
> @@ -270,7 +278,7 @@ static inline DisasJumpType gen_invalid(DisasContext *ctx)
>   static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
>   {
>       TCGv_i32 tmp32 = tcg_temp_new_i32();
> -    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
> +    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
>       gen_helper_memory_to_f(dest, tmp32);
>       tcg_temp_free_i32(tmp32);
>   }
> @@ -278,7 +286,7 @@ static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
>   static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
>   {
>       TCGv tmp = tcg_temp_new();
> -    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
>       gen_helper_memory_to_g(dest, tmp);
>       tcg_temp_free(tmp);
>   }
> @@ -286,14 +294,14 @@ static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
>   static void gen_lds(DisasContext *ctx, TCGv dest, TCGv addr)
>   {
>       TCGv_i32 tmp32 = tcg_temp_new_i32();
> -    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
> +    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
>       gen_helper_memory_to_s(dest, tmp32);
>       tcg_temp_free_i32(tmp32);
>   }
>   
>   static void gen_ldt(DisasContext *ctx, TCGv dest, TCGv addr)
>   {
> -    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
>   }
>   
>   static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
> @@ -324,6 +332,8 @@ static void gen_load_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
>       tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
>       if (clear) {
>           tcg_gen_andi_i64(addr, addr, ~0x7);
> +    } else if (!locked) {
> +        op |= UNALIGN(ctx);
>       }
>   
>       dest = ctx->ir[ra];
> @@ -340,7 +350,7 @@ static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
>   {
>       TCGv_i32 tmp32 = tcg_temp_new_i32();
>       gen_helper_f_to_memory(tmp32, addr);
> -    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
> +    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
>       tcg_temp_free_i32(tmp32);
>   }
>   
> @@ -348,7 +358,7 @@ static void gen_stg(DisasContext *ctx, TCGv src, TCGv addr)
>   {
>       TCGv tmp = tcg_temp_new();
>       gen_helper_g_to_memory(tmp, src);
> -    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
>       tcg_temp_free(tmp);
>   }
>   
> @@ -356,13 +366,13 @@ static void gen_sts(DisasContext *ctx, TCGv src, TCGv addr)
>   {
>       TCGv_i32 tmp32 = tcg_temp_new_i32();
>       gen_helper_s_to_memory(tmp32, src);
> -    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
> +    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL | UNALIGN(ctx));
>       tcg_temp_free_i32(tmp32);
>   }
>   
>   static void gen_stt(DisasContext *ctx, TCGv src, TCGv addr)
>   {
> -    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ);
> +    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ | UNALIGN(ctx));
>   }
>   
>   static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
> @@ -383,6 +393,8 @@ static void gen_store_int(DisasContext *ctx, int ra, int rb, int32_t disp16,
>       tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
>       if (clear) {
>           tcg_gen_andi_i64(addr, addr, ~0x7);
> +    } else {
> +        op |= UNALIGN(ctx);
>       }
>   
>       src = load_gpr(ctx, ra);
> @@ -2942,6 +2954,7 @@ static void alpha_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>   
>   #ifdef CONFIG_USER_ONLY
>       ctx->ir = cpu_std_ir;
> +    ctx->unalign = (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
>   #else
>       ctx->palbr = env->palbr;
>       ctx->ir = (ctx->tbflags & ENV_FLAG_PAL_MODE ? cpu_pal_ir : cpu_std_ir);

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


