Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF074673A25
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxI-0005tM-KR; Thu, 19 Jan 2023 08:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx6-0005r6-Eo
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIUx1-0008C8-V1
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674134837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/8562241mRXnhonALpPQZE/7v4jC9gJs2LucgygCdY=;
 b=BZCydLb0aGistnMQ4VY/xhEsvmSo94huaFoxcuBBjiGCFqvk6j9Co15lSYevIZtvOSKczw
 Q+/3t0N1eEL9VlqwzYBw907yLGqTcmv9Z4oxpsPHmTj0R/RFwIrEuGh4dkBVG3ymJktSpH
 HWYxXpCIs3WwAWcZJIdlRrw0wrMxzTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-XEAMwS_VPo-YB5sqkx1hFg-1; Thu, 19 Jan 2023 08:27:16 -0500
X-MC-Unique: XEAMwS_VPo-YB5sqkx1hFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E27A187B2B4;
 Thu, 19 Jan 2023 13:27:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED57C15BAD;
 Thu, 19 Jan 2023 13:27:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 619ED21E6604; Thu, 19 Jan 2023 14:27:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/17] ui: Move QMP commands from monitor to new
 ui/ui-qmp-cmds.c
Date: Thu, 19 Jan 2023 14:27:05 +0100
Message-Id: <20230119132713.3493556-10-armbru@redhat.com>
In-Reply-To: <20230119132713.3493556-1-armbru@redhat.com>
References: <20230119132713.3493556-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

This moves these commands from MAINTAINERS section "QMP" to
"Graphics".

Command add-client applies to socket character devices in addition to
display devices.  Move it anyway.  Aside: the way @protocol character
device IDs and display types is bad design.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109190321.1056914-10-armbru@redhat.com>
---
 monitor/qmp-cmds.c | 118 ---------------------------------------
 ui/ui-qmp-cmds.c   | 136 +++++++++++++++++++++++++++++++++++++++++++++
 ui/meson.build     |   1 +
 3 files changed, 137 insertions(+), 118 deletions(-)
 create mode 100644 ui/ui-qmp-cmds.c

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 6d6df86607..61449f1b58 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -36,9 +36,7 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-stats.h"
-#include "qapi/qapi-commands-ui.h"
 #include "qapi/type-helpers.h"
-#include "qapi/qmp/qerror.h"
 #include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
@@ -168,89 +166,6 @@ void qmp_system_wakeup(Error **errp)
     qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
 }
 
-void qmp_set_password(SetPasswordOptions *opts, Error **errp)
-{
-    int rc;
-
-    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
-        if (!qemu_using_spice(errp)) {
-            return;
-        }
-        rc = qemu_spice.set_passwd(opts->password,
-                opts->connected == SET_PASSWORD_ACTION_FAIL,
-                opts->connected == SET_PASSWORD_ACTION_DISCONNECT);
-    } else {
-        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
-        if (opts->connected != SET_PASSWORD_ACTION_KEEP) {
-            /* vnc supports "connected=keep" only */
-            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
-            return;
-        }
-        /*
-         * Note that setting an empty password will not disable login
-         * through this interface.
-         */
-        rc = vnc_display_password(opts->u.vnc.display, opts->password);
-    }
-
-    if (rc != 0) {
-        error_setg(errp, "Could not set password");
-    }
-}
-
-void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
-{
-    time_t when;
-    int rc;
-    const char *whenstr = opts->time;
-    const char *numstr = NULL;
-    uint64_t num;
-
-    if (strcmp(whenstr, "now") == 0) {
-        when = 0;
-    } else if (strcmp(whenstr, "never") == 0) {
-        when = TIME_MAX;
-    } else if (whenstr[0] == '+') {
-        when = time(NULL);
-        numstr = whenstr + 1;
-    } else {
-        when = 0;
-        numstr = whenstr;
-    }
-
-    if (numstr) {
-        if (qemu_strtou64(numstr, NULL, 10, &num) < 0) {
-            error_setg(errp, "Parameter 'time' doesn't take value '%s'",
-                       whenstr);
-            return;
-        }
-        when += num;
-    }
-
-    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
-        if (!qemu_using_spice(errp)) {
-            return;
-        }
-        rc = qemu_spice.set_pw_expire(when);
-    } else {
-        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
-        rc = vnc_display_pw_expire(opts->u.vnc.display, when);
-    }
-
-    if (rc != 0) {
-        error_setg(errp, "Could not set password expire time");
-    }
-}
-
-#ifdef CONFIG_VNC
-void qmp_change_vnc_password(const char *password, Error **errp)
-{
-    if (vnc_display_password(NULL, password) < 0) {
-        error_setg(errp, "Could not set password");
-    }
-}
-#endif
-
 void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool tls,
                     Error **errp)
