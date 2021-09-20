Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D746411782
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:50:36 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKct-0007tZ-JI
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9g-0002qv-9e
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9K-0000sB-JW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id w29so30194630wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Hu7yl+CPgZFc6MHOu57wkwyrC07Fyt3e5gM3Xr+GwuE=;
 b=sE3Z+yhrYVlH0ZEIClumJVfA09kfIwSS33KhRC1Lcuk4A968b6HdGXrs5ELd+nNXxs
 Qau08xLZ73nXhmTqi4vr7iOqf6y6vZIY3dJ5D1bO6GB25bClIFU56zXBtIuahOwHtAAz
 xuzXryjtoWFy4K6wrSZKJ8t2X/rjInMZNdzIVZUdsaboRKq8QIzG5PoNrrRB2Uq6jmRx
 NwiedhNAdNckqnTLihNPQ8spurnQWTjw1V9W6YV/oBu5MfmvyrkJrB/XURn1+EojpyqU
 TTE4z356tmm2FN5FvmfifJVMqnYLIeoHTOa8EnR7njklF7Jp1nkayULv7CG1aIZ0Dnpx
 n1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hu7yl+CPgZFc6MHOu57wkwyrC07Fyt3e5gM3Xr+GwuE=;
 b=xutbyv8ChnUiSsj2DDlKcgrdI95SzCw119ZD0GqfJ+kLwnd/+tdUP9fjHYSeKzF/cE
 K3RrjV8Grsx4clPQUEbEr0kznR5O2PblhLq7yZgs7k3Tq+o/mMSgJ1mKJt/EMrZX2CM8
 6FWq3955J9ZtVYCtlalUt1NzBqAdOYOiHrXOCS1J4Ea4vs0QpU57wk8eeuz+Ii5S7kMa
 OM0xz0P3W1kVHlE9JMzS/suAfDOGLC4y84veALtkF34qVKn0QYYiD0JOQdWqld8rVZrq
 LOeOpwvr20f4qi/rvRZx9VKKC+0912d2A1crsAcZgh3UVY3rss26QL93d3MBInRawvRr
 yhDg==
X-Gm-Message-State: AOAM5312T5SVUhaFUez3x6IXKGfYdfTmbOyPbDN2j14HyzMD6h849bDN
 KPydjvqTJPUFkcHUVLwqpEEfK6bPI53Vvg==
X-Google-Smtp-Source: ABdhPJwbxnxrpTNjp63g7iDL9NR9FGhnhkpoVATXX0xYH97FXvDq3ipqIm/yx9fISKHiz/NxfU05bQ==
X-Received: by 2002:a05:600c:b42:: with SMTP id
 k2mr22791768wmr.134.1632147601148; 
 Mon, 20 Sep 2021 07:20:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] hvf: arm: Add rudimentary PMC support
Date: Mon, 20 Sep 2021 15:19:35 +0100
Message-Id: <20210920141947.5537-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Alexander Graf <agraf@csgraf.de>

We can expose cycle counters on the PMU easily. To be as compatible as
possible, let's do so, but make sure we don't expose any other architectural
counters that we can not model yet.

This allows OSs to work that require PMU support.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210916155404.86958-10-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/hvf/hvf.c | 179 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 996f93a69dc..bff3e0cde7c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -42,6 +42,18 @@
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
+#define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
+#define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
+#define SYSREG_PMCNTENCLR_EL0 SYSREG(3, 3, 9, 12, 2)
+#define SYSREG_PMINTENCLR_EL1 SYSREG(3, 0, 9, 14, 2)
+#define SYSREG_PMOVSCLR_EL0   SYSREG(3, 3, 9, 12, 3)
+#define SYSREG_PMSWINC_EL0    SYSREG(3, 3, 9, 12, 4)
+#define SYSREG_PMSELR_EL0     SYSREG(3, 3, 9, 12, 5)
+#define SYSREG_PMCEID0_EL0    SYSREG(3, 3, 9, 12, 6)
+#define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
+#define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
+#define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
 #define WFX_IS_WFE (1 << 0)
 
@@ -728,6 +740,40 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
         val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
               gt_cntfrq_period_ns(arm_cpu);
         break;
