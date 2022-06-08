Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77075543239
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:10:16 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywNz-0005DG-I8
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8E-0001KP-4v
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8C-0004MN-Hp
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xA01AZkGxUg0CMtZHHhtXIKHvsiOITLMKf6i/URq3ww=;
 b=EJESMfO3/MTJPZsRtTOq4nhj8ybOMrTX5SpDKLKqFncO722HxHy44fylkgu2tC2MXV4TUG
 6J76ZFXId+8qmPF7WNLhFR1taJNDPWIKz4C+IPcsQjKFVy+YhYXmJ2YJXoot957EQgxait
 um7yyc6GDtRyFoReCG4lsFX0vvubV/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-soIBCuviMgikPmRkv9Y1Xw-1; Wed, 08 Jun 2022 09:53:46 -0400
X-MC-Unique: soIBCuviMgikPmRkv9Y1Xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D47880159B
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07E5CC28119;
 Wed,  8 Jun 2022 13:53:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 05/35] acpi: serial-is: replace ISADeviceClass::build_aml
 with AcpiDevAmlIfClass:build_dev_aml
Date: Wed,  8 Jun 2022 09:53:10 -0400
Message-Id: <20220608135340.3304695-6-imammedo@redhat.com>
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
 hw/char/serial-isa.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 7a7ed239cd..141a6cb168 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -27,7 +27,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/sysemu.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/char/serial.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -83,9 +83,9 @@ static void serial_isa_realizefn(DeviceState *dev, Error **errp)
     isa_register_ioport(isadev, &s->io, isa->iobase);
 }
 
-static void serial_isa_build_aml(ISADevice *isadev, Aml *scope)
+static void serial_isa_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    ISASerialState *isa = ISA_SERIAL(isadev);
+    ISASerialState *isa = ISA_SERIAL(adev);
     Aml *dev;
     Aml *crs;
 
@@ -122,11 +122,11 @@ static Property serial_isa_properties[] = {
 static void serial_isa_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = serial_isa_realizefn;
     dc->vmsd = &vmstate_isa_serial;
-    isa->build_aml = serial_isa_build_aml;
+    adevc->build_dev_aml = serial_isa_build_aml;
     device_class_set_props(dc, serial_isa_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
@@ -146,6 +146,10 @@ static const TypeInfo serial_isa_info = {
     .instance_size = sizeof(ISASerialState),
     .instance_init = serial_isa_initfn,
     .class_init    = serial_isa_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void serial_register_types(void)
-- 
2.31.1


