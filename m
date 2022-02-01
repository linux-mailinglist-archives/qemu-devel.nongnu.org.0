Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008BD4A6A8D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:33:35 +0100 (CET)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6Ol-0000ON-1O
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF2mA-0001Ak-RH
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:41:32 -0500
Received: from [2607:f8b0:4864:20::533] (port=36473
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF2m6-000730-TY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:41:30 -0500
Received: by mail-pg1-x533.google.com with SMTP id e9so16830806pgb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWk5arwzigx4IYhCFhEdBD+ecvW8WIrSGYvBp6HbTEY=;
 b=s0F1RaJlJHb+3FLuvSBN1o8g9/tS5q31NCDYXlXhMi+ruseHvXacwDav5GgpKREYzt
 B0tRPiMFf+N0ESqvji+ESjb2BwJq3CMpJ5Crq/HvGKhptm0lYsW4HTeitJMQUJ4Uf2F7
 FSG4DmYH6lIwytJiR87RPr/91xyA6eC498gMIHpW+Z0IXCmaaQ75r6qN/g4eQliiejkk
 b3HgyjqHZCdmjkuphXvAjvWDHPlERWHzrickPge4wlt0Tk7VspjoyNeeGjWFUJcDwcxJ
 fX3ijo9k1f8kRBbM3pqJoKn4OlK1qmMXq8cvZhiOuFZntEhRf45w74Ypfoe68ermvwOX
 E7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWk5arwzigx4IYhCFhEdBD+ecvW8WIrSGYvBp6HbTEY=;
 b=HVXk9gzNxkW1MxhaEC/5mSLZ+QIvFU+LWDrXqn8YWxH2FcQEPU9vinPnrO3zTAg8Iv
 7sb89KaQ2PD9k8T7qyv01vuy+kK3APU+G2ezDxxF2mONtP43/Spbn2JE6b/3eQuySvaO
 j8+fjzxg19Q3tsb2WkgB59Rpl+QoiWleq9dn0coOvnEyjQ10i15M0ZbO0GFUkdp/rQWw
 9HraU8FYNYhQxRkYEgylKBFbsNmebUzPnyH8wGHgAjql/0WUEsK+dTM12UPRjdNKFr+u
 q0I8Ar7BiC/00CjhWVnYQTI6IBWwxNaZH/RnCe7E7YycydNpeeMLJ4nbM1t7J26tqOMR
 s+iw==
X-Gm-Message-State: AOAM530l3im6i8GZAHjpakCukQ1+J4h3A3BC3m5Xkw8ND43iQN9f4qgH
 OdjMcgDyy4wx4d1Xiy7aJAeAZAjysY/UfC0r
X-Google-Smtp-Source: ABdhPJzrftUNF68mYynNqzUU8z7NaMggaUgtpplkVb1mnX//zztkqaFLB7Pwor/UlUChboeIICljNw==
X-Received: by 2002:a63:565f:: with SMTP id g31mr22489007pgm.167.1643758878272; 
 Tue, 01 Feb 2022 15:41:18 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c])
 by smtp.gmail.com with ESMTPSA id g9sm16495641pgi.84.2022.02.01.15.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:41:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] tcg/mips: Support unaligned access for softmmu
Date: Wed,  2 Feb 2022 10:41:07 +1100
Message-Id: <20220201234107.316487-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201234107.316487-1-richard.henderson@linaro.org>
References: <20220201234107.316487-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use the routines just added for user-only to emit
unaligned accesses in softmmu mode too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 91 ++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7d706df39c..3bf29c2f77 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1134,8 +1134,10 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
                              tcg_insn_unit *label_ptr[2], bool is_load)
 {
     MemOp opc = get_memop(oi);
-    unsigned s_bits = opc & MO_SIZE;
     unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
@@ -1143,7 +1145,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
-    target_ulong mask;
+    target_ulong tlb_mask;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
@@ -1157,27 +1159,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
     tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
 
-    /* We don't currently support unaligned accesses.
-       We could do so with mips32r6.  */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-
-    /* Mask the page bits, keeping the alignment bits to compare against.  */
-    mask = (target_ulong)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-
     /* Load the (low-half) tlb comparator.  */
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
-        tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, mask);
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
     } else {
         tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
                          : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
                      TCG_TMP0, TCG_TMP3, cmp_off);
-        tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, mask);
-        /* No second compare is required here;
-           load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
     }
 
     /* Zero extend a 32-bit guest address for a 64-bit host. */
@@ -1185,7 +1173,25 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
         tcg_out_ext32u(s, base, addrl);
         addrl = base;
     }
-    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
+
+    /*
+     * Mask the page bits, keeping the alignment bits to compare against.
+     * For unaligned accesses, compare against the end of the access to
+     * verify that it does not cross a page boundary.
+     */
+    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
+    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
+    if (a_mask >= s_mask) {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
+    } else {
+        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask - a_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    }
+
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    }
 
     label_ptr[0] = s->code_ptr;
     tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
@@ -1193,7 +1199,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     /* Load and test the high half tlb comparator.  */
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         /* delay slot */
-        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
@@ -1515,8 +1521,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void __attribute__((unused))
-tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
+static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
                                     TCGReg base, MemOp opc, bool is_64)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
@@ -1645,8 +1650,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
 #else
-    unsigned a_bits, s_bits;
 #endif
+    unsigned a_bits, s_bits;
     TCGReg base = TCG_REG_A0;
 
     data_regl = *args++;
@@ -1655,10 +1660,20 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi = *args++;
     opc = get_memop(oi);
+    a_bits = get_alignment_bits(opc);
+    s_bits = opc & MO_SIZE;
 
+    /*
+     * R6 removes the left/right instructions but requires the
+     * system to support misaligned memory accesses.
+     */
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    if (use_mips32r6_instructions || a_bits >= s_bits) {
+        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    } else {
+        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+    }
     add_qemu_ldst_label(s, 1, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
@@ -1675,12 +1690,6 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     } else {
         tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
-    /*
-     * R6 removes the left/right instructions but requires the
-     * system to support misaligned memory accesses.
-     */
     if (use_mips32r6_instructions) {
         if (a_bits) {
             tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
@@ -1760,8 +1769,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void __attribute__((unused))
-tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
+static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
                                     TCGReg base, MemOp opc)
 {
     const MIPSInsn sw1 = MIPS_BE ? OPC_SWL : OPC_SWR;
@@ -1841,9 +1849,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits, s_bits;
 #endif
+    unsigned a_bits, s_bits;
     TCGReg base = TCG_REG_A0;
 
     data_regl = *args++;
@@ -1852,10 +1859,20 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi = *args++;
     opc = get_memop(oi);
+    a_bits = get_alignment_bits(opc);
+    s_bits = opc & MO_SIZE;
 
+    /*
+     * R6 removes the left/right instructions but requires the
+     * system to support misaligned memory accesses.
+     */
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 0);
-    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    if (use_mips32r6_instructions || a_bits >= s_bits) {
+        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    } else {
+        tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+    }
     add_qemu_ldst_label(s, 0, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
@@ -1872,12 +1889,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     } else {
         tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
-    a_bits = get_alignment_bits(opc);
-    s_bits = opc & MO_SIZE;
-    /*
-     * R6 removes the left/right instructions but requires the
-     * system to support misaligned memory accesses.
-     */
     if (use_mips32r6_instructions) {
         if (a_bits) {
             tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
-- 
2.25.1


