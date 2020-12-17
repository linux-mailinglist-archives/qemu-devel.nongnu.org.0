Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D702DD320
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:41:01 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuSi-0000Qi-Et
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpuQV-00075m-Ca
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:38:43 -0500
Received: from relay.sw.ru ([185.231.240.75]:42366 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpuQK-0008NJ-C7
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:38:43 -0500
Received: from [192.168.15.61] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpuPt-00DOLN-J0; Thu, 17 Dec 2020 17:38:05 +0300
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/5] migration: support UFFD write fault processing in
 ram_save_iterate()
Date: Thu, 17 Dec 2020 17:36:52 +0300
Message-Id: <20201217143654.365582-4-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217143654.365582-1-andrey.gruzdev@virtuozzo.com>
References: <20201217143654.365582-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

In this particular implementation the same single migration
thread is responsible for both normal linear dirty page
migration and procesing UFFD page fault events.

Processing write faults includes reading UFFD file descriptor,
finding respective RAM block and saving faulting page to
the migration stream. After page has been saved, write protection
can be removed. Since asynchronous version of qemu_put_buffer()
is expected to be used to save pages, we also have to flush
migraion stream prior to un-protecting saved memory range.

Write protection is being removed for any previously protected
memory chunk that has hit the migration stream. That's valid
for pages from linear page scan along with write fault pages.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/exec/memory.h  |   7 ++
 migration/ram.c        | 269 +++++++++++++++++++++++++++++++++++++++--
 migration/ram.h        |   2 +
 migration/trace-events |   2 +
 4 files changed, 272 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b76b1256bf..1aa1c6a3f4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -150,6 +150,13 @@ typedef struct IOMMUTLBEvent {
 #define RAM_PMEM (1 << 5)
 
 
+/*
+ * UFFDIO_WRITEPROTECT is used on this RAMBlock to
+ * support 'write-tracking' migration type.
+ * Implies ram_state->ram_wt_enabled.
+ */
+#define RAM_UF_WRITEPROTECT (1 << 6)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
diff --git a/migration/ram.c b/migration/ram.c
index ae8de17153..5707382db1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -56,6 +56,11 @@
 #include "savevm.h"
 #include "qemu/iov.h"
 #include "multifd.h"
+#include "sysemu/runstate.h"
+
+#ifdef CONFIG_LINUX
+#include "qemu/userfaultfd.h"
+#endif
 
 /***********************************************************/
 /* ram save/restore */
@@ -298,6 +303,8 @@ struct RAMSrcPageRequest {
 struct RAMState {
     /* QEMUFile used for this migration */
     QEMUFile *f;
+    /* UFFD file descriptor, used in 'write-tracking' migration */
+    int uffdio_fd;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
     /* Last block from where we have sent data */
@@ -1434,6 +1441,40 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
     return block;
 }
 
+#ifdef CONFIG_LINUX
+/**
+ * poll_fault_page: try to get next UFFD write fault page and, if pending fault
+ *   is found, return RAM block pointer and page offset
+ *
+ * Returns pointer to the RAMBlock containing faulting page,
+ *   NULL if no write faults are pending
+ *
+ * @rs: current RAM state
+ * @offset: page offset from the beginning of the block
+ */
+static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
+{
+    struct uffd_msg uffd_msg;
+    void *page_address;
+    RAMBlock *bs;
+    int res;
+
+    if (!migrate_background_snapshot()) {
+        return NULL;
+    }
+
+    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
+    if (res <= 0) {
+        return NULL;
+    }
+
+    page_address = (void *) uffd_msg.arg.pagefault.address;
+    bs = qemu_ram_block_from_host(page_address, false, offset);
+    assert(bs && (bs->flags & RAM_UF_WRITEPROTECT) != 0);
+    return bs;
+}
+#endif /* CONFIG_LINUX */
+
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -1473,6 +1514,16 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 
     } while (block && !dirty);
 
+#ifdef CONFIG_LINUX
+    if (!block) {
+        /*
+         * Poll write faults too if background snapshot is enabled; that's
+         * when we have vcpus got blocked by the write protected pages.
+         */
+        block = poll_fault_page(rs, &offset);
+    }
+#endif /* CONFIG_LINUX */
+
     if (block) {
         /*
          * As soon as we start servicing pages out of order, then we have
@@ -1746,6 +1797,53 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     return pages;
 }
 
+/**
+ * ram_save_host_page_pre: ram_save_host_page() pre-notifier
+ *
+ * @rs: current RAM state
+ * @pss: page-search-status structure
+ * @opaque: pointer to receive opaque context value
+ */
+static inline
+void ram_save_host_page_pre(RAMState *rs, PageSearchStatus *pss, void **opaque)
+{
+    *(unsigned long *) opaque = pss->page;
+}
+
+/**
+ * ram_save_host_page_post: ram_save_host_page() post-notifier
+ *
+ * @rs: current RAM state
+ * @pss: page-search-status structure
+ * @opaque: opaque context value
+ * @res_override: pointer to the return value of ram_save_host_page(),
+ *   overwritten in case of an error
+ */
+static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
+        void *opaque, int *res_override)
+{
+#ifdef CONFIG_LINUX
+    /* Check if page is from UFFD-managed region. */
+    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
+        unsigned long page_from = (unsigned long) opaque;
+
+        void *page_address = pss->block->host + (page_from << TARGET_PAGE_BITS);
+        uint64_t run_length = (pss->page - page_from + 1) << TARGET_PAGE_BITS;
+        int res;
+
+        /* Flush async buffers before un-protect. */
+        qemu_fflush(rs->f);
+        /* Un-protect memory range. */
+        res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
+                false, false);
+        /* We don't want to override existing error from ram_save_host_page(). */
+        if (res < 0 && *res_override >= 0) {
+            *res_override = res;
+        }
+    }
+#endif /* CONFIG_LINUX */
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -1790,7 +1888,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         }
 
         if (found) {
+            void *opaque;
+
+            ram_save_host_page_pre(rs, &pss, &opaque);
             pages = ram_save_host_page(rs, &pss, last_stage);
+            ram_save_host_page_post(rs, &pss, opaque, &pages);
         }
     } while (!pages && again);
 
