Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD12B6A86CE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltF-0006RJ-46; Thu, 02 Mar 2023 11:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt7-0006Jm-I0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt5-0007GJ-Lu
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OABLIhMGsB/k7QWfanJGjHNB0bNFcak0lyPB6W/1Mqc=;
 b=Egx2w10PaCeQcAowzIMEIe3FhdgXDtd04ChWjOQlu6kLxMEjLYXjUnmp0ZzXVOpAPBet7e
 6KlIutWsf/0dXCN7Zr0lsgDW/W0KEINDLgAMrqCjK/+o3U4bsKvANev1clkREbxpUs/DwW
 oRYB0JlrhShLK5NE8I59Q1r8vE5lVkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-MmZ3UfEeMJqVwOCFlYWREA-1; Thu, 02 Mar 2023 11:34:26 -0500
X-MC-Unique: MmZ3UfEeMJqVwOCFlYWREA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AC958027FD;
 Thu,  2 Mar 2023 16:34:25 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 579AC492B00;
 Thu,  2 Mar 2023 16:34:23 +0000 (UTC)
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
Subject: [PATCH 05/43] migration: Move migrate_colo_enabled() to options.c
Date: Thu,  2 Mar 2023 17:33:32 +0100
Message-Id: <20230302163410.11399-6-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_colo() to be
consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/migration.c | 16 +++++-----------
 migration/options.c   |  6 ++++++
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 68851e485d..1ac11fdba9 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -424,7 +424,6 @@ bool migrate_use_zero_copy_send(void);
 int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
-bool migrate_colo_enabled(void);
 
 bool migrate_use_block(void);
 bool migrate_use_block_incremental(void);
diff --git a/migration/options.h b/migration/options.h
index bae032375a..5d2d4298cd 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -20,6 +20,7 @@
 
 bool migrate_auto_converge(void);
 bool migrate_background_snapshot(void);
+bool migrate_colo(void);
 bool migrate_dirty_bitmaps(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
diff --git a/migration/migration.c b/migration/migration.c
index 790848ef1c..03884f2f73 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2409,7 +2409,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     }
 
     if (blk || blk_inc) {
-        if (migrate_colo_enabled()) {
+        if (migrate_colo()) {
             error_setg(errp, "No disk migration is required in COLO mode");
             return false;
         }
@@ -3290,7 +3290,7 @@ static void migration_completion(MigrationState *s)
         ret = global_state_store();
 
         if (!ret) {
-            bool inactivate = !migrate_colo_enabled();
+            bool inactivate = !migrate_colo();
             ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
             trace_migration_completion_vm_stop(ret);
             if (ret >= 0) {
@@ -3349,7 +3349,7 @@ static void migration_completion(MigrationState *s)
         goto fail_invalidate;
     }
 
-    if (migrate_colo_enabled() && s->state == MIGRATION_STATUS_ACTIVE) {
+    if (migrate_colo() && s->state == MIGRATION_STATUS_ACTIVE) {
         /* COLO does not support postcopy */
         migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
                           MIGRATION_STATUS_COLO);
@@ -3427,12 +3427,6 @@ fail:
                       MIGRATION_STATUS_FAILED);
 }
 
-bool migrate_colo_enabled(void)
-{
-    MigrationState *s = migrate_get_current();
-    return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
-}
-
 typedef enum MigThrError {
     /* No error detected */
     MIG_THR_ERR_NONE = 0,
@@ -3763,7 +3757,7 @@ static void migration_iteration_finish(MigrationState *s)
         runstate_set(RUN_STATE_POSTMIGRATE);
         break;
     case MIGRATION_STATUS_COLO:
-        if (!migrate_colo_enabled()) {
+        if (!migrate_colo()) {
             error_report("%s: critical error: calling COLO code without "
                          "COLO enabled", __func__);
         }
@@ -3959,7 +3953,7 @@ static void *migration_thread(void *opaque)
         qemu_savevm_send_postcopy_advise(s->to_dst_file);
     }
 
-    if (migrate_colo_enabled()) {
+    if (migrate_colo()) {
         /* Notify migration destination that we enable COLO */
         qemu_savevm_send_colo_enable(s->to_dst_file);
     }
diff --git a/migration/options.c b/migration/options.c
index 47337a9a29..6904d054a9 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -35,6 +35,12 @@ bool migrate_background_snapshot(void)
     return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_colo(void)
+{
+    MigrationState *s = migrate_get_current();
+    return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
+}
+
 bool migrate_dirty_bitmaps(void)
 {
     MigrationState *s;
-- 
2.39.2


