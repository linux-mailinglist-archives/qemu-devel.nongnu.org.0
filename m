Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5A4F981F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:34:00 +0200 (CEST)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpgV-0007IZ-Uc
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPS-00073b-0b
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPO-0002Mh-8g
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id w21so13100698wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7FBcibg4X/BLH2Q3G0Mri1MqJFY48xt240Kc+XhivMw=;
 b=DyRGq6hv3T4o8UNEdi6Zrh63TZMkXM1GXo/hCxizpX56kKmSFlRzUK+qUImpAmh0Da
 lCX/1qIAHFZgaSuGoimVCdYa/6rmev9d8mxV9BCbRaSAZ9x6VLHNsPvRt/B9xGC+Iqpx
 c/xivi1ZNWEU5h9n76f1nRcdvdPlglpSIpr6JJVdC5zNeAEK/eaoEUL4X1f/xWhS7lSt
 ydbtFvbsyO47Pr+rX1tYsGM/uh8CZjQGUOfEvfzHMAARO/TrPtI709xM80s0FwIershZ
 1AwGP/rSxQnncBkvxoPIejRC9RmHHshNmmWQGo8IscyNl4WZZHDnk1Xwkre9iPOxvJ1J
 GG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7FBcibg4X/BLH2Q3G0Mri1MqJFY48xt240Kc+XhivMw=;
 b=YbPI6hYVgKMs8nmZlNftSPAzL5O3B1sF0E5xgLw/zxXXmtD1+tYeMQsk8kzc4CvXo/
 twmBSidmLi/rhghdwVAUtlNQJv44en5sHFWJ7i8ZCbAXXXa5qQYVI5kGgIREU9b3k+xT
 Ngz2geY6CHyOGg5IFxDdqLpBgXV0Hp2C53JecyZ4Gqy+e6tSnD8Db/us4OL6O/NCVRXk
 Bn5cSQxAd2Wnr6WCTcuDLgonIcnexgOsp4+vMADC8xMxRUGdIfa6DG7qQLa8taLvWhiu
 qCEjW7hioa0tW21MK/owgJfS0J4G3T0LXOoQghgnBOh5zW/d1tb63fwC/ky56/cPaP4g
 OCrg==
X-Gm-Message-State: AOAM532WeidNuZafvRf05RneHJL+ALkDL7WPKZRLuxj3x524Ldz6iy6U
 d7AeJZ3S+kFV9A/5CHvoHAuH/UGUeys5cA==
X-Google-Smtp-Source: ABdhPJx2hC9xGFP0u5zFMOa+aTjjGaVBQZtgyClO/gzheV/i79ueez0U1CBhntMgEbEQAvPh6TuPbA==
X-Received: by 2002:adf:db4c:0:b0:206:de1:7dbb with SMTP id
 f12-20020adfdb4c000000b002060de17dbbmr14953849wrj.443.1649427376898; 
 Fri, 08 Apr 2022 07:16:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/41] hw/intc/arm_gicv3_cpuif: Support vLPIs
Date: Fri,  8 Apr 2022 15:15:34 +0100
Message-Id: <20220408141550.1271295-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPU interface changes to support vLPIs are fairly minor:
in the parts of the code that currently look at the list registers
to determine the highest priority pending virtual interrupt, we
must also look at the highest priority pending vLPI. To do this
we change hppvi_index() to check the vLPI and return a special-case
value if that is the right virtual interrupt to take. The callsites
(which handle HPPIR and IAR registers and the "raise vIRQ and vFIQ
lines" code) then have to handle this special-case value.

This commit includes two interfaces with the as-yet-unwritten
redistributor code:
 * the new GICv3CPUState::hppvlpi will be set by the redistributor
   (in the same way as the existing hpplpi does for physical LPIs)
 * when the CPU interface acknowledges a vLPI it needs to set it
   to non-pending; the new gicv3_redist_vlpi_pending() function
   (which matches the existing gicv3_redist_lpi_pending() used
   for physical LPIs) is a stub that will be filled in later

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           |  13 ++++
 include/hw/intc/arm_gicv3_common.h |   3 +
 hw/intc/arm_gicv3_common.c         |   1 +
 hw/intc/arm_gicv3_cpuif.c          | 119 +++++++++++++++++++++++++++--
 hw/intc/arm_gicv3_redist.c         |   8 ++
 hw/intc/trace-events               |   2 +-
 6 files changed, 140 insertions(+), 6 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index f25ddeca579..07644b2be6f 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -612,6 +612,19 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
  */
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
                                int doorbell, int level);
