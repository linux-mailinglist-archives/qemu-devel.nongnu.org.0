Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB196528AA7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:35:58 +0200 (CEST)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdhN-0004JL-Pe
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcca-0004no-BL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccX-0006JW-9C
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTBxFP6T8CGt+OurwTZhSsdcftOueklQQQ5BZqOt0TE=;
 b=XGjyX0Npfmc5qZO3xBNZ6huCf0nRml/SPRxrSFrwmohYiIPZzAjkydod3rApd9c9SoUeSH
 MY+Gh1va4i48I75lKZ3qtAtYm3QZIbm0TQOdpUo7GBWClBkdgK5cw62Co+RWRLkqFxX9ZT
 aoDMbGMU9zM9JCgf9prBKxYH+xySu5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-O5UruUlnO0KgCrIKzHY5hw-1; Mon, 16 May 2022 11:26:51 -0400
X-MC-Unique: O5UruUlnO0KgCrIKzHY5hw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE408185A7A4;
 Mon, 16 May 2022 15:26:50 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5C0E403156;
 Mon, 16 May 2022 15:26:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 28/35] acpi: pvpanic-isa: use AcpiDevAmlIfClass:build_dev_aml
 to provide device's AML
Date: Mon, 16 May 2022 11:26:03 -0400
Message-Id: <20220516152610.1963435-29-imammedo@redhat.com>
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

.. and clean up not longer needed conditionals in DSTD build code
pvpanic-isa AML will be fetched and included when ISA bridge will
build its own AML code (including attached devices).

Expected AML change:
   the device under separate _SB.PCI0.ISA scope is moved directly
   under Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/misc/pvpanic.h |  9 ---------
 hw/i386/acpi-build.c      | 37 ----------------------------------
 hw/misc/pvpanic-isa.c     | 42 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 46 deletions(-)

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 7f16cc9b16..e520566ab0 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -33,13 +33,4 @@ struct PVPanicState {
 
 void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size);
 
-static inline uint16_t pvpanic_port(void)
-{
-    Object *o = object_resolve_path_type("", TYPE_PVPANIC_ISA_DEVICE, NULL);
-    if (!o) {
-        return 0;
-    }
-    return object_property_get_uint(o, PVPANIC_IOPORT_PROP, NULL);
-}
-
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 517818cd9f..a42f41f373 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -30,7 +30,6 @@
 #include "hw/pci/pci.h"
 #include "hw/core/cpu.h"
 #include "target/i386/cpu.h"
-#include "hw/misc/pvpanic.h"
 #include "hw/timer/hpet.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
@@ -117,7 +116,6 @@ typedef struct AcpiMiscInfo {
 #endif
     const unsigned char *dsdt_code;
     unsigned dsdt_size;
-    uint16_t pvpanic_port;
 } AcpiMiscInfo;
 
 typedef struct AcpiBuildPciBusHotplugState {
@@ -302,7 +300,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
 #ifdef CONFIG_TPM
     info->tpm_version = tpm_get_version(tpm_find());
 #endif
-    info->pvpanic_port = pvpanic_port();
 }
 
 /*
@@ -1749,40 +1746,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, scope);
     }
 
-    if (misc->pvpanic_port) {
-        scope = aml_scope("\\_SB.PCI0.ISA");
-
-        dev = aml_device("PEVT");
-        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
-
-        crs = aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, misc->pvpanic_port, misc->pvpanic_port, 1, 1)
-        );
-        aml_append(dev, aml_name_decl("_CRS", crs));
-
-        aml_append(dev, aml_operation_region("PEOR", AML_SYSTEM_IO,
-                                              aml_int(misc->pvpanic_port), 1));
-        field = aml_field("PEOR", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
-        aml_append(field, aml_named_field("PEPT", 8));
-        aml_append(dev, field);
-
-        /* device present, functioning, decoding, shown in UI */
-        aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
-
-        method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
-        aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
-        aml_append(method, aml_return(aml_local(0)));
-        aml_append(dev, method);
-
-        method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
-        aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
-        aml_append(dev, method);
-
-        aml_append(scope, dev);
-        aml_append(dsdt, scope);
-    }
-
     sb_scope = aml_scope("\\_SB");
     {
         Object *pci_host;
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
index b84d4d458d..ccec50f61b 100644
--- a/hw/misc/pvpanic-isa.c
+++ b/hw/misc/pvpanic-isa.c
@@ -22,6 +22,7 @@
 #include "qom/object.h"
 #include "hw/isa/isa.h"
 #include "standard-headers/linux/pvpanic.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
 
@@ -63,6 +64,41 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
     isa_register_ioport(d, &ps->mr, s->ioport);
 }
 
+static void build_pvpanic_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    Aml *crs, *field, *method;
+    PVPanicISAState *s = PVPANIC_ISA_DEVICE(adev);
+    Aml *dev = aml_device("PEVT");
+
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
+
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_io(AML_DECODE16, s->ioport, s->ioport, 1, 1)
+    );
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    aml_append(dev, aml_operation_region("PEOR", AML_SYSTEM_IO,
+                                          aml_int(s->ioport), 1));
+    field = aml_field("PEOR", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("PEPT", 8));
+    aml_append(dev, field);
+
+    /* device present, functioning, decoding, shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
+
+    method = aml_method("RDPT", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_store(aml_name("PEPT"), aml_local(0)));
+    aml_append(method, aml_return(aml_local(0)));
+    aml_append(dev, method);
+
+    method = aml_method("WRPT", 1, AML_NOTSERIALIZED);
+    aml_append(method, aml_store(aml_arg(0), aml_name("PEPT")));
+    aml_append(dev, method);
+
+    aml_append(scope, dev);
+}
+
 static Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
     DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events,
@@ -73,10 +109,12 @@ static Property pvpanic_isa_properties[] = {
 static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = pvpanic_isa_realizefn;
     device_class_set_props(dc, pvpanic_isa_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    adevc->build_dev_aml = build_pvpanic_isa_aml;
 }
 
 static const TypeInfo pvpanic_isa_info = {
@@ -85,6 +123,10 @@ static const TypeInfo pvpanic_isa_info = {
     .instance_size = sizeof(PVPanicISAState),
     .instance_init = pvpanic_isa_initfn,
     .class_init    = pvpanic_isa_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void pvpanic_register_types(void)
-- 
2.31.1


