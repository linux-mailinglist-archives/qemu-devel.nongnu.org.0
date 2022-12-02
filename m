Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393C6400C5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuA-0007ZI-Cl; Fri, 02 Dec 2022 01:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu4-0007YO-DU
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:08 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu1-0003ec-FA
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:08 -0500
Received: by mail-pl1-x630.google.com with SMTP id y4so3841683plb.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkxAHU1OpV8djiv/f6/tmq1e3ZfaO5uGqO8j36dYmss=;
 b=yqFXIgdtJESf6rmW8QTMI+rFj4EfVw9niTSw0LsBbkfFClcG9NRsTVKqQawT55rehM
 H6NEKoH0tgCEWVu5T02Z/035eBcE4MRbBAJN8Kf+YOpyZNZaWg0pvtmVFgXSPSBu4EuI
 x7Ez+zg+8MVy1KUMcwH7ZymgBi4fehj2j9zrNc2Et1foODQF/kIJkX1rfChg07OKsWgl
 1yLBOLfJOLSK7htc9gLLKSGk+RTT941ERHLIQrtvPjmCgzoYpJ+c+Wto+O7Q18oK6hR5
 XOtT+Lt0yGJfNGPb2oYFeJyivH7NCoFTsn264ZKwOZsyLRpnQA54SrrxsBNlAyT7xryw
 a2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkxAHU1OpV8djiv/f6/tmq1e3ZfaO5uGqO8j36dYmss=;
 b=chAtFrK2vCtoY3c5YzKhuD6wDThl2G5tVqbiQJo9AgINyo4K7uy9O/LWKmaX6DTD4n
 jKsGHSoOpjdplppHGo4PNYMJwR0xmZ8/KDbb4GYuLTT/WQDWIAe5OcU89I5fz+jhrVV4
 4UGbCb3T4EfnKiIgVVR7Jr7wnq+7V68/cmsgyDwQZQLBd+RNAUMTxkBSzbUokGxqcyqe
 h6o3EcTQGmVAm+tKhmn7T36FIIs5DnJ2KtQbklxNTx8zL4n0wNC6lOrl3NTfJxaEm3Ur
 h28pUsPREYJkLH72UnS/e2ayLD31pua7Ou1IezjhKUpurjiB3xu7zuxEct91lQQW7CSp
 yjNw==
X-Gm-Message-State: ANoB5pkRTsDTgSx792zpu1k0O7feQNnZddySi20Q06lJkhYx40gNEW5v
 Rwck/xYJgTFFuUs5eeZwdx+cOATkcqO5SZud
X-Google-Smtp-Source: AA0mqf6yTWz1MIYyZEUcta+K93ZtlhnbN736J7bkkrs1RGOi+T5i0NI0Yg8SKX4+69GrWN9smtXrOA==
X-Received: by 2002:a17:902:8d93:b0:17f:8042:7223 with SMTP id
 v19-20020a1709028d9300b0017f80427223mr56338393plo.38.1669963923649; 
 Thu, 01 Dec 2022 22:52:03 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
Date: Thu,  1 Dec 2022 22:51:49 -0800
Message-Id: <20221202065200.224537-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts 829e1376d940 ("tcg/s390: Introduce TCG_REG_TB"), and
several follow-up patches.  The primary motivation is to reduce the
less-tested code paths, pre-z10.  Secondarily, this allows the
unconditional use of TCG_TARGET_HAS_direct_jump, which might be more
important for performance than any slight increase in code size.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |   2 +-
 tcg/s390x/tcg-target.c.inc | 176 +++++--------------------------------
 2 files changed, 23 insertions(+), 155 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 22d70d431b..645f522058 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -103,7 +103,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_direct_jump    1
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index cb00bb6999..8a4bec0a28 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -65,12 +65,6 @@
 /* A scratch register that may be be used throughout the backend.  */
 #define TCG_TMP0        TCG_REG_R1
 
-/* A scratch register that holds a pointer to the beginning of the TB.
-   We don't need this when we have pc-relative loads with the general
-   instructions extension facility.  */
-#define TCG_REG_TB      TCG_REG_R12
-#define USE_REG_TB      (!HAVE_FACILITY(GEN_INST_EXT))
-
 #ifndef CONFIG_SOFTMMU
 #define TCG_GUEST_BASE_REG TCG_REG_R13
 #endif
@@ -813,8 +807,8 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
 }
 
 /* load a register with an immediate value */
-static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long sval, bool in_prologue)
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long sval)
 {
     tcg_target_ulong uval;
 
@@ -853,14 +847,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
             tcg_out_insn(s, RIL, LARL, ret, off);
             return;
         }
