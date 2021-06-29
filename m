Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB93B7364
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:42:03 +0200 (CEST)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDzu-0005uY-Ry
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lyDxl-0003X5-Ph
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:39:41 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:59775
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lyDxh-000463-Le
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:39:41 -0400
HMM_SOURCE_IP: 172.18.0.48:50414.1447535983
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.101?logid-1ed94964eb2a4b1eab273f92c2ac1cf2
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 998ED28009C;
 Tue, 29 Jun 2021 21:39:34 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 2df8ac82418d41e5bf8c1e750d53ef99 for
 qemu-devel@nongnu.org; Tue Jun 29 21:39:35 2021
X-Transaction-ID: 2df8ac82418d41e5bf8c1e750d53ef99
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v11 2/6] memory: make global_dirty_tracking a bitmask
Date: Tue, 29 Jun 2021 21:39:14 +0800
Message-Id: <c6e9844e9ab01bd8a8e458e9b110d722e7021d5b.1624973150.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1624973150.git.huangy81@chinatelecom.cn>
References: <cover.1624973150.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1624973150.git.huangy81@chinatelecom.cn>
References: <cover.1624973150.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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
Message-Id: <9c9388657cfa0301bd2c1cfa36e7cf6da4aeca19.1624040308.git.huangy81@chinatelecom.cn>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/xen/xen-hvm.c   |  4 ++--
 include/exec/memory.h   | 20 +++++++++++++++++---
 include/exec/ram_addr.h |  4 ++--
 migration/ram.c         | 15 +++++++++++----
 softmmu/memory.c        | 32 +++++++++++++++++++++-----------
 softmmu/trace-events    |  1 +
 6 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 9b43277..d836d48 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1611,8 +1611,8 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
     if (enable) {
-        memory_global_dirty_log_start();
+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
     } else {
-        memory_global_dirty_log_stop();
+        memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     }
 }
diff --git a/include/exec/memory.h b/include/exec/memory.h
index b116f7c..0ad0fe0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -55,7 +55,17 @@ static inline void fuzz_dma_read_cb(size_t addr,
 }
 #endif
 
-extern bool global_dirty_log;
+/* Possible bits for global_dirty_log_{start|stop} */
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
 
@@ -2105,13 +2115,17 @@ void memory_listener_unregister(MemoryListener *listener);
 
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
index 551876b..45c9132 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -369,7 +369,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
                     qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
 
-                    if (global_dirty_log) {
+                    if (global_dirty_tracking) {
                         qatomic_or(
                                 &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
                                 temp);
@@ -392,7 +392,7 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
     } else {
         uint8_t clients = tcg_enabled() ? DIRTY_CLIENTS_ALL : DIRTY_CLIENTS_NOCODE;
 
-        if (!global_dirty_log) {
+        if (!global_dirty_tracking) {
             clients &= ~(1 << DIRTY_MEMORY_MIGRATION);
         }
 
diff --git a/migration/ram.c b/migration/ram.c
index 723af67..33d201f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2190,7 +2190,14 @@ static void ram_save_cleanup(void *opaque)
         /* caller have hold iothread lock or is in a bh, so there is
          * no writing race against the migration bitmap
          */
-        memory_global_dirty_log_stop();
+        if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
+            /*
+             * do not stop dirty log without starting it, since
+             * memory_global_dirty_log_stop will assert that
+             * memory_global_dirty_log_start/stop used in pairs
+             */
+            memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
+        }
     }
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
@@ -2652,7 +2659,7 @@ static void ram_init_bitmaps(RAMState *rs)
         ram_list_init_bitmaps();
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
-            memory_global_dirty_log_start();
+            memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
             migration_bitmap_sync_precopy(rs);
         }
     }
@@ -3392,7 +3399,7 @@ void colo_incoming_start_dirty_log(void)
             /* Discard this dirty bitmap record */
             bitmap_zero(block->bmap, block->max_length >> TARGET_PAGE_BITS);
         }
-        memory_global_dirty_log_start();
+        memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
     }
     ram_state->migration_dirty_pages = 0;
     qemu_mutex_unlock_ramlist();
@@ -3404,7 +3411,7 @@ void colo_release_ram_cache(void)
 {
     RAMBlock *block;
 
-    memory_global_dirty_log_stop();
+    memory_global_dirty_log_stop(GLOBAL_DIRTY_MIGRATION);
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         g_free(block->bmap);
         block->bmap = NULL;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index f016151..9ddfb61 100644
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
@@ -1812,7 +1812,7 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
     uint8_t mask = mr->dirty_log_mask;
     RAMBlock *rb = mr->ram_block;
 
-    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+    if (global_dirty_tracking && ((rb && qemu_ram_is_migratable(rb)) ||
                              memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
@@ -2658,14 +2658,18 @@ void memory_global_after_dirty_log_sync(void)
 
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
 
@@ -2675,9 +2679,13 @@ void memory_global_dirty_log_start(void)
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
@@ -2690,8 +2698,9 @@ static void memory_global_dirty_log_do_stop(void)
 static void memory_vm_change_state_handler(void *opaque, bool running,
                                            RunState state)
 {
+    unsigned int flags = (unsigned int)(uintptr_t)opaque;
     if (running) {
-        memory_global_dirty_log_do_stop();
+        memory_global_dirty_log_do_stop(flags);
 
         if (vmstate_change) {
             qemu_del_vm_change_state_handler(vmstate_change);
@@ -2700,18 +2709,19 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
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
+                                (void *)(uintptr_t)flags);
         return;
     }
 
-    memory_global_dirty_log_do_stop();
+    memory_global_dirty_log_do_stop(flags);
 }
 
 static void listener_add_address_space(MemoryListener *listener,
@@ -2723,7 +2733,7 @@ static void listener_add_address_space(MemoryListener *listener,
     if (listener->begin) {
         listener->begin(listener);
     }
-    if (global_dirty_log) {
+    if (global_dirty_tracking) {
         if (listener->log_global_start) {
             listener->log_global_start(listener);
         }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index d18ac41..f95ea3d 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -18,6 +18,7 @@ memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t
 flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
+global_dirty_changed(unsigned int bitmask) "bitmask 0x%"PRIx32
 
 # softmmu.c
 vm_stop_flush_all(int ret) "ret %d"
-- 
1.8.3.1


