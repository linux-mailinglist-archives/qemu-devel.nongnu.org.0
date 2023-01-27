Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5267ECD8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxC-00018O-Tp; Fri, 27 Jan 2023 12:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSx1-0000xa-Sg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:48 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-000665-1R
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so5666072wrv.7
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aqoetvWjVycn+DsztISy/1/hIrHlhpFi8cpQUwg/Y0A=;
 b=XJqPTQNIhswGitpJ51bGhuyKsvZJasL77yo1+2MfULMARHdmJLpc1/AzpjWk2o6YEP
 dPSAXvGd9aPhjfgga9Z3qD1jQxi0rTgZvENHbcurEt1zrsvBnMqkXDrN/+dq/iU3Rgmq
 y5oWBeVw0hZi7NdnnLO6pAHyqukqXLEmtdZvxWhNN0VTGYXRzGw7j7kdt4ONW8sjzW37
 U1YibRBRjg6mv9rGPdo4scZxAeQtnevU2fb0yMrdpN2o+7Uz/DiGFc8EvSMXzSOzZ0OW
 HmNDY6mxbGiV10CACS2zJuN8XWmHcadrUa+zhz4bn3kOZnR3mLw95ufmXdOMiLyPHTnE
 FiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqoetvWjVycn+DsztISy/1/hIrHlhpFi8cpQUwg/Y0A=;
 b=RtsuarBpI6hPFCWlAHseo4XqZRG0H04hZFSKeXLleqUnLCgSU91DKzHQnAKCmXe/xZ
 c/tLp869VweweiXAJLYOJcdpZogmjwsMFb+m3UInwH74kMjpy+ezuacLOJd8P4B+ICDd
 XcPGDUJ50I8mYUzd9OFqO7BCtS6ZHknvmUjmPKNHtsCptA0mu5fk+JGXEyLd0I5/DvBa
 jCOnEFs4Vq1xtL8CefzXTx1w5QYDo2hc1OvA9YXKCh7eE29qJbn+anCXmjE0uFr0fzZr
 MLQfLTUcWvf92iR+zhxo9YCcPbrUJsacOKldmLB3l3nuPyoMRlay3PhTCqHvAo4ba5pV
 EVog==
X-Gm-Message-State: AFqh2krvRyH11qOMomSXwNWOO5QJLHdwL0QWtYw7FUfbhGn2NP4+wvb2
 gi16cFhc/9Xd1/HfqP96kenVZ5MdS/+ZWCtH
X-Google-Smtp-Source: AMrXdXu0XaX59Si6pm5PQztOQRaRtZI2aHUMO+ajYAsD2lDh9Oz855aa8zPqynft1Xzz/TsDLf4y0Q==
X-Received: by 2002:adf:f191:0:b0:2be:5c4a:de6b with SMTP id
 h17-20020adff191000000b002be5c4ade6bmr24846830wro.3.1674842132744; 
 Fri, 27 Jan 2023 09:55:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/23] target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC
 traps
Date: Fri, 27 Jan 2023 17:55:06 +0000
Message-Id: <20230127175507.2895013-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

FEAT_FGT also implements an extra trap bit in the MDCR_EL2 and
MDCR_EL3 registers: bit TDCC enables trapping of use of the Debug
Comms Channel registers OSDTRRX_EL1, OSDTRTX_EL1, MDCCSR_EL0,
MDCCINT_EL0, DBGDTR_EL0, DBGDTRRX_EL0 and DBGDTRTX_EL0 (and their
AArch32 equivalents).  This trapping is independent of whether
fine-grained traps are enabled or not.

Implement these extra traps.  (We don't implement DBGDTR_EL0,
DBGDTRRX_EL0 and DBGDTRTX_EL0.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b106746b0e1..3c671c88c1a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -599,6 +599,33 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/*
+ * Check for traps to Debug Comms Channel registers. If FEAT_FGT
+ * is implemented then these are controlled by MDCR_EL2.TDCC for
+ * EL2 and MDCR_EL3.TDCC for EL3. They are also controlled by
+ * the general debug access trap bits MDCR_EL2.TDA and MDCR_EL3.TDA.
+ */
+static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+    bool mdcr_el2_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (mdcr_el2 & MDCR_TDCC);
+    bool mdcr_el3_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (env->cp15.mdcr_el3 & MDCR_TDCC);
+
+    if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -681,7 +708,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tda,
+      .access = PL0_R, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
@@ -689,11 +716,11 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSECCR_EL1 provides a mechanism for an operating system
@@ -757,7 +784,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_NOP },
     /*
      * Dummy DBGCLAIM registers.
-- 
2.34.1


