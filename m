Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF5528980
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:07:53 +0200 (CEST)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdGC-0005e0-5F
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccV-0004er-2O
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccT-0006In-Ae
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPR2nT4c7wU3vfF2AGnobMnCCK9shomiV30oPvvHWKU=;
 b=b6DypXSYjJViX8GZpnLtK640bwYrh1JLlHBN+CpPZHSoM0MT/qBe8V7l45mg/9tT12JO+R
 KJMXciz6rMCtc19+wb6xLbaAcGpRv1TR0iFOw8kzxjco/xTEtfLafdG3YXvCINT6vuooox
 5StS5Wv/oTwFvAqsZA6XBeva7w3YKGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-BHu_-oAmPuWd8PHZPEnhlQ-1; Mon, 16 May 2022 11:26:45 -0400
X-MC-Unique: BHu_-oAmPuWd8PHZPEnhlQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49693866DF4;
 Mon, 16 May 2022 15:26:45 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DDF1401DBE;
 Mon, 16 May 2022 15:26:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 24/35] acpi: applesmc: use AcpiDevAmlIfClass:build_dev_aml to
 provide device's AML
Date: Mon, 16 May 2022 11:25:59 -0400
Message-Id: <20220516152610.1963435-25-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

  .. and clean up not longer needed conditionals in DSTD build
code. applesmc AML will be fetched and included when ISA bridge
will build its own AML code (incl. attached devices).

Expected AML change:
the device under separate _SB.PCI0.ISA scope is moved directly
under Device(ISA) node.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/isa/isa.h | 14 --------------
 hw/i386/acpi-build.c | 22 ----------------------
 hw/misc/applesmc.c   | 29 +++++++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 36 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 5c5a3d43a7..6f9380007d 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -16,20 +16,6 @@ OBJECT_DECLARE_TYPE(ISADevice, ISADeviceClass, ISA_DEVICE)
 #define TYPE_ISA_BUS "ISA"
 OBJECT_DECLARE_SIMPLE_TYPE(ISABus, ISA_BUS)
 
-#define TYPE_APPLE_SMC "isa-applesmc"
-#define APPLESMC_MAX_DATA_LENGTH       32
-#define APPLESMC_PROP_IO_BASE "iobase"
-
-static inline uint16_t applesmc_port(void)
-{
-    Object *obj = object_resolve_path_type("", TYPE_APPLE_SMC, NULL);
-
-    if (obj) {
-        return object_property_get_uint(obj, APPLESMC_PROP_IO_BASE, NULL);
-    }
-    return 0;
-}
-
 #define TYPE_ISADMA "isa-dma"
 
 typedef struct IsaDmaClass IsaDmaClass;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 33ee5bfcfb..517818cd9f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -118,7 +118,6 @@ typedef struct AcpiMiscInfo {
     const unsigned char *dsdt_code;
     unsigned dsdt_size;
     uint16_t pvpanic_port;
-    uint16_t applesmc_io_base;
 } AcpiMiscInfo;
 
 typedef struct AcpiBuildPciBusHotplugState {
@@ -304,7 +303,6 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
     info->tpm_version = tpm_get_version(tpm_find());
 #endif
     info->pvpanic_port = pvpanic_port();
-    info->applesmc_io_base = applesmc_port();
 }
 
 /*
@@ -1751,26 +1749,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, scope);
     }
 
-    if (misc->applesmc_io_base) {
-        scope = aml_scope("\\_SB.PCI0.ISA");
-        dev = aml_device("SMC");
-
-        aml_append(dev, aml_name_decl("_HID", aml_eisaid("APP0001")));
-        /* device present, functioning, decoding, not shown in UI */
-        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-
-        crs = aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, misc->applesmc_io_base, misc->applesmc_io_base,
-                   0x01, APPLESMC_MAX_DATA_LENGTH)
-        );
-        aml_append(crs, aml_irq_no_flags(6));
-        aml_append(dev, aml_name_decl("_CRS", crs));
-
-        aml_append(scope, dev);
-        aml_append(dsdt, scope);
-    }
-
     if (misc->pvpanic_port) {
         scope = aml_scope("\\_SB.PCI0.ISA");
 
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 81cd6b6423..5f9c742e50 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -37,10 +37,14 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 /* #define DEBUG_SMC */
 
 #define APPLESMC_DEFAULT_IOBASE        0x300
+#define TYPE_APPLE_SMC "isa-applesmc"
+#define APPLESMC_MAX_DATA_LENGTH       32
+#define APPLESMC_PROP_IO_BASE "iobase"
 
 enum {
     APPLESMC_DATA_PORT               = 0x00,
@@ -347,14 +351,35 @@ static Property applesmc_isa_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void build_applesmc_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    Aml *crs;
+    AppleSMCState *s = APPLE_SMC(adev);
+    uint32_t iobase = s->iobase;
+    Aml *dev = aml_device("SMC");
+
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("APP0001")));
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_io(AML_DECODE16, iobase, iobase, 0x01, APPLESMC_MAX_DATA_LENGTH)
+    );
+    aml_append(crs, aml_irq_no_flags(6));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void qdev_applesmc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = applesmc_isa_realize;
     dc->reset = qdev_applesmc_isa_reset;
     device_class_set_props(dc, applesmc_isa_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    adevc->build_dev_aml = build_applesmc_aml;
 }
 
 static const TypeInfo applesmc_isa_info = {
@@ -362,6 +387,10 @@ static const TypeInfo applesmc_isa_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(AppleSMCState),
     .class_init    = qdev_applesmc_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void applesmc_register_types(void)
-- 
2.31.1


