Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B546FED99
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:12:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ic-0006PS-Tb; Thu, 11 May 2023 04:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IW-0006Mk-C8
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IN-0000yR-QI
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:11 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so14700257a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792302; x=1686384302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lh4IgNBqqCeCY4GRiOSSQP+mNam0FJ6oAg9ySjC0hgE=;
 b=iSaKdB+glbAV2lDI/5/ZCgiegTZr1UdxD0+k5i0jWr4ReqWjkx4rC7Zdt4x2lY+2GC
 1h1MjwMTlna1ecPV4WV5qsBXav90328PGmtdbo9xb2c0EjByGFjtUJfbIPOX3UYkily3
 O8/+e0uc/Mo54GoyTjKBH88CTsVSmCV+2Hjo0xDJJYomQN2O8WP7+18lQk1x30uLZyeQ
 z8MTUFAPpIYfoc03uIY7zS9bXviarqzmE+bqNR9Ljgc05JWyyuu97bOeiKMKF9h5/GHJ
 S1mdYHznEVDyr5UuQvfMzUqJXB6nLgxntqC0r/yU5nkHO/SyCrYFjUMW+TN3uv04SX22
 Lz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792302; x=1686384302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lh4IgNBqqCeCY4GRiOSSQP+mNam0FJ6oAg9ySjC0hgE=;
 b=HyM840pXCwTK0Ad/zfQ10iWVHeQXotpd4Ph9HbkWdxjO9Z/OVGufvoRzPPNc0hHkIr
 6eSQ/DBFh//xZ6rsLa44I+zNAOTGqxgbR3rrIHjGmJGr7f+40BhEv8dgWkh3siPLac1O
 zrVbtdV6lypKFehPsMMVCKVxPrk81WLQCx/rM3TiqGYEroTN5MA14WfyPRpzJQrgR+iz
 7Z8kdG0d0N3sIWAQKvlyRBKC9KN/cHMGN4gFsRMdSSlAIfxkJx0n+h4bff9sAf9vOGrT
 KE/tv+C0vytEDZNSrNlP0I5fbpRSPSTl1zViW7Unoj1SEDfLA2pYln24qqxq+gByUSg3
 rx0A==
X-Gm-Message-State: AC+VfDwV79G+5VXY4evb+uQ3NWkX4he8ngu2ZySJJ/vI6iBFGZPFII9k
 agxsoLuRdziEAbdK+KSEMVs+YqgtzlXXC2l3egpF0A==
X-Google-Smtp-Source: ACHHUZ5SD+59kQsxjxjJkaMGXkUYt6V/gPmdhdFAW/LuTpR01cbqJ9zKic7cLVzrlwx8Kgl224teFw==
X-Received: by 2002:a05:6402:14d3:b0:508:4120:202a with SMTP id
 f19-20020a05640214d300b005084120202amr17887269edx.10.1683792302279; 
 Thu, 11 May 2023 01:05:02 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 15/53] tcg/loongarch64: Introduce prepare_host_addr
Date: Thu, 11 May 2023 09:04:12 +0100
Message-Id: <20230511080450.860923-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
tcg_out_zext_addr_if_32_bit, and some code that lived in both
tcg_out_qemu_ld and tcg_out_qemu_st into one function that returns
HostAddress and TCGLabelQemuLdst structures.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 255 +++++++++++++------------------
 1 file changed, 105 insertions(+), 150 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 6a87a5e5a3..2f2c34b930 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -818,81 +818,12 @@ static void * const qemu_st_helpers[4] = {
     [MO_64] = helper_le_stq_mmu,
 };
 
