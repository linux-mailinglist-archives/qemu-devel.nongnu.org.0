Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF202B7C9D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 12:28:50 +0100 (CET)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfLdq-0001vh-1w
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 06:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXv-00054I-Ev
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:22:45 -0500
Received: from relay.sw.ru ([185.231.240.75]:41856 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXq-0003Of-G9
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 06:22:43 -0500
Received: from [192.168.15.76] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfLXb-009A89-3z; Wed, 18 Nov 2020 14:22:23 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH 3/7] Support UFFD write fault processing in ram_save_iterate().
Date: Wed, 18 Nov 2020 14:22:29 +0300
Message-Id: <20201118112233.264530-4-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
References: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:22:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
 migration/ram.c | 124 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7f273c9996..08a1d7a252 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -314,6 +314,8 @@ struct RAMState {
     ram_addr_t last_page;
     /* last ram version we have seen */
     uint32_t last_version;
+    /* 'write-tracking' migration is enabled */
+    bool ram_wt_enabled;
     /* We are in the first round */
     bool ram_bulk_stage;
     /* The free page optimization is enabled */
@@ -574,8 +576,6 @@ static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
     return 0;
 }
 
-__attribute__ ((unused))
-static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
 __attribute__ ((unused))
 static bool uffd_poll_events(int uffd, int tmo);
 
@@ -1929,6 +1929,86 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     return pages;
 }
 
+/**
+ * ram_find_block_by_host_address: find RAM block containing host page
+ *
+ * Returns true if RAM block is found and pss->block/page are
+ * pointing to the given host page, false in case of an error
+ *
+ * @rs: current RAM state
+ * @pss: page-search-status structure
+ */
+static bool ram_find_block_by_host_address(RAMState *rs, PageSearchStatus *pss,
+        hwaddr page_address)
+{
+    bool found = false;
+
+    pss->block = rs->last_seen_block;
+    do {
+        if (page_address >= (hwaddr) pss->block->host &&
+            (page_address + TARGET_PAGE_SIZE) <=
+                    ((hwaddr) pss->block->host + pss->block->used_length)) {
+            pss->page = (unsigned long)
+                    ((page_address - (hwaddr) pss->block->host) >> TARGET_PAGE_BITS);
+            found = true;
+            break;
+        }
+
+        pss->block = QLIST_NEXT_RCU(pss->block, next);
+        if (!pss->block) {
+            /* Hit the end of the list */
+            pss->block = QLIST_FIRST_RCU(&ram_list.blocks);
+        }
+    } while (pss->block != rs->last_seen_block);
+
+    rs->last_seen_block = pss->block;
+    /*
+     * Since we are in the same loop with ram_find_and_save_block(),
+     * need to reset pss->complete_round after switching to
+     * other block/page in pss.
+     */
+    pss->complete_round = false;
+
+    return found;
+}
+
+/**
+ * get_fault_page: try to get next UFFD write fault page and, if pending fault
+ *   is found, put info about RAM block and block page into pss structure
+ *
+ * Returns true in case of UFFD write fault detected, false otherwise
+ *
+ * @rs: current RAM state
+ * @pss: page-search-status structure
+ *
+ */
+static bool get_fault_page(RAMState *rs, PageSearchStatus *pss)
+{
+    struct uffd_msg uffd_msg;
+    hwaddr page_address;
+    int res;
+
+    if (!rs->ram_wt_enabled) {
+        return false;
+    }
+
+    res = uffd_read_events(rs->uffdio_fd, &uffd_msg, 1);
+    if (res <= 0) {
+        return false;
+    }
+
+    page_address = uffd_msg.arg.pagefault.address;
+    if (!ram_find_block_by_host_address(rs, pss, page_address)) {
+        /* In case we couldn't find respective block, just unprotect faulting page */
+        uffd_protect_memory(rs->uffdio_fd, page_address, TARGET_PAGE_SIZE, false);
+        error_report("ram_find_block_by_host_address() failed: address=0x%0lx",
+                     page_address);
+        return false;
+    }
+
+    return true;
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -1955,25 +2035,50 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
         return pages;
     }
 
+    if (!rs->last_seen_block) {
+        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
+    }
     pss.block = rs->last_seen_block;
     pss.page = rs->last_page;
     pss.complete_round = false;
 
-    if (!pss.block) {
-        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
-    }
-
     do {
+        ram_addr_t page;
+        ram_addr_t page_to;
+
         again = true;
-        found = get_queued_page(rs, &pss);
-
+        /* In case of 'write-tracking' migration we first try
+         * to poll UFFD and get write page fault event */
+        found = get_fault_page(rs, &pss);
+        if (!found) {
+            /* No trying to fetch something from the priority queue */
+            found = get_queued_page(rs, &pss);
+        }
         if (!found) {
             /* priority queue empty, so just search for something dirty */
             found = find_dirty_block(rs, &pss, &again);
         }
 
         if (found) {
+            page = pss.page;
             pages = ram_save_host_page(rs, &pss, last_stage);
+            page_to = pss.page;
+
+            /* Check if page is from UFFD-managed region */
+            if (pss.block->flags & RAM_UF_WRITEPROTECT) {
+                hwaddr page_address = (hwaddr) pss.block->host +
+                        ((hwaddr) page << TARGET_PAGE_BITS);
+                hwaddr run_length = (hwaddr) (page_to - page + 1) << TARGET_PAGE_BITS;
+                int res;
+
+                /* Flush async buffers before un-protect */
+                qemu_fflush(rs->f);
+                /* Un-protect memory range */
+                res = uffd_protect_memory(rs->uffdio_fd, page_address, run_length, false);
+                if (res < 0) {
+                    break;
+                }
+            }
         }
     } while (!pages && again);
 
@@ -2086,7 +2191,8 @@ static void ram_state_reset(RAMState *rs)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
     rs->last_version = ram_list.version;
-    rs->ram_bulk_stage = true;
+    rs->ram_wt_enabled = migrate_track_writes_ram();
+    rs->ram_bulk_stage = !rs->ram_wt_enabled;
     rs->fpo_enabled = false;
 }
 
-- 
2.25.1


