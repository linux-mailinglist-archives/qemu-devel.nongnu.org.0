Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9603F0CCD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:32:27 +0200 (CEST)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSEc-0007Uj-K9
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2J-0007yQ-A3
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2H-00067C-6i
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id f3so2563815plg.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r6oX0sSPyEwxmWKFqa3wE6vu1liF30zaILMwFsdFRog=;
 b=ygtet+A4A3yMhF+PdfcCHJxPE2XsgtrHUDsb5nX7JQpwdJYZ5VNP5fzsBUW/9XTlId
 7XO64KJyjRdJgwZmXsHlYfaMBNvhY8D3eydvQ1duD6cErvb3Bdw2/LqSDdVLVfOPeSgp
 +RyS9LUNB9k+tMrdKql+jb5o4gTR5ptdJDwRguYP+RFt5Y8Ezv9SckVBZjKvTvhUZiHd
 aHV/9ffH1eBUyR9WOL+51Z8JvdtsbYTHgoaPP+K7hXzMVwr12Xiag7RJEaJokJHCohBt
 XxlcaFtDT1HV2wKBmOAzzW8Ei1P5N14qtMG6aYIIL9r8kiZihopO7wGqiIDR/k1qcRyg
 MBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6oX0sSPyEwxmWKFqa3wE6vu1liF30zaILMwFsdFRog=;
 b=mh+2j4afjmNKrjxL2Tq+jkqiMJ9BOEfBuAJ8ZqGtiNu3MUdNstssUPp/GDsMdphvWV
 Ecb9B1QfWB4vLVor3lGdBclG8bLxiEM0tgMcZHVXQ+vjdYO8NSI0rWIYQwbC6jgKDRmu
 hZb2NgPOJES+im/9Gfby9AUSyTmvoRQ7GwrxkQ+YG0mhzkLQHBcF7To6f4mNGqHZetX4
 jDA5TujoDvHOYoeE4AB7qZY7OeM+KPAwvLTqxOHdmD/wJkbP9FN3U1e6lDjnyInwVBVe
 NlulGtUx1LX8XClhUXqq4vxtSlZWoPyQg0lkgJNjqKAN3UNQSCJnJwtuZBsZfIVkqokA
 cYWw==
X-Gm-Message-State: AOAM533IZ6AvFiwOwlS+7LU+A2ZiZRvZEc6YKcw0Qr7JsB+61pf5PAza
 ATDIStI3qZ4Whz6sGYa6z3A1YCNQEmfabA==
X-Google-Smtp-Source: ABdhPJz4ujo+OYUkSvCKV3jmFH+HKUlJiSUvJEIAG0IJZilmgWPV52nHNffUcyBXeCHi7vBHRMOuSg==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr11070536pjo.49.1629317976310; 
 Wed, 18 Aug 2021 13:19:36 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/16] tcg/mips: Support unaligned access for softmmu
Date: Wed, 18 Aug 2021 10:19:17 -1000
Message-Id: <20210818201931.393394-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use the routines just added for user-only to emit
unaligned accesses in softmmu mode too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 91 ++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 40 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 7ed0de9dae..3d6a0ba39e 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1154,8 +1154,10 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
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
@@ -1163,7 +1165,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     int add_off = offsetof(CPUTLBEntry, addend);
     int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
                    : offsetof(CPUTLBEntry, addr_write));
-    target_ulong mask;
+    target_ulong tlb_mask;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
@@ -1177,27 +1179,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
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
@@ -1205,7 +1193,25 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
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
@@ -1213,7 +1219,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
     /* Load and test the high half tlb comparator.  */
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
         /* delay slot */
-        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
 
         /* Load the tlb addend for the fast path.  */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
@@ -1535,8 +1541,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void __attribute__((unused))
-tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
+static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
                                     TCGReg base, MemOp opc, bool is_64)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
@@ -1655,8 +1660,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
 #else
-    unsigned a_bits, s_bits;
 #endif
+    unsigned a_bits, s_bits;
     TCGReg base = TCG_REG_A0;
 
     data_regl = *args++;
@@ -1665,10 +1670,20 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
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
@@ -1685,12 +1700,6 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
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
@@ -1770,8 +1779,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void __attribute__((unused))
-tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
+static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
                                     TCGReg base, MemOp opc)
 {
     const MIPSInsn sw1 = MIPS_BE ? OPC_SWL : OPC_SWR;
@@ -1851,9 +1859,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
-#else
-    unsigned a_bits, s_bits;
 #endif
+    unsigned a_bits, s_bits;
     TCGReg base = TCG_REG_A0;
 
     data_regl = *args++;
@@ -1862,10 +1869,20 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
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
@@ -1882,12 +1899,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
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


