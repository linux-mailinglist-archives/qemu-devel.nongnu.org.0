Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B12EF508
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:43:29 +0100 (CET)
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtvF-0004OX-0y
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtob-0004fS-Rf
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoZ-0002t1-TW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r7so9410086wrc.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=magHpsOy0Dv5+dKtnYn3AaMCDQw5EoHZAD4Bcu40G28=;
 b=yz7PSyoHLxPtGKahcXb2xwhgzC8JKduvPMQ7OY1AJuRvzqJzOPLyaWprDtQthfInYE
 /ySfWruwAT5ozQ/SybmhuHOfxhqBgGBMd9zRFqE2L5TIhjAAJW5rTb9/F5eZFmVksdMF
 XMMNopKizRSnZn3wu67IeY30vzUq5evjF8tY+fiZDgFXwYfrwTQl/hNIS3UiOLGuCs8q
 H3hUKppTA8rhR4RlFLD7NxnvVVmO2DkS+NYuzBo2MY0TcLMd5+uVMiYbB+4e0Rbm25Yy
 FI9oifF8YYdt4jX6uXqzq6M1QKv8S1CEcRO9IhdCOfIISFj5iTK9VqvepHa/JplrIVKs
 4GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=magHpsOy0Dv5+dKtnYn3AaMCDQw5EoHZAD4Bcu40G28=;
 b=WOOEc7X5WORPBZX2uV3L8tFaZu6mp2KKHqsSWyx9ame5JIJI0JD3fvGeNgsEmTVuXJ
 QDNg4hcGI1J1HxKDBqxE12yNiy4eGeihMQCogSQpx9665vBQKQxdJRW1kzvRbSmwmo24
 x8uIBLuiU7uZZZCcAVJOpeHLPAIiVHZiZWB0zwFQYRlZ0cTRRe8a2tRImCRymspGRprA
 F1JRFxhciJLMDpBMcAZ75eIBhTm+Foo3E3duTXzjVMJxPVqiNHwEN2tt1TpkKfzTOvOs
 SNUyHaygSfLx4Bzq16jszOTYEI0dmYWK6GEC7b3FVuC6VdNdw166F8AHtwLzvZx0Qupx
 FkrQ==
X-Gm-Message-State: AOAM530XFQLntBrG7aT6Zoe/NNu5UymaN4UodGVSFa+YZscZXGk44QOu
 JQ3KXOWpXdju7AtuOJdFgFVDrdwuA7OfxQ==
X-Google-Smtp-Source: ABdhPJwbf4zVbD1LSEEDmsRYdY/IQwigkjFYTw+ssfdSfnFv/lDUSQOyMHbPKx0L4xR4OgsD9v8lgg==
X-Received: by 2002:adf:94e1:: with SMTP id 88mr4185126wrr.341.1610120194291; 
 Fri, 08 Jan 2021 07:36:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] target/arm: Implement FPCXT_NS fp system register
Date: Fri,  8 Jan 2021 15:36:04 +0000
Message-Id: <20210108153621.3868-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201210201433.26262-4-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c.inc | 102 ++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 8b4cfd68cad..10766f210c1 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -663,6 +663,7 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
         }
         break;
     case ARM_VFP_FPCXT_S:
+    case ARM_VFP_FPCXT_NS:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
             return false;
         }
@@ -674,13 +675,48 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
         return FPSysRegCheckFailed;
     }
 
-    if (!vfp_access_check(s)) {
+    /*
+     * FPCXT_NS is a special case: it has specific handling for
+     * "current FP state is inactive", and must do the PreserveFPState()
+     * but not the usual full set of actions done by ExecuteFPCheck().
+     * So we don't call vfp_access_check() and the callers must handle this.
+     */
+    if (regno != ARM_VFP_FPCXT_NS && !vfp_access_check(s)) {
         return FPSysRegCheckDone;
     }
-
     return FPSysRegCheckContinue;
 }
 
+static void gen_branch_fpInactive(DisasContext *s, TCGCond cond,
+                                  TCGLabel *label)
+{
+    /*
+     * FPCXT_NS is a special case: it has specific handling for
+     * "current FP state is inactive", and must do the PreserveFPState()
+     * but not the usual full set of actions done by ExecuteFPCheck().
+     * We don't have a TB flag that matches the fpInactive check, so we
+     * do it at runtime as we don't expect FPCXT_NS accesses to be frequent.
+     *
+     * Emit code that checks fpInactive and does a conditional
+     * branch to label based on it:
+     *  if cond is TCG_COND_NE then branch if fpInactive != 0 (ie if inactive)
+     *  if cond is TCG_COND_EQ then branch if fpInactive == 0 (ie if active)
+     */
+    assert(cond == TCG_COND_EQ || cond == TCG_COND_NE);
+
+    /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
+    TCGv_i32 aspen, fpca;
+    aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
+    fpca = load_cpu_field(v7m.control[M_REG_S]);
+    tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+    tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
+    tcg_gen_or_i32(fpca, fpca, aspen);
+    tcg_gen_brcondi_i32(tcg_invert_cond(cond), fpca, 0, label);
+    tcg_temp_free_i32(aspen);
+    tcg_temp_free_i32(fpca);
+}
+
 static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 
                                   fp_sysreg_loadfn *loadfn,
@@ -688,6 +724,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 {
     /* Do a write to an M-profile floating point system register */
     TCGv_i32 tmp;
+    TCGLabel *lab_end = NULL;
 
     switch (fp_sysreg_checks(s, regno)) {
     case FPSysRegCheckFailed:
@@ -721,6 +758,13 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(tmp);
         break;
     }
+    case ARM_VFP_FPCXT_NS:
+        lab_end = gen_new_label();
+        /* fpInactive case: write is a NOP, so branch to end */
+        gen_branch_fpInactive(s, TCG_COND_NE, lab_end);
+        /* !fpInactive: PreserveFPState(), and reads same as FPCXT_S */
+        gen_preserve_fp_state(s);
+        /* fall through */
     case ARM_VFP_FPCXT_S:
     {
         TCGv_i32 sfpa, control;
@@ -744,6 +788,9 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     default:
         g_assert_not_reached();
     }
+    if (lab_end) {
+        gen_set_label(lab_end);
+    }
     return true;
 }
 
@@ -753,6 +800,8 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
 {
     /* Do a read from an M-profile floating point system register */
     TCGv_i32 tmp;
+    TCGLabel *lab_end = NULL;
+    bool lookup_tb = false;
 
     switch (fp_sysreg_checks(s, regno)) {
     case FPSysRegCheckFailed:
@@ -811,12 +860,59 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
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
+        TCGLabel *lab_active = gen_new_label();
+
+        lookup_tb = true;
+
+        gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
+        /* fpInactive case: reads as FPDSCR_NS */
+        TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        storefn(s, opaque, tmp);
+        lab_end = gen_new_label();
+        tcg_gen_br(lab_end);
+
+        gen_set_label(lab_active);
+        /* !fpInactive: Reads the same as FPCXT_S, but side effects differ */
+        gen_preserve_fp_state(s);
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
         break;
     }
     default:
         g_assert_not_reached();
     }
+
+    if (lab_end) {
+        gen_set_label(lab_end);
+    }
+    if (lookup_tb) {
+        gen_lookup_tb(s);
+    }
     return true;
 }
 
-- 
2.20.1


