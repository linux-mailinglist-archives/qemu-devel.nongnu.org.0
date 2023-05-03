Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B195F6F54A7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ke-0004g7-20; Wed, 03 May 2023 05:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kZ-0004eV-Rj
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kX-00021z-Kr
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHBO4s/UNvKYohfBJJwq43wMwIPGWXuavyCOYVzB90U=;
 b=Bz+PBCTYIM1NlP2IKnXgTE6hhQkM7W4R5lLOIGTrK7f5BSIgmu/5qJRDhozlosnLCoPqNK
 KgA1w9FMt0Z92kSz/AS+sX19Fw78ny9mJXICrUN26T4MqYeG7az0XQYA+SSlThEqCUO+f1
 JZXFruJ0rFHuJ+2G2G8vHUnBfL0FPYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-CX2kIsJbO2aZCh95lTfUuw-1; Wed, 03 May 2023 05:26:12 -0400
X-MC-Unique: CX2kIsJbO2aZCh95lTfUuw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9044A0F396;
 Wed,  3 May 2023 09:26:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2E0F492C3E;
 Wed,  3 May 2023 09:26:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 3/8] migration: Rename ram_counters to mig_stats
Date: Wed,  3 May 2023 11:26:01 +0200
Message-Id: <20230503092606.9415-4-quintela@redhat.com>
In-Reply-To: <20230503092606.9415-1-quintela@redhat.com>
References: <20230503092606.9415-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

migration_stats is just too long, and it is going to have more than
ram counters in the near future.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/migration-stats.c |  2 +-
 migration/migration-stats.h |  2 +-
 migration/migration.c       | 32 ++++++++++++-------------
 migration/multifd.c         |  6 ++---
 migration/ram.c             | 48 ++++++++++++++++++-------------------
 migration/savevm.c          |  2 +-
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/migration/migration-stats.c b/migration/migration-stats.c
index b0eb5ae73c..8c0af9b80a 100644
--- a/migration/migration-stats.c
+++ b/migration/migration-stats.c
@@ -14,4 +14,4 @@
 #include "qemu/stats64.h"
 #include "migration-stats.h"
 
-RAMStats ram_counters;
+RAMStats mig_stats;
diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index 2edea0c779..197374b4f6 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -36,6 +36,6 @@ typedef struct {
     Stat64 transferred;
 } RAMStats;
 
-extern RAMStats ram_counters;
+extern RAMStats mig_stats;
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 5ecf3dc381..feb5ab7493 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -909,26 +909,26 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     size_t page_size = qemu_target_page_size();
 
     info->ram = g_malloc0(sizeof(*info->ram));
-    info->ram->transferred = stat64_get(&ram_counters.transferred);
+    info->ram->transferred = stat64_get(&mig_stats.transferred);
     info->ram->total = ram_bytes_total();
-    info->ram->duplicate = stat64_get(&ram_counters.zero_pages);
+    info->ram->duplicate = stat64_get(&mig_stats.zero_pages);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
-    info->ram->normal = stat64_get(&ram_counters.normal_pages);
+    info->ram->normal = stat64_get(&mig_stats.normal_pages);
     info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count =
-        stat64_get(&ram_counters.dirty_sync_count);
+        stat64_get(&mig_stats.dirty_sync_count);
     info->ram->dirty_sync_missed_zero_copy =
-        stat64_get(&ram_counters.dirty_sync_missed_zero_copy);
+        stat64_get(&mig_stats.dirty_sync_missed_zero_copy);
     info->ram->postcopy_requests =
-        stat64_get(&ram_counters.postcopy_requests);
+        stat64_get(&mig_stats.postcopy_requests);
     info->ram->page_size = page_size;
-    info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
+    info->ram->multifd_bytes = stat64_get(&mig_stats.multifd_bytes);
     info->ram->pages_per_second = s->pages_per_second;
-    info->ram->precopy_bytes = stat64_get(&ram_counters.precopy_bytes);
-    info->ram->downtime_bytes = stat64_get(&ram_counters.downtime_bytes);
-    info->ram->postcopy_bytes = stat64_get(&ram_counters.postcopy_bytes);
+    info->ram->precopy_bytes = stat64_get(&mig_stats.precopy_bytes);
+    info->ram->downtime_bytes = stat64_get(&mig_stats.downtime_bytes);
+    info->ram->postcopy_bytes = stat64_get(&mig_stats.postcopy_bytes);
 
     if (migrate_xbzrle()) {
         info->xbzrle_cache = g_malloc0(sizeof(*info->xbzrle_cache));
@@ -960,7 +960,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     if (s->state != MIGRATION_STATUS_COMPLETED) {
         info->ram->remaining = ram_bytes_remaining();
         info->ram->dirty_pages_rate =
-           stat64_get(&ram_counters.dirty_pages_rate);
+           stat64_get(&mig_stats.dirty_pages_rate);
     }
 }
 
