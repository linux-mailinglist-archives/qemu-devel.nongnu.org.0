Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA804F985C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:41:34 +0200 (CEST)
Received: from localhost ([::1]:53800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpnp-0006Xz-T4
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPP-00071y-Ac
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPN-0002MB-8f
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:18 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so6079971wmq.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+91rGjHM43jV+u2RiWuTQSi49T2BNr1THBEc0q/ZCAY=;
 b=IVK5GFreUo74u0JZXNImYQ/M5H2tGL8g4nawcQEIzKG0wtA3LsN0J0LHMkWOYrkPlk
 7TxkFgrQGuuTj0Z4ikQZMuSbiyJvLUWpk1HQDOwuoFq+s0pxMR5dVpCn6lCm32BbTkph
 0I8JDRpowpXBWgVe9Ie44DztzsNADUxmB0KJ5Pov4+kbhOLjFBT414t69zz0GxtGRbLp
 HmqWmy2914ULUQXri2g+meD6MbZcTVybEepKVVHff4Pk73h3t/elyQ2UIQ4WLAcXsJxT
 pVKqpxb4MTgaVs/XL485AZuDaEJjMueZMYK1gpFcywzYy9hitaTJrC2wDfQPKEeF1peL
 2okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+91rGjHM43jV+u2RiWuTQSi49T2BNr1THBEc0q/ZCAY=;
 b=lDE4GE2Mo9lMwER6FlMtMhcoIKsUZWB13O7vz2OdnjnH46X2woW5lDYgccUSEsLmFZ
 SNFsbIXpF6w1oKYWf4bAtA5JSNXIljdMSJMVWuBrgLd/CvBEJ25zY5H7cgmofontk4Uy
 s1ns6D8nOHwBRhUqAMo4PuGdDZ3KUhmHW2/7RntzVqBf9Oo8Zlj+HmW67/YdHSa3WbBM
 n8f8qfwAET9eSGhOQwusOpqR9xLL/x7hxU4sEZ9adF5hs5PpoVQh+DiiLMHb+k23M4u+
 1gw8cBfInHy5nByRKodOEyxAfioPjXNSQRaHPr2gwOy0BVpmLiIFF1z6dlfIF6UFpSIf
 gBXw==
X-Gm-Message-State: AOAM533jnhiCopTY/7hhFhfu4xpJzp+4yw7kdeIG7SsWyVZaeuSeb7JQ
 igMMLI+p411WhshTCIJ39GQeze45vwUwtw==
X-Google-Smtp-Source: ABdhPJym9UxMmdyUCAa6fTuAOCZxZZFhpSXvgfaXkZnwPwXrzZn33mRNH/KR2b6Ug8FMkp2ax0PFug==
X-Received: by 2002:a1c:6a02:0:b0:38b:3661:47f1 with SMTP id
 f2-20020a1c6a02000000b0038b366147f1mr17121608wmc.5.1649427375950; 
 Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/41] hw/intc/arm_gicv3_cpuif: Split "update vIRQ/vFIQ" from
 gicv3_cpuif_virt_update()
Date: Fri,  8 Apr 2022 15:15:33 +0100
Message-Id: <20220408141550.1271295-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function gicv3_cpuif_virt_update() currently sets all of vIRQ,
vFIQ and the maintenance interrupt.  This implies that it has to be
used quite carefully -- as the comment notes, setting the maintenance
interrupt will typically cause the GIC code to be re-entered
recursively.  For handling vLPIs, we need the redistributor to be
able to tell the cpuif to update the vIRQ and vFIQ lines when the
highest priority pending vLPI changes.  Since that change can't cause
the maintenance interrupt state to change, we can pull the "update
vIRQ/vFIQ" parts of gicv3_cpuif_virt_update() out into a separate
function, which the redistributor can then call without having to
worry about the reentrancy issue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h  | 11 +++++++
 hw/intc/arm_gicv3_cpuif.c | 64 ++++++++++++++++++++++++---------------
 hw/intc/trace-events      |  3 +-
 3 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 795bf57d2b3..f25ddeca579 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -707,6 +707,17 @@ void gicv3_init_cpuif(GICv3State *s);
  */
 void gicv3_cpuif_update(GICv3CPUState *cs);
 
