Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C71F6EC503
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:46:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoyz-0008Gg-9y; Mon, 24 Apr 2023 01:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxM-0005XO-04
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowv-0004Ik-3u
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso24547035e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314874; x=1684906874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+QlOMba/aSBW632xLY397LQPEBGu7J2mpCgxpenFkM=;
 b=iL51U8EvXYJImqu6ct2Yq6p9InKD7neUn0aOeNpanNxjt6BJ/RNKsA83pnYGCSQkLv
 ieWmbf9ZqP6dsPkszn73bqZtjKB+OTbZ7AXBy045HSzo3unc4BUEit+/zaNbrxMUDYCo
 sDaBO6MdhkTkwm7obgaoruNmPSp0wTgtc6VzI81kX3usFRU/EHB+Z6gScdIkccO7I53O
 64nEKSzyYT2TXaaMMv0Ha+o4gXR5iLzFUt2ejzhdYcwn4q9z4S59DsiLBtlZojbeF2DN
 /Duoh+uHAu0sPB+tUVgTae4miDQdLnvxBAmG5qiUrKnZ9VmsXHJAqcy3+Ma1PWq/N3Oo
 gXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314874; x=1684906874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+QlOMba/aSBW632xLY397LQPEBGu7J2mpCgxpenFkM=;
 b=N0Ce8ir2S5wx3WnLDK7XuzYjKIU1E76FVSVLrSliDtM5KyzFzBG7Nq6yqUuSBCXvyb
 zL45btewyPnZpq4lumdXLD6R5dKFzqq6ujiyflHyi90yLg5G7a/mG8efA2/1Acug/1T7
 vX8jigcvcM9nZcIEkxT9GT/HTb76Fop8sr5Ngkz7l7OmNKGZ7hK/ddIVRryOPjSCBqVp
 WpgH3hx2cpoeFZVAqZ0PiCS/HSZsfahCC8tvmG1grvSN40MYZtsh6yjj7vlcd6Lcx8e2
 o8IifdfhVFs+2lXWk03zvK6ak/5G53CD4bqJMuFA8dq2EboLa83Kep6N3LV+oWr6mws9
 TPkA==
X-Gm-Message-State: AAQBX9dnRt/bKCF6TPgz6ZKMBIXLNtw42bDxuU7zlXMnenpZ9otZwTt1
 6CRcKlV1qHoo62L3qdaUknqFU4TqHFRRFTrf5u0grw==
X-Google-Smtp-Source: AKy350YvNZmv3WMiUluHEX3ricM6SNGg2bgcH6UiUFwGxjl2Xqs9FPI4FHvPhxoPhJqmqz8aYkEDcw==
X-Received: by 2002:a1c:f418:0:b0:3f1:92aa:4e9b with SMTP id
 z24-20020a1cf418000000b003f192aa4e9bmr6239211wma.23.1682314874325; 
 Sun, 23 Apr 2023 22:41:14 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 14/57] tcg/aarch64: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:22 +0100
Message-Id: <20230424054105.1579315-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
into one function that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 313 +++++++++++++++--------------------
 1 file changed, 133 insertions(+), 180 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d8d464e4a0..202b90c001 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1667,113 +1667,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGType ext, TCGReg data_reg, TCGReg addr_reg,
