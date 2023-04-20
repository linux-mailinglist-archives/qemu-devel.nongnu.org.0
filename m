Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E46E95FE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:41:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWN-0003pO-30; Thu, 20 Apr 2023 09:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWL-0003oL-2D
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWJ-0005gK-70
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmn40ihQ+Tw1GGdVR1e0HZoctLKora7ccUUnZwFEQP4=;
 b=E/VZv5t8/xIn1wWz3YTiZ6YfQikxkUy3rLeAlfeaEehAghGp93oGl1C6OggiubGefgFySx
 i9k3Sp61PzcxM93/+b6vmp5GrP7t8M1SMt7CsI0JXfd7u1nLxiBCsuiR45Er+VwKTZpA5U
 UqEOwPYh1NCwCmTkMIpX5CZYKEAZJnU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446--_L65ptzNvireMbEee0BKA-1; Thu, 20 Apr 2023 09:40:15 -0400
X-MC-Unique: -_L65ptzNvireMbEee0BKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9799381D4C3;
 Thu, 20 Apr 2023 13:40:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62D634020BED;
 Thu, 20 Apr 2023 13:40:12 +0000 (UTC)
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
Subject: [PATCH v2 03/43] migration: Create migration_cap_set()
Date: Thu, 20 Apr 2023 15:39:22 +0200
Message-Id: <20230420134002.29531-4-quintela@redhat.com>
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

And remove the convoluted use of qmp_migrate_set_capabilities() to
enable disable MIGRATION_CAPABILITY_BLOCK.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 74f28cdca6..4bf5df4778 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1913,25 +1913,24 @@ void migrate_set_state(int *state, int old_state, int new_state)
     }
 }
 
-static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
-                                                  bool state)
+static bool migrate_cap_set(int cap, bool value, Error **errp)
 {
-    MigrationCapabilityStatus *cap;
+    MigrationState *s = migrate_get_current();
+    bool new_caps[MIGRATION_CAPABILITY__MAX];
 
-    cap = g_new0(MigrationCapabilityStatus, 1);
-    cap->capability = index;
-    cap->state = state;
+    if (migration_is_running(s->state)) {
+        error_setg(errp, QERR_MIGRATION_ACTIVE);
+        return false;
+    }
 
-    return cap;
-}
+    memcpy(new_caps, s->capabilities, sizeof(new_caps));
+    new_caps[cap] = value;
 
-void migrate_set_block_enabled(bool value, Error **errp)
-{
-    MigrationCapabilityStatusList *cap = NULL;
-
-    QAPI_LIST_PREPEND(cap, migrate_cap_add(MIGRATION_CAPABILITY_BLOCK, value));
-    qmp_migrate_set_capabilities(cap, errp);
-    qapi_free_MigrationCapabilityStatusList(cap);
+    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
+        return false;
+    }
+    s->capabilities[cap] = value;
+    return true;
 }
 
 static void migrate_set_block_incremental(MigrationState *s, bool value)
@@ -1943,7 +1942,7 @@ static void block_cleanup_parameters(MigrationState *s)
 {
     if (s->must_remove_block_options) {
         /* setting to false can never fail */
-        migrate_set_block_enabled(false, &error_abort);
+        migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
         migrate_set_block_incremental(s, false);
         s->must_remove_block_options = false;
     }
@@ -2430,8 +2429,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
                        "current migration capabilities");
             return false;
         }
-        migrate_set_block_enabled(true, &local_err);
-        if (local_err) {
+        if (!migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, true, &local_err)) {
             error_propagate(errp, local_err);
             return false;
         }
-- 
2.39.2


