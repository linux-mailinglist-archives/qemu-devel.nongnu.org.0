Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEB45CC83
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:52:42 +0100 (CET)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxNp-0006df-K7
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5e-0007PC-Es
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:56 -0500
Received: from mail.xen0n.name ([115.28.160.31]:43568
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mpx5Z-0004ky-Tp
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:33:54 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BF0C660B01;
 Thu, 25 Nov 2021 02:33:30 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1637778810; bh=TQqGS/syu7Qa/Okb8QlqskgCdQ4TIrtIUDFlx/LzvHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cEo07PgfaHhAsyzrXElWUMarWSRiadx10XDxn4BN183dbPbCJG+g6Ob7bfD8U5EUt
 bunmI4xniip5xX/ZunYThVkrfH2HMZ3Nmcu/zBNvp6w6Sg+fCYkV76tsTkQ0zUu++q
 dmwkxfFOqj3azeyW3RFd+Hr8V/DY2zT35bToehrk=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v8 23/31] tcg/loongarch64: Add softmmu load/store
 helpers, implement qemu_ld/qemu_st ops
Date: Thu, 25 Nov 2021 02:32:23 +0800
Message-Id: <20211124183231.1503090-24-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211124183231.1503090-1-git@xen0n.name>
References: <20211124183231.1503090-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |   2 +
 tcg/loongarch64/tcg-target.c.inc     | 353 +++++++++++++++++++++++++++
 2 files changed, 355 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index e54ca9b2de..349c672687 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -17,7 +17,9 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
+C_O0_I2(LZ, L)
 C_O1_I1(r, r)
+C_O1_I1(r, L)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index fec22cfaf6..c92587c823 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -117,6 +117,11 @@ static const int tcg_target_call_oarg_regs[] = {
     TCG_REG_A1,
 };
 
+#ifndef CONFIG_SOFTMMU
+#define USE_GUEST_BASE     (guest_base != 0)
+#define TCG_GUEST_BASE_REG TCG_REG_S1
+#endif
+
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
 #define TCG_CT_CONST_N12   0x400