@@ -1613,10 +1613,10 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
 
     migrate_init(s);
     /*
-     * set ram_counters compression_counters memory to zero for a
+     * set mig_stats compression_counters memory to zero for a
      * new migration
      */
-    memset(&ram_counters, 0, sizeof(ram_counters));
+    memset(&mig_stats, 0, sizeof(mig_stats));
     memset(&compression_counters, 0, sizeof(compression_counters));
 
     return true;
@@ -2627,7 +2627,7 @@ static MigThrError migration_detect_error(MigrationState *s)
 static uint64_t migration_total_bytes(MigrationState *s)
 {
     return qemu_file_total_transferred(s->to_dst_file) +
-        stat64_get(&ram_counters.multifd_bytes);
+        stat64_get(&mig_stats.multifd_bytes);
 }
 
 static void migration_calculate_complete(MigrationState *s)
@@ -2691,10 +2691,10 @@ static void migration_update_counters(MigrationState *s,
      * if we haven't sent anything, we don't want to
      * recalculate. 10000 is a small enough number for our purposes
      */
-    if (stat64_get(&ram_counters.dirty_pages_rate) &&
+    if (stat64_get(&mig_stats.dirty_pages_rate) &&
         transferred > 10000) {
         s->expected_downtime =
-            stat64_get(&ram_counters.dirty_bytes_last_sync) / bandwidth;
+            stat64_get(&mig_stats.dirty_bytes_last_sync) / bandwidth;
     }
 
     qemu_file_reset_rate_limit(s->to_dst_file);
diff --git a/migration/multifd.c b/migration/multifd.c
index 347999f84a..4a2e1a47ce 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -434,8 +434,8 @@ static int multifd_send_pages(QEMUFile *f)
     transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     qemu_mutex_unlock(&p->mutex);
-    stat64_add(&ram_counters.transferred, transferred);
-    stat64_add(&ram_counters.multifd_bytes, transferred);
+    stat64_add(&mig_stats.transferred, transferred);
+    stat64_add(&mig_stats.multifd_bytes, transferred);
     qemu_sem_post(&p->sem);
 
     return 1;
@@ -577,7 +577,7 @@ static int multifd_zero_copy_flush(QIOChannel *c)
         return -1;
     }
     if (ret == 1) {
-        stat64_add(&ram_counters.dirty_sync_missed_zero_copy, 1);
+        stat64_add(&mig_stats.dirty_sync_missed_zero_copy, 1);
     }
 
     return ret;
diff --git a/migration/ram.c b/migration/ram.c
index a6d5478ef8..c3981f64e4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -464,13 +464,13 @@ uint64_t ram_bytes_remaining(void)
 void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
-        stat64_add(&ram_counters.precopy_bytes, bytes);
+        stat64_add(&mig_stats.precopy_bytes, bytes);
     } else if (migration_in_postcopy()) {
-        stat64_add(&ram_counters.postcopy_bytes, bytes);
+        stat64_add(&mig_stats.postcopy_bytes, bytes);
     } else {
-        stat64_add(&ram_counters.downtime_bytes, bytes);
+        stat64_add(&mig_stats.downtime_bytes, bytes);
     }
-    stat64_add(&ram_counters.transferred, bytes);
+    stat64_add(&mig_stats.transferred, bytes);
 }
 
 struct MigrationOps {
@@ -744,7 +744,7 @@ void mig_throttle_counter_reset(void)
 
     rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     rs->num_dirty_pages_period = 0;
-    rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
+    rs->bytes_xfer_prev = stat64_get(&mig_stats.transferred);
 }
 
 /**
@@ -764,7 +764,7 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
     /* We don't care if this fails to allocate a new cache page
      * as long as it updated an old one */
     cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
-                 stat64_get(&ram_counters.dirty_sync_count));
+                 stat64_get(&mig_stats.dirty_sync_count));
 }
 
 #define ENCODING_FLAG_XBZRLE 0x1
@@ -790,7 +790,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
     QEMUFile *file = pss->pss_channel;
