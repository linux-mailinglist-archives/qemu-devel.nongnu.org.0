Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4825431FD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:56:13 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywAO-0003nu-42
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw85-0000u7-1I
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw82-0004J2-RG
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rs0HMib3qsiBzwETeU6eF9deDOCH+0GHU6Mkq8UZpbQ=;
 b=N9kNUZCvK1B8PvKVRhYMhLRyfNvuEb2K2Pjnl0XDU2tef2T6X3HLrw5R6p5t9d2Fnvmikx
 bk102K+TDdNYDSUcruq/YqlCZ2fAOgM1tqlb4OZiG3d5Y5mxMQPsoaUDp18bAlCj5hzLU6
 WUDu3cdkDtHewmXVa5ui3KYXYHtBrBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-wJYo0bybNy-Yny1KSI7u9g-1; Wed, 08 Jun 2022 09:53:45 -0400
X-MC-Unique: wJYo0bybNy-Yny1KSI7u9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED85885A583
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59D73C28117;
 Wed,  8 Jun 2022 13:53:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 03/35] acpi: fdc-isa: replace ISADeviceClass::build_aml
 with AcpiDevAmlIfClass:build_dev_aml
Date: Wed,  8 Jun 2022 09:53:08 -0400
Message-Id: <20220608135340.3304695-4-imammedo@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
index c125939ed6..1449832aa9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -40,7 +40,6 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/isa/isa.h"
 #include "hw/input/i8042.h"
-#include "hw/block/fdc.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
-- 
2.31.1


