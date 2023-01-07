Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1FF660CE5
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:03:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zO-0003gd-In; Sat, 07 Jan 2023 02:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zF-0003dD-Av
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zD-0004AT-03
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:28 -0500
Received: by mail-pl1-x635.google.com with SMTP id n4so4094633plp.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ozj5wc7NFmB3O/MgzepcpO4OOcL4F6DQsmKEPOxkO0Q=;
 b=UlAtPaJJwJKOAxWGhUIuWFUEOzFpDvvlHYy3W83s3vd1R/O9zWBIuw4PDK52j3CPjV
 +s/rhsYE9ESd4UtbDerPRHdsPJg1xTjCkLYz/Yh8tlW4wT2tKHwrLDnu8qQvFcwNX6WI
 uBZ+DBOKKvh86YM+MB9e/JTpfZFFz5EL4ibK/nYAADAy048vBD8pR7T3dSCPEdjU/xOr
 0kl0I9Ti3XrwlLDPramdI0fwpc3+f302rawuKIHEVTpxQyyjFcvajgiBUUrJSbiI8daG
 9PzsAsc9/+sDrn+2+wv5E8kLCHhk5M16F+mk12m7ibxlIgp/sgRwWXro23SXD0P7qYA7
 SxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ozj5wc7NFmB3O/MgzepcpO4OOcL4F6DQsmKEPOxkO0Q=;
 b=Aau43dzfKprWQUlshLN6duDs0Zmt3lBVBG3dv4wKRa/J3h+1EDbiHMCKOZDV8OcIEu
 Znd4cvPWS97kZgUAaljpww4aDABVMNWSKkhzlakGTbZrYYHkIJxPNwX10OZUoxuOcWUQ
 ghDB1dyJPdn7uL3TcZ+2o13olP5RuxUYUhHBwX9PIQDIBN9CcNVoVGCUbZ3vARuGGCFr
 w9r9hrfjdMYe8J0L/85nwXCVIEZkiN7n6WidGL4SHI0EmjoH+2TfHkg767/JI4NmO971
 SLQPjc+UBYpgJJwJWi49wuVJnwujC/OjaAP3ShmMvdiJfbV+6fUEC+Oejmz/UdIjoOcB
 qsJA==
X-Gm-Message-State: AFqh2krf2DbNNpiYshskn4+ur7LFQLYjrN9zbuWKeukWiKTVUiLzO08g
 i4Cz3UDjDxXh4RrOqQmwNWVuDCdCoPFhn6nX
X-Google-Smtp-Source: AMrXdXuika8hSECH/3JSEcQMSVNoesRjRqSXqFe5CJ4fTaIf978RkmkUHX3BQXN6nn833yPO3zBl/g==
X-Received: by 2002:a05:6a21:1649:b0:ad:d197:59c7 with SMTP id
 no9-20020a056a21164900b000add19759c7mr68732596pzb.46.1673077881525; 
 Fri, 06 Jan 2023 23:51:21 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 02/27] tcg/s390x: Remove TCG_REG_TB
Date: Fri,  6 Jan 2023 23:50:53 -0800
Message-Id: <20230107075118.1814503-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Do not simplify tgen_ori, tgen_xori.
---
 tcg/s390x/tcg-target.c.inc | 97 +++-----------------------------------
 1 file changed, 6 insertions(+), 91 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index cb00bb6999..ba4bb6a629 100644
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
@@ -1037,13 +1013,6 @@ static void tcg_out_ld_abs(TCGContext *s, TCGType type,
             return;
         }
     }
-    if (USE_REG_TB) {
-        ptrdiff_t disp = tcg_tbrel_diff(s, abs);
-        if (disp == sextract64(disp, 0, 20)) {
-            tcg_out_ld(s, type, dest, TCG_REG_TB, disp);
-            return;
-        }
-    }
 
     tcg_out_movi(s, TCG_TYPE_PTR, dest, addr & ~0xffff);
     tcg_out_ld(s, type, dest, dest, addr & 0xffff);
@@ -1243,17 +1212,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
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
@@ -1297,17 +1256,12 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         }
     }
 
-    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
     if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
         if (type == TCG_TYPE_I32) {
             tcg_out_insn(s, RR, OR, dest, TCG_TMP0);
         } else {
             tcg_out_insn(s, RRE, OGR, dest, TCG_TMP0);
         }
-    } else if (USE_REG_TB) {
-        tcg_out_insn(s, RXY, OG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
-        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
-                       tcg_tbrel_diff(s, NULL));
     } else {
         /* Perform the OR via sequential modifications to the high and
            low parts.  Do this via recursion to handle 16-bit vs 32-bit
@@ -1332,17 +1286,12 @@ static void tgen_xori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         }
     }
 
-    /* Use the constant pool if USE_REG_TB, but not for small constants.  */
     if (maybe_out_small_movi(s, type, TCG_TMP0, val)) {
         if (type == TCG_TYPE_I32) {
             tcg_out_insn(s, RR, XR, dest, TCG_TMP0);
         } else {
             tcg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
         }
-    } else if (USE_REG_TB) {
-        tcg_out_insn(s, RXY, XG, dest, TCG_REG_TB, TCG_REG_NONE, 0);
-        new_pool_label(s, val, R_390_20, s->code_ptr - 2,
-                       tcg_tbrel_diff(s, NULL));
     } else {
         /* Perform the xor by parts.  */
         tcg_debug_assert(HAVE_FACILITY(EXT_IMM));
@@ -1395,19 +1344,6 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
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
@@ -2109,35 +2045,21 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
                 tcg_out16(s, NOP);
             }
-            tcg_debug_assert(!USE_REG_TB);
             tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
             s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
             s->code_ptr += 2;
         } else {
             /* load address stored at s->tb_jmp_target_addr + a0 */
-            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_REG_TB,
+            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_TMP0,
                            tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0));
             /* and go there */
-            tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_REG_TB);
+            tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_TMP0);
         }
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
 
@@ -3405,9 +3327,6 @@ static void tcg_target_init(TCGContext *s)
     /* XXX many insns can't be used with R0, so we better avoid it for now */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_R0);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
-    if (USE_REG_TB) {
-        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB);
-    }
 }
 
 #define FRAME_SIZE  ((int)(TCG_TARGET_CALL_STACK_OFFSET          \
@@ -3428,16 +3347,12 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
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


