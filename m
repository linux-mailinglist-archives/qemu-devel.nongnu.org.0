Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3023600C7D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:33:08 +0200 (CEST)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQh-0006WU-GT
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG4-0005iV-Vj
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNFz-0002kR-PI
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inW6RK0GVRcBsZwoz7IOSzvjY4T2D1TizRvowriufHw=;
 b=UPabfM70vDr9UEzL3m/Rhek0iZ6tzDaU673K6pteg1iLKR4XABwXnuBBPxH3znWrFq7bE4
 Cl3qQl4j4a4+Ek1xIIQczkNl0stCJ2reOsE+weSE/lMIjbQ+BfsvxngURgLa0NdJv5Je6i
 x4EgDlu5EwQ8rjPYlYDxIcgjygXlHac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-CVuHUaEXOKykGzPZeZZDDw-1; Mon, 17 Oct 2022 06:22:01 -0400
X-MC-Unique: CVuHUaEXOKykGzPZeZZDDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4252881F46A;
 Mon, 17 Oct 2022 10:22:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C325410877;
 Mon, 17 Oct 2022 10:21:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 03/11] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML routines
 and let bus ennumeration generate AML
Date: Mon, 17 Oct 2022 12:21:38 +0200
Message-Id: <20221017102146.2254096-4-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCI-ISA bridges that are built in PIIX/Q35 are building its own AML
using AcpiDevAmlIf interface. Now build_append_pci_bus_devices()
gained AcpiDevAmlIf interface support to get AML of devices atached
to PCI slots.
So drop ad-hoc build_q35_isa_bridge()/build_piix4_isa_bridge()
and let PCI bus enumeration to include PCI-ISA bridge AML
when it's enumerated by build_append_pci_bus_devices().

AML change is mostly contextual, which moves whole ISA hierarchy
directly under PCI host bridge instead of it being described
as separate \SB.PCI0.ISA block.

Note:
If bus/slot that hosts ISA bridge has BSEL set, it will gain new
ASUN and _DMS entries (i.e. acpi-index support, but it should not
cause any functional change and that is fine from PCI Firmware
spec point of view), potentially it's possible to suppress that
by adding a flag to PCIDevice but I don't see a reason to do that
yet, I'd rather treat bridge just as any other PCI device if it's
possible.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 75 --------------------------------------------
 hw/isa/lpc_ich9.c    | 23 ++++++++++++++
 hw/isa/piix3.c       | 17 +++++++++-
 3 files changed, 39 insertions(+), 76 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 26932b4e2c..e1483bb11a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -435,10 +435,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             pc = PCI_DEVICE_GET_CLASS(pdev);
             dc = DEVICE_GET_CLASS(pdev);
 
-            if (pc->class_id == PCI_CLASS_BRIDGE_ISA) {
-                continue;
-            }
-
             /*
              * Cold plugged bridges aren't themselves hot-pluggable.
              * Hotplugged bridges *are* hot-pluggable.
@@ -1006,7 +1002,6 @@ static void build_piix4_pci0_int(Aml *table)
 {
     Aml *dev;
     Aml *crs;
-    Aml *field;
     Aml *method;
     uint32_t irqs;
     Aml *sb_scope = aml_scope("_SB");
@@ -1015,13 +1010,6 @@ static void build_piix4_pci0_int(Aml *table)
     aml_append(pci0_scope, build_prt(true));
     aml_append(sb_scope, pci0_scope);
 
-    field = aml_field("PCI0.ISA.P40C", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("PRQ0", 8));
-    aml_append(field, aml_named_field("PRQ1", 8));
-    aml_append(field, aml_named_field("PRQ2", 8));
-    aml_append(field, aml_named_field("PRQ3", 8));
-    aml_append(sb_scope, field);
-
     aml_append(sb_scope, build_irq_status_method());
     aml_append(sb_scope, build_iqcr_method(true));
 
@@ -1125,7 +1113,6 @@ static Aml *build_q35_routing_table(const char *str)
 
 static void build_q35_pci0_int(Aml *table)
 {
-    Aml *field;
     Aml *method;
     Aml *sb_scope = aml_scope("_SB");
     Aml *pci0_scope = aml_scope("PCI0");
@@ -1162,18 +1149,6 @@ static void build_q35_pci0_int(Aml *table)
     aml_append(pci0_scope, method);
     aml_append(sb_scope, pci0_scope);
 
-    field = aml_field("PCI0.ISA.PIRQ", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("PRQA", 8));
-    aml_append(field, aml_named_field("PRQB", 8));
-    aml_append(field, aml_named_field("PRQC", 8));
-    aml_append(field, aml_named_field("PRQD", 8));
-    aml_append(field, aml_reserved_field(0x20));
-    aml_append(field, aml_named_field("PRQE", 8));
-    aml_append(field, aml_named_field("PRQF", 8));
-    aml_append(field, aml_named_field("PRQG", 8));
-    aml_append(field, aml_named_field("PRQH", 8));
-    aml_append(sb_scope, field);
-
     aml_append(sb_scope, build_irq_status_method());
     aml_append(sb_scope, build_iqcr_method(false));
 
@@ -1238,54 +1213,6 @@ static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
     return dev;
 }
 
-static void build_q35_isa_bridge(Aml *table)
-{
-    Aml *dev;
-    Aml *scope;
-    Object *obj;
-    bool ambiguous;
-
-    /*
-     * temporarily fish out isa bridge, build_q35_isa_bridge() will be dropped
-     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
-     * AML for bridge itself
-     */
-    obj = object_resolve_path_type("", TYPE_ICH9_LPC_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    scope =  aml_scope("_SB.PCI0");
-    dev = aml_device("ISA");
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0x001F0000)));
-
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
-static void build_piix4_isa_bridge(Aml *table)
-{
-    Aml *dev;
-    Aml *scope;
-    Object *obj;
-    bool ambiguous;
-
-    /*
-     * temporarily fish out isa bridge, build_piix4_isa_bridge() will be dropped
-     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
-     * AML for bridge itself
-     */
-    obj = object_resolve_path_type("", TYPE_PIIX3_PCI_DEVICE, &ambiguous);
-    assert(obj && !ambiguous);
-
-    scope =  aml_scope("_SB.PCI0");
-    dev = aml_device("ISA");
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0x00010000)));
-
-    call_dev_aml_func(DEVICE(obj), dev);
-    aml_append(scope, dev);
-    aml_append(table, scope);
-}
-
 static void build_x86_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
 {
     Aml *scope;
@@ -1465,7 +1392,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        build_piix4_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
@@ -1510,7 +1436,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dsdt, sb_scope);
 