+    case SYSREG_PMCR_EL0:
+        val = env->cp15.c9_pmcr;
+        break;
+    case SYSREG_PMCCNTR_EL0:
+        pmu_op_start(env);
+        val = env->cp15.c15_ccnt;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMCNTENCLR_EL0:
+        val = env->cp15.c9_pmcnten;
+        break;
+    case SYSREG_PMOVSCLR_EL0:
+        val = env->cp15.c9_pmovsr;
+        break;
+    case SYSREG_PMSELR_EL0:
+        val = env->cp15.c9_pmselr;
+        break;
+    case SYSREG_PMINTENCLR_EL1:
+        val = env->cp15.c9_pminten;
+        break;
+    case SYSREG_PMCCFILTR_EL0:
+        val = env->cp15.pmccfiltr_el0;
+        break;
+    case SYSREG_PMCNTENSET_EL0:
+        val = env->cp15.c9_pmcnten;
+        break;
+    case SYSREG_PMUSERENR_EL0:
+        val = env->cp15.c9_pmuserenr;
+        break;
+    case SYSREG_PMCEID0_EL0:
+    case SYSREG_PMCEID1_EL0:
+        /* We can't really count anything yet, declare all events invalid */
+        val = 0;
+        break;
     case SYSREG_OSLSR_EL1:
         val = env->cp15.oslsr_el1;
         break;
@@ -758,6 +804,82 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     return 0;
 }
 
+static void pmu_update_irq(CPUARMState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    qemu_set_irq(cpu->pmu_interrupt, (env->cp15.c9_pmcr & PMCRE) &&
+            (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
+}
+
+static bool pmu_event_supported(uint16_t number)
+{
+    return false;
+}
+
+/* Returns true if the counter (pass 31 for PMCCNTR) should count events using
+ * the current EL, security state, and register configuration.
+ */
+static bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
+{
+    uint64_t filter;
+    bool enabled, filtered = true;
+    int el = arm_current_el(env);
+
+    enabled = (env->cp15.c9_pmcr & PMCRE) &&
+              (env->cp15.c9_pmcnten & (1 << counter));
+
+    if (counter == 31) {
+        filter = env->cp15.pmccfiltr_el0;
+    } else {
+        filter = env->cp15.c14_pmevtyper[counter];
+    }
+
+    if (el == 0) {
+        filtered = filter & PMXEVTYPER_U;
+    } else if (el == 1) {
+        filtered = filter & PMXEVTYPER_P;
+    }
+
+    if (counter != 31) {
+        /*
+         * If not checking PMCCNTR, ensure the counter is setup to an event we
+         * support
+         */
+        uint16_t event = filter & PMXEVTYPER_EVTCOUNT;
+        if (!pmu_event_supported(event)) {
+            return false;
+        }
+    }
+
+    return enabled && !filtered;
+}
+
+static void pmswinc_write(CPUARMState *env, uint64_t value)
+{
+    unsigned int i;
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) == 0x0) {
+            /*
+             * Detect if this write causes an overflow since we can't predict
+             * PMSWINC overflows like we can for other events
+             */
+            uint32_t new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
+
+            if (env->cp15.c14_pmevcntr[i] & ~new_pmswinc & INT32_MIN) {
+                env->cp15.c9_pmovsr |= (1 << i);
+                pmu_update_irq(env);
+            }
+
+            env->cp15.c14_pmevcntr[i] = new_pmswinc;
+        }
+    }
+}
+
 static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -772,6 +894,63 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
                            val);
 
     switch (reg) {
+    case SYSREG_PMCCNTR_EL0:
+        pmu_op_start(env);
+        env->cp15.c15_ccnt = val;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMCR_EL0:
+        pmu_op_start(env);
+
+        if (val & PMCRC) {
+            /* The counter has been reset */
+            env->cp15.c15_ccnt = 0;
+        }
+
+        if (val & PMCRP) {
+            unsigned int i;
+            for (i = 0; i < pmu_num_counters(env); i++) {
+                env->cp15.c14_pmevcntr[i] = 0;
+            }
+        }
+
+        env->cp15.c9_pmcr &= ~PMCR_WRITEABLE_MASK;
+        env->cp15.c9_pmcr |= (val & PMCR_WRITEABLE_MASK);
+
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMUSERENR_EL0:
+        env->cp15.c9_pmuserenr = val & 0xf;
+        break;
+    case SYSREG_PMCNTENSET_EL0:
+        env->cp15.c9_pmcnten |= (val & pmu_counter_mask(env));
+        break;
+    case SYSREG_PMCNTENCLR_EL0:
+        env->cp15.c9_pmcnten &= ~(val & pmu_counter_mask(env));
+        break;
+    case SYSREG_PMINTENCLR_EL1:
+        pmu_op_start(env);
+        env->cp15.c9_pminten |= val;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMOVSCLR_EL0:
+        pmu_op_start(env);
+        env->cp15.c9_pmovsr &= ~val;
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMSWINC_EL0:
+        pmu_op_start(env);
+        pmswinc_write(env, val);
+        pmu_op_finish(env);
+        break;
+    case SYSREG_PMSELR_EL0:
+        env->cp15.c9_pmselr = val & 0x1f;
+        break;
+    case SYSREG_PMCCFILTR_EL0:
+        pmu_op_start(env);
+        env->cp15.pmccfiltr_el0 = val & PMCCFILTR_EL0;
+        pmu_op_finish(env);
+        break;
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         break;
-- 
2.20.1


