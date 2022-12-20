Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C933B651E5A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaN-0000VA-T9; Tue, 20 Dec 2022 04:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaL-0000Ts-FO
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaI-0006SF-OD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hR8RuKzzDVQXmFfG4kCfxfo+DU4wZ3vnTB04c9t0hIc=;
 b=jCbCDWIHS1zXd3HcAN8fdygM6+FFrAubv4e65vP2QYYGT/j6Q5DyNfV5Cx8jGepNqWZQWC
 jOTKtoId8OdEsEBlSh52Tq7uzUZRvKSW9aXsOwl4M/54GvApUW67Ib6URkAxobHEZHQ9No
 SBBYIfM3D959MS2Wa614R6UTDk7xGwc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-cdXQiPfPNVyCCqWQhh4WEA-1; Tue, 20 Dec 2022 04:06:48 -0500
X-MC-Unique: cdXQiPfPNVyCCqWQhh4WEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1976E85C069;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F9739D7C;
 Tue, 20 Dec 2022 09:06:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89A3921E688E; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 10/18] ui: Factor out qmp_add_client() parts and move to
 ui/ui-qmp-cmds.c
Date: Tue, 20 Dec 2022 10:06:37 +0100
Message-Id: <20221220090645.2844881-11-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/monitor/qmp-helpers.h | 26 ++++++++++++
 monitor/qmp-cmds.c            | 74 ++++++++++++++++-------------------
 ui/ui-qmp-cmds.c              | 41 +++++++++++++++++++
 3 files changed, 100 insertions(+), 41 deletions(-)
 create mode 100644 include/monitor/qmp-helpers.h

diff --git a/include/monitor/qmp-helpers.h b/include/monitor/qmp-helpers.h
new file mode 100644
index 0000000000..4718c63c73
--- /dev/null
+++ b/include/monitor/qmp-helpers.h
@@ -0,0 +1,26 @@
+/*
+ * QMP command helpers
+ *
+ * Copyright (c) 2022 Red Hat Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef MONITOR_QMP_HELPERS_H
+
+bool qmp_add_client_spice(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp);
+#ifdef CONFIG_VNC
+bool qmp_add_client_vnc(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp);
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
+bool qmp_add_client_dbus_display(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp);
+#endif
+
+#endif
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 61449f1b58..b5b736761a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -17,13 +17,11 @@
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "monitor/monitor.h"
+#include "monitor/qmp-helpers.h"
 #include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/uuid.h"
 #include "chardev/char.h"
-#include "ui/qemu-spice.h"
-#include "ui/console.h"
-#include "ui/dbus-display.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
@@ -170,54 +168,48 @@ void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool tls,
                     Error **errp)
 {
+    static struct {
+        const char *name;
+        bool (*add_client)(int fd, bool has_skipauth, bool skipauth,
+                           bool has_tls, bool tls, Error **errp);
+    } protocol_table[] = {
+        { "spice", qmp_add_client_spice },
+#ifdef CONFIG_VNC
+        { "vnc", qmp_add_client_vnc },
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
+        { "@dbus-display", qmp_add_client_dbus_display },
+#endif
+    };
     Chardev *s;
-    int fd;
+    int fd, i;
 
     fd = monitor_get_fd(monitor_cur(), fdname, errp);
     if (fd < 0) {
         return;
     }
 
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
+    for (i = 0; i < ARRAY_SIZE(protocol_table); i++) {
+        if (!strcmp(protocol, protocol_table[i].name)) {
+            if (!protocol_table[i].add_client(fd, has_skipauth, skipauth,
+                                              has_tls, tls, errp)) {
+                close(fd);
+            }
             return;
         }
     }
+
+    s = qemu_chr_find(protocol);
+    if (!s) {
+        error_setg(errp, "protocol '%s' is invalid", protocol);
+        close(fd);
+        return;
+    }
+    if (qemu_chr_add_client(s, fd) < 0) {
+        error_setg(errp, "failed to add client");
+        close(fd);
+        return;
+    }
 }
 
 MemoryDeviceInfoList *qmp_query_memory_devices(Error **errp)
diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
index c9f92caf1d..dbc4afcd73 100644
--- a/ui/ui-qmp-cmds.c
+++ b/ui/ui-qmp-cmds.c
@@ -14,10 +14,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/qmp-helpers.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
 #include "ui/console.h"
+#include "ui/dbus-display.h"
 #include "ui/qemu-spice.h"
 
 void qmp_set_password(SetPasswordOptions *opts, Error **errp)
@@ -103,6 +105,45 @@ void qmp_change_vnc_password(const char *password, Error **errp)
 }
 #endif
 
+bool qmp_add_client_spice(int fd, bool has_skipauth, bool skipauth,
+                          bool has_tls, bool tls, Error **errp)
+{
+    if (!qemu_using_spice(errp)) {
+        return false;
+    }
+    skipauth = has_skipauth ? skipauth : false;
+    tls = has_tls ? tls : false;
+    if (qemu_spice.display_add_client(fd, skipauth, tls) < 0) {
+        error_setg(errp, "spice failed to add client");
+        return false;
+    }
+    return true;
+}
+
+#ifdef CONFIG_VNC
+bool qmp_add_client_vnc(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp)
+{
+    skipauth = has_skipauth ? skipauth : false;
+    vnc_display_add_client(NULL, fd, skipauth);
+    return true;
+}
+#endif
+
+#ifdef CONFIG_DBUS_DISPLAY
+bool qmp_add_client_dbus_display(int fd, bool has_skipauth, bool skipauth,
+                                 bool has_tls, bool tls, Error **errp)
+{
+    if (!qemu_using_dbus_display(errp)) {
+        return false;
+    }
+    if (!qemu_dbus_display.add_client(fd, errp)) {
+        return false;
+    }
+    return true;
+}
+#endif
+
 void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
 {
     switch (arg->type) {
-- 
2.38.1


