Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A595135E3BA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:22:51 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLoQ-0006fz-Qd
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaU-0006Gd-Ef
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaL-0006sV-CU
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id s7so16889797wru.6
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kt05k2xcS83wIX6aDr9UNVbg07JJUkYUzqEFtsOURW8=;
 b=a39fdsy/G8g506VouIzYCeKNRRw0ShYIm08hy4ThmC6CfKw38ya7hiuPxSNNEaSzth
 vH7yFuMsIYq/AE2H67kGfol01mB2VkuoYo0Pu4fEc0cVT623ZQUc0BevCLXq+1zBraeL
 L1Q75pO7vqFkxRRxk4ZG9JjImwFPwxdGl/BO6IPB8ilhdA8VuCPjPKbY0k/Yj95dJ5Nt
 MQ6OIWdninIwRT3veew9YgNMmJXLFNYW4Ndwy4uTo1i7tChXFqELQjsie7HDKkUj+E9k
 n+jEHEaIsz2FgLgwQ1sYt8LUy5FVfr9G45DNbVXWnoUMo8ouilFv8ABUlCKRY49AlLp8
 B+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kt05k2xcS83wIX6aDr9UNVbg07JJUkYUzqEFtsOURW8=;
 b=m+zzX77T1ZNhHgVxbdvadBipUGzVse48ceUOWLFUL2UaYjfy0gx/RAyvuFx42zZoge
 5ULROyb6hZgL+BiS4EeGh7CZroUPbCtRd+u7F3FEOzk4+cOBm4Mrjivvywc4KkqPcdcx
 NSvqAonzU+DWgE25GC/uWaAeF9GJw0wWQ5YIpkvjmkUVHVqpz4Wi32EJqPFQ4oR64uUa
 HCAqPEHuYdtz3tWkhfJtqPUj+pz6KNoP0y9qahvb3Wg0FyPnXC8qDnw2QtEWFh4NI4H+
 HWVOshDiSsDE4KD5ff952kEnHZwfUNU4awY3AHr7xdg4KY/QjArh196lcjOjup6XQqhj
 PdMQ==
X-Gm-Message-State: AOAM532VxwIPExWNPddO6s8Fb1P1YaldQ8epF4wywmTHEx8QTe8EOy2s
 9wW0wWEPDq1IwffZV1Mpk1dYnMKFu0IVnfGv
X-Google-Smtp-Source: ABdhPJy02UEDXFU0ShV2+pYAILjJ6dTh9Vy0Js83fIMYqqsvHsGjOo3rMRGEEbJmgpMMVCKpkcKtmw==
X-Received: by 2002:a5d:40cf:: with SMTP id b15mr1503180wrq.162.1618330095915; 
 Tue, 13 Apr 2021 09:08:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/13] target/arm: Split m-nocp trans functions into their own
 file
Date: Tue, 13 Apr 2021 17:07:50 +0100
Message-Id: <20210413160759.5917-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Currently the trans functions for m-nocp.decode all live in
translate-vfp.inc.c; move them out into their own translation unit,
translate-m-nocp.c.

