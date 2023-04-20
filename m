Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040076E9651
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:51:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWK-0003nf-0n; Thu, 20 Apr 2023 09:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWI-0003nO-Dz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWG-0005ez-Jb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4NYtI/4cyE62qQG3EUsaHCVpbhDI+HOOFZUgmueKG0=;
 b=EyM03nzn/2EYj7WD7DCK25OxzCSYoVwSKV0f7gxyu0XZFEpM8DarH/hxFodzdCAOFiQv/b
 cJopB1L4GIG1VWKrPPq+BK2wU5i/rYY8NzdhdRZ6H/aqfwq+juvmNg3lGvvEfvOEgDcokD
 YIaBhEhfHKE28LX9QL4Z+0lxpHNBaBM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-jN7PNLAbPWK7oP6J7QhaUw-1; Thu, 20 Apr 2023 09:40:12 -0400
X-MC-Unique: jN7PNLAbPWK7oP6J7QhaUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FCAB3C0C8A7;
 Thu, 20 Apr 2023 13:40:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68C794020BED;
 Thu, 20 Apr 2023 13:40:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 02/43] spice: move client_migrate_info command to ui/
Date: Thu, 20 Apr 2023 15:39:21 +0200
Message-Id: <20230420134002.29531-3-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It has nothing to do with migration, except for the "migrate" in the
name of the command.  Move it with the rest of the ui commands.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

I would claim that it should be only compiled with CONFIG_SPICE, but
I left that to spice maintainers.
---
 migration/migration-hmp-cmds.c | 18 ------------------
 migration/migration.c          | 30 ------------------------------
 qapi/migration.json            | 28 ----------------------------
 qapi/ui.json                   | 28 ++++++++++++++++++++++++++++
 ui/ui-hmp-cmds.c               | 17 +++++++++++++++++
 ui/ui-qmp-cmds.c               | 29 +++++++++++++++++++++++++++++
 6 files changed, 74 insertions(+), 76 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 71da91967a..83f214d145 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -28,7 +28,6 @@
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
 #include "sysemu/runstate.h"
-#include "ui/qemu-spice.h"
 #include "sysemu/sysemu.h"
 #include "migration.h"
 
@@ -636,23 +635,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    const char *protocol = qdict_get_str(qdict, "protocol");
-    const char *hostname = qdict_get_str(qdict, "hostname");
-    bool has_port        = qdict_haskey(qdict, "port");
-    int port             = qdict_get_try_int(qdict, "port", -1);
-    bool has_tls_port    = qdict_haskey(qdict, "tls-port");
-    int tls_port         = qdict_get_try_int(qdict, "tls-port", -1);
-    const char *cert_subject = qdict_get_try_str(qdict, "cert-subject");
-
-    qmp_client_migrate_info(protocol, hostname,
-                            has_port, port, has_tls_port, tls_port,
-                            cert_subject, &err);
-    hmp_handle_error(mon, err);
-}
-
 void hmp_migrate_start_postcopy(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
diff --git a/migration/migration.c b/migration/migration.c
index 4be66b1956..74f28cdca6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -63,7 +63,6 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
-#include "ui/qemu-spice.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1018,35 +1017,6 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     return params;
 }
 
