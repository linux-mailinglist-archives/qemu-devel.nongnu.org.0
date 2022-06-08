Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF185543219
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:01:55 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywFu-0001lF-Se
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8J-0001dU-CN
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8H-0004No-F0
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+63IopcgdxSdv/UCGmjJQRm+0DZibSFyTsLkvH8YsGY=;
 b=dTKx9DZAWchRW/WP2at9OeT20DzGzyNpaag3XACXqq1DIh3n1g5T0N9Asmuz2GL7fmLqw1
 qWtP0ULhFu79XxTDwbpq3l3J/SzNqp0HlK58ya6WEuu/GMOqSr/1x5IwTCDznhUZ4rhzeF
 sWNhk3rJeqjkWG/95syrAS6uiWpvBjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-vZL1nWodMTOpG8dUJtLl-Q-1; Wed, 08 Jun 2022 09:53:59 -0400
X-MC-Unique: vZL1nWodMTOpG8dUJtLl-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 589D4101AA45
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:59 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8B51C27E97;
 Wed,  8 Jun 2022 13:53:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 20/35] acpi: q35: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
Date: Wed,  8 Jun 2022 09:53:25 -0400
Message-Id: <20220608135340.3304695-21-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

replaces adhoc build_isa_devices_aml() with generic AcpiDevAmlIf
way to build bridge AML including all devices that are attached
to its ISA bus.

Later when PCI is converted to AcpiDevAmlIf, build_q35_isa_bridge()
will also be dropped since PCI parts itself will take care of
building device prologue/epilogue AML for each enumerated PCI device.

Expected AML change is contextual, where ISA devices are moved from
separately declared _SB.PCI0.ISA scope, directly under Device(ISA)
node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/acpi-build.c | 30 +++++++++++-------------------
 hw/isa/lpc_ich9.c    | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f903f30b7e..f7f1671407 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -864,20 +864,6 @@ static Aml *build_vmbus_device_aml(VMBusBridge *vmbus_bridge)
     return dev;
 }
 
-static void build_isa_devices_aml(Aml *table)
-{
-    bool ambiguous;
-    Object *obj = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
-    Aml *scope;
-
-    assert(obj && !ambiguous);
-
-    scope = aml_scope("_SB.PCI0.ISA");
-    isa_build_aml(ISA_BUS(obj), scope);
-
-    aml_append(table, scope);
-}
-
 static void build_dbg_aml(Aml *table)
 {
     Aml *field;
@@ -1263,15 +1249,22 @@ static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
     Aml *scope;
+    Object *obj;
+    bool ambiguous;
+
+    /*
+     * temporarily fish out isa bridge, build_q35_isa_bridge() will be dropped
+     * once PCI is converted to AcpiDevAmlIf and would be ble to generate
+     * AML for bridge itself
+     */
+    obj = object_resolve_path_type("", TYPE_ICH9_LPC_DEVICE, &ambiguous);
+    assert(obj && !ambiguous);
 
     scope =  aml_scope("_SB.PCI0");
     dev = aml_device("ISA");
     aml_append(dev, aml_name_decl("_ADR", aml_int(0x001F0000)));
 
-    /* ICH9 PCI to ISA irq remapping */
-    aml_append(dev, aml_operation_region("PIRQ", AML_PCI_CONFIG,
-                                         aml_int(0x60), 0x0C));
-
+    call_dev_aml_func(DEVICE(obj), dev);
     aml_append(scope, dev);
     aml_append(table, scope);
 }
@@ -1531,7 +1524,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             build_hpet_aml(dsdt);
         }
         build_q35_isa_bridge(dsdt);
-        build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en) {
             build_x86_acpi_pci_hotplug(dsdt, pm->pcihp_io_base);
         }
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 5f143dca17..4553b5925b 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -50,6 +50,7 @@
 #include "hw/core/cpu.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
@@ -803,12 +804,28 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
     acpi_send_gpe_event(&s->pm.acpi_regs, s->pm.irq, ev);
 }
 
+static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    BusChild *kid;
+    ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
+    BusState *bus = BUS(s->isa_bus);
+
+    /* ICH9 PCI to ISA irq remapping */
+    aml_append(scope, aml_operation_region("PIRQ", AML_PCI_CONFIG,
+                                           aml_int(0x60), 0x0C));
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+            call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void ich9_lpc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(klass);
+    AcpiDevAmlIfClass *amldevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->reset = ich9_lpc_reset;
@@ -833,6 +850,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
+    amldevc->build_dev_aml = build_ich9_isa_aml;
 }
 
 static const TypeInfo ich9_lpc_info = {
@@ -845,6 +863,7 @@ static const TypeInfo ich9_lpc_info = {
         { TYPE_HOTPLUG_HANDLER },
         { TYPE_ACPI_DEVICE_IF },
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
-- 
2.31.1


