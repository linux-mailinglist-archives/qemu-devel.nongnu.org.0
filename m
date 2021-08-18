Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CE3F0D5B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:32:19 +0200 (CEST)
Received: from localhost ([::1]:45516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTAY-0000Fe-Mf
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7j-0005ph-GW
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:23 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7h-0005kK-OM
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m26so3503261pff.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Stidml/odPUvC+YHiMlAiiUsdbljrJSn16BoAbCClEk=;
 b=k9PvBaGJ1d+Chbb7Bg5M3aj1SAybrUF78zNs58IMS2yjy7ebEzfpgoiu7TBTaNE1h8
 hO/2HtoiYyCtLmNY6ypGf2HV0lqTWIC+Fd0qCKPTjNa7glD9JWFwRUS4dJ8eq2twxAws
 06W0r4Kf+Oyvon/vx92v3P3hmyDuul52zs/3Ss2Ca8Ho7glQHQ45GLyvEfjm0xZ2JvBJ
 vJJWPieSrdrcR9+9L+yJo0Yrix8iiPK0kE2PiKFK8mXKiIeRTDH7eZed+jN8moV6x9oR
 C3iIXI6ZiaQTLVODLwqHRMZjyEhGxd1QuPGlXx8IIF9aiEnRznJ9pwLXhPFdfXYQX0Ma
 RSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Stidml/odPUvC+YHiMlAiiUsdbljrJSn16BoAbCClEk=;
 b=msc5ZXfrmYdeQiQBxrX7NxZOPMTO2lWei5FnVSf/fMHvEsRn/MeWFZ/vkkPYIipx9S
 WwW7RXDHQjNyv96okNeos+c3AddtSnF8BVrEcWBXgjMCjqgJBOn1B89qttyA2NwwmOMl
 AfQNeqfHJt3aojn5H6lFu9zzO+B7VBEtGRvFO84ZqoR85Y2Z8QqBzril7b9r7YJXHTPt
 bHojce+/kw2XagG8X8uq+iitmwKHyP8l1Li5+L13fmACLrw/xCHf1yTzhkWSjKkdO0PB
 PVJk/qIrHk8gvgn4jYAIpcSp0LyptH6v5YBD4ZOOIXEVopE3IbOb4g1KsPik+S6rdvat
 7N3w==
X-Gm-Message-State: AOAM5307CoaFQ2NPATSW/UorogpL0xN/CEbYhnjeJdNtFNLuElM+3kOw
 SQ5RrqFFvVSiss7lZipPFuiu0C2r7Xb3Tw==
X-Google-Smtp-Source: ABdhPJwGtJ5S4OGcRzNK5W0QUPRuUx8VGlur2h+cQT/vnoVm2HYnsUHSTLlpkhd6GP1U+ulzztdEeg==
X-Received: by 2002:a63:d34f:: with SMTP id u15mr710238pgi.200.1629322160435; 
 Wed, 18 Aug 2021 14:29:20 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/14] tcg/arm: Support unaligned access for softmmu
Date: Wed, 18 Aug 2021 11:29:04 -1000
Message-Id: <20210818212912.396794-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

From armv6, the architecture supports unaligned accesses.
All we need to do is perform the correct alignment check
in tcg_out_tlb_read and not use LDRD/STRD when the access
is not aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 69 ++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 31 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0c7e4f8411..c55167cc84 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -34,13 +34,6 @@ bool use_idiv_instructions;
 bool use_neon_instructions;
 #endif
 
-/* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */
-#ifdef CONFIG_SOFTMMU
-# define USING_SOFTMMU 1
-#else
-# define USING_SOFTMMU 0
-#endif
-
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
     "%r0",  "%r1",  "%r2",  "%r3",  "%r4",  "%r5",  "%r6",  "%r7",
@@ -1526,15 +1519,20 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
+    unsigned a_mask = (1 << get_alignment_bits(opc)) - 1;
+    TCGReg t_addr;
 
     /*
-     * We don't support inline unaligned acceses, but we can easily
-     * support overalignment checks.
+     * For v7, support for unaligned accesses is mandatory.
+     * For v6, support for unaligned accesses is enabled by SCTLR.U,
+     *     which is enabled by (at least) Linux and FreeBSD.
+     * For v4 and v5, unaligned accesses are... complicated, and
+     *     unhelped by Linux having a global not per-process flag
+     *     for unaligned handling.
      */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
+    if (!use_armv6_instructions && a_mask < s_mask) {
+        a_mask = s_mask;
     }
 
     /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
@@ -1578,27 +1576,32 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /*
      * Check alignment, check comparators.
-     * Do this in no more than 3 insns.  Use MOVW for v7, if possible,
+     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
      * to reduce the number of sequential conditional instructions.
      * Almost all guests have at least 4k pages, which means that we need
      * to clear at least 9 bits even for an 8-byte memory, which means it
      * isn't worth checking for an immediate operand for BIC.
      */
+    /* For unaligned accesses, test the page of the last byte. */
+    t_addr = addrlo;
+    if (a_mask < s_mask) {
+        t_addr = TCG_REG_R0;
+        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
+                        addrlo, s_mask - a_mask);
+    }
     if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
-        tcg_target_ulong mask = ~(TARGET_PAGE_MASK | ((1 << a_bits) - 1));
-
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, mask);
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
         tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
-                        addrlo, TCG_REG_TMP, 0);
+                        t_addr, TCG_REG_TMP, 0);
         tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
     } else {
-        if (a_bits) {
-            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo,
-                            (1 << a_bits) - 1);
+        if (a_mask) {
+            tcg_debug_assert(a_mask <= 0xff);
+            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
         }
-        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, addrlo,
+        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
                         SHIFT_IMM_LSR(TARGET_PAGE_BITS));
-        tcg_out_dat_reg(s, (a_bits ? COND_EQ : COND_AL), ARITH_CMP,
+        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
                         0, TCG_REG_R2, TCG_REG_TMP,
                         SHIFT_IMM_LSL(TARGET_PAGE_BITS));
     }
@@ -1763,8 +1766,9 @@ static inline void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         tcg_out_ld32_r(s, COND_AL, datalo, addrlo, addend);
         break;
     case MO_Q:
-        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        /* LDRD requires alignment; double-check that. */
+        if (use_armv6_instructions
+            && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
         } else if (datalo != addend) {
@@ -1806,8 +1810,9 @@ static inline void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc,
         tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_Q:
-        /* Avoid ldrd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        /* LDRD requires alignment; double-check that. */
+        if (use_armv6_instructions
+            && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
         } else if (datalo == addrlo) {
@@ -1882,8 +1887,9 @@ static inline void tcg_out_qemu_st_index(TCGContext *s, int cond, MemOp opc,
         tcg_out_st32_r(s, cond, datalo, addrlo, addend);
         break;
     case MO_64:
-        /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        /* STRD requires alignment; double-check that. */
+        if (use_armv6_instructions
+            && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
         } else {
@@ -1914,8 +1920,9 @@ static inline void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc,
         tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
         break;
     case MO_64:
-        /* Avoid strd for user-only emulation, to handle unaligned.  */
-        if (USING_SOFTMMU && use_armv6_instructions
+        /* STRD requires alignment; double-check that. */
+        if (use_armv6_instructions
+            && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
         } else {
-- 
2.25.1


