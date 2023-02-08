Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B6168F03E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkxD-0003k1-07; Wed, 08 Feb 2023 08:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkxB-0003jS-9F
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:57:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkx9-0003Sq-AX
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675864658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4kyeJLZ0piNo6RfAWUmSt0CYtIk+piljF+i/dXamY4=;
 b=fSYYV73sIIcEF3myeEgjP2aYZziUN7/9d2/Lur5SaFMwov8xZszbGbxeUbTJq/eJ/K/XCo
 ICKuYNGmuk5PBgX5IiKyQkT4Ks7s/7rI0QDI96cQbD7/zbSFdFgrSz2J8lTBgBbYYMkATQ
 6j66ZoVnmqFMH10ou/tg0Onj3fg9A6I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-_bElZcrwMaOV3fs94FZYJA-1; Wed, 08 Feb 2023 08:57:35 -0500
X-MC-Unique: _bElZcrwMaOV3fs94FZYJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 968641C05ACD;
 Wed,  8 Feb 2023 13:57:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 911811121314;
 Wed,  8 Feb 2023 13:57:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/3] migration: Remove _only suffix for res_postcopy/precopy
Date: Wed,  8 Feb 2023 14:57:19 +0100
Message-Id: <20230208135719.17864-4-quintela@redhat.com>
In-Reply-To: <20230208135719.17864-1-quintela@redhat.com>
References: <20230208135719.17864-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Once that res_compatible is removed, they don't make sense anymore.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   | 18 ++++++++----------
 migration/savevm.h             |  8 ++++----
 hw/s390x/s390-stattrib.c       |  7 +++----
 hw/vfio/migration.c            | 10 ++++------
 migration/block-dirty-bitmap.c |  6 +++---
 migration/block.c              |  7 +++----
 migration/ram.c                | 18 ++++++++----------
 migration/savevm.c             | 24 ++++++++++--------------
 8 files changed, 43 insertions(+), 55 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index a958a92a0f..4a4a6d7174 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -47,22 +47,20 @@ typedef struct SaveVMHandlers {
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
     /* Note for save_live_pending:
-     * - res_precopy_only is for data which must be migrated in precopy phase
+     * - res_precopy is for data which must be migrated in precopy phase
      *     or in stopped state, in other words - before target vm start
-     * - res_postcopy_only is for data which must be migrated in postcopy phase
+     * - res_postcopy is for data which must be migrated in postcopy phase
      *     or in stopped state, in other words - after source vm stop
      *
-     * Sum of res_postcopy_only and res_postcopy_only is the whole
-     * amount of pending data.
+     * Sum of res_postcopy and res_postcopy is the whole amount of
+     * pending data.
      */
     /* This estimates the remaining data to transfer */
-    void (*state_pending_estimate)(void *opaque,
-                                   uint64_t *res_precopy_only,
-                                   uint64_t *res_postcopy_only);
+    void (*state_pending_estimate)(void *opaque, uint64_t *res_precopy,
+                                   uint64_t *res_postcopy);
     /* This calculate the exact remaining data to transfer */
-    void (*state_pending_exact)(void *opaque,
-                                uint64_t *res_precopy_only,
-                                uint64_t *res_postcopy_only);
+    void (*state_pending_exact)(void *opaque, uint64_t *res_precopy,
+                                uint64_t *res_postcopy);
     LoadStateHandler *load_state;
     int (*load_setup)(QEMUFile *f, void *opaque);
     int (*load_cleanup)(void *opaque);
diff --git a/migration/savevm.h b/migration/savevm.h
index bd625a644b..24f2d2a28b 100644
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
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
+                                     uint64_t *res_postcopy);
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
+                                        uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
 int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index c7ae9184ab..dfb95eb20c 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,16 +182,15 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_state_pending(void *opaque,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_postcopy_only)
+static void cmma_state_pending(void *opaque, uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
     long long res = sac->get_dirtycount(sas);
 
     if (res >= 0) {
-        *res_precopy_only += res;
+        *res_precopy += res;
     }
 }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index fb0dd9571d..d8c913acde 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,9 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_state_pending(void *opaque,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_postcopy_only)
+static void vfio_state_pending(void *opaque, uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -469,10 +468,9 @@ static void vfio_state_pending(void *opaque,
         return;
     }
 
-    *res_precopy_only += migration->pending_bytes;
+    *res_precopy += migration->pending_bytes;
 
-    trace_vfio_state_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only);
+    trace_vfio_state_pending(vbasedev->name, *res_precopy, *res_postcopy);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9c6655e11a..793bf4347d 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -763,8 +763,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void dirty_bitmap_state_pending(void *opaque,
-                                       uint64_t *res_precopy_only,
-                                       uint64_t *res_postcopy_only)
+                                       uint64_t *res_precopy,
+                                       uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
@@ -784,7 +784,7 @@ static void dirty_bitmap_state_pending(void *opaque,
 
     trace_dirty_bitmap_state_pending(pending);
 
-    *res_postcopy_only += pending;
+    *res_postcopy += pending;
 }
 
 /* First occurrence of this bitmap. It should be created if doesn't exist */
diff --git a/migration/block.c b/migration/block.c
index 99d149904c..21bcf560e0 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,9 +863,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque,
-                                uint64_t *res_precopy_only,
-                                uint64_t *res_postcopy_only)
+static void block_state_pending(void *opaque, uint64_t *res_precopy,
+                                uint64_t *res_postcopy)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
@@ -886,7 +885,7 @@ static void block_state_pending(void *opaque,
 
     trace_migration_block_state_pending(pending);
     /* We don't do postcopy */
-    *res_precopy_only += pending;
+    *res_precopy += pending;
 }
 
 static int block_load(QEMUFile *f, void *opaque, int version_id)
diff --git a/migration/ram.c b/migration/ram.c
index abd960659c..add5c5edfc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3435,9 +3435,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque,
-                                       uint64_t *res_precopy_only,
-                                       uint64_t *res_postcopy_only)
+static void ram_state_pending_estimate(void *opaque, uint64_t *res_precopy,
+                                       uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3446,15 +3445,14 @@ static void ram_state_pending_estimate(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_postcopy_only += remaining_size;
+        *res_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *res_precopy += remaining_size;
     }
 }
 
-static void ram_state_pending_exact(void *opaque,
-                                    uint64_t *res_precopy_only,
-                                    uint64_t *res_postcopy_only)
+static void ram_state_pending_exact(void *opaque, uint64_t *res_precopy,
+                                    uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3472,9 +3470,9 @@ static void ram_state_pending_exact(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_postcopy_only += remaining_size;
+        *res_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *res_precopy += remaining_size;
     }
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 2943b8301b..9d3d971a50 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1541,13 +1541,13 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
+                                        uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_postcopy_only = 0;
+    *res_precopy = 0;
+    *res_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_exact) {
@@ -1558,19 +1558,17 @@ void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque,
-                                     res_precopy_only,
-                                     res_postcopy_only);
+        se->ops->state_pending_exact(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
+                                     uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_postcopy_only = 0;
+    *res_precopy = 0;
+    *res_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_estimate) {
@@ -1581,9 +1579,7 @@ void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque,
-                                        res_precopy_only,
-                                        res_postcopy_only);
+        se->ops->state_pending_estimate(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-- 
2.39.1


