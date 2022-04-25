Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912A250DD5F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:56:01 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivRo-0003L3-Ky
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niuqU-0006cj-C1
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:17:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41730 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niuqP-0002AT-Ad
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:17:26 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S29; 
 Mon, 25 Apr 2022 17:10:52 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/43] target/loongarch: Add TLB instruction support
Date: Mon, 25 Apr 2022 17:10:11 +0800
Message-Id: <20220425091027.2877892-28-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S29
X-Coremail-Antispam: 1UD129KBjvAXoWfGr1UAw4rXF4xXFWrWw4UJwb_yoW8ArW5Jo
 WxAw4rta1fGr4S9FnrZw1qqa1jqFyDAan7KrnY9rs8Wa48Cry7KryrKa4Yva1xGF10qFy8
 Aa1Iq3ZxJay3Zr93n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 gaosong@loongson.cn
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/disas.c                      |  18 +
 target/loongarch/helper.h                     |  13 +
 .../insn_trans/trans_privileged.c.inc         | 102 +++++
 target/loongarch/insns.decode                 |  11 +
 target/loongarch/tlb_helper.c                 | 355 ++++++++++++++++++
 5 files changed, 499 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index fcc06abc6b..8e9a6443b7 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -297,6 +297,17 @@ static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
            a->rd, a->rj, a->csr, csr_names[a->csr]);
 }
 