-        build_q35_isa_bridge(dsdt);
         if (pm->pcihp_bridge_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 4553b5925b..facc3745e4 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -806,6 +806,7 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
+    Aml *field;
     BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
@@ -813,6 +814,28 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     /* ICH9 PCI to ISA irq remapping */
     aml_append(scope, aml_operation_region("PIRQ", AML_PCI_CONFIG,
                                            aml_int(0x60), 0x0C));
+    /* Fields declarion has to happen *after* operation region */
+    field = aml_field("PIRQ", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("PRQA", 8));
+    aml_append(field, aml_named_field("PRQB", 8));
+    aml_append(field, aml_named_field("PRQC", 8));
+    aml_append(field, aml_named_field("PRQD", 8));
+    aml_append(field, aml_reserved_field(0x20));
+    aml_append(field, aml_named_field("PRQE", 8));
+    aml_append(field, aml_named_field("PRQF", 8));
+    aml_append(field, aml_named_field("PRQG", 8));
+    aml_append(field, aml_named_field("PRQH", 8));
+    aml_append(scope, field);
+
+    /* hack: put fields into _SB scope for LNKx to find them */
+    aml_append(scope, aml_alias("PRQA", "\\_SB.PRQA"));
+    aml_append(scope, aml_alias("PRQB", "\\_SB.PRQB"));
+    aml_append(scope, aml_alias("PRQC", "\\_SB.PRQC"));
+    aml_append(scope, aml_alias("PRQD", "\\_SB.PRQD"));
+    aml_append(scope, aml_alias("PRQE", "\\_SB.PRQE"));
+    aml_append(scope, aml_alias("PRQF", "\\_SB.PRQF"));
+    aml_append(scope, aml_alias("PRQG", "\\_SB.PRQG"));
+    aml_append(scope, aml_alias("PRQH", "\\_SB.PRQH"));
 
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
             call_dev_aml_func(DEVICE(kid->child), scope);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 48f9ab1096..d81b385e26 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -311,12 +311,27 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
+    Aml *field;
     BusChild *kid;
     BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
 
     /* PIIX PCI to ISA irq remapping */
     aml_append(scope, aml_operation_region("P40C", AML_PCI_CONFIG,
-                                         aml_int(0x60), 0x04));
+                                           aml_int(0x60), 0x04));
+    /* Fields declarion has to happen *after* operation region */
+    field = aml_field("P40C", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("PRQ0", 8));
+    aml_append(field, aml_named_field("PRQ1", 8));
+    aml_append(field, aml_named_field("PRQ2", 8));
+    aml_append(field, aml_named_field("PRQ3", 8));
+    aml_append(scope, field);
+
+    /* hack: put fields into _SB scope for LNKx to find them */
+    aml_append(scope, aml_alias("PRQ0", "\\_SB.PRQ0"));
+    aml_append(scope, aml_alias("PRQ1", "\\_SB.PRQ1"));
+    aml_append(scope, aml_alias("PRQ2", "\\_SB.PRQ2"));
+    aml_append(scope, aml_alias("PRQ3", "\\_SB.PRQ3"));
+
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         call_dev_aml_func(DEVICE(kid->child), scope);
     }
-- 
2.31.1


