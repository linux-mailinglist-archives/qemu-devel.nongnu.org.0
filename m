Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC66A870D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:42:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltV-00086z-O9; Thu, 02 Mar 2023 11:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltS-0007w2-RE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltR-0007LL-3j
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyOZF0bPnWCURMNhh/OOxKx1HC5vnkMb+FdPeHzBliM=;
 b=GPoR30JBB25Cmd1sCgBTuo8geVRfkvoYM75GRrx4Z7qg45ryu2e8rH23wcoJ6U/oWRAi36
 4LHy162W+vq18mgWdk3bhTyncct4R52Nh5ig+6j+6UkV9Q8qcn/JF5zMJcMeLlj3j+Sdcn
 6oY1sTALa2r5yUTv798OaP3eTgtA3vg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-XxFiQrRaOFOfx6-v2pnrBQ-1; Thu, 02 Mar 2023 11:34:55 -0500
X-MC-Unique: XxFiQrRaOFOfx6-v2pnrBQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C47001C3D380;
 Thu,  2 Mar 2023 16:34:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB03B492C3E;
 Thu,  2 Mar 2023 16:34:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 15/43] migration: Move qmp_query_migrate_capabilities() to
 options.c
Date: Thu,  2 Mar 2023 17:33:42 +0100
Message-Id: <20230302163410.11399-16-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 22 ----------------------
 migration/options.c   | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index dd8df53684..5c70bb3153 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -886,28 +886,6 @@ void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value)
     migrate_send_rp_message(mis, MIG_RP_MSG_RESUME_ACK, sizeof(buf), &buf);
 }
 
-MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
-{
-    MigrationCapabilityStatusList *head = NULL, **tail = &head;
-    MigrationCapabilityStatus *caps;
-    MigrationState *s = migrate_get_current();
-    int i;
-
-    for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-#ifndef CONFIG_LIVE_BLOCK_MIGRATION
-        if (i == MIGRATION_CAPABILITY_BLOCK) {
-            continue;
-        }
-#endif
-        caps = g_malloc0(sizeof(*caps));
-        caps->capability = i;
-        caps->state = s->capabilities[i];
-        QAPI_LIST_APPEND(tail, caps);
-    }
-
-    return head;
-}
-
 MigrationParameters *qmp_query_migrate_parameters(Error **errp)
 {
     MigrationParameters *params;
diff --git a/migration/options.c b/migration/options.c
index 2cae0b8f08..ac9098fbfb 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
 #include "sysemu/runstate.h"
 #include "migration.h"
 #include "ram.h"
@@ -392,3 +393,25 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
 
     return true;
 }
+
+MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
+{
+    MigrationCapabilityStatusList *head = NULL, **tail = &head;
+    MigrationCapabilityStatus *caps;
+    MigrationState *s = migrate_get_current();
+    int i;
+
+    for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
+#ifndef CONFIG_LIVE_BLOCK_MIGRATION
+        if (i == MIGRATION_CAPABILITY_BLOCK) {
+            continue;
+        }
+#endif
+        caps = g_malloc0(sizeof(*caps));
+        caps->capability = i;
+        caps->state = s->capabilities[i];
+        QAPI_LIST_APPEND(tail, caps);
+    }
+
+    return head;
+}
-- 
2.39.2


