Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC44AA88C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 13:11:01 +0100 (CET)
Received: from localhost ([::1]:58416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGJu7-0005Xy-En
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 07:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGJqB-0003QK-5G
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:06:55 -0500
Received: from [2001:41c9:1:41f::167] (port=48664
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGJq8-0008Kr-5M
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:06:54 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGJpZ-0009Kh-0c; Sat, 05 Feb 2022 12:06:21 +0000
Message-ID: <26c1881d-0579-94da-5166-28bc505a733b@ilande.co.uk>
Date: Sat, 5 Feb 2022 12:06:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
 <20220128034412.1262452-9-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220128034412.1262452-9-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v5 08/30] target/loongarch: Add LoongArch IOCSR
 instruction
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2022 03:43, Xiaojuan Yang wrote:

> This includes:
> - IOCSR{RD/WR}.{B/H/W/D}
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c                        |   8 +
>   target/loongarch/cpu.h                        |   4 +
>   target/loongarch/disas.c                      |   8 +
>   target/loongarch/helper.h                     |   2 +
>   .../insn_trans/trans_privileged.c.inc         | 103 +++++++++++++
>   target/loongarch/insns.decode                 |   9 ++
>   target/loongarch/iocsr_helper.c               | 139 ++++++++++++++++++
>   target/loongarch/meson.build                  |   1 +
>   8 files changed, 274 insertions(+)
>   create mode 100644 target/loongarch/iocsr_helper.c
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 3ed5bec1bc..0bb13cdbf6 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -165,6 +165,14 @@ static void loongarch_3a5000_initfn(Object *obj)
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

A couple of issues with this: firstly this is not the right place for these fields to 
be initialised. As per my previous comments this should be done in a separate 
loongson_cpu_init() function in hw/loongarch/loongson3.c.

Looking through the series I think this will become part of patch 15 (I shall add a 
note to the reply for this patch too) but with one small change below:

>   static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 9a8306ecbb..3eb840d159 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -151,6 +151,7 @@ extern const char * const fregnames[32];
>   
>   #define N_IRQS      14
>   #define IRQ_TIMER   11
> +#define IRQ_IPI     12
>   
>   #define LOONGARCH_STLB         2048 /* 2048 STLB */
>   #define LOONGARCH_MTLB         64   /* 64 MTLB */
> @@ -249,6 +250,9 @@ struct CPULoongArchState {
>   
>   #ifndef CONFIG_USER_ONLY
>       LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
> +
> +    AddressSpace *address_space_iocsr;
> +    MemoryRegion *system_iocsr;
>   #endif
>   };

Both address_space_iocsr and system_iocsr are effectively "owned" by the CPU so these 
should be included directly rather than being dynamically allocated i.e.

  #ifndef CONFIG_USER_ONLY
      LoongArchTLB  tlb[LOONGARCH_TLB_MAX];

      AddressSpace address_space_iocsr;
      MemoryRegion system_iocsr;
  #endif

> diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
> index b83022468e..90f469bdc0 100644
> --- a/target/loongarch/disas.c
> +++ b/target/loongarch/disas.c
> @@ -532,6 +532,14 @@ INSN(bgeu,         rr_offs)
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
> diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
> index 9354697894..30f1e688e8 100644
> --- a/target/loongarch/insn_trans/trans_privileged.c.inc
> +++ b/target/loongarch/insn_trans/trans_privileged.c.inc
> @@ -18,6 +18,14 @@ static bool trans_##name(DisasContext *ctx, arg_##name * a)  \
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
> @@ -122,4 +130,99 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
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
> index 0000000000..4023ce85aa
> --- /dev/null
> +++ b/target/loongarch/iocsr_helper.c
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + *
> + * Helpers for IOCSR reads/writes
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
> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
> +                           uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState  *cs = qemu_get_cpu(cpuid);
> +    env = cs->env_ptr;
> +    uint64_t ret;
> +
> +    /*
> +     * Adjust the per core address such as 0x10xx(IPI)/0x18xx(EXTIOI)
> +     */
> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }
> +
> +    switch (size) {
> +    case 1:
> +        ret = address_space_ldub(env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 2:
> +        ret = address_space_lduw(env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 4:
> +        ret = address_space_ldl(env->address_space_iocsr, r_addr,
> +                                MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 8:
> +        ret = address_space_ldq(env->address_space_iocsr, r_addr,
> +                                MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
> +                        target_ulong val, uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState *cs = qemu_get_cpu(cpuid);
> +    int mask, i;
> +    env = cs->env_ptr;
> +
> +    /*
> +     * For IPI send, Mailbox send and ANY send, adjust the addr and
> +     * val accordingly. The IOCSR writes are turned to different
> +     * MMIO writes respectively
> +     */
> +    switch (w_addr) {
> +    case 0x1040: /* IPI send */
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
> +        break;
> +    case 0x1048: /* Mail Send */
> +        cpuid = (val >> 16) & 0x3ff;
> +        w_addr = 0x1020 + (val & 0x1c);
> +        val = val >> 32;
> +        mask = (val >> 27) & 0xf;
> +        size = 4;
> +        env = (qemu_get_cpu(cpuid))->env_ptr;
> +        break;
> +    case 0x1158: /* ANY send */
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
> +    default:
> +       break;
> +    }
> +
> +    if (((w_addr & 0xff00) == 0x1000) || ((w_addr & 0xff00) == 0x1800)) {
> +        w_addr = w_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }
> +
> +    switch (size) {
> +    case 1:
> +        address_space_stb(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 2:
> +        address_space_stw(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 4:
> +        address_space_stl(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 8:
> +        address_space_stq(env->address_space_iocsr, w_addr,
> +                          val, MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    default:
> +        break;
> +    }
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


ATB,

Mark.

