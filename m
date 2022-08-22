Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320659C083
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:28:07 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7TK-0004eH-EK
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PW-00063u-9o
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PQ-0001dP-Ie
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id h5so12400142wru.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=z3HMTNdAubSdARHZ1TYHyaaRh8yZaKl7eKMF8WGzqZY=;
 b=MQ9ppO9Ms9TeebGs/EekuZ2lsw2d6OfTduf681AxJpve90Ynzgl4CBdNnrZKe042kH
 49aJehOGKUK6/23dbUFkV7ziChCrFISIVCsiOsw4Bcwb889DYGSFl5WmyeDO2ZC6D6Cy
 yJkPNTFLjn2J2FYgfKhPs/P7zOczgHT9lx9HFqp/cZUjnqIdBovP7zRKo4iJEajH2pp8
 TP7lNbuZsAIOQzCQmhkSLtza/bOD+W2pFHBlX67DKicbd/fXla0Ltk1XAwGmUTj7MUZQ
 ItGWV2zxgyeu8hyqfabbaw2AaiDv2Saew8NPHiX2KZPokU8WAmFcdT0qCT7qM0ZfszoZ
 DwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=z3HMTNdAubSdARHZ1TYHyaaRh8yZaKl7eKMF8WGzqZY=;
 b=ta4GZ/xtOLjKcc/vDqw1DhSi5uHveS9wEiPn09N3kEnJiGo1kdzwDxjgH89/4Vprti
 i+lYHt+HR/2oRR5Nbex5t+iGJd7XMwV58IbHHk8y/GIOy3lwmAh03ikZSXvrWwWptohI
 JNWwb9Zl9e+BVkml9Hpg1gsaDcGLjDC4/TDbPI+4jwFt/zhIsuS8CwDs72FAwPwOCaYb
 oa2TjW1c3KUaAaIZcc8bK8IY6tLSGs6zqevbKD6GSax7JafzSPNKeGkkmZDPrBO3yoin
 M74LtAl8eWR2dXSbukElIKGEUznN9pAebv42aK/SjFFmxEEV20leLXyXzOwh+P9bQl4k
 Csbg==
X-Gm-Message-State: ACgBeo2YAUQgIfPzuHNchgioBYelYbvaUZTwr5/5RS91bQkaT8OcDnqN
 j5BCJvB+2s4yRIogE93ufHAsUUnrRWzYtA==
X-Google-Smtp-Source: AA6agR5zqhqBYA3nevWMR4REEuNpv9LFfYWBxZKnpqxMdMaWoEF7N7wIzbX6tHtTaucDvJY9Ehp5SQ==
X-Received: by 2002:adf:d4c6:0:b0:225:2eeb:fe8e with SMTP id
 w6-20020adfd4c6000000b002252eebfe8emr10544266wrk.429.1661174643880; 
 Mon, 22 Aug 2022 06:24:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 03/10] target/arm: Don't mishandle count when enabling or
 disabling PMU counters
Date: Mon, 22 Aug 2022 14:23:51 +0100
Message-Id: <20220822132358.3524971-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: fixed comment typo
---
 target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 87c89748954..59e1280a9cd 100644
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


