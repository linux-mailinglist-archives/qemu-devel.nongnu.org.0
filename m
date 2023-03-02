Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A692D6A86B3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:35:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlsy-000682-VR; Thu, 02 Mar 2023 11:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlss-00065Q-Pv
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlsq-0007CK-U5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgDh/Y2Of4zIROJLEjlKrhCwNenBgGZXKPd7oXbBBFk=;
 b=ffIy4fDmPtbv3pQ7B6wITg4UNSR5K7jmihoqM3nQluWvVDtAHOsmvZqDj2h2QRuEmv0zuH
 CfOGJy9+n0mqJSp2wZmLrFU5XobYwo2YVMeyDSPHKpxRDADtl7cV4bDz01voM1FkqLu7op
 9AdVo+Ur0YUKhNEhUArEFzuOIrc9xL0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-sWRQSv26N5qOjv7x0JQ7qQ-1; Thu, 02 Mar 2023 11:34:16 -0500
X-MC-Unique: sWRQSv26N5qOjv7x0JQ7qQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2F5E885622;
 Thu,  2 Mar 2023 16:34:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD489492B00;
 Thu,  2 Mar 2023 16:34:13 +0000 (UTC)
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
Subject: [PATCH 01/43] migration: rename enabled_capabilities to capabilities
Date: Thu,  2 Mar 2023 17:33:28 +0100
Message-Id: <20230302163410.11399-2-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

