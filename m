Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8255948412D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:49:34 +0100 (CET)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iJp-0006w9-Ap
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:49:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iHT-0005DZ-L5
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:47:07 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iHR-0008PT-Rs
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:47:07 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MtO06-1mFmcT3zf4-00umoC; Tue, 04 Jan 2022 12:47:04 +0100
Message-ID: <4dac46df-720a-3760-85a2-4a9e9f18698c@vivier.eu>
Date: Tue, 4 Jan 2022 12:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/6] target/hppa: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PRhH9LAiE6m7UPkK1S2NBRQzxu1EZUl92wVh6HuIV4VWO8LOEXb
 LHWZ9J+Cq8eU/wh9hOnIOVPEtBlT+1EyFx6HAuAJjsZ1esZepMTUtNEfW/cmmqubAVY71Yd
 biXWqh7cgIHhNcbKSEk4eToGGL0OSpqLdUTifg/plodpl3M9C5qWQ/lMbjxYadpNfPxv8Eo
 kbN8O2UHajGjGltqDz1Bw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6KyRh1ORwKM=:1aMZ3WcU1pHjTrxHWYRajL
 OQBvlQLtmUtKJA28jwGud7Uv2vM6/SpWlCM+bKZocPyQ99Hhq13ta9aKLHP7lE/AtHyXhuvgn
 dVNcPsELrJToN9mfOjJxNrrB2Hqx9lUGXE3M6T/pD4AzyvMGMb2QZsdTrVRMLQncG0xg81xQq
 E9MbR1wqcTWRIS2kAMMC/cyI9pABJxYebees2OlkZqTmYvh+Rgs2OcFCfMiyOtlL27Qonirud
 xaVHjq5n0TBVP/krr3E1PuTKQk+mK+ns2auZpyzf/fiZlidiA98QWtWKEIo7lscsTwLTHnRMu
 EfOaUU82Hdx7xV6Qpt/m+ybb43qjSgvK5Vlgvne+pPmlU5O5uN3Sh5tR1006dN406rwhmvsOP
 MKmcFcPTxVXmNMZAMIbCxvBQr1u3DFD5r37ISifUZJEGido9K9RLlC8igpjdvm3/8OwovQNKM
 XGcboDxn4/QPHkZKz1HPj0/Jvcg+lnwEZ1ANvMyR5FCbnQcYoktfpYjqCpIX/Ovah5H1GmTYp
 vaoCQw5+OpgrilvQRKaAoRQ6kznR15+bHwvTjWspX/m2LYJDHTpYC4XB8EYFqqFL5hDDM1DmJ
 eDJjLNPhqserq7girC3G6T3OmNP/0Yh8j6m6hZeVQahGAcawgDbuPWwKMkV07Dm+NJfou/A0O
 5eZLXj9mZeiWTFa+oQ32JCKMpuFSuZ52GDnFjhvmL4MGdap9R6+M9NdthXwRnBkQ4UE0=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
>   linux-user/hppa/target_prctl.h |  2 +-
>   target/hppa/cpu.h              |  5 ++++-
>   target/hppa/translate.c        | 19 +++++++++++++++----
>   3 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/hppa/target_prctl.h b/linux-user/hppa/target_prctl.h
> index eb53b31ad5..5629ddbf39 100644
> --- a/linux-user/hppa/target_prctl.h
> +++ b/linux-user/hppa/target_prctl.h
> @@ -1 +1 @@
> -/* No special prctl support required. */
> +#include "../generic/target_prctl_unalign.h"
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 294fd7297f..45fd338b02 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -259,12 +259,14 @@ static inline target_ulong hppa_form_gva(CPUHPPAState *env, uint64_t spc,
>       return hppa_form_gva_psw(env->psw, spc, off);
>   }
>   
> -/* Since PSW_{I,CB} will never need to be in tb->flags, reuse them.
> +/*
> + * Since PSW_{I,CB} will never need to be in tb->flags, reuse them.
>    * TB_FLAG_SR_SAME indicates that SR4 through SR7 all contain the
>    * same value.
>    */
>   #define TB_FLAG_SR_SAME     PSW_I
>   #define TB_FLAG_PRIV_SHIFT  8
> +#define TB_FLAG_UNALIGN     0x400
>   
>   static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, target_ulong *pc,
>                                           target_ulong *cs_base,
> @@ -279,6 +281,7 @@ static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, target_ulong *pc,
>   #ifdef CONFIG_USER_ONLY
>       *pc = env->iaoq_f & -4;
>       *cs_base = env->iaoq_b & -4;
> +    flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
>   #else
>       /* ??? E, T, H, L, B, P bits need to be here, when implemented.  */
>       flags |= env->psw & (PSW_W | PSW_C | PSW_D);
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index 952027a28e..a2392a1b64 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -274,8 +274,18 @@ typedef struct DisasContext {
>       int mmu_idx;
>       int privilege;
>       bool psw_n_nonzero;
> +
> +#ifdef CONFIG_USER_ONLY
> +    MemOp unalign;
> +#endif
>   } DisasContext;
>   
> +#ifdef CONFIG_USER_ONLY
> +#define UNALIGN(C)  (C)->unalign
> +#else
> +#define UNALIGN(C)  0
> +#endif
> +
>   /* Note that ssm/rsm instructions number PSW_W and PSW_E differently.  */
>   static int expand_sm_imm(DisasContext *ctx, int val)
>   {
> @@ -1475,7 +1485,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
>   
>       form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
>                ctx->mmu_idx == MMU_PHYS_IDX);
> -    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
> +    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
>       if (modify) {
>           save_gpr(ctx, rb, ofs);
>       }
> @@ -1493,7 +1503,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
>   
>       form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
>                ctx->mmu_idx == MMU_PHYS_IDX);
> -    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
> +    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
>       if (modify) {
>           save_gpr(ctx, rb, ofs);
>       }
> @@ -1511,7 +1521,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
>   
>       form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
>                ctx->mmu_idx == MMU_PHYS_IDX);
> -    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
> +    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
>       if (modify) {
>           save_gpr(ctx, rb, ofs);
>       }
> @@ -1529,7 +1539,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
>   
>       form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
>                ctx->mmu_idx == MMU_PHYS_IDX);
> -    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
> +    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
>       if (modify) {
>           save_gpr(ctx, rb, ofs);
>       }
> @@ -4107,6 +4117,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->mmu_idx = MMU_USER_IDX;
>       ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
>       ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
> +    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
>   #else
>       ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
>       ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


