Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBE36E7F88
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:25:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAba-0000XC-44; Wed, 19 Apr 2023 12:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbX-0000Wm-MF
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbV-0008Cy-I0
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeIQ46vcpV0HY3TmJz1d1p29HzMSe5cPBTrVQOOqC4k=;
 b=DCad+aNM99qg22fZuYqSfVt3qQOR28DeQkPU/nhdygTR6mAVhw3MKp+tJoX2mBMQmYX9yh
 1OEJvzdBJJO8l7U0HSpqeXTYrj23ZCG+LwJjSFqkRide0BlGSHEWvP+u1Ktoz5pV2DWQzQ
 HP1XhT0eJkxWCiA/vUOpJHjviOhU338=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-hExV-R-6M-eDTIRVMYsd5A-1; Wed, 19 Apr 2023 12:24:18 -0400
X-MC-Unique: hExV-R-6M-eDTIRVMYsd5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9182A381D4C4
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02871121314;
 Wed, 19 Apr 2023 16:24:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 01/12] migration: Merge ram_counters and ram_atomic_counters
Date: Wed, 19 Apr 2023 18:24:04 +0200
Message-Id: <20230419162415.16260-2-quintela@redhat.com>
In-Reply-To: <20230419162415.16260-1-quintela@redhat.com>
References: <20230419162415.16260-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Using MgrationStats as type for ram_counters mean that we didn't have
to re-declare each value in another struct. The need of atomic
counters have make us to create MigrationAtomicStats for this atomic
counters.

Create RAMStats type which is a merge of MigrationStats and
MigrationAtomicStats removing unused members.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Fix typos found by David Edmondson
---
 migration/ram.h       | 28 +++++++++++++++-------------
 migration/migration.c |  8 ++++----
 migration/multifd.c   |  4 ++--
 migration/ram.c       | 39 ++++++++++++++++-----------------------
 4 files changed, 37 insertions(+), 42 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 81cbb0947c..7c026b5242 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -35,25 +35,27 @@
 #include "qemu/stats64.h"
 
 /*
- * These are the migration statistic counters that need to be updated using
- * atomic ops (can be accessed by more than one thread).  Here since we
- * cannot modify MigrationStats directly to use Stat64 as it was defined in
- * the QAPI scheme, we define an internal structure to hold them, and we
- * propagate the real values when QMP queries happen.
- *
- * IOW, the corresponding fields within ram_counters on these specific
- * fields will be always zero and not being used at all; they're just
- * placeholders to make it QAPI-compatible.
+ * These are the ram migration statistic counters.  It is loosely
+ * based on MigrationStats.  We change to Stat64 any counter that
+ * needs to be updated using atomic ops (can be accessed by more than
+ * one thread).
  */
 typedef struct {
-    Stat64 transferred;
+    int64_t dirty_pages_rate;
+    int64_t dirty_sync_count;
+    uint64_t dirty_sync_missed_zero_copy;
+    uint64_t downtime_bytes;
     Stat64 duplicate;
+    uint64_t multifd_bytes;
     Stat64 normal;
     Stat64 postcopy_bytes;
-} MigrationAtomicStats;
+    int64_t postcopy_requests;
+    uint64_t precopy_bytes;
+    int64_t remaining;
+    Stat64 transferred;
+} RAMStats;
 
-extern MigrationAtomicStats ram_atomic_counters;
-extern MigrationStats ram_counters;
+extern RAMStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
 
diff --git a/migration/migration.c b/migration/migration.c
index bda4789193..10483f3cab 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1140,12 +1140,12 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     size_t page_size = qemu_target_page_size();
 
     info->ram = g_malloc0(sizeof(*info->ram));
-    info->ram->transferred = stat64_get(&ram_atomic_counters.transferred);
+    info->ram->transferred = stat64_get(&ram_counters.transferred);
     info->ram->total = ram_bytes_total();
-    info->ram->duplicate = stat64_get(&ram_atomic_counters.duplicate);
+    info->ram->duplicate = stat64_get(&ram_counters.duplicate);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
-    info->ram->normal = stat64_get(&ram_atomic_counters.normal);
+    info->ram->normal = stat64_get(&ram_counters.normal);
     info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
@@ -1157,7 +1157,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->pages_per_second = s->pages_per_second;
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
-    info->ram->postcopy_bytes = stat64_get(&ram_atomic_counters.postcopy_bytes);
+    info->ram->postcopy_bytes = stat64_get(&ram_counters.postcopy_bytes);
 
     if (migrate_use_xbzrle()) {
         info->xbzrle_cache = g_malloc0(sizeof(*info->xbzrle_cache));
diff --git a/migration/multifd.c b/migration/multifd.c
index cbc0dfe39b..01fab01a92 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -433,7 +433,7 @@ static int multifd_send_pages(QEMUFile *f)
     transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
-    stat64_add(&ram_atomic_counters.transferred, transferred);
+    stat64_add(&ram_counters.transferred, transferred);
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
@@ -628,7 +628,7 @@ int multifd_send_sync_main(QEMUFile *f)
         p->pending_job++;
         qemu_file_acct_rate_limit(f, p->packet_len);
         ram_counters.multifd_bytes += p->packet_len;
-        stat64_add(&ram_atomic_counters.transferred, p->packet_len);
+        stat64_add(&ram_counters.transferred, p->packet_len);
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
     }