+static void output_empty(DisasContext *ctx, arg_empty *a,
+                         const char *mnemonic)
+{
+    output(ctx, mnemonic, "");
+}
+
+static void output_i_rr(DisasContext *ctx, arg_i_rr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "%d, r%d, r%d", a->imm, a->rj, a->rk);
+}
+
 #define INSN(insn, type)                                    \
 static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
 {                                                           \
@@ -617,6 +628,13 @@ INSN(iocsrwr_b,    rr)
 INSN(iocsrwr_h,    rr)
 INSN(iocsrwr_w,    rr)
 INSN(iocsrwr_d,    rr)
+INSN(tlbsrch,      empty)
+INSN(tlbrd,        empty)
+INSN(tlbwr,        empty)
+INSN(tlbfill,      empty)
+INSN(tlbclr,       empty)
+INSN(tlbflush,     empty)
+INSN(invtlb,       i_rr)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 4664a02dcf..b092ca75fe 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -108,3 +108,16 @@ DEF_HELPER_3(iocsrwr_b, void, env, tl, tl)
 DEF_HELPER_3(iocsrwr_h, void, env, tl, tl)
 DEF_HELPER_3(iocsrwr_w, void, env, tl, tl)
 DEF_HELPER_3(iocsrwr_d, void, env, tl, tl)
+
+/* TLB helper */
+DEF_HELPER_1(tlbwr, void, env)
+DEF_HELPER_1(tlbfill, void, env)
+DEF_HELPER_1(tlbsrch, void, env)
+DEF_HELPER_1(tlbrd, void, env)
+DEF_HELPER_1(tlbclr, void, env)
+DEF_HELPER_1(tlbflush, void, env)
+DEF_HELPER_1(invtlb_all, void, env)
+DEF_HELPER_2(invtlb_all_g, void, env, i32)
+DEF_HELPER_2(invtlb_all_asid, void, env, tl)
+DEF_HELPER_3(invtlb_page_asid, void, env, tl, tl)
+DEF_HELPER_3(invtlb_page_asid_or_g, void, env, tl, tl)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 8a1c5b8511..0363d1fda4 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -291,3 +291,105 @@ TRANS(iocsrwr_b, gen_iocsrwr, gen_helper_iocsrwr_b)
 TRANS(iocsrwr_h, gen_iocsrwr, gen_helper_iocsrwr_h)
 TRANS(iocsrwr_w, gen_iocsrwr, gen_helper_iocsrwr_w)
 TRANS(iocsrwr_d, gen_iocsrwr, gen_helper_iocsrwr_d)
+
+static void check_mmu_idx(DisasContext *ctx)
+{
+    if (ctx->mem_idx != MMU_DA_IDX) {
+        tcg_gen_exit_tb(NULL, 0);
+        ctx->base.is_jmp = DISAS_NORETURN;
+    }
+}
+
+static bool trans_tlbsrch(DisasContext *ctx, arg_tlbsrch *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbsrch(cpu_env);
+    return true;
+}
+
+static bool trans_tlbrd(DisasContext *ctx, arg_tlbrd *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbrd(cpu_env);
+    return true;
+}
+
+static bool trans_tlbwr(DisasContext *ctx, arg_tlbwr *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbwr(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_tlbfill(DisasContext *ctx, arg_tlbfill *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbfill(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_tlbclr(DisasContext *ctx, arg_tlbclr *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbclr(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_tlbflush(DisasContext *ctx, arg_tlbflush *a)
+{
+    if (check_plv(ctx)) {
+        return false;
+    }
+    gen_helper_tlbflush(cpu_env);
+    check_mmu_idx(ctx);
+    return true;
+}
+
+static bool trans_invtlb(DisasContext *ctx, arg_invtlb *a)
+{
+    TCGv rj = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv rk = gpr_src(ctx, a->rk, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+
+    switch (a->imm) {
+    case 0:
+    case 1:
+        gen_helper_invtlb_all(cpu_env);
+        break;
+    case 2:
+        gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(1));
+        break;
+    case 3:
+        gen_helper_invtlb_all_g(cpu_env, tcg_constant_i32(0));
+        break;
+    case 4:
+        gen_helper_invtlb_all_asid(cpu_env, rj);
+        break;
+    case 5:
+        gen_helper_invtlb_page_asid(cpu_env, rj, rk);
+        break;
+    case 6:
+        gen_helper_invtlb_page_asid_or_g(cpu_env, rj, rk);
+        break;
+    default:
+        return false;
+    }
+    ctx->base.is_jmp = DISAS_STOP;
+    return true;
+}
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 2b436d3cd6..f8ed11d83e 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -47,6 +47,8 @@
 &rr_offs      rj rd offs
 &r_csr        rd csr
 &rr_csr       rd rj csr
+&empty
+&i_rr         imm rj rk
 
 #
 # Formats
@@ -89,6 +91,8 @@
 @rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16
 @r_csr                    .... .... csr:14 ..... rd:5    &r_csr
 @rr_csr                    .... .... csr:14 rj:5 rd:5    &rr_csr
+@empty          .... ........ ..... ..... ..... .....    &empty
+@i_rr             ...... ...... ..... rk:5 rj:5 imm:5    &i_rr
 
 #
 # Fixed point arithmetic operation instruction
@@ -459,3 +463,10 @@ iocsrwr_b        0000 01100100 10000 00100 ..... .....    @rr
 iocsrwr_h        0000 01100100 10000 00101 ..... .....    @rr
 iocsrwr_w        0000 01100100 10000 00110 ..... .....    @rr
 iocsrwr_d        0000 01100100 10000 00111 ..... .....    @rr
+tlbsrch          0000 01100100 10000 01010 00000 00000    @empty
+tlbrd            0000 01100100 10000 01011 00000 00000    @empty
+tlbwr            0000 01100100 10000 01100 00000 00000    @empty
+tlbfill          0000 01100100 10000 01101 00000 00000    @empty
+tlbclr           0000 01100100 10000 01000 00000 00000    @empty
+tlbflush         0000 01100100 10000 01001 00000 00000    @empty
+invtlb           0000 01100100 10011 ..... ..... .....    @i_rr
diff --git a/target/loongarch/tlb_helper.c b/target/loongarch/tlb_helper.c
index fad8bc7746..4f84ef3e4b 100644
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
@@ -280,6 +282,359 @@ static void raise_mmu_exception(CPULoongArchState *env, target_ulong address,
    }
 }
 
+static void invalidate_tlb_entry(CPULoongArchState *env, int index)
+{
+    target_ulong addr, mask, pagesize;
+    uint8_t tlb_ps;
+    LoongArchTLB *tlb = &env->tlb[index];
+
+    int mmu_idx = cpu_mmu_index(env, false);
+    uint8_t tlb_v0 = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, V);
+    uint8_t tlb_v1 = FIELD_EX64(tlb->tlb_entry1, TLBENTRY, V);
+    uint64_t tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+
+    if (index >= LOONGARCH_STLB) {
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    } else {
+        tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    }
+    pagesize = 1 << tlb_ps;
+    mask = MAKE_64BIT_MASK(0, tlb_ps + 1);
+
+    if (tlb_v0) {
+        addr = (tlb_vppn << R_TLB_MISC_VPPN_SHIFT) & ~mask;    /* even */
+        tlb_flush_range_by_mmuidx(env_cpu(env), addr, pagesize,
+                                  mmu_idx, TARGET_LONG_BITS);
+    }
+
+    if (tlb_v1) {
+        addr = (tlb_vppn << R_TLB_MISC_VPPN_SHIFT) & pagesize;    /* odd */
+        tlb_flush_range_by_mmuidx(env_cpu(env), addr, pagesize,
+                                  mmu_idx, TARGET_LONG_BITS);
+    }
+}
+
+static void invalidate_tlb(CPULoongArchState *env, int index)
+{
+    LoongArchTLB *tlb;
+    uint16_t csr_asid, tlb_asid, tlb_g;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb = &env->tlb[index];
+    tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+    tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+    if (tlb_g == 0 && tlb_asid != csr_asid) {
+        return;
+    }
+    invalidate_tlb_entry(env, index);
+}
+
+static void fill_tlb_entry(CPULoongArchState *env, int index)
+{
+    LoongArchTLB *tlb = &env->tlb[index];
+    uint64_t lo0, lo1, csr_vppn;
+    uint16_t csr_asid;
+    uint8_t csr_ps;
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
+    /* Only MTLB has the ps fields */
+    if (index >= LOONGARCH_STLB) {
+        tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, PS, csr_ps);
+    }
+
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, VPPN, csr_vppn);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 1);
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, ASID, csr_asid);
+
+    tlb->tlb_entry0 = lo0;
+    tlb->tlb_entry1 = lo1;
+}
+
+/* Return an random value between low and high */
+static uint32_t get_random_tlb(uint32_t low, uint32_t high)
+{
+    uint32_t val;
+
+    qemu_guest_getrandom_nofail(&val, sizeof(val));
+    return val % (high - low + 1) + low;
+}
+
+void helper_tlbsrch(CPULoongArchState *env)
+{
+    int index, match;
+
+    if (FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR)) {
+        match = loongarch_tlb_search(env, env->CSR_TLBREHI, &index);
+    } else {
+        match = loongarch_tlb_search(env, env->CSR_TLBEHI, &index);
+    }
+
+    if (match) {
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX, index);
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 0);
+        return;
+    }
+
+    env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+}
+
+void helper_tlbrd(CPULoongArchState *env)
+{
+    LoongArchTLB *tlb;
+    int index;
+    uint8_t tlb_ps, tlb_e;
+
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+    tlb = &env->tlb[index];
+
+    if (index >= LOONGARCH_STLB) {
+        tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+    } else {
+        tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+    }
+    tlb_e = FIELD_EX64(tlb->tlb_misc, TLB_MISC, E);
+
+    if (!tlb_e) {
+        /* Invalid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 1);
+        env->CSR_ASID  = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID, 0);
+        env->CSR_TLBEHI = 0;
+        env->CSR_TLBELO0 = 0;
+        env->CSR_TLBELO1 = 0;
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, PS, 0);
+    } else {
+        /* Valid TLB entry */
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX, NE, 0);
+        env->CSR_TLBIDX = FIELD_DP64(env->CSR_TLBIDX, CSR_TLBIDX,
+                                     PS, (tlb_ps & 0x3f));
+        env->CSR_TLBEHI = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN) <<
+                                     R_TLB_MISC_VPPN_SHIFT;
+        env->CSR_TLBELO0 = tlb->tlb_entry0;
+        env->CSR_TLBELO1 = tlb->tlb_entry1;
+    }
+}
+
+void helper_tlbwr(CPULoongArchState *env)
+{
+    int index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    invalidate_tlb(env, index);
+
+    if (FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, NE)) {
+        env->tlb[index].tlb_misc = FIELD_DP64(env->tlb[index].tlb_misc,
+                                              TLB_MISC, E, 0);
+        return;
+    }
+
+    fill_tlb_entry(env, index);
+}
+
+void helper_tlbfill(CPULoongArchState *env)
+{
+    uint64_t address, entryhi;
+    int index, set, stlb_idx;
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
+    stlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+
+    if (pagesize == stlb_ps) {
+        /* Only write into STLB bits [47:13] */
+        address = entryhi & ~MAKE_64BIT_MASK(0, R_CSR_TLBEHI_VPPN_SHIFT);
+
+        /* Choose one set ramdomly */
+        set = get_random_tlb(0, 7);
+
+        /* Index in one set */
+        stlb_idx = (address >> (stlb_ps + 1)) & 0xff; /* [0,255] */
+
+        index = set * 256 + stlb_idx;
+    } else {
+        /* Only write into MTLB */
+        index = get_random_tlb(LOONGARCH_STLB, LOONGARCH_TLB_MAX - 1);
+    }
+
+    invalidate_tlb(env, index);
+    fill_tlb_entry(env, index);
+}
+
+void helper_tlbclr(CPULoongArchState *env)
+{
+    LoongArchTLB *tlb;
+    int i, index;
+    uint16_t csr_asid, tlb_asid, tlb_g;
+
+    csr_asid = FIELD_EX64(env->CSR_ASID, CSR_ASID, ASID);
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < LOONGARCH_STLB) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            tlb = &env->tlb[i * 256 + (index % 256)];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+            if (!tlb_g && tlb_asid == csr_asid) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+    } else if (index < LOONGARCH_TLB_MAX) {
+        /* All MTLB entries */
+        for (i = LOONGARCH_STLB; i < LOONGARCH_TLB_MAX; i++) {
+            tlb = &env->tlb[i];
+            tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+            tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+            if (!tlb_g && tlb_asid == csr_asid) {
+                tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+            }
+        }
+    }
+
+    tlb_flush(env_cpu(env));
+}
+
+void helper_tlbflush(CPULoongArchState *env)
+{
+    int i, index;
+
+    index = FIELD_EX64(env->CSR_TLBIDX, CSR_TLBIDX, INDEX);
+
+    if (index < LOONGARCH_STLB) {
+        /* STLB. One line per operation */
+        for (i = 0; i < 8; i++) {
+            int s_idx = i * 256 + (index % 256);
+            env->tlb[s_idx].tlb_misc = FIELD_DP64(env->tlb[s_idx].tlb_misc,
+                                                  TLB_MISC, E, 0);
+        }
+    } else if (index < LOONGARCH_TLB_MAX) {
+        /* All MTLB entries */
+        for (i = LOONGARCH_STLB; i < LOONGARCH_TLB_MAX; i++) {
+            env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc,
+                                              TLB_MISC, E, 0);
+        }
+    }
+
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_all(CPULoongArchState *env)
+{
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        env->tlb[i].tlb_misc = FIELD_DP64(env->tlb[i].tlb_misc,
+                                          TLB_MISC, E, 0);
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_all_g(CPULoongArchState *env, uint32_t g)
+{
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+
+        if (tlb_g == g) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_all_asid(CPULoongArchState *env, target_ulong info)
+{
+    uint16_t asid = info & R_CSR_ASID_ASID_MASK;
+
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+        uint16_t tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+
+        if (!tlb_g && (tlb_asid == asid)) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_page_asid(CPULoongArchState *env, target_ulong info,
+                             target_ulong addr)
+{
+    uint16_t asid = info & 0x3ff;
+
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+        uint16_t tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        uint64_t vpn, tlb_vppn;
+        uint8_t tlb_ps, compare_shift;
+
+        if (i >= LOONGARCH_STLB) {
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+        } else {
+            tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+        }
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+        vpn = (addr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+        compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+
+        if (!tlb_g && (tlb_asid == asid) &&
+           (vpn == (tlb_vppn >> compare_shift))) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
+void helper_invtlb_page_asid_or_g(CPULoongArchState *env,
+                                  target_ulong info, target_ulong addr)
+{
+    uint16_t asid = info & 0x3ff;
+
+    for (int i = 0; i < LOONGARCH_TLB_MAX; i++) {
+        LoongArchTLB *tlb = &env->tlb[i];
+        uint8_t tlb_g = FIELD_EX64(tlb->tlb_entry0, TLBENTRY, G);
+        uint16_t tlb_asid = FIELD_EX64(tlb->tlb_misc, TLB_MISC, ASID);
+        uint64_t vpn, tlb_vppn;
+        uint8_t tlb_ps, compare_shift;
+
+        if (i >= LOONGARCH_STLB) {
+            tlb_ps = FIELD_EX64(tlb->tlb_misc, TLB_MISC, PS);
+        } else {
+            tlb_ps = FIELD_EX64(env->CSR_STLBPS, CSR_STLBPS, PS);
+        }
+        tlb_vppn = FIELD_EX64(tlb->tlb_misc, TLB_MISC, VPPN);
+        vpn = (addr & TARGET_VIRT_MASK) >> (tlb_ps + 1);
+        compare_shift = tlb_ps + 1 - R_TLB_MISC_VPPN_SHIFT;
+
+        if ((tlb_g || (tlb_asid == asid)) &&
+            (vpn == (tlb_vppn >> compare_shift))) {
+            tlb->tlb_misc = FIELD_DP64(tlb->tlb_misc, TLB_MISC, E, 0);
+        }
+    }
+    tlb_flush(env_cpu(env));
+}
+
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr)
-- 
2.31.1


