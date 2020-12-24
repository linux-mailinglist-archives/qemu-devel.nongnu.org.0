Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD52E2918
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:50:37 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZRL-0007cD-Uq
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMM-0001rU-DV
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:26 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMH-0008Id-Pz
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b5so1806685pjl.0
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BO+FUmiWyN1+skP31sLxPh/eRwDAKGK3UywCSOeoCBw=;
 b=FOIPvTJKIIiQ0mTLzcUnzFWCmbEgErSe5NUJ3Wx/yh1ikIFGKicBG4CPcCH5dZY2fA
 0eFe2noZrD+DvVuiZUzGzwmYkZGcUwMWRj8K1DCFqDe1mNqD9wjy3j3vDdJMB1mMYY14
 z+rQz6bQl7w/9HYLziryfCT5j+HviFiLDNAIrIoxiA6Tg/PbIVKOGEMUNWDjsYNpYJgC
 o94jB+rxUdb7B54yop/ZB253cffLxRt/zLE2eEMiKScpljKTVR3Y4COMpKUt+ZyDTn0K
 349V6GmlV64EkvKjs8A4h41T0MQl9V6NxsdkTHb6DsFBZ23qaETSPDKQeWu6qPg4YHq3
 Ggfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BO+FUmiWyN1+skP31sLxPh/eRwDAKGK3UywCSOeoCBw=;
 b=hFbKDFPraLDFM5tzW7QIoWFrkKE9PmvniCGdwNSzKtEPsSoSpwazHt5G3tUG/8qaN3
 4lhspT895gymtmwNUSUKQlYkhYmriW8gj5W1a4d9Y0lhA0+TxfxGDhLjW+VVzlOnz1nD
 +EC79YEtmZNpsgsVDAmb+M2REC82KwvMhVIFBYZA0pjuVTyytbp5MoCeDrCFT8NrcRzs
 vKPVeBbyaZpZ99J7R7cbZwLSmq8Pw14dJAuxmXpQ4zrKMjlKgWOZgL3vyYz56tC3F4fz
 iJLWl55wWvvPKZmfSQraEVpNmHefRp20xXf/+1HlYQAZGS7Has6pNb/ncljeF0e4102I
 wtrw==
X-Gm-Message-State: AOAM531f76koJ5uhPwXuxpYrcc0jn1ufPmWq8I+dk+MVcknTOEFifs0/
 1hkbXe4Z8VHn6ymwkJ4ETorYNL8qSej4MQ==
X-Google-Smtp-Source: ABdhPJzjeWFK35n7KKIVy4iSMfI9XokHXqYi5/v3DmYeG+Br/tl8LrQQBm30/vIFO+vQ/kGwIc663A==
X-Received: by 2002:a17:902:d716:b029:dc:24a1:77a2 with SMTP id
 w22-20020a170902d716b02900dc24a177a2mr4558274ply.64.1608849919971; 
 Thu, 24 Dec 2020 14:45:19 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] tcg/arm: Implement tcg_out_dup*_vec
Date: Thu, 24 Dec 2020 14:45:03 -0800
Message-Id: <20201224224514.626561-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Most of dupi is copied from tcg/aarch64, which has the same
encoding for AdvSimdExpandImm.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 282 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 274 insertions(+), 8 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index acc8f2c44a..6e9d72289a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -176,9 +176,14 @@ typedef enum {
     /* Otherwise the assembler uses mov r0,r0 */
     INSN_NOP_v4    = (COND_AL << 28) | ARITH_MOV,
 
+    INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
+    INSN_VDUP_S    = 0xf3b00c00,  /* VDUP (scalar) */
+    INSN_VLDR_D    = 0xed100b00,  /* VLDR.64 */
     INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
+    INSN_VLD1R     = 0xf4a00c00,  /* VLD1 (single element to all lanes) */
     INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
     INSN_VMOV      = 0xf2200110,  /* VMOV (register) */
+    INSN_VMOVI     = 0xf2800010,  /* VMOV (immediate) */
 } ARMInsn;
 
 #define INSN_NOP   (use_armv7_instructions ? INSN_NOP_v6k : INSN_NOP_v4)
