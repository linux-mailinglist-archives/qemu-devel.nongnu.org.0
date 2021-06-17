Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5943ABCA2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:25:40 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxdz-0005Wb-92
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1ltxNQ-0004Lu-Ty
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1ltxNM-0003kP-Vs
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623956907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqQbPH4OkhB+iqHaD2sCPIJrUe0NbSQWb5bftZKHNGA=;
 b=NqG+/8tsGesoyKUlyTjvZ99ngZ3j2Urabb2d3pl4dHlOeTRAsR0mnJi/mxnsSt7poaKRhv
 eQBinFoFyz3mSNJhkEiqyv+y/zGJHm7chdHFbmbc+x0SzLBc8XR12nReR+K2tdkEuk3PrE
 7n2XFeU/pues7toCY0irOqTPkEYBnnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-mRGWBFoVMCam88LwSp7MZw-1; Thu, 17 Jun 2021 15:08:26 -0400
X-MC-Unique: mRGWBFoVMCam88LwSp7MZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0B9619324B9;
 Thu, 17 Jun 2021 19:08:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.43.2.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0795D71D;
 Thu, 17 Jun 2021 19:08:24 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/7] hw/acpi/ich9: Enable ACPI PCI hot-plug
Date: Thu, 17 Jun 2021 21:07:35 +0200
Message-Id: <20210617190739.3673064-4-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-1-jusual@redhat.com>
References: <20210617190739.3673064-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add acpi_pcihp to ich9_pm as part of
'acpi-pci-hotplug-with-bridge-support' option. Set default to false.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.h   |  1 +
 include/hw/acpi/ich9.h |  3 ++
 hw/acpi/ich9.c         | 67 ++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/pcihp.c        |  5 +++-
 hw/i386/acpi-build.c   |  2 +-
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 487ec7710f..0dce155c8c 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -10,5 +10,6 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
 void acpi_setup(void);
+Object *acpi_get_i386_pci_host(void);
 
 #endif
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 596120d97f..a329ce43ab 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -24,6 +24,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
@@ -55,6 +56,8 @@ typedef struct ICH9LPCPMRegs {
     AcpiCpuHotplug gpe_cpu;
     CPUHotplugState cpuhp_state;
 
+    bool use_acpi_hotplug_bridge;
+    AcpiPciHpState acpi_pci_hotplug;
     MemHotplugState acpi_memory_hotplug;
 
     uint8_t disable_s3;
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 4daa79ec8d..bcbd567cb0 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -217,6 +217,26 @@ static const VMStateDescription vmstate_cpuhp_state = {
     }
 };
 
+static bool vmstate_test_use_pcihp(void *opaque)
+{
+    ICH9LPCPMRegs *s = opaque;
+
+    return s->use_acpi_hotplug_bridge;
+}
+
+static const VMStateDescription vmstate_pcihp_state = {
+    .name = "ich9_pm/pcihp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vmstate_test_use_pcihp,
+    .fields      = (VMStateField[]) {
+        VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
+                            ICH9LPCPMRegs,
+                            NULL, NULL),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_ich9_pm = {
     .name = "ich9_pm",
     .version_id = 1,
@@ -238,6 +258,7 @@ const VMStateDescription vmstate_ich9_pm = {
         &vmstate_memhp_state,
         &vmstate_tco_io_state,
         &vmstate_cpuhp_state,
+        &vmstate_pcihp_state,
         NULL
     }
 };
@@ -259,6 +280,7 @@ static void pm_reset(void *opaque)
     }
     pm->smi_en_wmask = ~0;
 
+    acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
     acpi_update_sci(&pm->acpi_regs, pm->irq);
 }
 
@@ -297,6 +319,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     pm->enable_tco = true;
     acpi_pm_tco_init(&pm->tco_regs, &pm->io);
 
+    if (pm->use_acpi_hotplug_bridge) {
+        acpi_pcihp_init(OBJECT(lpc_pci),
+                        &pm->acpi_pci_hotplug,
+                        pci_get_bus(lpc_pci),
+                        pci_address_space_io(lpc_pci),
+                        true,
+                        ACPI_PCIHP_ADDR_ICH9);
+
+        qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
+                                 OBJECT(lpc_pci));
+    }
+
     pm->irq = sci_irq;
     qemu_register_reset(pm_reset, pm);
     pm->powerdown_notifier.notify = pm_powerdown_req;
@@ -368,6 +402,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool value, Error **errp)
     s->pm.enable_tco = value;
 }
 
+static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    return s->pm.use_acpi_hotplug_bridge;
+}
+
+static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    s->pm.use_acpi_hotplug_bridge = value;
+}
+
 void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 {
     static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
@@ -376,6 +424,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
+    pm->use_acpi_hotplug_bridge = false;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
@@ -399,6 +448,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
                              ich9_pm_get_enable_tco,
                              ich9_pm_set_enable_tco);
+    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
+                             ich9_pm_get_acpi_pci_hotplug,
+                             ich9_pm_set_acpi_pci_hotplug);
 }
 
 void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
@@ -406,6 +458,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
+        return;
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
         !lpc->pm.acpi_memory_hotplug.is_enabled) {
         error_setg(errp,
@@ -441,6 +498,9 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         } else {
             acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
         }
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
+                                  dev, errp);
     } else {
         error_setg(errp, "acpi: device plug request for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -473,6 +533,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 
         acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
                                    dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_request_cb(hotplug_dev,
+                                            &lpc->pm.acpi_pci_hotplug,
+                                            dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -490,6 +554,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
                !lpc->pm.cpu_hotplug_legacy) {
         acpi_cpu_unplug_cb(&lpc->pm.cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
+                                    dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index a55992ed9f..5355618608 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -30,6 +30,8 @@
 #include "hw/pci-host/i440fx.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
+#include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
 #include "migration/vmstate.h"
@@ -103,6 +105,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
 static void acpi_set_pci_info(void)
 {
     static bool bsel_is_set;
+    Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
     unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
 
@@ -111,7 +114,7 @@ static void acpi_set_pci_info(void)
     }
     bsel_is_set = true;
 
-    bus = find_i440fx(); /* TODO: Q35 support */
+    bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
         pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 67753638e4..aa973aa746 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -299,7 +299,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
  * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
  * On i386 arch we only have two pci hosts, so we can look only for them.
  */
-static Object *acpi_get_i386_pci_host(void)
+Object *acpi_get_i386_pci_host(void)
 {
     PCIHostState *host;
 
-- 
2.30.2


