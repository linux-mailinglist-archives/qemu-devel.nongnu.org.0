Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F786A8657
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlmf-0002TE-B1; Thu, 02 Mar 2023 11:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlmc-0002Od-NC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlma-0005we-Nz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1+37RCP6UOnz0eAvfFKywcPH7t9SRwMbbtMthBAKfoo=;
 b=fGzg/IxbC4wmTlvb9TPSqi3wXvJoigfOyNnBPmlfJZT26+jucZsWOq0WHwFA+6fWN3uF2G
 +2LcSOz+WR2Wg020niAqYn5ldUALL4pAsq8f7ZJbfrIj1EaY/TcVCN+/538SF1EzUVLDaF
 ku9gw6sW2p7lmbRLRApdqRZhgxuRtYA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-4m5JZ_X3ONSeU3w3YTKK2Q-1; Thu, 02 Mar 2023 11:27:49 -0500
X-MC-Unique: 4m5JZ_X3ONSeU3w3YTKK2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 812C318E0925
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:27:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B01A40B3F12;
 Thu,  2 Mar 2023 16:27:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] spice: move client_migrate_info command to ui/
Date: Thu,  2 Mar 2023 17:27:46 +0100
Message-Id: <20230302162746.10534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

It has nothing to do with migration, except for the "migrate" in the
name of the command.  Move it with the rest of the ui commands.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

I would claim that it should be only compiled with CONFIG_SPICE, but
I left that to spice maintainers.
---
 qapi/migration.json            | 28 ----------------------------
 qapi/ui.json                   | 28 ++++++++++++++++++++++++++++
 migration/migration-hmp-cmds.c | 17 -----------------
 migration/migration.c          | 30 ------------------------------
 ui/ui-hmp-cmds.c               | 17 +++++++++++++++++
 ui/ui-qmp-cmds.c               | 29 +++++++++++++++++++++++++++++
 6 files changed, 74 insertions(+), 75 deletions(-)

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
index 0abba3e930..1bfdbb47a4 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1541,3 +1541,31 @@
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
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 7dcb289c05..83f214d145 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -635,23 +635,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
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
index c0584481c7..67799f0958 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -63,7 +63,6 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
-#include "ui/qemu-spice.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1019,35 +1018,6 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
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