+/*
+ * gicv3_cpuif_virt_irq_fiq_update:
+ * @cs: GICv3CPUState for the CPU to update
+ *
+ * Recalculate whether to assert the virtual IRQ or FIQ lines after
+ * a change to the current highest priority pending virtual interrupt.
+ * Note that this does not recalculate and change the maintenance
+ * interrupt status (for that, see gicv3_cpuif_virt_update()).
+ */
+void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs);
+
 static inline uint32_t gicv3_iidr(void)
 {
     /* Return the Implementer Identification Register value
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 1a3d440a54b..5fb64d4663c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -370,30 +370,20 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
     return value;
 }
 
-static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
+void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
 {
-    /* Tell the CPU about any pending virtual interrupts or
-     * maintenance interrupts, following a change to the state
-     * of the CPU interface relevant to virtual interrupts.
-     *
-     * CAUTION: this function will call qemu_set_irq() on the
-     * CPU maintenance IRQ line, which is typically wired up
-     * to the GIC as a per-CPU interrupt. This means that it
-     * will recursively call back into the GIC code via
-     * gicv3_redist_set_irq() and thus into the CPU interface code's
-     * gicv3_cpuif_update(). It is therefore important that this
-     * function is only called as the final action of a CPU interface
-     * register write implementation, after all the GIC state
-     * fields have been updated. gicv3_cpuif_update() also must
-     * not cause this function to be called, but that happens
-     * naturally as a result of there being no architectural
-     * linkage between the physical and virtual GIC logic.
+    /*
+     * Tell the CPU about any pending virtual interrupts.
+     * This should only be called for changes that affect the
+     * vIRQ and vFIQ status and do not change the maintenance
+     * interrupt status. This means that unlike gicv3_cpuif_virt_update()
+     * this function won't recursively call back into the GIC code.
+     * The main use of this is when the redistributor has changed the
+     * highest priority pending virtual LPI.
      */
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
-    int maintlevel = 0;
-    ARMCPU *cpu = ARM_CPU(cs->cpu);
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
@@ -410,16 +400,42 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
         }
     }
 
+    trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
+    qemu_set_irq(cs->parent_vfiq, fiqlevel);
+    qemu_set_irq(cs->parent_virq, irqlevel);
+}
+
+static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
+{
+    /*
+     * Tell the CPU about any pending virtual interrupts or
+     * maintenance interrupts, following a change to the state
+     * of the CPU interface relevant to virtual interrupts.
+     *
+     * CAUTION: this function will call qemu_set_irq() on the
+     * CPU maintenance IRQ line, which is typically wired up
+     * to the GIC as a per-CPU interrupt. This means that it
+     * will recursively call back into the GIC code via
+     * gicv3_redist_set_irq() and thus into the CPU interface code's
+     * gicv3_cpuif_update(). It is therefore important that this
+     * function is only called as the final action of a CPU interface
+     * register write implementation, after all the GIC state
+     * fields have been updated. gicv3_cpuif_update() also must
+     * not cause this function to be called, but that happens
+     * naturally as a result of there being no architectural
+     * linkage between the physical and virtual GIC logic.
+     */
+    ARMCPU *cpu = ARM_CPU(cs->cpu);
+    int maintlevel = 0;
+
+    gicv3_cpuif_virt_irq_fiq_update(cs);
+
     if ((cs->ich_hcr_el2 & ICH_HCR_EL2_EN) &&
         maintenance_interrupt_state(cs) != 0) {
         maintlevel = 1;
     }
 
-    trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel,
-                                    irqlevel, maintlevel);
-
-    qemu_set_irq(cs->parent_vfiq, fiqlevel);
-    qemu_set_irq(cs->parent_virq, irqlevel);
+    trace_gicv3_cpuif_virt_set_maint_irq(gicv3_redist_affid(cs), maintlevel);
     qemu_set_irq(cpu->gicv3_maintenance_interrupt, maintlevel);
 }
 
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 004a1006fb8..36c3fe4da0b 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -152,7 +152,8 @@ gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu 0x%x va
 gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu 0x%x value 0x%" PRIx64
 gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu 0x%x value 0x%" PRIx64
 gicv3_cpuif_virt_update(uint32_t cpuid, int idx) "GICv3 CPU i/f 0x%x virt HPPI update LR index %d"
-gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d maintenance-irq %d"
+gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting FIQ %d IRQ %d"
+gicv3_cpuif_virt_set_maint_irq(uint32_t cpuid, int maintlevel) "GICv3 CPU i/f 0x%x virt HPPI update: setting maintenance-irq %d"
 
 # arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
-- 
2.25.1


