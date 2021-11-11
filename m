Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7E44CF2F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:44:19 +0100 (CET)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz8U-0000iw-DA
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:44:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0K-0005fX-65
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53988 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0D-0001i7-MT
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:48 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S11; 
 Thu, 11 Nov 2021 09:35:41 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 09/30] target/loongarch: Add TLB instruction support
Date: Thu, 11 Nov 2021 09:35:07 +0800
Message-Id: <1636594528-8175-10-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S11
X-Coremail-Antispam: 1UD129KBjvAXoWfAr45Ar13Aw43Cw4xKF45ZFb_yoW8tr1Uuo
 WfZa1rt3WfCa1S9FnFvw1vqa1jqryDA3Z2kr1vvrs8WFW0kr9rKryfKa45Aa1fCFy0qF1x
 JF42q3W3GrW3Zr13n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- TLBSRCH
- TLBRD
- TLBWR
- TLBFILL
- TLBCLR
- TLBFLUSH
- INVTLB

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/helper.h                    |   8 +
 target/loongarch/insn_trans/trans_core.c.inc |  71 +++
 target/loongarch/insns.decode                |  14 +
 target/loongarch/tlb_helper.c                | 478 +++++++++++++++++++
 4 files changed, 571 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index ad4fac4c5a..dea0087273 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -102,4 +102,12 @@ DEF_HELPER_3(csr_wrq, i64, env, tl, i64)
 DEF_HELPER_4(csr_xchgq, i64, env, tl, tl, i64)
 DEF_HELPER_3(iocsr_read, i64, env, tl, i32)
 DEF_HELPER_4(iocsr_write, void, env, tl, tl, i32)
+
+DEF_HELPER_1(tlbwr, void, env)
+DEF_HELPER_1(tlbfill, void, env)
+DEF_HELPER_1(tlbsrch, void, env)
+DEF_HELPER_1(tlbrd, void, env)
+DEF_HELPER_1(tlbclr, void, env)
+DEF_HELPER_1(tlbflush, void, env)
+DEF_HELPER_4(invtlb, void, env, tl, tl, tl)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c.inc b/target/loongarch/insn_trans/trans_core.c.inc
index a6ab2571d1..c34163efec 100644
--- a/target/loongarch/insn_trans/trans_core.c.inc
+++ b/target/loongarch/insn_trans/trans_core.c.inc
@@ -28,6 +28,13 @@ GEN_FALSE_TRANS(iocsrwr_b)
 GEN_FALSE_TRANS(iocsrwr_h)
 GEN_FALSE_TRANS(iocsrwr_w)
 GEN_FALSE_TRANS(iocsrwr_d)
+GEN_FALSE_TRANS(tlbsrch)
+GEN_FALSE_TRANS(tlbrd)
+GEN_FALSE_TRANS(tlbwr)
+GEN_FALSE_TRANS(tlbfill)
+GEN_FALSE_TRANS(tlbclr)
+GEN_FALSE_TRANS(tlbflush)
+GEN_FALSE_TRANS(invtlb)
 
 #else
 static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
@@ -434,4 +441,68 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
     gen_helper_iocsr_write(cpu_env, addr, val, tcg_constant_i32(8));
     return true;
 }
