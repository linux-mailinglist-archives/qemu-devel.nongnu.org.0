Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDE39C11A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:16:34 +0200 (CEST)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGF7-0006Ui-8U
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB2-0005nz-4a
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAx-0005Il-DG
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:19 -0400
Received: by mail-pj1-x1032.google.com with SMTP id g24so6145527pji.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MwMT4g661OuIuWUPCyqmD08NJzkdukWBX0Iri09MsUw=;
 b=WbbC2a/CLWBGu3MptnquopdL+ZUbSgUwAnPZ3a8xkL9poy3Q4OjEiLBTVZ6YL2yOis
 NFL2KeszDytg9e/fvr+lWPVfDCPXfDGaescPLVGcDGV3awXdwEbdbsI2iMVlMvB9yFv8
 oOXwUKinr85bzlu0g4iSPff+tASjgOv3vIa/m6msLuJhJt7lDcR82T5cjFJignjLOqoW
 zN6t0cWwYS9r8WnKxJDS01B7b57m/Kz2YXt3eZbvOxCJlbEWVSis7NzYFeEid4JtuP9X
 8ObvRr8CKF1spH9F4w1nkLUBgH2xPAVBHD1sce2R79MUG6O8Qc2kThblKJUJweh2/Pt5
 XNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MwMT4g661OuIuWUPCyqmD08NJzkdukWBX0Iri09MsUw=;
 b=m2C66MeHpanmkH7xbP/Kr2VUnkx47B9vQSby0+cB2YU6EyqHCcc18QgV+Onta1hoK5
 ocyColz5aqAc8zciuG3YA7dJK0w/z8wAECncW6nN2jrJ3TO9XQ56rbDL9s8zvqilOuHc
 qwCOLu3QPy/TZAaQpv57R11v8+vgz8Li6ARm/iDSmW/SriYyWGYyLbPQpQsgVcu9N6bP
 wxSUstfSs/SUv4j+chFW0R//13jCLPJ5ooIRqi5/H8tgFAfKF20mpJHBN4TPmS5x0IXm
 +2kLSL1pPCpxduJRAYuXwX69aUMXugCdKViD5IrZCRUFByOkei+Ks8YnWmu6yWQ/tphk
 jSHg==
X-Gm-Message-State: AOAM533rNqRuNqwjubiPV9TG4I7m67OAzkuIYG75BoyKMG0pHnk+AUpv
 t5aZo5TTdS1fpq1tiYHa4/pwJ3v7KMYB2A==
X-Google-Smtp-Source: ABdhPJw2/v5xlEgvU0ziQ/uGMiEFl77UtfM9m4VomaJUGjqIAMNHkZ6icVIrYgoyuMZkt/EtkX6eug==
X-Received: by 2002:a17:902:ec8e:b029:105:5ab8:609e with SMTP id
 x14-20020a170902ec8eb02901055ab8609emr6019007plg.55.1622837533947; 
 Fri, 04 Jun 2021 13:12:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] tcg/arm: Implement tcg_out_dup*_vec
Date: Fri,  4 Jun 2021 13:12:00 -0700
Message-Id: <20210604201210.920136-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Most of dupi is copied from tcg/aarch64, which has the same
encoding for AdvSimdExpandImm.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 283 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 275 insertions(+), 8 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a802d4b585..1707214b46 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -175,8 +175,13 @@ typedef enum {
 
     INSN_VORR      = 0xf2200110,
 
+    INSN_VDUP_G    = 0xee800b10,  /* VDUP (ARM core register) */
+    INSN_VDUP_S    = 0xf3b00c00,  /* VDUP (scalar) */
+    INSN_VLDR_D    = 0xed100b00,  /* VLDR.64 */
     INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
+    INSN_VLD1R     = 0xf4a00c00,  /* VLD1 (single element to all lanes) */
     INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
+    INSN_VMOVI     = 0xf2800010,  /* VMOV (immediate) */
 } ARMInsn;
 
 #define INSN_NOP   (use_armv7_instructions ? INSN_NOP_v6k : INSN_NOP_v4)
@@ -195,6 +200,14 @@ static const uint8_t tcg_cond_to_arm_cond[] = {
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
 static bool reloc_pc24(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
 {
     const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
@@ -226,16 +239,52 @@ static bool reloc_pc13(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
     return false;
 }
 
+static bool reloc_pc11(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = (tcg_ptr_byte_diff(target, src_rx) - 8) / 4;
+
+    if (offset >= -0xff && offset <= 0xff) {
+        tcg_insn_unit insn = *src_rw;
+        bool u = (offset >= 0);
+        if (!u) {
+            offset = -offset;
+        }
+        insn = deposit32(insn, 23, 1, u);
+        insn = deposit32(insn, 0, 8, offset);
+        *src_rw = insn;
+        return true;
+    }
+    return false;
+}
+
+static bool reloc_pc8(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    ptrdiff_t offset = tcg_ptr_byte_diff(target, src_rx) - 8;
+    int rot = encode_imm(offset);
+
+    if (rot >= 0) {
+        *src_rw = deposit32(*src_rw, 0, 12, rol32(offset, rot) | (rot << 7));
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
         return reloc_pc24(code_ptr, (const tcg_insn_unit *)value);
-    } else if (type == R_ARM_PC13) {
+    case R_ARM_PC13:
         return reloc_pc13(code_ptr, (const tcg_insn_unit *)value);
-    } else {
+    case R_ARM_PC11:
+        return reloc_pc11(code_ptr, (const tcg_insn_unit *)value);
+    case R_ARM_PC8:
+        return reloc_pc8(code_ptr, (const tcg_insn_unit *)value);
+    default:
         g_assert_not_reached();
     }
 }
@@ -275,7 +324,7 @@ static inline uint32_t rotl(uint32_t val, int n)
 
 /* ARM immediates for ALU instructions are made of an unsigned 8-bit
    right-rotated by an even amount between 0 and 30. */
-static inline int encode_imm(uint32_t imm)
+static int encode_imm(uint32_t imm)
 {
     int shift;
 
@@ -302,6 +351,79 @@ static inline int check_fit_imm(uint32_t imm)
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
@@ -1127,6 +1249,15 @@ static void tcg_out_vreg3(TCGContext *s, ARMInsn insn, int q, int vece,
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
@@ -2329,22 +2460,158 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
+/* Type is always V128, with I64 elements.  */
+static void tcg_out_dup2_vec(TCGContext *s, TCGReg rd, TCGReg rl, TCGReg rh)
+{
+    /* Move high element into place first. */
+    /* VMOV Dd+1, Ds */
+    tcg_out_vreg3(s, INSN_VORR | (1 << 12), 0, 0, rd, rh, rh);
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
+        tcg_out_vmovi(s, rd, q, 0, 0xb, v16 >> 8);   /* VORRI */
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
+            tcg_out_vmovi(s, rd, q, 0, i | 1, extract32(v32, i * 4, 8));
+            return;
+        }
+        i = is_shimm32_pair(~v32, &cmode, &imm8);
+        if (i) {
+            tcg_out_vmovi(s, rd, q, 1, cmode, imm8);
+            tcg_out_vmovi(s, rd, q, 1, i | 1, extract32(~v32, i * 4, 8));
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


