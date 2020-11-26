Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD812C5809
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:23:48 +0100 (CET)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ7b-0000az-2M
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ3D-000591-Ag
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:19:15 -0500
Received: from relay.sw.ru ([185.231.240.75]:49916 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ3B-0008O5-3Y
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:19:15 -0500
Received: from [192.168.15.178] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ2j-00AT4g-NN; Thu, 26 Nov 2020 18:18:45 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v4 3/6] support UFFD write fault processing in
 ram_save_iterate()
Date: Thu, 26 Nov 2020 18:17:31 +0300
Message-Id: <20201126151734.743849-4-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
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
 migration/ram.c | 155 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 147 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 3adfd1948d..bcdccdaef7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1441,6 +1441,76 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
     return block;
 }
 
+#ifdef CONFIG_LINUX
+/**
+ * ram_find_block_by_host_address: find RAM block containing host page
+ *
+ * Returns pointer to RAMBlock if found, NULL otherwise
+ *
+ * @rs: current RAM state
+ * @page_address: host page address
+ */
+static RAMBlock *ram_find_block_by_host_address(RAMState *rs, hwaddr page_address)
+{
+    RAMBlock *bs = rs->last_seen_block;
+
+    do {
+        if (page_address >= (hwaddr) bs->host && (page_address + TARGET_PAGE_SIZE) <=
+                ((hwaddr) bs->host + bs->max_length)) {
+            return bs;
+        }
+
+        bs = QLIST_NEXT_RCU(bs, next);
+        if (!bs) {
+            /* Hit the end of the list */
+            bs = QLIST_FIRST_RCU(&ram_list.blocks);
+        }
+    } while (bs != rs->last_seen_block);
+
+    return NULL;
+}
+
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
+    hwaddr page_address;
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
+    page_address = uffd_msg.arg.pagefault.address;
+    bs = ram_find_block_by_host_address(rs, page_address);
+    if (!bs) {
+        /* In case we couldn't find respective block, just unprotect faulting page. */
+        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
+        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
+                page_address);
+        return NULL;
+    }
+
+    *offset = (ram_addr_t) (page_address - (hwaddr) bs->host);
+    return bs;
+}
+#endif /* CONFIG_LINUX */
+
 /**
  * get_queued_page: unqueue a page from the postcopy requests
  *
@@ -1480,6 +1550,16 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
 
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
@@ -1753,6 +1833,55 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
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
+    *(ram_addr_t *) opaque = pss->page;
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
+    /* Check if page is from UFFD-managed region. */
+    if (pss->block->flags & RAM_UF_WRITEPROTECT) {
+#ifdef CONFIG_LINUX
+        ram_addr_t page_from = (ram_addr_t) opaque;
+        hwaddr page_address = (hwaddr) pss->block->host +
+                              ((hwaddr) page_from << TARGET_PAGE_BITS);
+        hwaddr run_length = (hwaddr) (pss->page - page_from + 1) << TARGET_PAGE_BITS;
+        int res;
+
+        /* Flush async buffers before un-protect. */
+        qemu_fflush(rs->f);
+        /* Un-protect memory range. */
+        res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
+        /* We don't want to override existing error from ram_save_host_page(). */
+        if (res < 0 && *res_override >= 0) {
+            *res_override = res;
+        }
+#else
+        /* Should never happen */
+        qemu_file_set_error(rs->f, -ENOSYS);
+#endif /* CONFIG_LINUX */
+    }
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -1779,14 +1908,14 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         return pages;
     }
 
+    if (!rs->last_seen_block) {
+        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
+    }
+
     pss.block = rs->last_seen_block;
     pss.page = rs->last_page;
     pss.complete_round = false;
 
-    if (!pss.block) {
-        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
-    }
-
     do {
         again = true;
         found = get_queued_page(rs, &pss);
@@ -1797,7 +1926,11 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         }
 
         if (found) {
+            void *opaque;
+
+            ram_save_host_page_pre(rs, &pss, &opaque);
             pages = ram_save_host_page(rs, &pss, last_stage);
+            ram_save_host_page_post(rs, &pss, opaque, &pages);
         }
     } while (!pages && again);
 
@@ -3864,9 +3997,12 @@ fail:
     rs->uffdio_fd = -1;
     return -1;
 #else
+    /*
+     * Should never happen since we prohibit 'background-snapshot'
+     * capability on non-Linux hosts.
+     */
     rs->uffdio_fd = -1;
-    error_setg(&migrate_get_current()->error,
-            "Background-snapshot not supported on non-Linux hosts");
+    error_setg(&migrate_get_current()->error, QERR_UNDEFINED_ERROR);
     return -1;
 #endif /* CONFIG_LINUX */
 }
@@ -3903,8 +4039,11 @@ void ram_write_tracking_stop(void)
     uffd_close_fd(rs->uffdio_fd);
     rs->uffdio_fd = -1;
 #else
-    error_setg(&migrate_get_current()->error,
-            "Background-snapshot not supported on non-Linux hosts");
+    /*
+     * Should never happen since we prohibit 'background-snapshot'
+     * capability on non-Linux hosts.
+     */
+    error_setg(&migrate_get_current()->error, QERR_UNDEFINED_ERROR);
 #endif /* CONFIG_LINUX */
 }
 
-- 
2.25.1