@@ -632,6 +637,333 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
+/*
+ * Load/store helpers for SoftMMU, and qemu_ld/st implementations
+ */
+
+#if defined(CONFIG_SOFTMMU)
+#include "../tcg-ldst.c.inc"
+
+/*
+ * helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
+ *                                     MemOpIdx oi, uintptr_t ra)
+ */
+static void * const qemu_ld_helpers[4] = {
+    [MO_8]  = helper_ret_ldub_mmu,
+    [MO_16] = helper_le_lduw_mmu,
+    [MO_32] = helper_le_ldul_mmu,
+    [MO_64] = helper_le_ldq_mmu,
+};
+
+/*
+ * helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
+ *                                     uintxx_t val, MemOpIdx oi,
+ *                                     uintptr_t ra)
+ */
+static void * const qemu_st_helpers[4] = {
+    [MO_8]  = helper_ret_stb_mmu,
+    [MO_16] = helper_le_stw_mmu,
+    [MO_32] = helper_le_stl_mmu,
+    [MO_64] = helper_le_stq_mmu,
+};
+
+/* We expect to use a 12-bit negative offset from ENV.  */
+QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+
+static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
+{
+    tcg_out_opc_b(s, 0);
+    return reloc_br_sd10k16(s->code_ptr - 1, target);
+}
+
+/*
+ * Emits common code for TLB addend lookup, that eventually loads the
+ * addend in TCG_REG_TMP2.
+ */
+static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, MemOpIdx oi,
+                             tcg_insn_unit **label_ptr, bool is_load)
+{
+    MemOp opc = get_memop(oi);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_bits = get_alignment_bits(opc);
+    tcg_target_long compare_mask;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
+
+    tcg_out_opc_srli_d(s, TCG_REG_TMP2, addrl,
+                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
+    tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+               is_load ? offsetof(CPUTLBEntry, addr_read)
+               : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
+               offsetof(CPUTLBEntry, addend));
+
+    /* We don't support unaligned accesses.  */
+    if (a_bits < s_bits) {
+        a_bits = s_bits;
+    }
+    /* Clear the non-page, non-alignment bits from the address.  */
+    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
+
+    /* Compare masked address with the TLB entry.  */
+    label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    /* TLB Hit - addend in TCG_REG_TMP2, ready for use.  */
+}
+
+static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
+                                TCGType type,
+                                TCGReg datalo, TCGReg addrlo,
+                                void *raddr, tcg_insn_unit **label_ptr)
+{
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->oi = oi;
+    label->type = type;
+    label->datalo_reg = datalo;
+    label->datahi_reg = 0; /* unused */
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = 0; /* unused */
+    label->raddr = tcg_splitwx_to_rx(raddr);
+    label->label_ptr[0] = label_ptr[0];
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    MemOpIdx oi = l->oi;
+    MemOp opc = get_memop(oi);
+    MemOp size = opc & MO_SIZE;
+    TCGType type = l->type;
+
+    /* resolve label address */
+    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    /* call load helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_ld_helpers[size]);
+
+    switch (opc & MO_SSIZE) {
+    case MO_SB:
+        tcg_out_ext8s(s, l->datalo_reg, TCG_REG_A0);
+        break;
+    case MO_SW:
+        tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
+        break;
+    case MO_SL:
+        tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
+        break;
+    case MO_UL:
+        if (type == TCG_TYPE_I32) {
+            /* MO_UL loads of i32 should be sign-extended too */
+            tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
+            break;
+        }
+        /* fallthrough */
+    default:
+        tcg_out_mov(s, type, l->datalo_reg, TCG_REG_A0);
+        break;
+    }
+
+    return tcg_out_goto(s, l->raddr);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    MemOpIdx oi = l->oi;
+    MemOp opc = get_memop(oi);
+    MemOp size = opc & MO_SIZE;
+
+    /* resolve label address */
+    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    /* call store helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
+    switch (size) {
+    case MO_8:
+        tcg_out_ext8u(s, TCG_REG_A2, l->datalo_reg);
+        break;
+    case MO_16:
+        tcg_out_ext16u(s, TCG_REG_A2, l->datalo_reg);
+        break;
+    case MO_32:
+        tcg_out_ext32u(s, TCG_REG_A2, l->datalo_reg);
+        break;
+    case MO_64:
+        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_A2, l->datalo_reg);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_st_helpers[size]);
+
+    return tcg_out_goto(s, l->raddr);
+}
+#endif /* CONFIG_SOFTMMU */
+
+/*
+ * `ext32u` the address register into the temp register given,
+ * if target is 32-bit, no-op otherwise.
+ *
+ * Returns the address register ready for use with TLB addend.
+ */
+static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
+                                          TCGReg addr, TCGReg tmp)
+{
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, tmp, addr);
+        return tmp;
+    }
+    return addr;
+}
+
+static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
+                                   TCGReg rk, MemOp opc, TCGType type)
+{
+    /* Byte swapping is left to middle-end expansion.  */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
+
+    switch (opc & MO_SSIZE) {
+    case MO_UB:
+        tcg_out_opc_ldx_bu(s, rd, rj, rk);
+        break;
+    case MO_SB:
+        tcg_out_opc_ldx_b(s, rd, rj, rk);
+        break;
+    case MO_UW:
+        tcg_out_opc_ldx_hu(s, rd, rj, rk);
+        break;
+    case MO_SW:
+        tcg_out_opc_ldx_h(s, rd, rj, rk);
+        break;
+    case MO_UL:
+        if (type == TCG_TYPE_I64) {
+            tcg_out_opc_ldx_wu(s, rd, rj, rk);
+            break;
+        }
+        /* fallthrough */
+    case MO_SL:
+        tcg_out_opc_ldx_w(s, rd, rj, rk);
+        break;
+    case MO_Q:
+        tcg_out_opc_ldx_d(s, rd, rj, rk);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
+{
+    TCGReg addr_regl;
+    TCGReg data_regl;
+    MemOpIdx oi;
+    MemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base;
+
+    data_regl = *args++;
+    addr_regl = *args++;
+    oi = *args++;
+    opc = get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    tcg_out_qemu_ld_indexed(s, data_regl, base, TCG_REG_TMP2, opc, type);
+    add_qemu_ldst_label(s, 1, oi, type,
+                        data_regl, addr_regl,
+                        s->code_ptr, label_ptr);
+#else
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
+#endif
+}
+
+static void tcg_out_qemu_st_indexed(TCGContext *s, TCGReg data,
+                                   TCGReg rj, TCGReg rk, MemOp opc)
+{
+    /* Byte swapping is left to middle-end expansion.  */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
+
+    switch (opc & MO_SIZE) {
+    case MO_8:
+        tcg_out_opc_stx_b(s, data, rj, rk);
+        break;
+    case MO_16:
+        tcg_out_opc_stx_h(s, data, rj, rk);
+        break;
+    case MO_32:
+        tcg_out_opc_stx_w(s, data, rj, rk);
+        break;
+    case MO_64:
+        tcg_out_opc_stx_d(s, data, rj, rk);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
+{
+    TCGReg addr_regl;
+    TCGReg data_regl;
+    MemOpIdx oi;
+    MemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base;
+
+    data_regl = *args++;
+    addr_regl = *args++;
+    oi = *args++;
+    opc = get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    tcg_out_qemu_st_indexed(s, data_regl, base, TCG_REG_TMP2, opc);
+    add_qemu_ldst_label(s, 0, oi,
+                        0, /* type param is unused for stores */
+                        data_regl, addr_regl,
+                        s->code_ptr, label_ptr);
+#else
+    base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
+    TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+    tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
+#endif
+}
+
 /*
  * Entry-points
  */
@@ -1023,6 +1355,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
         break;
 
+    case INDEX_op_qemu_ld_i32:
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
+        break;
+    case INDEX_op_qemu_ld_i64:
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
+        break;
+    case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args);
+        break;
+    case INDEX_op_qemu_st_i64:
+        tcg_out_qemu_st(s, args);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -1050,6 +1395,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
+        return C_O0_I2(LZ, L);
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -1087,6 +1436,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_i64:
+        return C_O1_I1(r, L);
+
     case INDEX_op_andc_i32:
     case INDEX_op_andc_i64:
     case INDEX_op_orc_i32:
-- 
2.34.0


