Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63132B4AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:20:51 +0100 (CET)
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehFK-0002y2-Pm
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3q-0000P5-CX
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:58 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3k-0007vI-Em
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:58 -0500
Received: by mail-wr1-x430.google.com with SMTP id 23so19239450wrc.8
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HpGcUz/nkakqTXZdKeGHB+GL0ZV/75Y796jJ21zpvSI=;
 b=dWKWu7VzlYa9Az1KwaTRwsstlssgJKAvQcZsQziGhpUhmrMwudADQ1Vm7QtbSXBPkf
 DjSP9wj+nqmkauIykqi2ZFLEvZfCduT/Wg8BpHBHwo1d6IIbgjd3xNmnQ+HYMiIXbS40
 E+h7xy9NT9DA6s3zPbgI3QYiPqiq5HwrCSSoJ9/TxDy5S7Zc+7uWR/xh8Tu2lAc6i6hg
 ZkiUDqu95Ij8tH6ceYADkZ5riSw2n8P190aA0pRBwNuovmTVvzvc0CRTaacSDtQfoKOv
 IHMqXgcH5H+5l6WN+BNvEjgyadob/evlr0E1HKXInWGnF1W20CYGghbQAoWAF62tXelw
 GapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpGcUz/nkakqTXZdKeGHB+GL0ZV/75Y796jJ21zpvSI=;
 b=oZhIsQovUOOvgbtExfSROWbzPrU0brwVyXnkvNlvtCEl7ar+jxeaRk7LRBtd7Nlm4h
 4jkC/kb0Kf+J9TThb/u1fC0SICOyFbnnRl72F2V5Lg1fYtcVkEKmPIRt8XtPTxjX1pNs
 9ckElis7Ur3WLeDYZoRmLfruJ6MFxPT7SpPahqmhaiQtt9rOhXMGcy+8kZ/ZltmyaAyq
 WAUwZ57PharhSVnr39V5v8W1826kg8kQbMzHPZBGdKlJzSzFuu8goEzYJtd85jd8aepY
 trynyrOdvWat8+kc+Ipj4TFgixByJW56G8egpgB2AY3ZzdQihQFOLOEev+upHr6+3M3a
 Q9NA==
X-Gm-Message-State: AOAM530jTuCV3X7hr8FNivrT7EKnL/YrmcZSnPq6Lb7d/je/2GOaEv/I
 R3RTgF45iMnRYyv+yvbr5U7JYA==
X-Google-Smtp-Source: ABdhPJzj3pClOsI9+426Ge5+g0uiYxSXWK1hCEhBsPT22EquRyqQrl8K3QFqqshg5UQg4FJafACIEg==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr20326901wrq.121.1605542931092; 
 Mon, 16 Nov 2020 08:08:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/15] target/arm: Implement FPCXT_NS fp system register
Date: Mon, 16 Nov 2020 16:08:30 +0000
Message-Id: <20201116160831.31000-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Implement the v8.1M FPCXT_NS floating-point system register.  This is
a little more complicated than FPCXT_S, because it has specific
handling for "current FP state is inactive", and it only wants to do
PreserveFPState(), not the full set of actions done by
ExecuteFPCheck() which vfp_access_check() implements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 110 ++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index c7ae306f12f..d0c3a464a21 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -647,8 +647,20 @@ typedef enum fp_sysreg_check_result {
     fp_sysreg_check_continue, /* caller should continue generating code */
 } fp_sysreg_check_result;
 
-static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
+/*
+ * Emit code to check common UNDEF cases and handle lazy state preservation
+ * including the special casing for FPCXT_NS. For reads of sysregs, caller
+ * should provide storefn and opaque; for writes to sysregs these can be NULL.
+ * On return, if *insn_end_label is not NULL the caller needs to gen_set_label()
+ * it at the end of the other code generated for the insn.
+ */
+static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno,
+                                               fp_sysreg_storefn *storefn,
+                                               void *opaque,
+                                               TCGLabel **insn_end_label)
 {
+    *insn_end_label = NULL;
+
     if (!dc_isar_feature(aa32_fpsp_v2, s)) {
         return fp_sysreg_check_failed;
     }
@@ -663,6 +675,7 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
         }
         break;
     case ARM_VFP_FPCXT_S:
+    case ARM_VFP_FPCXT_NS:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
             return false;
         }
@@ -674,8 +687,46 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
         return fp_sysreg_check_failed;
     }
 
