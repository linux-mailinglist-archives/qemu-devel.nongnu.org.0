Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FD2E2916
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:50:20 +0100 (CET)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZR5-00077J-95
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMM-0001si-Pm
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:26 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMK-0008J0-JO
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:26 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v1so1692243pjr.2
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Uiox93NiZ3CFL/uyXB2GLaumTiAy80yWrJayXZWb7MQ=;
 b=mDQQGVo5XBTjWvv1KUer9yEUtfwF5WG7efQZ5Wb2Mgrm4XVsR0hmERQnZcjDWizBn2
 maynlsxl3IT1SlLBjFLvZJug3O/OniJvr36M3o8AVfFlZbUJfyoNcLNPGEBLcv3LkyyD
 nHBMk4EEjVqwhjhXIxpyiOBLsbhoxwQfGV8jg5h/3mK+M0/SEVMfKNUGwQk3+NIg9GXd
 PrVayafFkqkxoPHD0X6qE+ti/cTC84Yrnr7yrZZY4+syqnvzPG2sWMhdCeMF9+Af6yo9
 y3actm56Q5acSmM9okAYnw3HKWF7rRrjLRj2wj0k3tNCJ6KX1OnOceAeA9bsOOxD81nw
 dq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uiox93NiZ3CFL/uyXB2GLaumTiAy80yWrJayXZWb7MQ=;
 b=TpEjSzISWazvf1jQ9ZRunLat47WPzDNEx32kN9poFHRUDfeoW6cuRE8DLlW5VDjAJj
 ek1BV9w9DAV3IwnbGS0Mcs4TQTR553ygAuYMF/QFk4CZffRXLDyBX+Oz3xVYaKSOzrr0
 WJp92OKACJGzdLw47lo0gIxsckWS4EZ+05jPE8AYEj1qQKjc3J2xN6QYsnWrVIsgkLKZ
 Ko44xuU/u1KQ+M00AMdph6l+VjYOHuAnl0lrwEJa/tcEmj8gOsZi+gioqh0+BGCqeUBH
 4kBdOLV2o9hhVL2wFirkKsRyq+KX5cerqQXgw3r2/DBdovQCCtfA1Dg4O1+RxUotjTR5
 SASQ==
X-Gm-Message-State: AOAM533ns0uLFSMIR7tIWpuDyg78c0DYQcBtOAKYb47Af4BSB5M3B7pY
 Oxa8/g9lgb6Oxijvh8qmKcQm0y5p35YDIA==
X-Google-Smtp-Source: ABdhPJzmdVutbR0bkM6uqSewIZcyX2H+XI8nOFWbHb7LsVbxd3NTQuYx8dqfz1gf+jwk5fBXOFIoWQ==
X-Received: by 2002:a17:902:d34a:b029:da:861e:ecd8 with SMTP id
 l10-20020a170902d34ab02900da861eecd8mr24770946plk.45.1608849922613; 
 Thu, 24 Dec 2020 14:45:22 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/15] tcg/arm: Implement minimal vector operations
Date: Thu, 24 Dec 2020 14:45:05 -0800
Message-Id: <20201224224514.626561-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 tcg/arm/tcg-target-conset.h |   3 +
 tcg/arm/tcg-target-constr.h |   2 +
 tcg/arm/tcg-target.h        |   6 +-
 tcg/arm/tcg-target.c.inc    | 203 ++++++++++++++++++++++++++++++++++--
 4 files changed, 206 insertions(+), 8 deletions(-)

diff --git a/tcg/arm/tcg-target-conset.h b/tcg/arm/tcg-target-conset.h
index dbcae51c4b..ffcac7c6aa 100644
--- a/tcg/arm/tcg-target-conset.h
+++ b/tcg/arm/tcg-target-conset.h
@@ -25,6 +25,9 @@ C_O1_I2(r, r, rIN)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, rZ, rZ)
 C_O1_I2(w, w, w)
+C_O1_I2(w, w, wO)
+C_O1_I2(w, w, wV)
+C_O1_I2(w, w, wZ)
 C_O1_I4(r, r, r, rI, rI)
 C_O1_I4(r, r, rIN, rIK, 0)
 C_O2_I1(r, r, l)
diff --git a/tcg/arm/tcg-target-constr.h b/tcg/arm/tcg-target-constr.h
index 5f2780decd..f2c8f3dfce 100644
--- a/tcg/arm/tcg-target-constr.h
+++ b/tcg/arm/tcg-target-constr.h
@@ -29,4 +29,6 @@ REGS('w', 0xffff0000u)
 CONST('I', TCG_CT_CONST_ARM)
 CONST('K', TCG_CT_CONST_INV)
 CONST('N', TCG_CT_CONST_NEG)
+CONST('O', TCG_CT_CONST_ORRI)
+CONST('V', TCG_CT_CONST_ANDI)
 CONST('Z', TCG_CT_CONST_ZERO)
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index b40419971e..d87493364f 100644
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
index 3eb4456dce..91243b641c 100644
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
@@ -291,6 +316,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_INV  0x200
 #define TCG_CT_CONST_NEG  0x400
 #define TCG_CT_CONST_ZERO 0x800
+#define TCG_CT_CONST_ORRI 0x1000
+#define TCG_CT_CONST_ANDI 0x2000
 
 static inline uint32_t rotl(uint32_t val, int n)
 {
@@ -399,6 +426,16 @@ static int is_shimm32_pair(uint32_t v32, int *cmode, int *imm8)
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
@@ -419,9 +456,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
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
@@ -1217,6 +1271,13 @@ static uint32_t encode_vm(TCGReg rm)
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
@@ -2289,10 +2350,13 @@ static int tcg_target_op_def(TCGOpcode op)
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
@@ -2592,16 +2656,141 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
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


