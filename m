Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02172EB898
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:46:20 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzm7-0006OI-S5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0005k6-3E; Tue, 05 Jan 2021 22:38:48 -0500
Received: from ozlabs.org ([203.11.71.1]:55041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzek-0006Jo-1A; Tue, 05 Jan 2021 22:38:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpH17wqz9sWN; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904311;
 bh=JxFAmz4WfTy/Y0ue8uwFNlRlCVlUEZHT1XU1i4WJ43I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hrT5vH5Jfq29jk+CsC46xndgY9OQsrM1Hfk4vgBLvlHqfhfYUe8C3Rz0por4tVQ5F
 6ufgUSIQNDZU/KdkwYJA8B+9WMaOR9/9ffD25xohgW5z5aIzW6aWGbbPelGEAr4knf
 lGDj7TJkUad6tW+HxjS6uyVzf72SZjnD6Eejfelc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/22] spapr: Introduce spapr_drc_reset_all()
Date: Wed,  6 Jan 2021 14:38:06 +1100
Message-Id: <20210106033816.232598-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

No need to expose the way DRCs are traversed outside of spapr_drc.c.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201218103400.689660-4-groug@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c         | 31 +++++++++++++++++++++++++++++
 hw/ppc/spapr_hcall.c       | 40 ++++++--------------------------------
 include/hw/ppc/spapr_drc.h |  6 ++++++
 3 files changed, 43 insertions(+), 34 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 5b5e2ac58a..a4d2608017 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -949,6 +949,37 @@ out:
     return ret;
 }
 
+void spapr_drc_reset_all(SpaprMachineState *spapr)
+{
+    Object *drc_container;
+    ObjectProperty *prop;
+    ObjectPropertyIterator iter;
+
+    drc_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
+restart:
+    object_property_iter_init(&iter, drc_container);
+    while ((prop = object_property_iter_next(&iter))) {
+        SpaprDrc *drc;
+
+        if (!strstart(prop->type, "link<", NULL)) {
+            continue;
+        }
+        drc = SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
+                                                          prop->name,
+                                                          &error_abort));
+
+        /*
+         * This will complete any pending plug/unplug requests.
+         * In case of a unplugged PHB or PCI bridge, this will
+         * cause some DRCs to be destroyed and thus potentially
+         * invalidate the iterator.
+         */
+        if (spapr_drc_reset(drc)) {
+            goto restart;
+        }
+    }
+}
+
 /*
  * RTAS calls
  */
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index aa22830ac4..e5dfc1ba7a 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1632,39 +1632,6 @@ static uint32_t cas_check_pvr(PowerPCCPU *cpu, uint32_t max_compat,
     return best_compat;
 }
 
-static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
-{
-    Object *drc_container;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
-
-    drc_container = container_get(object_get_root(), "/dr-connector");
-restart:
-    object_property_iter_init(&iter, drc_container);
-    while ((prop = object_property_iter_next(&iter))) {
-        SpaprDrc *drc;
-
-        if (!strstart(prop->type, "link<", NULL)) {
-            continue;
-        }
-        drc = SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
-                                                          prop->name,
-                                                          &error_abort));
-
-        /*
-         * This will complete any pending plug/unplug requests.
-         * In case of a unplugged PHB or PCI bridge, this will
-         * cause some DRCs to be destroyed and thus potentially
-         * invalidate the iterator.
-         */
-        if (spapr_drc_reset(drc)) {
-            goto restart;
-        }
-    }
-
-    spapr_clear_pending_hotplug_events(spapr);
-}
-
 target_ulong do_client_architecture_support(PowerPCCPU *cpu,
                                             SpaprMachineState *spapr,
                                             target_ulong vec,
@@ -1822,7 +1789,12 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
 
     spapr_irq_update_active_intc(spapr);
 
-    spapr_handle_transient_dev_before_cas(spapr);
+    /*
+     * Process all pending hot-plug/unplug requests now. An updated full
+     * rendered FDT will be returned to the guest.
+     */
+    spapr_drc_reset_all(spapr);
+    spapr_clear_pending_hotplug_events(spapr);
 
     /*
      * If spapr_machine_reset() did not set up a HPT but one is necessary
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 5d80019f82..8982927d5c 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -245,6 +245,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_detach(SpaprDrc *drc);
 
+/*
+ * Reset all DRCs, causing pending hot-plug/unplug requests to complete.
+ * Safely handles potential DRC removal (eg. PHBs or PCI bridges).
+ */
+void spapr_drc_reset_all(struct SpaprMachineState *spapr);
+
 static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
 {
     return drc->unplug_requested;
-- 
2.29.2


