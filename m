Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE6631298E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:52:59 +0100 (CET)
Received: from localhost ([::1]:43552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xbe-0008Jt-K5
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZQ-0003vK-Ro
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:36 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZO-00006I-In
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:36 -0500
Received: by mail-pf1-x431.google.com with SMTP id q131so8749690pfq.10
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W75wfXsr5vHgZ/Xw8pIcOkmJZCyvCV19MqhyS7btZ5M=;
 b=NQ5Kb0iBQ45v+G2qvZ/oYd/xPkJvOraM4cZ3QDWQedZcAWzgRfJ7HNiYMIaQjHmM2H
 9vFRhGRVdDxTPCU9bH/C3ixmnuvKY9N5WTtteJqrVjLPMmfqSqrlDsEB6KB0Do8Lbszj
 71yQC5PbuwXgYj7boMXymD/KOzPeOevGZ57KoVSIS7tCAPheo7roxwA3GY4Rb7Bt8ofI
 pBHbyiVIiZHWChH8hbQB9OU81UdRcAC7eZknXbcOhQN0PuExFKiBPL4IZUi6LzW0KyuC
 d6F6QBPQB8Bh8xZ+fr0nKfvrrWRUUxO4CRAeolTtloAF6OZTLrr6jNti02/RGmxmNQTH
 xQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W75wfXsr5vHgZ/Xw8pIcOkmJZCyvCV19MqhyS7btZ5M=;
 b=ZHcp4kCeOQxMi+I5Lwe6LQVlB1x/hwPMe+MsQh4iifmZcv3/91Iy/PjzRX6C+ln4ke
 QtwEE++fjnIbtDFWhJkUYatF8vFbyLI7PNAZ9sa4/tmEDMaj5pjvgtGUulFleEKrPc/c
 Sj5Lybwz9aDtC8Cwd289R6MJleWyPclgaD5410fIPPSS0aOv2sRpskP+zxHVKwRXhw/O
 lVJGUFE9SJLf76Oorhra1LYdxuXDXmVLGykg1/c613WqTJMP8aIDQ91Ow0sqjpBNUm0a
 eSl5lEazQ4tNd/6cNWbntvfk+izvZk3uPAnn7VQwBsNL+CMPi4kl7+VTATy2qxLEcItH
 woYw==
X-Gm-Message-State: AOAM532w05MYK3dZfMKvVso2mcevPpcrbO3/b/ms1L/59NwTewWKDZSf
 W0JrPO2beFMLr9kI41z8nu6BDmA8TuMjjg==
X-Google-Smtp-Source: ABdhPJxZpqxfbrclV++3zAmSKL/sCd60wUaWBZmOm6e2jA07jMDM4t9aZQDFpT4ljmrUPLOAYHbbHw==
X-Received: by 2002:a63:c70c:: with SMTP id n12mr15370632pgg.347.1612752393105; 
 Sun, 07 Feb 2021 18:46:33 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] tcg/arm: Implement minimal vector operations
Date: Sun,  7 Feb 2021 18:46:16 -0800
Message-Id: <20210208024625.271018-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Implementing dup2, add, sub, and, or, xor as the minimal set.
This allows us to actually enable neon in the header file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |   3 +
 tcg/arm/tcg-target-con-str.h |   2 +
 tcg/arm/tcg-target.h         |   6 +-
 tcg/arm/tcg-target.c.inc     | 203 +++++++++++++++++++++++++++++++++--
 4 files changed, 206 insertions(+), 8 deletions(-)

diff --git a/tcg/arm/tcg-target-con-set.h b/tcg/arm/tcg-target-con-set.h
index 27aced5391..f30b3900e0 100644
--- a/tcg/arm/tcg-target-con-set.h
+++ b/tcg/arm/tcg-target-con-set.h
@@ -30,6 +30,9 @@ C_O1_I2(r, r, rIN)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, rZ)
 C_O1_I2(w, w, w)
+C_O1_I2(w, w, wO)
+C_O1_I2(w, w, wV)
+C_O1_I2(w, w, wZ)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
 C_O2_I1(r, r, l)
diff --git a/tcg/arm/tcg-target-con-str.h b/tcg/arm/tcg-target-con-str.h
index 255a1ae0e2..8f501149e1 100644
--- a/tcg/arm/tcg-target-con-str.h
+++ b/tcg/arm/tcg-target-con-str.h
@@ -20,4 +20,6 @@ REGS('w', ALL_VECTOR_REGS)
 CONST('I', TCG_CT_CONST_ARM)
 CONST('K', TCG_CT_CONST_INV)
 CONST('N', TCG_CT_CONST_NEG)
