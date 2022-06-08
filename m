Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AF54325D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:21:50 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywZB-0007gz-Ji
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8G-0001Tt-BQ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8E-0004Mw-6w
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW8N/C7O4W3jW665dpkCAqTrPnPdD47RqR1xFWQHir8=;
 b=PCz0gUNDo2fjhWSL5nOepv0BxqplE5MRzlhndV6a7egSmXii5jEHpaXhcI7MaPIjLiHBnu
 3cw1NXO6uw3l9o6N/KRYUJkmITJY1fDr8Hn++shtFhH51B1JG+HJyVUUlodRiqusEEQ/5R
 grVg0bK9zK1gjOctl6o5AQc8DkwUvnw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-DPsnjQCPM5uKSbKIqasUGg-1; Wed, 08 Jun 2022 09:53:56 -0400
X-MC-Unique: DPsnjQCPM5uKSbKIqasUGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 252883C0218C
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84547C27E97;
 Wed,  8 Jun 2022 13:53:55 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 16/35] acpi: ipmi: use AcpiDevAmlIf interface to build IPMI
 device descriptors
Date: Wed,  8 Jun 2022 09:53:21 -0400
Message-Id: <20220608135340.3304695-17-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

convert ad-hoc way we use to generate AML for ISA/SMB IPMI devices
to a generic approach (i.e. make devices provide its own AML blobs
like it is done with other ISA devices (ex. KBD))

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/ipmi.h |  9 ++------
 hw/acpi/ipmi-stub.c    |  2 +-
 hw/acpi/ipmi.c         | 49 +++++++++++++-----------------------------
 hw/i386/acpi-build.c   | 17 ++++++++++-----
 hw/ipmi/isa_ipmi_bt.c  |  4 ++++
 hw/ipmi/isa_ipmi_kcs.c |  4 ++++
 hw/ipmi/smbus_ipmi.c   |  4 ++++
 7 files changed, 42 insertions(+), 47 deletions(-)

diff --git a/include/hw/acpi/ipmi.h b/include/hw/acpi/ipmi.h
index c38483565c..6c8079c97a 100644
--- a/include/hw/acpi/ipmi.h
+++ b/include/hw/acpi/ipmi.h
@@ -9,13 +9,8 @@
 #ifndef HW_ACPI_IPMI_H
 #define HW_ACPI_IPMI_H
 
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
-/*
- * Add ACPI IPMI entries for all registered IPMI devices whose parent
- * bus matches the given bus.  The resource is the ACPI resource that
- * contains the IPMI device, this is required for the I2C CRS.
- */
-void build_acpi_ipmi_devices(Aml *table, BusState *bus);
+void build_ipmi_dev_aml(AcpiDevAmlIf *adev, Aml *scope);
 
 #endif /* HW_ACPI_IPMI_H */
diff --git a/hw/acpi/ipmi-stub.c b/hw/acpi/ipmi-stub.c
index f525f71c2d..befaf0a882 100644
--- a/hw/acpi/ipmi-stub.c
+++ b/hw/acpi/ipmi-stub.c
@@ -10,6 +10,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ipmi.h"
 
-void build_acpi_ipmi_devices(Aml *table, BusState *bus)
+void build_ipmi_dev_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
 }
diff --git a/hw/acpi/ipmi.c b/hw/acpi/ipmi.c
index c30b44fcf5..a20e57d465 100644
--- a/hw/acpi/ipmi.c
+++ b/hw/acpi/ipmi.c
@@ -62,46 +62,27 @@ static Aml *aml_ipmi_crs(IPMIFwInfo *info)
     return crs;
 }
 
-static Aml *aml_ipmi_device(IPMIFwInfo *info)
+void build_ipmi_dev_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *dev;
-    uint16_t version = ((info->ipmi_spec_major_revision << 8)
-                        | (info->ipmi_spec_minor_revision << 4));
+    IPMIFwInfo info = {};
+    IPMIInterface *ii = IPMI_INTERFACE(adev);
+    IPMIInterfaceClass *iic = IPMI_INTERFACE_GET_CLASS(ii);
+    uint16_t version;
 
