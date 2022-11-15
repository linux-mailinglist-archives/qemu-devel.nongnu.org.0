Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8376298F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:36:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouupH-0005QV-UW; Tue, 15 Nov 2022 07:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouup1-00056v-5K
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouuoz-0004l6-2Q
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 07:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668514424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NP+YAzVniqZo6cfLnT/BIbA/QWmFaZDBpD0elMMoGc=;
 b=C2ng1pSUGM4oqgbmWUVpoM8CWndRZO8DVcGi+R6iqch8RP9Py09X/UImV9eMbuWLs9Rq98
 bi+oRDKO9NZIPxrMyWgqe8/XV5/TDYHvfQtzSc8KuEajfS3WkXRHkhcHnIgW1DN/spysoA
 ZijwrOmRy1oy4IwkxZySzwGHxRIhoyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-mM1WmNfNOXCFeLpiMGEMUQ-1; Tue, 15 Nov 2022 07:13:41 -0500
X-MC-Unique: mM1WmNfNOXCFeLpiMGEMUQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD35858F17;
 Tue, 15 Nov 2022 12:13:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2D3A492B17;
 Tue, 15 Nov 2022 12:13:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 21/30] migration: Use atomic ops properly for page accountings
Date: Tue, 15 Nov 2022 13:12:17 +0100
Message-Id: <20221115121226.26609-22-quintela@redhat.com>
In-Reply-To: <20221115121226.26609-1-quintela@redhat.com>
References: <20221115121226.26609-1-quintela@redhat.com>
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

From: Peter Xu <peterx@redhat.com>

To prepare for thread-safety on page accountings, at least below counters
need to be accessed only atomically, they are:

        ram_counters.transferred
        ram_counters.duplicate
        ram_counters.normal
        ram_counters.postcopy_bytes

There are a lot of other counters but they won't be accessed outside
migration thread, then they're still safe to be accessed without atomic
ops.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       | 20 ++++++++++++++++++++
 migration/migration.c | 10 +++++-----
 migration/multifd.c   |  4 ++--
 migration/ram.c       | 40 ++++++++++++++++++++++++----------------
 4 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 038d52f49f..81cbb0947c 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -32,7 +32,27 @@
 #include "qapi/qapi-types-migration.h"
 #include "exec/cpu-common.h"
 #include "io/channel.h"
+#include "qemu/stats64.h"
 
+/*
+ * These are the migration statistic counters that need to be updated using
+ * atomic ops (can be accessed by more than one thread).  Here since we
+ * cannot modify MigrationStats directly to use Stat64 as it was defined in
+ * the QAPI scheme, we define an internal structure to hold them, and we
+ * propagate the real values when QMP queries happen.
+ *
+ * IOW, the corresponding fields within ram_counters on these specific
+ * fields will be always zero and not being used at all; they're just
+ * placeholders to make it QAPI-compatible.
+ */
+typedef struct {
+    Stat64 transferred;
+    Stat64 duplicate;
+    Stat64 normal;
+    Stat64 postcopy_bytes;
+} MigrationAtomicStats;
+
+extern MigrationAtomicStats ram_atomic_counters;
 extern MigrationStats ram_counters;
 extern XBZRLECacheStats xbzrle_counters;
 extern CompressionStats compression_counters;
diff --git a/migration/migration.c b/migration/migration.c
index 9fbed8819a..1f95877fb4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1069,13 +1069,13 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 
     info->has_ram = true;
     info->ram = g_malloc0(sizeof(*info->ram));
-    info->ram->transferred = ram_counters.transferred;
+    info->ram->transferred = stat64_get(&ram_atomic_counters.transferred);
     info->ram->total = ram_bytes_total();
-    info->ram->duplicate = ram_counters.duplicate;
+    info->ram->duplicate = stat64_get(&ram_atomic_counters.duplicate);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
-    info->ram->normal = ram_counters.normal;
-    info->ram->normal_bytes = ram_counters.normal * page_size;
+    info->ram->normal = stat64_get(&ram_atomic_counters.normal);
+    info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
     info->ram->dirty_sync_missed_zero_copy =
@@ -1086,7 +1086,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->pages_per_second = s->pages_per_second;
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
-    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
+    info->ram->postcopy_bytes = stat64_get(&ram_atomic_counters.postcopy_bytes);
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/multifd.c b/migration/multifd.c
index c40d98ad5c..7d3aec9a52 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -432,7 +432,7 @@ static int multifd_send_pages(QEMUFile *f)
     transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
     ram_counters.multifd_bytes += transferred;
-    ram_counters.transferred += transferred;
+    stat64_add(&ram_atomic_counters.transferred, transferred);
     qemu_mutex_unlock(&p->mutex);
     qemu_sem_post(&p->sem);
 
