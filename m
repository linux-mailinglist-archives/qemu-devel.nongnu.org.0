Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C765F27C9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 05:19:04 +0200 (CEST)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofByx-0001we-Vr
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 23:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ofBwW-0005Xf-D8
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 23:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ofBwU-0007Xv-H1
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 23:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664766990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuQYppfjMjYmOBpb1/3mlSFSjtXfiaf9/CdgUKmVikg=;
 b=QDwiXWdA4ZQTdjOpB8khUgDL5jqiSwG+8Uj6whj15bZq0ACGoh6ZY4/xlFvDEbiKRiGIfe
 icGX7sAwN0N8oXR7JMIEHRtnAsPEfASjhBEYK3Hg6teMOOg5b7nAx1loEtzmE1Li7QRw3Q
 7G9RaR41WQM65osWb7esAPKCjRoUEVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-z0luv5uHNQu67pQQHGHXGQ-1; Sun, 02 Oct 2022 23:16:23 -0400
X-MC-Unique: z0luv5uHNQu67pQQHGHXGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44E42185A79C;
 Mon,  3 Oct 2022 03:16:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEBD40C206B;
 Mon,  3 Oct 2022 03:16:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC 5/7] migration: Remove unused threshold_size parameter
Date: Mon,  3 Oct 2022 05:15:58 +0200
Message-Id: <20221003031600.20084-6-quintela@redhat.com>
In-Reply-To: <20221003031600.20084-1-quintela@redhat.com>
References: <20221003031600.20084-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Until previous commit, save_live_pending() was used for ram.  Now with
the split into state_pending_estimate() and state_pending_exact() it
is not needed anymore, so remove them.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   |  7 +++----
 migration/savevm.h             |  6 ++----
 hw/vfio/migration.c            |  6 +++---
 migration/block-dirty-bitmap.c |  3 +--
 migration/block.c              |  3 +--
 migration/migration.c          |  4 ++--
 migration/ram.c                |  6 ++----
 migration/savevm.c             | 12 ++++--------
 8 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index 313b8e1c3b..5f08204fb2 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -58,11 +58,10 @@ typedef struct SaveVMHandlers {
      * pending data.
      */
     /* This calculate the exact remaining data to transfer */
-    void (*state_pending_exact)(void *opaque,  uint64_t threshold_size,
-                                uint64_t *rest_precopy, uint64_t *rest_postcopy);
+    void (*state_pending_exact)(void *opaque, uint64_t *rest_precopy,
+                                uint64_t *rest_postcopy);
     /* This estimates the remaining data to transfer */
-    void (*state_pending_estimate)(void *opaque,  uint64_t threshold_size,
-                                   uint64_t *rest_precopy,
+    void (*state_pending_estimate)(void *opaque, uint64_t *rest_precopy,
                                    uint64_t *rest_postcopy);
 
     LoadStateHandler *load_state;
diff --git a/migration/savevm.h b/migration/savevm.h
index 613f85e717..24f2d2a28b 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,11 +40,9 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending_exact(uint64_t max_size,
-                                     uint64_t *res_precopy,
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
                                      uint64_t *res_postcopy);
-void qemu_savevm_state_pending_estimate(uint64_t max_size,
-                                        uint64_t *res_precopy,
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
                                         uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 680cf4df6e..d9598ce070 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,8 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_state_pending(void *opaque,  uint64_t threshold_size,
-                               uint64_t *res_precopy, uint64_t *res_postcopy)
+static void vfio_state_pending(void *opaque, uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -511,7 +511,7 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     }
 
     /*
-     * Reset pending_bytes as .save_live_pending is not called during savevm or
+     * Reset pending_bytes as .state_pending_* is not called during savevm or
      * snapshot case, in such case vfio_update_pending() at the start of this
      * function updates pending_bytes.
      */
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5b24007650..8a11577252 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -761,8 +761,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_state_pending(void *opaque, uint64_t max_size,
-                                       uint64_t *res_precopy,
+static void dirty_bitmap_state_pending(void *opaque, uint64_t *res_precopy,
                                        uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
diff --git a/migration/block.c b/migration/block.c
index 8e6ad1c468..4f1f7c0f8d 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -862,8 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque, uint64_t max_size,
-                                uint64_t *res_precopy,
+static void block_state_pending(void *opaque, uint64_t *res_precopy,
                                 uint64_t *res_postcopy)
 {
     /* Estimate pending number of bytes to send */
diff --git a/migration/migration.c b/migration/migration.c
index 4676568699..97fefd579e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3737,12 +3737,12 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(s->threshold_size, &pend_pre, &pend_post);
+    qemu_savevm_state_pending_estimate(&pend_pre, &pend_post);
     uint64_t pending_size = pend_pre + pend_post;
     trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
 
     if (pend_pre <= s->threshold_size) {
-        qemu_savevm_state_pending_exact(s->threshold_size, &pend_pre, &pend_post);
+        qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
         pending_size = pend_pre + pend_post;
         trace_migrate_pending_exact(pending_size, s->threshold_size, pend_pre, pend_post);
     }
diff --git a/migration/ram.c b/migration/ram.c
index 8d989d51db..53a5dd64a8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3434,8 +3434,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
-                                       uint64_t *res_precopy,
+static void ram_state_pending_estimate(void *opaque, uint64_t *res_precopy,
                                        uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
@@ -3451,8 +3450,7 @@ static void ram_state_pending_estimate(void *opaque, uint64_t max_size,
     }
 }
 
-static void ram_state_pending_exact(void *opaque, uint64_t max_size,
-                                    uint64_t *res_precopy,
+static void ram_state_pending_exact(void *opaque, uint64_t *res_precopy,
                                     uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index 976ece3f3f..1e0328e088 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1471,8 +1471,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_exact(uint64_t threshold_size,
-                                     uint64_t *res_precopy,
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy,
                                      uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1489,13 +1488,11 @@ void qemu_savevm_state_pending_exact(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque, threshold_size,
-                                     res_precopy, res_postcopy);
+        se->ops->state_pending_exact(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
-                                        uint64_t *res_precopy,
+void qemu_savevm_state_pending_estimate(uint64_t *res_precopy,
                                         uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1512,8 +1509,7 @@ void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque, threshold_size,
-                                        res_precopy, res_postcopy);
+        se->ops->state_pending_estimate(se->opaque, res_precopy, res_postcopy);
     }
 }
 
-- 
2.37.2


