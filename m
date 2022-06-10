Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B200545EC0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:22:21 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZuO-0003HO-3f
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWn-0007Wv-Cr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWl-0006FN-9a
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QNBEO3WCdT3rMEQ7ULvtTtzOXLRUbHLzlRkLDMuJ4gg=;
 b=iYYKVDr7WZxgDa4YCXwz6SznVbiJW17AvWMrgBadxyoAP3ryYhH6LxlgzxV3NlqvtWGNhd
 m1JKPZgwdqHD1csAR54abeigdpTQPZ2J77ZoHioxhEc2ryDly2Yi9HnuqQPC85h9QIHEzE
 HeUTGleWD4P+oEQD48AwkvdthAN5vFg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-MqiNa_H1NiCpwRWajwtSfQ-1; Fri, 10 Jun 2022 03:57:53 -0400
X-MC-Unique: MqiNa_H1NiCpwRWajwtSfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b0039c60535405so3368313wms.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QNBEO3WCdT3rMEQ7ULvtTtzOXLRUbHLzlRkLDMuJ4gg=;
 b=8CTUO27UIdRPkzuVnS2buRNWwZecvbRfFuFu0nI8T9lsdUwhmsJA/MIf0GgQEaU89X
 AyTT80kjFNOyFfzFjnZHpkekB6orE5Dfl8ACOb3NI+gDfLgOjTy66PXuR/+iBLpKdu3g
 njE8biXG2Pw+6uyuFWVoTfJIQHZ7no4hVHyLd8I4TObcarFhD0m+DrpITQhSaNBi40hJ
 YnJmx/9+XgEYVj4RV/5BXcSfcD1lFs6/uwLRfP9vI6ECLPhZM2GuJlpBTvaPfF+Ddb2d
 +aljIXFvs6U3lVf6bJBAnJ34ED9/ed+BKbaiVakfv4VnEK2ZKCxF3P7yFc7JDTqeQSaS
 is3w==
X-Gm-Message-State: AOAM532WHnat5oBZLHd+SEUjMWSNNY5Za9UUOnvu/BdyCyrQAco1UG/h
 CNnyw3EQO+3LapHyVir/RTIJtp8AacavYQ6cjq3/+DvaMUx5lbRyxytnfA2Mb9d6GwCNtV7LLkr
 nKSDdr+5mywF0Er7y3CI9gpkQP2FcaUqiCZE05NBv158HZIToBQkzdhPsDmOl
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id
 i19-20020a05600c355300b0039c63a3f54amr7606395wmq.61.1654847872067; 
 Fri, 10 Jun 2022 00:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3cQV5Mam/PQEsFudKZB8icOtKDM5la67HA7MG+pkZc565ahQFOGUSI5LMC8l7xMrRvBkNdQ==
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id
 i19-20020a05600c355300b0039c63a3f54amr7606362wmq.61.1654847871712; 
 Fri, 10 Jun 2022 00:57:51 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 i7-20020a1c3b07000000b0039744bd664esm1922335wma.13.2022.06.10.00.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:51 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Corey Minyard <minyard@acm.org>
Subject: [PULL 16/54] acpi: ipmi: use AcpiDevAmlIf interface to build IPMI
 device descriptors
Message-ID: <20220610075631.367501-17-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

convert ad-hoc way we use to generate AML for ISA/SMB IPMI devices
to a generic approach (i.e. make devices provide its own AML blobs
like it is done with other ISA devices (ex. KBD))

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-17-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