+CONST('O', TCG_CT_CONST_ORRI)
+CONST('V', TCG_CT_CONST_ANDI)
 CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index a9dc09bd08..48993636ea 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -107,7 +107,11 @@ typedef enum {
 #else
 extern bool use_idiv_instructions;
 #endif
-#define use_neon_instructions  0
+#ifdef __ARM_NEON__
+#define use_neon_instructions  1
+#else
+extern bool use_neon_instructions;
+#endif
 
 /* used for function call generation */
 #define TCG_TARGET_STACK_ALIGN		8
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 73a4d50a4a..ae91b959f0 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -30,6 +30,9 @@ int arm_arch = __ARM_ARCH;
 #ifndef use_idiv_instructions
 bool use_idiv_instructions;
 #endif
+#ifndef use_neon_instructions
+bool use_neon_instructions;
+#endif
 
 /* ??? Ought to think about changing CONFIG_SOFTMMU to always defined.  */
 #ifdef CONFIG_SOFTMMU
@@ -176,6 +179,28 @@ typedef enum {
     /* Otherwise the assembler uses mov r0,r0 */
     INSN_NOP_v4    = (COND_AL << 28) | ARITH_MOV,
 
+    INSN_VADD      = 0xf2000800,
+    INSN_VAND      = 0xf2000110,
+    INSN_VEOR      = 0xf3000110,
+    INSN_VORR      = 0xf2200110,
+    INSN_VSUB      = 0xf3000800,
+
+    INSN_VMVN      = 0xf3b00580,
+
+    INSN_VCEQ0     = 0xf3b10100,
+    INSN_VCGT0     = 0xf3b10000,
+    INSN_VCGE0     = 0xf3b10080,
+    INSN_VCLE0     = 0xf3b10180,
+    INSN_VCLT0     = 0xf3b10200,
+
+    INSN_VCEQ      = 0xf3000810,
+    INSN_VCGE      = 0xf2000310,
+    INSN_VCGT      = 0xf2000300,
+    INSN_VCGE_U    = 0xf3000310,
+    INSN_VCGT_U    = 0xf3000300,
+
+    INSN_VTST      = 0xf2000810,
+
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
     INSN_VDUP_S    = 0xf3b00c00,  /* VDUP (scalar) */
     INSN_VLDR_D    = 0xed100b00,  /* VLDR.64 */
@@ -295,6 +320,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_INV  0x200
 #define TCG_CT_CONST_NEG  0x400
 #define TCG_CT_CONST_ZERO 0x800
+#define TCG_CT_CONST_ORRI 0x1000
+#define TCG_CT_CONST_ANDI 0x2000
 
 #define ALL_GENERAL_REGS  0xffffu
 #define ALL_VECTOR_REGS   0xffff0000u
@@ -426,6 +453,16 @@ static int is_shimm32_pair(uint32_t v32, int *cmode, int *imm8)
     return i;
 }
 
+/* Return true if V is a valid 16-bit or 32-bit shifted immediate.  */
+static bool is_shimm1632(uint32_t v32, int *cmode, int *imm8)
+{
+    if (v32 == deposit32(v32, 16, 16, v32)) {
+        return is_shimm16(v32, cmode, imm8);
+    } else {
+        return is_shimm32(v32, cmode, imm8);
+    }
+}
+
 /* Test if a constant matches the constraint.
  * TODO: define constraints for:
  *
@@ -446,9 +483,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
         return 1;
     } else if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
         return 1;
-    } else {
-        return 0;
     }
+
+    switch (ct & (TCG_CT_CONST_ORRI | TCG_CT_CONST_ANDI)) {
+    case 0:
+        break;
+    case TCG_CT_CONST_ANDI:
+        val = ~val;
+        /* fallthru */
+    case TCG_CT_CONST_ORRI:
+        if (val == deposit64(val, 32, 32, val)) {
+            int cmode, imm8;
+            return is_shimm1632(val, &cmode, &imm8);
+        }
+        break;
+    default:
+        /* Both bits should not be set for the same insn.  */
+        g_assert_not_reached();
+    }
+
+    return 0;
 }
 
 static inline void tcg_out_b(TCGContext *s, int cond, int32_t offset)
@@ -1244,6 +1298,13 @@ static uint32_t encode_vm(TCGReg rm)
     return (extract32(rm, 3, 1) << 5) | (extract32(rm, 0, 3) << 1);
 }
 
+static void tcg_out_vreg2(TCGContext *s, ARMInsn insn, int q, int vece,
+                          TCGReg d, TCGReg m)
+{
+    tcg_out32(s, insn | (vece << 18) | (q << 6) |
+              encode_vd(d) | encode_vm(m));
+}
+
 static void tcg_out_vreg3(TCGContext *s, ARMInsn insn, int q, int vece,
                           TCGReg d, TCGReg n, TCGReg m)
 {
@@ -2316,10 +2377,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
-    case INDEX_op_or_vec:
-    case INDEX_op_and_vec:
-    case INDEX_op_cmp_vec:
         return C_O1_I2(w, w, w);
+    case INDEX_op_or_vec:
+        return C_O1_I2(w, w, wO);
+    case INDEX_op_and_vec:
+        return C_O1_I2(w, w, wV);
+    case INDEX_op_cmp_vec:
+        return C_O1_I2(w, w, wZ);
 
     default:
         g_assert_not_reached();
@@ -2619,16 +2683,141 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
     }
 }
 
