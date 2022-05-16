Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5F528915
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:41:26 +0200 (CEST)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcqb-0006Rc-Uu
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc4-0003IL-NM
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc2-0006EM-Tn
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIJ+gPaG+O4QYQ3oL2OTLvYCebEpj0WQp3RdABBk0zM=;
 b=cKUNVso2zVbh65DqBtcdv+JkXeUeu2Y65dzRWKXrxGVIaxXyUpecPrWovGOYf5OX6a0K6M
 0Wu6TuJBirBZS9eiBTp9DiKsy9+fsZL76EUPphMi4JrS84yfk7G/HrBJJ2977+brYp9gti
 OhNYILutTyHcz6/EbNu95vKchPRK7Js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-7guK6eXXOkGYCGWnK9jHcw-1; Mon, 16 May 2022 11:26:18 -0400
X-MC-Unique: 7guK6eXXOkGYCGWnK9jHcw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83AF2866DFA;
 Mon, 16 May 2022 15:26:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BCA0492C14;
 Mon, 16 May 2022 15:26:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 04/35] acpi: parallel port: replace ISADeviceClass::build_aml
 with AcpiDevAmlIfClass:build_dev_aml
Date: Mon, 16 May 2022 11:25:39 -0400
Message-Id: <20220516152610.1963435-5-imammedo@redhat.com>
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
 hw/char/parallel.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index f735a6cd7f..1c9ca47820 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -28,7 +28,7 @@
 #include "qemu/module.h"
 #include "chardev/char-parallel.h"
 #include "chardev/char-fe.h"
-#include "hw/acpi/aml-build.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -570,9 +570,9 @@ static void parallel_isa_realizefn(DeviceState *dev, Error **errp)
                              s, "parallel");
 }
 
-static void parallel_isa_build_aml(ISADevice *isadev, Aml *scope)
+static void parallel_isa_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    ISAParallelState *isa = ISA_PARALLEL(isadev);
+    ISAParallelState *isa = ISA_PARALLEL(adev);
     Aml *dev;
     Aml *crs;
 
@@ -645,11 +645,11 @@ static Property parallel_isa_properties[] = {
 static void parallel_isa_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     dc->realize = parallel_isa_realizefn;
     dc->vmsd = &vmstate_parallel_isa;
-    isa->build_aml = parallel_isa_build_aml;
+    adevc->build_dev_aml = parallel_isa_build_aml;
     device_class_set_props(dc, parallel_isa_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
@@ -659,6 +659,10 @@ static const TypeInfo parallel_isa_info = {
     .parent        = TYPE_ISA_DEVICE,
     .instance_size = sizeof(ISAParallelState),
     .class_init    = parallel_isa_class_initfn,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void parallel_register_types(void)
-- 
2.31.1