The trans_* functions here are pure code motion with no changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h     |   3 +
 target/arm/translate-m-nocp.c  | 221 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |   1 -
 target/arm/translate-vfp.c.inc | 196 -----------------------------
 target/arm/meson.build         |   3 +-
 5 files changed, 226 insertions(+), 198 deletions(-)
 create mode 100644 target/arm/translate-m-nocp.c

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index c5d937b27e8..cb451f70a42 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -20,6 +20,9 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
+/* Prototypes for autogenerated disassembler functions */
+bool disas_m_nocp(DisasContext *dc, uint32_t insn);
+
 void load_reg_var(DisasContext *s, TCGv_i32 var, int reg);
 void arm_gen_condlabel(DisasContext *s);
 bool vfp_access_check(DisasContext *s);
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
new file mode 100644
index 00000000000..d47eb8e1535
--- /dev/null
+++ b/target/arm/translate-m-nocp.c
@@ -0,0 +1,221 @@
+/*
+ *  ARM translation: M-profile NOCP special-case instructions
+ *
+ *  Copyright (c) 2020 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "translate.h"
+#include "translate-a32.h"
+
+#include "decode-m-nocp.c.inc"
+
+/*
+ * Decode VLLDM and VLSTM are nonstandard because:
+ *  * if there is no FPU then these insns must NOP in
+ *    Secure state and UNDEF in Nonsecure state
+ *  * if there is an FPU then these insns do not have
+ *    the usual behaviour that vfp_access_check() provides of
+ *    being controlled by CPACR/NSACR enable bits or the
+ *    lazy-stacking logic.
+ */
+static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
+{
+    TCGv_i32 fptr;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+
+    if (a->op) {
+        /*
+         * T2 encoding ({D0-D31} reglist): v8.1M and up. We choose not
+         * to take the IMPDEF option to make memory accesses to the stack
+         * slots that correspond to the D16-D31 registers (discarding
+         * read data and writing UNKNOWN values), so for us the T2
+         * encoding behaves identically to the T1 encoding.
+         */
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+    } else {
+        /*
+         * T1 encoding ({D0-D15} reglist); undef if we have 32 Dregs.
+         * This is currently architecturally impossible, but we add the
+         * check to stay in line with the pseudocode. Note that we must
+         * emit code for the UNDEF so it takes precedence over the NOCP.
+         */
+        if (dc_isar_feature(aa32_simd_r32, s)) {
+            unallocated_encoding(s);
+            return true;
+        }
+    }
+
+    /*
+     * If not secure, UNDEF. We must emit code for this
+     * rather than returning false so that this takes
+     * precedence over the m-nocp.decode NOCP fallback.
+     */
+    if (!s->v8m_secure) {
+        unallocated_encoding(s);
+        return true;
+    }
+    /* If no fpu, NOP. */
+    if (!dc_isar_feature(aa32_vfp, s)) {
+        return true;
+    }
+
+    fptr = load_reg(s, a->rn);
+    if (a->l) {
+        gen_helper_v7m_vlldm(cpu_env, fptr);
+    } else {
+        gen_helper_v7m_vlstm(cpu_env, fptr);
+    }
+    tcg_temp_free_i32(fptr);
+
+    /* End the TB, because we have updated FP control bits */
+    s->base.is_jmp = DISAS_UPDATE_EXIT;
+    return true;
+}
+
+static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
+{
+    int btmreg, topreg;
+    TCGv_i64 zero;
+    TCGv_i32 aspen, sfpa;
+
+    if (!dc_isar_feature(aa32_m_sec_state, s)) {
+        /* Before v8.1M, fall through in decode to NOCP check */
+        return false;
+    }
+
+    /* Explicitly UNDEF because this takes precedence over NOCP */
+    if (!arm_dc_feature(s, ARM_FEATURE_M_MAIN) || !s->v8m_secure) {
+        unallocated_encoding(s);
+        return true;
+    }
+
+    if (!dc_isar_feature(aa32_vfp_simd, s)) {
+        /* NOP if we have neither FP nor MVE */
+        return true;
+    }
+
+    /*
+     * If FPCCR.ASPEN != 0 && CONTROL_S.SFPA == 0 then there is no
+     * active floating point context so we must NOP (without doing
+     * any lazy state preservation or the NOCP check).
+     */
+    aspen = load_cpu_field(v7m.fpccr[M_REG_S]);
+    sfpa = load_cpu_field(v7m.control[M_REG_S]);
+    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_andi_i32(sfpa, sfpa, R_V7M_CONTROL_SFPA_MASK);
+    tcg_gen_or_i32(sfpa, sfpa, aspen);
+    arm_gen_condlabel(s);
+    tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
+
+    if (s->fp_excp_el != 0) {
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), s->fp_excp_el);
+        return true;
+    }
+
+    topreg = a->vd + a->imm - 1;
+    btmreg = a->vd;
+
+    /* Convert to Sreg numbers if the insn specified in Dregs */
+    if (a->size == 3) {
+        topreg = topreg * 2 + 1;
+        btmreg *= 2;
+    }
+
+    if (topreg > 63 || (topreg > 31 && !(topreg & 1))) {
+        /* UNPREDICTABLE: we choose to undef */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    /* Silently ignore requests to clear D16-D31 if they don't exist */
+    if (topreg > 31 && !dc_isar_feature(aa32_simd_r32, s)) {
+        topreg = 31;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Zero the Sregs from btmreg to topreg inclusive. */
+    zero = tcg_const_i64(0);
+    if (btmreg & 1) {
+        write_neon_element64(zero, btmreg >> 1, 1, MO_32);
+        btmreg++;
+    }
+    for (; btmreg + 1 <= topreg; btmreg += 2) {
+        write_neon_element64(zero, btmreg >> 1, 0, MO_64);
+    }
+    if (btmreg == topreg) {
+        write_neon_element64(zero, btmreg >> 1, 0, MO_32);
+        btmreg++;
+    }
+    assert(btmreg == topreg + 1);
+    /* TODO: when MVE is implemented, zero VPR here */
+    return true;
+}
+
+static bool trans_NOCP(DisasContext *s, arg_nocp *a)
+{
+    /*
+     * Handle M-profile early check for disabled coprocessor:
+     * all we need to do here is emit the NOCP exception if
+     * the coprocessor is disabled. Otherwise we return false
+     * and the real VFP/etc decode will handle the insn.
+     */
+    assert(arm_dc_feature(s, ARM_FEATURE_M));
+
+    if (a->cp == 11) {
+        a->cp = 10;
+    }
+    if (arm_dc_feature(s, ARM_FEATURE_V8_1M) &&
+        (a->cp == 8 || a->cp == 9 || a->cp == 14 || a->cp == 15)) {
+        /* in v8.1M cp 8, 9, 14, 15 also are governed by the cp10 enable */
+        a->cp = 10;
+    }
+
+    if (a->cp != 10) {
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), default_exception_el(s));
+        return true;
+    }
+
+    if (s->fp_excp_el != 0) {
+        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                           syn_uncategorized(), s->fp_excp_el);
+        return true;
+    }
+
+    return false;
+}
+
+static bool trans_NOCP_8_1(DisasContext *s, arg_nocp *a)
+{
+    /* This range needs a coprocessor check for v8.1M and later only */
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    return trans_NOCP(s, a);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fb86427b11c..168427159ab 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1246,7 +1246,6 @@ static TCGv_ptr vfp_reg_ptr(bool dp, int reg)
 #define ARM_CP_RW_BIT   (1 << 20)
 
 /* Include the VFP and Neon decoders */
-#include "decode-m-nocp.c.inc"
 #include "translate-vfp.c.inc"
 #include "translate-neon.c.inc"
 
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f88ab8d7873..16a730b7bdd 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3800,202 +3800,6 @@ static bool trans_VCVT_dp_int(DisasContext *s, arg_VCVT_dp_int *a)
     return true;
 }
 
