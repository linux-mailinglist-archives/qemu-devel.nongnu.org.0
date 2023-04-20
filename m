Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C186E965B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:53:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWX-0003uY-Uv; Thu, 20 Apr 2023 09:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWU-0003rj-SM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWT-0005kR-4H
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKxiGVXdtKeEblrxuDwHBqOXazy2WQkJc0+ntTO+Tzo=;
 b=SSEq7LUQRBG3rJlpzcKId2jvN13R0kJilS2/h2rDbACeIcbH91/LLi3Q+rEzaPitj7Hi7W
 XokAJi1qUI7cGnhdsF9V5Ue7DmUUDQzHNg20EXBqhReho0OYolXU6F3O3PbI1sbR2xTClz
 N+Mm36BFX6qQD911PLAOpHYCrmFqHhQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-Ki_AdqpZNXOAXenHw2T0Pw-1; Thu, 20 Apr 2023 09:40:24 -0400
X-MC-Unique: Ki_AdqpZNXOAXenHw2T0Pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03335280AA2E;
 Thu, 20 Apr 2023 13:40:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38A0E4020BED;
 Thu, 20 Apr 2023 13:40:21 +0000 (UTC)
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
Subject: [PATCH v2 06/43] migration: Move migrate_use_compression() to
 options.c
Date: Thu, 20 Apr 2023 15:39:25 +0200
Message-Id: <20230420134002.29531-7-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_compress()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 11 +----------
 migration/migration.h |  1 -
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 migration/ram.c       | 16 ++++++++--------
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c1ffb3c180..4f77e7e1b3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1133,7 +1133,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
         info->xbzrle_cache->overflow = xbzrle_counters.overflow;
     }
 
-    if (migrate_use_compression()) {
+    if (migrate_compress()) {
         info->compression = g_malloc0(sizeof(*info->compression));
         info->compression->pages = compression_counters.pages;
         info->compression->busy = compression_counters.busy;
@@ -2523,15 +2523,6 @@ bool migrate_postcopy(void)
     return migrate_postcopy_ram() || migrate_dirty_bitmaps();
 }
 
-bool migrate_use_compression(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_COMPRESS];
-}
-
 int migrate_compress_level(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 42f0c68b6f..77aa91c840 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -471,7 +471,6 @@ bool migrate_use_return_path(void);
 
 uint64_t ram_get_total_transferred_pages(void);
 
-bool migrate_use_compression(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
diff --git a/migration/options.c b/migration/options.c
index bd33c5da0a..fa7a13d3dc 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -39,6 +39,15 @@ bool migrate_colo(void)
     return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
 }
 
+bool migrate_compress(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_COMPRESS];
+}
+
 bool migrate_dirty_bitmaps(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index 2a0ee61ff8..da2193fd94 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -19,6 +19,7 @@
 bool migrate_auto_converge(void);
 bool migrate_background_snapshot(void);
 bool migrate_colo(void);
+bool migrate_compress(void);
 bool migrate_dirty_bitmaps(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
diff --git a/migration/ram.c b/migration/ram.c
index 4019fb6500..9bb7cbd4bb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -586,7 +586,7 @@ static void compress_threads_save_cleanup(void)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression() || !comp_param) {
+    if (!migrate_compress() || !comp_param) {
         return;
     }
 
@@ -625,7 +625,7 @@ static int compress_threads_save_setup(void)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return 0;
     }
     thread_count = migrate_compress_threads();
@@ -1156,7 +1156,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
         rs->xbzrle_bytes_prev = xbzrle_counters.bytes;
     }
 
-    if (migrate_use_compression()) {
+    if (migrate_compress()) {
         compression_counters.busy_rate = (double)(compression_counters.busy -
             rs->compress_thread_busy_prev) / page_count;
         rs->compress_thread_busy_prev = compression_counters.busy;
@@ -2272,7 +2272,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
 
 static bool save_page_use_compression(RAMState *rs)
 {
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return false;
     }
 
@@ -3736,7 +3736,7 @@ static int wait_for_decompress_done(void)
 {
     int idx, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return 0;
     }
 
@@ -3755,7 +3755,7 @@ static void compress_threads_load_cleanup(void)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return;
     }
     thread_count = migrate_decompress_threads();
@@ -3796,7 +3796,7 @@ static int compress_threads_load_setup(QEMUFile *f)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return 0;
     }
 
@@ -4262,7 +4262,7 @@ static int ram_load_precopy(QEMUFile *f)
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = migration_incoming_postcopy_advised();
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
 
-- 
2.39.2


