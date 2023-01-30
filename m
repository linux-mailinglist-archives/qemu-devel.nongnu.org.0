Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5286806E3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPBU-0007Tm-QB; Mon, 30 Jan 2023 03:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPBS-0007SH-IB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:06:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPBP-0001k9-Pq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675065991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eWeT3xfbFlbzNACmTdGovKL/sOatcR1HKGVEFm0pv8M=;
 b=iJsYZONFcKJlRbHwpnsO6MY6zx1vn2SzUio058xM/GGVoc82SJePBHGW1QtLhWpKJF5eZH
 iTl0Nio5U7ZkyNxkaFMesfHBo8F9xIaS8OyMUBg3csuhg73TH9ZYJQSMLsQicB0Y4Iztiy
 mtfC55l84EcMp7ChoNI+zOxucOt9cXU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-XMsCB3mfNTaUdXR1PS7Qgg-1; Mon, 30 Jan 2023 03:06:20 -0500
X-MC-Unique: XMsCB3mfNTaUdXR1PS7Qgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E86AA3C0E453;
 Mon, 30 Jan 2023 08:06:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B49DDC15BAD;
 Mon, 30 Jan 2023 08:06:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Fam Zheng <fam@euphon.net>,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Klaus Jensen <its@irrelevant.dk>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <huth@tuxfamily.org>,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 virtio-fs@redhat.com
Subject: [PATCH v3] migration: Remove res_compatible parameter
Date: Mon, 30 Jan 2023 09:06:08 +0100
Message-Id: <20230130080608.2100-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

It was only used for RAM, and in that case, it means that this amount
of data was sent for memory.  Just delete the field in all callers.

[Rest of the pages on the vfio series are already on my previous pull request]

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   | 27 ++++++++++++---------------
 migration/savevm.h             | 10 ++++------
 hw/s390x/s390-stattrib.c       |  8 +++-----
 hw/vfio/migration.c            | 10 ++++------
 migration/block-dirty-bitmap.c |  7 +++----
 migration/block.c              |  8 +++-----
 migration/migration.c          | 18 ++++++++----------
 migration/ram.c                | 20 ++++++++------------
 migration/savevm.c             | 28 ++++++++++------------------
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  4 ++--
 11 files changed, 58 insertions(+), 84 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index b91a0cdbf8..5ef6b903ed 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -47,25 +47,22 @@ typedef struct SaveVMHandlers {
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
     /* Note for save_live_pending:
-     * - res_precopy_only is for data which must be migrated in precopy phase
-     *     or in stopped state, in other words - before target vm start
-     * - res_compatible is for data which may be migrated in any phase
-     * - res_postcopy_only is for data which must be migrated in postcopy phase
-     *     or in stopped state, in other words - after source vm stop
+     * - res_precopy is for data which must be migrated in precopy
+     *     phase or in stopped state, in other words - before target
+     *     vm start
+     * - res_postcopy is for data which must be migrated in postcopy
+     *     phase or in stopped state, in other words - after source vm
+     *     stop
      *
-     * Sum of res_postcopy_only, res_compatible and res_postcopy_only is the
-     * whole amount of pending data.
+     * Sum of res_precopy and res_postcopy is the whole amount of
+     * pending data.
      */
     /* This estimates the remaining data to transfer */
-    void (*state_pending_estimate)(void *opaque,
-                                   uint64_t *res_precopy_only,
-                                   uint64_t *res_compatible,
-                                   uint64_t *res_postcopy_only);
+    void (*state_pending_estimate)(void *opaque, uint64_t *res_precopy,
+                                   uint64_t *res_postcopy);
     /* This calculate the exact remaining data to transfer */
-    void (*state_pending_exact)(void *opaque,
-                                uint64_t *res_precopy_only,
-                                uint64_t *res_compatible,
-                                uint64_t *res_postcopy_only);
+    void (*state_pending_exact)(void *opaque, uint64_t *res_precopy,
+                                uint64_t *res_postcopy);
     LoadStateHandler *load_state;
     int (*load_setup)(QEMUFile *f, void *opaque);
     int (*load_cleanup)(void *opaque);
diff --git a/migration/savevm.h b/migration/savevm.h
index b1901e68d5..3f51588341 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,12 +40,10 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_compatible,
-                                     uint64_t *res_postcopy_only);
-void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_compatible,
-                                        uint64_t *res_postcopy_only);
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
+                                     uint64_t *res_postcopy);
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy, 
+                                        uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
 int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index f1ee2c65bb..b5f8f6d1b9 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,17 +182,15 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_state_pending(void * opaque,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+static void cmma_state_pending(void * opaque, uint64_t *res_precopy,
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
index b3318f0f20..d0f7459607 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -457,9 +457,8 @@ static void vfio_save_cleanup(void *opaque)
 }
 
 static void vfio_state_pending(void *opaque,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+                               uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -470,10 +469,9 @@ static void vfio_state_pending(void *opaque,
         return;
     }
 
-    *res_precopy_only += migration->pending_bytes;
+    *res_precopy += migration->pending_bytes;
 
-    trace_vfio_state_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only, *res_compatible);
+    trace_vfio_state_pending(vbasedev->name, *res_precopy, *res_postcopy);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5a621419d3..793bf4347d 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -763,9 +763,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void dirty_bitmap_state_pending(void *opaque,
-                                       uint64_t *res_precopy_only,
-                                       uint64_t *res_compatible,
-                                       uint64_t *res_postcopy_only)
+                                       uint64_t *res_precopy,
+                                       uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
@@ -785,7 +784,7 @@ static void dirty_bitmap_state_pending(void *opaque,
 
     trace_dirty_bitmap_state_pending(pending);
 
-    *res_postcopy_only += pending;
+    *res_postcopy += pending;
 }
 
 /* First occurrence of this bitmap. It should be created if doesn't exist */
diff --git a/migration/block.c b/migration/block.c
index 29f69025af..21bcf560e0 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,10 +863,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque,
-                                uint64_t *res_precopy_only,
-                                uint64_t *res_compatible,
-                                uint64_t *res_postcopy_only)
+static void block_state_pending(void *opaque, uint64_t *res_precopy,
+                                uint64_t *res_postcopy)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
@@ -887,7 +885,7 @@ static void block_state_pending(void *opaque,
 
     trace_migration_block_state_pending(pending);
     /* We don't do postcopy */
-    *res_precopy_only += pending;
+    *res_precopy += pending;
 }
 
 static int block_load(QEMUFile *f, void *opaque, int version_id)
