Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1F698536
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:07:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSO30-0003nW-JU; Wed, 15 Feb 2023 15:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSO2y-0003gL-G6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSO2l-0006dA-SF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGzcMz/Xrwfz40/RuerjFlTOVeBvi5A+2byWQabuOxs=;
 b=U/ysRAjfwVHAIRXrBposozpN4j6iXAZiiTpcJ1FfoTN1I0Qyj/DxPmfCAdZ2pGdjYzCyHf
 J5KsLgNxMlINj8Bme4icARgLmNFQNA5jt/5XnmOHEJQ5QNDZDkThWJLfWQ6tBytljb4ioU
 JKL5lMNNUErAKvAKfAste2TOfHiQ7Pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-DePlCsAyNoaCKXxbMxEpnw-1; Wed, 15 Feb 2023 15:06:16 -0500
X-MC-Unique: DePlCsAyNoaCKXxbMxEpnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 935CB29AA2FB;
 Wed, 15 Feb 2023 20:06:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99A89C15BA0;
 Wed, 15 Feb 2023 20:06:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-s390x@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PULL 5/5] migration: Rename res_{postcopy,precopy}_only
Date: Wed, 15 Feb 2023 21:05:54 +0100
Message-Id: <20230215200554.1365-6-quintela@redhat.com>
In-Reply-To: <20230215200554.1365-1-quintela@redhat.com>
References: <20230215200554.1365-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Once that res_compatible is removed, they don't make sense anymore.
We remove the _only preffix.  And to make things clearer we rename
them to must_precopy and can_postcopy.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   | 27 +++++++++++++++------------
 migration/savevm.h             |  8 ++++----
 hw/s390x/s390-stattrib.c       |  7 +++----
 hw/vfio/migration.c            | 10 ++++------
 migration/block-dirty-bitmap.c |  6 +++---
 migration/block.c              |  7 +++----
 migration/migration.c          | 18 +++++++++---------
 migration/ram.c                | 18 ++++++++----------
 migration/savevm.c             | 24 ++++++++++--------------
 9 files changed, 59 insertions(+), 66 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index a958a92a0f..a8dfd8fefd 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -47,22 +47,25 @@ typedef struct SaveVMHandlers {
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
     /* Note for save_live_pending:
-     * - res_precopy_only is for data which must be migrated in precopy phase
-     *     or in stopped state, in other words - before target vm start
-     * - res_postcopy_only is for data which must be migrated in postcopy phase
-     *     or in stopped state, in other words - after source vm stop
+     * must_precopy:
+     * - must be migrated in precopy or in stopped state
+     * - i.e. must be migrated before target start
      *
-     * Sum of res_postcopy_only and res_postcopy_only is the whole
-     * amount of pending data.
+     * can_postcopy:
+     * - can migrate in postcopy or in stopped state
+     * - i.e. can migrate after target start
+     * - some can also be migrated during precopy (RAM)
+     * - some must be migrated after source stops (block-dirty-bitmap)
+     *
+     * Sum of can_postcopy and must_postcopy is the whole amount of
+     * pending data.
      */
     /* This estimates the remaining data to transfer */
-    void (*state_pending_estimate)(void *opaque,
-                                   uint64_t *res_precopy_only,
-                                   uint64_t *res_postcopy_only);
+    void (*state_pending_estimate)(void *opaque, uint64_t *must_precopy,
+                                   uint64_t *can_postcopy);
     /* This calculate the exact remaining data to transfer */
-    void (*state_pending_exact)(void *opaque,
-                                uint64_t *res_precopy_only,
-                                uint64_t *res_postcopy_only);
+    void (*state_pending_exact)(void *opaque, uint64_t *must_precopy,
+                                uint64_t *can_postcopy);
     LoadStateHandler *load_state;
     int (*load_setup)(QEMUFile *f, void *opaque);
     int (*load_cleanup)(void *opaque);
diff --git a/migration/savevm.h b/migration/savevm.h
index bd625a644b..fb636735f0 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,10 +40,10 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_postcopy_only);
-void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_postcopy_only);
+void qemu_savevm_state_pending_exact(uint64_t *must_precopy,
+                                     uint64_t *can_postcopy);
+void qemu_savevm_state_pending_estimate(uint64_t *must_precopy,
+                                        uint64_t *can_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
 int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index c7ae9184ab..aed919ad7d 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,16 +182,15 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_state_pending(void *opaque,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_postcopy_only)
+static void cmma_state_pending(void *opaque, uint64_t *must_precopy,
+                               uint64_t *can_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
     long long res = sac->get_dirtycount(sas);
 
     if (res >= 0) {
-        *res_precopy_only += res;
+        *must_precopy += res;
     }
 }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index fb0dd9571d..83d2d44080 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,9 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_state_pending(void *opaque,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_postcopy_only)
+static void vfio_state_pending(void *opaque, uint64_t *must_precopy,
+                               uint64_t *can_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -469,10 +468,9 @@ static void vfio_state_pending(void *opaque,
         return;
     }
 
-    *res_precopy_only += migration->pending_bytes;
+    *must_precopy += migration->pending_bytes;
 
-    trace_vfio_state_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only);
+    trace_vfio_state_pending(vbasedev->name, *must_precopy, *can_postcopy);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9c6655e11a..fe73aa94b1 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -763,8 +763,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void dirty_bitmap_state_pending(void *opaque,
-                                       uint64_t *res_precopy_only,
-                                       uint64_t *res_postcopy_only)
+                                       uint64_t *must_precopy,
+                                       uint64_t *can_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
@@ -784,7 +784,7 @@ static void dirty_bitmap_state_pending(void *opaque,
 
     trace_dirty_bitmap_state_pending(pending);
 
-    *res_postcopy_only += pending;
+    *can_postcopy += pending;
 }
 
 /* First occurrence of this bitmap. It should be created if doesn't exist */
diff --git a/migration/block.c b/migration/block.c
index 168ef89a82..426a25bb19 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -853,9 +853,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque,
-                                uint64_t *res_precopy_only,
-                                uint64_t *res_postcopy_only)
+static void block_state_pending(void *opaque, uint64_t *must_precopy,
+                                uint64_t *can_postcopy)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
@@ -876,7 +875,7 @@ static void block_state_pending(void *opaque,
 
     trace_migration_block_state_pending(pending);
     /* We don't do postcopy */
-    *res_precopy_only += pending;
+    *must_precopy += pending;
 }
 
 static int block_load(QEMUFile *f, void *opaque, int version_id)