+/**
+ * gicv3_redist_vlpi_pending:
+ * @cs: GICv3CPUState
+ * @irq: (virtual) interrupt number
+ * @level: level to set @irq to
+ *
+ * Set/clear the pending status of a virtual LPI in the vLPI table
+ * that this redistributor is currently using. (The difference between
+ * this and gicv3_redist_process_vlpi() is that this is called from
+ * the cpuif and does not need to do the not-running-on-this-vcpu checks.)
+ */
+void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level);
+
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
 /**
  * gicv3_redist_update_lpi:
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 7ff5a1aa5fc..4e416100559 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -219,6 +219,9 @@ struct GICv3CPUState {
      */
     PendingIrq hpplpi;
 
+    /* Cached information recalculated from vLPI tables in guest memory */
+    PendingIrq hppvlpi;
+
     /* This is temporary working state, to avoid a malloc in gicv3_update() */
     bool seenbetter;
 };
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 14d76d74840..3f47b3501fe 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -487,6 +487,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
 
         cs->hppi.prio = 0xff;
         cs->hpplpi.prio = 0xff;
+        cs->hppvlpi.prio = 0xff;
 
         /* State in the CPU interface must *not* be reset here, because it
          * is part of the CPU's reset domain, not the GIC device's.
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 5fb64d4663c..f11863ff613 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -21,6 +21,12 @@
 #include "hw/irq.h"
 #include "cpu.h"
 
+/*
+ * Special case return value from hppvi_index(); must be larger than
+ * the architecturally maximum possible list register index (which is 15)
+ */
+#define HPPVI_INDEX_VLPI 16
+
 static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
 {
     return env->gicv3state;
@@ -157,10 +163,18 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
 
 static int hppvi_index(GICv3CPUState *cs)
 {
-    /* Return the list register index of the highest priority pending
+    /*
+     * Return the list register index of the highest priority pending
      * virtual interrupt, as per the HighestPriorityVirtualInterrupt
      * pseudocode. If no pending virtual interrupts, return -1.
+     * If the highest priority pending virtual interrupt is a vLPI,
+     * return HPPVI_INDEX_VLPI.
+     * (The pseudocode handles checking whether the vLPI is higher
+     * priority than the highest priority list register at every
+     * callsite of HighestPriorityVirtualInterrupt; we check it here.)
      */
+    ARMCPU *cpu = ARM_CPU(cs->cpu);
+    CPUARMState *env = &cpu->env;
     int idx = -1;
     int i;
     /* Note that a list register entry with a priority of 0xff will
@@ -202,6 +216,23 @@ static int hppvi_index(GICv3CPUState *cs)
         }
     }
 
+    /*
+     * "no pending vLPI" is indicated with prio = 0xff, which always
+     * fails the priority check here. vLPIs are only considered
+     * when we are in Non-Secure state.
+     */
+    if (cs->hppvlpi.prio < prio && !arm_is_secure(env)) {
+        if (cs->hppvlpi.grp == GICV3_G0) {
+            if (cs->ich_vmcr_el2 & ICH_VMCR_EL2_VENG0) {
+                return HPPVI_INDEX_VLPI;
+            }
+        } else {
+            if (cs->ich_vmcr_el2 & ICH_VMCR_EL2_VENG1) {
+                return HPPVI_INDEX_VLPI;
+            }
+        }
+    }
+
     return idx;
 }
 
@@ -289,6 +320,47 @@ static bool icv_hppi_can_preempt(GICv3CPUState *cs, uint64_t lr)
     return false;
 }
 
