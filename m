Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D363F0D9B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:43:02 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTKv-0002I9-4D
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7s-0006MK-V5
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7p-0005pr-Ul
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so3333938pjb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q5i+88+W8J5jrTIxMK8HSdJnmF3iUhh3YBbOpnD+6ds=;
 b=Rscbsps4+KD70N0STKVf9lBApyuLcfB+d+GXphfXTmQsXoxPOd8iwyvRvT0a5BN5fJ
 V55G4mRet2ulDXnDEe79PYOgFOwOLRMRCPIrAlhX3W9LzU4X0R5ihnamR5INCsvvy0fW
 QmK+QkL/lQbr1aK1klhUssSHtu5ci0KndsgkJvQ6+NUKext1+dFfhEPcgCbdztGLFSGc
 YE869L/tRejUyhqqdyYJYpRw6lWY51sJ65nS1w7zDjJ+SePkfDpZE5O/SSws7KoQuhvJ
 Z1nakdOePgk7LFv1d7hzZC5VM7tgsg+1osvqOSeUmAY8s9L7f2IGnlmzF7EfK4Y55G/o
 iKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5i+88+W8J5jrTIxMK8HSdJnmF3iUhh3YBbOpnD+6ds=;
 b=fc0CRliuQ0t5ggDiX/wswfU0MriCQTT0O2KyFR1i6M5aVC01ERNZzHP7U1DFzNiA3/
 dbovGJVJFvqsYr55LQBFddP7BrAc3ALxfeo/GvAluNMoMXaNzAGSC/bWBsBPGUbBCXpZ
 Ha7WJs+cAkWcCRZfsLQK3o4DeaZ2A2pKULALGelXlF6m2TZmdq5n5ZyBn26ALuXGbvPM
 XD13SNwg1wT3t7lApp/rEBeupJQZmR5fUDm6cbWLKJqVsf/GfbEGgkK4s8UbN3Uadecf
 ZFWiawCebCnuIWJ7u3bFhNfZREmheG/zQCHkJ0zns1z//trtQs9Ced0icUjYZyfQ62Fb
 jdnQ==
X-Gm-Message-State: AOAM531F6POQHjLKoaLjjqMqegq2FyePZkfcKD9kVM/6Lv67K82HyD5Z
 cJ5qdpiFvHiOc47mKjLt/NxvYR525ep5cw==
X-Google-Smtp-Source: ABdhPJzk54tob/rcC7rgzx4QMbdWJXvawnu43CR3+moHFhwSTRwj18kbZmrWYrfUlxqWk3+S2r7O0A==
X-Received: by 2002:a17:902:7c15:b029:12c:78ec:bb61 with SMTP id
 x21-20020a1709027c15b029012c78ecbb61mr8979693pll.61.1629322168514; 
 Wed, 18 Aug 2021 14:29:28 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/14] tcg/arm: Support raising sigbus for user-only
Date: Wed, 18 Aug 2021 11:29:12 -1000
Message-Id: <20210818212912.396794-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

For v6+, use ldm/stm, ldrd/strd for the normal case of alignment
matching the access size.  Otherwise, emit a test + branch sequence
invoking helper_unaligned_{ld,st}.

For v4+v5, use piecewise load and stores to implement misalignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |   2 -
 tcg/arm/tcg-target.c.inc | 364 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 340 insertions(+), 26 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index e47720a85b..fa75fd3626 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -159,9 +159,7 @@ extern bool use_neon_instructions;
 /* not defined -- call should be eliminated at compile time */
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 2728035177..278639be44 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -23,6 +23,7 @@
  */
 
 #include "elf.h"
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
 int arm_arch = __ARM_ARCH;
