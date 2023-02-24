Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DC6A1EBD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:41:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9z-0004ec-0X; Fri, 24 Feb 2023 10:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9w-0004Wk-8B
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9u-0007bU-AR
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swPzOjD3SkgbUEUATwtqH8Mpp/dMl1FGlfl7zsy6vks=;
 b=drwbsvtUr1UtvmA0K4oexmgUnfMhl+yppWdxkXze6QLWv60sYhDjz9McR2aN53E4J2r8uH
 RMruKiAeGQJK4q4baguUb6/9GTGMY0E1WDNhm3I/qJ+LlE/vSdfIm1V766qDAp7RJMeiQU
 ra9HZnxavWl0kpyuWSuAi4+nJW9V8sA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-l-GW1AatM96IZc9jLDQA0g-1; Fri, 24 Feb 2023 10:38:39 -0500
X-MC-Unique: l-GW1AatM96IZc9jLDQA0g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3603806102;
 Fri, 24 Feb 2023 15:38:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20894492B15;
 Fri, 24 Feb 2023 15:38:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 28/33] pci: move acpi-index uniqueness check to generic PCI
 device code
Date: Fri, 24 Feb 2023 16:38:07 +0100
Message-Id: <20230224153812.4176226-29-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

acpi-index is now working with non-hotpluggable buses
(pci/q35 machine hostbridge), it can be used even if
ACPI PCI hotplug is disabled and as result acpi-index
uniqueness check will be omitted (since the check is
done by ACPI PCI hotplug handler, which isn't wired
when ACPI PCI hotplug is disabled).
Move check and related code to generic PCIDevice so it
would be independent of ACPI PCI hotplug.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS: this also one step closer to enabling acpi-index
support for microvm and virt/arm machines.
---
 hw/acpi/pcihp.c | 56 ------------------------------------------------
 hw/pci/pci.c    | 57 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 5dc7377411..adf45e8443 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -54,21 +54,6 @@ typedef struct AcpiPciHpFind {
     PCIBus *bus;
 } AcpiPciHpFind;
 
-static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
-{
-    return a - b;
-}
-
-static GSequence *pci_acpi_index_list(void)
-{
-    static GSequence *used_acpi_index_list;
-
-    if (!used_acpi_index_list) {
-        used_acpi_index_list = g_sequence_new(NULL);
-    }
-    return used_acpi_index_list;
-}
-
 static int acpi_pcihp_get_bsel(PCIBus *bus)
 {
     Error *local_err = NULL;
@@ -300,8 +285,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
     acpi_pcihp_update(s);
 }
 
-#define ONBOARD_INDEX_MAX (16 * 1024 - 1)
-
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
@@ -314,34 +297,6 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                    ACPI_PCIHP_PROP_BSEL "' set");
         return;
     }
-
-    /*
-     * capped by systemd (see: udev-builtin-net_id.c)
-     * as it's the only known user honor it to avoid users
-     * misconfigure QEMU and then wonder why acpi-index doesn't work
-     */
-    if (pdev->acpi_index > ONBOARD_INDEX_MAX) {
-        error_setg(errp, "acpi-index should be less or equal to %u",
-                   ONBOARD_INDEX_MAX);
-        return;
-    }
-
-    /*
-     * make sure that acpi-index is unique across all present PCI devices
-     */
-    if (pdev->acpi_index) {
-        GSequence *used_indexes = pci_acpi_index_list();
-
-        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
-                              g_cmp_uint32, NULL)) {
-            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
-                       " already exist", pdev->acpi_index);
-            return;
-        }
-        g_sequence_insert_sorted(used_indexes,
-                                 GINT_TO_POINTER(pdev->acpi_index),
-                                 g_cmp_uint32, NULL);
-    }
 }
 
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
@@ -401,17 +356,6 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
     trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
                           acpi_pcihp_get_bsel(pci_get_bus(pdev)));
 
-    /*
-     * clean up acpi-index so it could reused by another device
-     */
-    if (pdev->acpi_index) {
-        GSequence *used_indexes = pci_acpi_index_list();
-
-        g_sequence_remove(g_sequence_lookup(used_indexes,
-                          GINT_TO_POINTER(pdev->acpi_index),
-                          g_cmp_uint32, NULL));
-    }
-
     qdev_unrealize(dev);
 }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index cc51f98593..d9be0cfca6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -92,6 +92,21 @@ static const VMStateDescription vmstate_pcibus = {
     }
 };
 
+static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    return a - b;
+}
+
+static GSequence *pci_acpi_index_list(void)
+{
+    static GSequence *used_acpi_index_list;
+
+    if (!used_acpi_index_list) {
+        used_acpi_index_list = g_sequence_new(NULL);
+    }
+    return used_acpi_index_list;
+}
+
 static void pci_init_bus_master(PCIDevice *pci_dev)
 {
     AddressSpace *dma_as = pci_device_iommu_address_space(pci_dev);
@@ -1225,6 +1240,17 @@ static void pci_qdev_unrealize(DeviceState *dev)
     do_pci_unregister_device(pci_dev);
 
     pci_dev->msi_trigger = NULL;
+
+    /*
+     * clean up acpi-index so it could reused by another device
+     */
+    if (pci_dev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        g_sequence_remove(g_sequence_lookup(used_indexes,
+                          GINT_TO_POINTER(pci_dev->acpi_index),
+                          g_cmp_uint32, NULL));
+    }
 }
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -1980,6 +2006,8 @@ PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
     return bus->devices[devfn];
 }
 
+#define ONBOARD_INDEX_MAX (16 * 1024 - 1)
+
 static void pci_qdev_realize(DeviceState *qdev, Error **errp)
 {
     PCIDevice *pci_dev = (PCIDevice *)qdev;
@@ -1989,6 +2017,35 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
     bool is_default_rom;
     uint16_t class_id;
 
+    /*
+     * capped by systemd (see: udev-builtin-net_id.c)
+     * as it's the only known user honor it to avoid users
+     * misconfigure QEMU and then wonder why acpi-index doesn't work
+     */
+    if (pci_dev->acpi_index > ONBOARD_INDEX_MAX) {
+        error_setg(errp, "acpi-index should be less or equal to %u",
+                   ONBOARD_INDEX_MAX);
+        return;
+    }
+
+    /*
+     * make sure that acpi-index is unique across all present PCI devices
+     */
+    if (pci_dev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        if (g_sequence_lookup(used_indexes,
+                              GINT_TO_POINTER(pci_dev->acpi_index),
+                              g_cmp_uint32, NULL)) {
+            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
+                       " already exist", pci_dev->acpi_index);
+            return;
+        }
+        g_sequence_insert_sorted(used_indexes,
+                                 GINT_TO_POINTER(pci_dev->acpi_index),
+                                 g_cmp_uint32, NULL);
+    }
+
     if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
         error_setg(errp, "ROM size %u is not a power of two", pci_dev->romsize);
         return;
-- 
2.39.1


