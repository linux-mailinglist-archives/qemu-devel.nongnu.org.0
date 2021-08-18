Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D73F0C20
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:56:09 +0200 (CEST)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRfU-0001yC-NT
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA3-00082d-1T
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA0-0002t8-SS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:38 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so9569732pjn.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yK5fZoKCStyttLP0JcVE3OKam3tB/3GO7DNObKmyGfk=;
 b=yiAgg1IsNipwONYT3PiruyQAWfyuVgEHaNQR74So2nlW7SYlRRXcwHJsIIH9F3Z0Re
 ZItSwaa/Ub+cD1ouTTHzsTUb1Fifzx1F/nSyNrTM4+yJnfDPWzSX2rHtT/iOSyj58W//
 Lp3dXert5LNouGMzkhs7tW3aYmPInf0DgMOMJejB1PdfKHPl0/Ffni/Go6fAEb2zBTRB
 wiYaOxDLnNOOdX0H4cGsuxD0FQ5YTIb+GERBs/mj2XHVFb2/yfM7BynbVHRHc8X2OXm3
 Wbu3cI6i1Fk1TAWukEeJFzawcmodjw5XKa4m0DJVR8nZlDdthR8DpIVh4PSa/2fqD1zG
 f+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yK5fZoKCStyttLP0JcVE3OKam3tB/3GO7DNObKmyGfk=;
 b=Xpa+JYvshR018XEAzxtbDT8qbcNvbL4wtCWhdDM9NOQYLL3E0OSPnEZ6wYX2arCl65
 CRzwT4yN4iOYwtt/FUBXUeeJQX5HZNkGmgw0ExIHlIEup/1af7IkqtmcuulDyJuEO4I0
 SSGkhan+y/oyQqXpEJQfbWkHYndSwCYpW9RYVY0wbkSzOvI6As8yXQXwJVPj7gXenIf+
 hdiMGXHD+XiQEfdoCgwekk4uErCmQv+vwPnznESqh7+bgOP1KGvRk3p3ZPYNHFdLywjJ
 vnmIg4eGt3UfZWwpcZOB0V0qRgBWQyCWEOysX7xyzbw9tOUIx6FkPYFac+5Nsl+2xs9H
 ceAQ==
X-Gm-Message-State: AOAM5336d+gXkwFkV5l2Tq49TbBjR68KxcV/XLIXsxe/WfPKnX4BbTHn
 mG+wzXcq+X21NUpOl87Vax577xqWUR8Kpg==
X-Google-Smtp-Source: ABdhPJw34tkE6WipTR6+W97OBL9ZSDJEIHVDIeG7sMxKeo1VPaivb8kyKNjx8KU2R34iWbDGPEBoCQ==
X-Received: by 2002:a17:90a:f314:: with SMTP id
 ca20mr11175921pjb.210.1629314615509; 
 Wed, 18 Aug 2021 12:23:35 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 60/66] tcg/aarch64: Support raising sigbus for user-only
Date: Wed, 18 Aug 2021 09:19:14 -1000
Message-Id: <20210818191920.390759-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Use load-acquire / store-release for the normal case of
alignment matching the access size.  Otherwise, emit a
test + branch sequence invoking helper_unaligned_mmu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |   2 -
 tcg/aarch64/tcg-target.c.inc | 174 +++++++++++++++++++++++++++++++----
 2 files changed, 157 insertions(+), 19 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 7a93ac8023..876af589ce 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -151,9 +151,7 @@ typedef enum {
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 5edca8d44d..f5664636cf 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -10,6 +10,7 @@
  * See the COPYING file in the top-level directory for details.
  */
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
 
@@ -390,6 +391,10 @@ typedef enum {
     I3305_LDR_v64   = 0x5c000000,
     I3305_LDR_v128  = 0x9c000000,
 
+    /* Load/store exclusive */
+    I3306_LDAR      = 0x08808000 | LDST_LD << 22, /* plus MO << 30 */
+    I3306_STLR      = 0x08808000 | LDST_ST << 22, /* plus MO << 30 */
+
     /* Load/store register.  Described here as 3.3.12, but the helper
        that emits them can transform to 3.3.10 or 3.3.13.  */
     I3312_STRB      = 0x38000000 | LDST_ST << 22 | MO_8 << 30,
@@ -443,6 +448,7 @@ typedef enum {
     I3404_ANDI      = 0x12000000,
     I3404_ORRI      = 0x32000000,
     I3404_EORI      = 0x52000000,
+    I3404_ANDSI     = 0x72000000,
 
     /* Move wide immediate instructions.  */
     I3405_MOVN      = 0x12800000,
@@ -453,6 +459,9 @@ typedef enum {
     I3406_ADR       = 0x10000000,
     I3406_ADRP      = 0x90000000,
 
+    /* Add/subtract extended register. */
+    I3501_ADDEXT    = 0x0b200000,
+
     /* Add/subtract shifted register instructions (without a shift).  */
     I3502_ADD       = 0x0b000000,
     I3502_ADDS      = 0x2b000000,
@@ -623,6 +632,14 @@ static void tcg_out_insn_3305(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (imm19 & 0x7ffff) << 5 | rt);
 }
 
+static void G_GNUC_UNUSED
+tcg_out_insn_3306(TCGContext *s, AArch64Insn insn, MemOp sz,
+                  TCGReg rs, TCGReg rt, TCGReg rt2, TCGReg rn)
+{
+    tcg_out32(s, insn | (sz << 30) | (rs << 16) |
+              (rt2 << 10) | (rn << 5) | rt);
+}
+
 static void tcg_out_insn_3201(TCGContext *s, AArch64Insn insn, TCGType ext,
                               TCGReg rt, int imm19)
 {
@@ -705,6 +722,13 @@ static void tcg_out_insn_3406(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (disp & 3) << 29 | (disp & 0x1ffffc) << (5 - 2) | rd);
 }
 
+static inline void tcg_out_insn_3501(TCGContext *s, AArch64Insn insn,
+                                     TCGReg rd, TCGReg rn,
+                                     TCGReg rm, MemOp ext)
+{
+    tcg_out32(s, insn | 1 << 31 | rm << 16 | ext << 13 | rn << 5 | rd);
+}
+
 /* This function is for both 3.5.2 (Add/Subtract shifted register), for
    the rare occasion when we actually want to supply a shift amount.  */
 static inline void tcg_out_insn_3502S(TCGContext *s, AArch64Insn insn,
@@ -1328,8 +1352,9 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     if (offset == sextract64(offset, 0, 26)) {
         tcg_out_insn(s, 3206, B, offset);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
+        /* Choose X9 as a call-clobbered non-LR temporary. */
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X9, (intptr_t)target);
+        tcg_out_insn(s, 3207, BR, TCG_REG_X9);
     }
 }
 
@@ -1541,9 +1566,14 @@ static void tcg_out_cltz(TCGContext *s, TCGType ext, TCGReg d,
     }
 }
 
-#ifdef CONFIG_SOFTMMU
-#include "../tcg-ldst.c.inc"
+static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
+{
+    ptrdiff_t offset = tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset == sextract64(offset, 0, 21));
+    tcg_out_insn(s, 3406, ADR, rd, offset);
+}
 
