Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB93C679A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:46:55 +0200 (CEST)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m36Za-00021x-Bd
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1m36VX-00042I-8B
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1m36VV-00023E-8e
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626136960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0HCpBoNKcAA90w++/KjfcQjxFc89otcFNjJEU8giek=;
 b=htZlZ1ES0xKiTva03+v/5xL3G91+i5NzXwmevYt1wZp9JCpUl6ssx/HvBtZwTEZpN/X0PY
 l8nOzDKb+26/jpRUS0IhsL5zzIhVFvFbo0f/rrA/WuJ//TELbnjSVCfS7PEPKPu4WQM7q+
 PwIqA31ZcLHGCYS+ms4ZB+LZYC4RK5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-IYI4BwdnOCCRqHYv_DPNXw-1; Mon, 12 Jul 2021 20:42:39 -0400
X-MC-Unique: IYI4BwdnOCCRqHYv_DPNXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B1E3800D62;
 Tue, 13 Jul 2021 00:42:38 +0000 (UTC)
Received: from pc-58.home (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 851695C1D1;
 Tue, 13 Jul 2021 00:42:29 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/6] hw/i386/acpi-build: Add ACPI PCI hot-plug methods to
 Q35
Date: Tue, 13 Jul 2021 02:42:00 +0200
Message-Id: <20210713004205.775386-2-jusual@redhat.com>
In-Reply-To: <20210713004205.775386-1-jusual@redhat.com>
References: <20210713004205.775386-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Igor Mammedov <imammedo@redhat.com>, David Gibson <dgibson@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement notifications and gpe to support q35 ACPI PCI hot-plug.
Use 0xcc4 - 0xcd7 range for 'acpi-pci-hotplug' io ports.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/i386/acpi-build.h    |  4 ++++
 include/hw/acpi/ich9.h  |  2 ++
 include/hw/acpi/pcihp.h |  3 ++-
 hw/acpi/pcihp.c         |  6 +++---
 hw/acpi/piix4.c         |  4 +++-
 hw/i386/acpi-build.c    | 30 +++++++++++++++++++-----------
 6 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 74df5fc612..487ec7710f 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -5,6 +5,10 @@
 
 extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 
+/* PCI Hot-plug registers bases. See docs/spec/acpi_pci_hotplug.txt */
+#define ACPI_PCIHP_SEJ_BASE 0x8
+#define ACPI_PCIHP_BNMR_BASE 0x10
+
 void acpi_setup(void);
 
 #endif
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index df519e40b5..596120d97f 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -28,6 +28,8 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/tco.h"
 
+#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
+
 typedef struct ICH9LPCPMRegs {
     /*
      * In ich9 spec says that pm1_cnt register is 32bit width and
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 2dd90aea30..af1a169fc3 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -55,7 +55,8 @@ typedef struct AcpiPciHpState {
 } AcpiPciHpState;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
-                     MemoryRegion *address_space_io, bool bridges_enabled);
+                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     uint16_t io_base);
 
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 4999277d57..d98a284b7a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -37,7 +37,6 @@
 #include "qom/qom-qobject.h"
 #include "trace.h"
 
-#define ACPI_PCIHP_ADDR 0xae00
 #define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
 #define PCI_DOWN_BASE 0x0004
@@ -488,10 +487,11 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
 };
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io, bool bridges_enabled)
+                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     uint16_t io_base)
 {
     s->io_len = ACPI_PCIHP_SIZE;
-    s->io_base = ACPI_PCIHP_ADDR;
+    s->io_base = io_base;
 
     s->root = root_bus;
     s->legacy_piix = !bridges_enabled;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0bd23d74e2..48f7a1edbc 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -49,6 +49,8 @@
 #define GPE_BASE 0xafe0
 #define GPE_LEN 4
 
+#define ACPI_PCIHP_ADDR_PIIX4 0xae00
+
 struct pci_status {
     uint32_t up; /* deprecated, maintained for migration compatibility */
     uint32_t down;
@@ -607,7 +609,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
 
     if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                        s->use_acpi_hotplug_bridge);
+                        s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
     }
 
     s->cpu_hotplug_legacy = true;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 357437ff1d..e1c246d6e8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -219,10 +219,6 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
         /* w2k requires FADT(rev1) or it won't boot, keep PC compatible */
         pm->fadt.rev = 1;
         pm->cpu_hp_io_base = PIIX4_CPU_HOTPLUG_IO_BASE;
-        pm->pcihp_io_base =
-            object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
-        pm->pcihp_io_len =
-            object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
     }
     if (lpc) {
         uint64_t smi_features = object_property_get_uint(lpc,
@@ -238,6 +234,10 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
         pm->smi_on_cpu_unplug =
             !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
     }
+    pm->pcihp_io_base =
+        object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL);
+    pm->pcihp_io_len =
+        object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
 
     /* The above need not be conditional on machine type because the reset port
      * happens to be the same on PIIX (pc) and ICH9 (q35). */
@@ -392,6 +392,9 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
         if (!pdev) {
             if (bsel) { /* add hotplug slots for non present devices */
+                if (pci_bus_is_express(bus) && slot > 0) {
+                    break;
+                }
                 dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
@@ -521,7 +524,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             QLIST_FOREACH(sec, &bus->child, sibling) {
                 int32_t devfn = sec->parent_dev->devfn;
 
-                if (pci_bus_is_root(sec) || pci_bus_is_express(sec)) {
+                if (pci_bus_is_root(sec)) {
                     continue;
                 }
 
@@ -1251,7 +1254,7 @@ static void build_piix4_isa_bridge(Aml *table)
     aml_append(table, scope);
 }
 
-static void build_piix4_pci_hotplug(Aml *table)
+static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
 {
     Aml *scope;
     Aml *field;
@@ -1260,20 +1263,22 @@ static void build_piix4_pci_hotplug(Aml *table)
     scope =  aml_scope("_SB.PCI0");
 
     aml_append(scope,
-        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(0xae00), 0x08));
+        aml_operation_region("PCST", AML_SYSTEM_IO, aml_int(pcihp_addr), 0x08));
     field = aml_field("PCST", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("PCIU", 32));
     aml_append(field, aml_named_field("PCID", 32));
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("SEJ", AML_SYSTEM_IO, aml_int(0xae08), 0x04));
+        aml_operation_region("SEJ", AML_SYSTEM_IO,
+                             aml_int(pcihp_addr + ACPI_PCIHP_SEJ_BASE), 0x04));
     field = aml_field("SEJ", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("B0EJ", 32));
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x08));
+        aml_operation_region("BNMR", AML_SYSTEM_IO,
+                             aml_int(pcihp_addr + ACPI_PCIHP_BNMR_BASE), 0x08));
     field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("BNUM", 32));
     aml_append(field, aml_named_field("PIDX", 32));
@@ -1407,7 +1412,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
-            build_piix4_pci_hotplug(dsdt);
+            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
         build_piix4_pci0_int(dsdt);
     } else {
@@ -1455,6 +1460,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
         build_q35_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
+        if (pm->pcihp_bridge_en) {
+            build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
+        }
         build_q35_pci0_int(dsdt);
         if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
             build_smb0(dsdt, pcms->smbus, ICH9_SMB_DEV, ICH9_SMB_FUNC);
@@ -1489,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     {
         aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
 
-        if (misc->is_piix4 && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
+        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
-- 
2.30.2