-    if (!vfp_access_check(s)) {
-        return fp_sysreg_check_done;
+    /*
+     * FPCXT_NS is a special case: it has specific handling for
+     * "current FP state is inactive", and must do the PreserveFPState()
+     * but not the usual full set of actions done by ExecuteFPCheck().
+     * We don't have a TB flag that matches the fpInactive check, so we
+     * do it at runtime as we don't expect FPCXT_NS accesses to be frequent.
+     * The code emitted here handles the fpInactive special case;
+     * the caller just has to do the codegen for the normal (!fpInactive)
+     * special case, and then set the label at the end.
+     */
+    if (regno == ARM_VFP_FPCXT_NS) {
+        /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
+        TCGLabel *fp_active_label = gen_new_label();
+        TCGv_i32 aspen, fpca;
+        aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
+        fpca = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+        tcg_gen_subi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+        tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
+        tcg_gen_or_i32(fpca, fpca, aspen);
+        tcg_gen_brcondi_i32(TCG_COND_NE, fpca, 0, fp_active_label);
+        tcg_temp_free_i32(aspen);
+        tcg_temp_free_i32(fpca);
+
+        /* fpInactive case: FPCXT_NS reads as FPDSCR_NS, write is NOP */
+        if (storefn) {
+            TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+            storefn(s, opaque, tmp);
+        }
+        /* jump to end of insn */
+        *insn_end_label = gen_new_label();
+        tcg_gen_br(*insn_end_label);
+
+        gen_set_label(fp_active_label);
+        /* !fpInactive: PreserveFPState() and handle register as normal */
+        gen_preserve_fp_state(s);
+    } else {
+        if (!vfp_access_check(s)) {
+            return fp_sysreg_check_done;
+        }
     }
 
     return fp_sysreg_check_continue;
@@ -687,8 +738,10 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 {
     /* Do a write to an M-profile floating point system register */
     TCGv_i32 tmp;
+    TCGLabel *insn_end_label;
+    bool lookup_tb = false;
 
-    switch (fp_sysreg_checks(s, regno)) {
+    switch (fp_sysreg_checks(s, regno, NULL, NULL, &insn_end_label)) {
     case fp_sysreg_check_failed:
         return false;
     case fp_sysreg_check_done:
@@ -702,7 +755,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tmp = loadfn(s, opaque);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
-        gen_lookup_tb(s);
+        lookup_tb = true;
         break;
     case ARM_VFP_FPSCR_NZCVQC:
     {
@@ -721,6 +774,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         break;
     }
     case ARM_VFP_FPCXT_S:
+    case ARM_VFP_FPCXT_NS:
     {
         TCGv_i32 sfpa, control, fpscr;
         /* Set FPSCR[27:0] and CONTROL.SFPA from value */
@@ -743,6 +797,12 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     default:
         g_assert_not_reached();
     }
+    if (insn_end_label) {
+        gen_set_label(insn_end_label);
+    }
+    if (lookup_tb) {
+        gen_lookup_tb(s);
+    }
     return true;
 }
 
@@ -752,8 +812,10 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
 {
     /* Do a read from an M-profile floating point system register */
     TCGv_i32 tmp;
+    TCGLabel *insn_end_label;
+    bool lookup_tb = false;
 
-    switch (fp_sysreg_checks(s, regno)) {
+    switch (fp_sysreg_checks(s, regno, storefn, opaque, &insn_end_label)) {
     case fp_sysreg_check_failed:
         return false;
     case fp_sysreg_check_done:
@@ -810,12 +872,46 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
         tcg_temp_free_i32(fpscr);
-        gen_lookup_tb(s);
+        lookup_tb = true;
+        break;
+    }
+    case ARM_VFP_FPCXT_NS:
+    {
+        TCGv_i32 control, sfpa, fpscr, fpdscr, zero;
+        /* Reads the same as FPCXT_S, but side effects differ */
+        tmp = tcg_temp_new_i32();
+        sfpa = tcg_temp_new_i32();
+        fpscr = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(fpscr, cpu_env);
+        tcg_gen_andi_i32(tmp, fpscr, ~FPCR_NZCV_MASK);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
+        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
+        tcg_gen_or_i32(tmp, tmp, sfpa);
+        tcg_temp_free_i32(control);
+        /* Store result before updating FPSCR, in case it faults */
+        storefn(s, opaque, tmp);
+        /* If SFPA is zero then set FPSCR from FPDSCR_NS */
+        fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        zero = tcg_const_i32(0);
+        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(zero);
+        tcg_temp_free_i32(sfpa);
+        tcg_temp_free_i32(fpdscr);
+        tcg_temp_free_i32(fpscr);
+        lookup_tb = true;
         break;
     }
     default:
         g_assert_not_reached();
     }
+    if (insn_end_label) {
+        gen_set_label(insn_end_label);
+    }
+    if (lookup_tb) {
+        gen_lookup_tb(s);
+    }
     return true;
 }
 
-- 
2.20.1


