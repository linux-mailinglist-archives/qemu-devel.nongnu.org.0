Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDEC6F845B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:48:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvmN-0003hL-2k; Fri, 05 May 2023 09:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1puvmF-0003ck-AY; Fri, 05 May 2023 09:47:15 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1puvmB-0000DP-LE; Fri, 05 May 2023 09:47:15 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 095274762E;
 Fri,  5 May 2023 15:47:06 +0200 (CEST)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com,
 stefanha@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 pbonzini@redhat.com, t.lamprecht@proxmox.com
Subject: [PATCH] migration: for snapshots, hold the BQL during setup callbacks
Date: Fri,  5 May 2023 15:46:52 +0200
Message-Id: <20230505134652.140884-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In spirit, this is a partial revert of commit 9b09503752 ("migration:
run setup callbacks out of big lock"), but only for the snapshot case.

For snapshots, the bdrv_writev_vmstate() function is used during setup
(in QIOChannelBlock backing the QEMUFile), but not holding the BQL
while calling it could lead to an assertion failure. To understand
how, first note the following:

1. Generated coroutine wrappers for block layer functions spawn the
coroutine and use AIO_WAIT_WHILE()/aio_poll() to wait for it.
2. If the host OS switches threads at an inconvenient time, it can
happen that a bottom half scheduled for the main thread's AioContext
is executed as part of a vCPU thread's aio_poll().

An example leading to the assertion failure is as follows:

main thread:
1. A snapshot-save QMP command gets issued.
2. snapshot_save_job_bh() is scheduled.

vCPU thread:
3. aio_poll() for the main thread's AioContext is called (e.g. when
the guest writes to a pflash device, as part of blk_pwrite which is a
generated coroutine wrapper).
4. snapshot_save_job_bh() is executed as part of aio_poll().
3. qemu_savevm_state() is called.
4. qemu_mutex_unlock_iothread() is called. Now
qemu_get_current_aio_context() returns 0x0.
5. bdrv_writev_vmstate() is executed during the usual savevm setup.
But this function is a generated coroutine wrapper, so it uses
AIO_WAIT_WHILE. There, the assertion
assert(qemu_get_current_aio_context() == qemu_get_aio_context());
will fail.

To fix it, ensure that the BQL is held during setup. To avoid changing
the behavior for migration too, introduce conditionals for the setup
callbacks that need the BQL and only take the lock if it's not already
held.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 include/migration/register.h   |  2 +-
 migration/block-dirty-bitmap.c | 15 ++++++++++++---
 migration/block.c              | 15 ++++++++++++---
 migration/ram.c                | 16 +++++++++++++---
 migration/savevm.c             |  2 --
 5 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index a8dfd8fefd..fa9b0b0f10 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -43,9 +43,9 @@ typedef struct SaveVMHandlers {
      * by other locks.
      */
     int (*save_live_iterate)(QEMUFile *f, void *opaque);
+    int (*save_setup)(QEMUFile *f, void *opaque);
 
     /* This runs outside the iothread lock!  */
-    int (*save_setup)(QEMUFile *f, void *opaque);
     /* Note for save_live_pending:
      * must_precopy:
      * - must be migrated in precopy or in stopped state
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 6624f39bc6..4943f4d644 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -1217,10 +1217,17 @@ static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms = NULL;
+    bool release_lock = false;
 
-    qemu_mutex_lock_iothread();
+    /* For snapshots, the BQL is held during setup. */
+    if (!qemu_mutex_iothread_locked()) {
+        qemu_mutex_lock_iothread();
+        release_lock = true;
+    }
     if (init_dirty_bitmap_migration(s) < 0) {
-        qemu_mutex_unlock_iothread();
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+        }
         return -1;
     }
 
@@ -1228,7 +1235,9 @@ static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque)
         send_bitmap_start(f, s, dbms);
     }
     qemu_put_bitmap_flags(f, DIRTY_BITMAP_MIG_FLAG_EOS);
-    qemu_mutex_unlock_iothread();
+    if (release_lock) {
+        qemu_mutex_unlock_iothread();
+    }
     return 0;
 }
 
diff --git a/migration/block.c b/migration/block.c
index 6d532ac7a2..399cf86cb4 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -717,21 +717,30 @@ static void block_migration_cleanup(void *opaque)
 static int block_save_setup(QEMUFile *f, void *opaque)
 {
     int ret;
+    bool release_lock = false;
 
     trace_migration_block_save("setup", block_mig_state.submitted,
                                block_mig_state.transferred);
 
-    qemu_mutex_lock_iothread();
+    /* For snapshots, the BQL is held during setup. */
+    if (!qemu_mutex_iothread_locked()) {
+        qemu_mutex_lock_iothread();
+        release_lock = true;
+    }
     ret = init_blk_migration(f);
     if (ret < 0) {
-        qemu_mutex_unlock_iothread();
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+        }
         return ret;
     }
 
     /* start track dirty blocks */
     ret = set_dirty_tracking();
 
-    qemu_mutex_unlock_iothread();
+    if (release_lock) {
+        qemu_mutex_unlock_iothread();
+    }
 
     if (ret) {
         return ret;
diff --git a/migration/ram.c b/migration/ram.c
index 7d81c4a39e..c05c2d9506 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3106,8 +3106,16 @@ static void migration_bitmap_clear_discarded_pages(RAMState *rs)
 
 static void ram_init_bitmaps(RAMState *rs)
 {
-    /* For memory_global_dirty_log_start below.  */
-    qemu_mutex_lock_iothread();
+    bool release_lock = false;
+
+    /*
+     * For memory_global_dirty_log_start below.
+     * For snapshots, the BQL is held during setup.
+     */
+    if (!qemu_mutex_iothread_locked()) {
+        qemu_mutex_lock_iothread();
+        release_lock = true;
+    }
     qemu_mutex_lock_ramlist();
 
     WITH_RCU_READ_LOCK_GUARD() {
@@ -3119,7 +3127,9 @@ static void ram_init_bitmaps(RAMState *rs)
         }
     }
     qemu_mutex_unlock_ramlist();
-    qemu_mutex_unlock_iothread();
+    if (release_lock) {
+        qemu_mutex_unlock_iothread();
+    }
 
     /*
      * After an eventual first bitmap sync, fixup the initial bitmap
diff --git a/migration/savevm.c b/migration/savevm.c
index a9d0a88e62..d545b01516 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1626,10 +1626,8 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     memset(&compression_counters, 0, sizeof(compression_counters));
     ms->to_dst_file = f;
 
-    qemu_mutex_unlock_iothread();
     qemu_savevm_state_header(f);
     qemu_savevm_state_setup(f);
-    qemu_mutex_lock_iothread();
 
     while (qemu_file_get_error(f) == 0) {
         if (qemu_savevm_state_iterate(f, false) > 0) {
-- 
2.30.2