+static const ARMInsn vec_cmp_insn[16] = {
+    [TCG_COND_EQ] = INSN_VCEQ,
+    [TCG_COND_GT] = INSN_VCGT,
+    [TCG_COND_GE] = INSN_VCGE,
+    [TCG_COND_GTU] = INSN_VCGT_U,
+    [TCG_COND_GEU] = INSN_VCGE_U,
+};
+
+static const ARMInsn vec_cmp0_insn[16] = {
+    [TCG_COND_EQ] = INSN_VCEQ0,
+    [TCG_COND_GT] = INSN_VCGT0,
+    [TCG_COND_GE] = INSN_VCGE0,
+    [TCG_COND_LT] = INSN_VCLT0,
+    [TCG_COND_LE] = INSN_VCLE0,
+};
+
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
                            const TCGArg *args, const int *const_args)
 {
-    g_assert_not_reached();
+    TCGType type = vecl + TCG_TYPE_V64;
+    unsigned q = vecl;
+    TCGArg a0, a1, a2;
+    int cmode, imm8;
+
+    a0 = args[0];
+    a1 = args[1];
+    a2 = args[2];
+
+    switch (opc) {
+    case INDEX_op_ld_vec:
+        tcg_out_ld(s, type, a0, a1, a2);
+        return;
+    case INDEX_op_st_vec:
+        tcg_out_st(s, type, a0, a1, a2);
+        return;
+    case INDEX_op_dupm_vec:
+        tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
+        return;
+    case INDEX_op_dup2_vec:
+        tcg_out_dup2_vec(s, a0, a1, a2);
+        return;
+    case INDEX_op_add_vec:
+        tcg_out_vreg3(s, INSN_VADD, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_sub_vec:
+        tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
+        return;
+    case INDEX_op_xor_vec:
+        tcg_out_vreg3(s, INSN_VEOR, q, 0, a0, a1, a2);
+        return;
+
+    case INDEX_op_and_vec:
+        if (const_args[2]) {
+            is_shimm1632(~a2, &cmode, &imm8);
+            if (a0 == a1) {
+                tcg_out_vmovi(s, a0, q, 1, cmode | 1, imm8); /* VBICI */
+                return;
+            }
+            tcg_out_vmovi(s, a0, q, 1, cmode, imm8); /* VMVNI */
+            a2 = a0;
+        }
+        tcg_out_vreg3(s, INSN_VAND, q, 0, a0, a1, a2);
+        return;
+
+    case INDEX_op_or_vec:
+        if (const_args[2]) {
+            is_shimm1632(a2, &cmode, &imm8);
+            if (a0 == a1) {
+                tcg_out_vmovi(s, a0, q, 0, cmode | 1, imm8); /* VORI */
+                return;
+            }
+            tcg_out_vmovi(s, a0, q, 0, cmode, imm8); /* VMOVI */
+            a2 = a0;
+        }
+        tcg_out_vreg3(s, INSN_VORR, q, 0, a0, a1, a2);
+        return;
+
+    case INDEX_op_cmp_vec:
+        {
+            TCGCond cond = args[3];
+
+            if (cond == TCG_COND_NE) {
+                if (const_args[2]) {
+                    tcg_out_vreg3(s, INSN_VTST, q, vece, a0, a1, a1);
+                } else {
+                    tcg_out_vreg3(s, INSN_VCEQ, q, vece, a0, a1, a2);
+                    tcg_out_vreg2(s, INSN_VMVN, q, 0, a0, a0);
+                }
+            } else {
+                ARMInsn insn;
+
+                if (const_args[2]) {
+                    insn = vec_cmp0_insn[cond];
+                    if (insn) {
+                        tcg_out_vreg2(s, insn, q, vece, a0, a1);
+                        return;
+                    }
+                    tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
+                    a2 = TCG_VEC_TMP;
+                }
+                insn = vec_cmp_insn[cond];
+                if (insn == 0) {
+                    TCGArg t;
+                    t = a1, a1 = a2, a2 = t;
+                    cond = tcg_swap_cond(cond);
+                    insn = vec_cmp_insn[cond];
+                    tcg_debug_assert(insn != 0);
+                }
+                tcg_out_vreg3(s, insn, q, vece, a0, a1, a2);
+            }
+        }
+        return;
+
+    case INDEX_op_mov_vec:  /* Always emitted via tcg_out_mov.  */
+    case INDEX_op_dup_vec:  /* Always emitted via tcg_out_dup_vec.  */
+    default:
+        g_assert_not_reached();
+    }
 }
 
 int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
 {
-    return 0;
+    switch (opc) {
+    case INDEX_op_add_vec:
+    case INDEX_op_sub_vec:
+    case INDEX_op_and_vec:
+    case INDEX_op_or_vec:
+    case INDEX_op_xor_vec:
+        return 1;
+    case INDEX_op_cmp_vec:
+        return vece < MO_64;
+    default:
+        return 0;
+    }
 }
 
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
-- 
2.25.1


