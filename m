Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A26E960A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:42:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUX1-0004To-GK; Thu, 20 Apr 2023 09:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWx-0004O1-Mw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWw-0005zC-7g
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phOfzRXJoKlGUXTaPHFPkHS6a/ljDg3jq5lCIBPanlU=;
 b=P1lGfHnApFBZr+rf3lizKGybIhQ7mrgVXZRu6C9khpn1q2Vd7V2qBrk89z/ga07PkjQkBC
 0nQfpXiXOxvL1Ze0rAIUSvQWB5t1IqY8XulpxJD8PNAE5ry7YMuujyKkMRJqWeUHP16mja
 jpmdMbXfQxXIEKdsu3K4vYT7V5W473Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-1bghk8kRO1uI-yllu4l0Cg-1; Thu, 20 Apr 2023 09:40:53 -0400
X-MC-Unique: 1bghk8kRO1uI-yllu4l0Cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16BA81C0897A;
 Thu, 20 Apr 2023 13:40:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EC184020BEE;
 Thu, 20 Apr 2023 13:40:50 +0000 (UTC)
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
Subject: [PATCH v2 16/43] migration: Move qmp_migrate_set_capabilities() to
 options.c
Date: Thu, 20 Apr 2023 15:39:35 +0200
Message-Id: <20230420134002.29531-17-quintela@redhat.com>
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
 migration/migration.c | 26 --------------------------
 migration/options.c   | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bc796879c0..854be12ca6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1223,32 +1223,6 @@ MigrationInfo *qmp_query_migrate(Error **errp)
     return info;
 }
 
-void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
-                                  Error **errp)
-{
-    MigrationState *s = migrate_get_current();
-    MigrationCapabilityStatusList *cap;
-    bool new_caps[MIGRATION_CAPABILITY__MAX];
-
-    if (migration_is_running(s->state)) {
-        error_setg(errp, QERR_MIGRATION_ACTIVE);
-        return;
-    }
-
-    memcpy(new_caps, s->capabilities, sizeof(new_caps));
-    for (cap = params; cap; cap = cap->next) {
-        new_caps[cap->value->capability] = cap->value->state;
-    }
-
-    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
-        return;
-    }
-
-    for (cap = params; cap; cap = cap->next) {
-        s->capabilities[cap->value->capability] = cap->value->state;
-    }
-}
-
 /*
  * Check whether the parameters are valid. Error will be put into errp
  * (if provided). Return true if valid, otherwise false.
diff --git a/migration/options.c b/migration/options.c
index ff621bdeb3..4cbe77e35a 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -413,3 +413,29 @@ MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
 
     return head;
 }
+
+void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
+                                  Error **errp)
+{
+    MigrationState *s = migrate_get_current();
+    MigrationCapabilityStatusList *cap;
+    bool new_caps[MIGRATION_CAPABILITY__MAX];
+
+    if (migration_is_running(s->state)) {
+        error_setg(errp, QERR_MIGRATION_ACTIVE);
+        return;
+    }
+
+    memcpy(new_caps, s->capabilities, sizeof(new_caps));
+    for (cap = params; cap; cap = cap->next) {
+        new_caps[cap->value->capability] = cap->value->state;
+    }
+
+    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
+        return;
+    }
+
+    for (cap = params; cap; cap = cap->next) {
+        s->capabilities[cap->value->capability] = cap->value->state;
+    }
+}
-- 
2.39.2