+static bool icv_hppvlpi_can_preempt(GICv3CPUState *cs)
+{
+    /*
+     * Return true if we can signal the highest priority pending vLPI.
+     * We can assume we're Non-secure because hppvi_index() already
+     * tested for that.
+     */
+    uint32_t mask, rprio, vpmr;
+
+    if (!(cs->ich_hcr_el2 & ICH_HCR_EL2_EN)) {
+        /* Virtual interface disabled */
+        return false;
+    }
+
+    vpmr = extract64(cs->ich_vmcr_el2, ICH_VMCR_EL2_VPMR_SHIFT,
+                     ICH_VMCR_EL2_VPMR_LENGTH);
+
+    if (cs->hppvlpi.prio >= vpmr) {
+        /* Priority mask masks this interrupt */
+        return false;
+    }
+
+    rprio = ich_highest_active_virt_prio(cs);
+    if (rprio == 0xff) {
+        /* No running interrupt so we can preempt */
+        return true;
+    }
+
+    mask = icv_gprio_mask(cs, cs->hppvlpi.grp);
+
+    /*
+     * We only preempt a running interrupt if the pending interrupt's
+     * group priority is sufficient (the subpriorities are not considered).
+     */
+    if ((cs->hppvlpi.prio & mask) < (rprio & mask)) {
+        return true;
+    }
+
+    return false;
+}
+
 static uint32_t eoi_maintenance_interrupt_state(GICv3CPUState *cs,
                                                 uint32_t *misr)
 {
@@ -386,8 +458,18 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     int fiqlevel = 0;
 
     idx = hppvi_index(cs);
-    trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
-    if (idx >= 0) {
+    trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx,
+                                  cs->hppvlpi.irq, cs->hppvlpi.grp,
+                                  cs->hppvlpi.prio);
+    if (idx == HPPVI_INDEX_VLPI) {
+        if (icv_hppvlpi_can_preempt(cs)) {
+            if (cs->hppvlpi.grp == GICV3_G0) {
+                fiqlevel = 1;
+            } else {
+                irqlevel = 1;
+            }
+        }
+    } else if (idx >= 0) {
         uint64_t lr = cs->ich_lr_el2[idx];
 
         if (icv_hppi_can_preempt(cs, lr)) {
@@ -619,7 +701,11 @@ static uint64_t icv_hppir_read(CPUARMState *env, const ARMCPRegInfo *ri)
     int idx = hppvi_index(cs);
     uint64_t value = INTID_SPURIOUS;
 
-    if (idx >= 0) {
+    if (idx == HPPVI_INDEX_VLPI) {
+        if (cs->hppvlpi.grp == grp) {
+            value = cs->hppvlpi.irq;
+        }
+    } else if (idx >= 0) {
         uint64_t lr = cs->ich_lr_el2[idx];
         int thisgrp = (lr & ICH_LR_EL2_GROUP) ? GICV3_G1NS : GICV3_G0;
 
@@ -650,6 +736,18 @@ static void icv_activate_irq(GICv3CPUState *cs, int idx, int grp)
     cs->ich_apr[grp][regno] |= (1 << regbit);
 }
 
+static void icv_activate_vlpi(GICv3CPUState *cs)
+{
+    uint32_t mask = icv_gprio_mask(cs, cs->hppvlpi.grp);
+    int prio = cs->hppvlpi.prio & mask;
+    int aprbit = prio >> (8 - cs->vprebits);
+    int regno = aprbit / 32;
+    int regbit = aprbit % 32;
+
+    cs->ich_apr[cs->hppvlpi.grp][regno] |= (1 << regbit);
+    gicv3_redist_vlpi_pending(cs, cs->hppvlpi.irq, 0);
+}
+
 static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -657,7 +755,12 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
     int idx = hppvi_index(cs);
     uint64_t intid = INTID_SPURIOUS;
 
-    if (idx >= 0) {
+    if (idx == HPPVI_INDEX_VLPI) {
+        if (cs->hppvlpi.grp == grp && icv_hppvlpi_can_preempt(cs)) {
+            intid = cs->hppvlpi.irq;
+            icv_activate_vlpi(cs);
+        }
+    } else if (idx >= 0) {
         uint64_t lr = cs->ich_lr_el2[idx];
         int thisgrp = (lr & ICH_LR_EL2_GROUP) ? GICV3_G1NS : GICV3_G0;
 
@@ -2632,6 +2735,12 @@ static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
     GICv3CPUState *cs = opaque;
 
     gicv3_cpuif_update(cs);
+    /*
+     * Because vLPIs are only pending in NonSecure state,
+     * an EL change can change the VIRQ/VFIQ status (but
+     * cannot affect the maintenance interrupt state)
+     */
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 void gicv3_init_cpuif(GICv3State *s)
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index c310d7f8ff2..3464972c139 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -855,6 +855,14 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
     gicv3_redist_update_lpi(dest);
 }
 
+void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
+{
+    /*
+     * The redistributor handling for changing the pending state
+     * of a vLPI will be added in a subsequent commit.
+     */
+}
+
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
                                int doorbell, int level)
 {
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 36c3fe4da0b..5271590304b 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -151,7 +151,7 @@ gicv3_icv_hppir_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_HPPIR%d rea
 gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu 0x%x value 0x%" PRIx64
 gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu 0x%x value 0x%" PRIx64
 gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu 0x%x value 0x%" PRIx64
-gicv3_cpuif_virt_update(uint32_t cpuid, int idx) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d"
+gicv3_cpuif_virt_update(uint32_t cpuid, int idx, int hppvlpi, int grp, int prio) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d HPPVLPI %d grp %d prio %d"
 gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d"
 gicv3_cpuif_virt_set_maint_irq(uint32_t cpuid, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting maintenance-irq %d"
 
-- 
2.25.1


