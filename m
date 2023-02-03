Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26009689299
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNri1-0008Ql-RB; Fri, 03 Feb 2023 03:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhn-0008Id-7w
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhk-0007TW-FR
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjGXE6FPYb0h/otH5qlKnGK/jwxh6z8TdrXpK1YEBGY=;
 b=aS0al/npa7/wcs3bQOBV7P8LTkmXHVYIZEUzZLLCDsgxzEorYuL52iPvIDqa6QPQCr8z8t
 ioLxnDsiVF9S4Vv8CXj5tZ1WlMjUMlAHkGmOs6TQhpW7A9w4gSp7zapoTE5exZVcO5Z1w0
 Ft5WDjxD4PJs/AGi1ttPWf2F2cBKk4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-Zov_8hR3Mx6Hn93lQPbIjw-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: Zov_8hR3Mx6Hn93lQPbIjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D01B5196EF8A;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A45C840149B6;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D3D4C21E6916; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 15/35] block: Factor out hmp_change_medium(),
 and move to block/monitor/
Date: Fri,  3 Feb 2023 09:45:29 +0100
Message-Id: <20230203084549.2622302-16-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Message-Id: <20230124121946.1139465-13-armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 include/monitor/hmp.h          |  3 +++
 block/monitor/block-hmp-cmds.c | 21 +++++++++++++++++++++
 monitor/hmp-cmds.c             | 17 +----------------
 3 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 58ed1bec62..6fafa7ffb4 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -78,6 +78,9 @@ void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
                     const char *arg, const char *read_only, bool force,
                     Error **errp);
 #endif
+void hmp_change_medium(Monitor *mon, const char *device, const char *target,
+                       const char *arg, const char *read_only, bool force,
+                       Error **errp);
 void hmp_migrate(Monitor *mon, const QDict *qdict);
 void hmp_device_add(Monitor *mon, const QDict *qdict);
 void hmp_device_del(Monitor *mon, const QDict *qdict);
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 0ff7c84039..ae624ab575 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -1005,3 +1005,24 @@ void hmp_info_snapshots(Monitor *mon, const QDict *qdict)
     g_free(sn_tab);
     g_free(global_snapshots);
 }
+
+void hmp_change_medium(Monitor *mon, const char *device, const char *target,
+                       const char *arg, const char *read_only, bool force,
+                       Error **errp)
+{
+    ERRP_GUARD();
+    BlockdevChangeReadOnlyMode read_only_mode = 0;
+
+    if (read_only) {
+        read_only_mode =
+            qapi_enum_parse(&BlockdevChangeReadOnlyMode_lookup,
+                            read_only,
+                            BLOCKDEV_CHANGE_READ_ONLY_MODE_RETAIN, errp);
+        if (*errp) {
+            return;
+        }
+    }
+
+    qmp_blockdev_change_medium(device, NULL, target, arg, true, force,
+                               !!read_only, read_only_mode, errp);
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 4fe2aaebcd..bed75af656 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -24,7 +24,6 @@
 #include "qapi/error.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
-#include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -916,7 +915,6 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     const char *arg = qdict_get_try_str(qdict, "arg");
     const char *read_only = qdict_get_try_str(qdict, "read-only-mode");
     bool force = qdict_get_try_bool(qdict, "force", false);
-    BlockdevChangeReadOnlyMode read_only_mode = 0;
     Error *err = NULL;
 
 #ifdef CONFIG_VNC
@@ -925,22 +923,9 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     } else
 #endif
     {
-        if (read_only) {
-            read_only_mode =
-                qapi_enum_parse(&BlockdevChangeReadOnlyMode_lookup,
-                                read_only,
-                                BLOCKDEV_CHANGE_READ_ONLY_MODE_RETAIN, &err);
-            if (err) {
-                goto end;
-            }
-        }
-
-        qmp_blockdev_change_medium(device, NULL, target, arg, true, force,
-                                   !!read_only, read_only_mode,
-                                   &err);
+        hmp_change_medium(mon, device, target, arg, read_only, force, &err);
     }
 
-end:
     hmp_handle_error(mon, err);
 }
 
-- 
2.39.0


