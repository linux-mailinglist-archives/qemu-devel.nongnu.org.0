Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC33ACF2F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:34:38 +0200 (CEST)
Received: from localhost ([::1]:40846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGVx-0002pu-Nn
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1luGPo-0006TP-ND
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:16 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:34114
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1luGPk-0008B4-RS
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:16 -0400
HMM_SOURCE_IP: 172.18.0.218:58570.1979376666
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-c4a34c2761364744ac7f6e25c2e48997
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 79A3228008E;
 Fri, 18 Jun 2021 23:28:10 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 0ae3096927504a9db4c34e8151d95ef0 for
 qemu-devel@nongnu.org; Fri Jun 18 23:28:09 2021
X-Transaction-ID: 0ae3096927504a9db4c34e8151d95ef0
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v8 2/6] memory: make global_dirty_tracking a bitmask
Date: Fri, 18 Jun 2021 23:32:03 +0800
Message-Id: <0065e888fde8114be8a66406389cd75f014a0dd8.1624028590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624028590.git.huangy81@chinatelecom.cn>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624028590.git.huangy81@chinatelecom.cn>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
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

since dirty ring has been introduced, there are two methods
to track dirty pages of vm. it seems that "logging" has
a hint on the method, so rename the global_dirty_log to
global_dirty_tracking would make description more accurate.

dirty rate measurement may start or stop dirty tracking during
calculation. this conflict with migration because stop dirty
tracking make migration leave dirty pages out then that'll be
a problem.

make global_dirty_tracking a bitmask can let both migration and
dirty rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION
and GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty
tracking aims for, migration or dirty rate.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 include/exec/memory.h   | 20 +++++++++++++++++---
 include/exec/ram_addr.h |  4 ++--
 migration/ram.c         |  8 ++++----
 softmmu/memory.c        | 32 +++++++++++++++++++++-----------
 softmmu/trace-events    |  1 +
 5 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b114f54..dd2404f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -55,7 +55,17 @@ static inline void fuzz_dma_read_cb(size_t addr,
 }
 #endif
 
-extern bool global_dirty_log;
+/* Possible bits for global_dirty_log */
+
+/* Dirty tracking enabled because migration is running */
+#define GLOBAL_DIRTY_MIGRATION  (1U << 0)
+
+/* Dirty tracking enabled because measuring dirty rate */
+#define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
+
+#define GLOBAL_DIRTY_MASK  (0x3)
+
+extern unsigned int global_dirty_tracking;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
 
@@ -2099,13 +2109,17 @@ void memory_listener_unregister(MemoryListener *listener);
 
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
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3cb9791..a0bce11 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -372,7 +372,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
                     qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
 
-                    if (global_dirty_log) {
+                    if (global_dirty_tracking) {
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
@@ -395,7 +395,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-        if (!global_dirty_log) {
+        if (!global_dirty_tracking) {
             clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
         }
 
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
index c19b0be..076beeb 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -39,7 +39,7 @@
 static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
-bool global_dirty_log;
+unsigned int global_dirty_tracking;
 
 static QTAILQ_HEAD(, MemoryListener) memory_listeners
     = QTAILQ_HEAD_INITIALIZER(memory_listeners);
@@ -1813,7 +1813,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
     uint8_t mask = mr->dirty_log_mask;
     RAMBlock *rb = mr->ram_block;
 
-    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+    if (global_dirty_tracking && ((rb && qemu_ram_is_migratable(rb)) ||
                              memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
@@ -2659,14 +2659,18 @@ void memory_global_after_dirty_log_sync(void)
 
 static VMChangeStateEntry *vmstate_change;
 
-void memory_global_dirty_log_start(void)
+void memory_global_dirty_log_start(unsigned int flags)
 {
     if (vmstate_change) {
         qemu_del_vm_change_state_handler(vmstate_change);
         vmstate_change = NULL;
     }
 
-    global_dirty_log = true;
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
+    assert(!(global_dirty_tracking & flags));
+    global_dirty_tracking |= flags;
+
+    trace_global_dirty_changed(global_dirty_tracking);
 
     MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
 
@@ -2676,9 +2680,13 @@ void memory_global_dirty_log_start(void)
     memory_region_transaction_commit();
 }
 
-static void memory_global_dirty_log_do_stop(void)
+static void memory_global_dirty_log_do_stop(unsigned int flags)
 {
-    global_dirty_log = false;
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
+    assert((global_dirty_tracking & flags) == flags);
+    global_dirty_tracking &= ~flags;
+
+    trace_global_dirty_changed(global_dirty_tracking);
 
     /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
     memory_region_transaction_begin();
@@ -2691,8 +2699,9 @@ static void memory_global_dirty_log_do_stop(void)
 static void memory_vm_change_state_handler(void *opaque, bool running,
                                            RunState state)
 {
+    unsigned int *flags = (unsigned int *)opaque;
     if (running) {
-        memory_global_dirty_log_do_stop();
+        memory_global_dirty_log_do_stop(*flags);
 
         if (vmstate_change) {
             qemu_del_vm_change_state_handler(vmstate_change);
@@ -2701,18 +2710,19 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
     }
 }
 
-void memory_global_dirty_log_stop(void)
+void memory_global_dirty_log_stop(unsigned int flags)
 {
     if (!runstate_is_running()) {
         if (vmstate_change) {
             return;
         }
         vmstate_change = qemu_add_vm_change_state_handler(
-                                memory_vm_change_state_handler, NULL);
+                                memory_vm_change_state_handler,
+                                (void *)&flags);
         return;
     }
 
-    memory_global_dirty_log_do_stop();
+    memory_global_dirty_log_do_stop(flags);
 }
 
 static void listener_add_address_space(MemoryListener *listener,
@@ -2724,7 +2734,7 @@ static void listener_add_address_space(MemoryListener *listener,
     if (listener->begin) {
         listener->begin(listener);
     }
-    if (global_dirty_log) {
+    if (global_dirty_tracking) {
         if (listener->log_global_start) {
             listener->log_global_start(listener);
         }
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


