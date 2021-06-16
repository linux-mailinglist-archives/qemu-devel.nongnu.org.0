Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF33A8E29
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:17:10 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKB3-0003Hx-GH
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltK30-000726-8l
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:08:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51325
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltK2m-00064j-HV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:08:49 -0400
HMM_SOURCE_IP: 172.18.0.218:55640.1447589156
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-6d78197d793c4667afc4678d3a3390f7
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 3C1302800AC;
 Wed, 16 Jun 2021 09:08:31 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 33d7b114a3c745d59bf35548c6ec1791 for
 qemu-devel@nongnu.org; Wed Jun 16 09:08:33 2021
X-Transaction-ID: 33d7b114a3c745d59bf35548c6ec1791
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] memory: make global_dirty_log a bitmask
Date: Wed, 16 Jun 2021 09:12:28 +0800
Message-Id: <3848028c3029e2e870286c84c2b3e9a93967567e.1623804189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1623804189.git.huangy81@chinatelecom.cn>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1623804189.git.huangy81@chinatelecom.cn>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

dirty rate measurement may start or stop dirty logging during
calculation. this conflict with migration because stop dirty
log make migration leave dirty pages out then that'll be a problem.

make global_dirty_log a bitmask can let both migration and dirty
rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION and
GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty log aims
for, migration or dirty rate.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/memory.h | 14 +++++++++++---
 migration/ram.c       |  8 ++++----
 softmmu/memory.c      | 31 ++++++++++++++++++++++---------
 softmmu/trace-events  |  1 +
 4 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b114f54..e31eef2 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -55,7 +55,11 @@ static inline void fuzz_dma_read_cb(size_t addr,
 }
 #endif
 
-extern bool global_dirty_log;
+/* what is the purpose of current dirty log, migration or dirty rate ? */
+#define GLOBAL_DIRTY_MIGRATION  (1U << 0)
+#define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
+
+extern unsigned int global_dirty_log;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
 
@@ -2099,13 +2103,17 @@ void memory_listener_unregister(MemoryListener *listener);
 
 /**
  * memory_global_dirty_log_start: begin dirty logging for all regions
+ *
+ * @flags: purpose of starting dirty log, migration or dirty rate
  */
-void memory_global_dirty_log_start(void);
+void memory_global_dirty_log_start(unsigned int flags);
 
 /**
  * memory_global_dirty_log_stop: end dirty logging for all regions
+ *
+ * @flags: purpose of stopping dirty log, migration or dirty rate
  */
-void memory_global_dirty_log_stop(void);
+void memory_global_dirty_log_stop(unsigned int flags);
 
 void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled);
 
diff --git a/migration/ram.c b/migration/ram.c
index 60ea913..9ce31af 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2190,7 +2190,7 @@ static void ram_save_cleanup(void *opaque)
         /* caller have hold iothread lock or is in a bh, so there is
          * no writing race against the migration bitmap
          */
-        memory_global_dirty_log_stop();
+        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     }
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
@@ -2652,7 +2652,7 @@ static void ram_init_bitmaps(RAMState *rs)
         ram_list_init_bitmaps();
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
-            memory_global_dirty_log_start();
+            memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
             migration_bitmap_sync_precopy(rs);
         }
     }
@@ -3393,7 +3393,7 @@ void colo_incoming_start_dirty_log(void)
             /* Discard this dirty bitmap record */
             bitmap_zero(block->bmap, block->max_length >> TARGET_PAGE_BITS);
         }
-        memory_global_dirty_log_start();
+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
     }
     ram_state->migration_dirty_pages = 0;
     qemu_mutex_unlock_ramlist();
@@ -3405,7 +3405,7 @@ void colo_release_ram_cache(void)
 {
     RAMBlock *block;
 
-    memory_global_dirty_log_stop();
+    memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         g_free(block->bmap);
         block->bmap = NULL;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index c19b0be..d74172f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -39,7 +39,7 @@
 static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
-bool global_dirty_log;
+unsigned int global_dirty_log;
 
 static QTAILQ_HEAD(, MemoryListener) memory_listeners
     = QTAILQ_HEAD_INITIALIZER(memory_listeners);
@@ -2659,14 +2659,19 @@ void memory_global_after_dirty_log_sync(void)
 
 static VMChangeStateEntry *vmstate_change;
 
-void memory_global_dirty_log_start(void)
+void memory_global_dirty_log_start(unsigned int flags)
 {
     if (vmstate_change) {
         qemu_del_vm_change_state_handler(vmstate_change);
         vmstate_change = NULL;
     }
 
-    global_dirty_log = true;
+#define  GLOBAL_DIRTY_MASK  (0x3)
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
+    assert(global_dirty_log ^ flags);
+    global_dirty_log |= flags;
+
+    trace_global_dirty_changed(global_dirty_log);
 
     MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
 
@@ -2676,9 +2681,12 @@ void memory_global_dirty_log_start(void)
     memory_region_transaction_commit();
 }
 
-static void memory_global_dirty_log_do_stop(void)
+static void memory_global_dirty_log_do_stop(unsigned int flags)
 {
-    global_dirty_log = false;
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
+    global_dirty_log &= ~flags;
+
+    trace_global_dirty_changed(global_dirty_log);
 
     /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
     memory_region_transaction_begin();
@@ -2691,8 +2699,10 @@ static void memory_global_dirty_log_do_stop(void)
 static void memory_vm_change_state_handler(void *opaque, bool running,
                                            RunState state)
 {
+    int *flags = opaque;
     if (running) {
-        memory_global_dirty_log_do_stop();
+        memory_global_dirty_log_do_stop(*flags);
+        g_free(opaque);
 
         if (vmstate_change) {
             qemu_del_vm_change_state_handler(vmstate_change);
@@ -2701,18 +2711,21 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
     }
 }
 
-void memory_global_dirty_log_stop(void)
+void memory_global_dirty_log_stop(unsigned int flags)
 {
+    int *opaque = NULL;
     if (!runstate_is_running()) {
         if (vmstate_change) {
             return;
         }
+        opaque = g_malloc0(sizeof(opaque));
+        *opaque = flags;
         vmstate_change = qemu_add_vm_change_state_handler(
-                                memory_vm_change_state_handler, NULL);
+                         memory_vm_change_state_handler, opaque);
         return;
     }
 
-    memory_global_dirty_log_do_stop();
+    memory_global_dirty_log_do_stop(flags);
 }
 
 static void listener_add_address_space(MemoryListener *listener,
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 5262828..4431f7f 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -18,6 +18,7 @@ memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t
 flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
+global_dirty_changed(unsigned int bitmask) "bitmask 0x%"PRIx32
 
 # vl.c
 vm_state_notify(int running, int reason, const char *reason_str) "running %d reason %d (%s)"
-- 
1.8.3.1