-/* We expect to use a 12-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
     return reloc_br_sd10k16(s->code_ptr - 1, target);
 }
 
-/*
- * Emits common code for TLB addend lookup, that eventually loads the
- * addend in TCG_REG_TMP2.
- */
-static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, MemOpIdx oi,
-                             tcg_insn_unit **label_ptr, bool is_load)
-{
-    MemOp opc = get_memop(oi);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
-    int mem_index = get_mmuidx(oi);
-    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
-    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
-
-    tcg_out_opc_srli_d(s, TCG_REG_TMP2, addrl,
-                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
-    tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
-
-    /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
-               is_load ? offsetof(CPUTLBEntry, addr_read)
-               : offsetof(CPUTLBEntry, addr_write));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
-               offsetof(CPUTLBEntry, addend));
-
-    /* We don't support unaligned accesses.  */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
-
-    /* Compare masked address with the TLB entry.  */
-    label_ptr[0] = s->code_ptr;
-    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
-
-    /* TLB Hit - addend in TCG_REG_TMP2, ready for use.  */
-}
-
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType type,
-                                TCGReg datalo, TCGReg addrlo,
-                                void *raddr, tcg_insn_unit **label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = type;
-    label->datalo_reg = datalo;
-    label->datahi_reg = 0; /* unused */
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = 0; /* unused */
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr[0];
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
@@ -941,33 +872,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_goto(s, l->raddr);
 }
 #else
-
-/*
- * Alignment helpers for user-mode emulation
- */
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
-                                   unsigned a_bits)
-{
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addr_reg;
-
-    /*
-     * Without micro-architecture details, we don't know which of bstrpick or
-     * andi is faster, so use bstrpick as it's not constrained by imm field
-     * width. (Not to say alignments >= 2^12 are going to happen any time
-     * soon, though)
-     */
-    tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);
-
-    l->label_ptr[0] = s->code_ptr;
-    tcg_out_opc_bne(s, TCG_REG_TMP1, TCG_REG_ZERO, 0);
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     /* resolve label address */
@@ -997,27 +901,102 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 #endif /* CONFIG_SOFTMMU */
 
-/*
- * `ext32u` the address register into the temp register given,
- * if target is 32-bit, no-op otherwise.
- *
- * Returns the address register ready for use with TLB addend.
- */
-static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
-                                          TCGReg addr, TCGReg tmp)
-{
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, tmp, addr);
-        return tmp;
-    }
-    return addr;
-}
-
 typedef struct {
     TCGReg base;
     TCGReg index;
 } HostAddress;
 
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addr_reg, MemOpIdx oi,
+                                           bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+    tcg_target_long compare_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
+
+    tcg_out_opc_srli_d(s, TCG_REG_TMP2, addr_reg,
+                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
+    tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+               is_ld ? offsetof(CPUTLBEntry, addr_read)
+                     : offsetof(CPUTLBEntry, addr_write));
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
+    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+
+    /* Compare masked address with the TLB entry.  */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    h->index = TCG_REG_TMP2;
+#else
+    if (a_bits) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /*
+         * Without micro-architecture details, we don't know which of
+         * bstrpick or andi is faster, so use bstrpick as it's not
+         * constrained by imm field width. Not to say alignments >= 2^12
+         * are going to happen any time soon.
+         */
+        tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);
+
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_opc_bne(s, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+    }
+
+    h->index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    if (TARGET_LONG_BITS == 32) {
+        h->base = TCG_REG_TMP0;
+        tcg_out_ext32u(s, h->base, addr_reg);
+    } else {
+        h->base = addr_reg;
+    }
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
                                     TCGReg rd, HostAddress h)
 {
@@ -1057,29 +1036,17 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, true);
+    tcg_out_qemu_ld_indexed(s, get_memop(oi), data_type, data_reg, h);
 
-    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    h.index = TCG_REG_TMP2;
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-#endif
-
-    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, opc, data_type, data_reg, h);
-
-#ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#endif
 }
 
 static void tcg_out_qemu_st_indexed(TCGContext *s, MemOp opc,
@@ -1109,29 +1076,17 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, MemOp opc,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, false);
+    tcg_out_qemu_st_indexed(s, get_memop(oi), data_reg, h);
 
-    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
-    h.index = TCG_REG_TMP2;
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-#endif
-
-    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, opc, data_reg, h);
-
-#ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#endif
 }
 
 /*
-- 
2.34.1