diff --git a/migration/migration.c b/migration/migration.c
index 644c61e91d..79963983d3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3748,20 +3748,18 @@ typedef enum {
  */
 static MigIterateState migration_iteration_run(MigrationState *s)
 {
-    uint64_t pend_pre, pend_compat, pend_post;
+    uint64_t pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(&pend_pre, &pend_compat, &pend_post);
-    uint64_t pending_size = pend_pre + pend_compat + pend_post;
+    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
+    uint64_t pending_size = pend_pre + pend_post;
 
-    trace_migrate_pending_estimate(pending_size,
-                                   pend_pre, pend_compat, pend_post);
+    trace_migrate_pending_estimate(pending_size, pend_pre, pend_post);
 
-    if (pend_pre + pend_compat <= s->threshold_size) {
-        qemu_savevm_state_pending_exact(&pend_pre, &pend_compat, &pend_post);
-        pending_size = pend_pre + pend_compat + pend_post;
-        trace_migrate_pending_exact(pending_size,
-                                    pend_pre, pend_compat, pend_post);
+    if (pend_pre <= s->threshold_size) {
+        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
+        pending_size = pend_pre + pend_post;
+        trace_migrate_pending_exact(pending_size, pend_pre, pend_post);
     }
 
     if (pending_size < s->threshold_size) {
diff --git a/migration/ram.c b/migration/ram.c
index 885d7dbf23..779bebf648 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3409,10 +3409,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque,
-                                       uint64_t *res_precopy_only,
-                                       uint64_t *res_compatible,
-                                       uint64_t *res_postcopy_only)
+static void ram_state_pending_estimate(void *opaque, uint64_t *res_precopy,
+                                       uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3421,16 +3419,14 @@ static void ram_state_pending_estimate(void *opaque,
 
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
-                                    uint64_t *res_compatible,
-                                    uint64_t *res_postcopy_only)
+static void ram_state_pending_exact(void *opaque, uint64_t *res_precopy,
+                                    uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3448,9 +3444,9 @@ static void ram_state_pending_exact(void *opaque,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_compatible += remaining_size;
+        *res_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *res_precopy += remaining_size;
     }
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index e1caa3ea7c..3efdbcbcd7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1472,15 +1472,13 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_compatible,
-                                        uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
+                                        uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_compatible = 0;
-    *res_postcopy_only = 0;
+    *res_precopy = 0;
+    *res_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_exact) {
@@ -1491,21 +1489,17 @@ void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque,
-                                     res_precopy_only, res_compatible,
-                                     res_postcopy_only);
+        se->ops->state_pending_exact(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_compatible,
-                                     uint64_t *res_postcopy_only)
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
+                                     uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_compatible = 0;
-    *res_postcopy_only = 0;
+    *res_precopy = 0;
+    *res_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_estimate) {
@@ -1516,9 +1510,7 @@ void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque,
-                                        res_precopy_only, res_compatible,
-                                        res_postcopy_only);
+        se->ops->state_pending_estimate(se->opaque, res_precopy, res_postcopy);
     }
 }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 52de1c84f8..90a8aecb37 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -157,7 +157,7 @@ vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_state_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
+vfio_state_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
diff --git a/migration/trace-events b/migration/trace-events
index 67b65a70ff..422823b1db 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -150,8 +150,8 @@ migrate_fd_cleanup(void) ""
 migrate_fd_error(const char *error_desc) "error=%s"
 migrate_fd_cancel(void) ""
 migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
-migrate_pending_exact(uint64_t size, uint64_t pre, uint64_t compat, uint64_t post) "exact pending size %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
-migrate_pending_estimate(uint64_t size, uint64_t pre, uint64_t compat, uint64_t post) "estimate pending size %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_exact(uint64_t size, uint64_t pre, uint64_t post) "exact pending size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_estimate(uint64_t size, uint64_t pre, uint64_t post) "estimate pending size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
-- 
2.39.1


