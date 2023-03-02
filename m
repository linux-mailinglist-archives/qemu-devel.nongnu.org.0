Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A16A86DB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltb-0008LF-4w; Thu, 02 Mar 2023 11:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltY-0008Hq-Sk
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltX-0007V4-7O
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/xriMu3wRawDUgddzVeSEg4tSTuNO7UymYYzQD1wLc=;
 b=eDo+eKnnV0AXX0xuYTOKUeovz8orAuxKqncbIRr7z4psijXt7A/MX5nO+U2+jCaaO8DD/t
 S62s1bOIOejG8wiLmvakYgVYO84EVz/0MXQGOhXs2olSeOgaVeUXcotSkop/itle3+dtyL
 d6qJti1eYGbfu344SwHEIKBXi090gOQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-m29IixrDO9-OUrtfFnYG5g-1; Thu, 02 Mar 2023 11:35:00 -0500
X-MC-Unique: m29IixrDO9-OUrtfFnYG5g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EBD33804515;
 Thu,  2 Mar 2023 16:34:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63FCF492C3E;
 Thu,  2 Mar 2023 16:34:57 +0000 (UTC)
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
Subject: [PATCH 17/43] migration: Move migrate_cap_set() to options.c
Date: Thu,  2 Mar 2023 17:33:44 +0100
Message-Id: <20230302163410.11399-18-quintela@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 migration/options.h   |  1 +
 migration/migration.c | 20 --------------------
 migration/options.c   | 21 +++++++++++++++++++++
 3 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 2f928eb563..c4ca321b98 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -43,5 +43,6 @@ bool migrate_zero_copy_send(void);
 /* capabilities helpers */
 
 bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
+bool migrate_cap_set(int cap, bool value, Error **errp);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 1dd2ccf9ee..219ca3d37a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1664,26 +1664,6 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
index 1436bf42c2..cd0ffb8a20 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qmp/qerror.h"
 #include "sysemu/runstate.h"
 #include "migration.h"
 #include "ram.h"
@@ -394,6 +395,26 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
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
-- 
2.39.2


