Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B787B1FA21E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:55:18 +0200 (CEST)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkw8T-000806-O4
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuL-00030r-Mm
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:41 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25335
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuH-0000YW-7k
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNQEvYH+4E8eKD1ARYRBp5MnaDQhBKjP6JXhiArx7NQ=;
 b=anElqyCwd3FN0jTRpdZQMu8jVHkFte2kPu8rvKPdpo16gFzYHJS4nimkbcqUxPU6v0N/Ft
 MyABLZmyVqBRXZKafgLnBWbwPyPsreY2gJzI+o4T2sLGZW0h0WS3madEZ0UApGtJvfOcm5
 qyD9rHOKG8RwKGw/AXjhL+7wkFrdcrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-BWEIcK5VPwGgGzQtRjrIlg-1; Mon, 15 Jun 2020 16:40:33 -0400
X-MC-Unique: BWEIcK5VPwGgGzQtRjrIlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB47100CCC6
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A4360CD0;
 Mon, 15 Jun 2020 20:40:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FFBA113523A; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/84] qdev: Convert to qdev_unrealize() with Coccinelle
Date: Mon, 15 Jun 2020 22:39:17 +0200
Message-Id: <20200615204008.3069956-34-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For readability, and consistency with qbus_realize().

Coccinelle script:

    @ depends on !(file in "hw/core/qdev.c")@
    typedef DeviceState;
    DeviceState *dev;
    symbol false, error_abort;
    @@
    -    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
    +    qdev_unrealize(dev);

    @ depends on !(file in "hw/core/qdev.c") && !(file in "hw/core/bus.c")@
    expression dev;
    symbol false, error_abort;
    @@
    -    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
    +    qdev_unrealize(DEVICE(dev));

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-8-armbru@redhat.com>
---
 hw/acpi/pcihp.c            | 2 +-
 hw/char/serial-pci-multi.c | 2 +-
 hw/char/serial-pci.c       | 2 +-
 hw/core/bus.c              | 3 +--
 hw/i386/pc.c               | 4 ++--
 hw/pci/pcie.c              | 2 +-
 hw/pci/shpc.c              | 2 +-
 hw/ppc/spapr.c             | 8 ++++----
 hw/ppc/spapr_pci.c         | 3 +--
 hw/s390x/css-bridge.c      | 2 +-
 hw/s390x/s390-pci-bus.c    | 4 ++--
 11 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index d42906ea19..33ea2b76ae 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -266,7 +266,7 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 {
     trace_acpi_pci_unplug(PCI_SLOT(PCI_DEVICE(dev)->devfn),
                           acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))));
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 5f9ccfcc93..23d0ebe2cd 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -56,7 +56,7 @@ static void multi_serial_pci_exit(PCIDevice *dev)
 
     for (i = 0; i < pci->ports; i++) {
         s = pci->state + i;
-        object_property_set_bool(OBJECT(s), false, "realized", &error_abort);
+        qdev_unrealize(DEVICE(s));
         memory_region_del_subregion(&pci->iobar, &s->io);
         g_free(pci->name[i]);
     }
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 37818db156..65eacfae0e 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -68,7 +68,7 @@ static void serial_pci_exit(PCIDevice *dev)
     PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
     SerialState *s = &pci->state;
 
-    object_property_set_bool(OBJECT(s), false, "realized", &error_abort);
+    qdev_unrealize(DEVICE(s));
     qemu_free_irq(s->irq);
 }
 
diff --git a/hw/core/bus.c b/hw/core/bus.c
index 6f6071f5fa..6cc28b334e 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -200,8 +200,7 @@ static void bus_set_realized(Object *obj, bool value, Error **errp)
     } else if (!value && bus->realized) {
         QTAILQ_FOREACH(kid, &bus->children, sibling) {
             DeviceState *dev = kid->child;
-            object_property_set_bool(OBJECT(dev), false, "realized",
-                                     &error_abort);
+            qdev_unrealize(dev);
         }
         if (bc->unrealize) {
             bc->unrealize(bus);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 143ac1c354..a5dd6252fa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1386,7 +1386,7 @@ static void pc_memory_unplug(HotplugHandler *hotplug_dev,
     }
 
     pc_dimm_unplug(PC_DIMM(dev), MACHINE(pcms));
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
  out:
     error_propagate(errp, local_err);
 }
@@ -1494,7 +1494,7 @@ static void pc_cpu_unplug_cb(HotplugHandler *hotplug_dev,
 
     found_cpu = pc_find_cpu_slot(MACHINE(pcms), cpu->apic_id, NULL);
     found_cpu->cpu = NULL;
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 
     /* decrement the number of CPUs */
     x86ms->boot_cpus--;
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 5b9c022d91..086d0dfceb 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -460,7 +460,7 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp)
 {
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index b76d3d2c9a..99d65d5c4c 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -547,7 +547,7 @@ void shpc_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                            Error **errp)
 {
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b1a5ed865..6a315c0dc8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3671,7 +3671,7 @@ static void spapr_memory_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
     SpaprDimmState *ds = spapr_pending_dimm_unplugs_find(spapr, PC_DIMM(dev));
 
     pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
     spapr_pending_dimm_unplugs_remove(spapr, ds);
 }
 
@@ -3764,7 +3764,7 @@ static void spapr_core_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
 
     assert(core_slot);
     core_slot->cpu = NULL;
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 static
@@ -4037,7 +4037,7 @@ void spapr_phb_release(DeviceState *dev)
 
 static void spapr_phb_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
 {
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
@@ -4073,7 +4073,7 @@ static void spapr_tpm_proxy_unplug(HotplugHandler *hotplug_dev, DeviceState *dev
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
 
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
     object_unparent(OBJECT(dev));
     spapr->tpm_proxy = NULL;
 }
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 83f1453096..329002ac04 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1587,8 +1587,7 @@ static void spapr_pci_unplug(HotplugHandler *plug_handler,
         return;
     }
 
-    object_property_set_bool(OBJECT(plugged_dev), false, "realized",
-                             &error_abort);
+    qdev_unrealize(plugged_dev);
 }
 
 static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
index 3f6aec6b6a..813bfc768a 100644
--- a/hw/s390x/css-bridge.c
+++ b/hw/s390x/css-bridge.c
@@ -54,7 +54,7 @@ static void ccw_device_unplug(HotplugHandler *hotplug_dev,
 
     css_generate_sch_crws(sch->cssid, sch->ssid, sch->schid, 1, 0);
 
-    object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+    qdev_unrealize(dev);
 }
 
 static void virtual_css_bus_reset(BusState *qbus)
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index c4a4259f0c..7a4bfb7383 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1003,7 +1003,7 @@ static void s390_pcihost_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                      pbdev->fh, pbdev->fid);
         bus = pci_get_bus(pci_dev);
         devfn = pci_dev->devfn;
-        object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+        qdev_unrealize(dev);
 
         s390_pci_msix_free(pbdev);
         s390_pci_iommu_free(s, bus, devfn);
@@ -1014,7 +1014,7 @@ static void s390_pcihost_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         pbdev->fid = 0;
         QTAILQ_REMOVE(&s->zpci_devs, pbdev, link);
         g_hash_table_remove(s->zpci_table, &pbdev->idx);
-        object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);
+        qdev_unrealize(dev);
     }
 }
 
-- 
2.26.2


