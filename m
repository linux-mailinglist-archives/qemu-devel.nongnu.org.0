Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C786ECE24
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:29:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwFl-0007SK-AB; Mon, 24 Apr 2023 09:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEY-0006Il-7j
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEW-0001Hz-JV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qN2Z3OFhk0+jCKZH+8XTd3cVrrVdDBuNBmTpza50kc=;
 b=dhA2fLflpH2NJrXDSSYqOdgVfaxfn9I4NeklexngkSgzptJaea2HWQXXkEbmxo382vFR6W
 9Yor0YkNBMGmL+aJdSqLDpu6PGECQnCseZd9TIFdiRBN1GaEhW6g1ALab+SVXpLw08eTcc
 MNxOZ/e1/yRmb323NFDFuANvmkTbX+o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-u8Z6L3T-OLyX_or29Mul6g-1; Mon, 24 Apr 2023 09:27:54 -0400
X-MC-Unique: u8Z6L3T-OLyX_or29Mul6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9F1887A9E2;
 Mon, 24 Apr 2023 13:27:53 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C0D214171B8;
 Mon, 24 Apr 2023 13:27:51 +0000 (UTC)
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
Subject: [PULL 06/30] migration: Move migrate_colo_enabled() to options.c
Date: Mon, 24 Apr 2023 15:27:06 +0200
Message-Id: <20230424132730.70752-7-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 16 +++++-----------
 migration/migration.h |  1 -
 migration/options.c   |  6 ++++++
 migration/options.h   |  1 +
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d8c9166200..7dfc31eeb8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2411,7 +2411,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     }
 
     if (blk || blk_inc) {
-        if (migrate_colo_enabled()) {
+        if (migrate_colo()) {
             error_setg(errp, "No disk migration is required in COLO mode");
             return false;
         }
@@ -3299,7 +3299,7 @@ static void migration_completion(MigrationState *s)
                                             MIGRATION_STATUS_DEVICE);
             }
             if (ret >= 0) {
-                s->block_inactive = !migrate_colo_enabled();
+                s->block_inactive = !migrate_colo();
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
                                                          s->block_inactive);
@@ -3352,7 +3352,7 @@ static void migration_completion(MigrationState *s)
         goto fail_invalidate;
     }
 
-    if (migrate_colo_enabled() && s->state == MIGRATION_STATUS_ACTIVE) {
+    if (migrate_colo() && s->state == MIGRATION_STATUS_ACTIVE) {
         /* COLO does not support postcopy */
         migrate_set_state(&s->state, MIGRATION_STATUS_ACTIVE,
                           MIGRATION_STATUS_COLO);
@@ -3431,12 +3431,6 @@ fail:
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
@@ -3767,7 +3761,7 @@ static void migration_iteration_finish(MigrationState *s)
         runstate_set(RUN_STATE_POSTMIGRATE);
         break;
     case MIGRATION_STATUS_COLO:
-        if (!migrate_colo_enabled()) {
+        if (!migrate_colo()) {
             error_report("%s: critical error: calling COLO code without "
                          "COLO enabled", __func__);
         }
@@ -3963,7 +3957,7 @@ static void *migration_thread(void *opaque)
         qemu_savevm_send_postcopy_advise(s->to_dst_file);
     }
 
-    if (migrate_colo_enabled()) {
+    if (migrate_colo()) {
         /* Notify migration destination that we enable COLO */
         qemu_savevm_send_colo_enable(s->to_dst_file);
     }
diff --git a/migration/migration.h b/migration/migration.h
index a25fed6ef0..42f0c68b6f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -463,7 +463,6 @@ bool migrate_use_zero_copy_send(void);
 int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
-bool migrate_colo_enabled(void);
 
 bool migrate_use_block(void);
 bool migrate_use_block_incremental(void);
diff --git a/migration/options.c b/migration/options.c
index 88a9a45913..bd33c5da0a 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -33,6 +33,12 @@ bool migrate_background_snapshot(void)
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
diff --git a/migration/options.h b/migration/options.h
index 0dfa0af245..2a0ee61ff8 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -18,6 +18,7 @@
 
 bool migrate_auto_converge(void);
 bool migrate_background_snapshot(void);
+bool migrate_colo(void);
 bool migrate_dirty_bitmaps(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
-- 
2.39.2


