Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F2693B6B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 01:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRMtP-00009V-RV; Sun, 12 Feb 2023 19:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMt4-00006L-Mg
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMt2-0003F0-QH
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPja2F7TgqFSUcDrRn8cAdzFQ0D9XYU/Qf9AWfbMHy0=;
 b=e0vElEHpUTzdoV6zTINQBGude0uJkGiVvR7zmiLuh4jH7BVIY49wv8J0hQLjuzEYV/UydG
 tL2PO+6J8pC3YePN6ZpnewKc10RAnweJ+tnhTISTewa8+5Bk0YiYtkCiMjzXSVy2GWVUAA
 +psB8oRbHq4aCui9M7dJaR2EnqvocWU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-rRKPsslkM4SFQ9TLvKr4Vg-1; Sun, 12 Feb 2023 19:39:59 -0500
X-MC-Unique: rRKPsslkM4SFQ9TLvKr4Vg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 545B529AA39A;
 Mon, 13 Feb 2023 00:39:59 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A29D9400EA93;
 Mon, 13 Feb 2023 00:39:53 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 2/6] migration: Add last stage indicator to global dirty
 log synchronization
Date: Mon, 13 Feb 2023 08:39:21 +0800
Message-Id: <20230213003925.40158-3-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
References: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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

The global dirty log synchronization is used when KVM and dirty ring
are enabled. There is a particularity for ARM64 where the backup
bitmap is used to track dirty pages in non-running-vcpu situations.
It means the dirty ring works with the combination of ring buffer
and backup bitmap. The dirty bits in the backup bitmap needs to
collected in the last stage of live migration.

In order to identify the last stage of live migration and pass it
down, an extra parameter is added to the relevant functions and
callbacks. This last stage indicator isn't used until the dirty
ring is enabled in the subsequent patches.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c   |  2 +-
 include/exec/memory.h |  5 +++--
 migration/dirtyrate.c |  4 ++--
 migration/ram.c       | 20 ++++++++++----------
 softmmu/memory.c      | 10 +++++-----
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9b26582655..01a6a026af 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1554,7 +1554,7 @@ static void kvm_log_sync(MemoryListener *listener,
     kvm_slots_unlock();
 }
 
-static void kvm_log_sync_global(MemoryListener *l)
+static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
 {
     KVMMemoryListener *kml = container_of(l, KVMMemoryListener, listener);
     KVMState *s = kvm_state;
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..75b2fd9f48 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -929,8 +929,9 @@ struct MemoryListener {
      * its @log_sync must be NULL.  Vice versa.
      *
      * @listener: The #MemoryListener.
+     * @last_stage: The last stage to synchronize the log during migration
      */
-    void (*log_sync_global)(MemoryListener *listener);
+    void (*log_sync_global)(MemoryListener *listener, bool last_stage);
 
     /**
      * @log_clear:
@@ -2408,7 +2409,7 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
  *
  * Synchronizes the dirty page log for all address spaces.
  */
-void memory_global_dirty_log_sync(void);
+void memory_global_dirty_log_sync(bool last_stage);
 
 /**
  * memory_global_dirty_log_sync: synchronize the dirty log for all memory
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 575d48c397..da9b4a1f8d 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -101,7 +101,7 @@ void global_dirty_log_change(unsigned int flag, bool start)
 static void global_dirty_log_sync(unsigned int flag, bool one_shot)
 {
     qemu_mutex_lock_iothread();
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(false);
     if (one_shot) {
         memory_global_dirty_log_stop(flag);
     }
@@ -553,7 +553,7 @@ static void calculate_dirtyrate_dirty_bitmap(struct DirtyRateConfig config)
      * skip it unconditionally and start dirty tracking
      * from 2'round of log sync
      */
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(false);
 
     /*
      * reset page protect manually and unconditionally.
diff --git a/migration/ram.c b/migration/ram.c
index b966e148c2..52abf015fd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1176,7 +1176,7 @@ static void migration_trigger_throttle(RAMState *rs)
     }
 }
 
-static void migration_bitmap_sync(RAMState *rs)
+static void migration_bitmap_sync(RAMState *rs, bool last_stage)
 {
     RAMBlock *block;
     int64_t end_time;
@@ -1188,7 +1188,7 @@ static void migration_bitmap_sync(RAMState *rs)
     }
 
     trace_migration_bitmap_sync_start();
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(last_stage);
 
     qemu_mutex_lock(&rs->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
@@ -1222,7 +1222,7 @@ static void migration_bitmap_sync(RAMState *rs)
     }
 }
 
-static void migration_bitmap_sync_precopy(RAMState *rs)
+static void migration_bitmap_sync_precopy(RAMState *rs, bool last_stage)
 {
     Error *local_err = NULL;
 
@@ -1235,7 +1235,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
         local_err = NULL;
     }
 
-    migration_bitmap_sync(rs);
+    migration_bitmap_sync(rs, last_stage);
 
     if (precopy_notify(PRECOPY_NOTIFY_AFTER_BITMAP_SYNC, &local_err)) {
         error_report_err(local_err);
@@ -2887,7 +2887,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
     RCU_READ_LOCK_GUARD();
 
     /* This should be our last sync, the src is now paused */
-    migration_bitmap_sync(rs);
+    migration_bitmap_sync(rs, false);
 
     /* Easiest way to make sure we don't resume in the middle of a host-page */
     rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
@@ -3077,7 +3077,7 @@ static void ram_init_bitmaps(RAMState *rs)
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
             memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
-            migration_bitmap_sync_precopy(rs);
+            migration_bitmap_sync_precopy(rs, false);
         }
     }
     qemu_mutex_unlock_ramlist();
