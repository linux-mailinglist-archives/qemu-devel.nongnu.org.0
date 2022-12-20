Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E078D651CD8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaS-0000Yo-K2; Tue, 20 Dec 2022 04:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaM-0000Uj-Hx
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaI-0006SL-QQ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBAGdXO3qSn3FJKjo9lmUkBrt4c0d3zUZOBjWAak4kY=;
 b=RhS6BMOWGG2NrvLPJO7szhpmFw3+6H804+XGTDBLH9qZ7qctCupX18dvITPf16X08zmurQ
 lN8LtRli6frPqNuhpEgMcnjycFjv39Kuh69c6TxTEKARX4mg3qdtoXSwReZnw43Sr3sIY5
 7c4u+KsuY1M8AvyL5D+CnmbIRgz2sQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-W_el7k1LMH2kfFNv3S9oIw-1; Tue, 20 Dec 2022 04:06:48 -0500
X-MC-Unique: W_el7k1LMH2kfFNv3S9oIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52EC5101A55E;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 070C6140E90F;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94D0B21E6835; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 14/18] ui: Factor out hmp_change_vnc(),
 and move to ui/ui-hmp-cmds.c
Date: Tue, 20 Dec 2022 10:06:41 +0100
Message-Id: <20221220090645.2844881-15-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 95abd4693f..41d934acb9 100644
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
2.38.1