diff --git a/migration/ram.c b/migration/ram.c
index 79d881f735..95ba5ea0c5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -458,25 +458,18 @@ uint64_t ram_bytes_remaining(void)
                        0;
 }
 
-/*
- * NOTE: not all stats in ram_counters are used in reality.  See comments
- * for struct MigrationAtomicStats.  The ultimate result of ram migration
- * counters will be a merged version with both ram_counters and the atomic
- * fields in ram_atomic_counters.
- */
-MigrationStats ram_counters;
-MigrationAtomicStats ram_atomic_counters;
+RAMStats ram_counters;
 
 void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
     } else if (migration_in_postcopy()) {
-        stat64_add(&ram_atomic_counters.postcopy_bytes, bytes);
+        stat64_add(&ram_counters.postcopy_bytes, bytes);
     } else {
         ram_counters.downtime_bytes += bytes;
     }
-    stat64_add(&ram_atomic_counters.transferred, bytes);
+    stat64_add(&ram_counters.transferred, bytes);
 }
 
 void dirty_sync_missed_zero_copy(void)
@@ -756,7 +749,7 @@ void mig_throttle_counter_reset(void)
 
     rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     rs->num_dirty_pages_period = 0;
-    rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
+    rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
 }
 
 /**
@@ -1130,8 +1123,8 @@ uint64_t ram_pagesize_summary(void)
 
 uint64_t ram_get_total_transferred_pages(void)
 {
-    return  stat64_get(&ram_atomic_counters.normal) +
-        stat64_get(&ram_atomic_counters.duplicate) +
+    return stat64_get(&ram_counters.normal) +
+        stat64_get(&ram_counters.duplicate) +
         compression_counters.pages + xbzrle_counters.pages;
 }
 
@@ -1192,7 +1185,7 @@ static void migration_trigger_throttle(RAMState *rs)
     MigrationState *s = migrate_get_current();
     uint64_t threshold = s->parameters.throttle_trigger_threshold;
     uint64_t bytes_xfer_period =
-        stat64_get(&ram_atomic_counters.transferred) - rs->bytes_xfer_prev;
+        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
@@ -1255,7 +1248,7 @@ static void migration_bitmap_sync(RAMState *rs)
         /* reset period counters */
         rs->time_last_bitmap_sync = end_time;
         rs->num_dirty_pages_period = 0;
-        rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
+        rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
     }
     if (migrate_use_events()) {
         qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
@@ -1331,7 +1324,7 @@ static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *block,
     int len = save_zero_page_to_file(pss, f, block, offset);
 
     if (len) {
-        stat64_add(&ram_atomic_counters.duplicate, 1);
+        stat64_add(&ram_counters.duplicate, 1);
         ram_transferred_add(len);
         return 1;
     }
@@ -1368,9 +1361,9 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
     }
 
     if (bytes_xmit > 0) {
-        stat64_add(&ram_atomic_counters.normal, 1);
+        stat64_add(&ram_counters.normal, 1);
     } else if (bytes_xmit == 0) {
-        stat64_add(&ram_atomic_counters.duplicate, 1);
+        stat64_add(&ram_counters.duplicate, 1);
     }
 
     return true;
@@ -1402,7 +1395,7 @@ static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
         qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
-    stat64_add(&ram_atomic_counters.normal, 1);
+    stat64_add(&ram_counters.normal, 1);
     return 1;
 }
 
@@ -1458,7 +1451,7 @@ static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
     if (multifd_queue_page(file, block, offset) < 0) {
         return -1;
     }
-    stat64_add(&ram_atomic_counters.normal, 1);
+    stat64_add(&ram_counters.normal, 1);
 
     return 1;
 }
@@ -1497,7 +1490,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        stat64_add(&ram_atomic_counters.duplicate, 1);
+        stat64_add(&ram_counters.duplicate, 1);
         return;
     }
 
@@ -2632,9 +2625,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        stat64_add(&ram_atomic_counters.duplicate, pages);
+        stat64_add(&ram_counters.duplicate, pages);
     } else {
-        stat64_add(&ram_atomic_counters.normal, pages);
+        stat64_add(&ram_counters.normal, pages);
         ram_transferred_add(size);
         qemu_file_credit_transfer(f, size);
     }
-- 
2.39.2


