Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839951AE0F3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 17:23:14 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPSpl-00049b-KX
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 11:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ani.sinha@ani-sinha1.localdomain>)
 id 1jPSof-00038B-B0
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ani.sinha@ani-sinha1.localdomain>)
 id 1jPSoe-00012f-0T
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:22:05 -0400
Received: from [192.146.154.243] (port=45985 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ani.sinha@ani-sinha1.localdomain>)
 id 1jPSod-00012J-PI
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:22:03 -0400
Received: from ani-sinha1.localdomain (ani-sinha1.dev.nutanix.com
 [10.41.71.199])
 by mcp01.nutanix.com (Postfix) with ESMTP id 92D42102FFD8;
 Fri, 17 Apr 2020 15:13:44 +0000 (UTC)
Received: by ani-sinha1.localdomain (Postfix, from userid 16671)
 id 8D90B47C89; Fri, 17 Apr 2020 15:13:44 +0000 (UTC)
From: Ani Sinha <ani.sinha@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Add a new PIIX option to control PCI hot unplugging of
 devices on non-root buses
Date: Fri, 17 Apr 2020 15:13:31 +0000
Message-Id: <1587136411-200885-1-git-send-email-ani.sinha@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.243
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
Cc: ani.sinha@nutanix.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new option "use_acpi_unplug" is introduced for PIIX which will
selectively only disable hot unplugging of both hot plugged and
cold plugged PCI devices on non-root PCI buses. This will prevent
hot unplugging of devices from Windows based guests from system
tray but will not prevent devices from being hot plugged into the
guest.

The patch is initial version and is a rough implementation. It has
been tested on Windows guests.

Signed-off-by: Ani Sinha <ani.sinha@nutanix.com>
---
 hw/acpi/piix4.c      |  3 +++
 hw/i386/acpi-build.c | 40 ++++++++++++++++++++++++++--------------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index d706360..dad1bf4 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -82,6 +82,7 @@ typedef struct PIIX4PMState {
 
     AcpiPciHpState acpi_pci_hotplug;
     bool use_acpi_pci_hotplug;
+    bool use_acpi_unplug;
 
     uint8_t disable_s3;
     uint8_t disable_s4;
@@ -676,6 +677,8 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
     DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
                      use_acpi_pci_hotplug, true),
+    DEFINE_PROP_BOOL("acpi-pci-hotunplug-enable-bridge", PIIX4PMState,
+                     use_acpi_unplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2bc8117..526feb2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -94,6 +94,7 @@ typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
     bool pcihp_bridge_en;
+    bool pcihup_bridge_en;
     uint8_t s4_val;
     AcpiFadtData fadt;
     uint16_t cpu_hp_io_base;
@@ -220,6 +221,9 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
     pm->pcihp_bridge_en =
         object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
                                  NULL);
+    pm->pcihup_bridge_en =
+        object_property_get_bool(obj, "acpi-pci-hotunplug-enable-bridge",
+                                 NULL);
 }
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
@@ -430,7 +434,8 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
 }
 
 static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
-                                         bool pcihp_bridge_en)
+                                         bool pcihp_bridge_en,
+                                         bool pcihup_bridge_en)
 {
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
@@ -458,11 +463,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
-                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-                aml_append(method,
-                    aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-                );
-                aml_append(dev, method);
+                if (pcihup_bridge_en || pci_bus_is_root(bus)) {
+                    method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+                    aml_append(method,
+                               aml_call2("PCEJ", aml_name("BSEL"),
+                                         aml_name("_SUN"))
+                        );
+                    aml_append(dev, method);
+                }
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
@@ -516,12 +524,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             /* add _SUN/_EJ0 to make slot hotpluggable  */
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
 
-            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-            );
-            aml_append(dev, method);
-
+            if (pcihup_bridge_en || pci_bus_is_root(bus)) {
+                method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+                aml_append(method,
+                           aml_call2("PCEJ", aml_name("BSEL"),
+                                     aml_name("_SUN"))
+                    );
+                aml_append(dev, method);
+            }
             if (bsel) {
                 build_append_pcihp_notify_entry(notify_method, slot);
             }
@@ -532,7 +542,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              */
             PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
-            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
+            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en,
+                                         pcihup_bridge_en);
         }
         /* slot descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
@@ -2133,7 +2144,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         if (bus) {
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
-            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
+            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en,
+                                         pm->pcihup_bridge_en);
 
             if (TPM_IS_TIS(tpm_find())) {
                 dev = aml_device("ISA.TPM");
-- 
1.9.4