@@ -86,6 +87,7 @@ static const int tcg_target_call_oarg_regs[2] = {
 #define TCG_VEC_TMP  TCG_REG_Q15
 #ifndef CONFIG_SOFTMMU
 #define TCG_REG_GUEST_BASE  TCG_REG_R11
+#define TCG_REG_TMP2        TCG_REG_R14
 #endif
 
 typedef enum {
@@ -137,7 +139,9 @@ typedef enum {
     INSN_CLZ       = 0x016f0f10,
     INSN_RBIT      = 0x06ff0f30,
 
+    INSN_LDM       = 0x08900000,
     INSN_LDMIA     = 0x08b00000,
+    INSN_STM       = 0x08800000,
     INSN_STMDB     = 0x09200000,
 
     INSN_LDR_IMM   = 0x04100000,
@@ -1428,8 +1432,6 @@ static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
 }
 
 #ifdef CONFIG_SOFTMMU
-#include "../tcg-ldst.c.inc"
-
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
@@ -1762,6 +1764,74 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
+                                   TCGReg addrhi, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label = new_ldst_label(s);
+
+    label->is_ld = is_ld;
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = addrhi;
+
+    /* We are expecting a_bits to max out at 7, and can easily support 8. */
+    tcg_debug_assert(a_mask <= 0xff);
+    /* tst addr, #mask */
+    tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
+
+    /* blne slow_path */
+    label->label_ptr[0] = s->code_ptr;
+    tcg_out_bl_imm(s, COND_NE, 0);
+
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    if (TARGET_LONG_BITS == 64) {
+        /* 64-bit target address is aligned into R2:R3. */
+        if (l->addrhi_reg != TCG_REG_R2) {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
+        } else if (l->addrlo_reg != TCG_REG_R3) {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
+        } else {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, TCG_REG_R2);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, TCG_REG_R3);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, TCG_REG_R1);
+        }
+    } else {
+        tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
+    }
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_AREG0);
+
+    /*
+     * Tail call to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.  We have used BLNE to arrive here, so LR is
+     * already set.
+     */
+    tcg_out_goto(s, COND_AL, (const void *)
+                 (l->is_ld ? helper_unaligned_ld : helper_unaligned_st));
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
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
@@ -1811,45 +1881,175 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
 
 #ifndef CONFIG_SOFTMMU
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
-                                   TCGReg datahi, TCGReg addrlo)
+                                   TCGReg datahi, TCGReg addrlo, uint8_t ofs)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ld8_12(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_ld8_12(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_SB:
-        tcg_out_ld8s_8(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_ld8s_8(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_UW:
-        tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_ld16u_8(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_SW:
-        tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_ld16s_8(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_UL:
-        tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_ld32_12(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_Q:
         /* LDRD requires alignment; double-check that. */
         if (use_armv6_instructions
             && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
-            tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
+            tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, ofs);
         } else if (datalo == addrlo) {
-            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
-            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
+            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, ofs + 4);
+            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, ofs);
         } else {
-            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, 4);
+            tcg_out_ld32_12(s, COND_AL, datalo, addrlo, ofs);
+            tcg_out_ld32_12(s, COND_AL, datahi, addrlo, ofs + 4);
         }
         break;
     default:
         g_assert_not_reached();
     }
 }
+
+/*
+ * There are a some interesting special cases for which we can get
+ * the alignment check for free with the instruction.  For MO_16,
+ * we would need to enlist ARMv8 load-acquire halfword (LDAH).
+ */
+static bool tcg_out_qemu_ld_align(TCGContext *s, MemOp opc, TCGReg datalo,
+                                  TCGReg datahi, TCGReg addrlo,
+                                  unsigned a_bits)
+{
+    unsigned s_bits = opc & MO_SIZE;
+
+    /* LDM enforces 4-byte alignment. */
+    if (a_bits == MO_32 && s_bits >= MO_32) {
+        TCGReg tmphi, tmplo;
+
+        if (guest_base) {
+            tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP, addrlo,
+                            TCG_REG_GUEST_BASE, SHIFT_IMM_LSL(0));
+            addrlo = TCG_REG_TMP;
+        }
+
+        if (s_bits == MO_32) {
+            /* ldm addrlo, { datalo } */
+            tcg_out_ldstm(s, COND_AL, INSN_LDM, addrlo, 1 << datalo);
+            return true;
+        }
+        /* else MO_64... */
+
+        /*
+         * LDM loads in mask order, so we want the second part to be loaded
+         * into a higher register number.  Note that both R12 and R14 are
+         * reserved, so we always have a maximum regno to use.
+         */
+        tmplo = datalo;
+        tmphi = datahi;
+        if (MO_BSWAP == MO_LE) {
+            if (datalo > datahi) {
+                tmphi = TCG_REG_TMP;
+            }
+        } else {
+            if (datalo < datahi) {
+                tmplo = TCG_REG_TMP;
+            }
+        }
+
+        /* ldm addrlo, { tmplo, tmphi } */
+        tcg_out_ldstm(s, COND_AL, INSN_LDM, addrlo, 1 << tmplo | 1 << tmphi);
+
+        tcg_out_mov(s, TCG_TYPE_I32, datahi, tmphi);
+        tcg_out_mov(s, TCG_TYPE_I32, datalo, tmplo);
+        return true;
+    }
+
+    /* LDRD enforces 8-byte alignment. */
+    if (a_bits == MO_64 && s_bits == MO_64
+        && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (guest_base) {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, guest_base);
+            tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, TCG_REG_TMP);
+        } else {
+            tcg_out_ldrd_8(s, COND_AL, datalo, addrlo, 0);
+        }
+        return true;
+    }
+    return false;
+}
+
+static void tcg_out_qemu_ld_unalign(TCGContext *s, MemOp opc,
+                                    TCGReg datalo, TCGReg datahi,
+                                    TCGReg addrlo, unsigned a_bits)
+{
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_size = 1 << s_bits;
+    unsigned a_size = 1 << a_bits;
+    bool init = true;
+    unsigned i;
+
+    if (guest_base) {
+        tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP2, addrlo,
+                        TCG_REG_GUEST_BASE, SHIFT_IMM_LSL(0));
+        addrlo = TCG_REG_TMP2;
+    }
+
+    /*
+     * Perform the load in units of a_size.
+     */
+    if (MO_BSWAP == MO_LE) {
+        for (i = 0; i < s_size; ) {
+            if (init) {
+                tcg_out_qemu_ld_direct(s, a_bits, datalo, 0, addrlo, i);
+                init = false;
+            } else {
+                /*
+                 * Note that MO_SIGN will only be set for MO_16, and we
+                 * want the sign bit for the second byte, when !init.
+                 */
+                tcg_out_qemu_ld_direct(s, a_bits | (opc & MO_SIZE),
+                                       TCG_REG_TMP, 0, addrlo, i);
+                tcg_out_dat_reg(s, COND_AL, ARITH_ORR,
+                                datalo, datalo, TCG_REG_TMP,
+                                SHIFT_IMM_LSL(i * 8));
+            }
+            i += a_size;
+            if (s_size == 8 && i == 4) {
+                datalo = datahi;
+                init = true;
+            }
+        }
+    } else {
+        for (i = 0; i < s_size; ) {
+            if (init) {
+                /* See above, only reversed for big-endian. */
+                tcg_out_qemu_ld_direct(s, a_bits | (opc & MO_SIZE),
+                                       datahi, 0, addrlo, i);
+                init = false;
+            } else {
+                tcg_out_qemu_ld_direct(s, a_bits, TCG_REG_TMP, 0, addrlo, i);
+                tcg_out_dat_reg(s, COND_AL, ARITH_ORR,
+                                datahi, TCG_REG_TMP, datahi,
+                                SHIFT_IMM_LSL(a_size * 8));
+            }
+            i += a_size;
+            if (s_size == 8 && i == 4) {
+                datahi = datalo;
+                init = true;
+            }
+        }
+    }
+}
 #endif
 
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
@@ -1861,6 +2061,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     int mem_index;
     TCGReg addend;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits, s_bits;
 #endif
 
     datalo = *args++;
