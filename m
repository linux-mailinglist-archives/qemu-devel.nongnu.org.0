Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FD6FED96
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:12:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Io-0006fo-R6; Thu, 11 May 2023 04:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IW-0006MO-5k
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IR-0000z8-My
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so15618268a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792304; x=1686384304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkF3/2eIXQLlh8f3HilwSMrgKtksr8bPayrf2imDWgY=;
 b=vHwVn8WGY5dYD12DYMAVV0zdz9cEiN8elAUfina8b6tHP4wspcFGzeDg5sqSiY299d
 5FMFBehF2c11XCuXaph+wKbjnva30d8QGQf4cNuzhRTRi0N9RSQ7oH1Xl9ur0Cyjk4wO
 dj2eItx63geQEpn1Qid0wclWj6fEBaqjL8u+Y1vNzVNcVGEp5u12uukR1nwykTMm1Tqs
 6icjU2KAXRAd460pUElbtNj68XxVscRUdurXDTmeYRt7+HpD0GybTm7j4gLeohVeh5B7
 nI2AFTpvErB3WNHjdW/iPyJxFM2qw+rwEFmRvTLpdwsNdw0v0UWhehmIe2vYGv8WZb9K
 PVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792304; x=1686384304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkF3/2eIXQLlh8f3HilwSMrgKtksr8bPayrf2imDWgY=;
 b=KokTBXWIFg1hQpQZbWM0pn7O2/bVOBn9sc8zpG+SAcXUwUVasmTQB3ZQOWggoRiUMC
 Xsz2knf0P8PhcRGD8wsdJl8Y3bHlykVV0FOIjImgJy/LlYpC3L6N789JZRXa0oMaEpT/
 sa/dj59r9yKnEDqt0poGgAUSxAKiZVvHsqH7+XAMR4oW9oN8/mHhSeTL899I6YlQDT8i
 n9PSjNx3nPKM0cQtHWUXi1srh9GzoLEMBgcfFEEqwDnQtj/7pBUOOelZ+riXzZoZfONK
 FxX22Ip+gQd0k86BktgYvx3T6578LbUBkN/Zj+LsYdv0uyDOiqp2D5fcEESBNhLrYmyH
 k1XA==
X-Gm-Message-State: AC+VfDyNr+fMGZru6oL7jD8uA5VfHMq6pQclNhSgzLv8N12Xy5J7j07k
 KKza6qN80tFTkN8waEJ6XCBQkcHhuxBJh8xo4PibbQ==
X-Google-Smtp-Source: ACHHUZ5s4qJ1ANsxIQJburDFSO2g5KFY0dklOjkXBc3qIm5e7qtGal6vH9uC34w9S/EGwqHm3PBoiw==
X-Received: by 2002:a17:907:72cc:b0:969:9118:a98f with SMTP id
 du12-20020a17090772cc00b009699118a98fmr11009565ejc.10.1683792304121; 
 Thu, 11 May 2023 01:05:04 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/53] tcg/riscv: Introduce prepare_host_addr
Date: Thu, 11 May 2023 09:04:15 +0100
Message-Id: <20230511080450.860923-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns TCGReg and TCGLabelQemuLdst.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 253 +++++++++++++++++--------------------
 1 file changed, 114 insertions(+), 139 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index a4cf60ca75..2b2d313fe2 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -899,10 +899,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* We expect to use a 12-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -910,76 +906,6 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
-static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, MemOpIdx oi,
-                               tcg_insn_unit **label_ptr, bool is_load)
-{
-    MemOp opc = get_memop(oi);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
-    int mem_index = get_mmuidx(oi);
-    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
-    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
-
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
-
-    tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr,
-                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
-
-    /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
-               is_load ? offsetof(CPUTLBEntry, addr_read)
-               : offsetof(CPUTLBEntry, addr_write));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
-               offsetof(CPUTLBEntry, addend));
-
-    /* We don't support unaligned accesses. */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    if (compare_mask == sextreg(compare_mask, 0, 12)) {
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr, compare_mask);
-    } else {
-        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr);
-    }
-
-    /* Compare masked address with the TLB entry. */
-    label_ptr[0] = s->code_ptr;
-    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
-
-    /* TLB Hit - translate address using addend.  */
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addr);
-        addr = TCG_REG_TMP0;
-    }
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr);
-    return TCG_REG_TMP0;
-}
-
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType data_type, TCGReg data_reg,
-                                TCGReg addr_reg, void *raddr,
-                                tcg_insn_unit **label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = data_type;
-    label->datalo_reg = data_reg;
-    label->addrlo_reg = addr_reg;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr[0];
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
@@ -1037,26 +963,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
-                                   unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addr_reg;
-
-    /* We are expecting a_bits to max out at 7, so we can always use andi. */
-    tcg_debug_assert(a_bits < 12);
-    tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
-
-    l->label_ptr[0] = s->code_ptr;
-    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     /* resolve label address */
@@ -1083,9 +989,108 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     return tcg_out_fail_alignment(s, l);
 }
-
 #endif /* CONFIG_SOFTMMU */
 
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
+                                           TCGReg addr_reg, MemOpIdx oi,
+                                           bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1u << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
+    tcg_target_long compare_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
+
+    tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr_reg,
+                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+               is_ld ? offsetof(CPUTLBEntry, addr_read)
+                     : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
+               offsetof(CPUTLBEntry, addend));
+
+    /* We don't support unaligned accesses. */
+    if (a_bits < s_bits) {
+        a_bits = s_bits;
+    }
+    /* Clear the non-page, non-alignment bits from the address.  */
+    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | a_mask;
+    if (compare_mask == sextreg(compare_mask, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, compare_mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+    }
+
+    /* Compare masked address with the TLB entry. */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    /* TLB Hit - translate address using addend.  */
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
+        addr_reg = TCG_REG_TMP0;
+    }
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_reg);
+    *pbase = TCG_REG_TMP0;
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /* We are expecting a_bits max 7, so we can always use andi. */
+        tcg_debug_assert(a_bits < 12);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
+
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+    }
+
+    TCGReg base = addr_reg;
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, base);
+        base = TCG_REG_TMP0;
+    }
+    if (guest_base != 0) {
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
+        base = TCG_REG_TMP0;
+    }
+    *pbase = base;
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
                                    TCGReg base, MemOp opc, TCGType type)
 {
@@ -1125,32 +1130,17 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     TCGReg base;
 
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &base, addr_reg, oi, true);
+    tcg_out_qemu_ld_direct(s, data_reg, base, get_memop(oi), data_type);
 
-    base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, base);
-        base = TCG_REG_TMP0;
-    }
-    if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
-        base = TCG_REG_TMP0;
-    }
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
@@ -1180,32 +1170,17 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     TCGReg base;
 
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &base, addr_reg, oi, false);
+    tcg_out_qemu_st_direct(s, data_reg, base, get_memop(oi));
 
-    base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
-    tcg_out_qemu_st_direct(s, data_reg, base, opc);
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, base);
-        base = TCG_REG_TMP0;
-    }
-    if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
-        base = TCG_REG_TMP0;
-    }
-    tcg_out_qemu_st_direct(s, data_reg, base, opc);
-#endif
 }
 
 static const tcg_insn_unit *tb_ret_addr;
-- 
2.34.1


