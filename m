Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A376A8702
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:41:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltD-0006Ky-Rf; Thu, 02 Mar 2023 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlsw-000672-EB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlsu-0007DU-RP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0HV/kXml4P5842yvs0TV9UWcCO8XWY2YK7v2yQj0os=;
 b=Ucn4kzYiWXc9gEnRuKnZMe8g7qidCPcG0ovCQn5TY8szilbTn+QX86n4TyznBkTxKY55Yk
 QlLgsSFYe/pVK7QbmPn/oRR7WZP+nsu1pxXJebR93BIbLjMlRaHtrDZ9VCQsrAu/uxfBjg
 avAQFghEXDdsGHn4QCtwEggxOqhs82Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-p4uHMXW5Ora8kzyDjwU41A-1; Thu, 02 Mar 2023 11:34:21 -0500
X-MC-Unique: p4uHMXW5Ora8kzyDjwU41A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A59FD385F36B;
 Thu,  2 Mar 2023 16:34:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1F9E492C3E;
 Thu,  2 Mar 2023 16:34:18 +0000 (UTC)
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
Subject: [PATCH 03/43] migration: Create migration_cap_set()
Date: Thu,  2 Mar 2023 17:33:30 +0100
Message-Id: <20230302163410.11399-4-quintela@redhat.com>
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

And remove the convoluted use of qmp_migrate_set_capabilities() to
enable disable MIGRATION_CAPABILITY_BLOCK.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 119027a656..e3062530f0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1910,25 +1910,24 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
@@ -1940,7 +1939,7 @@ static void block_cleanup_parameters(MigrationState *s)
 {
     if (s->must_remove_block_options) {
         /* setting to false can never fail */
-        migrate_set_block_enabled(false, &error_abort);
+        migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
         migrate_set_block_incremental(s, false);
         s->must_remove_block_options = false;
     }
@@ -2427,8 +2426,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
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