@@ -1880,10 +1982,13 @@ static void ram_save_cleanup(void *opaque)
     RAMState **rsp = opaque;
     RAMBlock *block;
 
-    /* caller have hold iothread lock or is in a bh, so there is
-     * no writing race against the migration bitmap
-     */
-    memory_global_dirty_log_stop();
+    /* We don't use dirty log with background snapshots */
+    if (!migrate_background_snapshot()) {
+        /* caller have hold iothread lock or is in a bh, so there is
+         * no writing race against the migration bitmap
+         */
+        memory_global_dirty_log_stop();
+    }
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         g_free(block->clear_bmap);
@@ -2343,8 +2448,11 @@ static void ram_init_bitmaps(RAMState *rs)
 
     WITH_RCU_READ_LOCK_GUARD() {
         ram_list_init_bitmaps();
-        memory_global_dirty_log_start();
-        migration_bitmap_sync_precopy(rs);
+        /* We don't use dirty log with background snapshots */
+        if (!migrate_background_snapshot()) {
+            memory_global_dirty_log_start();
+            migration_bitmap_sync_precopy(rs);
+        }
     }
     qemu_mutex_unlock_ramlist();
     qemu_mutex_unlock_iothread();
@@ -3794,7 +3902,14 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
  */
 bool ram_write_tracking_available(void)
 {
-    /* TODO: implement */
+#ifdef CONFIG_LINUX
+    uint64_t uffd_features;
+    int res;
+
+    res = uffd_query_features(&uffd_features);
+    return (res == 0 &&
+            (uffd_features & UFFD_FEATURE_PAGEFAULT_FLAG_WP) != 0);
+#endif
     return false;
 }
 
@@ -3805,10 +3920,148 @@ bool ram_write_tracking_available(void)
  */
 bool ram_write_tracking_compatible(void)
 {
-    /* TODO: implement */
+#ifdef CONFIG_LINUX
+    const uint64_t uffd_ioctls_mask = BIT(_UFFDIO_WRITEPROTECT);
+    int uffd_fd;
+    RAMBlock *bs;
+    bool ret = false;
+
+    /* Open UFFD file descriptor */
+    uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, false);
+    if (uffd_fd < 0) {
+        return false;
+    }
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        uint64_t uffd_ioctls;
+
+        /* Nothing to do with read-only and MMIO-writable regions */
+        if (bs->mr->readonly || bs->mr->rom_device) {
+            continue;
+        }
+        /* Try to register block memory via UFFD-IO to track writes */
+        if (uffd_register_memory(uffd_fd, bs->host, bs->max_length,
+                UFFDIO_REGISTER_MODE_WP, &uffd_ioctls)) {
+            goto out;
+        }
+        if ((uffd_ioctls & uffd_ioctls_mask) != uffd_ioctls_mask) {
+            goto out;
+        }
+    }
+    ret = true;
+
+out:
+    uffd_close_fd(uffd_fd);
+    return ret;
+#endif
     return false;
 }
 