-    uint64_t generation = stat64_get(&ram_counters.dirty_sync_count);
+    uint64_t generation = stat64_get(&mig_stats.dirty_sync_count);
 
     if (!cache_is_cached(XBZRLE.cache, current_addr, generation)) {
         xbzrle_counters.cache_miss++;
@@ -1118,8 +1118,8 @@ uint64_t ram_pagesize_summary(void)
 
 uint64_t ram_get_total_transferred_pages(void)
 {
-    return stat64_get(&ram_counters.normal_pages) +
-        stat64_get(&ram_counters.zero_pages) +
+    return stat64_get(&mig_stats.normal_pages) +
+        stat64_get(&mig_stats.zero_pages) +
         compression_counters.pages + xbzrle_counters.pages;
 }
 
@@ -1129,7 +1129,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
     double compressed_size;
 
     /* calculate period counters */
-    stat64_set(&ram_counters.dirty_pages_rate,
+    stat64_set(&mig_stats.dirty_pages_rate,
                rs->num_dirty_pages_period * 1000 /
                (end_time - rs->time_last_bitmap_sync));
 
@@ -1180,7 +1180,7 @@ static void migration_trigger_throttle(RAMState *rs)
 {
     uint64_t threshold = migrate_throttle_trigger_threshold();
     uint64_t bytes_xfer_period =
-        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
+        stat64_get(&mig_stats.transferred) - rs->bytes_xfer_prev;
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
@@ -1209,7 +1209,7 @@ static void migration_bitmap_sync(RAMState *rs)
     RAMBlock *block;
     int64_t end_time;
 
-    stat64_add(&ram_counters.dirty_sync_count, 1);
+    stat64_add(&mig_stats.dirty_sync_count, 1);
 
     if (!rs->time_last_bitmap_sync) {
         rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
@@ -1223,7 +1223,7 @@ static void migration_bitmap_sync(RAMState *rs)
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(rs, block);
         }
-        stat64_set(&ram_counters.dirty_bytes_last_sync, ram_bytes_remaining());
+        stat64_set(&mig_stats.dirty_bytes_last_sync, ram_bytes_remaining());
     }
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
@@ -1243,10 +1243,10 @@ static void migration_bitmap_sync(RAMState *rs)
         /* reset period counters */
         rs->time_last_bitmap_sync = end_time;
         rs->num_dirty_pages_period = 0;
-        rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
+        rs->bytes_xfer_prev = stat64_get(&mig_stats.transferred);
     }
     if (migrate_events()) {
-        uint64_t generation = stat64_get(&ram_counters.dirty_sync_count);
+        uint64_t generation = stat64_get(&mig_stats.dirty_sync_count);
         qapi_event_send_migration_pass(generation);
     }
 }
@@ -1320,7 +1320,7 @@ static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *block,
     int len = save_zero_page_to_file(pss, f, block, offset);
 
     if (len) {
-        stat64_add(&ram_counters.zero_pages, 1);
+        stat64_add(&mig_stats.zero_pages, 1);
         ram_transferred_add(len);
         return 1;
     }
@@ -1357,9 +1357,9 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
     }
 
     if (bytes_xmit > 0) {
-        stat64_add(&ram_counters.normal_pages, 1);
+        stat64_add(&mig_stats.normal_pages, 1);
     } else if (bytes_xmit == 0) {
-        stat64_add(&ram_counters.zero_pages, 1);
+        stat64_add(&mig_stats.zero_pages, 1);
     }
 
     return true;
@@ -1391,7 +1391,7 @@ static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
         qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
-    stat64_add(&ram_counters.normal_pages, 1);
+    stat64_add(&mig_stats.normal_pages, 1);
     return 1;
 }
 
@@ -1447,7 +1447,7 @@ static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
     if (multifd_queue_page(file, block, offset) < 0) {
         return -1;
     }
-    stat64_add(&ram_counters.normal_pages, 1);
+    stat64_add(&mig_stats.normal_pages, 1);
 
     return 1;
 }
@@ -1486,7 +1486,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        stat64_add(&ram_counters.zero_pages, 1);
+        stat64_add(&mig_stats.zero_pages, 1);
         return;
     }
 
@@ -2179,7 +2179,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
     RAMBlock *ramblock;
     RAMState *rs = ram_state;
 
-    stat64_add(&ram_counters.postcopy_requests, 1);
+    stat64_add(&mig_stats.postcopy_requests, 1);
     RCU_READ_LOCK_GUARD();
 
     if (!rbname) {
@@ -2634,9 +2634,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        stat64_add(&ram_counters.zero_pages, pages);
+        stat64_add(&mig_stats.zero_pages, pages);
     } else {
-        stat64_add(&ram_counters.normal_pages, pages);
+        stat64_add(&mig_stats.normal_pages, pages);
         ram_transferred_add(size);
         qemu_file_credit_transfer(f, size);
     }
diff --git a/migration/savevm.c b/migration/savevm.c
index 8e2efb1a19..a9d0a88e62 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1622,7 +1622,7 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     }
 
     migrate_init(ms);
-    memset(&ram_counters, 0, sizeof(ram_counters));
+    memset(&mig_stats, 0, sizeof(mig_stats));
     memset(&compression_counters, 0, sizeof(compression_counters));
     ms->to_dst_file = f;
 
-- 
2.40.0