@@ -197,6 +202,14 @@ static const uint8_t tcg_cond_to_arm_cond[] = {
     [TCG_COND_GTU] = COND_HI,
 };
 
+static int encode_imm(uint32_t imm);
+
+/* TCG private relocation type: add with pc+imm8 */
+#define R_ARM_PC8  11
+
+/* TCG private relocation type: vldr with imm8 << 2 */
+#define R_ARM_PC11 12
+
 static inline bool reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
 {
     ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >> 2;
@@ -225,16 +238,51 @@ static inline bool reloc_pc13(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
     return false;
 }
 
+static bool reloc_pc11(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) / 4;
+
+    if (offset >= -0xff && offset <= 0xff) {
+        tcg_insn_unit insn = *code_ptr;
+        bool u = (offset >= 0);
+        if (!u) {
+            offset = -offset;
+        }
+        insn = deposit32(insn, 23, 1, u);
+        insn = deposit32(insn, 0, 8, offset);
+        *code_ptr = insn;
+        return true;
+    }
+    return false;
+}
+
+static bool reloc_pc8(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    ptrdiff_t offset = tcg_ptr_byte_diff(target, code_ptr) - 8;
+    int rot = encode_imm(offset);
+
+    if (rot >= 0) {
+        *code_ptr = deposit32(*code_ptr, 0, 12,
+                              rol32(offset, rot) | (rot << 7));
+        return true;
+    }
+    return false;
+}
+
 static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
     tcg_debug_assert(addend == 0);
-
-    if (type == R_ARM_PC24) {
+    switch (type) {
+    case R_ARM_PC24:
         return reloc_pc24(code_ptr, (tcg_insn_unit *)value);
-    } else if (type == R_ARM_PC13) {
+    case R_ARM_PC13:
         return reloc_pc13(code_ptr, (tcg_insn_unit *)value);
-    } else {
+    case R_ARM_PC11:
+        return reloc_pc11(code_ptr, (tcg_insn_unit *)value);
+    case R_ARM_PC8:
+        return reloc_pc8(code_ptr, (tcg_insn_unit *)value);
+    default:
         g_assert_not_reached();
     }
 }
@@ -251,7 +299,7 @@ static inline uint32_t rotl(uint32_t val, int n)
 
 /* ARM immediates for ALU instructions are made of an unsigned 8-bit
    right-rotated by an even amount between 0 and 30. */
-static inline int encode_imm(uint32_t imm)
+static int encode_imm(uint32_t imm)
 {
     int shift;
 
@@ -278,6 +326,79 @@ static inline int check_fit_imm(uint32_t imm)
     return encode_imm(imm) >= 0;
 }
 