@@ -305,7 +220,6 @@ void qmp_add_client(const char *protocol, const char *fdname,
     }
 }
 
-
 MemoryDeviceInfoList *qmp_query_memory_devices(Error **errp)
 {
     return qmp_memory_device_list();
@@ -344,38 +258,6 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
     return mem_info;
 }
 
-void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
-{
-    switch (arg->type) {
-    case DISPLAY_RELOAD_TYPE_VNC:
-#ifdef CONFIG_VNC
-        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
-            vnc_display_reload_certs(NULL, errp);
-        }
-#else
-        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
-#endif
-        break;
-    default:
-        abort();
-    }
-}
-
-void qmp_display_update(DisplayUpdateOptions *arg, Error **errp)
-{
-    switch (arg->type) {
-    case DISPLAY_UPDATE_TYPE_VNC:
-#ifdef CONFIG_VNC
-        vnc_display_update(&arg->u.vnc, errp);
-#else
-        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
-#endif
-        break;
-    default:
-        abort();
-    }
-}
-
 static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
 {
     RdmaProvider *rdma;
diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
new file mode 100644
index 0000000000..c9f92caf1d
--- /dev/null
+++ b/ui/ui-qmp-cmds.c
@@ -0,0 +1,136 @@
+/*
+ * QMP commands related to UI
+ *
+ * Copyright IBM, Corp. 2011
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/cutils.h"
+#include "ui/console.h"
+#include "ui/qemu-spice.h"
+
+void qmp_set_password(SetPasswordOptions *opts, Error **errp)
+{
+    int rc;
+
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
+        if (!qemu_using_spice(errp)) {
+            return;
+        }
+        rc = qemu_spice.set_passwd(opts->password,
+                opts->connected == SET_PASSWORD_ACTION_FAIL,
+                opts->connected == SET_PASSWORD_ACTION_DISCONNECT);
+    } else {
+        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
+        if (opts->connected != SET_PASSWORD_ACTION_KEEP) {
+            /* vnc supports "connected=keep" only */
+            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
+            return;
+        }
+        /*
+         * Note that setting an empty password will not disable login
+         * through this interface.
+         */
+        rc = vnc_display_password(opts->u.vnc.display, opts->password);
+    }
+
+    if (rc != 0) {
+        error_setg(errp, "Could not set password");
+    }
+}
+
+void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
+{
+    time_t when;
+    int rc;
+    const char *whenstr = opts->time;
+    const char *numstr = NULL;
+    uint64_t num;
+
+    if (strcmp(whenstr, "now") == 0) {
+        when = 0;
+    } else if (strcmp(whenstr, "never") == 0) {
+        when = TIME_MAX;
+    } else if (whenstr[0] == '+') {
+        when = time(NULL);
+        numstr = whenstr + 1;
+    } else {
+        when = 0;
+        numstr = whenstr;
+    }
+
+    if (numstr) {
+        if (qemu_strtou64(numstr, NULL, 10, &num) < 0) {
+            error_setg(errp, "Parameter 'time' doesn't take value '%s'",
+                       whenstr);
+            return;
+        }
+        when += num;
+    }
+
+    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
+        if (!qemu_using_spice(errp)) {
+            return;
+        }
+        rc = qemu_spice.set_pw_expire(when);
+    } else {
+        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
+        rc = vnc_display_pw_expire(opts->u.vnc.display, when);
+    }
+
+    if (rc != 0) {
+        error_setg(errp, "Could not set password expire time");
+    }
+}
+
+#ifdef CONFIG_VNC
+void qmp_change_vnc_password(const char *password, Error **errp)
+{
+    if (vnc_display_password(NULL, password) < 0) {
+        error_setg(errp, "Could not set password");
+    }
+}
+#endif
+
+void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_RELOAD_TYPE_VNC:
+#ifdef CONFIG_VNC
+        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
+            vnc_display_reload_certs(NULL, errp);
+        }
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
+
+void qmp_display_update(DisplayUpdateOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_UPDATE_TYPE_VNC:
+#ifdef CONFIG_VNC
+        vnc_display_update(&arg->u.vnc, errp);
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
diff --git a/ui/meson.build b/ui/meson.build
index c1b137bf33..9194ea335b 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -14,6 +14,7 @@ softmmu_ss.add(files(
   'kbd-state.c',
   'keymaps.c',
   'qemu-pixman.c',
+  'ui-qmp-cmds.c',
   'util.c',
 ))
 if dbus_display
-- 
2.39.0