-void qmp_client_migrate_info(const char *protocol, const char *hostname,
-                             bool has_port, int64_t port,
-                             bool has_tls_port, int64_t tls_port,
-                             const char *cert_subject,
-                             Error **errp)
-{
-    if (strcmp(protocol, "spice") == 0) {
-        if (!qemu_using_spice(errp)) {
-            return;
-        }
-
-        if (!has_port && !has_tls_port) {
-            error_setg(errp, QERR_MISSING_PARAMETER, "port/tls-port");
-            return;
-        }
-
-        if (qemu_spice.migrate_info(hostname,
-                                    has_port ? port : -1,
-                                    has_tls_port ? tls_port : -1,
-                                    cert_subject)) {
-            error_setg(errp, "Could not set up display for migration");
-            return;
-        }
-        return;
-    }
-
-    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "'spice'");
-}
-
 AnnounceParameters *migrate_announce_params(void)
 {
     static AnnounceParameters ap;
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..2c35b7b9cf 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1203,34 +1203,6 @@
 { 'command': 'query-migrate-parameters',
   'returns': 'MigrationParameters' }
 
-##
-# @client_migrate_info:
-#
-# Set migration information for remote display.  This makes the server
-# ask the client to automatically reconnect using the new parameters
-# once migration finished successfully.  Only implemented for SPICE.
-#
-# @protocol: must be "spice"
-# @hostname: migration target hostname
-# @port: spice tcp port for plaintext channels
-# @tls-port: spice tcp port for tls-secured channels
-# @cert-subject: server certificate subject
-#
-# Since: 0.14
-#
-# Example:
-#
-# -> { "execute": "client_migrate_info",
-#      "arguments": { "protocol": "spice",
-#                     "hostname": "virt42.lab.kraxel.org",
-#                     "port": 1234 } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'client_migrate_info',
-  'data': { 'protocol': 'str', 'hostname': 'str', '*port': 'int',
-            '*tls-port': 'int', '*cert-subject': 'str' } }
-
 ##
 # @migrate-start-postcopy:
 #
diff --git a/qapi/ui.json b/qapi/ui.json
index 98322342f7..7ddd27a932 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1554,3 +1554,31 @@
 { 'command': 'display-update',
   'data': 'DisplayUpdateOptions',
   'boxed' : true }
+
+##
+# @client_migrate_info:
+#
+# Set migration information for remote display.  This makes the server
+# ask the client to automatically reconnect using the new parameters
+# once migration finished successfully.  Only implemented for SPICE.
+#
+# @protocol: must be "spice"
+# @hostname: migration target hostname
+# @port: spice tcp port for plaintext channels
+# @tls-port: spice tcp port for tls-secured channels
+# @cert-subject: server certificate subject
+#
+# Since: 0.14
+#
+# Example:
+#
+# -> { "execute": "client_migrate_info",
+#      "arguments": { "protocol": "spice",
+#                     "hostname": "virt42.lab.kraxel.org",
+#                     "port": 1234 } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'client_migrate_info',
+  'data': { 'protocol': 'str', 'hostname': 'str', '*port': 'int',
+            '*tls-port': 'int', '*cert-subject': 'str' } }
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index 5c456ecc02..c671389473 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -458,3 +458,20 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
 end:
     hmp_handle_error(mon, err);
 }
+
+void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *protocol = qdict_get_str(qdict, "protocol");
+    const char *hostname = qdict_get_str(qdict, "hostname");
+    bool has_port        = qdict_haskey(qdict, "port");
+    int port             = qdict_get_try_int(qdict, "port", -1);
+    bool has_tls_port    = qdict_haskey(qdict, "tls-port");
+    int tls_port         = qdict_get_try_int(qdict, "tls-port", -1);
+    const char *cert_subject = qdict_get_try_str(qdict, "cert-subject");
+
+    qmp_client_migrate_info(protocol, hostname,
+                            has_port, port, has_tls_port, tls_port,
+                            cert_subject, &err);
+    hmp_handle_error(mon, err);
+}
diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
index dbc4afcd73..a37a7024f3 100644
--- a/ui/ui-qmp-cmds.c
+++ b/ui/ui-qmp-cmds.c
@@ -175,3 +175,32 @@ void qmp_display_update(DisplayUpdateOptions *arg, Error **errp)
         abort();
     }
 }
+
+void qmp_client_migrate_info(const char *protocol, const char *hostname,
+                             bool has_port, int64_t port,
+                             bool has_tls_port, int64_t tls_port,
+                             const char *cert_subject,
+                             Error **errp)
+{
+    if (strcmp(protocol, "spice") == 0) {
+        if (!qemu_using_spice(errp)) {
+            return;
+        }
+
+        if (!has_port && !has_tls_port) {
+            error_setg(errp, QERR_MISSING_PARAMETER, "port/tls-port");
+            return;
+        }
+
+        if (qemu_spice.migrate_info(hostname,
+                                    has_port ? port : -1,
+                                    has_tls_port ? tls_port : -1,
+                                    cert_subject)) {
+            error_setg(errp, "Could not set up display for migration");
+            return;
+        }
+        return;
+    }
+
+    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "'spice'");
+}
-- 
2.39.2