-    assert(info->ipmi_spec_minor_revision <= 15);
+    iic->get_fwinfo(ii, &info);
+    assert(info.ipmi_spec_minor_revision <= 15);
+    version = ((info.ipmi_spec_major_revision << 8)
+              | (info.ipmi_spec_minor_revision << 4));
 
-    dev = aml_device("MI%d", info->uuid);
+    dev = aml_device("MI%d", info.uuid);
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("IPI0001")));
     aml_append(dev, aml_name_decl("_STR", aml_string("ipmi_%s",
-                                                     info->interface_name)));
-    aml_append(dev, aml_name_decl("_UID", aml_int(info->uuid)));
-    aml_append(dev, aml_name_decl("_CRS", aml_ipmi_crs(info)));
-    aml_append(dev, aml_name_decl("_IFT", aml_int(info->interface_type)));
+                                                     info.interface_name)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(info.uuid)));
+    aml_append(dev, aml_name_decl("_CRS", aml_ipmi_crs(&info)));
+    aml_append(dev, aml_name_decl("_IFT", aml_int(info.interface_type)));
     aml_append(dev, aml_name_decl("_SRV", aml_int(version)));
 
-    return dev;
-}
-
-void build_acpi_ipmi_devices(Aml *scope, BusState *bus)
-{
-
-    BusChild *kid;
-
-    QTAILQ_FOREACH(kid, &bus->children,  sibling) {
-        IPMIInterface *ii;
-        IPMIInterfaceClass *iic;
-        IPMIFwInfo info;
-        Object *obj = object_dynamic_cast(OBJECT(kid->child),
-                                          TYPE_IPMI_INTERFACE);
-
-        if (!obj) {
-            continue;
-        }
-
-        ii = IPMI_INTERFACE(obj);
-        iic = IPMI_INTERFACE_GET_CLASS(obj);
-        memset(&info, 0, sizeof(info));
-        iic->get_fwinfo(ii, &info);
-        aml_append(scope, aml_ipmi_device(&info));
-    }
+    aml_append(scope, dev);
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 88506d563f..5b963cca32 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -39,6 +39,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/input/i8042.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "sysemu/tpm.h"
@@ -73,7 +74,6 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/virtio/virtio-iommu.h"
 
-#include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
 #include "hw/acpi/cxl.h"
@@ -873,7 +873,6 @@ static void build_isa_devices_aml(Aml *table)
     assert(obj && !ambiguous);
 
     scope = aml_scope("_SB.PCI0.ISA");
-    build_acpi_ipmi_devices(scope, BUS(obj));
     isa_build_aml(ISA_BUS(obj), scope);
 
     aml_append(table, scope);
@@ -1400,13 +1399,21 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
     return method;
 }
 
-static void build_smb0(Aml *table, I2CBus *smbus, int devnr, int func)
+static void build_smb0(Aml *table, int devnr, int func)
 {
     Aml *scope = aml_scope("_SB.PCI0");
     Aml *dev = aml_device("SMB0");
+    bool ambiguous;
+    Object *obj;
+    /*
+     * temporarily fish out device hosting SMBUS, build_smb0 will be gone once
+     * PCI enumeration will be switched to call_dev_aml_func()
+     */
+    obj = object_resolve_path_type("", TYPE_ICH9_SMB_DEVICE, &ambiguous);
+    assert(obj && !ambiguous);
 
     aml_append(dev, aml_name_decl("_ADR", aml_int(devnr << 16 | func)));
-    build_acpi_ipmi_devices(dev, BUS(smbus));
+    call_dev_aml_func(DEVICE(obj), dev);
     aml_append(scope, dev);
     aml_append(table, scope);
 }
