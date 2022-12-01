Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C3563E9BD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:15:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0cpA-0005kK-VO; Thu, 01 Dec 2022 01:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cp6-0005jj-AI
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cp4-0005ml-7V
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669875200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyfrnBGbFz4gu436RxEUKUfyWtRrBHWQKVJEI1cObxw=;
 b=DVcm2JunQ+pZapqZKpuaSshbU8TjVyTGBM/U9yrhbvWYd3cWvtTpllydC0qRKkzyvVglEd
 /WOuVLK+v2NmkQYDrUYVfWmb26j2fBXTiwRe1h/2rkBSm0NlZ+kRrybtGFZZ9rMcCaKpoy
 q8l8Gt0qdy6TKBDiCSqjqZEIoL4CwME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-k5mu79EGM3agVqDciuhn2g-1; Thu, 01 Dec 2022 01:13:19 -0500
X-MC-Unique: k5mu79EGM3agVqDciuhn2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F00D285A5A6
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:13:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85BEBC15BA5;
 Thu,  1 Dec 2022 06:13:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9B0121E65C5; Thu,  1 Dec 2022 07:13:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 5/9] ui: Move QMP commands from monitor to new ui/ui-qmp-cmds.c
Date: Thu,  1 Dec 2022 07:13:07 +0100
Message-Id: <20221201061311.3619052-6-armbru@redhat.com>
In-Reply-To: <20221201061311.3619052-1-armbru@redhat.com>
References: <20221201061311.3619052-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" to "Graphics".

Command add-client applies to socket character devices in addition to
display devices.  Move it anyway.  Aside: the way @protocol character
device IDs and display types is bad design.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp-cmds.c | 177 -----------------------------------------
 ui/ui-qmp-cmds.c   | 194 +++++++++++++++++++++++++++++++++++++++++++++
 ui/meson.build     |   1 +
 3 files changed, 195 insertions(+), 177 deletions(-)
 create mode 100644 ui/ui-qmp-cmds.c

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a7c95e8e39..85b2089873 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -16,14 +16,9 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "qemu/option.h"
-#include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/uuid.h"
-#include "chardev/char.h"
-#include "ui/qemu-spice.h"
-#include "ui/console.h"
-#include "ui/dbus-display.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
@@ -36,9 +31,7 @@
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-stats.h"
-#include "qapi/qapi-commands-ui.h"
 #include "qapi/type-helpers.h"
-#include "qapi/qmp/qerror.h"
 #include "exec/ramlist.h"
 #include "hw/mem/memory-device.h"
 #include "hw/acpi/acpi_dev_interface.h"
@@ -172,144 +165,6 @@ void qmp_system_wakeup(Error **errp)
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
-void qmp_add_client(const char *protocol, const char *fdname,
-                    bool has_skipauth, bool skipauth, bool has_tls, bool tls,
-                    Error **errp)
-{
-    Chardev *s;
-    int fd;
-
-    fd = monitor_get_fd(monitor_cur(), fdname, errp);
-    if (fd < 0) {
-        return;
-    }
-
-    if (strcmp(protocol, "spice") == 0) {
-        if (!qemu_using_spice(errp)) {
-            close(fd);
-            return;
-        }
-        skipauth = has_skipauth ? skipauth : false;
-        tls = has_tls ? tls : false;
-        if (qemu_spice.display_add_client(fd, skipauth, tls) < 0) {
-            error_setg(errp, "spice failed to add client");
-            close(fd);
-        }
-#ifdef CONFIG_VNC
-    } else if (strcmp(protocol, "vnc") == 0) {
-        skipauth = has_skipauth ? skipauth : false;
-        vnc_display_add_client(NULL, fd, skipauth);
-#endif
-#ifdef CONFIG_DBUS_DISPLAY
-    } else if (strcmp(protocol, "@dbus-display") == 0) {
-        if (!qemu_using_dbus_display(errp)) {
-            close(fd);
-            return;
-        }
-        if (!qemu_dbus_display.add_client(fd, errp)) {
-            close(fd);
-            return;
-        }
-#endif
-    } else {
-        s = qemu_chr_find(protocol);
-        if (!s) {
-            error_setg(errp, "protocol '%s' is invalid", protocol);
-            close(fd);
-            return;
-        }
-        if (qemu_chr_add_client(s, fd) < 0) {
-            error_setg(errp, "failed to add client");
-            close(fd);
-            return;
-        }
-    }
-}
-
-
 MemoryDeviceInfoList *qmp_query_memory_devices(Error **errp)
 {
     return qmp_memory_device_list();
@@ -348,38 +203,6 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
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
index 0000000000..5d145c26f7
--- /dev/null
+++ b/ui/ui-qmp-cmds.c
@@ -0,0 +1,194 @@
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
+#include "chardev/char.h"
+#include "monitor/monitor.h"
+#include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/cutils.h"
+#include "ui/console.h"
+#include "ui/dbus-display.h"
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
+void qmp_add_client(const char *protocol, const char *fdname,
+                    bool has_skipauth, bool skipauth, bool has_tls, bool tls,
+                    Error **errp)
+{
+    Chardev *s;
+    int fd;
+
+    fd = monitor_get_fd(monitor_cur(), fdname, errp);
+    if (fd < 0) {
+        return;
+    }
+
+    if (strcmp(protocol, "spice") == 0) {
+        if (!qemu_using_spice(errp)) {
+            close(fd);
+            return;
+        }
+        skipauth = has_skipauth ? skipauth : false;
+        tls = has_tls ? tls : false;
+        if (qemu_spice.display_add_client(fd, skipauth, tls) < 0) {
+            error_setg(errp, "spice failed to add client");
+            close(fd);
+        }
+#ifdef CONFIG_VNC
+    } else if (strcmp(protocol, "vnc") == 0) {
+        skipauth = has_skipauth ? skipauth : false;
+        vnc_display_add_client(NULL, fd, skipauth);
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
+    } else if (strcmp(protocol, "@dbus-display") == 0) {
+        if (!qemu_using_dbus_display(errp)) {
+            close(fd);
+            return;
+        }
+        if (!qemu_dbus_display.add_client(fd, errp)) {
+            close(fd);
+            return;
+        }
+#endif
+    } else {
+        s = qemu_chr_find(protocol);
+        if (!s) {
+            error_setg(errp, "protocol '%s' is invalid", protocol);
+            close(fd);
+            return;
+        }
+        if (qemu_chr_add_client(s, fd) < 0) {
+            error_setg(errp, "failed to add client");
+            close(fd);
+            return;
+        }
+    }
+}
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
2.37.3


