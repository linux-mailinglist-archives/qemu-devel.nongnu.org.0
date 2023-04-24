Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D3A6ECF5D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:40:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwFv-0008Ft-LF; Mon, 24 Apr 2023 09:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFW-0007OI-V1
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFT-0001Uz-DF
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVqz4Tm+qMhkrgna1X8FhBvifreZQnKw3QTGMGRmDAM=;
 b=cPFtGCKy9V5FqzHxGtK0vbEhvduEfs6NwwNCQLHpFvBbG3YpnzgMAO891mpSob61UVxbF0
 OVPZh6NGaS18LKCXcBIkeDhXf7+iA5ocLb3CAuwSqYOCfAnBHcHf2AcMFnbX1DYvijirwX
 S9f78GXQZPHgnwnNtfuy3K0mfpAp+ZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-S6suZdslOsOE5yIt6UwPpg-1; Mon, 24 Apr 2023 09:28:29 -0400
X-MC-Unique: S6suZdslOsOE5yIt6UwPpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DA60884EC1;
 Mon, 24 Apr 2023 13:28:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA1514171B8;
 Mon, 24 Apr 2023 13:28:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 18/30] migration: Move migrate_cap_set() to options.c
Date: Mon, 24 Apr 2023 15:27:18 +0200
Message-Id: <20230424132730.70752-19-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 20 --------------------
 migration/options.c   | 21 +++++++++++++++++++++
 migration/options.h   |  1 +
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b198f4acf5..ddd3fc361f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1666,26 +1666,6 @@ void migrate_set_state(int *state, int old_state, int new_state)
     }
 }
 
-static bool migrate_cap_set(int cap, bool value, Error **errp)
-{
-    MigrationState *s = migrate_get_current();
-    bool new_caps[MIGRATION_CAPABILITY__MAX];
-
-    if (migration_is_running(s->state)) {
-        error_setg(errp, QERR_MIGRATION_ACTIVE);
-        return false;
-    }
-
-    memcpy(new_caps, s->capabilities, sizeof(new_caps));
-    new_caps[cap] = value;
-
-    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
-        return false;
-    }
-    s->capabilities[cap] = value;
-    return true;
-}
-
 static void migrate_set_block_incremental(MigrationState *s, bool value)
 {
     s->parameters.block_incremental = value;
diff --git a/migration/options.c b/migration/options.c
index 4cbe77e35a..f3b2d6e482 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qmp/qerror.h"
 #include "sysemu/runstate.h"
 #include "migration.h"
 #include "ram.h"
@@ -392,6 +393,26 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
     return true;
 }
 
+bool migrate_cap_set(int cap, bool value, Error **errp)
+{
+    MigrationState *s = migrate_get_current();
+    bool new_caps[MIGRATION_CAPABILITY__MAX];
+
+    if (migration_is_running(s->state)) {
+        error_setg(errp, QERR_MIGRATION_ACTIVE);
+        return false;
+    }
+
+    memcpy(new_caps, s->capabilities, sizeof(new_caps));
+    new_caps[cap] = value;
+
+    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
+        return false;
+    }
+    s->capabilities[cap] = value;
+    return true;
+}
+
 MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
 {
     MigrationCapabilityStatusList *head = NULL, **tail = &head;
diff --git a/migration/options.h b/migration/options.h
index e779f14161..5979e4ff90 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -41,5 +41,6 @@ bool migrate_zero_copy_send(void);
 /* capabilities helpers */
 
 bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
+bool migrate_cap_set(int cap, bool value, Error **errp);
 
 #endif
-- 
2.39.2


