Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6148888F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:46:07 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Um6-0001JR-77
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:46:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTs-0005Vv-4C
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:16 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55770
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTn-0006Lu-V5
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:15 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 9866862E7F;
 Sun,  9 Jan 2022 17:26:48 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720408; bh=Xq5YFE8cimRnaqDvLeUs6QdkJVN9WTDRDVIGXaqRGBw=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=AN/XrqTDe5jDm3CmXrVj2eN2oTB4c98vNinXAFqeQK64EOOF6Yf40ZAj3kTxmB2Jd
 4qp/Rti6+PGrRvtGr8ONhCTV7khG/r9xf3JS+AEdlMuDa4gFtiadX9Qg560y0EjNKF
 CORaini88GWma2Ey//li7rKp7k0B6VOTwf4LzQkw=
Message-ID: <f1c794ba-35dc-5da4-85f5-4d27d541476c@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 07/30] target/loongarch: Add LoongArch CSR
 instruction
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-8-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-8-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:13, Xiaojuan Yang wrote:
> This includes:
> - CSRRD
> - CSRWR
> - CSRXCHG
>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.h                       |  88 +++++++++++++
>   target/loongarch/csr_helper.c                | 112 +++++++++++++++++
>   target/loongarch/disas.c                     |  15 +++
>   target/loongarch/helper.h                    |   7 ++
>   target/loongarch/insn_trans/trans_core.c.inc | 123 +++++++++++++++++++
>   target/loongarch/insns.decode                |  13 ++
>   target/loongarch/meson.build                 |   1 +
>   target/loongarch/translate.c                 |   5 +
>   8 files changed, 364 insertions(+)
>   create mode 100644 target/loongarch/csr_helper.c
>   create mode 100644 target/loongarch/insn_trans/trans_core.c.inc
>
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 232d51e788..2a1841a708 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -260,6 +260,94 @@ struct CPULoongArchState {
>   #endif
>   };
>   
> +#define CSR_OFF(X)  \
> +           [LOONGARCH_CSR_##X] = offsetof(CPULoongArchState, CSR_##X)
> +#define CSR_OFF_ARRAY(X, N)  \
> +           [LOONGARCH_CSR_##X(N)] = offsetof(CPULoongArchState, CSR_##X[N])
> +
> +static const int csr_offsets[] = {
> +     CSR_OFF(CRMD),
> +     CSR_OFF(PRMD),
> +     CSR_OFF(EUEN),
> +     CSR_OFF(MISC),
> +     CSR_OFF(ECFG),
> +     CSR_OFF(ESTAT),
> +     CSR_OFF(ERA),
> +     CSR_OFF(BADV),
> +     CSR_OFF(BADI),
> +     CSR_OFF(EENTRY),
> +     CSR_OFF(TLBIDX),
> +     CSR_OFF(TLBEHI),
> +     CSR_OFF(TLBELO0),
> +     CSR_OFF(TLBELO1),
> +     CSR_OFF(ASID),
> +     CSR_OFF(PGDL),
> +     CSR_OFF(PGDH),
> +     CSR_OFF(PGD),
> +     CSR_OFF(PWCL),
> +     CSR_OFF(PWCH),
> +     CSR_OFF(STLBPS),
> +     CSR_OFF(RVACFG),
> +     CSR_OFF(CPUID),
> +     CSR_OFF(PRCFG1),
> +     CSR_OFF(PRCFG2),
> +     CSR_OFF(PRCFG3),
> +     CSR_OFF_ARRAY(SAVE, 0),
> +     CSR_OFF_ARRAY(SAVE, 1),
> +     CSR_OFF_ARRAY(SAVE, 2),
> +     CSR_OFF_ARRAY(SAVE, 3),
> +     CSR_OFF_ARRAY(SAVE, 4),
> +     CSR_OFF_ARRAY(SAVE, 5),
> +     CSR_OFF_ARRAY(SAVE, 6),
> +     CSR_OFF_ARRAY(SAVE, 7),
> +     CSR_OFF_ARRAY(SAVE, 8),
> +     CSR_OFF_ARRAY(SAVE, 9),
> +     CSR_OFF_ARRAY(SAVE, 10),
> +     CSR_OFF_ARRAY(SAVE, 11),
> +     CSR_OFF_ARRAY(SAVE, 12),
> +     CSR_OFF_ARRAY(SAVE, 13),
> +     CSR_OFF_ARRAY(SAVE, 14),
> +     CSR_OFF_ARRAY(SAVE, 15),
> +     CSR_OFF(TID),
> +     CSR_OFF(TCFG),
> +     CSR_OFF(TVAL),
> +     CSR_OFF(CNTC),
> +     CSR_OFF(TICLR),
> +     CSR_OFF(LLBCTL),
> +     CSR_OFF(IMPCTL1),
> +     CSR_OFF(IMPCTL2),
> +     CSR_OFF(TLBRENTRY),
> +     CSR_OFF(TLBRBADV),
> +     CSR_OFF(TLBRERA),
> +     CSR_OFF(TLBRSAVE),
> +     CSR_OFF(TLBRELO0),
> +     CSR_OFF(TLBRELO1),
> +     CSR_OFF(TLBREHI),
> +     CSR_OFF(TLBRPRMD),
> +     CSR_OFF(MERRCTL),
> +     CSR_OFF(MERRINFO1),
> +     CSR_OFF(MERRINFO2),
> +     CSR_OFF(MERRENTRY),
> +     CSR_OFF(MERRERA),
> +     CSR_OFF(MERRSAVE),
> +     CSR_OFF(CTAG),
> +     CSR_OFF_ARRAY(DMW, 0),
> +     CSR_OFF_ARRAY(DMW, 1),
> +     CSR_OFF_ARRAY(DMW, 2),
> +     CSR_OFF_ARRAY(DMW, 3),
> +     CSR_OFF(DBG),
> +     CSR_OFF(DERA),
> +     CSR_OFF(DSAVE),
> +};
> +
> +static inline int cpu_csr_offset(unsigned csr_num)
> +{
> +    if (csr_num < ARRAY_SIZE(csr_offsets)) {
> +        return csr_offsets[csr_num];
> +    }
> +    return 0;
> +}
> +
>   /**
>    * LoongArchCPU:
>    * @env: #CPULoongArchState
> diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
> new file mode 100644
> index 0000000000..4d0619cec8
> --- /dev/null
> +++ b/target/loongarch/csr_helper.c
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch emulation helpers for csr registers
"Emulation helpers for CSRs" is enough.
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "qemu/host-utils.h"
> +#include "exec/helper-proto.h"
> +#include "exec/exec-all.h"
> +#include "exec/cpu_ldst.h"
> +#include "hw/irq.h"
> +#include "cpu-csr.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "tcg/tcg-ldst.h"
> +
> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
> +{
> +    LoongArchCPU *cpu;
> +    int64_t v;
> +
> +    switch (csr) {
> +    case LOONGARCH_CSR_PGD:
> +        if (env->CSR_TLBRERA & 0x1) {
> +            v = env->CSR_TLBRBADV;
> +        } else {
> +            v = env->CSR_BADV;
> +        }
> +
> +        if ((v >> 63) & 0x1) {
> +            v = env->CSR_PGDH;
> +        } else {
> +            v = env->CSR_PGDL;
> +        }
> +        break;
> +    case LOONGARCH_CSR_CPUID:
> +        v = (env_cpu(env))->cpu_index;
> +        break;
> +    case LOONGARCH_CSR_TVAL:
> +        cpu = LOONGARCH_CPU(env_cpu(env));
> +        v = cpu_loongarch_get_constant_timer_ticks(cpu);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return v;
> +}
> +
> +target_ulong helper_csr_wrq(CPULoongArchState *env, target_ulong val,
> +                            uint64_t csr)
> +{
> +    LoongArchCPU *cpu;
> +    int64_t old_v = -1;
> +
> +    switch (csr) {
> +    case LOONGARCH_CSR_ESTAT:
> +        /* Only IS[1:0] can be write */
> +        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, IS, val & 0x3);
> +        break;
> +    case LOONGARCH_CSR_ASID:
> +        old_v = env->CSR_ASID;
> +        /* Only ASID filed of CSR_ASID can be write. */
> +        env->CSR_ASID = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID,
> +                                   val & R_CSR_ASID_ASID_MASK);
> +        if (old_v != val) {
> +            tlb_flush(env_cpu(env));
> +        }
> +        break;
> +    case LOONGARCH_CSR_TCFG:
> +        cpu = LOONGARCH_CPU(env_cpu(env));
> +        old_v = env->CSR_TCFG;
> +        cpu_loongarch_store_constant_timer_config(cpu, val);
> +        break;
> +    case LOONGARCH_CSR_TICLR:
> +        old_v = 0;
> +        env->CSR_ESTAT &= ~(1 << IRQ_TIMER);
> +        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return old_v;
> +}
> +
> +target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong new_val,
> +                              target_ulong mask, uint64_t csr_num)
> +{
> +    unsigned csr_offset = cpu_csr_offset(csr_num);
> +    if (csr_offset == 0) {
> +        /* CSR is undefined: read as 0, write ignored. */
"Undefined CSR; reads return 0, writes are ignored. */
> +        return 0;
> +    }
> +
> +    uint64_t *csr = (void *)env + csr_offset;
> +    uint64_t old_val = *csr;
> +
> +    new_val = (new_val & mask) | (old_val & ~mask);
> +
> +    if (csr_num == LOONGARCH_CSR_TCFG) {
> +        LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
> +        cpu_loongarch_store_constant_timer_config(cpu, new_val);
> +    } else {
> +        *csr = new_val;
> +    }
> +    return old_val;
> +}
> diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
> index 45be34de27..de683bb88b 100644
> --- a/target/loongarch/disas.c
> +++ b/target/loongarch/disas.c
> @@ -204,6 +204,18 @@ static void output_rr_offs(DisasContext *ctx, arg_rr_offs *a,
>       output(ctx, mnemonic, "r%d, r%d, %d", a->rj, a->rd, a->offs);
>   }
>   
> +static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
> +                         const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, %d", a->rd, a->csr);
> +}
> +
> +static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
> +                          const char *mnemonic)
> +{
> +    output(ctx, mnemonic, "r%d, r%d, %d", a->rd, a->rj, a->csr);
> +}
> +
>   #define INSN(insn, type)                                    \
>   static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
>   {                                                           \
> @@ -516,6 +528,9 @@ INSN(blt,          rr_offs)
>   INSN(bge,          rr_offs)
>   INSN(bltu,         rr_offs)
>   INSN(bgeu,         rr_offs)
> +INSN(csrrd,        r_csr)
> +INSN(csrwr,        r_csr)
> +INSN(csrxchg,      rr_csr)
>   
>   #define output_fcmp(C, PREFIX, SUFFIX)                                         \
>   {                                                                              \
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index da1a2bced7..036dbf31f8 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -92,3 +92,10 @@ DEF_HELPER_2(frint_s, i64, env, i64)
>   DEF_HELPER_2(frint_d, i64, env, i64)
>   
>   DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
> +
> +/*Core functions */
> +#ifndef CONFIG_USER_ONLY
> +DEF_HELPER_2(csr_rdq, i64, env, i64)
> +DEF_HELPER_3(csr_wrq, i64, env, tl, i64)
> +DEF_HELPER_4(csr_xchgq, i64, env, tl, tl, i64)
> +#endif /* !CONFIG_USER_ONLY */
> diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
> new file mode 100644
> index 0000000000..7d2cfe3534
> --- /dev/null
> +++ b/target/loongarch/insn_trans/trans_core.c.inc
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch translate functions for system mode
"Translation functions for privileged mode"? And rename the file to 
"trans_privileged.c.inc"?
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +/* Privileged instruction translation */
And this comment could be removed.
> +
> +#include "cpu-csr.h"
> +
> +#ifdef CONFIG_USER_ONLY
> +
> +#define GEN_FALSE_TRANS(name)   \
GEN_TRANS_STUB? "false trans" sounds like something that's NOT a 
"trans", but the generated functions are actually real "trans" helpers 
that do nothing.
> +static bool trans_##name(DisasContext *ctx, arg_##name * a)  \
> +{   \
> +    return false;   \
> +}
> +
> +GEN_FALSE_TRANS(csrrd)
> +GEN_FALSE_TRANS(csrwr)
> +GEN_FALSE_TRANS(csrxchg)
> +
> +#else
> +
> +static bool check_plv(DisasContext *ctx)
> +{
> +    if (ctx->base.tb->flags == MMU_USER_IDX) {
> +        generate_exception(ctx, EXCCODE_IPE);
Are the instructions accessible from PLV0 to PLV2 inclusive, as implied 
by this "if" statement? Or do we only allow for PLV0?
> +        return true;
> +    }
> +    return false;
> +}
> +
> +static bool ro_csr(int csr_num)
> +{
> +    /*
> +     * For now qemu does not support any features of the MISC
> +     * bits yet treat as a RO CSR.
"Treat MISC as a read-only CSR because its features are not supported yet."
> +     */
> +    if ((csr_num == LOONGARCH_CSR_BADI) || (csr_num == LOONGARCH_CSR_CPUID) ||
> +        (csr_num == LOONGARCH_CSR_PRCFG1) || (csr_num == LOONGARCH_CSR_PRCFG2) ||
> +        (csr_num == LOONGARCH_CSR_PRCFG3) || (csr_num == LOONGARCH_CSR_PGD) ||
> +        (csr_num == LOONGARCH_CSR_TVAL) || (csr_num == LOONGARCH_CSR_MISC)) {
Use a switch statement for match arms spanning many values like this; 
doing so increases readability and reduces duplication.
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +
> +    unsigned csr_offset = cpu_csr_offset(a->csr);
> +    if (csr_offset == 0) {
> +        /* CSR is undefined: read as 0 */
"reads return 0"
> +        dest = tcg_constant_tl(0);
> +        return true;
> +    }
> +
> +    if ((a->csr == LOONGARCH_CSR_PGD) || (a->csr == LOONGARCH_CSR_CPUID) ||
> +        (a->csr == LOONGARCH_CSR_TVAL)) {
Use a switch.
> +        gen_helper_csr_rdq(dest, cpu_env, tcg_constant_i64(a->csr));
> +    } else {
> +        tcg_gen_ld_tl(dest, cpu_env, csr_offset);
> +    }
> +    return true;
> +}
> +
> +static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
> +
> +    if (check_plv(ctx) || ro_csr(a->csr)) {
> +        return false;
> +    }
> +
> +    unsigned csr_offset = cpu_csr_offset(a->csr);
> +    if (csr_offset == 0) {
> +        /* CSR is undefined: write ignored. */
"writes are ignored"
> +        return true;
> +    }
> +
> +    if ((a->csr == LOONGARCH_CSR_ASID) || (a->csr == LOONGARCH_CSR_TCFG) ||
> +        (a->csr == LOONGARCH_CSR_TICLR) || (a->csr == LOONGARCH_CSR_ESTAT)) {
Use a switch.
> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(a->csr));
> +    } else {
> +        TCGv temp = tcg_temp_new();
> +        tcg_gen_ld_tl(temp, cpu_env, csr_offset);
> +        tcg_gen_st_tl(src1, cpu_env, csr_offset);
> +        tcg_gen_mov_tl(dest, temp);
> +        tcg_temp_free(temp);
> +
> +        /* Cpu state may be changed, need exit */
"CPU state may be changed, need to exit"
> +        if ((a->csr == LOONGARCH_CSR_CRMD) || (a->csr == LOONGARCH_CSR_EUEN)) {
And here if you feel like doing that already. (It's only 2 codes so not 
switch-ify-ing is okay too.)
> +            tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +            ctx->base.is_jmp = DISAS_EXIT;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx) || ro_csr(a->csr)) {
> +        return false;
> +    }
> +    gen_helper_csr_xchgq(dest, cpu_env, src1, src2, tcg_constant_i64(a->csr));
> +    return true;
> +}
> +
> +#endif
> diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
> index 3379d22979..647fcb9def 100644
> --- a/target/loongarch/insns.decode
> +++ b/target/loongarch/insns.decode
> @@ -45,6 +45,8 @@
>   &c_offs       cj offs
>   &offs         offs
>   &rr_offs      rj rd offs
> +&r_csr        rd csr
> +&rr_csr       rd rj csr
>   
>   #
>   # Formats
> @@ -85,6 +87,8 @@
>   @c_offs21      .... .. ................ .. cj:3 .....    &c_offs      offs=%offs21
>   @offs26            .... .. ..........................    &offs        offs=%offs26
>   @rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16
> +@r_csr                    .... .... csr:14 ..... rd:5    &r_csr
> +@rr_csr                    .... .... csr:14 rj:5 rd:5    &rr_csr
>   
>   #
>   # Fixed point arithmetic operation instruction
> @@ -440,3 +444,12 @@ blt             0110 00 ................ ..... .....     @rr_offs16
>   bge             0110 01 ................ ..... .....     @rr_offs16
>   bltu            0110 10 ................ ..... .....     @rr_offs16
>   bgeu            0110 11 ................ ..... .....     @rr_offs16
> +
> +#
> +# Core instructions
"Privileged instructions"?
> +#
> +{
> +  csrrd             0000 0100 .............. 00000 .....     @r_csr
> +  csrwr             0000 0100 .............. 00001 .....     @r_csr
> +  csrxchg           0000 0100 .............. ..... .....     @rr_csr
> +}
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index 6bf2d88104..5fb7542e88 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -19,6 +19,7 @@ loongarch_softmmu_ss.add(files(
>     'machine.c',
>     'constant_timer.c',
>     'tlb_helper.c',
> +  'csr_helper.c',
>   ))
>   
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index 2710764653..09771ee43f 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -26,6 +26,7 @@ TCGv_i32 cpu_fcsr0;
>   TCGv_i64 cpu_fpr[32];
>   
>   #define DISAS_STOP       DISAS_TARGET_0
> +#define DISAS_EXIT       DISAS_TARGET_1
>   
>   static inline int plus_1(DisasContext *ctx, int x)
>   {
> @@ -172,6 +173,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
>   #include "insn_trans/trans_fmov.c.inc"
>   #include "insn_trans/trans_fmemory.c.inc"
>   #include "insn_trans/trans_branch.c.inc"
> +#include "insn_trans/trans_core.c.inc"
>   
>   static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>   {
> @@ -209,6 +211,9 @@ static void loongarch_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>           break;
>       case DISAS_NORETURN:
>           break;
> +    case DISAS_EXIT:
> +        tcg_gen_exit_tb(NULL, 0);
> +        break;
>       default:
>           g_assert_not_reached();
>       }

