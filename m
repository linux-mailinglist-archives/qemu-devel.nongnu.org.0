Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9037528914
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:40:57 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcq8-0005Hb-V7
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc3-0003Eh-Le
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc1-0006E7-Eb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+xkJhJTug5J+mKtJgGJl4Q6Hpkeh/30IIvzIqsRzAc=;
 b=dQC6SL4F+xgqkddVZzJXgIEtAE9RHBYCqR6hgDB5VSMyis5YOeGO1WuTzTuu8JkaX2amVb
 jzWTlbYCxY7IDuQsEZZRyNYkOL44jD8x8/lTTb+quE9tN2Is9aARzB23fuIlW3gZsDYrrR
 9LM2IDvOX+7w96UGPOxrMajfG/u/bgc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-a4KEtFx3MbeCyeeo6elL2g-1; Mon, 16 May 2022 11:26:17 -0400
X-MC-Unique: a4KEtFx3MbeCyeeo6elL2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35B5B3C322E0;
 Mon, 16 May 2022 15:26:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B614492C14;
 Mon, 16 May 2022 15:26:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 03/35] acpi: fdc-isa: replace ISADeviceClass::build_aml with
 AcpiDevAmlIfClass:build_dev_aml
Date: Mon, 16 May 2022 11:25:38 -0400
Message-Id: <20220516152610.1963435-4-imammedo@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/block/fdc-isa.c   | 16 ++++++++++------
 hw/i386/acpi-build.c |  1 -
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index fa20450747..fee1ca68a8 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -32,7 +32,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -214,9 +214,9 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0)
     return val;
 }
 
-static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
+static void build_fdc_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    FDCtrlISABus *isa = ISA_FDC(isadev);
+    FDCtrlISABus *isa = ISA_FDC(adev);
     Aml *dev;
     Aml *crs;
     int i;
@@ -241,7 +241,7 @@ static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(dev, aml_name_decl("_CRS", crs));
 
     for (i = 0; i < MIN(MAX_FD, ACPI_FDE_MAX_FD); i++) {
-        FloppyDriveType type = isa_fdc_get_drive_type(isadev, i);
+        FloppyDriveType type = isa_fdc_get_drive_type(ISA_DEVICE(adev), i);
 
         if (type < FLOPPY_DRIVE_TYPE_NONE) {
             fde_buf[i] = cpu_to_le32(1);  /* drive present */
@@ -283,14 +283,14 @@ static Property isa_fdc_properties[] = {
 static void isabus_fdc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->desc = "virtual floppy controller";
     dc->realize = isabus_fdc_realize;
     dc->fw_name = "fdc";
     dc->reset = fdctrl_external_reset_isa;
     dc->vmsd = &vmstate_isa_fdc;
-    isa->build_aml = fdc_isa_build_aml;
+    adevc->build_dev_aml = build_fdc_aml;
     device_class_set_props(dc, isa_fdc_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
@@ -313,6 +313,10 @@ static const TypeInfo isa_fdc_info = {
     .instance_size = sizeof(FDCtrlISABus),
     .class_init    = isabus_fdc_class_init,
     .instance_init = isabus_fdc_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void isa_fdc_register_types(void)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dcf6ece3d0..92455579b2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -39,7 +39,6 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
 #include "hw/input/i8042.h"
-#include "hw/block/fdc.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
-- 
2.31.1