+/* Return true if v16 is a valid 16-bit shifted immediate.  */
+static bool is_shimm16(uint16_t v16, int *cmode, int *imm8)
+{
+    if (v16 == (v16 & 0xff)) {
+        *cmode = 0x8;
+        *imm8 = v16 & 0xff;
+        return true;
+    } else if (v16 == (v16 & 0xff00)) {
+        *cmode = 0xa;
+        *imm8 = v16 >> 8;
+        return true;
+    }
+    return false;
+}
+
+/* Return true if v32 is a valid 32-bit shifted immediate.  */
+static bool is_shimm32(uint32_t v32, int *cmode, int *imm8)
+{
+    if (v32 == (v32 & 0xff)) {
+        *cmode = 0x0;
+        *imm8 = v32 & 0xff;
+        return true;
+    } else if (v32 == (v32 & 0xff00)) {
+        *cmode = 0x2;
+        *imm8 = (v32 >> 8) & 0xff;
+        return true;
+    } else if (v32 == (v32 & 0xff0000)) {
+        *cmode = 0x4;
+        *imm8 = (v32 >> 16) & 0xff;
+        return true;
+    } else if (v32 == (v32 & 0xff000000)) {
+        *cmode = 0x6;
+        *imm8 = v32 >> 24;
+        return true;
+    }
+    return false;
+}
+
+/* Return true if v32 is a valid 32-bit shifting ones immediate.  */
+static bool is_soimm32(uint32_t v32, int *cmode, int *imm8)
+{
+    if ((v32 & 0xffff00ff) == 0xff) {
+        *cmode = 0xc;
+        *imm8 = (v32 >> 8) & 0xff;
+        return true;
+    } else if ((v32 & 0xff00ffff) == 0xffff) {
+        *cmode = 0xd;
+        *imm8 = (v32 >> 16) & 0xff;
+        return true;
+    }
+    return false;
+}
+
+/*
+ * Return non-zero if v32 can be formed by MOVI+ORR.
+ * Place the parameters for MOVI in (cmode, imm8).
+ * Return the cmode for ORR; the imm8 can be had via extraction from v32.
+ */
+static int is_shimm32_pair(uint32_t v32, int *cmode, int *imm8)
+{
+    int i;
+
+    for (i = 6; i > 0; i -= 2) {
+        /* Mask out one byte we can add with ORR.  */
+        uint32_t tmp = v32 & ~(0xffu << (i * 4));
+        if (is_shimm32(tmp, cmode, imm8) ||
+            is_soimm32(tmp, cmode, imm8)) {
+            break;
+        }
+    }
+    return i;
+}
+
 /* Test if a constant matches the constraint.
  * TODO: define constraints for:
  *
@@ -1106,6 +1227,15 @@ static void tcg_out_vreg3(TCGContext *s, ARMInsn insn, int q, int vece,
               encode_vd(d) | encode_vn(n) | encode_vm(m));
 }
 
+static void tcg_out_vmovi(TCGContext *s, TCGReg rd,
+                          int q, int op, int cmode, uint8_t imm8)
+{
+    tcg_out32(s, INSN_VMOVI | encode_vd(rd) | (q << 6) | (op << 5)
+              | (cmode << 8) | extract32(imm8, 0, 4)
+              | (extract32(imm8, 4, 3) << 16)
+              | (extract32(imm8, 7, 1) << 24));
+}
+
 static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
                           TCGReg rd, TCGReg rn, int offset)
 {
@@ -2311,22 +2441,158 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+/* Type is always V128, with I64 elements.  */
+static void tcg_out_dup2_vec(TCGContext *s, TCGReg rd, TCGReg rl, TCGReg rh)
+{
+    /* Move high element into place first. */
+    /* VMOV Dd+1, Ds */
+    tcg_out_vreg3(s, INSN_VMOV | (1 << 12), 0, 0, rd, rh, rh);
+    /* Move low element into place; tcg_out_mov will check for nop. */
+    tcg_out_mov(s, TCG_TYPE_V64, rd, rl);
+}
+
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg rd, TCGReg rs)
 {
-    g_assert_not_reached();
+    int q = type - TCG_TYPE_V64;
+
+    if (vece == MO_64) {
+        if (type == TCG_TYPE_V128) {
+            tcg_out_dup2_vec(s, rd, rs, rs);
+        } else {
+            tcg_out_mov(s, TCG_TYPE_V64, rd, rs);
+        }
+    } else if (rs < TCG_REG_Q0) {
+        int b = (vece == MO_8);
+        int e = (vece == MO_16);
+        tcg_out32(s, INSN_VDUP_G | (b << 22) | (q << 21) | (e << 5) |
+                  encode_vn(rd) | (rs << 12));
+    } else {
+        int imm4 = 1 << vece;
+        tcg_out32(s, INSN_VDUP_S | (imm4 << 16) | (q << 6) |
+                  encode_vd(rd) | encode_vm(rs));
+    }
+    return true;
 }
 
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg rd, TCGReg base, intptr_t offset)
 {
-    g_assert_not_reached();
+    if (vece == MO_64) {
+        tcg_out_ld(s, TCG_TYPE_V64, rd, base, offset);
+        if (type == TCG_TYPE_V128) {
+            tcg_out_dup2_vec(s, rd, rd, rd);
+        }
+    } else {
+        int q = type - TCG_TYPE_V64;
+        tcg_out_vldst(s, INSN_VLD1R | (vece << 6) | (q << 5),
+                      rd, base, offset);
+    }
+    return true;
 }
 
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg rd, int64_t v64)
 {
-    g_assert_not_reached();
+    int q = type - TCG_TYPE_V64;
+    int cmode, imm8, i;
+
+    /* Test all bytes equal first.  */
+    if (vece == MO_8) {
+        tcg_out_vmovi(s, rd, q, 0, 0xe, v64);
+        return;
+    }
+
+    /*
+     * Test all bytes 0x00 or 0xff second.  This can match cases that
+     * might otherwise take 2 or 3 insns for MO_16 or MO_32 below.
+     */
+    for (i = imm8 = 0; i < 8; i++) {
+        uint8_t byte = v64 >> (i * 8);
+        if (byte == 0xff) {
+            imm8 |= 1 << i;
+        } else if (byte != 0) {
+            goto fail_bytes;
+        }
+    }
+    tcg_out_vmovi(s, rd, q, 1, 0xe, imm8);
+    return;
+ fail_bytes:
+
+    /*
+     * Tests for various replications.  For each element width, if we
+     * cannot find an expansion there's no point checking a larger
+     * width because we already know by replication it cannot match.
+     */
+    if (vece == MO_16) {
+        uint16_t v16 = v64;
+
+        if (is_shimm16(v16, &cmode, &imm8)) {
+            tcg_out_vmovi(s, rd, q, 0, cmode, imm8);
+            return;
+        }
+        if (is_shimm16(~v16, &cmode, &imm8)) {
+            tcg_out_vmovi(s, rd, q, 1, cmode, imm8);
+            return;
+        }
+
+        /*
+         * Otherwise, all remaining constants can be loaded in two insns:
+         * rd = v16 & 0xff, rd |= v16 & 0xff00.
+         */
+        tcg_out_vmovi(s, rd, q, 0, 0x8, v16 & 0xff);
+        tcg_out_vmovi(s, rd, q, 0, 0xb, v16 >> 8);   /* VORR */
+        return;
+    }
+
+    if (vece == MO_32) {
+        uint32_t v32 = v64;
+
+        if (is_shimm32(v32, &cmode, &imm8) ||
+            is_soimm32(v32, &cmode, &imm8)) {
+            tcg_out_vmovi(s, rd, q, 0, cmode, imm8);
+            return;
+        }
+        if (is_shimm32(~v32, &cmode, &imm8) ||
+            is_soimm32(~v32, &cmode, &imm8)) {
+            tcg_out_vmovi(s, rd, q, 1, cmode, imm8);
+            return;
+        }
+
+        /*
+         * Restrict the set of constants to those we can load with
+         * two instructions.  Others we load from the pool.
+         */
+        i = is_shimm32_pair(v32, &cmode, &imm8);
+        if (i) {
+            tcg_out_vmovi(s, rd, q, 0, cmode, imm8);
+            tcg_out_vmovi(s, rd, q, 0, i, extract32(v32, i * 4, 8));
+            return;
+        }
+        i = is_shimm32_pair(~v32, &cmode, &imm8);
+        if (i) {
+            tcg_out_vmovi(s, rd, q, 1, cmode, imm8);
+            tcg_out_vmovi(s, rd, q, 1, i, extract32(~v32, i * 4, 8));
+            return;
+        }
+    }
+
+    /*
+     * As a last resort, load from the constant pool.
+     */
+    if (!q || vece == MO_64) {
+        new_pool_l2(s, R_ARM_PC11, s->code_ptr, 0, v64, v64 >> 32);
+        /* VLDR Dd, [pc + offset] */
+        tcg_out32(s, INSN_VLDR_D | encode_vd(rd) | (0xf << 16));
+        if (q) {
+            tcg_out_dup2_vec(s, rd, rd, rd);
+        }
+    } else {
+        new_pool_label(s, (uint32_t)v64, R_ARM_PC8, s->code_ptr, 0);
+        /* add tmp, pc, offset */
+        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, TCG_REG_TMP, TCG_REG_PC, 0);
+        tcg_out_dupm_vec(s, type, MO_32, rd, TCG_REG_TMP, 0);
+    }
 }
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
-- 
2.25.1