-/*
- * Decode VLLDM and VLSTM are nonstandard because:
- *  * if there is no FPU then these insns must NOP in
- *    Secure state and UNDEF in Nonsecure state
- *  * if there is an FPU then these insns do not have
- *    the usual behaviour that vfp_access_check() provides of
- *    being controlled by CPACR/NSACR enable bits or the
- *    lazy-stacking logic.
- */
-static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
-{
-    TCGv_i32 fptr;
-
-    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
-        !arm_dc_feature(s, ARM_FEATURE_V8)) {
-        return false;
-    }
-
-    if (a->op) {
-        /*
-         * T2 encoding ({D0-D31} reglist): v8.1M and up. We choose not
-         * to take the IMPDEF option to make memory accesses to the stack
-         * slots that correspond to the D16-D31 registers (discarding
-         * read data and writing UNKNOWN values), so for us the T2
-         * encoding behaves identically to the T1 encoding.
-         */
-        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return false;
-        }
-    } else {
-        /*
-         * T1 encoding ({D0-D15} reglist); undef if we have 32 Dregs.
-         * This is currently architecturally impossible, but we add the
-         * check to stay in line with the pseudocode. Note that we must
-         * emit code for the UNDEF so it takes precedence over the NOCP.
-         */
-        if (dc_isar_feature(aa32_simd_r32, s)) {
-            unallocated_encoding(s);
-            return true;
-        }
-    }
-
-    /*
-     * If not secure, UNDEF. We must emit code for this
-     * rather than returning false so that this takes
-     * precedence over the m-nocp.decode NOCP fallback.
-     */
-    if (!s->v8m_secure) {
-        unallocated_encoding(s);
-        return true;
-    }
-    /* If no fpu, NOP. */
-    if (!dc_isar_feature(aa32_vfp, s)) {
-        return true;
-    }
-
-    fptr = load_reg(s, a->rn);
-    if (a->l) {
-        gen_helper_v7m_vlldm(cpu_env, fptr);
-    } else {
-        gen_helper_v7m_vlstm(cpu_env, fptr);
-    }
-    tcg_temp_free_i32(fptr);
-
-    /* End the TB, because we have updated FP control bits */
-    s->base.is_jmp = DISAS_UPDATE_EXIT;
-    return true;
-}
-
-static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
-{
-    int btmreg, topreg;
-    TCGv_i64 zero;
-    TCGv_i32 aspen, sfpa;
-
-    if (!dc_isar_feature(aa32_m_sec_state, s)) {
-        /* Before v8.1M, fall through in decode to NOCP check */
-        return false;
-    }
-
-    /* Explicitly UNDEF because this takes precedence over NOCP */
-    if (!arm_dc_feature(s, ARM_FEATURE_M_MAIN) || !s->v8m_secure) {
-        unallocated_encoding(s);
-        return true;
-    }
-
-    if (!dc_isar_feature(aa32_vfp_simd, s)) {
-        /* NOP if we have neither FP nor MVE */
-        return true;
-    }
-
-    /*
-     * If FPCCR.ASPEN != 0 && CONTROL_S.SFPA == 0 then there is no
-     * active floating point context so we must NOP (without doing
-     * any lazy state preservation or the NOCP check).
-     */
-    aspen = load_cpu_field(v7m.fpccr[M_REG_S]);
-    sfpa = load_cpu_field(v7m.control[M_REG_S]);
-    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
-    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
-    tcg_gen_andi_i32(sfpa, sfpa, R_V7M_CONTROL_SFPA_MASK);
-    tcg_gen_or_i32(sfpa, sfpa, aspen);
-    arm_gen_condlabel(s);
-    tcg_gen_brcondi_i32(TCG_COND_EQ, sfpa, 0, s->condlabel);
-
-    if (s->fp_excp_el != 0) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
-        return true;
-    }
-
-    topreg = a->vd + a->imm - 1;
-    btmreg = a->vd;
-
-    /* Convert to Sreg numbers if the insn specified in Dregs */
-    if (a->size == 3) {
-        topreg = topreg * 2 + 1;
-        btmreg *= 2;
-    }
-
-    if (topreg > 63 || (topreg > 31 && !(topreg & 1))) {
-        /* UNPREDICTABLE: we choose to undef */
-        unallocated_encoding(s);
-        return true;
-    }
-
-    /* Silently ignore requests to clear D16-D31 if they don't exist */
-    if (topreg > 31 && !dc_isar_feature(aa32_simd_r32, s)) {
-        topreg = 31;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    /* Zero the Sregs from btmreg to topreg inclusive. */
-    zero = tcg_const_i64(0);
-    if (btmreg & 1) {
-        write_neon_element64(zero, btmreg >> 1, 1, MO_32);
-        btmreg++;
-    }
-    for (; btmreg + 1 <= topreg; btmreg += 2) {
-        write_neon_element64(zero, btmreg >> 1, 0, MO_64);
-    }
-    if (btmreg == topreg) {
-        write_neon_element64(zero, btmreg >> 1, 0, MO_32);
-        btmreg++;
-    }
-    assert(btmreg == topreg + 1);
-    /* TODO: when MVE is implemented, zero VPR here */
-    return true;
-}
-
-static bool trans_NOCP(DisasContext *s, arg_nocp *a)
-{
-    /*
-     * Handle M-profile early check for disabled coprocessor:
-     * all we need to do here is emit the NOCP exception if
-     * the coprocessor is disabled. Otherwise we return false
-     * and the real VFP/etc decode will handle the insn.
-     */
-    assert(arm_dc_feature(s, ARM_FEATURE_M));
-
-    if (a->cp == 11) {
-        a->cp = 10;
-    }
-    if (arm_dc_feature(s, ARM_FEATURE_V8_1M) &&
-        (a->cp == 8 || a->cp == 9 || a->cp == 14 || a->cp == 15)) {
-        /* in v8.1M cp 8, 9, 14, 15 also are governed by the cp10 enable */
-        a->cp = 10;
-    }
-
-    if (a->cp != 10) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), default_exception_el(s));
-        return true;
-    }
-
-    if (s->fp_excp_el != 0) {
-        gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
-                           syn_uncategorized(), s->fp_excp_el);
-        return true;
-    }
-
-    return false;
-}
-
-static bool trans_NOCP_8_1(DisasContext *s, arg_nocp *a)
-{
-    /* This range needs a coprocessor check for v8.1M and later only */
-    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-        return false;
-    }
-    return trans_NOCP(s, a);
-}
-
 static bool trans_VINS(DisasContext *s, arg_VINS *a)
 {
     TCGv_i32 rd, rm;
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 15b936c1010..bbee1325bc4 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,7 +5,7 @@ gen = [
   decodetree.process('neon-ls.decode', extra_args: '--static-decode=disas_neon_ls'),
   decodetree.process('vfp.decode', extra_args: '--static-decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--static-decode=disas_vfp_uncond'),
-  decodetree.process('m-nocp.decode', extra_args: '--static-decode=disas_m_nocp'),
+  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -26,6 +26,7 @@ arm_ss.add(files(
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
+  'translate-m-nocp.c',
   'vec_helper.c',
   'vfp_helper.c',
   'cpu_tcg.c',
-- 
2.20.1


