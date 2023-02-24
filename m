Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C606A1EB0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaA0-0004ja-3n; Fri, 24 Feb 2023 10:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9w-0004X0-H3
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9u-0007bh-Eg
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xBizSihUx6UwCVNM+4R0Z2CJ+NeMTZfXF9XiUB8GWc=;
 b=OLQvle4FjO7Rm76cLd8CrJ6jWAPicnDZoloFTkmOHVaVLwE3nskI134Fpm8PniTJ7qineY
 0yjJUcaIkeLdd4yAi19N/LGsZkN2a0Uo2bWmxn4HQPAB5xnglaHGjkf6li70oSv6PrQPxE
 L0nFdD5lwjqGOknjbNhjaq73wuGV8PI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-eexgnOM9P8eqFnJamzIYXA-1; Fri, 24 Feb 2023 10:38:43 -0500
X-MC-Unique: eexgnOM9P8eqFnJamzIYXA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07A6985A5A3;
 Fri, 24 Feb 2023 15:38:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C8CE492B12;
 Fri, 24 Feb 2023 15:38:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 33/33] pcihp: add ACPI PCI hotplug specific
 is_hotpluggable_bus() callback
Date: Fri, 24 Feb 2023 16:38:12 +0100
Message-Id: <20230224153812.4176226-34-imammedo@redhat.com>
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

Provide pcihp specific callback to check if bus is hotpluggable
and consolidate its scattered hotplug criteria there.
While at it clean up no longer needed
   qbus_set_hotplug_handler(BUS(bus), NULL)
workarounds since callback makes qbus_is_hotpluggable() return
correct answer even if hotplug_handler is set on bus.

PS:
see ("pci: fix 'hotplugglable' property behavior") for details
why callback was introduced.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/ich9.h          |  1 +
 include/hw/acpi/pcihp.h         |  1 +
 hw/acpi/acpi-pci-hotplug-stub.c |  4 ++++
 hw/acpi/ich9.c                  |  6 +++++
 hw/acpi/pcihp.c                 | 42 ++++++++++++++-------------------
 hw/acpi/piix4.c                 |  8 +++++++
 hw/isa/lpc_ich9.c               |  1 +
 7 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index d41866a229..d2f980359e 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -89,6 +89,7 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                       DeviceState *dev, Error **errp);
 void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp);
+bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus);
 
 void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
 #endif /* HW_ACPI_ICH9_H */
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 04c98511a4..ef59810c17 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -58,6 +58,7 @@ typedef struct AcpiPciHpState {
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
                      MemoryRegion *address_space_io, uint16_t io_base);
 
+bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus);
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index d1794399f7..dcee3ad7a1 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -40,3 +40,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s)
     return;
 }
 
+bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
+{
+    return true;
+}
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 34a58fc07c..e625adbbab 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -582,6 +582,12 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     }
 }
 
+bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus)
+{
+    ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
+    return acpi_pcihp_is_hotpluggbale_bus(&lpc->pm.acpi_pci_hotplug, bus);
+}
+
 void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 34cad061a8..dcfb779a7a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -121,20 +121,6 @@ static void acpi_set_pci_info(bool has_bridge_hotplug)
     }
 }
 
-static void acpi_pcihp_disable_root_bus(void)
-{
-    Object *host = acpi_get_i386_pci_host();
-    PCIBus *bus;
-
-    bus = PCI_HOST_BRIDGE(host)->bus;
-    if (bus && qbus_is_hotpluggable(BUS(bus))) {
-        /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
-        qbus_set_hotplug_handler(BUS(bus), NULL);
-    }
-
-    return;
-}
-
 static void acpi_pcihp_test_hotplug_bus(PCIBus *bus, void *opaque)
 {
     AcpiPciHpFind *find = opaque;
@@ -278,9 +264,6 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
 
 void acpi_pcihp_reset(AcpiPciHpState *s)
 {
-    if (!s->use_acpi_root_pci_hotplug) {
-        acpi_pcihp_disable_root_bus();
-    }
     acpi_set_pci_info(s->use_acpi_hotplug_bridge);
     acpi_pcihp_update(s);
 }
@@ -320,13 +303,6 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
             object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
             PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
-            /* Remove all hot-plug handlers if hot-plug is disabled on slot */
-            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
-                !PCIE_SLOT(pdev)->hotplug) {
-                qbus_set_hotplug_handler(BUS(sec), NULL);
-                return;
-            }
-
             qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
             /* We don't have to overwrite any other hotplug handler yet */
             assert(QLIST_EMPTY(&sec->child));
@@ -385,6 +361,24 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
 
+bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
+{
+    Object *o = OBJECT(bus->parent);
+
+    if (s->use_acpi_hotplug_bridge &&
+        object_dynamic_cast(o, TYPE_PCI_BRIDGE)) {
+        if (object_dynamic_cast(o, TYPE_PCIE_SLOT) && !PCIE_SLOT(o)->hotplug) {
+            return false;
+        }
+        return true;
+    }
+
+    if (s->use_acpi_root_pci_hotplug) {
+        return true;
+    }
+    return false;
+}
+
 static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AcpiPciHpState *s = opaque;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a233fa95d..63d2113b86 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -404,6 +404,13 @@ static void piix4_device_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static bool piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
+                                      BusState *bus)
+{
+    PIIX4PMState *s = PIIX4_PM(hotplug_dev);
+    return acpi_pcihp_is_hotpluggbale_bus(&s->acpi_pci_hotplug, bus);
+}
+
 static void piix4_pm_machine_ready(Notifier *n, void *opaque)
 {
     PIIX4PMState *s = container_of(n, PIIX4PMState, machine_ready);
@@ -644,6 +651,7 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
     hc->plug = piix4_device_plug_cb;
     hc->unplug_request = piix4_device_unplug_request_cb;
     hc->unplug = piix4_device_unplug_cb;
+    hc->is_hotpluggable_bus = piix4_is_hotpluggable_bus;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 1fba3c210c..0e09e6b02c 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -865,6 +865,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     hc->plug = ich9_pm_device_plug_cb;
     hc->unplug_request = ich9_pm_device_unplug_request_cb;
     hc->unplug = ich9_pm_device_unplug_cb;
+    hc->is_hotpluggable_bus = ich9_pm_is_hotpluggable_bus;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
-- 
2.39.1


