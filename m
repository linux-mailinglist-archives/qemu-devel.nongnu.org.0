Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A615A6E9620
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:44:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWx-0004MO-PX; Thu, 20 Apr 2023 09:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWv-0004Dt-9F
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWt-0005vl-Dh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2cN1elcFF9HEvtThopH96c9TG/eJg12zNlyPzwsROg=;
 b=Gc5HuAw1TUsj9xIzrcv1J0JJSJTG0nU7Bq0iI9iSK61rfMLPdfEnCJJ042wY+2rCH48TJZ
 0ZJsZ+jp7fs0sifWFiFS3A9lobrfbp9TE1s5GlISg4lTqodbrikIvplkqCDXx+eIo9Rm14
 7Fau09SnVWmZmX3BvpSpyuyC5DET2Hg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-YAK8AZpyOumIlyjouQVBZg-1; Thu, 20 Apr 2023 09:40:50 -0400
X-MC-Unique: YAK8AZpyOumIlyjouQVBZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B0B785A588;
 Thu, 20 Apr 2023 13:40:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB714020BED;
 Thu, 20 Apr 2023 13:40:47 +0000 (UTC)
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
Subject: [PATCH v2 15/43] migration: Move qmp_query_migrate_capabilities() to
 options.c
Date: Thu, 20 Apr 2023 15:39:34 +0200
Message-Id: <20230420134002.29531-16-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 933c96792b..bc796879c0 100644
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
index 367c930f46..ff621bdeb3 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
 #include "sysemu/runstate.h"
 #include "migration.h"
 #include "ram.h"
@@ -390,3 +391,25 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
 
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


