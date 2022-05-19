Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D401452DC01
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:53:38 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkLB-0002fE-W2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5B-00069K-5w
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:05 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk59-0000qR-01
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:04 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u27so7379624wru.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tyNuE2E1VngbYwS++vtZOajJkp9dpIH+jW3SL247YWw=;
 b=u8AvbG+NQAPi0cpsh7R9+BAlCibvLGEkYBGTTNynBoB6kyOFhi+Yhj0iBXqdvNlCpS
 wuRJrKaUa35yunNQVjI67j4hCqeTIVOsvMW01V0QASxe5VRyXoeN338Sgdk3IewYAPi1
 Pl/bCS+Pus2cyoch/Evm6cIt4aKZiqFzsWtJG/iymzLH4TjYR18Agj/o4HnLdx5u2D0v
 hzBv9z0SzCQUhN+FRtE2x/FvYpBSykKCyPZjFVdXP89hyOhoErt0mQ69dumYzlPRdzFh
 z6330gqp20rLlTtQdMJGW4yLQMPC4PxNw0wjgKSJT4h5KJ8dOt9g/MaCuTUqLPutLcJc
 mM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyNuE2E1VngbYwS++vtZOajJkp9dpIH+jW3SL247YWw=;
 b=WvExv6tUuZvN8BVEBOfNAvmKfa0ItaVPheZE6qA7AntsY5tA2Nf7QRlntwf0rkTfst
 q4tATQU2eGsVLoTCev47vjvMj0vJ011mJMdq2PgxW19+WGf+mPBYB5A2GrrqnjGk8KGR
 7LCrdrdGYRmSZYrNrF2iVrKsxZmafwrmNOnRX/kY17yr/qyO5dWhq3Ym5/icp0+ribb/
 aaKsrDvhP5pQ4IhL7zWyQeipL6lX7R02UTl7N6jzuQksm/RD02DUuGuDuvdRipZOC5oJ
 eKQip6pBvdcgiS7e5wZFRVEEkSeGh+getj0vSmhFrnr2DSaFRBlUEJyVpiN/6hvrVTH6
 88wQ==
X-Gm-Message-State: AOAM530unQ5o8qTyM0GNzku1JZ+xZXLElylT8jEoLvFmFXjS1SCeLP3I
 eLSPXcM7TQEX1B/s7SL9CsIOHixCzKZDGA==
X-Google-Smtp-Source: ABdhPJz+AHE0yWuMm5GJ9i2CnGNyaHSwfcAHL6nrilXLONTZCpVPGG78etQyB7GCIoc0BFsKZAEdUA==
X-Received: by 2002:a5d:47af:0:b0:20e:6641:5466 with SMTP id
 15-20020a5d47af000000b0020e66415466mr4939314wrb.99.1652981822195; 
 Thu, 19 May 2022 10:37:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] hw/intc/arm_gicv3: Support configurable number of
 physical priority bits
Date: Thu, 19 May 2022 18:36:39 +0100
Message-Id: <20220519173651.399295-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The GICv3 code has always supported a configurable number of virtual
priority and preemption bits, but our implementation currently
hardcodes the number of physical priority bits at 8.  This is not
what most hardware implementations provide; for instance the
Cortex-A53 provides only 5 bits of physical priority.

Make the number of physical priority/preemption bits driven by fields
in the GICv3CPUState, the way that we already do for virtual
priority/preemption bits.  We set cs->pribits to 8, so there is no
behavioural change in this commit.  A following commit will add the
machinery for CPUs to set this to the correct value for their
implementation.

Note that changing the number of priority bits would be a migration
compatibility break, because the semantics of the icc_apr[][] array
changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220512151457.3899052-5-peter.maydell@linaro.org
Message-id: 20220506162129.2896966-4-peter.maydell@linaro.org
---
 include/hw/intc/arm_gicv3_common.h |   7 +-
 hw/intc/arm_gicv3_cpuif.c          | 182 ++++++++++++++++++++---------
 2 files changed, 130 insertions(+), 59 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 4e416100559..46677ec345c 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -51,11 +51,6 @@
 /* Maximum number of list registers (architectural limit) */
 #define GICV3_LR_MAX 16
 
