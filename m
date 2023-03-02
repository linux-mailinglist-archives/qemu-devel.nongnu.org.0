Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC766A8705
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:41:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltD-0006LY-Rj; Thu, 02 Mar 2023 11:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt3-0006Gc-2g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt0-0007FM-OQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtKAThh7Qu5vP3N53Vr3XZfnfm7whtBCeT0zArtkwqk=;
 b=V6SWso243syPsbfXh3hdt0tDAh30gm/TQPUs6+CL5a2Og40ma/AByL/76TERodq2BXPoTZ
 FGpgWGueG0i5emvvBTE9sPQn/22tGxUgtgeCOVwPMm7nVOLLlFm5GBPz7IOQvoRDdW2LBL
 NbDrCMJaXhYGyo0k5WrfH6jELa7T2To=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-IzcGRuRYOhykMrjMtKmhBw-1; Thu, 02 Mar 2023 11:34:27 -0500
X-MC-Unique: IzcGRuRYOhykMrjMtKmhBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CD47885620;
 Thu,  2 Mar 2023 16:34:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E91A492C3E;
 Thu,  2 Mar 2023 16:34:25 +0000 (UTC)
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
Subject: [PATCH 06/43] migration: Move migrate_use_compression() to options.c
Date: Thu,  2 Mar 2023 17:33:33 +0100
Message-Id: <20230302163410.11399-7-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_compress()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/migration.c | 11 +----------
 migration/options.c   |  9 +++++++++
 migration/ram.c       | 16 ++++++++--------
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 1ac11fdba9..394728dd44 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -432,7 +432,6 @@ bool migrate_use_return_path(void);
 
 uint64_t ram_get_total_transferred_pages(void);
 
-bool migrate_use_compression(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
diff --git a/migration/options.h b/migration/options.h
index 5d2d4298cd..aa9c165c94 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -21,6 +21,7 @@
 bool migrate_auto_converge(void);
 bool migrate_background_snapshot(void);
 bool migrate_colo(void);
+bool migrate_compress(void);
 bool migrate_dirty_bitmaps(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
diff --git a/migration/migration.c b/migration/migration.c
index 03884f2f73..661c7c33d8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1131,7 +1131,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
         info->xbzrle_cache->overflow = xbzrle_counters.overflow;
     }
 
-    if (migrate_use_compression()) {
+    if (migrate_compress()) {
         info->compression = g_malloc0(sizeof(*info->compression));
         info->compression->pages = compression_counters.pages;
         info->compression->busy = compression_counters.busy;
@@ -2520,15 +2520,6 @@ bool migrate_postcopy(void)
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
diff --git a/migration/options.c b/migration/options.c
index 6904d054a9..d1c44462c5 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -41,6 +41,15 @@ bool migrate_colo(void)
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
diff --git a/migration/ram.c b/migration/ram.c
index 1c786eb8f4..fb868312f4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -591,7 +591,7 @@ static void compress_threads_save_cleanup(void)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression() || !comp_param) {
+    if (!migrate_compress() || !comp_param) {
         return;
     }
 
@@ -630,7 +630,7 @@ static int compress_threads_save_setup(void)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return 0;
     }
     thread_count = migrate_compress_threads();
@@ -1161,7 +1161,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
         rs->xbzrle_bytes_prev = xbzrle_counters.bytes;
     }
 
-    if (migrate_use_compression()) {
+    if (migrate_compress()) {
         compression_counters.busy_rate = (double)(compression_counters.busy -
             rs->compress_thread_busy_prev) / page_count;
         rs->compress_thread_busy_prev = compression_counters.busy;
@@ -2276,7 +2276,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
 
 static bool save_page_use_compression(RAMState *rs)
 {
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return false;
     }
 
@@ -3739,7 +3739,7 @@ static int wait_for_decompress_done(void)
 {
     int idx, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return 0;
     }
 
@@ -3758,7 +3758,7 @@ static void compress_threads_load_cleanup(void)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return;
     }
     thread_count = migrate_decompress_threads();
@@ -3799,7 +3799,7 @@ static int compress_threads_load_setup(QEMUFile *f)
 {
     int i, thread_count;
 
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         return 0;
     }
 
@@ -4265,7 +4265,7 @@ static int ram_load_precopy(QEMUFile *f)
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = migration_incoming_postcopy_advised();
-    if (!migrate_use_compression()) {
+    if (!migrate_compress()) {
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
 
-- 
2.39.2


