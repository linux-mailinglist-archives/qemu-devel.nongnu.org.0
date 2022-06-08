Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D585431FC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:56:10 +0200 (CEST)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywAK-0003cU-HJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw84-0000ts-J3
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw81-0004Iy-Pf
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw7AypASA3yNSoKszlk1I0+29Y2t8m8PXqRjBxO88dk=;
 b=Usjd1viDUuhnP0PumSwUP+HeN7VzWSyLl90E30jOHVpvOnQzsl0tdlcnisfnQ72ndWa+qS
 HXM1vrAITO8KHu6H96cwXtWw2pdSs8H8IPuNLZWWJKeP1t56uw+xG4dXNw9xrev9VKabnd
 6ucc2hlLfxEEdpfdMtBYYwGcAFt7R8k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-uC_DKfssMeuCesG0WH67FQ-1; Wed, 08 Jun 2022 09:53:43 -0400
X-MC-Unique: uC_DKfssMeuCesG0WH67FQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3042B1C0512F
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CEE3C27E97;
 Wed,  8 Jun 2022 13:53:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 01/35] acpi: add interface to build device specific AML
Date: Wed,  8 Jun 2022 09:53:06 -0400
Message-Id: <20220608135340.3304695-2-imammedo@redhat.com>
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

There is already ISADeviceClass::build_aml() callback which
builds device specific AML blob for some ISA devices.
To extend the same idea to other devices, add TYPE_ACPI_DEV_AML_IF
Interface that will provide a more generic callback which
will be used not only for ISA but other devices. It will
allow get rid of some data-mining and ad-hoc AML building,
by asking device(s) to generate its own AML blob like it's
done for ISA devices.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/acpi_aml_interface.h | 40 ++++++++++++++++++++++++++++
 hw/acpi/acpi_interface.c             |  8 ++++++
 hw/acpi/meson.build                  |  2 +-
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/acpi/acpi_aml_interface.h

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
new file mode 100644
index 0000000000..ab76f0e55d
--- /dev/null
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -0,0 +1,40 @@
+#ifndef ACPI_AML_INTERFACE_H
+#define ACPI_AML_INTERFACE_H
+
+#include "qom/object.h"
+#include "hw/acpi/aml-build.h"
+
+#define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
+typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
+DECLARE_CLASS_CHECKERS(AcpiDevAmlIfClass, ACPI_DEV_AML_IF, TYPE_ACPI_DEV_AML_IF)
+#define ACPI_DEV_AML_IF(obj) \
+     INTERFACE_CHECK(AcpiDevAmlIf, (obj), TYPE_ACPI_DEV_AML_IF)
+
+typedef struct AcpiDevAmlIf AcpiDevAmlIf;
+typedef void (*dev_aml_fn)(AcpiDevAmlIf *adev, Aml *scope);
+
+/**
+ * AcpiDevAmlIfClass:
+ *
+ * build_dev_aml: adds device specific AML blob to provided scope
+ *
+ * Interface is designed for providing generic callback that builds device
+ * specific AML blob.
+ */
+struct AcpiDevAmlIfClass {
+    /* <private> */
+    InterfaceClass parent_class;
+
+    /* <public> */
+    dev_aml_fn build_dev_aml;
+};
+
+static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
+        AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
+        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
+    }
+}
+
+#endif
diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
index 6583917b8e..c668d361f6 100644
--- a/hw/acpi/acpi_interface.c
+++ b/hw/acpi/acpi_interface.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/acpi_dev_interface.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "qemu/module.h"
 
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
@@ -18,8 +19,15 @@ static void register_types(void)
         .parent        = TYPE_INTERFACE,
         .class_size = sizeof(AcpiDeviceIfClass),
     };
+    static const TypeInfo acpi_dev_aml_if_info = {
+        .name          = TYPE_ACPI_DEV_AML_IF,
+        .parent        = TYPE_INTERFACE,
+        .class_size = sizeof(AcpiDevAmlIfClass),
+    };
+
 
     type_register_static(&acpi_dev_if_info);
+    type_register_static(&acpi_dev_aml_if_info);
 }
 
 type_init(register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index cea2f5f93a..f8c820ca94 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -29,7 +29,7 @@ acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 if have_tpm
   acpi_ss.add(files('tpm.c'))
 endif
-softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
                                                   'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
-- 
2.31.1


