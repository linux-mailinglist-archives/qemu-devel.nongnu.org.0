Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CAF5289DA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:10:10 +0200 (CEST)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdIP-0000TD-3r
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc8-0003VP-CQ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc6-0006Ey-R2
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VA1M2q2+m1G3cGsivZvh5uylMWuf8sMqYAZsIP/HsHo=;
 b=Evh159X+8KcUBarYlNfFa/OsItX/WLp3dVmmON0QID/WZDZegbREhWYw0d5lm5j52KGkoz
 fvBvZlvYJejy2n25AUBd/tXJfkW0Al5MG4qV7qXxYq/LWdiLdZUMTtK4HCt+526EsvVost
 Va5EDeJ4csCAAH1nZ/Wb6aM+1O0EV8U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-ziUY6qGFPTKIixT6ATvv-g-1; Mon, 16 May 2022 11:26:22 -0400
X-MC-Unique: ziUY6qGFPTKIixT6ATvv-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C8671D33869;
 Mon, 16 May 2022 15:26:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65117492C14;
 Mon, 16 May 2022 15:26:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 07/35] acpi: pckbd: replace ISADeviceClass::build_aml with
 AcpiDevAmlIfClass:build_dev_aml
Date: Mon, 16 May 2022 11:25:42 -0400
Message-Id: <20220516152610.1963435-8-imammedo@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/input/pckbd.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 4efdf75620..45c40fe3f3 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -29,7 +29,7 @@
 #include "qapi/error.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/input/ps2.h"
 #include "hw/irq.h"
 #include "hw/input/i8042.h"
@@ -767,9 +767,9 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     qemu_register_reset(kbd_reset, s);
 }
 
-static void i8042_build_aml(ISADevice *isadev, Aml *scope)
+static void i8042_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    ISAKBDState *isa_s = I8042(isadev);
+    ISAKBDState *isa_s = I8042(adev);
     Aml *kbd;
     Aml *mou;
     Aml *crs;
@@ -807,12 +807,12 @@ static Property i8042_properties[] = {
 static void i8042_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     device_class_set_props(dc, i8042_properties);
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
-    isa->build_aml = i8042_build_aml;
+    adevc->build_dev_aml = i8042_build_aml;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
@@ -822,6 +822,10 @@ static const TypeInfo i8042_info = {
     .instance_size = sizeof(ISAKBDState),
     .instance_init = i8042_initfn,
     .class_init    = i8042_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void i8042_register_types(void)
-- 
2.31.1