@@ -624,7 +624,7 @@ int multifd_send_sync_main(QEMUFile *f)
         p->pending_job++;
         qemu_file_acct_rate_limit(f, p->packet_len);
         ram_counters.multifd_bytes += p->packet_len;
-        ram_counters.transferred += p->packet_len;
+        stat64_add(&ram_atomic_counters.transferred, p->packet_len);
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
 
diff --git a/migration/ram.c b/migration/ram.c
index 6428138194..25fd3cf7dc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -453,18 +453,25 @@ uint64_t ram_bytes_remaining(void)
                        0;
 }
 
+/*
+ * NOTE: not all stats in ram_counters are used in reality.  See comments
+ * for struct MigrationAtomicStats.  The ultimate result of ram migration
+ * counters will be a merged version with both ram_counters and the atomic
+ * fields in ram_atomic_counters.
+ */
 MigrationStats ram_counters;
+MigrationAtomicStats ram_atomic_counters;
 
 void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
     } else if (migration_in_postcopy()) {
-        ram_counters.postcopy_bytes += bytes;
+        stat64_add(&ram_atomic_counters.postcopy_bytes, bytes);
     } else {
         ram_counters.downtime_bytes += bytes;
     }
-    ram_counters.transferred += bytes;
+    stat64_add(&ram_atomic_counters.transferred, bytes);
 }
 
 void dirty_sync_missed_zero_copy(void)
@@ -753,7 +760,7 @@ void mig_throttle_counter_reset(void)
 
     rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     rs->num_dirty_pages_period = 0;
-    rs->bytes_xfer_prev = ram_counters.transferred;
+    rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
 }
 
 /**
@@ -1113,8 +1120,9 @@ uint64_t ram_pagesize_summary(void)
 
 uint64_t ram_get_total_transferred_pages(void)
 {
-    return  ram_counters.normal + ram_counters.duplicate +
-                compression_counters.pages + xbzrle_counters.pages;
+    return  stat64_get(&ram_atomic_counters.normal) +
+        stat64_get(&ram_atomic_counters.duplicate) +
+        compression_counters.pages + xbzrle_counters.pages;
 }
 
 static void migration_update_rates(RAMState *rs, int64_t end_time)
@@ -1173,8 +1181,8 @@ static void migration_trigger_throttle(RAMState *rs)
 {
     MigrationState *s = migrate_get_current();
     uint64_t threshold = s->parameters.throttle_trigger_threshold;
-
-    uint64_t bytes_xfer_period = ram_counters.transferred - rs->bytes_xfer_prev;
+    uint64_t bytes_xfer_period =
+        stat64_get(&ram_atomic_counters.transferred) - rs->bytes_xfer_prev;
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
@@ -1237,7 +1245,7 @@ static void migration_bitmap_sync(RAMState *rs)
         /* reset period counters */
         rs->time_last_bitmap_sync = end_time;
         rs->num_dirty_pages_period = 0;
-        rs->bytes_xfer_prev = ram_counters.transferred;
+        rs->bytes_xfer_prev = stat64_get(&ram_atomic_counters.transferred);
     }
     if (migrate_use_events()) {
         qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
@@ -1313,7 +1321,7 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     int len = save_zero_page_to_file(rs, rs->f, block, offset);
 
     if (len) {
-        ram_counters.duplicate++;
+        stat64_add(&ram_atomic_counters.duplicate, 1);
         ram_transferred_add(len);
         return 1;
     }
@@ -1350,9 +1358,9 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     }
 
     if (bytes_xmit > 0) {
-        ram_counters.normal++;
+        stat64_add(&ram_atomic_counters.normal, 1);
     } else if (bytes_xmit == 0) {
-        ram_counters.duplicate++;
+        stat64_add(&ram_atomic_counters.duplicate, 1);
     }
 
     return true;
@@ -1382,7 +1390,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
         qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
-    ram_counters.normal++;
+    stat64_add(&ram_atomic_counters.normal, 1);
     return 1;
 }
 
@@ -1438,7 +1446,7 @@ static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
     if (multifd_queue_page(rs->f, block, offset) < 0) {
         return -1;
     }
-    ram_counters.normal++;
+    stat64_add(&ram_atomic_counters.normal, 1);
 
     return 1;
 }
@@ -1476,7 +1484,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        ram_counters.duplicate++;
+        stat64_add(&ram_atomic_counters.duplicate, 1);
         return;
     }
 
@@ -2651,9 +2659,9 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        ram_counters.duplicate += pages;
+        stat64_add(&ram_atomic_counters.duplicate, pages);
     } else {
-        ram_counters.normal += pages;
+        stat64_add(&ram_atomic_counters.normal, pages);
         ram_transferred_add(size);
         qemu_file_credit_transfer(f, size);
     }
-- 
2.38.1


