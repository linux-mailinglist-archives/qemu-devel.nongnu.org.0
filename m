Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C8488899
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:56:08 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Uvn-0004cL-Tb
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:56:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTv-0005fy-0f
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:20 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55766
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTs-0006Lm-5u
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:18 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1345F62E80;
 Sun,  9 Jan 2022 17:26:49 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720409; bh=BNOhIJfDf4zI3tsfQowjl4/PLsx3f1aOaWyCqWd6/WA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=HK2HBqJPw7/yJB75SKOz9Yah9hI2v36jUiCuUOQjJGwOX0RMwkg4bkIWeTn0r42C4
 cNJ7VICPtODa2DpORevXj1BTuz5fyNioiHNi1aN3iV/fiMKSY6eeBspo8lhaS1CeHb
 GF19v7FzZWz5q2mHeWDN9QWWXRVjShq6aui8c7lk=
Message-ID: <4145a22e-fed6-9b88-257c-0a2d1be91bd8@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 08/30] target/loongarch: Add LoongArch IOCSR
 instruction
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-9-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-9-yangxiaojuan@loongson.cn>
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
> - IOCSR{RD/WR}.{B/H/W/D}
>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c                       |   8 ++
>   target/loongarch/cpu.h                       |   4 +
>   target/loongarch/disas.c                     |   8 ++
>   target/loongarch/helper.h                    |   2 +
>   target/loongarch/insn_trans/trans_core.c.inc | 103 ++++++++++++++++
>   target/loongarch/insns.decode                |   9 ++
>   target/loongarch/iocsr_helper.c              | 120 +++++++++++++++++++
>   target/loongarch/meson.build                 |   1 +
>   8 files changed, 255 insertions(+)
>   create mode 100644 target/loongarch/iocsr_helper.c
>
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 780eb96a3c..571092ce53 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -158,6 +158,14 @@ static void loongarch_3a5000_initfn(Object *obj)
>       env->cpucfg[20] = data;
>   
>       env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);
> +
> +#ifndef CONFIG_USER_ONLY
> +    env->address_space_iocsr = g_malloc(sizeof(*env->address_space_iocsr));
> +    env->system_iocsr = g_malloc(sizeof(*env->system_iocsr));
> +    memory_region_init_io(env->system_iocsr, obj, NULL,
> +                          env, "iocsr", UINT64_MAX);
> +    address_space_init(env->address_space_iocsr, env->system_iocsr, "IOCSR");
> +#endif
>   }
>   
>   static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 2a1841a708..ddb69ffecf 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -151,6 +151,7 @@ extern const char * const fregnames[32];
>   
>   #define N_IRQS      14
>   #define IRQ_TIMER   11
> +#define IRQ_IPI     12
>   
>   #define LOONGARCH_TLB_MAX      (2048 + 64) /* 2048 STLB + 64 MTLB */
>   #define LOONGARCH_STLB         2048 /* 2048 STLB */
> @@ -257,6 +258,9 @@ struct CPULoongArchState {
>   
>   #ifndef CONFIG_USER_ONLY
>       LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
> +
> +    AddressSpace *address_space_iocsr;
> +    MemoryRegion *system_iocsr;
>   #endif
>   };
>   
> diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
> index de683bb88b..cbb264a318 100644
> --- a/target/loongarch/disas.c
> +++ b/target/loongarch/disas.c
> @@ -531,6 +531,14 @@ INSN(bgeu,         rr_offs)
>   INSN(csrrd,        r_csr)
>   INSN(csrwr,        r_csr)
>   INSN(csrxchg,      rr_csr)
> +INSN(iocsrrd_b,    rr)
> +INSN(iocsrrd_h,    rr)
> +INSN(iocsrrd_w,    rr)
> +INSN(iocsrrd_d,    rr)
> +INSN(iocsrwr_b,    rr)
> +INSN(iocsrwr_h,    rr)
> +INSN(iocsrwr_w,    rr)
> +INSN(iocsrwr_d,    rr)
>   
>   #define output_fcmp(C, PREFIX, SUFFIX)                                         \
>   {                                                                              \
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index 036dbf31f8..1bcd082858 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -98,4 +98,6 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
>   DEF_HELPER_2(csr_rdq, i64, env, i64)
>   DEF_HELPER_3(csr_wrq, i64, env, tl, i64)
>   DEF_HELPER_4(csr_xchgq, i64, env, tl, tl, i64)
> +DEF_HELPER_3(iocsr_read, i64, env, tl, i32)
> +DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
>   #endif /* !CONFIG_USER_ONLY */
> diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
> index 7d2cfe3534..592d2a339e 100644
> --- a/target/loongarch/insn_trans/trans_core.c.inc
> +++ b/target/loongarch/insn_trans/trans_core.c.inc
> @@ -20,6 +20,14 @@ static bool trans_##name(DisasContext *ctx, arg_##name * a)  \
>   GEN_FALSE_TRANS(csrrd)
>   GEN_FALSE_TRANS(csrwr)
>   GEN_FALSE_TRANS(csrxchg)
> +GEN_FALSE_TRANS(iocsrrd_b)
> +GEN_FALSE_TRANS(iocsrrd_h)
> +GEN_FALSE_TRANS(iocsrrd_w)
> +GEN_FALSE_TRANS(iocsrrd_d)
> +GEN_FALSE_TRANS(iocsrwr_b)
> +GEN_FALSE_TRANS(iocsrwr_h)
> +GEN_FALSE_TRANS(iocsrwr_w)
> +GEN_FALSE_TRANS(iocsrwr_d)
>   
>   #else
>   
> @@ -120,4 +128,99 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
>       return true;
>   }
>   
> +static bool trans_iocsrrd_b(DisasContext *ctx, arg_iocsrrd_b *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(1));
> +    return true;
> +}
> +
> +static bool trans_iocsrrd_h(DisasContext *ctx, arg_iocsrrd_h *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(2));
> +    return true;
> +}
> +
> +static bool trans_iocsrrd_w(DisasContext *ctx, arg_iocsrrd_w *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(4));
> +    return true;
> +}
> +
> +static bool trans_iocsrrd_d(DisasContext *ctx, arg_iocsrrd_d *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_read(dest, cpu_env, src1, tcg_constant_i32(8));
> +    return true;
> +}
> +
> +static bool trans_iocsrwr_b(DisasContext *ctx, arg_iocsrwr_b *a)
> +{
> +    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(1));
> +    return true;
> +}
> +
> +static bool trans_iocsrwr_h(DisasContext *ctx, arg_iocsrwr_h *a)
> +{
> +    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(2));
> +    return true;
> +}
> +
> +static bool trans_iocsrwr_w(DisasContext *ctx, arg_iocsrwr_w *a)
> +{
> +    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(4));
> +    return true;
> +}
> +
> +static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
> +{
> +    TCGv val = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx)) {
> +        return false;
> +    }
> +    gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(8));
> +    return true;
> +}
>   #endif
> diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
> index 647fcb9def..9a43f288c3 100644
> --- a/target/loongarch/insns.decode
> +++ b/target/loongarch/insns.decode
> @@ -453,3 +453,12 @@ bgeu            0110 11 ................ ..... .....     @rr_offs16
>     csrwr             0000 0100 .............. 00001 .....     @r_csr
>     csrxchg           0000 0100 .............. ..... .....     @rr_csr
>   }
> +
> +iocsrrd_b        0000 01100100 10000 00000 ..... .....    @rr
> +iocsrrd_h        0000 01100100 10000 00001 ..... .....    @rr
> +iocsrrd_w        0000 01100100 10000 00010 ..... .....    @rr
> +iocsrrd_d        0000 01100100 10000 00011 ..... .....    @rr
> +iocsrwr_b        0000 01100100 10000 00100 ..... .....    @rr
> +iocsrwr_h        0000 01100100 10000 00101 ..... .....    @rr
> +iocsrwr_w        0000 01100100 10000 00110 ..... .....    @rr
> +iocsrwr_d        0000 01100100 10000 00111 ..... .....    @rr
> diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
> new file mode 100644
> index 0000000000..f9efe2517f
> --- /dev/null
> +++ b/target/loongarch/iocsr_helper.c
> @@ -0,0 +1,120 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch emulation helpers for iocsr read/write
"Helpers for IOCSR reads/writes"
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
> +/*
> + * For per core address 0x10xx(IPI) 0x18xx(EXTIOI)
> + * need extra adjust the iocsr addr.
> + */
Put this comment (after fixing broken English)...
> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
> +                           uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState  *cs = qemu_get_cpu(cpuid);
> +    env = cs->env_ptr;
> +
...here directly before the "if" statement it's supposed to document.
> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }
> +
> +    if (size == 1) {
> +        return address_space_ldub(env->address_space_iocsr, r_addr,
> +                                  MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else if (size == 2) {
> +        return address_space_lduw(env->address_space_iocsr, r_addr,
> +                                  MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else if (size == 4) {
> +        return address_space_ldl(env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else if (size == 8) {
> +        return address_space_ldq(env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +    }
Use a switch statement.
> +    return 0;
> +}
> +
> +void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
> +                        target_ulong val, uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState *cs = qemu_get_cpu(cpuid);
> +    int mask, i;
> +
> +    env = cs->env_ptr;
> +    /*
> +     * For IPI send, Mail send, ANY send adjust addr and val
> +     * according to their real meaning. The iocsr write
> +     * will finally lead to the corresponding mmio write
> +     * all operations handled there.
> +     */

"For IPI sends, mailbox sends and anysends, adjust addr and val 
accordingly; the IOCSR writes are turned to MMIO writes respectively."

> +    if (w_addr == 0x1040) { /* IPI send */
Use a switch for this w_addr as well...
> +        cpuid = (val >> 16) & 0x3ff;
> +        val = 1UL << (val & 0x1f);
> +        if (val) {
> +            qemu_mutex_lock_iothread();
> +            cs = qemu_get_cpu(cpuid);
> +            env = cs->env_ptr;
> +            env->CSR_ESTAT |= 1 << IRQ_IPI;
> +            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +            qemu_mutex_unlock_iothread();
> +        }
> +    } else if (w_addr == 0x1048) { /* Mail Send */
> +        cpuid = (val >> 16) & 0x3ff;
> +        w_addr = 0x1020 + (val & 0x1c);
> +        val = val >> 32;
> +        mask = (val >> 27) & 0xf;
> +        size = 4;
> +        env = (qemu_get_cpu(cpuid))->env_ptr;
> +    } else if (w_addr == 0x1158) { /* ANY send */
> +        cpuid = (val >> 16) & 0x3ff;
> +        w_addr = val & 0xffff;
> +        val = val >> 32;
> +        mask = (val >> 27) & 0xf;
> +        size = 1;
> +        env = (qemu_get_cpu(cpuid))->env_ptr;
> +
> +        for (i = 0; i < 4; i++) {
> +            if (!((mask >> i) & 1)) {
> +                address_space_stb(env->address_space_iocsr, w_addr,
> +                                  val, MEMTXATTRS_UNSPECIFIED, NULL);
> +            }
> +            w_addr = w_addr + 1;
> +            val = val >> 8;
> +        }
> +        return;
> +    }
> +
> +    if (((w_addr & 0xff00) == 0x1000) || ((w_addr & 0xff00) == 0x1800)) {
> +        w_addr = w_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }
> +
> +    if (size == 1) {
> +        address_space_stb(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else if (size == 2) {
> +        address_space_stw(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else if (size == 4) {
> +        address_space_stl(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +    } else if (size == 8) {
> +        address_space_stq(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +    }
Use a switch for this too.
> +}
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index 5fb7542e88..072684ca6d 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -20,6 +20,7 @@ loongarch_softmmu_ss.add(files(
>     'constant_timer.c',
>     'tlb_helper.c',
>     'csr_helper.c',
> +  'iocsr_helper.c',
>   ))
>   
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])

