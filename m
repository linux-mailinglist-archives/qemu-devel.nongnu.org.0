Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8FB640419
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vY-0003hs-8J; Fri, 02 Dec 2022 05:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vQ-0003cZ-7Y
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vN-0002PP-QT
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87v4JXy1ORyVrxnkn5qwvQ8cEEk0CF86ENlLsmAYzd0=;
 b=Wu5cdYfAldoapxdhqTgL+DHJ7xMnRarnppgvBsqIHik0r5vrwmTOkH+RzVeSZdRJpiL2Ke
 73ncplukUIrm0fRPt+VUQ/60H51b1DpEZ6k2C0pj20b4ycIuzlDiR3W1sF5zywK8XSsfda
 mFG/MNGZKa8gu3yWvkuZJJtEoRjt2ek=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-uBWMRlzGNuSneFylvAgLlQ-1; Fri, 02 Dec 2022 05:05:39 -0500
X-MC-Unique: uBWMRlzGNuSneFylvAgLlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C11DA2A2AD70;
 Fri,  2 Dec 2022 10:05:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A992414A815;
 Fri,  2 Dec 2022 10:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C63C21E65CF; Fri,  2 Dec 2022 11:05:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 13/14] ui: Factor out hmp_change_vnc(),
 and move to ui/ui-hmp-cmds.c
Date: Fri,  2 Dec 2022 11:05:11 +0100
Message-Id: <20221202100512.4161901-14-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
---
 include/monitor/hmp.h |  5 +++++
 monitor/hmp-cmds.c    | 28 +---------------------------
 ui/ui-hmp-cmds.c      | 35 ++++++++++++++++++++++++++++++++++-
 3 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index dfbc0c9a2f..992d91f181 100644
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
index 8542eee3d4..78bcdede85 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,7 +42,6 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
-#include "qapi/qapi-commands-ui.h"
 #include "qapi/qapi-commands-virtio.h"
 #include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
@@ -1187,15 +1186,6 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
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
@@ -1208,23 +1198,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
 
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
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index c26a1f00d0..e17f22c869 100644
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
@@ -271,6 +272,38 @@ out:
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
2.37.3


