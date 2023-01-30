Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592536806D8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:04:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMP8d-0001z7-3m; Mon, 30 Jan 2023 03:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8b-0001wf-8V
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMP8Z-00012D-5Y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675065813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=almn5ln2UxG/8cmBIYmY15hUzFRkqQExU/G1mVB7PlI=;
 b=BQuToY6W7b2NvDLCR0pH5e2H4HG/0NRsBy8b4iOQD1HcGlH9xhNA/iFbzAfNTVtfxNZzlE
 dfLE4usM++MffDq4fRLC1AG3YyX8lL2S0w8Sh+FrTWFkur9lttQj6r1LBmVNcFroFqd0u8
 d+0nid2gq0SII8cvXLCzKcwWciRF5EM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-7PrVOAVxO16_b6WE2Nzxxw-1; Mon, 30 Jan 2023 03:03:26 -0500
X-MC-Unique: 7PrVOAVxO16_b6WE2Nzxxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65792800B30;
 Mon, 30 Jan 2023 08:03:25 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81972492B01;
 Mon, 30 Jan 2023 08:03:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 4/5] migration: Remove unused threshold_size parameter
Date: Mon, 30 Jan 2023 09:03:06 +0100
Message-Id: <20230130080307.1792-5-quintela@redhat.com>
In-Reply-To: <20230130080307.1792-1-quintela@redhat.com>
References: <20230130080307.1792-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Until previous commit, save_live_pending() was used for ram.  Now with
the split into state_pending_estimate() and state_pending_exact() it
is not needed anymore, so remove them.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/register.h   |  2 --
 migration/savevm.h             |  6 ++----
 hw/vfio/migration.c            |  1 -
 migration/block-dirty-bitmap.c |  1 -
 migration/block.c              |  2 +-
 migration/migration.c          | 10 ++++------
 migration/ram.c                |  4 ++--
 migration/savevm.c             | 11 ++++-------
 migration/trace-events         |  4 ++--
 9 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index 15cf32994d..b91a0cdbf8 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -58,13 +58,11 @@ typedef struct SaveVMHandlers {
      */
     /* This estimates the remaining data to transfer */
     void (*state_pending_estimate)(void *opaque,
-                                   uint64_t threshold_size,
                                    uint64_t *res_precopy_only,
                                    uint64_t *res_compatible,
                                    uint64_t *res_postcopy_only);
     /* This calculate the exact remaining data to transfer */
     void (*state_pending_exact)(void *opaque,
-                                uint64_t threshold_size,
                                 uint64_t *res_precopy_only,
                                 uint64_t *res_compatible,
                                 uint64_t *res_postcopy_only);
diff --git a/migration/savevm.h b/migration/savevm.h
index 5d2cff4411..b1901e68d5 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,12 +40,10 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending_exact(uint64_t threshold_size,
-                                     uint64_t *res_precopy_only,
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
                                      uint64_t *res_compatible,
                                      uint64_t *res_postcopy_only);
-void qemu_savevm_state_pending_estimate(uint64_t thershold_size,
-                                        uint64_t *res_precopy_only,
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
                                         uint64_t *res_compatible,
                                         uint64_t *res_postcopy_only);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index c49ca466d4..b3318f0f20 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -457,7 +457,6 @@ static void vfio_save_cleanup(void *opaque)
 }
 
 static void vfio_state_pending(void *opaque,
-                               uint64_t threshold_size,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 6fac9fb34f..5a621419d3 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -763,7 +763,6 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void dirty_bitmap_state_pending(void *opaque,
-                                       uint64_t max_size,
                                        uint64_t *res_precopy_only,
                                        uint64_t *res_compatible,
                                        uint64_t *res_postcopy_only)
diff --git a/migration/block.c b/migration/block.c
index 544e74e9c5..29f69025af 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,7 +863,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque, uint64_t max_size,
+static void block_state_pending(void *opaque,
                                 uint64_t *res_precopy_only,
                                 uint64_t *res_compatible,
                                 uint64_t *res_postcopy_only)
diff --git a/migration/migration.c b/migration/migration.c
index e7b4b94348..594a42f085 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3751,18 +3751,16 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pend_pre, pend_compat, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(s->threshold_size, &pend_pre,
-                                       &pend_compat, &pend_post);
+    qemu_savevm_state_pending_estimate(&pend_pre, &pend_compat, &pend_post);
     uint64_t pending_size = pend_pre + pend_compat + pend_post;
 
-    trace_migrate_pending_estimate(pending_size, s->threshold_size,
+    trace_migrate_pending_estimate(pending_size,
                                    pend_pre, pend_compat, pend_post);
 
     if (pend_pre + pend_compat <= s->threshold_size) {
-        qemu_savevm_state_pending_exact(s->threshold_size, &pend_pre,
-                                        &pend_compat, &pend_post);
+        qemu_savevm_state_pending_exact(&pend_pre, &pend_compat, &pend_post);
         pending_size = pend_pre + pend_compat + pend_post;
-        trace_migrate_pending_exact(pending_size, s->threshold_size,
+        trace_migrate_pending_exact(pending_size,
                                     pend_pre, pend_compat, pend_post);
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index 56ff9cd29d..885d7dbf23 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3409,7 +3409,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
+static void ram_state_pending_estimate(void *opaque,
                                        uint64_t *res_precopy_only,
                                        uint64_t *res_compatible,
                                        uint64_t *res_postcopy_only)
@@ -3427,7 +3427,7 @@ static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
     }
 }
 
-static void ram_state_pending_exact(void *opaque, uint64_t max_size,
+static void ram_state_pending_exact(void *opaque,
                                     uint64_t *res_precopy_only,
                                     uint64_t *res_compatible,
                                     uint64_t *res_postcopy_only)
diff --git a/migration/savevm.c b/migration/savevm.c
index 7f9f770c1e..e1caa3ea7c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1472,8 +1472,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
-                                        uint64_t *res_precopy_only,
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
                                         uint64_t *res_compatible,
                                         uint64_t *res_postcopy_only)
 {
@@ -1483,7 +1482,6 @@ void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
     *res_compatible = 0;
     *res_postcopy_only = 0;
 
-
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_exact) {
             continue;
@@ -1493,14 +1491,13 @@ void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque, threshold_size,
+        se->ops->state_pending_exact(se->opaque,
                                      res_precopy_only, res_compatible,
                                      res_postcopy_only);
     }
 }
 
-void qemu_savevm_state_pending_exact(uint64_t threshold_size,
-                                     uint64_t *res_precopy_only,
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
                                      uint64_t *res_compatible,
                                      uint64_t *res_postcopy_only)
 {
@@ -1519,7 +1516,7 @@ void qemu_savevm_state_pending_exact(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque, threshold_size,
+        se->ops->state_pending_estimate(se->opaque,
                                         res_precopy_only, res_compatible,
                                         res_postcopy_only);
     }
diff --git a/migration/trace-events b/migration/trace-events
index adb680b0e6..67b65a70ff 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -150,8 +150,8 @@ migrate_fd_cleanup(void) ""
 migrate_fd_error(const char *error_desc) "error=%s"
 migrate_fd_cancel(void) ""
 migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
-migrate_pending_exact(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "exact pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
-migrate_pending_estimate(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "estimate pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_exact(uint64_t size, uint64_t pre, uint64_t compat, uint64_t post) "exact pending size %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_estimate(uint64_t size, uint64_t pre, uint64_t compat, uint64_t post) "estimate pending size %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
-- 
2.39.1


