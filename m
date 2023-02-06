Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F568BB49
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:22:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzZq-0004I4-E2; Mon, 06 Feb 2023 06:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZi-0004FT-NB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZg-0003Nz-0e
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Q1skwqJamEhJJMNEc5BkiWW2OHQ6d6mDlGtktQruOA=;
 b=ZYLLrMGxiuKQnsQTlivGsYl/zV7aR++pKJWDNUILmWH+/Qqa/PQOeFhIAxyFi2Yq4FICTw
 Go4PTb/OzhS00xYkq7qNEOqVKYhU29J/Rx9r5BKRzZ1TDAbp+uz2GNlm9fJCMK+0ZVL9jq
 DsAxcUJnvSQY2C7fResX/E6vgMZkpNI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-DutwdtJMP5qQUYAfgfdfIw-1; Mon, 06 Feb 2023 06:21:05 -0500
X-MC-Unique: DutwdtJMP5qQUYAfgfdfIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28DD5811E9C;
 Mon,  6 Feb 2023 11:21:05 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5609C492B21;
 Mon,  6 Feb 2023 11:21:00 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 2/8] memory: Add last stage indicator to global dirty
 log synchronization
Date: Mon,  6 Feb 2023 19:20:04 +0800
Message-Id: <20230206112010.99871-3-gshan@redhat.com>
In-Reply-To: <20230206112010.99871-1-gshan@redhat.com>
References: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
callback. This last stage information isn't used yet.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c   |  2 +-
 include/exec/memory.h |  5 +++--
 migration/dirtyrate.c |  4 ++--
 migration/ram.c       |  6 +++---
 softmmu/memory.c      | 10 +++++-----
 5 files changed, 14 insertions(+), 13 deletions(-)

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
index 4bfb97fc68..aecc8142e4 100644
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
index 334309f1c6..d1b9b270ec 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1188,7 +1188,7 @@ static void migration_bitmap_sync(RAMState *rs)
     }
 
     trace_migration_bitmap_sync_start();
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(false);
 
     qemu_mutex_lock(&rs->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
@@ -3817,7 +3817,7 @@ void colo_incoming_start_dirty_log(void)
     qemu_mutex_lock_iothread();
     qemu_mutex_lock_ramlist();
 
-    memory_global_dirty_log_sync();
+    memory_global_dirty_log_sync(false);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -4114,7 +4114,7 @@ void colo_flush_ram_cache(void)
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


