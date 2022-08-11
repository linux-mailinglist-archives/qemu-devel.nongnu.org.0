Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCA5905D3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:24:49 +0200 (CEST)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBvM-0007aR-G7
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0006qs-RI
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnF-0000tv-5r
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id bv3so22040172wrb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=ulFcTK/UMwbyB6T+H2cmDJnndecNUSXMdH2zsNS8rWY=;
 b=TW+iMmrxXvn4IUI5eXZS5bL4HRuuZsFJkGJbLKpM+WCfO3Roo/5brIAbqrOF5p9xiD
 pmCeUFh2IpbrS3zu4DGQuiet5wYvkQnSS95fdsqDlOsxz9A6dLNlNKDgXCM88QbPWqYu
 FaoZIDYPYxgta90s3c9pDAReZeDcMnALOgnpUo3p50Cos2OqIULVk+xJb6N3fR9grd8V
 GNQAOPoeVl7SW2/wQJUGMY+IOYzWszC8aUIIcxKEy3CmUzNpBRqpPttM1xGloAA206vY
 SmeFUTqS63uBP4NHn6Kojtbcz7LEG8y9ZGXoEp5asFNWT3ActGjwhnZWrz+f1XUBpMOc
 vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=ulFcTK/UMwbyB6T+H2cmDJnndecNUSXMdH2zsNS8rWY=;
 b=3mtSHkxGtxy9ngbkn63hKTEjdTn6Q64agkgEg43JtTCK9sL7BDGQ3ACdscRDLfqqFz
 2eKPIUsqKMm50rClVRIyiMyCW5RL1Sxyl2KDHuUTY4Wr64Qq/LRJ1hq/Sb17lTfLlQd4
 ffyVvDxZH4Ad1cH/Zbk5zuYRaSWPRnOPCnl6OfZQvRQjwKTdoki4EJNQJSUiQ/P9Da9+
 Qh5mbsV3B75HxXJwl5SutfhxhEJRb0BoEJ5ZpWEvSsBWrFQbe3Ewr+BXMyqjhSLzKvUF
 q1YQriDDurwvM/ePN/sy1lOb2OaUmIMztkozLNpeK+M+9Ey47M146bBmeCpTX1RXNNcB
 r7JQ==
X-Gm-Message-State: ACgBeo0T4Kzpelgjf/StTStkG+s77kK7dE7lqbTGHCiczuxwfO239dIg
 sDP/lXrE9aFSTv1L73NGeu9DRdLZaPNkuQ==
X-Google-Smtp-Source: AA6agR4Y+eAcJKS3jAtrA4sFyTFALOxFDvwhawhTqvVcjkxWdGtwWoM4eOWzVrBlIIY1tVoJfKX0zA==
X-Received: by 2002:a5d:47a1:0:b0:221:7e3b:b3b4 with SMTP id
 1-20020a5d47a1000000b002217e3bb3b4mr17662wrb.694.1660238183645; 
 Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/10] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Date: Thu, 11 Aug 2022 18:16:12 +0100
Message-Id: <20220811171619.1154755-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMU cycle and event counter infrastructure design requires that
operations on the PMU register fields are wrapped in pmu_op_start()
and pmu_op_finish() calls (or their more specific pmmcntr and
pmevcntr equivalents).  This includes any changes to registers which
affect whether the counter should be enabled or disabled, but we
forgot to do this.

The effect of this bug is that in sequences like:
 * disable the cycle counter (PMCCNTR) using the PMCNTEN register
 * write a value such as 0xfffff000 to the PMCCNTR
 * restart the counter by writing to PMCNTEN
the value written to the cycle counter is corrupted, and it starts
counting from the wrong place. (Essentially, we fail to record that
the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
to have started counting is the point when PMCNTEN is written to enable
the counter.)

Add the necessary bracketing calls, so that updates to the various
registers which affect whether the PMU is counting are handled
correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 87c89748954..7a367371921 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1079,6 +1079,14 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
+/*
+ * Bits in MDCR_EL2 and MDCR_EL3 which pmu_counter_enabled() looks at.
+ * We use these to decide whether we need to wrap a write to MDCR_EL2
+ * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
+ */
+#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
+#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
+
 /* Returns true if the counter (pass 31 for PMCCNTR) should count events using
  * the current EL, security state, and register configuration.
  */
@@ -1432,15 +1440,19 @@ static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
+    pmu_op_start(env);
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten |= value;
+    pmu_op_finish(env);
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
+    pmu_op_start(env);
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten &= ~value;
+    pmu_op_finish(env);
 }
 
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4681,7 +4693,39 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
+    /*
+     * Some MDCR_EL3 bits affect whether PMU counters are running:
+     * if we are trying to change any of those then we must
+     * bracket this update with PMU start/finish calls.
+     */
+    bool pmu_op = (env->cp15.mdcr_el3 ^ value) & MDCR_EL3_PMU_ENABLE_BITS;
+
+    if (pmu_op) {
+        pmu_op_start(env);
+    }
     env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
+    if (pmu_op) {
+        pmu_op_finish(env);
+    }
+}
+
+static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /*
+     * Some MDCR_EL3 bits affect whether PMU counters are running:
+     * if we are trying to change any of those then we must
+     * bracket this update with PMU start/finish calls.
+     */
+    bool pmu_op = (env->cp15.mdcr_el2 ^ value) & MDCR_EL2_PMU_ENABLE_BITS;
+
+    if (pmu_op) {
+        pmu_op_start(env);
+    }
+    env->cp15.mdcr_el2 = value;
+    if (pmu_op) {
+        pmu_op_finish(env);
+    }
 }
 
 static const ARMCPRegInfo v8_cp_reginfo[] = {
@@ -7669,6 +7713,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mdcr_el2 = {
             .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+            .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
             .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
         };
-- 
2.25.1


