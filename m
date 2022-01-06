Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA74865E6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:15:58 +0100 (CET)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TYc-0007lu-1O
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:15:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1n5T2f-0005dW-1Q
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:43:01 -0500
Received: from mail.xen0n.name ([115.28.160.31]:46468
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1n5T2a-0006pK-I1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:42:56 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CA1B762E6D;
 Thu,  6 Jan 2022 21:42:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641476566; bh=LCHOa+VlzKYmvUCqUnS9UOWEl1z1Tj+1oQwVwFXYjuQ=;
 h=From:To:Cc:Subject:Date:From;
 b=RXNF4QezxYUoBCfskednySCjkcGvF5Cg5spASQ9huFecLMmMxdGxQKHarwwq7lxut
 LKeqZkWlQQYUanCVQ0R7CfZo0JFDl6iMI6Bu/quDHILURYfdIFn8FXwMKvOKuFYWS8
 WOlhmHMkUcp64BzCsgLZOYT7ZKCQRJMY74fEnhQc=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tcg/loongarch64: Support raising sigbus for user-only
Date: Thu,  6 Jan 2022 21:42:38 +0800
Message-Id: <20220106134238.3936163-1-git@xen0n.name>
X-Mailer: git-send-email 2.34.1
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
Cc: WANG Xuerui <git@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220104021543.396571-1-richard.henderson@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: WANG Xuerui <git@xen0n.name>
---

v2 -> v1:

- Dropped assert and added comment documenting reason to choose
  bstrpick.d over andi for the masking operation
- Collected R-b tag

 tcg/loongarch64/tcg-target.c.inc | 71 +++++++++++++++++++++++++++++++-
 tcg/loongarch64/tcg-target.h     |  2 -
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 9cd46c9be3..9b53549edb 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -29,6 +29,8 @@
  * THE SOFTWARE.
  */
 
+#include "../tcg-ldst.c.inc"
+
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "zero",
@@ -642,8 +644,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  */
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 /*
  * helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -825,6 +825,61 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     return tcg_out_goto(s, l->raddr);
 }
+#else
+
+/*
+ * Alignment helpers for user-mode emulation
+ */
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
+                                   unsigned a_bits)
+{
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addr_reg;
+
+    /*
+     * Without micro-architecture details, we don't know which of bstrpick or
+     * andi is faster, so use bstrpick as it's not constrained by imm field
+     * width. (Not to say alignments >= 2^12 are going to happen any time
+     * soon, though)
+     */
+    tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);
+
+    l->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    /* resolve label address */
+    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+
+    /* tail call, with the return address back inline. */
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
+    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
+                                       : helper_unaligned_st), true);
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
 #endif /* CONFIG_SOFTMMU */
 
 /*
@@ -887,6 +942,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base;
 
@@ -903,6 +960,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType type)
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addr_regl, a_bits);
+    }
     base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
     TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
     tcg_out_qemu_ld_indexed(s, data_regl, base, guest_base_reg, opc, type);
@@ -941,6 +1002,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[1];
+#else
+    unsigned a_bits;
 #endif
     TCGReg base;
 
@@ -958,6 +1021,10 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args)
                         data_regl, addr_regl,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addr_regl, a_bits);
+    }
     base = tcg_out_zext_addr_if_32_bit(s, addr_regl, TCG_REG_TMP0);
     TCGReg guest_base_reg = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
     tcg_out_qemu_st_indexed(s, data_regl, base, guest_base_reg, opc);
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 05010805e7..d58a6162f2 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -171,9 +171,7 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
 #define TCG_TARGET_DEFAULT_MO (0)
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP 0
 
-- 
2.34.1