It is clear from the context what that means, and such a long name
with the extra long names of the capabilities make very difficilut to
stay inside the 80 columns limit.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  2 +-
 migration/migration.c | 52 +++++++++++++++++++++----------------------
 migration/rdma.c      |  4 ++--
 migration/savevm.c    |  6 ++---
 4 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..b07efaf259 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -299,7 +299,7 @@ struct MigrationState {
     int64_t downtime_start;
     int64_t downtime;
     int64_t expected_downtime;
-    bool enabled_capabilities[MIGRATION_CAPABILITY__MAX];
+    bool capabilities[MIGRATION_CAPABILITY__MAX];
     int64_t setup_time;
     /*
      * Whether guest was running when we enter the completion stage.
diff --git a/migration/migration.c b/migration/migration.c
index 67799f0958..f7e7c4f2b3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -363,8 +363,7 @@ static bool migrate_late_block_activate(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[
-        MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
+    return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
 }
 
 /*
@@ -943,7 +942,7 @@ MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
 #endif
         caps = g_malloc0(sizeof(*caps));
         caps->capability = i;
-        caps->state = s->enabled_capabilities[i];
+        caps->state = s->capabilities[i];
         QAPI_LIST_APPEND(tail, caps);
     }
 
@@ -1462,13 +1461,13 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
         return;
     }
 
-    memcpy(cap_list, s->enabled_capabilities, sizeof(cap_list));
+    memcpy(cap_list, s->capabilities, sizeof(cap_list));
     if (!migrate_caps_check(cap_list, params, errp)) {
         return;
     }
 
     for (cap = params; cap; cap = cap->next) {
-        s->enabled_capabilities[cap->value->capability] = cap->value->state;
+        s->capabilities[cap->value->capability] = cap->value->state;
     }
 }
 
@@ -2537,7 +2536,7 @@ bool migrate_release_ram(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
+    return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
 }
 
 bool migrate_postcopy_ram(void)
@@ -2546,7 +2545,7 @@ bool migrate_postcopy_ram(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
 }
 
 bool migrate_postcopy(void)
@@ -2560,7 +2559,7 @@ bool migrate_auto_converge(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
+    return s->capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
 }
 
 bool migrate_zero_blocks(void)
@@ -2569,7 +2568,7 @@ bool migrate_zero_blocks(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
+    return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
 }
 
 bool migrate_postcopy_blocktime(void)
@@ -2578,7 +2577,7 @@ bool migrate_postcopy_blocktime(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
 }
 
 bool migrate_use_compression(void)
@@ -2587,7 +2586,7 @@ bool migrate_use_compression(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS];
+    return s->capabilities[MIGRATION_CAPABILITY_COMPRESS];
 }
 
 int migrate_compress_level(void)
@@ -2632,7 +2631,7 @@ bool migrate_dirty_bitmaps(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
+    return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
 }
 
 bool migrate_ignore_shared(void)
@@ -2641,7 +2640,7 @@ bool migrate_ignore_shared(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
+    return s->capabilities[MIGRATION_CAPABILITY_X_IGNORE_SHARED];
 }
 
 bool migrate_validate_uuid(void)
@@ -2650,7 +2649,7 @@ bool migrate_validate_uuid(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
+    return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
 }
 
 bool migrate_use_events(void)
@@ -2659,7 +2658,7 @@ bool migrate_use_events(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_EVENTS];
+    return s->capabilities[MIGRATION_CAPABILITY_EVENTS];
 }
 
 bool migrate_use_multifd(void)
@@ -2668,7 +2667,7 @@ bool migrate_use_multifd(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
+    return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
 bool migrate_pause_before_switchover(void)
@@ -2677,8 +2676,7 @@ bool migrate_pause_before_switchover(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[
-        MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
+    return s->capabilities[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
 }
 
 int migrate_multifd_channels(void)
@@ -2725,7 +2723,7 @@ bool migrate_use_zero_copy_send(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
+    return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
 }
 #endif
 
@@ -2744,7 +2742,7 @@ int migrate_use_xbzrle(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_XBZRLE];
+    return s->capabilities[MIGRATION_CAPABILITY_XBZRLE];
 }
 
 uint64_t migrate_xbzrle_cache_size(void)
@@ -2771,7 +2769,7 @@ bool migrate_use_block(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_BLOCK];
+    return s->capabilities[MIGRATION_CAPABILITY_BLOCK];
 }
 
 bool migrate_use_return_path(void)
@@ -2780,7 +2778,7 @@ bool migrate_use_return_path(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
+    return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
 }
 
 bool migrate_use_block_incremental(void)
@@ -2798,7 +2796,7 @@ bool migrate_background_snapshot(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
+    return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
 bool migrate_postcopy_preempt(void)
@@ -2807,7 +2805,7 @@ bool migrate_postcopy_preempt(void)
 
     s = migrate_get_current();
 
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
+    return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
 }
 
 /* migration thread support */
@@ -3546,7 +3544,7 @@ fail:
 bool migrate_colo_enabled(void)
 {
     MigrationState *s = migrate_get_current();
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
+    return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
 }
 
 typedef enum MigThrError {
@@ -4381,7 +4379,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
 }
 
 #define DEFINE_PROP_MIG_CAP(name, x)             \
-    DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
+    DEFINE_PROP_BOOL(name, MigrationState, capabilities[x], false)
 
 static Property migration_properties[] = {
     DEFINE_PROP_BOOL("store-global-state", MigrationState,
@@ -4578,7 +4576,7 @@ static bool migration_object_check(MigrationState *ms, Error **errp)
     }
 
     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (ms->enabled_capabilities[i]) {
+        if (ms->capabilities[i]) {
             QAPI_LIST_PREPEND(head, migrate_cap_add(i, true));
         }
     }
diff --git a/migration/rdma.c b/migration/rdma.c
index 288eadc2d2..35f3d6bebe 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4178,7 +4178,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     ret = qemu_rdma_source_init(rdma,
-        s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+        s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
 
     if (ret) {
         goto err;
@@ -4200,7 +4200,7 @@ void rdma_start_outgoing_migration(void *opaque,
         }
 
         ret = qemu_rdma_source_init(rdma_return_path,
-            s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
+            s->capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
 
         if (ret) {
             goto return_path_err;
diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..589ef926ab 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -253,7 +253,7 @@ static uint32_t get_validatable_capabilities_count(void)
     uint32_t result = 0;
     int i;
     for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (should_validate_capability(i) && s->enabled_capabilities[i]) {
+        if (should_validate_capability(i) && s->capabilities[i]) {
             result++;
         }
     }
@@ -275,7 +275,7 @@ static int configuration_pre_save(void *opaque)
     state->capabilities = g_renew(MigrationCapability, state->capabilities,
                                   state->caps_count);
     for (i = j = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
-        if (should_validate_capability(i) && s->enabled_capabilities[i]) {
+        if (should_validate_capability(i) && s->capabilities[i]) {
             state->capabilities[j++] = i;
         }
     }
@@ -325,7 +325,7 @@ static bool configuration_validate_capabilities(SaveState *state)
             continue;
         }
         source_state = test_bit(i, source_caps_bm);
-        target_state = s->enabled_capabilities[i];
+        target_state = s->capabilities[i];
         if (source_state != target_state) {
             error_report("Capability %s is %s, but received capability is %s",
                          MigrationCapability_str(i),
-- 
2.39.2


