Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6F667447
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:04:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBQ-0002ML-R2; Thu, 12 Jan 2023 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBF-0002D8-7D
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005y4-Lq
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgf3pwVBV6YzXUJ06idJSCNWM/aWshsUDrWlCrZi4y4=;
 b=Ah2udlXxERqVrf2zhAwgHgdYLL5F/eHTJiKfgqqbXu+vZGft8lExI7kAYHUngo+UlqnN0T
 tSbsmTaVGxkcEiCHTIxU1DCJS2mivUEWKkGIfLxa1kxI8kKP1JdLwHYxlUeYAu9MaMMwgl
 4F7mA4N35lRQDsnv3O3iaGb8SVmuFbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-HXZGiNvgPPWwDvB6MR7WEg-1; Thu, 12 Jan 2023 09:03:38 -0500
X-MC-Unique: HXZGiNvgPPWwDvB6MR7WEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40E8A8030D4;
 Thu, 12 Jan 2023 14:03:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFD664085720;
 Thu, 12 Jan 2023 14:03:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 29/40] pcihp: make bridge describe itself using
 AcpiDevAmlIfClass:build_dev_aml
Date: Thu, 12 Jan 2023 15:03:01 +0100
Message-Id: <20230112140312.3096331-30-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

simplify build_append_pci_bus_devices() a bit by handling bridge
specific logic in bridge dedicated AcpiDevAmlIfClass::build_dev_aml
callback.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/pci.h     |  4 ++++
 hw/acpi/Kconfig           |  4 ++++
 hw/acpi/meson.build       |  4 +++-
 hw/acpi/pci-bridge-stub.c | 20 ++++++++++++++++++++
 hw/acpi/pci-bridge.c      | 27 +++++++++++++++++++++++++++
 hw/i386/Kconfig           |  1 +
 hw/i386/acpi-build.c      | 17 ++---------------
 hw/pci/pci_bridge.c       |  9 +++++++++
 8 files changed, 70 insertions(+), 16 deletions(-)
 create mode 100644 hw/acpi/pci-bridge-stub.c
 create mode 100644 hw/acpi/pci-bridge.c

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index b5deee0a9d..467a99461c 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -27,6 +27,7 @@
 #define HW_ACPI_PCI_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 typedef struct AcpiMcfgInfo {
     uint64_t base;
@@ -36,4 +37,7 @@ typedef struct AcpiMcfgInfo {
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
 Aml *aml_pci_device_dsm(void);
+
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
+void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 #endif
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1f7803fdab..e07d3204eb 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -39,6 +39,10 @@ config ACPI_PCIHP
     bool
     depends on ACPI
 
+config ACPI_PCI_BRIDGE
+    bool
+    depends on ACPI && PCI && ACPI_PCIHP
+
 config ACPI_HMAT
     bool
     depends on ACPI
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 30054a8cdc..50b73129b4 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -19,6 +19,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_true: files('pci-bridge.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
@@ -30,9 +31,10 @@ if have_tpm
   acpi_ss.add(files('tpm.c'))
 endif
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
                                                   'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
                                                   'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
                                                   'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c',
-                                                  'cxl-stub.c'))
+                                                  'cxl-stub.c', 'pci-bridge-stub.c'))
diff --git a/hw/acpi/pci-bridge-stub.c b/hw/acpi/pci-bridge-stub.c
new file mode 100644
index 0000000000..9d78638c48
--- /dev/null
+++ b/hw/acpi/pci-bridge-stub.c
@@ -0,0 +1,20 @@
+/*
+ * QEMU ACPI PCI bridge stub
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * Author:
+ *   Igor Mammedov <imammedo@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/pci.h"
+
+void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+}
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
new file mode 100644
index 0000000000..5f3ee5157f
--- /dev/null
+++ b/hw/acpi/pci-bridge.c
@@ -0,0 +1,27 @@
+/*
+ * QEMU ACPI PCI bridge
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * Author:
+ *   Igor Mammedov <imammedo@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/pci.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/acpi/pcihp.h"
+
+void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    PCIBridge *br = PCI_BRIDGE(adev);
+
+    if (object_property_find(OBJECT(&br->sec_bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pci_bus_devices(scope, pci_bridge_get_sec_bus(br));
+    }
+}
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index c4fb5b49bd..1bf47b0b0b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -58,6 +58,7 @@ config PC_ACPI
     select ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_PCI_BRIDGE
     select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 466f90c9e6..5b4f453395 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -385,8 +385,7 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     aml_append(method, if_ctx);
 }
 
-static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
-                                         bool pcihp_bridge_en)
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 {
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
@@ -408,7 +407,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = slot << 16 | func;
         bool hotpluggbale_slot = false;
-        bool bridge_in_acpi = false;
         bool cold_plugged_bridge = false;
 
         if (pdev) {
@@ -420,7 +418,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              */
             cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
                                   !DEVICE(pdev)->hotplugged;
-            bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
 
             hotpluggbale_slot = bsel && dc->hotpluggable &&
                                 !cold_plugged_bridge;
@@ -473,16 +470,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
         call_dev_aml_func(DEVICE(pdev), dev);
 
-        if (bridge_in_acpi) {
-            /*
-             * device is coldplugged bridge,
-             * add child device descriptions into its scope
-             */
-            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
-
-            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
-        }
-
         if (hotpluggbale_slot) {
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
             /* add _EJ0 to make slot hotpluggable  */
@@ -1706,7 +1693,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
-            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
+            build_append_pci_bus_devices(scope, bus);
             aml_append(sb_scope, scope);
         }
     }
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index a1a1cc861e..dd5af508f9 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -37,6 +37,7 @@
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "hw/acpi/pci.h"
 
 /* PCI bridge subsystem vendor ID helper functions */
 #define PCI_SSVID_SIZEOF        8
@@ -468,10 +469,18 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     return 0;
 }
 
+static void pci_bridge_class_init(ObjectClass *klass, void *data)
+{
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
+
+    adevc->build_dev_aml = build_pci_bridge_aml;
+}
+
 static const TypeInfo pci_bridge_type_info = {
     .name = TYPE_PCI_BRIDGE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBridge),
+    .class_init = pci_bridge_class_init,
     .abstract = true,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
-- 
2.31.1