@@ -1884,11 +2086,23 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    if (guest_base) {
+    a_bits = get_alignment_bits(opc);
+    s_bits = opc & MO_SIZE;
+
+    if (use_armv6_instructions &&
+        tcg_out_qemu_ld_align(s, datalo, datahi, addrlo, a_bits, s_bits)) {
+        return;
+    }
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
+    if (!use_armv6_instructions && a_bits < MO_32) {
+        tcg_out_qemu_ld_unalign(s, opc, datalo, datahi, addrlo, a_bits);
+    } else if (guest_base) {
         tcg_out_qemu_ld_index(s, opc, datalo, datahi,
                               addrlo, TCG_REG_GUEST_BASE, false);
     } else {
-        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, addrlo);
+        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, addrlo, 0);
     }
 #endif
 }
@@ -1934,36 +2148,122 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
 
 #ifndef CONFIG_SOFTMMU
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
-                                   TCGReg datahi, TCGReg addrlo)
+                                   TCGReg datahi, TCGReg addrlo, uint8_t ofs)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & MO_SIZE) {
     case MO_8:
-        tcg_out_st8_12(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_st8_12(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_16:
-        tcg_out_st16_8(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_st16_8(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_32:
-        tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
+        tcg_out_st32_12(s, COND_AL, datalo, addrlo, ofs);
         break;
     case MO_64:
         /* STRD requires alignment; double-check that. */
         if (use_armv6_instructions
             && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
-            tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
+            tcg_out_strd_8(s, COND_AL, datalo, addrlo, ofs);
         } else {
-            tcg_out_st32_12(s, COND_AL, datalo, addrlo, 0);
-            tcg_out_st32_12(s, COND_AL, datahi, addrlo, 4);
+            tcg_out_st32_12(s, COND_AL, datalo, addrlo, ofs);
+            tcg_out_st32_12(s, COND_AL, datahi, addrlo, ofs + 4);
         }
         break;
     default:
         g_assert_not_reached();
     }
 }
+
+static bool tcg_out_qemu_st_align(TCGContext *s, TCGReg datalo,
+                                  TCGReg datahi, TCGReg addrlo,
+                                  unsigned a_bits, unsigned s_bits)
+{
+    /* STM enforces 4-byte alignment. */
+    if (a_bits == MO_32) {
+        uint16_t mask = 1 << datalo;
+
+        switch (s_bits) {
+        case MO_64:
+            /*
+             * STM stores in mask order, so we want the second part to be
+             * in a higher register number.  Note that both R12 and R14
+             * are reserved, so we always have a maximum regno to use.
+             */
+            if (MO_BSWAP == MO_LE) {
+                if (datalo > datahi) {
+                    tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_TMP, datahi);
+                    datahi = TCG_REG_TMP;
+                }
+            } else {
+                if (datalo < datahi) {
+                    tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_TMP, datalo);
+                    datalo = TCG_REG_TMP;
+                }
+            }
+            mask = 1 << datalo | 1 << datahi;
+            /* fall through */
+
+        case MO_32:
+            if (guest_base) {
+                tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP2, addrlo,
+                                TCG_REG_GUEST_BASE, SHIFT_IMM_LSL(0));
+                addrlo = TCG_REG_TMP2;
+            }
+            tcg_out_ldstm(s, COND_AL, INSN_STM, addrlo, mask);
+            return true;
+        }
+        return false;
+    }
+
+    /* STRD enforces 8-byte alignment. */
+    if (a_bits == MO_64 && s_bits == MO_64
+        && (datalo & 1) == 0 && datahi == datalo + 1) {
+        if (guest_base) {
+            tcg_out_strd_r(s, COND_AL, datalo, addrlo, TCG_REG_GUEST_BASE);
+        } else {
+            tcg_out_strd_8(s, COND_AL, datalo, addrlo, 0);
+        }
+        return true;
+    }
+    return false;
+}
+
+static void tcg_out_qemu_st_unalign(TCGContext *s, MemOp opc,
+                                    TCGReg datalo, TCGReg datahi,
+                                    TCGReg addrlo, unsigned a_bits)
+{
+    int s_bits = opc & MO_SIZE;
+    int s_size = 1 << s_bits;
+    int a_size = 1 << a_bits;
+    int i;
+
+    if (guest_base) {
+        tcg_out_dat_reg(s, COND_AL, ARITH_ADD, TCG_REG_TMP2, addrlo,
+                        TCG_REG_GUEST_BASE, SHIFT_IMM_LSL(0));
+        addrlo = TCG_REG_TMP2;
+    }
+
+    /*
+     * Perform the store in units of a_size.
+     */
+    for (i = 0; i < s_size; i += a_size) {
+        int shift = (MO_BSWAP == MO_LE ? i : s_size - a_size - i) * 8;
+        TCGReg t = (i < 32 ? datalo : datahi);
+
+        shift &= 31;
+        if (shift) {
+            tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t,
+                            SHIFT_IMM_LSR(shift));
+            t = TCG_REG_TMP;
+        }
+        tcg_out_qemu_st_direct(s, a_bits, t, 0, addrlo, i);
+    }
+}
 #endif
 
 static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