-/* Minimum BPR for Secure, or when security not enabled */
-#define GIC_MIN_BPR 0
-/* Minimum BPR for Nonsecure when security is enabled */
-#define GIC_MIN_BPR_NS (GIC_MIN_BPR + 1)
-
 /* For some distributor fields we want to model the array of 32-bit
  * register values which hold various bitmaps corresponding to enabled,
  * pending, etc bits. These macros and functions facilitate that; the
@@ -206,6 +201,8 @@ struct GICv3CPUState {
     int num_list_regs;
     int vpribits; /* number of virtual priority bits */
     int vprebits; /* number of virtual preemption bits */
+    int pribits; /* number of physical priority bits */
+    int prebits; /* number of physical preemption bits */
 
     /* Current highest priority pending interrupt for this CPU.
      * This is cached information that can be recalculated from the
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index ebf269b73a4..69a15f7a444 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -787,6 +787,36 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return intid;
 }
 
+static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
+{
+    /*
+     * Return a mask word which clears the unimplemented priority bits
+     * from a priority value for a physical interrupt. (Not to be confused
+     * with the group priority, whose mask depends on the value of BPR
+     * for the interrupt group.)
+     */
+    return ~0U << (8 - cs->pribits);
+}
+
+static inline int icc_min_bpr(GICv3CPUState *cs)
+{
+    /* The minimum BPR for the physical interface. */
+    return 7 - cs->prebits;
+}
+
+static inline int icc_min_bpr_ns(GICv3CPUState *cs)
+{
+    return icc_min_bpr(cs) + 1;
+}
+
+static inline int icc_num_aprs(GICv3CPUState *cs)
+{
+    /* Return the number of APR registers (1, 2, or 4) */
+    int aprmax = 1 << MAX(cs->prebits - 5, 0);
+    assert(aprmax <= ARRAY_SIZE(cs->icc_apr[0]));
+    return aprmax;
+}
+
 static int icc_highest_active_prio(GICv3CPUState *cs)
 {
     /* Calculate the current running priority based on the set bits
@@ -794,14 +824,14 @@ static int icc_highest_active_prio(GICv3CPUState *cs)
      */
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[0]); i++) {
+    for (i = 0; i < icc_num_aprs(cs); i++) {
         uint32_t apr = cs->icc_apr[GICV3_G0][i] |
             cs->icc_apr[GICV3_G1][i] | cs->icc_apr[GICV3_G1NS][i];
 
         if (!apr) {
             continue;
         }
-        return (i * 32 + ctz32(apr)) << (GIC_MIN_BPR + 1);
+        return (i * 32 + ctz32(apr)) << (icc_min_bpr(cs) + 1);
     }
     /* No current active interrupts: return idle priority */
     return 0xff;
@@ -980,7 +1010,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
 
-    value &= 0xff;
+    value &= icc_fullprio_mask(cs);
 
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env) &&
         (env->cp15.scr_el3 & SCR_FIQ)) {
@@ -1004,7 +1034,7 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
      */
     uint32_t mask = icc_gprio_mask(cs, cs->hppi.grp);
     int prio = cs->hppi.prio & mask;
-    int aprbit = prio >> 1;
+    int aprbit = prio >> (8 - cs->prebits);
     int regno = aprbit / 32;
     int regbit = aprbit % 32;
 
@@ -1162,7 +1192,7 @@ static void icc_drop_prio(GICv3CPUState *cs, int grp)
      */
     int i;
 
-    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[grp]); i++) {
+    for (i = 0; i < icc_num_aprs(cs); i++) {
         uint64_t *papr = &cs->icc_apr[grp][i];
 
         if (!*papr) {
@@ -1590,7 +1620,7 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    minval = (grp == GICV3_G1NS) ? GIC_MIN_BPR_NS : GIC_MIN_BPR;
+    minval = (grp == GICV3_G1NS) ? icc_min_bpr_ns(cs) : icc_min_bpr(cs);
     if (value < minval) {
         value = minval;
     }
@@ -2171,19 +2201,19 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 
     cs->icc_ctlr_el1[GICV3_S] = ICC_CTLR_EL1_A3V |
         (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->pribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
     cs->icc_ctlr_el1[GICV3_NS] = ICC_CTLR_EL1_A3V |
         (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+        ((cs->pribits - 1) << ICC_CTLR_EL1_PRIBITS_SHIFT);
     cs->icc_pmr_el1 = 0;
-    cs->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
-    cs->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
+    cs->icc_bpr[GICV3_G0] = icc_min_bpr(cs);
+    cs->icc_bpr[GICV3_G1] = icc_min_bpr(cs);
+    cs->icc_bpr[GICV3_G1NS] = icc_min_bpr_ns(cs);
     memset(cs->icc_apr, 0, sizeof(cs->icc_apr));
     memset(cs->icc_igrpen, 0, sizeof(cs->icc_igrpen));
     cs->icc_ctlr_el3 = ICC_CTLR_EL3_NDS | ICC_CTLR_EL3_A3V |
         (1 << ICC_CTLR_EL3_IDBITS_SHIFT) |
-        (7 << ICC_CTLR_EL3_PRIBITS_SHIFT);
+        ((cs->pribits - 1) << ICC_CTLR_EL3_PRIBITS_SHIFT);
 
     memset(cs->ich_apr, 0, sizeof(cs->ich_apr));
     cs->ich_hcr_el2 = 0;
@@ -2238,27 +2268,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
-    { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_fiq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
     /* All the ICC_AP1R*_EL1 registers are banked */
     { .name = "ICC_AP1R0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 0,
@@ -2267,27 +2276,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
-    { .name = "ICC_AP1R1_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 1,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_irq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP1R2_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 2,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_irq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
-    { .name = "ICC_AP1R3_EL1", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 3,
-      .type = ARM_CP_IO | ARM_CP_NO_RAW,
-      .access = PL1_RW, .accessfn = gicv3_irq_access,
-      .readfn = icc_ap_read,
-      .writefn = icc_ap_write,
-    },
     { .name = "ICC_DIR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 1,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
@@ -2430,6 +2418,54 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
     },
 };
 
+static const ARMCPRegInfo gicv3_cpuif_icc_apxr1_reginfo[] = {
+    { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 1,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+};
+
+static const ARMCPRegInfo gicv3_cpuif_icc_apxr23_reginfo[] = {
+    { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R2_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 2,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R3_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 3,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+};
+
 static uint64_t ich_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -2772,6 +2808,44 @@ void gicv3_init_cpuif(GICv3State *s)
          * get back to the GICv3CPUState from the CPUARMState.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+
+        /*
+         * For the moment, retain the existing behaviour of 8 priority bits;
+         * in a following commit we will take this from the CPU state,
+         * as we do for the virtual priority bits.
+         */
+        cs->pribits = 8;
+        /*
+         * The GICv3 has separate ID register fields for virtual priority
+         * and preemption bit values, but only a single ID register field
+         * for the physical priority bits. The preemption bit count is
+         * always the same as the priority bit count, except that 8 bits
+         * of priority means 7 preemption bits. We precalculate the
+         * preemption bits because it simplifies the code and makes the
+         * parallels between the virtual and physical bits of the GIC
+         * a bit clearer.
+         */
+        cs->prebits = cs->pribits;
+        if (cs->prebits == 8) {
+            cs->prebits--;
+        }
+        /*
+         * Check that CPU code defining pribits didn't violate
+         * architectural constraints our implementation relies on.
+         */
+        g_assert(cs->pribits >= 4 && cs->pribits <= 8);
+
+        /*
+         * gicv3_cpuif_reginfo[] defines ICC_AP*R0_EL1; add definitions
+         * for ICC_AP*R{1,2,3}_EL1 if the prebits value requires them.
+         */
+        if (cs->prebits >= 6) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr1_reginfo);
+        }
+        if (cs->prebits == 7) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_icc_apxr23_reginfo);
+        }
+
         if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
             int j;
 
-- 
2.25.1


