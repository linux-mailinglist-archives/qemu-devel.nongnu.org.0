Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6AC41163F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:04:12 +0200 (CEST)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJtx-0001mw-Ai
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOr-0007ng-Et
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:41 -0400
Received: from [115.28.160.31] (port=35568 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOo-0005LL-R7
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:41 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B468C63408;
 Mon, 20 Sep 2021 16:06:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125168; bh=2+kjYFjMGtRWoGYU08ogRAYZvkpruEPb8DQ1Nf80ObA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M4Y7cFll2kwaxxPz3qR3MqKhWS0Jy5xzh/OhD8TgzMkkYGRAsYEhIo5QxcfLIIH97
 vScor9MJ6uBnZMXp6hGVl+Di3jvdCxGZwcthGPgC25GIO2c/xL9zheEX+FpD1ZoZqO
 Mk9pNOJKDyWpe0P6EnDXNtJgz2BBmFlZRkjpWI4w=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/30] tcg/loongarch: Add softmmu load/store helpers,
 implement qemu_ld/qemu_st ops
Date: Mon, 20 Sep 2021 16:04:44 +0800
Message-Id: <20210920080451.408655-24-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch/tcg-target-con-set.h |   2 +
 tcg/loongarch/tcg-target.c.inc     | 344 +++++++++++++++++++++++++++++
 2 files changed, 346 insertions(+)

diff --git a/tcg/loongarch/tcg-target-con-set.h b/tcg/loongarch/tcg-target-con-set.h
index cdbfe9cd8d..b990da6b26 100644
--- a/tcg/loongarch/tcg-target-con-set.h
+++ b/tcg/loongarch/tcg-target-con-set.h
@@ -17,7 +17,9 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
+C_O0_I2(LZ, L)
 C_O1_I1(r, r)