-    } else if (USE_REG_TB && !in_prologue) {
-        ptrdiff_t off = tcg_tbrel_diff(s, (void *)sval);
-        if (off == sextract64(off, 0, 20)) {
-            /* This is certain to be an address within TB, and therefore
-               OFF will be negative; don't try RX_LA.  */
-            tcg_out_insn(s, RXY, LAY, ret, TCG_REG_TB, TCG_REG_NONE, off);
-            return;
-        }
     }
 
     /* A 32-bit unsigned value can be loaded in 2 insns.  And given
@@ -876,10 +862,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     if (HAVE_FACILITY(GEN_INST_EXT)) {
         tcg_out_insn(s, RIL, LGRL, ret, 0);
         new_pool_label(s, sval, R_390_PC32DBL, s->code_ptr - 2, 2);
-    } else if (USE_REG_TB && !in_prologue) {
-        tcg_out_insn(s, RXY, LG, ret, TCG_REG_TB, TCG_REG_NONE, 0);
-        new_pool_label(s, sval, R_390_20, s->code_ptr - 2,
-                       tcg_tbrel_diff(s, NULL));
     } else {
         TCGReg base = ret ? ret : TCG_TMP0;
         tcg_out_insn(s, RIL, LARL, base, 0);
@@ -888,12 +870,6 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     }
 }
 
-static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long sval)
-{
-    tcg_out_movi_int(s, type, ret, sval, false);
-}
-
 /* Emit a load/store type instruction.  Inputs are:
    DATA:     The register to be loaded or stored.
    BASE+OFS: The effective address.
@@ -1020,35 +996,6 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-/* load data from an absolute host address */
-static void tcg_out_ld_abs(TCGContext *s, TCGType type,
-                           TCGReg dest, const void *abs)
-{
-    intptr_t addr = (intptr_t)abs;
-
-    if (HAVE_FACILITY(GEN_INST_EXT) && !(addr & 1)) {
-        ptrdiff_t disp = tcg_pcrel_diff(s, abs) >> 1;
-        if (disp == (int32_t)disp) {
-            if (type == TCG_TYPE_I32) {
-                tcg_out_insn(s, RIL, LRL, dest, disp);
-            } else {
-                tcg_out_insn(s, RIL, LGRL, dest, disp);
-            }
-            return;
-        }
-    }
-    if (USE_REG_TB) {
-        ptrdiff_t disp = tcg_tbrel_diff(s, abs);
-        if (disp == sextract64(disp, 0, 20)) {
-            tcg_out_ld(s, type, dest, TCG_REG_TB, disp);
-            return;
-        }
-    }
-
-    tcg_out_movi(s, TCG_TYPE_PTR, dest, addr & ~0xffff);
-    tcg_out_ld(s, type, dest, dest, addr & 0xffff);
-}
-
 static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
                                  int msb, int lsb, int ofs, int z)
 {
@@ -1243,17 +1190,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         return;
     }
 
-    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
-    if (USE_REG_TB) {
-        if (!maybe_out_small_movi(s, type, TCG_TMP0, val)) {
-            tcg_out_insn(s, RXY, NG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
-            new_pool_label(s, val & valid, R_390_20, s->code_ptr - 2,
-                           tcg_tbrel_diff(s, NULL));
-            return;
-        }
-    } else {
-        tcg_out_movi(s, type, TCG_TMP0, val);
-    }
+    tcg_out_movi(s, type, TCG_TMP0, val);
     if (type == TCG_TYPE_I32) {
         tcg_out_insn(s, RR, NR, dest, TCG_TMP0);
     } else {
@@ -1297,24 +1234,11 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         }
     }
 
-    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
-    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
-        if (type == TCG_TYPE_I32) {
-            tcg_out_insn(s, RR, OR, dest, TCG_TMP0);
-        } else {
-            tcg_out_insn(s, RRE, OGR, dest, TCG_TMP0);
-        }
-    } else if (USE_REG_TB) {
-        tcg_out_insn(s, RXY, OG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
-        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
-                       tcg_tbrel_diff(s, NULL));
+    tcg_out_movi(s, type, TCG_TMP0, val);
+    if (type == TCG_TYPE_I32) {
+        tcg_out_insn(s, RR, OR, dest, TCG_TMP0);
     } else {
-        /* Perform the OR via sequential modifications to the high and
-           low parts.  Do this via recursion to handle 16-bit vs 32-bit
-           masks in each half.  */
-        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
-        tgen_ori(s, type, dest, val & 0x00000000ffffffffull);
-        tgen_ori(s, type, dest, val & 0xffffffff00000000ull);
+        tcg_out_insn(s, RRE, OGR, dest, TCG_TMP0);
     }
 }
 
