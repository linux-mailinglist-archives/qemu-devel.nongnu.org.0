Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7955A6A0B1A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:48:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBvj-00022G-9S; Thu, 23 Feb 2023 08:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBve-0001zK-RQ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBvd-0001Ma-3p
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVSHTvqIbQbRj3x/dZu08tXx76AgEq+i0KkNOGnK/gs=;
 b=jBue5TiGiN1P8HGoEai8XK1Nb6NOEDTIsK8WqRn6iBcckrKvmVH0+QvZB5eY8oW6rMsKRz
 Ooa6iUJcQszJl6cakCnP1PrxjofKERZMa2QUWAxUgOtTyUZk157UOtYEvqTZ1WMcMFgu5B
 4lR0s0k8RxF+gAFSnqfvtmEqBA7CYZA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-bMfp5GCjN2OZzEjwE02-Gw-1; Thu, 23 Feb 2023 08:46:29 -0500
X-MC-Unique: bMfp5GCjN2OZzEjwE02-Gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5DF428237C0;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 945194014CF8;
 Thu, 23 Feb 2023 13:46:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A119D21E6A26; Thu, 23 Feb 2023 14:46:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 07/12] hw/acpi: Move QMP command to hw/core/
Date: Thu, 23 Feb 2023 14:46:21 +0100
Message-Id: <20230223134626.2107382-8-armbru@redhat.com>
In-Reply-To: <20230223134626.2107382-1-armbru@redhat.com>
References: <20230223134626.2107382-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

The QERR_ macros are leftovers from the days of "rich" error objects.
We've been trying to reduce their remaining use.

qmp_query_vm_generation_id() in stubs/vmgenid.c is the last user of
QERR_UNSUPPORTED outside qga/.  Unlike the stubs we just dropped, it
is actually reachable, namely when CONFIG_ACPI_VMGENID is off.  It
always fails like

    (qemu) info vm-generation-id
    Error: this feature or command is not currently supported

Turns out the real qmp_query_vm_generation_id() doesn't actually
depend on CONFIG_ACPI_VMGENID, and fails safely when it's off.  Move
it to hw/core/machine-qmp-cmds.c, and drop the stub.  The error
message becomes

    Error: VM Generation ID device not found

Feels like an improvement to me.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230207075115.1525-8-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 MAINTAINERS                |  1 -
 hw/acpi/vmgenid.c          | 18 ------------------
 hw/core/machine-qmp-cmds.c | 18 ++++++++++++++++++
 stubs/vmgenid.c            | 10 ----------
 stubs/meson.build          |  1 -
 5 files changed, 18 insertions(+), 30 deletions(-)
 delete mode 100644 stubs/vmgenid.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9adb628627..eb917e48c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2273,7 +2273,6 @@ F: hw/acpi/vmgenid.c
 F: include/hw/acpi/vmgenid.h
 F: docs/specs/vmgenid.txt
 F: tests/qtest/vmgenid-test.c
-F: stubs/vmgenid.c
 
 LED
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 0c9f158ac9..a39315c1b3 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-machine.h"
 #include "qemu/module.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
@@ -244,20 +243,3 @@ static void vmgenid_register_types(void)
 }
 
 type_init(vmgenid_register_types)
-
-GuidInfo *qmp_query_vm_generation_id(Error **errp)
-{
-    GuidInfo *info;
-    VmGenIdState *vms;
-    Object *obj = find_vmgenid_dev();
-
-    if (!obj) {
-        error_setg(errp, "VM Generation ID device not found");
-        return NULL;
-    }
-    vms = VMGENID(obj);
-
-    info = g_malloc0(sizeof(*info));
-    info->guid = qemu_uuid_unparse_strdup(&vms->guid);
-    return info;
-}
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 44b5da8880..a6ed3a63c3 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/acpi/vmgenid.h"
 #include "hw/boards.h"
 #include "hw/intc/intc.h"
 #include "hw/mem/memory-device.h"
@@ -383,3 +384,20 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+GuidInfo *qmp_query_vm_generation_id(Error **errp)
+{
+    GuidInfo *info;
+    VmGenIdState *vms;
+    Object *obj = find_vmgenid_dev();
+
+    if (!obj) {
+        error_setg(errp, "VM Generation ID device not found");
+        return NULL;
+    }
+    vms = VMGENID(obj);
+
+    info = g_malloc0(sizeof(*info));
+    info->guid = qemu_uuid_unparse_strdup(&vms->guid);
+    return info;
+}
diff --git a/stubs/vmgenid.c b/stubs/vmgenid.c
deleted file mode 100644
index bfad656c6c..0000000000
--- a/stubs/vmgenid.c
+++ /dev/null
@@ -1,10 +0,0 @@
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qapi/qapi-commands-machine.h"
-#include "qapi/qmp/qerror.h"
-
-GuidInfo *qmp_query_vm_generation_id(Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return NULL;
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index 981585cbdf..7657467a5d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -45,7 +45,6 @@ stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
-stub_ss.add(files('vmgenid.c'))
 stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
-- 
2.39.0


