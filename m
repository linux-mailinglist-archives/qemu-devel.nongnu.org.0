Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89420528A27
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:21:23 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdTG-0001qC-BB
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccM-0004Do-L6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccK-0006H4-Ug
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8p4Y2unT8O4CPPoDQW6eEYsedTnFbpE35skEVjG1ng=;
 b=Jng30bpG/NGGEXd6faPNmS3R+dWcuppd2cdTtLKwr53uM4jlTxHYcrdpnMEzKw9xOu/1Xb
 kJvUIfAYsKK/mtzbZhGi7hAdwMd3sHB1GntkHGKWAc1y8uOFEHTbbCIl+mJ7sJaTD3bel0
 2qa5LTsaVrMDSnoV3wkVjXj+yHMGiHY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-7p4zNvHhMMeOhv1ssRaN5Q-1; Mon, 16 May 2022 11:26:38 -0400
X-MC-Unique: 7p4zNvHhMMeOhv1ssRaN5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 843FF3802B9A;
 Mon, 16 May 2022 15:26:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C6E1492C14;
 Mon, 16 May 2022 15:26:37 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 19/35] acpi: pc: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
Date: Mon, 16 May 2022 11:25:54 -0400
Message-Id: <20220516152610.1963435-20-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

replaces ad-hoc build_isa_devices_aml() with generic AcpiDevAmlIf
way to build bridge AML including all devices that are attached to
its ISA bus.

Later when PCI is converted to AcpiDevAmlIf, build_piix4_isa_bridge()
will also be dropped since PCI parts itself will take care of
building device prologue/epilogue AML for each enumerated PCI
device.

Expected AML change is contextual, where ISA devices are moved
from separately declared _SB.PCI0.ISA scope , directly under
Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 16 +++++++++++-----
 hw/isa/piix3.c       | 17 +++++++++++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 250a7c07af..a5dd3e4fee 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1277,15 +1277,22 @@ static void build_piix4_isa_bridge(Aml *table)
 {
     Aml *dev;
     Aml *scope;
+    Object *obj;
+    bool ambiguous;
+
+    /*
+     * temporarily fish out isa bridge, build_piix4_isa_bridge() will be dropped
+     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
+     * AML for bridge itself
+     */
+    obj = object_resolve_path_type("", TYPE_PIIX3_PCI_DEVICE, &ambiguous);
+    assert(obj && !ambiguous);
 
     scope =  aml_scope("_SB.PCI0");
     dev = aml_device("ISA");
     aml_append(dev, aml_name_decl("_ADR", aml_int(0x00010000)));
 
-    /* PIIX PCI to ISA irq remapping */
-    aml_append(dev, aml_operation_region("P40C", AML_PCI_CONFIG,
-                                         aml_int(0x60), 0x04));
-
+    call_dev_aml_func(DEVICE(obj), dev);
     aml_append(scope, dev);
     aml_append(table, scope);
 }
@@ -1456,7 +1463,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_hpet_aml(dsdt);
         }
         build_piix4_isa_bridge(dsdt);
-        build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dab901c9ad..bfccd666d4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
@@ -286,10 +287,24 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     qemu_register_reset(piix3_reset, d);
 }
 
+static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    BusChild *kid;
+    BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
+
+    /* PIIX PCI to ISA irq remapping */
+    aml_append(scope, aml_operation_region("P40C", AML_PCI_CONFIG,
+                                         aml_int(0x60), 0x04));
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
@@ -304,6 +319,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    adevc->build_dev_aml = build_pci_isa_aml;
 }
 
 static const TypeInfo piix3_pci_type_info = {
@@ -314,6 +330,7 @@ static const TypeInfo piix3_pci_type_info = {
     .class_init = pci_piix3_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { TYPE_ACPI_DEV_AML_IF },
         { },
     },
 };
-- 
2.31.1


