Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF0964268E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 11:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p28Fj-0006hj-9p; Mon, 05 Dec 2022 04:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28FT-0006dt-AO
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:58:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1p28FR-0008Aq-AQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670234332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6XWOsHzVK+1xN5Bn4dqmNKOe+moJvckLNMR3xiKGq8=;
 b=PhU1DPPCSeO+xIPmH+BGZVvXiGMr/C5GJ6mzb01vOKBJce/lrYAHncxlwc8sEsgjfOU4RV
 QDBClpxxkMlVrvgCo5JebfEp6nLcs4UpxbdBv+oYUs252s+NkcUG8gs4qI/f9JuA0wLE+z
 XWNZeoSboCkYLTocNzgGnQVD4y149LY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-Yx8ZJmEVNZaI263buHngxQ-1; Mon, 05 Dec 2022 04:58:48 -0500
X-MC-Unique: Yx8ZJmEVNZaI263buHngxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADB32800186;
 Mon,  5 Dec 2022 09:58:47 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B8AF2166B29;
 Mon,  5 Dec 2022 09:58:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <huth@tuxfamily.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 virtio-fs@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, qemu-block@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Keith Busch <kbusch@kernel.org>, David Hildenbrand <david@redhat.com>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 47/51] migration: Remove res_compatible parameter
Date: Mon,  5 Dec 2022 10:52:24 +0100
Message-Id: <20221205095228.1314-48-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   | 20 ++++++++++----------
 migration/savevm.h             |  4 +---
 hw/s390x/s390-stattrib.c       |  6 ++----
 hw/vfio/migration.c            | 10 ++++------
 migration/block-dirty-bitmap.c |  7 +++----
 migration/block.c              |  7 +++----
 migration/migration.c          |  9 ++++-----
 migration/ram.c                |  8 +++-----
 migration/savevm.c             | 14 +++++---------
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  2 +-
 11 files changed, 37 insertions(+), 52 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index c1dcff0f90..1950fee6a8 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
     int (*save_setup)(QEMUFile *f, void *opaque);
     void (*save_live_pending)(QEMUFile *f, void *opaque,
                               uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only);
+                              uint64_t *rest_precopy,
+                              uint64_t *rest_postcopy);
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
 
 
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..9bd55c336c 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -41,9 +41,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
 void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only);
+                               uint64_t *res_precopy, uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
 int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 9eda1c3b2a..ee60b53da4 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -183,16 +183,14 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
 }
 
 static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+                              uint64_t *res_precopy, uint64_t *res_postcopy)
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
index c74453e0b5..d03681678d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -458,9 +458,8 @@ static void vfio_save_cleanup(void *opaque)
 
 static void vfio_save_pending(QEMUFile *f, void *opaque,
                               uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+                              uint64_t *res_precopy,
+                              uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -471,10 +470,9 @@ static void vfio_save_pending(QEMUFile *f, void *opaque,
         return;
     }
 
-    *res_precopy_only += migration->pending_bytes;
+    *res_precopy += migration->pending_bytes;
 
-    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only, *res_compatible);
+    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..dfea546330 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -763,9 +763,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 
 static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
                                       uint64_t max_size,
-                                      uint64_t *res_precopy_only,
-                                      uint64_t *res_compatible,
-                                      uint64_t *res_postcopy_only)
+                                      uint64_t *res_precopy,
+                                      uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
@@ -785,7 +784,7 @@ static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
 
     trace_dirty_bitmap_save_pending(pending, max_size);
 
-    *res_postcopy_only += pending;
+    *res_postcopy += pending;
 }
 
 /* First occurrence of this bitmap. It should be created if doesn't exist */
diff --git a/migration/block.c b/migration/block.c
index 4347da1526..593754c38c 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,9 +863,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+                               uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
@@ -886,7 +885,7 @@ static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
 
     trace_migration_block_save_pending(pending);
     /* We don't do postcopy */
-    *res_precopy_only += pending;
+    *res_precopy += pending;
 }
 
 static int block_load(QEMUFile *f, void *opaque, int version_id)
diff --git a/migration/migration.c b/migration/migration.c
index c3490c495d..6b8a6dd74e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3756,15 +3756,14 @@ typedef enum {
  */
 static MigIterateState migration_iteration_run(MigrationState *s)
 {
-    uint64_t pending_size, pend_pre, pend_compat, pend_post;
+    uint64_t pending_size, pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
     qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
-                              &pend_compat, &pend_post);
-    pending_size = pend_pre + pend_compat + pend_post;
+                              &pend_post);
+    pending_size = pend_pre + pend_post;
 
-    trace_migrate_pending(pending_size, s->threshold_size,
-                          pend_pre, pend_compat, pend_post);
+    trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
 
     if (pending_size && pending_size >= s->threshold_size) {
         /* Still a significant amount to transfer */
diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..640839dcee 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3393,9 +3393,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-                             uint64_t *res_precopy_only,
-                             uint64_t *res_compatible,
-                             uint64_t *res_postcopy_only)
+                             uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3415,9 +3413,9 @@ static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
 
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
index a0cdb714f7..4d02887f25 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1472,16 +1472,13 @@ flush:
  * for units that can't do postcopy.
  */
 void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+                               uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_compatible = 0;
-    *res_postcopy_only = 0;
-
+    *res_precopy = 0;
+    *res_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->save_live_pending) {
@@ -1493,8 +1490,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
             }
         }
         se->ops->save_live_pending(f, se->opaque, threshold_size,
-                                   res_precopy_only, res_compatible,
-                                   res_postcopy_only);
+                                   res_precopy, res_postcopy);
     }
 }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9e00..a21cbd2a56 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -157,7 +157,7 @@ vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
+vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
diff --git a/migration/trace-events b/migration/trace-events
index 57003edcbd..f2a873fd6c 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -150,7 +150,7 @@ migrate_fd_cleanup(void) ""
 migrate_fd_error(const char *error_desc) "error=%s"
 migrate_fd_cancel(void) ""
 migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
-migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
-- 
2.38.1