-                                tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = ext;
-    label->datalo_reg = data_reg;
-    label->addrlo_reg = addr_reg;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr;
-}
-
-/* We expect to use a 7-bit scaled negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -512);
-
-/* These offsets are built into the LDP below.  */
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 8);
-
-/* Load and compare a TLB entry, emitting the conditional jump to the
-   slow path for the failure case, which will be patched later when finalizing
-   the slow path. Generated code returns the host addend in X1,
-   clobbers X0,X2,X3,TMP. */
-static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
-                             tcg_insn_unit **label_ptr, int mem_index,
-                             bool is_read)
-{
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1u << a_bits) - 1;
-    unsigned s_mask = (1u << s_bits) - 1;
-    TCGReg x3;
-    TCGType mask_type;
-    uint64_t compare_mask;
-
-    mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
-                 ? TCG_TYPE_I64 : TCG_TYPE_I32);
-
-    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
-    tcg_out_insn(s, 3314, LDP, TCG_REG_X0, TCG_REG_X1, TCG_AREG0,
-                 TLB_MASK_TABLE_OFS(mem_index), 1, 0);
-
-    /* Extract the TLB index from the address into X0.  */
-    tcg_out_insn(s, 3502S, AND_LSR, mask_type == TCG_TYPE_I64,
-                 TCG_REG_X0, TCG_REG_X0, addr_reg,
-                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-
-    /* Add the tlb_table pointer, creating the CPUTLBEntry address into X1.  */
-    tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
-
-    /* Load the tlb comparator into X0, and the fast path addend into X1.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_X0, TCG_REG_X1, is_read
-               ? offsetof(CPUTLBEntry, addr_read)
-               : offsetof(CPUTLBEntry, addr_write));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_X1, TCG_REG_X1,
-               offsetof(CPUTLBEntry, addend));
-
-    /* For aligned accesses, we check the first byte and include the alignment
-       bits within the address.  For unaligned access, we check that we don't
-       cross pages using the address of the last byte of the access.  */
-    if (a_bits >= s_bits) {
-        x3 = addr_reg;
-    } else {
-        tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
-                     TCG_REG_X3, addr_reg, s_mask - a_mask);
-        x3 = TCG_REG_X3;
-    }
-    compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-
-    /* Store the page mask part of the address into X3.  */
-    tcg_out_logicali(s, I3404_ANDI, TARGET_LONG_BITS == 64,
-                     TCG_REG_X3, x3, compare_mask);
-
-    /* Perform the address comparison. */
-    tcg_out_cmp(s, TARGET_LONG_BITS == 64, TCG_REG_X0, TCG_REG_X3, 0);
-
-    /* If not equal, we jump to the slow path. */
-    *label_ptr = s->code_ptr;
-    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
-}
-
 #else
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
-                                   unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->addrlo_reg = addr_reg;
-
-    /* tst addr, #mask */
-    tcg_out_logicali(s, I3404_ANDSI, 0, TCG_REG_XZR, addr_reg, a_mask);
-
-    label->label_ptr[0] = s->code_ptr;
-
-    /* b.ne slow_path */
-    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
-
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1801,6 +1695,125 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* CONFIG_SOFTMMU */
 
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
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1u << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1u << s_bits) - 1;
+    unsigned mem_index = get_mmuidx(oi);
+    TCGReg x3;
+    TCGType mask_type;
+    uint64_t compare_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
+                 ? TCG_TYPE_I64 : TCG_TYPE_I32);
+
+    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -512);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 8);
+    tcg_out_insn(s, 3314, LDP, TCG_REG_X0, TCG_REG_X1, TCG_AREG0,
+                 TLB_MASK_TABLE_OFS(mem_index), 1, 0);
+
+    /* Extract the TLB index from the address into X0.  */
+    tcg_out_insn(s, 3502S, AND_LSR, mask_type == TCG_TYPE_I64,
+                 TCG_REG_X0, TCG_REG_X0, addr_reg,
+                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+
+    /* Add the tlb_table pointer, creating the CPUTLBEntry address into X1.  */
+    tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
+
+    /* Load the tlb comparator into X0, and the fast path addend into X1.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_X0, TCG_REG_X1,
+               is_ld ? offsetof(CPUTLBEntry, addr_read)
+                     : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_X1, TCG_REG_X1,
+               offsetof(CPUTLBEntry, addend));
+
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
+    if (a_bits >= s_bits) {
+        x3 = addr_reg;
+    } else {
+        tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
+                     TCG_REG_X3, addr_reg, s_mask - a_mask);
+        x3 = TCG_REG_X3;
+    }
+    compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+
+    /* Store the page mask part of the address into X3.  */
+    tcg_out_logicali(s, I3404_ANDI, TARGET_LONG_BITS == 64,
+                     TCG_REG_X3, x3, compare_mask);
+
+    /* Perform the address comparison. */
+    tcg_out_cmp(s, TARGET_LONG_BITS == 64, TCG_REG_X0, TCG_REG_X3, 0);
+
+    /* If not equal, we jump to the slow path. */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
+
+    *h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /* tst addr, #mask */
+        tcg_out_logicali(s, I3404_ANDSI, 0, TCG_REG_XZR, addr_reg, a_mask);
+
+        /* b.ne slow_path */
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
+    }
+
+    if (USE_GUEST_BASE) {
+        *h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
+    } else {
+        *h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
+    }
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, HostAddress h)
 {
@@ -1857,93 +1870,33 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp memop = get_memop(oi);
-    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, true);
+    tcg_out_qemu_ld_direct(s, get_memop(oi), data_type, data_reg, h);
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr;
-
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
-
-    h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
-
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
-    unsigned a_bits = get_alignment_bits(memop);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (USE_GUEST_BASE) {
-        h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
-    } else {
-        h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
-    }
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
-#endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp memop = get_memop(oi);
-    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, false);
+    tcg_out_qemu_st_direct(s, get_memop(oi), data_reg, h);
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr;
-
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
-
-    h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
-    tcg_out_qemu_st_direct(s, memop, data_reg, h);
-
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
-    unsigned a_bits = get_alignment_bits(memop);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (USE_GUEST_BASE) {
-        h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
-    } else {
-        h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
-    }
-    tcg_out_qemu_st_direct(s, memop, data_reg, h);
-#endif /* CONFIG_SOFTMMU */
 }
 
 static const tcg_insn_unit *tb_ret_addr;
-- 
2.34.1


