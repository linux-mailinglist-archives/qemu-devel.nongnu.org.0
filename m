Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5442D9257
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:00:03 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kofxq-00072y-Id
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwL-00058S-GG; Sun, 13 Dec 2020 23:58:30 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46495 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwJ-0004pE-Bo; Sun, 13 Dec 2020 23:58:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfq4Y25z9sTL; Mon, 14 Dec 2020 15:58:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921891;
 bh=F0jSsdGyYByMsykK6rCrRY1J+iF6rlo4QopkfvQhxMM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p09umch0eGWIf4wVQBTY+dRKANdI7JJB4IFUuMME+pT2r1i8ZmcaL0MDiulgKEKC/
 zTdU4Hwx8hRU7It8BlZ2WEpntje+5JQISDjom5Hs9aLx37le0yjCEniBx8x9vGErph
 oCLlYtB0OXso2dJoeu4Mctwn0Xs6FP8I7NFwz7Qs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 05/30] spapr: Make PHB placement functions and
 spapr_pre_plug_phb() return status
Date: Mon, 14 Dec 2020 15:57:42 +1100
Message-Id: <20201214045807.41003-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Read documentation in "qapi/error.h" and changelog of commit
e3fe3988d785 ("error: Document Error API usage rules") for
rationale.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201120234208.683521-7-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 40 +++++++++++++++++++++++-----------------
 include/hw/ppc/spapr.h |  2 +-
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9489c57213..28d266f7a7 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3879,7 +3879,7 @@ int spapr_phb_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     return 0;
 }
 
-static void spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+static bool spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
@@ -3889,24 +3889,25 @@ static void spapr_phb_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     if (dev->hotplugged && !smc->dr_phb_enabled) {
         error_setg(errp, "PHB hotplug not supported for this machine");
-        return;
+        return false;
     }
 
     if (sphb->index == (uint32_t)-1) {
         error_setg(errp, "\"index\" for PAPR PHB is mandatory");
-        return;
+        return false;
     }
 
     /*
      * This will check that sphb->index doesn't exceed the maximum number of
      * PHBs for the current machine type.
      */
-    smc->phb_placement(spapr, sphb->index,
-                       &sphb->buid, &sphb->io_win_addr,
-                       &sphb->mem_win_addr, &sphb->mem64_win_addr,
-                       windows_supported, sphb->dma_liobn,
-                       &sphb->nv2_gpa_win_addr, &sphb->nv2_atsd_win_addr,
-                       errp);
+    return
+        smc->phb_placement(spapr, sphb->index,
+                           &sphb->buid, &sphb->io_win_addr,
+                           &sphb->mem_win_addr, &sphb->mem64_win_addr,
+                           windows_supported, sphb->dma_liobn,
+                           &sphb->nv2_gpa_win_addr, &sphb->nv2_atsd_win_addr,
+                           errp);
 }
 
 static void spapr_phb_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -4144,7 +4145,7 @@ static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
     return machine->possible_cpus;
 }
 
-static void spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
+static bool spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
                                 uint64_t *buid, hwaddr *pio,
                                 hwaddr *mmio32, hwaddr *mmio64,
                                 unsigned n_dma, uint32_t *liobns,
@@ -4182,7 +4183,7 @@ static void spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
     if (index >= SPAPR_MAX_PHBS) {
         error_setg(errp, "\"index\" for PAPR PHB is too large (max %llu)",
                    SPAPR_MAX_PHBS - 1);
-        return;
+        return false;
     }
 
     *buid = base_buid + index;
@@ -4196,6 +4197,7 @@ static void spapr_phb_placement(SpaprMachineState *spapr, uint32_t index,
 
     *nv2gpa = SPAPR_PCI_NV2RAM64_WIN_BASE + index * SPAPR_PCI_NV2RAM64_WIN_SIZE;
     *nv2atsd = SPAPR_PCI_NV2ATSD_WIN_BASE + index * SPAPR_PCI_NV2ATSD_WIN_SIZE;
+    return true;
 }
 
 static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
@@ -4586,18 +4588,21 @@ DEFINE_SPAPR_MACHINE(4_1, "4.1", false);
 /*
  * pseries-4.0
  */
-static void phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
+static bool phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
                               uint64_t *buid, hwaddr *pio,
                               hwaddr *mmio32, hwaddr *mmio64,
                               unsigned n_dma, uint32_t *liobns,
                               hwaddr *nv2gpa, hwaddr *nv2atsd, Error **errp)
 {
-    spapr_phb_placement(spapr, index, buid, pio, mmio32, mmio64, n_dma, liobns,
-                        nv2gpa, nv2atsd, errp);
+    if (!spapr_phb_placement(spapr, index, buid, pio, mmio32, mmio64, n_dma,
+                             liobns, nv2gpa, nv2atsd, errp)) {
+        return false;
+    }
+
     *nv2gpa = 0;
     *nv2atsd = 0;
+    return true;
 }
-
 static void spapr_machine_4_0_class_options(MachineClass *mc)
 {
     SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4757,7 +4762,7 @@ DEFINE_SPAPR_MACHINE(2_8, "2.8", false);
  * pseries-2.7
  */
 
-static void phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
+static bool phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
                               uint64_t *buid, hwaddr *pio,
                               hwaddr *mmio32, hwaddr *mmio64,
                               unsigned n_dma, uint32_t *liobns,
@@ -4789,7 +4794,7 @@ static void phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
     if (index > max_index) {
         error_setg(errp, "\"index\" for PAPR PHB is too large (max %u)",
                    max_index);
-        return;
+        return false;
     }
 
     *buid = base_buid + index;
@@ -4808,6 +4813,7 @@ static void phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
 
     *nv2gpa = 0;
     *nv2atsd = 0;
+    return true;
 }
 
 static void spapr_machine_2_7_class_options(MachineClass *mc)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 2e89e36cfb..b7ced9faeb 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -140,7 +140,7 @@ struct SpaprMachineClass {
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
 
-    void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
+    bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio, 
                           hwaddr *mmio32, hwaddr *mmio64,
                           unsigned n_dma, uint32_t *liobns, hwaddr *nv2gpa,
-- 
2.29.2


