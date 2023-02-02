Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E216883BF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc8M-0000is-2X; Thu, 02 Feb 2023 11:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc8H-0000Tq-Dr
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:08:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc8D-0005En-63
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ig+TS2lzwQqX94+KvxoXv/vGzNfT8L40p0vlRV5lRU=;
 b=NPvvTeIWT3HFVmTry933UbY9HVO1pULOAR5EeC/bkkSQ27S89+03Oq6Dqb4EfgSBDDk25u
 Xzmbo5ne+zVC3l2ZkICypZUarAY5aYxafaFzDRj0in0D9TGbiWU/RpWTW6at2w4CWpM5vY
 VmJ/p8IkS1H16Wnb13RCgaQFvwkH/yA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3R3lX5TBNeWknGuULoW_-g-1; Thu, 02 Feb 2023 11:07:31 -0500
X-MC-Unique: 3R3lX5TBNeWknGuULoW_-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 375C7100F825;
 Thu,  2 Feb 2023 16:07:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8826753AA;
 Thu,  2 Feb 2023 16:06:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org
Subject: [PULL 03/26] migration: Split save_live_pending() into state_pending_*
Date: Thu,  2 Feb 2023 17:06:17 +0100
Message-Id: <20230202160640.2300-4-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

We split the function into to:

- state_pending_estimate: We estimate the remaining state size without
  stopping the machine.

- state pending_exact: We calculate the exact amount of remaining
  state.

The only "device" that implements different functions for _estimate()
and _exact() is ram.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/devel/migration.rst       | 18 ++++++++-------
 docs/devel/vfio-migration.rst  |  4 ++--
 include/migration/register.h   | 19 +++++++++------
 migration/savevm.h             | 12 ++++++----
 hw/s390x/s390-stattrib.c       | 11 +++++----
 hw/vfio/migration.c            | 21 +++++++++--------
 migration/block-dirty-bitmap.c | 15 ++++++------
 migration/block.c              | 13 ++++++-----
 migration/migration.c          | 20 +++++++++++-----
 migration/ram.c                | 35 ++++++++++++++++++++--------
 migration/savevm.c             | 42 +++++++++++++++++++++++++++-------
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  7 +++---
 13 files changed, 143 insertions(+), 76 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 3e9656d8e0..6f65c23b47 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -482,15 +482,17 @@ An iterative device must provide:
   - A ``load_setup`` function that initialises the data structures on the
     destination.
 
-  - A ``save_live_pending`` function that is called repeatedly and must
-    indicate how much more data the iterative data must save.  The core
-    migration code will use this to determine when to pause the CPUs
-    and complete the migration.
+  - A ``state_pending_exact`` function that indicates how much more
+    data we must save.  The core migration code will use this to
+    determine when to pause the CPUs and complete the migration.
 
-  - A ``save_live_iterate`` function (called after ``save_live_pending``
-    when there is significant data still to be sent).  It should send
-    a chunk of data until the point that stream bandwidth limits tell it
-    to stop.  Each call generates one section.
+  - A ``state_pending_estimate`` function that indicates how much more
+    data we must save.  When the estimated amount is smaller than the
+    threshold, we call ``state_pending_exact``.
+
+  - A ``save_live_iterate`` function should send a chunk of data until
+    the point that stream bandwidth limits tell it to stop.  Each call
+    generates one section.
 
   - A ``save_live_complete_precopy`` function that must transmit the
     last section for the device containing any remaining data.
diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 9ff6163c88..673057c90d 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -28,7 +28,7 @@ VFIO implements the device hooks for the iterative approach as follows:
 * A ``load_setup`` function that sets up the migration region on the
   destination and sets _RESUMING flag in the VFIO device state.
 
-* A ``save_live_pending`` function that reads pending_bytes from the vendor
+* A ``state_pending_exact`` function that reads pending_bytes from the vendor
   driver, which indicates the amount of data that the vendor driver has yet to
   save for the VFIO device.
 
@@ -114,7 +114,7 @@ Live migration save path
                     (RUNNING, _SETUP, _RUNNING|_SAVING)
                                   |
                     (RUNNING, _ACTIVE, _RUNNING|_SAVING)
-             If device is active, get pending_bytes by .save_live_pending()
+             If device is active, get pending_bytes by .state_pending_exact()
           If total pending_bytes >= threshold_size, call .save_live_iterate()
                   Data of VFIO device for pre-copy phase is copied
         Iterate till total pending bytes converge and are less than threshold
