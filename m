Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7F6892B3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri2-0008R2-HV; Fri, 03 Feb 2023 03:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrht-0008N1-R5
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhm-0007VI-9D
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvBfN4qUIc6RHXpdaNLRIL0yJ064IiZPCb5WgUi+57Q=;
 b=DvO0j3tJfVo05Z06WRTNTtd37PSP0jnNvNchHV6O5E0q/qcEZdfItfAjRORSEgo8SbfWsf
 xq044+eTp/UQ/XxOL3O7g0Z+c6IWEw5CE07+KKMyFnZfNYxq2zateensLQRtSGBrb7c0i8
 MlaFUuhswYSOvMCBTeamEV9dXude6/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-2tXlyX6ePJ6JjPz5r8JpOA-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: 2tXlyX6ePJ6JjPz5r8JpOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB76538149BF;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A488614171B8;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1CAA21E6922; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 21/35] migration: Move the QMP command from monitor/ to
 migration/
Date: Fri,  3 Feb 2023 09:45:35 +0100
Message-Id: <20230203084549.2622302-22-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

This moves the command from MAINTAINERS sections "Human Monitor (HMP)"
and "QMP" to "Migration".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-19-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 30 ++++++++++++++++++++++++++++++
 monitor/misc.c        | 31 -------------------------------
 2 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..56859d5869 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -61,6 +61,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "ui/qemu-spice.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -963,6 +964,35 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     return params;
 }
 
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
+
 AnnounceParameters *migrate_announce_params(void)
 {
     static AnnounceParameters ap;
diff --git a/monitor/misc.c b/monitor/misc.c
index 780f2a6b04..ff3002a880 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -27,7 +27,6 @@
 #include "monitor/qdev.h"
 #include "exec/gdbstub.h"
 #include "net/slirp.h"
-#include "ui/qemu-spice.h"
 #include "qemu/ctype.h"
 #include "disas/disas.h"
 #include "qemu/log.h"
@@ -43,7 +42,6 @@
 #include "exec/ioport.h"
 #include "block/block-hmp-cmds.h"
 #include "qapi/qapi-commands-control.h"
-#include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-machine.h"
@@ -291,35 +289,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
     }
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
 static void hmp_logfile(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
2.39.0


