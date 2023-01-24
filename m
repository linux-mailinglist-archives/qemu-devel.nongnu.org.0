Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A2A679811
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKILX-0006bh-Ep; Tue, 24 Jan 2023 07:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHb-000244-T0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHM-0006Ra-WC
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxEEtJ3IM5/1IWK4VNaU3e06Of2cEbir0W1pV/yWgx0=;
 b=DYFa99pxcjU/rUM+BPiwBPLTGg7d+TP/+PSXXQjo1wOukEEWfDs/K7iqhb84HkvrGjqSut
 tL+tr9o6/SxWA58ixTqiQoKU1AeJGF+cRPwv5az+lPoJqq6+/ONO3rv4J8UFRiz9Z81S2B
 NmpCugFyCsbXwTvqzMhUS6vu9qeBn7Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-JQdgETT1Oeq9NMIopkS-_Q-1; Tue, 24 Jan 2023 07:19:50 -0500
X-MC-Unique: JQdgETT1Oeq9NMIopkS-_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A1768533DB;
 Tue, 24 Jan 2023 12:19:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AC93400D795;
 Tue, 24 Jan 2023 12:19:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A596F21E6913; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 12/32] block: Factor out hmp_change_medium(),
 and move to block/monitor/
Date: Tue, 24 Jan 2023 13:19:26 +0100
Message-Id: <20230124121946.1139465-13-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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


