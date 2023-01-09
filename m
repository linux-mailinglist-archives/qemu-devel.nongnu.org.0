Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFEB662FDD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:06:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExRa-0004VS-Lx; Mon, 09 Jan 2023 14:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQr-00041L-5J
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pExQm-0001M8-Sr
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673291015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcKOUJvb2FOhgRFXm+hMd9NFRhOneB0yJ7Prs7FFJX8=;
 b=Hq+Go4kpNeNxUUbTwOW1M3A2SClw4VlhxfLLoXgWj7dqWS7Oy4lHsyTQApSw8LBIlmKlIe
 4M25q41JRUhYNuwV22d4MF4gbMVhHJqLgvAABIBKfI+MKYjyFNLpPrVuP7+aY+MrFAejql
 yx4fA/P272Jqr6Wv1FFrDJDOJWfCYS0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-KnJm4SqUPJ23-EZL3sMP4Q-1; Mon, 09 Jan 2023 14:03:28 -0500
X-MC-Unique: KnJm4SqUPJ23-EZL3sMP4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91FC4802C1D;
 Mon,  9 Jan 2023 19:03:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FDE42166B26;
 Mon,  9 Jan 2023 19:03:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B52F621E5A16; Mon,  9 Jan 2023 20:03:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v4 13/17] ui: Factor out hmp_change_vnc(),
 and move to ui/ui-hmp-cmds.c
Date: Mon,  9 Jan 2023 20:03:17 +0100
Message-Id: <20230109190321.1056914-14-armbru@redhat.com>
In-Reply-To: <20230109190321.1056914-1-armbru@redhat.com>
References: <20230109190321.1056914-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/monitor/hmp.h |  5 +++++
 monitor/hmp-cmds.c    | 30 ++----------------------------
 monitor/qmp-cmds.c    |  2 +-
 ui/ui-hmp-cmds.c      | 35 ++++++++++++++++++++++++++++++++++-
 4 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index b228a406f3..df89eac22a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -73,6 +73,11 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict);
 void hmp_set_password(Monitor *mon, const QDict *qdict);
 void hmp_expire_password(Monitor *mon, const QDict *qdict);
 void hmp_change(Monitor *mon, const QDict *qdict);
+#ifdef CONFIG_VNC
+void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
+                    const char *arg, const char *read_only, bool force,
+                    Error **errp);
+#endif
 void hmp_migrate(Monitor *mon, const QDict *qdict);
 void hmp_device_add(Monitor *mon, const QDict *qdict);
 void hmp_device_del(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 4340e71c90..1dba973092 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -25,7 +25,7 @@
 #include "qemu/timer.h"
 #include "qemu/sockets.h"
 #include "qemu/help_option.h"
-#include "monitor/monitor-internal.h"
+#include "monitor/monitor.h"
 #include "qapi/error.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/opts-visitor.h"
@@ -41,7 +41,6 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
-#include "qapi/qapi-commands-ui.h"
 #include "qapi/qapi-commands-virtio.h"
 #include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
@@ -1075,15 +1074,6 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-#ifdef CONFIG_VNC
-static void hmp_change_read_arg(void *opaque, const char *password,
-                                void *readline_opaque)
-{
-    qmp_change_vnc_password(password, NULL);
-    monitor_read_command(opaque, 1);
-}
-#endif
-
 void hmp_change(Monitor *mon, const QDict *qdict)
 {
     const char *device = qdict_get_str(qdict, "device");
@@ -1096,23 +1086,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
 
 #ifdef CONFIG_VNC
     if (strcmp(device, "vnc") == 0) {
-        if (read_only) {
-            error_setg(&err, "Parameter 'read-only-mode' is invalid for VNC");
-            goto end;
-        }
-        if (strcmp(target, "passwd") == 0 ||
-            strcmp(target, "password") == 0) {
-            if (!arg) {
-                MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
-                monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
-                return;
-            } else {
-                qmp_change_vnc_password(arg, &err);
-            }
-        } else {
-            error_setg(&err, "Expected 'password' after 'vnc'");
-            goto end;
-        }
+        hmp_change_vnc(mon, device, target, arg, read_only, force, &err);
     } else
 #endif
     {
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index b5b736761a..14f0f78e51 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -168,7 +168,7 @@ void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool tls,
                     Error **errp)
 {
-    static struct {
+    static const struct {
         const char *name;
         bool (*add_client)(int fd, bool has_skipauth, bool skipauth,
                            bool has_tls, bool tls, Error **errp);
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index 4af92f8eaf..8ae96749f3 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -18,7 +18,8 @@
 #include <spice/enums.h>
 #endif
 #include "monitor/hmp.h"
-#include "monitor/monitor.h"
+#include "monitor/monitor-internal.h"
+#include "qapi/error.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/cutils.h"
@@ -311,6 +312,38 @@ out:
     hmp_handle_error(mon, err);
 }
 
+#ifdef CONFIG_VNC
+static void hmp_change_read_arg(void *opaque, const char *password,
+                                void *readline_opaque)
+{
+    qmp_change_vnc_password(password, NULL);
+    monitor_read_command(opaque, 1);
+}
+
+void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
+                    const char *arg, const char *read_only, bool force,
+                    Error **errp)
+{
+    if (read_only) {
+        error_setg(errp, "Parameter 'read-only-mode' is invalid for VNC");
+        return;
+    }
+    if (strcmp(target, "passwd") == 0 ||
+        strcmp(target, "password") == 0) {
+        if (!arg) {
+            MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
+            monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
+            return;
+        } else {
+            qmp_change_vnc_password(arg, errp);
+        }
+    } else {
+        error_setg(errp, "Expected 'password' after 'vnc'");
+        return;
+    }
+}
+#endif
+
 void hmp_sendkey(Monitor *mon, const QDict *qdict)
 {
     const char *keys = qdict_get_str(qdict, "keys");
-- 
2.39.0


