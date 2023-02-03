Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88A6892B0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNrip-0000wq-BI; Fri, 03 Feb 2023 03:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhw-0008NL-QT
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhr-0007Xx-OQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAZXGkPuybNEeCTSRvyOs8WcJIlZnu5E7ceYEKlMZzQ=;
 b=O6f2z7xXFvaTOOMkcCvRZWCuOS2zoqhxOMg5qVnpiYk1GsRIn5Teygt8xyHhmCvpYQyGO5
 aLAtQL/5fXoKmnSACIOlXjXGN/UfGY9ZWjORI0iObCnLpNkFuQXdKqasWN/Q8BmjIjm0YO
 G7T5ydM4gzy4jYs3vmqfrk2DRU6i/Mc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-YcZP0rkPOG-D1_7vrTS9cg-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: YcZP0rkPOG-D1_7vrTS9cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9569100F906;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3FEA2026D3E;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EFC9D21E6936; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 27/35] acpi: Move the QMP command from monitor/ to hw/acpi/
Date: Fri,  3 Feb 2023 09:45:41 +0100
Message-Id: <20230203084549.2622302-28-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This moves the command from MAINTAINERS section "QMP" to section
"ACPI/SMBIOS)".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-25-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/acpi-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
 monitor/qmp-cmds.c      | 21 ---------------------
 hw/acpi/meson.build     |  1 +
 3 files changed, 31 insertions(+), 21 deletions(-)
 create mode 100644 hw/acpi/acpi-qmp-cmds.c

diff --git a/hw/acpi/acpi-qmp-cmds.c b/hw/acpi/acpi-qmp-cmds.c
new file mode 100644
index 0000000000..2d47cac52c
--- /dev/null
+++ b/hw/acpi/acpi-qmp-cmds.c
@@ -0,0 +1,30 @@
+/*
+ * QMP commands related to ACPI
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi_dev_interface.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-acpi.h"
+
+ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
+{
+    bool ambig;
+    ACPIOSTInfoList *head = NULL;
+    ACPIOSTInfoList **prev = &head;
+    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, &ambig);
+
+    if (obj) {
+        AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
+        AcpiDeviceIf *adev = ACPI_DEVICE_IF(obj);
+
+        adevc->ospm_status(adev, &prev);
+    } else {
+        error_setg(errp, "command is not supported, missing ACPI device");
+    }
+
+    return head;
+}
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index ab23e52f97..cc22f3fcc7 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -22,12 +22,10 @@
 #include "sysemu/runstate-action.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-acpi.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/type-helpers.h"
 #include "hw/mem/memory-device.h"
-#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
 
@@ -153,22 +151,3 @@ void qmp_add_client(const char *protocol, const char *fdname,
         close(fd);
     }
 }
-
-ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
-{
-    bool ambig;
-    ACPIOSTInfoList *head = NULL;
-    ACPIOSTInfoList **prev = &head;
-    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, &ambig);
-
-    if (obj) {
-        AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
-        AcpiDeviceIf *adev = ACPI_DEVICE_IF(obj);
-
-        adevc->ospm_status(adev, &prev);
-    } else {
-        error_setg(errp, "command is not supported, missing ACPI device");
-    }
-
-    return head;
-}
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 50b73129b4..e0bf39bf4c 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -38,3 +38,4 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub
                                                   'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
                                                   'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c',
                                                   'cxl-stub.c', 'pci-bridge-stub.c'))
+softmmu_ss.add(files('acpi-qmp-cmds.c'))
-- 
2.39.0