diff --git a/include/migration/register.h b/include/migration/register.h
index 6ca71367af..15cf32994d 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -46,11 +46,6 @@ typedef struct SaveVMHandlers {
 
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
-    void (*save_live_pending)(void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only);
     /* Note for save_live_pending:
      * - res_precopy_only is for data which must be migrated in precopy phase
      *     or in stopped state, in other words - before target vm start
@@ -61,8 +56,18 @@ typedef struct SaveVMHandlers {
      * Sum of res_postcopy_only, res_compatible and res_postcopy_only is the
      * whole amount of pending data.
      */
-
-
+    /* This estimates the remaining data to transfer */
+    void (*state_pending_estimate)(void *opaque,
+                                   uint64_t threshold_size,
+                                   uint64_t *res_precopy_only,
+                                   uint64_t *res_compatible,
+                                   uint64_t *res_postcopy_only);
+    /* This calculate the exact remaining data to transfer */
+    void (*state_pending_exact)(void *opaque,
+                                uint64_t threshold_size,
+                                uint64_t *res_precopy_only,
+                                uint64_t *res_compatible,
+                                uint64_t *res_postcopy_only);
     LoadStateHandler *load_state;
     int (*load_setup)(QEMUFile *f, void *opaque);
     int (*load_cleanup)(void *opaque);
diff --git a/migration/savevm.h b/migration/savevm.h
index 524cf12f25..5d2cff4411 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,10 +40,14 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending(uint64_t max_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only);
+void qemu_savevm_state_pending_exact(uint64_t threshold_size,
+                                     uint64_t *res_precopy_only,
+                                     uint64_t *res_compatible,
+                                     uint64_t *res_postcopy_only);
+void qemu_savevm_state_pending_estimate(uint64_t thershold_size,
+                                        uint64_t *res_precopy_only,
+                                        uint64_t *res_compatible,
+                                        uint64_t *res_postcopy_only);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
 int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index a553a1e850..8f573ebb10 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,10 +182,10 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_save_pending(void *opaque, uint64_t max_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+static void cmma_state_pending(void *opaque, uint64_t max_size,
+                               uint64_t *res_precopy_only,
+                               uint64_t *res_compatible,
+                               uint64_t *res_postcopy_only)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
@@ -371,7 +371,8 @@ static SaveVMHandlers savevm_s390_stattrib_handlers = {
     .save_setup = cmma_save_setup,
     .save_live_iterate = cmma_save_iterate,
     .save_live_complete_precopy = cmma_save_complete,
-    .save_live_pending = cmma_save_pending,
+    .state_pending_exact = cmma_state_pending,
+    .state_pending_estimate = cmma_state_pending,
     .save_cleanup = cmma_save_cleanup,
     .load_state = cmma_load,
     .is_active = cmma_active,
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index b2125c7607..c49ca466d4 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,11 +456,11 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+static void vfio_state_pending(void *opaque,
+                               uint64_t threshold_size,
+                               uint64_t *res_precopy_only,
+                               uint64_t *res_compatible,
+                               uint64_t *res_postcopy_only)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -473,7 +473,7 @@ static void vfio_save_pending(void *opaque,
 
     *res_precopy_only += migration->pending_bytes;
 
-    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
+    trace_vfio_state_pending(vbasedev->name, *res_precopy_only,
                             *res_postcopy_only, *res_compatible);
 }
 
@@ -515,9 +515,9 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     }
 
     /*
-     * Reset pending_bytes as .save_live_pending is not called during savevm or
-     * snapshot case, in such case vfio_update_pending() at the start of this
-     * function updates pending_bytes.
+     * Reset pending_bytes as state_pending* are not called during
+     * savevm or snapshot case, in such case vfio_update_pending() at
+     * the start of this function updates pending_bytes.
      */
     migration->pending_bytes = 0;
     trace_vfio_save_iterate(vbasedev->name, data_size);
@@ -685,7 +685,8 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
 static SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
-    .save_live_pending = vfio_save_pending,
+    .state_pending_exact = vfio_state_pending,
+    .state_pending_estimate = vfio_state_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
     .save_state = vfio_save_state,
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index c27ef9b033..6fac9fb34f 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -762,11 +762,11 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_save_pending(void *opaque,
-                                      uint64_t max_size,
-                                      uint64_t *res_precopy_only,
-                                      uint64_t *res_compatible,
-                                      uint64_t *res_postcopy_only)
+static void dirty_bitmap_state_pending(void *opaque,
+                                       uint64_t max_size,
+                                       uint64_t *res_precopy_only,
+                                       uint64_t *res_compatible,
+                                       uint64_t *res_postcopy_only)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
@@ -784,7 +784,7 @@ static void dirty_bitmap_save_pending(void *opaque,
 
     qemu_mutex_unlock_iothread();
 
-    trace_dirty_bitmap_save_pending(pending, max_size);
+    trace_dirty_bitmap_state_pending(pending);
 
     *res_postcopy_only += pending;
 }
@@ -1253,7 +1253,8 @@ static SaveVMHandlers savevm_dirty_bitmap_handlers = {
     .save_live_complete_postcopy = dirty_bitmap_save_complete,
     .save_live_complete_precopy = dirty_bitmap_save_complete,
     .has_postcopy = dirty_bitmap_has_postcopy,
-    .save_live_pending = dirty_bitmap_save_pending,
+    .state_pending_exact = dirty_bitmap_state_pending,
+    .state_pending_estimate = dirty_bitmap_state_pending,
     .save_live_iterate = dirty_bitmap_save_iterate,
     .is_active_iterate = dirty_bitmap_is_active_iterate,
     .load_state = dirty_bitmap_load,
diff --git a/migration/block.c b/migration/block.c
index 47852b8d58..544e74e9c5 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,10 +863,10 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_save_pending(void *opaque, uint64_t max_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+static void block_state_pending(void *opaque, uint64_t max_size,
+                                uint64_t *res_precopy_only,
+                                uint64_t *res_compatible,
+                                uint64_t *res_postcopy_only)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
@@ -885,7 +885,7 @@ static void block_save_pending(void *opaque, uint64_t max_size,
         pending = BLK_MIG_BLOCK_SIZE;
     }
 
-    trace_migration_block_save_pending(pending);
+    trace_migration_block_state_pending(pending);
     /* We don't do postcopy */
     *res_precopy_only += pending;
 }
@@ -1020,7 +1020,8 @@ static SaveVMHandlers savevm_block_handlers = {
     .save_setup = block_save_setup,
     .save_live_iterate = block_save_iterate,
     .save_live_complete_precopy = block_save_complete,
-    .save_live_pending = block_save_pending,
+    .state_pending_exact = block_state_pending,
+    .state_pending_estimate = block_state_pending,
     .load_state = block_load,
     .save_cleanup = block_migration_cleanup,
     .is_active = block_is_active,
diff --git a/migration/migration.c b/migration/migration.c
index 76524cc56e..e7b4b94348 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3748,15 +3748,23 @@ typedef enum {
  */
 static MigIterateState migration_iteration_run(MigrationState *s)
 {
-    uint64_t pending_size, pend_pre, pend_compat, pend_post;
+    uint64_t pend_pre, pend_compat, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending(s->threshold_size, &pend_pre,
-                              &pend_compat, &pend_post);
-    pending_size = pend_pre + pend_compat + pend_post;
+    qemu_savevm_state_pending_estimate(s->threshold_size, &pend_pre,
+                                       &pend_compat, &pend_post);
+    uint64_t pending_size = pend_pre + pend_compat + pend_post;
 
-    trace_migrate_pending(pending_size, s->threshold_size,
-                          pend_pre, pend_compat, pend_post);
+    trace_migrate_pending_estimate(pending_size, s->threshold_size,
+                                   pend_pre, pend_compat, pend_post);
+
+    if (pend_pre + pend_compat <= s->threshold_size) {
+        qemu_savevm_state_pending_exact(s->threshold_size, &pend_pre,
+                                        &pend_compat, &pend_post);
+        pending_size = pend_pre + pend_compat + pend_post;
+        trace_migrate_pending_exact(pending_size, s->threshold_size,
+                                    pend_pre, pend_compat, pend_post);
+    }
 
     if (pending_size && pending_size >= s->threshold_size) {
         /* Still a significant amount to transfer */
diff --git a/migration/ram.c b/migration/ram.c
index 389739f162..56ff9cd29d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3409,19 +3409,35 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_save_pending(void *opaque, uint64_t max_size,
-                             uint64_t *res_precopy_only,
-                             uint64_t *res_compatible,
-                             uint64_t *res_postcopy_only)
+static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
+                                       uint64_t *res_precopy_only,
+                                       uint64_t *res_compatible,
+                                       uint64_t *res_postcopy_only)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
-    uint64_t remaining_size;
 
-    remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
+    uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
 
-    if (!migration_in_postcopy() &&
-        remaining_size < max_size) {
+    if (migrate_postcopy_ram()) {
+        /* We can do postcopy, and all the data is postcopiable */
+        *res_postcopy_only += remaining_size;
+    } else {
+        *res_precopy_only += remaining_size;
+    }
+}
+
+static void ram_state_pending_exact(void *opaque, uint64_t max_size,
+                                    uint64_t *res_precopy_only,
+                                    uint64_t *res_compatible,
+                                    uint64_t *res_postcopy_only)
+{
+    RAMState **temp = opaque;
+    RAMState *rs = *temp;
+
+    uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
+
+    if (!migration_in_postcopy()) {
         qemu_mutex_lock_iothread();
         WITH_RCU_READ_LOCK_GUARD() {
             migration_bitmap_sync_precopy(rs);
@@ -4577,7 +4593,8 @@ static SaveVMHandlers savevm_ram_handlers = {
     .save_live_complete_postcopy = ram_save_complete,
     .save_live_complete_precopy = ram_save_complete,
     .has_postcopy = ram_has_postcopy,
-    .save_live_pending = ram_save_pending,
+    .state_pending_exact = ram_state_pending_exact,
+    .state_pending_estimate = ram_state_pending_estimate,
     .load_state = ram_load,
     .save_cleanup = ram_save_cleanup,
     .load_setup = ram_load_setup,
diff --git a/migration/savevm.c b/migration/savevm.c
index 5e4bccb966..7f9f770c1e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1472,10 +1472,10 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending(uint64_t threshold_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
+                                        uint64_t *res_precopy_only,
+                                        uint64_t *res_compatible,
+                                        uint64_t *res_postcopy_only)
 {
     SaveStateEntry *se;
 
@@ -1485,7 +1485,7 @@ void qemu_savevm_state_pending(uint64_t threshold_size,
 
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-        if (!se->ops || !se->ops->save_live_pending) {
+        if (!se->ops || !se->ops->state_pending_exact) {
             continue;
         }
         if (se->ops->is_active) {
@@ -1493,9 +1493,35 @@ void qemu_savevm_state_pending(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->save_live_pending(se->opaque, threshold_size,
-                                   res_precopy_only, res_compatible,
-                                   res_postcopy_only);
+        se->ops->state_pending_exact(se->opaque, threshold_size,
+                                     res_precopy_only, res_compatible,
+                                     res_postcopy_only);
+    }
+}
+
+void qemu_savevm_state_pending_exact(uint64_t threshold_size,
+                                     uint64_t *res_precopy_only,
+                                     uint64_t *res_compatible,
+                                     uint64_t *res_postcopy_only)
+{
+    SaveStateEntry *se;
+
+    *res_precopy_only = 0;
+    *res_compatible = 0;
+    *res_postcopy_only = 0;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->ops || !se->ops->state_pending_estimate) {
+            continue;
+        }
+        if (se->ops->is_active) {
+            if (!se->ops->is_active(se->opaque)) {
+                continue;
+            }
+        }
+        se->ops->state_pending_estimate(se->opaque, threshold_size,
+                                        res_precopy_only, res_compatible,
+                                        res_postcopy_only);
     }
 }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9e00..52de1c84f8 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -157,7 +157,7 @@ vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
+vfio_state_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
diff --git a/migration/trace-events b/migration/trace-events
index 57003edcbd..adb680b0e6 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -150,7 +150,8 @@ migrate_fd_cleanup(void) ""
 migrate_fd_error(const char *error_desc) "error=%s"
 migrate_fd_cancel(void) ""
 migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
-migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_exact(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "exact pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_estimate(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "estimate pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
@@ -330,7 +331,7 @@ send_bitmap_bits(uint32_t flags, uint64_t start_sector, uint32_t nr_sectors, uin
 dirty_bitmap_save_iterate(int in_postcopy) "in postcopy: %d"
 dirty_bitmap_save_complete_enter(void) ""
 dirty_bitmap_save_complete_finish(void) ""
-dirty_bitmap_save_pending(uint64_t pending, uint64_t max_size) "pending %" PRIu64 " max: %" PRIu64
+dirty_bitmap_state_pending(uint64_t pending) "pending %" PRIu64
 dirty_bitmap_load_complete(void) ""
 dirty_bitmap_load_bits_enter(uint64_t first_sector, uint32_t nr_sectors) "chunk: %" PRIu64 " %" PRIu32
 dirty_bitmap_load_bits_zeroes(void) ""
@@ -355,7 +356,7 @@ migration_block_save_device_dirty(int64_t sector) "Error reading sector %" PRId6
 migration_block_flush_blks(const char *action, int submitted, int read_done, int transferred) "%s submitted %d read_done %d transferred %d"
 migration_block_save(const char *mig_stage, int submitted, int transferred) "Enter save live %s submitted %d transferred %d"
 migration_block_save_complete(void) "Block migration completed"
-migration_block_save_pending(uint64_t pending) "Enter save live pending  %" PRIu64
+migration_block_state_pending(uint64_t pending) "Enter save live pending  %" PRIu64
 
 # page_cache.c
 migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64
-- 
2.39.1