@@ -1332,26 +1256,11 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         }
     }
 
-    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
-    if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
-        if (type == TCG_TYPE_I32) {
-            tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
-        } else {
-            tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
-        }
-    } else if (USE_REG_TB) {
-        tcg_out_insn(s, RXY, XG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
-        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
-                       tcg_tbrel_diff(s, NULL));
+    tcg_out_movi(s, type, TCG_TMP0, val);
+    if (type == TCG_TYPE_I32) {
+        tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
     } else {
-        /* Perform the xor by parts.  */
-        tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
-        if (val & 0xffffffff) {
-            tcg_out_insn(s, RIL, XILF, dest, val);
-        }
-        if (val > 0xffffffff) {
-            tcg_out_insn(s, RIL, XIHF, dest, val >> 32);
-        }
+        tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
     }
 }
 
@@ -1395,19 +1304,6 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
         if (maybe_out_small_movi(s, type, TCG_TMP0, c2)) {
             c2 = TCG_TMP0;
             /* fall through to reg-reg */
-        } else if (USE_REG_TB) {
-            if (type == TCG_TYPE_I32) {
-                op = (is_unsigned ? RXY_CLY : RXY_CY);
-                tcg_out_insn_RXY(s, op, r1, TCG_REG_TB, TCG_REG_NONE, 0);
-                new_pool_label(s, (uint32_t)c2, R_390_20, s->code_ptr - 2,
-                               4 - tcg_tbrel_diff(s, NULL));
-            } else {
-                op = (is_unsigned ? RXY_CLG : RXY_CG);
-                tcg_out_insn_RXY(s, op, r1, TCG_REG_TB, TCG_REG_NONE, 0);
-                new_pool_label(s, c2, R_390_20, s->code_ptr - 2,
-                               tcg_tbrel_diff(s, NULL));
-            }
-            goto exit;
         } else {
             if (type == TCG_TYPE_I32) {
                 op = (is_unsigned ? RIL_CLRL : RIL_CRL);
@@ -2101,43 +1997,22 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_goto_tb:
         a0 = args[0];
-        if (s->tb_jmp_insn_offset) {
-            /*
-             * branch displacement must be aligned for atomic patching;
-             * see if we need to add extra nop before branch
-             */
-            if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
-                tcg_out16(s, NOP);
-            }
-            tcg_debug_assert(!USE_REG_TB);
-            tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-            s->code_ptr += 2;
-        } else {
-            /* load address stored at s->tb_jmp_target_addr + a0 */
-            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
-                           tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0));
-            /* and go there */
-            tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
+        tcg_debug_assert(s->tb_jmp_insn_offset);
+        /*
+         * branch displacement must be aligned for atomic patching;
+         * see if we need to add extra nop before branch
+         */
+        if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
+            tcg_out16(s, NOP);
         }
+        tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
+        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        tcg_out32(s, 0);
         set_jmp_reset_offset(s, a0);
-
-        /* For the unlinked path of goto_tb, we need to reset
-           TCG_REG_TB to the beginning of this TB.  */
-        if (USE_REG_TB) {
-            int ofs = -tcg_current_code_size(s);
-            /* All TB are restricted to 64KiB by unwind info. */
-            tcg_debug_assert(ofs == sextract64(ofs, 0, 20));
-            tcg_out_insn(s, RXY, LAY, TCG_REG_TB,
-                         TCG_REG_TB, TCG_REG_NONE, ofs);
-        }
         break;
 
     case INDEX_op_goto_ptr:
         a0 = args[0];
-        if (USE_REG_TB) {
-            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
-        }
         tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, a0);
         break;
 
@@ -3405,9 +3280,6 @@ static void tcg_target_init(TCGContext *s)
     /* XXX many insns can't be used with R0, so we better avoid it for now */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R0);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
-    if (USE_REG_TB) {
-        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB);
-    }
 }
 
 #define FRAME_SIZE  ((int)(TCG_TARGET_CALL_STACK_OFFSET          \
@@ -3428,16 +3300,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base >= 0x80000) {
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
 
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
-    if (USE_REG_TB) {
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB,
-                    tcg_target_call_iarg_regs[1]);
-    }
 
     /* br %r3 (go to TB) */
     tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, tcg_target_call_iarg_regs[1]);
-- 
2.34.1


