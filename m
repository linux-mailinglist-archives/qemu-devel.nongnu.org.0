Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655EB299269
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:29:45 +0100 (CET)
Received: from localhost ([::1]:53984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5NQ-0000in-Ef
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Eo-00050L-Sz
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Em-0000Ix-L5
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603729247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5w2aARphuD1Jpzw5dWT2tcLGrPMUzElMQdKQtFeEtx4=;
 b=bDh3J0wzZ+sEgl8W7u3Q5CQWLnu9P5NVxpL2yvQs8nmUBqK4b3C5pRfAEqwbCu8tKXDC31
 cAiqiqqbhQkFlGjv8g24wzsQ75qOI7OlOWyzJGkevt2Va4ZyHPoEUj92wdGuJqqFEm6lOD
 RUrq8mlncSVHuUM2sov0GYsdWBJ70xQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-m-fQ5T5aM3-NSygg_9o-9Q-1; Mon, 26 Oct 2020 12:20:43 -0400
X-MC-Unique: m-fQ5T5aM3-NSygg_9o-9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF14B18B9F42;
 Mon, 26 Oct 2020 16:20:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-208.ams2.redhat.com
 [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7CEE5D9E4;
 Mon, 26 Oct 2020 16:20:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, yubihong@huawei.com, peterx@redhat.com,
 peter.maydell@linaro.org
Subject: [PULL 10/16] migration: using trace_ to replace DPRINTF
Date: Mon, 26 Oct 2020 16:19:46 +0000
Message-Id: <20201026161952.149188-11-dgilbert@redhat.com>
In-Reply-To: <20201026161952.149188-1-dgilbert@redhat.com>
References: <20201026161952.149188-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bihong Yu <yubihong@huawei.com>

Signed-off-by: Bihong Yu <yubihong@huawei.com>
Message-Id: <1603179176-5360-1-git-send-email-yubihong@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/block.c      | 36 ++++++++++++++++++------------------
 migration/page_cache.c | 13 +++----------
 migration/trace-events | 13 +++++++++++++
 3 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 273392be78..a950977855 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -26,6 +26,7 @@
 #include "qemu-file.h"
 #include "migration/vmstate.h"
 #include "sysemu/block-backend.h"
+#include "trace.h"
 
 #define BLK_MIG_BLOCK_SIZE           (1 << 20)
 #define BDRV_SECTORS_PER_DIRTY_CHUNK (BLK_MIG_BLOCK_SIZE >> BDRV_SECTOR_BITS)
@@ -434,10 +435,9 @@ static int init_blk_migration(QEMUFile *f)
         block_mig_state.total_sector_sum += sectors;
 
         if (bmds->shared_base) {
-            DPRINTF("Start migration for %s with shared base image\n",
-                    bdrv_get_device_name(bs));
+            trace_migration_block_init_shared(bdrv_get_device_name(bs));
         } else {
-            DPRINTF("Start full migration for %s\n", bdrv_get_device_name(bs));
+            trace_migration_block_init_full(bdrv_get_device_name(bs));
         }
 
         QSIMPLEQ_INSERT_TAIL(&block_mig_state.bmds_list, bmds, entry);
@@ -592,7 +592,7 @@ static int mig_save_device_dirty(QEMUFile *f, BlkMigDevState *bmds,
     return (bmds->cur_dirty >= bmds->total_sectors);
 
 error:
-    DPRINTF("Error reading sector %" PRId64 "\n", sector);
+    trace_migration_block_save_device_dirty(sector);
     g_free(blk->buf);
     g_free(blk);
     return ret;
@@ -628,9 +628,9 @@ static int flush_blks(QEMUFile *f)
     BlkMigBlock *blk;
     int ret = 0;
 
-    DPRINTF("%s Enter submitted %d read_done %d transferred %d\n",
-            __func__, block_mig_state.submitted, block_mig_state.read_done,
-            block_mig_state.transferred);
+    trace_migration_block_flush_blks("Enter", block_mig_state.submitted,
+                                     block_mig_state.read_done,
+                                     block_mig_state.transferred);
 
     blk_mig_lock();
     while ((blk = QSIMPLEQ_FIRST(&block_mig_state.blk_list)) != NULL) {
@@ -656,9 +656,9 @@ static int flush_blks(QEMUFile *f)
     }
     blk_mig_unlock();
 
-    DPRINTF("%s Exit submitted %d read_done %d transferred %d\n", __func__,
-            block_mig_state.submitted, block_mig_state.read_done,
-            block_mig_state.transferred);
+    trace_migration_block_flush_blks("Exit", block_mig_state.submitted,
+                                     block_mig_state.read_done,
+                                     block_mig_state.transferred);
     return ret;
 }
 
@@ -727,8 +727,8 @@ static int block_save_setup(QEMUFile *f, void *opaque)
 {
     int ret;
 
-    DPRINTF("Enter save live setup submitted %d transferred %d\n",
-            block_mig_state.submitted, block_mig_state.transferred);
+    trace_migration_block_save("setup", block_mig_state.submitted,
+                               block_mig_state.transferred);
 
     qemu_mutex_lock_iothread();
     ret = init_blk_migration(f);
@@ -759,8 +759,8 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
     int64_t last_ftell = qemu_ftell(f);
     int64_t delta_ftell;
 
-    DPRINTF("Enter save live iterate submitted %d transferred %d\n",
-            block_mig_state.submitted, block_mig_state.transferred);
+    trace_migration_block_save("iterate", block_mig_state.submitted,
+                               block_mig_state.transferred);
 
     ret = flush_blks(f);
     if (ret) {
@@ -825,8 +825,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
 {
     int ret;
 
-    DPRINTF("Enter save live complete submitted %d transferred %d\n",
-            block_mig_state.submitted, block_mig_state.transferred);
+    trace_migration_block_save("complete", block_mig_state.submitted,
+                               block_mig_state.transferred);
 
     ret = flush_blks(f);
     if (ret) {
@@ -851,7 +851,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     /* report completion */
     qemu_put_be64(f, (100 << BDRV_SECTOR_BITS) | BLK_MIG_FLAG_PROGRESS);
 
-    DPRINTF("Block migration completed\n");
+    trace_migration_block_save_complete();
 
     qemu_put_be64(f, BLK_MIG_FLAG_EOS);
 
@@ -884,7 +884,7 @@ static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
         pending = max_size + BLK_MIG_BLOCK_SIZE;
     }
 
-    DPRINTF("Enter save live pending  %" PRIu64 "\n", pending);
+    trace_migration_block_save_pending(pending);
     /* We don't do postcopy */
     *res_precopy_only += pending;
 }
diff --git a/migration/page_cache.c b/migration/page_cache.c
index 775582f453..098b436223 100644
--- a/migration/page_cache.c
+++ b/migration/page_cache.c
@@ -18,14 +18,7 @@
 #include "qapi/error.h"
 #include "qemu/host-utils.h"
 #include "page_cache.h"
-
-#ifdef DEBUG_CACHE
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stdout, "cache: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
+#include "trace.h"
 
 /* the page in cache will not be replaced in two cycles */
 #define CACHED_PAGE_LIFETIME 2
@@ -75,7 +68,7 @@ PageCache *cache_init(int64_t new_size, size_t page_size, Error **errp)
     cache->num_items = 0;
     cache->max_num_items = num_pages;
 
-    DPRINTF("Setting cache buckets to %" PRId64 "\n", cache->max_num_items);
+    trace_migration_pagecache_init(cache->max_num_items);
 
     /* We prefer not to abort if there is no memory */
     cache->page_cache = g_try_malloc((cache->max_num_items) *
@@ -169,7 +162,7 @@ int cache_insert(PageCache *cache, uint64_t addr, const uint8_t *pdata,
     if (!it->it_data) {
         it->it_data = g_try_malloc(cache->page_size);
         if (!it->it_data) {
-            DPRINTF("Error allocating page\n");
+            trace_migration_pagecache_insert();
             return -1;
         }
         cache->num_items++;
diff --git a/migration/trace-events b/migration/trace-events
index 338f38b3dd..c7755116b8 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -325,3 +325,16 @@ get_ramblock_vfn_hash(const char *idstr, uint64_t vfn, uint32_t crc) "ramblock n
 calc_page_dirty_rate(const char *idstr, uint32_t new_crc, uint32_t old_crc) "ramblock name: %s, new crc: %" PRIu32 ", old crc: %" PRIu32
 skip_sample_ramblock(const char *idstr, uint64_t ramblock_size) "ramblock name: %s, ramblock size: %" PRIu64
 find_page_matched(const char *idstr) "ramblock %s addr or size changed"
+
+# block.c
+migration_block_init_shared(const char *blk_device_name) "Start migration for %s with shared base image"
+migration_block_init_full(const char *blk_device_name) "Start full migration for %s"
+migration_block_save_device_dirty(int64_t sector) "Error reading sector %" PRId64
+migration_block_flush_blks(const char *action, int submitted, int read_done, int transferred) "%s submitted %d read_done %d transferred %d"
+migration_block_save(const char *mig_stage, int submitted, int transferred) "Enter save live %s submitted %d transferred %d"
+migration_block_save_complete(void) "Block migration completed"
+migration_block_save_pending(uint64_t pending) "Enter save live pending  %" PRIu64
+
+# page_cache.c
+migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64
+migration_pagecache_insert(void) "Error allocating page"
-- 
2.28.0