+#ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
  */
@@ -1577,13 +1607,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-static inline void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     MemOpIdx oi = lb->oi;
@@ -1714,15 +1737,85 @@ static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
     tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
 }
 
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
+                                   unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->addrlo_reg = addr_reg;
+
+    /* tst addr, #mask */
+    tcg_out_logicali(s, I3404_ANDSI, 0, TCG_REG_XZR, addr_reg, a_mask);
+
+    label->label_ptr[0] = s->code_ptr;
+
+    /* b.ne slow_path */
+    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
+
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
+
+    /*
+     * "Tail call" to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.
+     */
+    tcg_out_adr(s, TCG_REG_LR, l->raddr);
+    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
+                                        : helper_unaligned_st));
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
+static void tcg_out_qemu_ld_acquire(TCGContext *s, MemOp memop, TCGType ext,
+                                    TCGReg data_r, TCGReg addr_r)
+{
+    MemOp size = memop & MO_SIZE;
+
+    tcg_out_insn(s, 3306, LDAR, size,
+                 TCG_REG_XZR, data_r, TCG_REG_XZR, addr_r);
+    if (memop & MO_SIGN) {
+        tcg_out_sxt(s, ext, size, data_r, data_r);
+    }
+}
+
+static void tcg_out_qemu_st_release(TCGContext *s, MemOp memop,
+                                    TCGReg data_r, TCGReg addr_r)
+{
+    MemOp size = memop & MO_SIZE;
+
+    tcg_out_insn(s, 3306, STLR, size,
+                 TCG_REG_XZR, data_r, TCG_REG_XZR, addr_r);
+}
+
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
-
     switch (memop & MO_SSIZE) {
     case MO_UB:
         tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
@@ -1756,9 +1849,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
                                    TCGReg data_r, TCGReg addr_r,
                                    TCGType otype, TCGReg off_r)
 {
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
-
     switch (memop & MO_SIZE) {
     case MO_8:
         tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
@@ -1782,6 +1872,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
@@ -1792,6 +1886,28 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
+    unsigned a_bits = get_alignment_bits(memop);
+
+    if (a_bits) {
+        /*
+         * If alignment required, and equals the access size, then
+         * use load-acquire for the size effect of alignment checking.
+         * Despite the extra memory barrier, for a ThunderX2 host,
+         * this is is about 40% faster.  It is always smaller.
+         */
+        if (a_bits == (memop & MO_SIZE)) {
+            if (USE_GUEST_BASE) {
+                tcg_out_insn(s, 3501, ADDEXT, TCG_REG_TMP, TCG_REG_GUEST_BASE,
+                             addr_reg, TARGET_LONG_BITS == 64 ? MO_64 : MO_32);
+                addr_reg = TCG_REG_TMP;
+            }
+            tcg_out_qemu_ld_acquire(s, memop, ext, data_reg, addr_reg);
+            return;
+        }
+
+        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    }
+
     if (USE_GUEST_BASE) {
         tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
                                TCG_REG_GUEST_BASE, otype, addr_reg);
@@ -1807,6 +1923,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((memop & MO_BSWAP) == 0);
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
@@ -1817,6 +1937,26 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
                         data_reg, addr_reg, s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
+    unsigned a_bits = get_alignment_bits(memop);
+
+    if (a_bits) {
+        /*
+         * If alignment required, and equals the access size, then
+         * use store-release for the size effect of alignment checking.
+         */
+        if (a_bits == (memop & MO_SIZE)) {
+            if (USE_GUEST_BASE) {
+                tcg_out_insn(s, 3501, ADDEXT, TCG_REG_TMP, TCG_REG_GUEST_BASE,
+                             addr_reg, TARGET_LONG_BITS == 64 ? MO_64 : MO_32);
+                addr_reg = TCG_REG_TMP;
+            }
+            tcg_out_qemu_st_release(s, memop, data_reg, addr_reg);
+            return;
+        }
+
+        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    }
+
     if (USE_GUEST_BASE) {
         tcg_out_qemu_st_direct(s, memop, data_reg,
                                TCG_REG_GUEST_BASE, otype, addr_reg);
-- 
2.25.1


