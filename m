Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872621F5605
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 15:42:00 +0200 (CEST)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj0zP-0000v3-BD
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 09:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani.sinha@ani-sinha1.localdomain>)
 id 1jj0uf-0003fT-Bb
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 09:37:05 -0400
Received: from [192.146.154.243] (port=50817 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ani.sinha@ani-sinha1.localdomain>)
 id 1jj0ue-0002NT-0w
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 09:37:04 -0400
Received: from ani-sinha1.localdomain (ani-sinha1.dev.nutanix.com
 [10.41.71.199])
 by mcp01.nutanix.com (Postfix) with ESMTP id E2C7F101242D;
 Wed, 10 Jun 2020 13:36:58 +0000 (UTC)
Received: by ani-sinha1.localdomain (Postfix, from userid 16671)
 id D8A95220A23; Wed, 10 Jun 2020 13:36:58 +0000 (UTC)
From: Ani Sinha <ani.sinha@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Rename use_acpi_pci_hotplug to more appropriate
 use_acpi_hotplug_bridge
Date: Wed, 10 Jun 2020 13:36:43 +0000
Message-Id: <1591796203-49936-1-git-send-email-ani.sinha@nutanix.com>
X-Mailer: git-send-email 1.8.3.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.146.154.243 (deferred)
Received-SPF: none client-ip=192.146.154.243;
 envelope-from=ani.sinha@ani-sinha1.localdomain; helo=mcp01.nutanix.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 09:36:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: 19
X-Spam_score: 1.9
X-Spam_bar: +
X-Spam_report: (1.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 SUBJ_OBFU_PUNCT_FEW=1, SUBJ_OBFU_PUNCT_MANY=1 autolearn=_AUTOLEARN
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
Cc: Ani Sinha <ani.sinha@nutanix.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, ani@anisinha.ca,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, the option use_acpi_pci_hotplug was being used to control device
hotplug capability using ACPI for slots of cold plugged bridges. Hence, we
are renaming this option to better reflect what it actually does.

Change-Id: I2a6ab47e80fa2bc9504ce88e063d710efaceb842
Signed-off-by: Ani Sinha <ani.sinha@nutanix.com>
---
 hw/acpi/piix4.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 85c199b..7de44bc 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -77,7 +77,7 @@ typedef struct PIIX4PMState {
     Notifier powerdown_notifier;
 
     AcpiPciHpState acpi_pci_hotplug;
-    bool use_acpi_pci_hotplug;
+    bool use_acpi_hotplug_bridge;
 
     uint8_t disable_s3;
     uint8_t disable_s4;
@@ -204,16 +204,17 @@ static const VMStateDescription vmstate_pci_status = {
     }
 };
 
-static bool vmstate_test_use_acpi_pci_hotplug(void *opaque, int version_id)
+static bool vmstate_test_use_acpi_hotplug_bridge(void *opaque, int version_id)
 {
     PIIX4PMState *s = opaque;
-    return s->use_acpi_pci_hotplug;
+    return s->use_acpi_hotplug_bridge;
 }
 
-static bool vmstate_test_no_use_acpi_pci_hotplug(void *opaque, int version_id)
+static bool vmstate_test_no_use_acpi_hotplug_bridge(void *opaque,
+                                                    int version_id)
 {
     PIIX4PMState *s = opaque;
-    return !s->use_acpi_pci_hotplug;
+    return !s->use_acpi_hotplug_bridge;
 }
 
 static bool vmstate_test_use_memhp(void *opaque)
@@ -290,11 +291,11 @@ static const VMStateDescription vmstate_acpi = {
         VMSTATE_STRUCT_TEST(
             acpi_pci_hotplug.acpi_pcihp_pci_status[ACPI_PCIHP_BSEL_DEFAULT],
             PIIX4PMState,
-            vmstate_test_no_use_acpi_pci_hotplug,
+            vmstate_test_no_use_acpi_hotplug_bridge,
             2, vmstate_pci_status,
             struct AcpiPciHpPciStatus),
         VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
-                            vmstate_test_use_acpi_pci_hotplug),
+                            vmstate_test_use_acpi_hotplug_bridge),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
@@ -528,7 +529,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s->smi_irq = smi_irq;
     s->smm_enabled = smm_enabled;
     if (xen_enabled()) {
-        s->use_acpi_pci_hotplug = false;
+        s->use_acpi_hotplug_bridge = false;
     }
 
     qdev_init_nofail(dev);
@@ -593,7 +594,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
     acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                    s->use_acpi_pci_hotplug);
+                    s->use_acpi_hotplug_bridge);
 
     s->cpu_hotplug_legacy = true;
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
@@ -631,7 +632,7 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
     DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
-                     use_acpi_pci_hotplug, true),
+                     use_acpi_hotplug_bridge, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_END_OF_LIST(),
-- 
1.9.4


