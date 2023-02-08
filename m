Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B8D68F03A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkxA-0003it-Fj; Wed, 08 Feb 2023 08:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkx7-0003hY-AL
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkx5-0003Pq-99
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675864654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHvowYCkKjPZTg+7gR6Av4/rgY18SqZGkM8Kg4Y0DOY=;
 b=XEB1OPWOARs/Lr9Q4a9nrmV7RarWXipR0+L58yAI+TAS67xfb4j9ZIEiwLp8qv0e4YMqQT
 6pfBne/8mf8zuqZ/bm27WFPdgO4s2yi9o/s1raJtEu8Zw1VMttLoF7VFaHfD65lSj1+H1M
 HTSTZzgb3/lEGc/Yq/HM8oWyeOCUCVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-tuGRkqRBN5qY0Wf2iXcQAA-1; Wed, 08 Feb 2023 08:57:31 -0500
X-MC-Unique: tuGRkqRBN5qY0Wf2iXcQAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 442D1823DE7;
 Wed,  8 Feb 2023 13:57:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F07A51121314;
 Wed,  8 Feb 2023 13:57:27 +0000 (UTC)
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
Subject: [PATCH 2/3] migration: Remove unused res_compatible
Date: Wed,  8 Feb 2023 14:57:18 +0100
Message-Id: <20230208135719.17864-3-quintela@redhat.com>
In-Reply-To: <20230208135719.17864-1-quintela@redhat.com>
References: <20230208135719.17864-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

Nothing assigns to it after previous commit.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   |  7 ++-----
 migration/savevm.h             |  2 --
 hw/s390x/s390-stattrib.c       |  1 -
 hw/vfio/migration.c            |  3 +--
 migration/block-dirty-bitmap.c |  1 -
 migration/block.c              |  1 -
 migration/migration.c          | 18 ++++++++----------
 migration/ram.c                |  2 --
 migration/savevm.c             |  8 ++------
 hw/vfio/trace-events           |  2 +-
 migration/trace-events         |  4 ++--
 11 files changed, 16 insertions(+), 33 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index b91a0cdbf8..a958a92a0f 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -49,22 +49,19 @@ typedef struct SaveVMHandlers {
     /* Note for save_live_pending:
      * - res_precopy_only is for data which must be migrated in precopy phase
      *     or in stopped state, in other words - before target vm start
-     * - res_compatible is for data which may be migrated in any phase
      * - res_postcopy_only is for data which must be migrated in postcopy phase
      *     or in stopped state, in other words - after source vm stop
      *
-     * Sum of res_postcopy_only, res_compatible and res_postcopy_only is the
-     * whole amount of pending data.
+     * Sum of res_postcopy_only and res_postcopy_only is the whole
+     * amount of pending data.
      */
     /* This estimates the remaining data to transfer */
     void (*state_pending_estimate)(void *opaque,
                                    uint64_t *res_precopy_only,
-                                   uint64_t *res_compatible,
                                    uint64_t *res_postcopy_only);
     /* This calculate the exact remaining data to transfer */
     void (*state_pending_exact)(void *opaque,
                                 uint64_t *res_precopy_only,
-                                uint64_t *res_compatible,
                                 uint64_t *res_postcopy_only);
     LoadStateHandler *load_state;
     int (*load_setup)(QEMUFile *f, void *opaque);
diff --git a/migration/savevm.h b/migration/savevm.h
index b1901e68d5..bd625a644b 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -41,10 +41,8 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
 void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_compatible,
                                      uint64_t *res_postcopy_only);
 void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_compatible,
                                         uint64_t *res_postcopy_only);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 3e32002eab..c7ae9184ab 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -184,7 +184,6 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
 
 static void cmma_state_pending(void *opaque,
                                uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index b3318f0f20..fb0dd9571d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -458,7 +458,6 @@ static void vfio_save_cleanup(void *opaque)
 
 static void vfio_state_pending(void *opaque,
                                uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
 {
     VFIODevice *vbasedev = opaque;
@@ -473,7 +472,7 @@ static void vfio_state_pending(void *opaque,
     *res_precopy_only += migration->pending_bytes;
 
     trace_vfio_state_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only, *res_compatible);
+                            *res_postcopy_only);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5a621419d3..9c6655e11a 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -764,7 +764,6 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 
 static void dirty_bitmap_state_pending(void *opaque,
                                        uint64_t *res_precopy_only,
-                                       uint64_t *res_compatible,
                                        uint64_t *res_postcopy_only)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
diff --git a/migration/block.c b/migration/block.c
index 29f69025af..99d149904c 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -865,7 +865,6 @@ static int block_save_complete(QEMUFile *f, void *opaque)
 
 static void block_state_pending(void *opaque,
                                 uint64_t *res_precopy_only,
-                                uint64_t *res_compatible,
                                 uint64_t *res_postcopy_only)
 {
     /* Estimate pending number of bytes to send */
diff --git a/migration/migration.c b/migration/migration.c
index 7a14aa98d8..b74fb360df 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3820,20 +3820,18 @@ typedef enum {
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
 
     if (!pending_size || pending_size < s->threshold_size) {
diff --git a/migration/ram.c b/migration/ram.c
index 85ccbf88ad..abd960659c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3437,7 +3437,6 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
 
 static void ram_state_pending_estimate(void *opaque,
                                        uint64_t *res_precopy_only,
-                                       uint64_t *res_compatible,
                                        uint64_t *res_postcopy_only)
 {
     RAMState **temp = opaque;
@@ -3455,7 +3454,6 @@ static void ram_state_pending_estimate(void *opaque,
 
 static void ram_state_pending_exact(void *opaque,
                                     uint64_t *res_precopy_only,
-                                    uint64_t *res_compatible,
                                     uint64_t *res_postcopy_only)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index e9cf4999ad..2943b8301b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1542,13 +1542,11 @@ flush:
  * for units that can't do postcopy.
  */
 void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
-                                        uint64_t *res_compatible,
                                         uint64_t *res_postcopy_only)
 {
     SaveStateEntry *se;
 
     *res_precopy_only = 0;
-    *res_compatible = 0;
     *res_postcopy_only = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
@@ -1561,19 +1559,17 @@ void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
             }
         }
         se->ops->state_pending_exact(se->opaque,
-                                     res_precopy_only, res_compatible,
+                                     res_precopy_only,
                                      res_postcopy_only);
     }
 }
 
 void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_compatible,
                                      uint64_t *res_postcopy_only)
 {
     SaveStateEntry *se;
 
     *res_precopy_only = 0;
-    *res_compatible = 0;
     *res_postcopy_only = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
@@ -1586,7 +1582,7 @@ void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
             }
         }
         se->ops->state_pending_estimate(se->opaque,
-                                        res_precopy_only, res_compatible,
+                                        res_precopy_only,
                                         res_postcopy_only);
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


