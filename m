Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAB2D6F11
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:19:27 +0100 (CET)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZtu-0008J3-4z
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq3-0005Wz-Uq; Thu, 10 Dec 2020 23:15:28 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq0-0000Vu-7o; Thu, 10 Dec 2020 23:15:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CscrZ67jtz9sWY; Fri, 11 Dec 2020 15:15:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660110;
 bh=r9GZYOFvPych2CvL1GEjt7EgTnJk/WvnutzNTlPHufw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ORcUPABHwIlWW80vCJ3t1hLFfVlHt6NfS/vX6h9ohdon4NKGGXMyDALxpLhETJN5h
 sy2dOaK8JpX4LX4jaXDC6AjGl1Y/Buz4bvgbj6aBRqaairmCKMx3kJPllks6TBTBI7
 wXrzTm80VqC/oTR3zQYVdFKM8xGSuo/7EaPOFR2Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 04/30] spapr: Do NVDIMM/PC-DIMM device hotplug sanity checks at
 pre-plug only
Date: Fri, 11 Dec 2020 15:14:41 +1100
Message-Id: <20201211041507.425378-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Pre-plug of a memory device, be it an NVDIMM or a PC-DIMM, ensures
that the memory slot is available and that addresses don't overlap
with existing memory regions. The corresponding DRCs in the LMB
and PMEM namespaces are thus necessarily attachable at plug time.

Pass &error_abort to spapr_drc_attach() in spapr_add_lmbs() and
spapr_add_nvdimm(). This allows to greatly simplify error handling
on the plug path.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201120234208.683521-3-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c                | 40 ++++++++++++-----------------------
 hw/ppc/spapr_nvdimm.c         | 11 +++++-----
 include/hw/ppc/spapr_nvdimm.h |  2 +-
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c060702013..3be27ee2cd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3382,8 +3382,8 @@ int spapr_lmb_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     return 0;
 }
 
-static bool spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
-                           bool dedicated_hp_event_source, Error **errp)
+static void spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
+                           bool dedicated_hp_event_source)
 {
     SpaprDrc *drc;
     uint32_t nr_lmbs = size/SPAPR_MEMORY_BLOCK_SIZE;
@@ -3396,15 +3396,12 @@ static bool spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
                               addr / SPAPR_MEMORY_BLOCK_SIZE);
         g_assert(drc);
 
-        if (!spapr_drc_attach(drc, dev, errp)) {
-            while (addr > addr_start) {
-                addr -= SPAPR_MEMORY_BLOCK_SIZE;
-                drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
-                                      addr / SPAPR_MEMORY_BLOCK_SIZE);
-                spapr_drc_detach(drc);
-            }
-            return false;
-        }
+        /*
+         * memory_device_get_free_addr() provided a range of free addresses
+         * that doesn't overlap with any existing mapping at pre-plug. The
+         * corresponding LMB DRCs are thus assumed to be all attachable.
+         */
+        spapr_drc_attach(drc, dev, &error_abort);
         if (!hotplugged) {
             spapr_drc_reset(drc);
         }
@@ -3425,11 +3422,9 @@ static bool spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
                                            nr_lmbs);
         }
     }
-    return true;
 }
 
-static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-                              Error **errp)
+static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
 {
     SpaprMachineState *ms = SPAPR_MACHINE(hotplug_dev);
     PCDIMMDevice *dimm = PC_DIMM(dev);
@@ -3444,24 +3439,15 @@ static void spapr_memory_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     if (!is_nvdimm) {
         addr = object_property_get_uint(OBJECT(dimm),
                                         PC_DIMM_ADDR_PROP, &error_abort);
-        if (!spapr_add_lmbs(dev, addr, size,
-                            spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT), errp)) {
-            goto out_unplug;
-        }
+        spapr_add_lmbs(dev, addr, size,
+                       spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT));
     } else {
         slot = object_property_get_int(OBJECT(dimm),
                                        PC_DIMM_SLOT_PROP, &error_abort);
         /* We should have valid slot number at this point */
         g_assert(slot >= 0);
-        if (!spapr_add_nvdimm(dev, slot, errp)) {
-            goto out_unplug;
-        }
+        spapr_add_nvdimm(dev, slot);
     }
-
-    return;
-
-out_unplug:
-    pc_dimm_unplug(dimm, MACHINE(ms));
 }
 
 static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -4009,7 +3995,7 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
                                       DeviceState *dev, Error **errp)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        spapr_memory_plug(hotplug_dev, dev, errp);
+        spapr_memory_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
         spapr_core_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index a833a63b5e..2f1c196e1b 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -89,7 +89,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
 }
 
 
-bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp)
+void spapr_add_nvdimm(DeviceState *dev, uint64_t slot)
 {
     SpaprDrc *drc;
     bool hotplugged = spapr_drc_hotplugged(dev);
@@ -97,14 +97,15 @@ bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp)
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_PMEM, slot);
     g_assert(drc);
 
-    if (!spapr_drc_attach(drc, dev, errp)) {
-        return false;
-    }
+    /*
+     * pc_dimm_get_free_slot() provided a free slot at pre-plug. The
+     * corresponding DRC is thus assumed to be attachable.
+     */
+    spapr_drc_attach(drc, dev, &error_abort);
 
     if (hotplugged) {
         spapr_hotplug_req_add_by_index(drc);
     }
-    return true;
 }
 
 static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
index 344582d2f5..73be250e2a 100644
--- a/include/hw/ppc/spapr_nvdimm.h
+++ b/include/hw/ppc/spapr_nvdimm.h
@@ -30,6 +30,6 @@ int spapr_pmem_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
 void spapr_dt_persistent_memory(SpaprMachineState *spapr, void *fdt);
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp);
-bool spapr_add_nvdimm(DeviceState *dev, uint64_t slot, Error **errp);
+void spapr_add_nvdimm(DeviceState *dev, uint64_t slot);
 
 #endif
-- 
2.29.2


