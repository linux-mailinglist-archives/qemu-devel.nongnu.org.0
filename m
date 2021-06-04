Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8339C11C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:16:41 +0200 (CEST)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGFE-0006vv-A3
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB0-0005hI-GB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAx-0005JT-Ra
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so8072098pjz.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDlM422z5SO6k8OWgD29hM0sU+EvDSOzJI7eetHAmZg=;
 b=fVC738h3yskgRU02lvgZDySjiXucN9zVl23NJhdg3TpCi84oCFfKbtLKtXq4k7E3sT
 lCRH9vjwhqE/61FgSJhv0gy/XEWAA0xIwRoDPiUpBSSKikoqDBciq4oSbK4cnofH/8xp
 pMZa6Y0SxNCrjs/hfzLZotRSsQDoOOmm1KgwYbttwwfyd+avoUxbOEdKRAvoFI3P1jsI
 xPuy9DW0awqk6F0dibl1u5gkpnT41JnayaJy50IssiotXeGa7VXu05BaNrytgup40uQB
 IGoXAQkEF7D/ux/8aZl3x6bbwhyyKLuzIQFIBFvhvPC6ZQdCpycOCkgTXnUdqKfvAKK6
 BBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LDlM422z5SO6k8OWgD29hM0sU+EvDSOzJI7eetHAmZg=;
 b=Q/i5vetJMkuH3G/3c8Tk2Qffhy2TEzz7M2RNQOgk2yTpb6jdxM0vJTSmL7IUSmfwrN
 AiGnxR4QtOoOjNZOLj0TmvqOIv39d+jCnPHHlA0o53cGFrVt8qazRzQlfgjD1jnIzOo7
 gBSKz6yfejfHqsC4Z9nNAyWqTDo07qKsgfyv20wycUcNIFeUEGN1LvhKPXjhQezchdDi
 tVm3JcfIsMQ8YVHhRY+IHpoYfB13Mat2g88xjw43UFaKlbofdxPfuyhf/zDigOKCOQUa
 9EAoLedS8iz3qB+MD+VDWX1EX6dSasUmSCSTtzU96UNEuDHvoASJRKzwnOpcSHOpx10X
 ei0A==
X-Gm-Message-State: AOAM5305LPk5OfBXT8zZA8xtmUh2WG8ad5rrcVH5TJiCyu/5+dyBOJME
 4Cf9CPdzhl/BikMT2QiLeMwxuZBFVz91rg==
X-Google-Smtp-Source: ABdhPJxEnXbVMpLx0/ngkKulOI3XbzGZZCSAP999vlVNNJV9CWqZ+sZBRB/0yom6DH0kZxA/vOALiw==
X-Received: by 2002:a17:90a:4dc1:: with SMTP id
 r1mr6677590pjl.192.1622837534564; 
 Fri, 04 Jun 2021 13:12:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] tcg/arm: Implement minimal vector operations
Date: Fri,  4 Jun 2021 13:12:01 -0700
Message-Id: <20210604201210.920136-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementing dup2, add, sub, and, or, xor as the minimal set.
This allows us to actually enable neon in the header file.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target-con-set.h |   3 +
 tcg/arm/tcg-target-con-str.h |   2 +
 tcg/arm/tcg-target.h         |   6 +-
 tcg/arm/tcg-target.c.inc     | 201 +++++++++++++++++++++++++++++++++--
 4 files changed, 204 insertions(+), 8 deletions(-)

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
index 1707214b46..ab98fa1381 100644
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
@@ -173,7 +176,27 @@ typedef enum {
     /* Otherwise the assembler uses mov r0,r0 */
     INSN_NOP_v4    = (COND_AL << 28) | ARITH_MOV,
 
+    INSN_VADD      = 0xf2000800,
+    INSN_VAND      = 0xf2000110,
+    INSN_VEOR      = 0xf3000110,
     INSN_VORR      = 0xf2200110,
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
 
     INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
     INSN_VDUP_S    = 0xf3b00c00,  /* VDUP (scalar) */
@@ -293,6 +316,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_INV  0x200
 #define TCG_CT_CONST_NEG  0x400
 #define TCG_CT_CONST_ZERO 0x800
+#define TCG_CT_CONST_ORRI 0x1000
+#define TCG_CT_CONST_ANDI 0x2000
 
 #define ALL_GENERAL_REGS  0xffffu
 #define ALL_VECTOR_REGS   0xffff0000u
@@ -424,6 +449,16 @@ static int is_shimm32_pair(uint32_t v32, int *cmode, int *imm8)
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
@@ -444,9 +479,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
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
@@ -1242,6 +1294,13 @@ static uint32_t encode_vm(TCGReg rm)
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
@@ -2314,10 +2373,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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
@@ -2614,16 +2676,141 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
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
+                tcg_out_vmovi(s, a0, q, 0, cmode | 1, imm8); /* VORRI */
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