+/*
+ * ram_write_tracking_start: start UFFD-WP memory tracking
+ *
+ * Returns 0 for success or negative value in case of error
+ */
+int ram_write_tracking_start(void)
+{
+#ifdef CONFIG_LINUX
+    int uffd_fd;
+    RAMState *rs = ram_state;
+    RAMBlock *bs;
+
+    /* Open UFFD file descriptor */
+    uffd_fd = uffd_create_fd(UFFD_FEATURE_PAGEFAULT_FLAG_WP, true);
+    if (uffd_fd < 0) {
+        return uffd_fd;
+    }
+    rs->uffdio_fd = uffd_fd;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        /* Nothing to do with read-only and MMIO-writable regions */
+        if (bs->mr->readonly || bs->mr->rom_device) {
+            continue;
+        }
+
+        /* Register block memory with UFFD to track writes */
+        if (uffd_register_memory(rs->uffdio_fd, bs->host,
+                bs->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
+            goto fail;
+        }
+        /* Apply UFFD write protection to the block memory range */
+        if (uffd_change_protection(rs->uffdio_fd, bs->host,
+                bs->max_length, true, false)) {
+            goto fail;
+        }
+        bs->flags |= RAM_UF_WRITEPROTECT;
+        memory_region_ref(bs->mr);
+
+        trace_ram_write_tracking_ramblock_start(bs->idstr, bs->page_size,
+                bs->host, bs->max_length);
+    }
+
+    return 0;
+
+fail:
+    error_report("ram_write_tracking_start() failed: restoring initial memory state");
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
+            continue;
+        }
+        /*
+         * In case some memory block failed to be write-protected
+         * remove protection and unregister all succeeded RAM blocks
+         */
+        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
+        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
+        /* Cleanup flags and remove reference */
+        bs->flags &= ~RAM_UF_WRITEPROTECT;
+        memory_region_unref(bs->mr);
+    }
+
+    uffd_close_fd(uffd_fd);
+#endif /* CONFIG_LINUX */
+    rs->uffdio_fd = -1;
+    return -1;
+}
+
+/**
+ * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
+ */
+void ram_write_tracking_stop(void)
+{
+#ifdef CONFIG_LINUX
+    RAMState *rs = ram_state;
+    RAMBlock *bs;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
+        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
+            continue;
+        }
+        /* Remove protection and unregister all affected RAM blocks */
+        uffd_change_protection(rs->uffdio_fd, bs->host, bs->max_length, false, false);
+        uffd_unregister_memory(rs->uffdio_fd, bs->host, bs->max_length);
+
+        trace_ram_write_tracking_ramblock_stop(bs->idstr, bs->page_size,
+                bs->host, bs->max_length);
+
+        /* Cleanup flags and remove reference */
+        bs->flags &= ~RAM_UF_WRITEPROTECT;
+        memory_region_unref(bs->mr);
+    }
+
+    /* Finally close UFFD file descriptor */
+    uffd_close_fd(rs->uffdio_fd);
+    rs->uffdio_fd = -1;
+#endif /* CONFIG_LINUX */
+}
+
 static SaveVMHandlers savevm_ram_handlers = {
     .save_setup = ram_save_setup,
     .save_live_iterate = ram_save_iterate,
diff --git a/migration/ram.h b/migration/ram.h
index 1a9ff90304..c25540cb93 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -82,5 +82,7 @@ void colo_incoming_start_dirty_log(void);
 /* Background snapshot */
 bool ram_write_tracking_available(void);
 bool ram_write_tracking_compatible(void);
+int ram_write_tracking_start(void);
+void ram_write_tracking_stop(void);
 
 #endif
diff --git a/migration/trace-events b/migration/trace-events
index 75de5004ac..668c562fed 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -111,6 +111,8 @@ save_xbzrle_page_skipping(void) ""
 save_xbzrle_page_overflow(void) ""
 ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRIu64 " milliseconds, %d iterations"
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
+ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
+ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %d"
-- 
2.25.1