@@ -1975,6 +2275,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     int mem_index;
     TCGReg addend;
     tcg_insn_unit *label_ptr;
+#else
+    unsigned a_bits, s_bits;
 #endif
 
     datalo = *args++;
@@ -1998,11 +2300,22 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
-    if (guest_base) {
+    a_bits = get_alignment_bits(opc);
+    s_bits = opc & MO_SIZE;
+
+    if (tcg_out_qemu_st_align(s, datalo, datahi, addrlo, a_bits, s_bits)) {
+        return;
+    }
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
+    if (!use_armv6_instructions && a_bits < MO_32) {
+        tcg_out_qemu_st_unalign(s, opc, datalo, datahi, addrlo, a_bits);
+    } else if (guest_base) {
         tcg_out_qemu_st_index(s, COND_AL, opc, datalo, datahi,
                               addrlo, TCG_REG_GUEST_BASE, false);
     } else {
-        tcg_out_qemu_st_direct(s, opc, datalo, datahi, addrlo);
+        tcg_out_qemu_st_direct(s, opc, datalo, datahi, addrlo, 0);
     }
 #endif
 }
@@ -2558,6 +2871,9 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_PC);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP);
+#ifndef CONFIG_SOFTMMU
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
+#endif
 }
 
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
-- 
2.25.1