diff --git a/migration/migration.c b/migration/migration.c
index 296f7fe768..ae2025d9d8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3863,18 +3863,18 @@ typedef enum {
  */
 static MigIterateState migration_iteration_run(MigrationState *s)
 {
-    uint64_t pend_pre, pend_post;
+    uint64_t must_precopy, can_postcopy;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
-    uint64_t pending_size = pend_pre + pend_post;
+    qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
+    uint64_t pending_size = must_precopy + can_postcopy;
 
-    trace_migrate_pending_estimate(pending_size, pend_pre, pend_post);
+    trace_migrate_pending_estimate(pending_size, must_precopy, can_postcopy);
 
-    if (pend_pre <= s->threshold_size) {
-        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
-        pending_size = pend_pre + pend_post;
-        trace_migrate_pending_exact(pending_size, pend_pre, pend_post);
+    if (must_precopy <= s->threshold_size) {
+        qemu_savevm_state_pending_exact(&must_precopy, &can_postcopy);
+        pending_size = must_precopy + can_postcopy;
+        trace_migrate_pending_exact(pending_size, must_precopy, can_postcopy);
     }
 
     if (!pending_size || pending_size < s->threshold_size) {
@@ -3884,7 +3884,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     }
 
     /* Still a significant amount to transfer */
-    if (!in_postcopy && pend_pre <= s->threshold_size &&
+    if (!in_postcopy && must_precopy <= s->threshold_size &&
         qatomic_read(&s->start_postcopy)) {
         if (postcopy_start(s)) {
             error_report("%s: postcopy failed to start", __func__);
diff --git a/migration/ram.c b/migration/ram.c
index 178f92a77f..96e8a19a58 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3489,9 +3489,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque,
-                                       uint64_t *res_precopy_only,
-                                       uint64_t *res_postcopy_only)
+static void ram_state_pending_estimate(void *opaque, uint64_t *must_precopy,
+                                       uint64_t *can_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3500,15 +3499,14 @@ static void ram_state_pending_estimate(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_postcopy_only += remaining_size;
+        *can_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *must_precopy += remaining_size;
     }
 }
 
-static void ram_state_pending_exact(void *opaque,
-                                    uint64_t *res_precopy_only,
-                                    uint64_t *res_postcopy_only)
+static void ram_state_pending_exact(void *opaque, uint64_t *must_precopy,
+                                    uint64_t *can_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3526,9 +3524,9 @@ static void ram_state_pending_exact(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_postcopy_only += remaining_size;
+        *can_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *must_precopy += remaining_size;
     }
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 80b7f1222a..aa54a67fda 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1541,13 +1541,13 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_estimate(uint64_t *must_precopy,
+                                        uint64_t *can_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_postcopy_only = 0;
+    *must_precopy = 0;
+    *can_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_estimate) {
@@ -1558,19 +1558,17 @@ void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque,
-                                        res_precopy_only,
-                                        res_postcopy_only);
+        se->ops->state_pending_estimate(se->opaque, must_precopy, can_postcopy);
     }
 }
 
-void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_exact(uint64_t *must_precopy,
+                                     uint64_t *can_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_postcopy_only = 0;
+    *must_precopy = 0;
+    *can_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_exact) {
@@ -1581,9 +1579,7 @@ void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque,
-                                     res_precopy_only,
-                                     res_postcopy_only);
+        se->ops->state_pending_exact(se->opaque, must_precopy, can_postcopy);
     }
 }
 
-- 
2.39.1