@@ -3392,7 +3392,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
 
     WITH_RCU_READ_LOCK_GUARD() {
         if (!migration_in_postcopy()) {
-            migration_bitmap_sync_precopy(rs);
+            migration_bitmap_sync_precopy(rs, true);
         }
 
         ram_control_before_iterate(f, RAM_CONTROL_FINISH);
@@ -3466,7 +3466,7 @@ static void ram_state_pending_exact(void *opaque,
     if (!migration_in_postcopy()) {
         qemu_mutex_lock_iothread();
         WITH_RCU_READ_LOCK_GUARD() {
-            migration_bitmap_sync_precopy(rs);
+            migration_bitmap_sync_precopy(rs, false);
         }
         qemu_mutex_unlock_iothread();
         remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
@@ -3876,7 +3876,7 @@ void colo_incoming_start_dirty_log(void)
     qemu_mutex_lock_iothread();
     qemu_mutex_lock_ramlist();
 
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(false);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -4167,7 +4167,7 @@ void colo_flush_ram_cache(void)
     void *src_host;
     unsigned long offset = 0;
 
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(false);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..1cc36ef028 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2224,7 +2224,7 @@ void memory_region_set_dirty(MemoryRegion *mr, hwaddr addr,
  * If memory region `mr' is NULL, do global sync.  Otherwise, sync
  * dirty bitmap for the specified memory region.
  */
-static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
+static void memory_region_sync_dirty_bitmap(MemoryRegion *mr, bool last_stage)
 {
     MemoryListener *listener;
     AddressSpace *as;
@@ -2254,7 +2254,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
              * is to do a global sync, because we are not capable to
              * sync in a finer granularity.
              */
-            listener->log_sync_global(listener);
+            listener->log_sync_global(listener, last_stage);
             trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 1);
         }
     }
@@ -2318,7 +2318,7 @@ DirtyBitmapSnapshot *memory_region_snapshot_and_clear_dirty(MemoryRegion *mr,
 {
     DirtyBitmapSnapshot *snapshot;
     assert(mr->ram_block);
-    memory_region_sync_dirty_bitmap(mr);
+    memory_region_sync_dirty_bitmap(mr, false);
     snapshot = cpu_physical_memory_snapshot_and_clear_dirty(mr, addr, size, client);
     memory_global_after_dirty_log_sync();
     return snapshot;
@@ -2844,9 +2844,9 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr)
     return mr && mr != container;
 }
 
-void memory_global_dirty_log_sync(void)
+void memory_global_dirty_log_sync(bool last_stage)
 {
-    memory_region_sync_dirty_bitmap(NULL);
+    memory_region_sync_dirty_bitmap(NULL, last_stage);
 }
 
 void memory_global_after_dirty_log_sync(void)
-- 
2.23.0