+
+static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
+{
+    gen_helper_check_plv(cpu_env);
+    gen_helper_tlbsrch(cpu_env);
+    return true;
+}
+
+static bool trans_tlbrd(DisasContext *ctx, arg_tlbrd *a)
+{
+    gen_helper_check_plv(cpu_env);
+    gen_helper_tlbrd(cpu_env);
+    return true;
+}
+
+static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
+{
+    gen_helper_check_plv(cpu_env);
+    gen_helper_tlbwr(cpu_env);
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    ctx->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
+static bool trans_tlbfill(DisasContext *ctx, arg_tlbfill *a)
+{
+    gen_helper_check_plv(cpu_env);
+    gen_helper_tlbfill(cpu_env);
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    ctx->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
+static bool trans_tlbclr(DisasContext *ctx, arg_tlbclr *a)
+{
+    gen_helper_check_plv(cpu_env);
+    gen_helper_tlbclr(cpu_env);
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    ctx->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
+static bool trans_tlbflush(DisasContext *ctx, arg_tlbflush *a)
+{
+    gen_helper_check_plv(cpu_env);
+    gen_helper_tlbflush(cpu_env);
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    ctx->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
+static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
+{
+    TCGv rj = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv rk = gpr_src(ctx, a->rk, EXT_NONE);
+    TCGv op = tcg_constant_tl(a->invop);
+
+    gen_helper_check_plv(cpu_env);
+    gen_helper_invtlb(cpu_env, rj, rk, op);
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    ctx->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
 #endif
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index a867cb84d2..f5031e089e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -41,6 +41,9 @@
 %offs16  10:s16
 %offs    0:s10 10:16
 %csr     10:14
+%addr    10:5
+%info    5:5
+%invop   0:5
 
 #
 # Argument sets
@@ -84,6 +87,8 @@
 &fmt_rjrdoffs16     rj rd offs16
 &fmt_rdcsr          rd csr
 &fmt_rdrjcsr        rd rj csr
+&fmt_empty
+&fmt_invtlb         invop rj rk
 
 #
 # Formats
@@ -127,6 +132,8 @@
 @fmt_rjrdoffs16      .... .. ................ ..... .....     &fmt_rjrdoffs16     %rj %rd %offs16
 @fmt_rdcsr           .... .... .............. ..... .....     &fmt_rdcsr          %rd %csr
 @fmt_rdrjcsr         .... .... .............. ..... .....     &fmt_rdrjcsr        %rd %rj %csr
+@fmt_empty           .... ........ ..... ..... ..... .....    &fmt_empty
+@fmt_invtlb          ...... ...... ..... ..... ..... .....    &fmt_invtlb         %invop %rj %rk
 
 #
 # Fixed point arithmetic operation instruction
@@ -499,3 +506,10 @@ iocsrwr_b        0000 01100100 10000 00100 ..... .....    @fmt_rdrj
 iocsrwr_h        0000 01100100 10000 00101 ..... .....    @fmt_rdrj
 iocsrwr_w        0000 01100100 10000 00110 ..... .....    @fmt_rdrj
 iocsrwr_d        0000 01100100 10000 00111 ..... .....    @fmt_rdrj
+tlbsrch          0000 01100100 10000 01010 00000 00000    @fmt_empty
+tlbrd            0000 01100100 10000 01011 00000 00000    @fmt_empty
+tlbwr            0000 01100100 10000 01100 00000 00000    @fmt_empty
+tlbfill          0000 01100100 10000 01101 00000 00000    @fmt_empty
+tlbclr           0000 01100100 10000 01000 00000 00000    @fmt_empty
+tlbflush         0000 01100100 10000 01001 00000 00000    @fmt_empty
+invtlb           0000 01100100 10011 ..... ..... .....    @fmt_invtlb
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index 69c69ece0a..f36e379499 100644
--- a/target/loongarch/tlb_helper.c
+++ b/target/loongarch/tlb_helper.c
@@ -7,9 +7,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/guest-random.h"
 
 #include "cpu.h"
 #include "internals.h"
+#include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
@@ -284,6 +286,482 @@ static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
 
 }
 
+static void cpu_loongarch_tlb_flush(CPULoongArchState *env)
+{
+    /* Flush qemu's TLB and discard all shadowed entries. */
+    tlb_flush(env_cpu(env));
+}
+
+static void loongarch_invalidate_tlb_entry(CPULoongArchState *env,
+                                           loongarch_tlb *tlb)
+{
+    CPUState *cs = env_cpu(env);
+    target_ulong addr, end, mask;
+    int tlb_v0, tlb_v1;
+    uint64_t tlb_vppn;
+    uint8_t tlb_ps;
+
+    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
+    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
+    tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    mask = (1 << (1 + tlb_ps)) - 1;
+
+    if (tlb_v0) {
+        addr = tlb_vppn & ~mask;    /* xxx...xxx[0]000..0000 */
+        end = addr | (mask >> 1);   /* xxx...xxx[0]111..1111 */
+        while (addr < end) {
+            tlb_flush_page(cs, addr);
+            addr += TARGET_PAGE_SIZE;
+        }
+    }
+
+    if (tlb_v1) {
+        /* xxx...xxx[1]000..0000 */
+        addr = (tlb_vppn & ~mask) | ((mask >> 1) + 1);
+        end = addr | mask;              /* xxx...xxx[1]111..1111 */
+        while (addr - 1 < end) {
+            tlb_flush_page(cs, addr);
+            addr += TARGET_PAGE_SIZE;
+        }
+    }
+}
+
+static void loongarch_invalidate_tlb(CPULoongArchState *env, int idx)
+{
+    loongarch_tlb *tlb;
+    uint16_t csr_asid, tlb_asid, tlb_g;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb = &env->tlb[idx];
+    tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+    tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+    if (tlb_g == 0 && tlb_asid != csr_asid) {
+        return;
+    }
+    loongarch_invalidate_tlb_entry(env, tlb);
+}
+
+static void loongarch_fill_tlb_entry(CPULoongArchState *env,
+                                     loongarch_tlb *tlb, int is_stlb)
+{
+    uint64_t lo0, lo1, csr_vppn;
+    uint16_t csr_asid;
+    uint8_t csr_g, stlb_ps, csr_ps;
+
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        csr_ps = FIELD_EX64(env->CSR_TLBREHI, CSR_TLBREHI, PS);
+        csr_vppn = FIELD_EX64(env->CSR_TLBREHI, CSR_TLBREHI, VPPN);
+        lo0 = env->CSR_TLBRELO0;
+        lo1 = env->CSR_TLBRELO1;
+    } else {
+        csr_ps = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, PS);
+        csr_vppn = FIELD_EX64(env->CSR_TLBEHI, CSR_TLBEHI, VPPN);
+        lo0 = env->CSR_TLBELO0;
+        lo1 = env->CSR_TLBELO1;
+    }
+
+    if (csr_ps == 0) {
+        qemu_log_mask(CPU_LOG_MMU, "page size is 0\n");
+    }
+
+    /*
+     *       15-12  11-8   7-4    3-0
+     *  4KB: 0001   1111   1111   1111 // double 4KB  mask [12:0]
+     * 16KB: 0111   1111   1111   1111 // double 16KB mask [14:0]
+     */
+    if (is_stlb) {
+        stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+        tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, PS, stlb_ps);
+    } else {
+        tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, PS, csr_ps);
+    }
+
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, VPPN, csr_vppn);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 1);
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, ASID, csr_asid);
+
+    csr_g = FIELD_EX64(env->CSR_TLBELO0, CSR_TLBELO0, G) &
+             FIELD_EX64(env->CSR_TLBELO1, CSR_TLBELO1, G);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, G, csr_g);
+
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, V,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, V));/* [0] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, D,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, D));/* [1] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, PLV,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, PLV));/* [3:2] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, MAT,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, MAT));/* [5:4] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, PPN,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, PPN));/* [47:12] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, NR,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, NR));/* [61] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, NX,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, NX));/* [62] */
+    tlb->tlb_entry0 = FIELD_DP64(tlb->tlb_entry0, ENTRY0, RPLV,
+                                 FIELD_EX64(lo0, CSR_TLBELO0, RPLV));/* [63] */
+
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, V,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, V));/* [0] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, D,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, D));/* [1] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, PLV,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, PLV));/* [3:2] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, MAT,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, MAT));/* [5:4] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, PPN,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, PPN));/* [47:12] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, NR,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, NR));/* [61] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, NX,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, NX));/* [62] */
+    tlb->tlb_entry1 = FIELD_DP64(tlb->tlb_entry1, ENTRY1, RPLV,
+                                 FIELD_EX64(lo1, CSR_TLBELO1, RPLV));/* [63] */
+}
+
+static void loongarch_fill_tlb(CPULoongArchState *env, int idx)
+{
+    loongarch_tlb *tlb;
+    tlb = &env->tlb[idx];
+
+    if (idx < 2048) {
+        loongarch_fill_tlb_entry(env, tlb, 1);
+    } else {
+        loongarch_fill_tlb_entry(env, tlb, 0);
+    }
+}
+
+/* Return random value in [low, high] */
+static uint32_t cpu_loongarch_get_random_loongarch_tlb(uint32_t low,
+                                                       uint32_t high)
+{
+    uint32_t val;
+
+    qemu_guest_getrandom_nofail(&val, sizeof(val));
+    return val % (high - low + 1) + low;
+}
+
+void helper_tlbsrch(CPULoongArchState *env)
+{
+    loongarch_tlb *tlb;
+    uint64_t vpn, tlb_vppn;
+    uint16_t csr_asid, tlb_asid, tlb_ps, tlb_e, tlb_g;
+
+    int stlb_size = env->stlb_size;
+    int mtlb_size = env->mtlb_size;
+    int i;
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+
+    /* Search MTLB + STLB */
+    for (i = 0; i < stlb_size + mtlb_size; ++i) {
+        tlb = &env->tlb[i];
+        vpn = FIELD_EX64(env->CSR_TLBEHI, CSR_TLBEHI, VPPN);
+        tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+        tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+        tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+
+        if ((tlb_g == 1 || tlb_asid == csr_asid) &&
+            (vpn >> (tlb_ps + 1 - 13) == tlb_vppn >> (tlb_ps + 1 - 13)) && tlb_e) {
+            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                         INDEX, (i & 0xfff));
+            env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                         PS, (tlb_ps & 0x3f));
+            return;
+        }
+    }
+
+    env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+}
+
+void helper_tlbrd(CPULoongArchState *env)
+{
+    loongarch_tlb *tlb;
+    int idx;
+    uint16_t csr_asid, tlb_asid;
+    uint8_t tlb_ps, tlb_e, tlb_v0, tlb_v1, tlb_d0, tlb_d1;
+    uint8_t tlb_plv0, tlb_plv1, tlb_mat0, tlb_mat1, tlb_g;
+    uint64_t tlb_ppn0, tlb_ppn1;
+    uint8_t tlb_nr0, tlb_nr1, tlb_nx0, tlb_nx1, tlb_rplv0, tlb_rplv1;
+
+    idx = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+    tlb = &env->tlb[idx];
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+    tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+    tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+
+    tlb_v0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, V);
+    tlb_d0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, D);
+    tlb_plv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PLV);
+    tlb_mat0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, MAT);
+    tlb_ppn0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, PPN);
+    tlb_nr0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NR);
+    tlb_nx0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, NX);
+    tlb_rplv0 = FIELD_EX64(tlb->tlb_entry0, ENTRY0, RPLV);
+
+    tlb_v1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, V);
+    tlb_d1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, D);
+    tlb_plv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PLV);
+    tlb_mat1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, MAT);
+    tlb_ppn1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, PPN);
+    tlb_nr1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NR);
+    tlb_nx1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, NX);
+    tlb_rplv1 = FIELD_EX64(tlb->tlb_entry1, ENTRY1, RPLV);
+
+    if (csr_asid != tlb_asid) {
+        cpu_loongarch_tlb_flush(env);
+    }
+
+    if (!tlb_e) {
+        /* Invalid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+        env->CSR_TLBEHI = 0;
+        env->CSR_TLBELO0 = 0;
+        env->CSR_TLBELO1 = 0;
+    } else {
+        /* Valid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                     INDEX, (idx & 0xfff));
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                     PS, (tlb_ps & 0x3f));
+
+        env->CSR_TLBEHI = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN) << 13;
+
+        env->CSR_TLBELO0 = FIELD_DP64(0, CSR_TLBELO0, V, tlb_v0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, D, tlb_d0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PLV, tlb_plv0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, MAT, tlb_mat0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, G, tlb_g);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, PPN, tlb_ppn0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NR, tlb_nr0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, NX, tlb_nx0);
+        env->CSR_TLBELO0 = FIELD_DP64(env->CSR_TLBELO0, CSR_TLBELO0, RPLV, tlb_rplv0);
+
+        env->CSR_TLBELO1 = FIELD_DP64(0, CSR_TLBELO1, V, tlb_v1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, D, tlb_d1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PLV, tlb_plv1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, MAT, tlb_mat1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, G, tlb_g);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, PPN, tlb_ppn1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NR, tlb_nr1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, NX, tlb_nx1);
+        env->CSR_TLBELO1 = FIELD_DP64(env->CSR_TLBELO1, CSR_TLBELO1, RPLV, tlb_rplv1);
+    }
+    env->CSR_ASID  = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID, tlb_asid);
+}
+
+void helper_tlbwr(CPULoongArchState *env)
+{
+    int idx = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX); /* 0-11 */
+
+    loongarch_invalidate_tlb(env, idx);
+
+    if (FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, NE)) {
+        env->tlb[idx].tlb_misc = FIELD_DP64(env->tlb[idx].tlb_misc,
+                                            TLB_MISC, E, 0);
+        return;
+    }
+
+    loongarch_fill_tlb(env, idx);
+}
+
+void helper_tlbfill(CPULoongArchState *env)
+{
+    uint64_t address, entryhi;
+    int idx, set, stlb_idx;
+    uint16_t pagesize, stlb_ps;
+
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        entryhi = env->CSR_TLBREHI;
+        pagesize = FIELD_EX64(env->CSR_TLBREHI, CSR_TLBREHI, PS);
+    } else {
+        entryhi = env->CSR_TLBEHI;
+        pagesize = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, PS);
+    }
+
+    uint32_t stlb_size = env->stlb_size;
+    uint32_t mtlb_size = env->mtlb_size;
+
+    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+
+    if (pagesize == stlb_ps && env->stlb_size > 0) {
+        /* Only write into STLB */
+        address = entryhi & 0xffffffffe000; /* [47:13] */
+
+        /* Choose one set ramdomly */
+        set = cpu_loongarch_get_random_loongarch_tlb(0, 7);
+
+        /* Index in one set */
+        stlb_idx = (address >> 15) & 0xff; /* [0,255] */
+
+        idx = set * 256 + stlb_idx;
+    } else {
+        /* Only write into MTLB */
+        idx = cpu_loongarch_get_random_loongarch_tlb(
+                stlb_size, stlb_size + mtlb_size - 1);
+    }
+
+    loongarch_invalidate_tlb(env, idx);
+    loongarch_fill_tlb(env, idx);
+}
+
+void helper_tlbclr(CPULoongArchState *env)
+{
+    loongarch_tlb *tlb;
+    int i;
+    uint16_t csr_asid, tlb_asid, tlb_g;
+    int msize, ssize, index;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    msize = env->mtlb_size;
+    ssize = env->stlb_size;
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < ssize) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            tlb = &env->tlb[i * 256 + (index % 256)];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+            if (!tlb_g && tlb_asid == csr_asid) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+    } else if (index < (ssize + msize)) {
+        /* MTLB. All entries */
+        for (i = ssize; i < ssize + msize; i++) {
+            tlb = &env->tlb[i];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+            if (!tlb_g && tlb_asid == csr_asid) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+    }
+
+    cpu_loongarch_tlb_flush(env);
+}
+
+void helper_tlbflush(CPULoongArchState *env)
+{
+    int i;
+    int msize, ssize, index;
+
+    msize = env->mtlb_size;
+    ssize = env->stlb_size;
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < ssize) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            int idx = i * 256 + (index % 256);
+            env->tlb[idx].tlb_misc = FIELD_DP64(env->tlb[idx].tlb_misc,
+                                                TLB_MISC, E, 0);
+        }
+    } else if (index < (ssize + msize)) {
+        /* MTLB. All entries */
+        for (i = ssize; i < ssize + msize; i++) {
+            env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc,
+                                              TLB_MISC, E, 0);
+        }
+    }
+
+    cpu_loongarch_tlb_flush(env);
+}
+
+void helper_invtlb(CPULoongArchState *env, target_ulong addr,
+                   target_ulong info, target_ulong op)
+{
+    uint32_t csr_asid = info & 0x3ff;
+    uint16_t tlb_asid, tlb_g;
+    int i;
+
+    switch (op) {
+    case 0:
+    case 1:
+        for (i = 0; i < LOONGARCH_TLB_MAX; i++) {
+            env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc,
+                                              TLB_MISC, E, 0);
+        }
+        break;
+    case 2:
+        for (i = 0; i < LOONGARCH_TLB_MAX; i++) {
+            loongarch_tlb *tlb = &env->tlb[i];
+
+            if (FIELD_EX64(tlb->tlb_misc, TLB_MISC, G)) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+        break;
+    case 3:
+        for (i = 0; i < LOONGARCH_TLB_MAX; i++) {
+            loongarch_tlb *tlb = &env->tlb[i];
+
+            if (!FIELD_EX64(tlb->tlb_misc, TLB_MISC, G)) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+        break;
+    case 4:
+        for (i = 0; i < LOONGARCH_TLB_MAX; i++) {
+            loongarch_tlb *tlb = &env->tlb[i];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+
+            if (!FIELD_EX64(tlb->tlb_misc, TLB_MISC, G) &&
+               (tlb_asid == csr_asid)) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+        break;
+    case 5:
+        for (i = 0; i < LOONGARCH_TLB_MAX; i++) {
+            loongarch_tlb *tlb = &env->tlb[i];
+            uint64_t vpn, tlb_vppn;
+            uint8_t tlb_ps;
+
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+            vpn = (addr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+
+            if (!tlb_g && tlb_asid == csr_asid &&
+               (vpn == (tlb_vppn >> (tlb_ps + 1 - 13)))) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+        break;
+    case 6:
+        for (i = 0; i < LOONGARCH_TLB_MAX; i++) {
+            loongarch_tlb *tlb = &env->tlb[i];
+            uint64_t vpn, tlb_vppn;
+            uint8_t tlb_ps;
+
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_misc, TLB_MISC, G);
+            tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+            vpn = (addr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+
+            if ((tlb_g || tlb_asid == csr_asid) &&
+                (vpn == (tlb_vppn >> (tlb_ps + 1 - 13)))) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+        break;
+    default:
+        do_raise_exception(env, EXCP_INE, GETPC());
+    }
+
+    cpu_loongarch_tlb_flush(env);
+}
+
 void loongarch_mmu_init(CPULoongArchState *env)
 {
     /* Number of MTLB */
-- 
2.27.0