+C_O1_I1(r, L)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 3947a2d9fa..0b6f16bde0 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -560,6 +560,329 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
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
+ *                                     TCGMemOpIdx oi, uintptr_t ra)
+ */
+static void * const qemu_ld_helpers[8] = {
+    [MO_UB] = helper_ret_ldub_mmu,
+    [MO_SB] = helper_ret_ldsb_mmu,
+    [MO_UW] = helper_le_lduw_mmu,
+    [MO_SW] = helper_le_ldsw_mmu,
+    [MO_UL] = helper_le_ldul_mmu,
+#if TCG_TARGET_REG_BITS == 64
+    [MO_SL] = helper_le_ldsl_mmu,
+#endif
+    [MO_Q]  = helper_le_ldq_mmu,
+};
+
+/*
+ * helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
+ *                                     uintxx_t val, TCGMemOpIdx oi,
+ *                                     uintptr_t ra)
+ */
+static void * const qemu_st_helpers[4] = {
+    [MO_8]  = helper_ret_stb_mmu,
+    [MO_16] = helper_le_stw_mmu,
+    [MO_32] = helper_le_stl_mmu,
+    [MO_64] = helper_le_stq_mmu,
+};
+
+/* We don't support oversize guests */
+QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
+
+/* We expect to use a 12-bit negative offset from ENV.  */
+QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+
+static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
+{
+    tcg_out_opc_b(s, 0);
+    bool ok = reloc_sd10k16(s->code_ptr - 1, target);
+    tcg_debug_assert(ok);
+}
+
+static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, TCGMemOpIdx oi,
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
+    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
+
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
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
+    if (compare_mask == sextreg(compare_mask, 0, 12)) {
+        tcg_out_opc_andi(s, TCG_REG_TMP1, addrl, compare_mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+        tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
+    }
+
+    /* Compare masked address with the TLB entry.  */
+    label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    /* TLB Hit - translate address using addend.  */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
+        addrl = TCG_REG_TMP0;
+    }
+    tcg_out_opc_add_d(s, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
+}
+
+static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
+                                TCGType ext,
+                                TCGReg datalo, TCGReg addrlo,
+                                void *raddr, tcg_insn_unit **label_ptr)
+{
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->oi = oi;
+    label->type = ext;
+    label->datalo_reg = datalo;
+    label->datahi_reg = 0;
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = 0;
+    label->raddr = tcg_splitwx_to_rx(raddr);
+    label->label_ptr[0] = label_ptr[0];
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    TCGMemOpIdx oi = l->oi;
+    MemOp opc = get_memop(oi);
+    TCGReg a0 = tcg_target_call_iarg_regs[0];
+    TCGReg a1 = tcg_target_call_iarg_regs[1];
+    TCGReg a2 = tcg_target_call_iarg_regs[2];
+    TCGReg a3 = tcg_target_call_iarg_regs[3];
+
+    /* We don't support oversize guests */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        g_assert_not_reached();
+    }
+
+    /* resolve label address */
+    if (!reloc_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    /* call load helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
+    tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
+    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
+
+    tcg_out_goto(s, l->raddr);
+    return true;
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    TCGMemOpIdx oi = l->oi;
+    MemOp opc = get_memop(oi);
+    MemOp s_bits = opc & MO_SIZE;
+    TCGReg a0 = tcg_target_call_iarg_regs[0];
+    TCGReg a1 = tcg_target_call_iarg_regs[1];
+    TCGReg a2 = tcg_target_call_iarg_regs[2];
+    TCGReg a3 = tcg_target_call_iarg_regs[3];
+    TCGReg a4 = tcg_target_call_iarg_regs[4];
+
+    /* We don't support oversize guests */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        g_assert_not_reached();
+    }
+
+    /* resolve label address */
+    if (!reloc_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    /* call store helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, a2, l->datalo_reg);
+    switch (s_bits) {
+    case MO_8:
+        tcg_out_ext8u(s, a2, a2);
+        break;
+    case MO_16:
+        tcg_out_ext16u(s, a2, a2);
+        break;
+    default:
+        break;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
+
+    tcg_out_goto(s, l->raddr);
+    return true;
+}
+#endif /* CONFIG_SOFTMMU */
+
+static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg base,
+                                   MemOp opc, bool is_64)
+{
+    /* Byte swapping is left to middle-end expansion.  */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
+
+    switch (opc & (MO_SSIZE)) {
+    case MO_UB:
+        tcg_out_opc_ld_bu(s, lo, base, 0);
+        break;
+    case MO_SB:
+        tcg_out_opc_ld_b(s, lo, base, 0);
+        break;
+    case MO_UW:
+        tcg_out_opc_ld_hu(s, lo, base, 0);
+        break;
+    case MO_SW:
+        tcg_out_opc_ld_h(s, lo, base, 0);
+        break;
+    case MO_UL:
+        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+            tcg_out_opc_ld_wu(s, lo, base, 0);
+            break;
+        }
+        /* fallthrough */
+    case MO_SL:
+        tcg_out_opc_ld_w(s, lo, base, 0);
+        break;
+    case MO_Q:
+        tcg_out_opc_ld_d(s, lo, base, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+{
+    TCGReg addr_regl;
+    TCGReg data_regl;
+    TCGMemOpIdx oi;
+    MemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base = TCG_REG_TMP0;
+
+    data_regl = *args++;
+    addr_regl = *args++;
+    oi = *args++;
+    opc = get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 1);
+    tcg_out_qemu_ld_direct(s, data_regl, base, opc, is_64);
+    add_qemu_ldst_label(s, 1, oi,
+                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
+                        data_regl, addr_regl,
+                        s->code_ptr, label_ptr);
+#else
+    if (guest_base == 0) {
+        tcg_out_opc_add_d(s, base, addr_regl, TCG_REG_ZERO);
+    } else {
+        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);
+    }
+    tcg_out_qemu_ld_direct(s, data_regl, base, opc, is_64);
+#endif
+}
+
+static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo,
+                                   TCGReg base, MemOp opc)
+{
+    /* Byte swapping is left to middle-end expansion.  */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
+
+    switch (opc & (MO_SSIZE)) {
+    case MO_8:
+        tcg_out_opc_st_b(s, lo, base, 0);
+        break;
+    case MO_16:
+        tcg_out_opc_st_h(s, lo, base, 0);
+        break;
+    case MO_32:
+        tcg_out_opc_st_w(s, lo, base, 0);
+        break;
+    case MO_64:
+        tcg_out_opc_st_d(s, lo, base, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+{
+    TCGReg addr_regl;
+    TCGReg data_regl;
+    TCGMemOpIdx oi;
+    MemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base = TCG_REG_TMP0;
+
+    data_regl = *args++;
+    addr_regl = *args++;
+    oi = *args++;
+    opc = get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, oi, label_ptr, 0);
+    tcg_out_qemu_st_direct(s, data_regl, base, opc);
+    add_qemu_ldst_label(s, 0, oi,
+                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
+                        data_regl, addr_regl,
+                        s->code_ptr, label_ptr);
+#else
+    if (guest_base == 0) {
+        tcg_out_opc_add_d(s, base, addr_regl, TCG_REG_ZERO);
+    } else {
+        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);
+    }
+    tcg_out_qemu_st_direct(s, data_regl, base, opc);
+#endif
+}
+
 /*
  * Entry-points
  */
@@ -923,6 +1246,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ldst(s, OPC_ST_D, a0, a1, a2);
         break;
 
+    case INDEX_op_qemu_ld_i32:
+        tcg_out_qemu_ld(s, args, false);
+        break;
+    case INDEX_op_qemu_ld_i64:
+        tcg_out_qemu_ld(s, args, true);
+        break;
+    case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args, false);
+        break;
+    case INDEX_op_qemu_st_i64:
+        tcg_out_qemu_st(s, args, true);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
@@ -950,6 +1286,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(rZ, rZ);
 
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
+        return C_O0_I2(LZ, L);
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
@@ -986,6 +1326,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_ld_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_i64:
+        return C_O1_I1(r, L);
+
     case INDEX_op_nor_i32:
     case INDEX_op_andc_i32:
     case INDEX_op_orc_i32:
-- 
2.33.0


