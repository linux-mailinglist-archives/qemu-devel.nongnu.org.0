Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE85B88A3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:53:06 +0200 (CEST)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRt4-00023c-1T
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwa-0000Sd-9A
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwQ-00005F-Nl
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso10595748wma.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AlAPq4gQnCX4cukLBBAtOayjAhl59e9c8PEunG7TS7I=;
 b=cAkEyuCKtrrB6UvKOgmmbrpqoivME1Z9agda2lF//90TkFnG4+rrDFPWdv3m3cpU+N
 a/5s67DQMBqKb+PuihGyzACTmIkxEhYSSx6BVJFXxRQhXDHLYIRqdKZiTCYMjcHwb1ZZ
 TBWWvDLiV4jafZUIq5Jw+ML31LyMIKwNZ5akvcsRVbpi3GFIm4+MQK5LSeGSRqee/bWg
 yH3YTmsRPI6ybMXk1cImxFEEy4mJFhEqd7GMEzcKozgac5TAqHl/y/St+jtaqUE1xsMh
 lCNYRRV4Zj4SmjZodmQkiIvaGxrCxWpBlyZhxYmX1QCgxJY9Jn0/UxJw1SMh3UvsQI5j
 x/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AlAPq4gQnCX4cukLBBAtOayjAhl59e9c8PEunG7TS7I=;
 b=E1kQ+8pk1+ur0dlA/pUpX7KwFMrwaXgowNy6L7MB0oQNCiixHEGcfmWsccBe7EGAON
 KpoWnlfA4h4/ZB7C/ad4n4IHaZyMSF+QhGn2WPzhTmADubsNFgJZXs4RfgyoFUUCrZBF
 ElMBBpkZAcXl1VTrBrCDj7/6YrxxO48Y13RB9LSFajG74cuqRkTXlWapaBk6UlmHNT/o
 7HQRBpvywU0SHZ23lJmwzOcbQ21XI/uCwlxvy0Qi+jHKtO44noO9K64+AFnegwpwNloi
 gpC98eO+PoGM8IPUktnozyXXC8GyK7LYDrnoVBiClMmOPQsscwEc2bGUItf1+LcI8/va
 6laA==
X-Gm-Message-State: ACgBeo2hY31ZKsY6gnilb7qB1RQ0+MeV6p/PAS65zmDObUOS8TH3teks
 7r2eg0SWJOuslcgOpQagHXtIORAotnVA9SLG
X-Google-Smtp-Source: AA6agR71ROVE52ojpyFnadTtUbMz9tbtRael/L04U0fZCvnfFFszVk+eM4dAv3mNDrVDWCyIdnng6Q==
X-Received: by 2002:a7b:c2a9:0:b0:3a6:2400:722c with SMTP id
 c9-20020a7bc2a9000000b003a62400722cmr2778737wmk.108.1663156349363; 
 Wed, 14 Sep 2022 04:52:29 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/20] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Date: Wed, 14 Sep 2022 12:52:08 +0100
Message-Id: <20220914115217.117532-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-4-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e4824e01b8..a348c7407d 100644
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
+     * Some MDCR_EL2 bits affect whether PMU counters are running:
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
@@ -7724,6 +7768,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mdcr_el2 = {
             .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+            .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
             .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
         };
-- 
2.34.1