@@ -1524,7 +1531,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
         build_q35_pci0_int(dsdt);
         if (pcms->smbus && !pcmc->do_not_add_smb_acpi) {
-            build_smb0(dsdt, pcms->smbus, ICH9_SMB_DEV, ICH9_SMB_FUNC);
+            build_smb0(dsdt, ICH9_SMB_DEV, ICH9_SMB_FUNC);
         }
     }
 
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 88aa734e9e..a83e7243d6 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "hw/acpi/ipmi.h"
 
 #define TYPE_ISA_IPMI_BT "isa-ipmi-bt"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAIPMIBTDevice, ISA_IPMI_BT)
@@ -144,6 +145,7 @@ static void isa_ipmi_bt_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(oc);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(oc);
 
     dc->realize = isa_ipmi_bt_realize;
     device_class_set_props(dc, ipmi_isa_properties);
@@ -151,6 +153,7 @@ static void isa_ipmi_bt_class_init(ObjectClass *oc, void *data)
     iic->get_backend_data = isa_ipmi_bt_get_backend_data;
     ipmi_bt_class_init(iic);
     iic->get_fwinfo = isa_ipmi_bt_get_fwinfo;
+    adevc->build_dev_aml = build_ipmi_dev_aml;
 }
 
 static const TypeInfo isa_ipmi_bt_info = {
@@ -161,6 +164,7 @@ static const TypeInfo isa_ipmi_bt_info = {
     .class_init    = isa_ipmi_bt_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_IPMI_INTERFACE },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index afabb95ebe..b2ed70b9da 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
+#include "hw/acpi/ipmi.h"
 
 #define TYPE_ISA_IPMI_KCS "isa-ipmi-kcs"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAIPMIKCSDevice, ISA_IPMI_KCS)
@@ -151,6 +152,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(oc);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(oc);
 
     dc->realize = ipmi_isa_realize;
     device_class_set_props(dc, ipmi_isa_properties);
@@ -158,6 +160,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc, void *data)
     iic->get_backend_data = isa_ipmi_kcs_get_backend_data;
     ipmi_kcs_class_init(iic);
     iic->get_fwinfo = isa_ipmi_kcs_get_fwinfo;
+    adevc->build_dev_aml = build_ipmi_dev_aml;
 }
 
 static const TypeInfo isa_ipmi_kcs_info = {
@@ -168,6 +171,7 @@ static const TypeInfo isa_ipmi_kcs_info = {
     .class_init    = isa_ipmi_kcs_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_IPMI_INTERFACE },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index 1fdf0a66b6..9ef9112dd5 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -28,6 +28,7 @@
 #include "qemu/error-report.h"
 #include "hw/ipmi/ipmi.h"
 #include "qom/object.h"
+#include "hw/acpi/ipmi.h"
 
 #define TYPE_SMBUS_IPMI "smbus-ipmi"
 OBJECT_DECLARE_SIMPLE_TYPE(SMBusIPMIDevice, SMBUS_IPMI)
@@ -353,6 +354,7 @@ static void smbus_ipmi_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     IPMIInterfaceClass *iic = IPMI_INTERFACE_CLASS(oc);
     SMBusDeviceClass *sc = SMBUS_DEVICE_CLASS(oc);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(oc);
 
     sc->receive_byte = ipmi_receive_byte;
     sc->write_data = ipmi_write_data;
@@ -363,6 +365,7 @@ static void smbus_ipmi_class_init(ObjectClass *oc, void *data)
     iic->handle_if_event = smbus_ipmi_handle_event;
     iic->set_irq_enable = smbus_ipmi_set_irq_enable;
     iic->get_fwinfo = smbus_ipmi_get_fwinfo;
+    adevc->build_dev_aml = build_ipmi_dev_aml;
 }
 
 static const TypeInfo smbus_ipmi_info = {
@@ -373,6 +376,7 @@ static const TypeInfo smbus_ipmi_info = {
     .class_init    = smbus_ipmi_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_IPMI_INTERFACE },
+        { TYPE_ACPI_DEV_AML_IF },
         { }
     }
 };
-- 
2.31.1


