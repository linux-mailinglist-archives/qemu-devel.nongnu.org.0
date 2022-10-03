Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7575F27CD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 05:22:05 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofC1s-0007Hs-Pw
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 23:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ofBwQ-0005Av-Lt
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 23:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ofBwO-0007Wa-UI
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 23:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664766984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZgmHTCR9bxJcEmUoPOTtendDNFE6ukZny7bykvV0ic=;
 b=eyzw1TLGMJRsMiSfSAVQYYPnmEMkg7N6hdfbG42Y2TL2nyNd3nM0pUTCPN01eeqvPs2npZ
 88Hw7IdnQ6OD8pqfJAfxt1qUlridm1fequhcbmDfVC8odHjDlIizgS7cXJOo3k1yDL5fkq
 ifaobsgFBsN3ccSn3VZj12lP1GMycck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-vAoQrRoMOcGqESXH2wtIPQ-1; Sun, 02 Oct 2022 23:16:13 -0400
X-MC-Unique: vAoQrRoMOcGqESXH2wtIPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14B18027ED;
 Mon,  3 Oct 2022 03:16:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A16840C206B;
 Mon,  3 Oct 2022 03:16:09 +0000 (UTC)
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
Subject: [RFC 2/7] migration: No save_live_pending() method uses the QEMUFile
 parameter
Date: Mon,  3 Oct 2022 05:15:55 +0200
Message-Id: <20221003031600.20084-3-quintela@redhat.com>
In-Reply-To: <20221003031600.20084-1-quintela@redhat.com>
References: <20221003031600.20084-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So remove it everywhere.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/register.h   | 6 ++----
 migration/savevm.h             | 2 +-
 hw/s390x/s390-stattrib.c       | 2 +-
 hw/vfio/migration.c            | 6 ++----
 migration/block-dirty-bitmap.c | 5 ++---
 migration/block.c              | 2 +-
 migration/migration.c          | 3 +--
 migration/ram.c                | 2 +-
 migration/savevm.c             | 5 ++---
 9 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index 1950fee6a8..5b5424ed8f 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -46,10 +46,8 @@ typedef struct SaveVMHandlers {
 
     /* This runs outside the iothread lock!  */
     int (*save_setup)(QEMUFile *f, void *opaque);
-    void (*save_live_pending)(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *rest_precopy,
-                              uint64_t *rest_postcopy);
+    void (*save_live_pending)(void *opaque,  uint64_t threshold_size,
+                              uint64_t *rest_precopy, uint64_t *rest_postcopy);
     /* Note for save_live_pending:
      * - res_precopy is for data which must be migrated in precopy
      *     phase or in stopped state, in other words - before target
diff --git a/migration/savevm.h b/migration/savevm.h
index 9bd55c336c..98fae6f9b3 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,7 +40,7 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
+void qemu_savevm_state_pending(uint64_t max_size,
                                uint64_t *res_precopy, uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index ee60b53da4..9b74eeadf3 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,7 +182,7 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void cmma_save_pending(void *opaque, uint64_t max_size,
                               uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3423f113f0..760d5f3c5c 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -456,10 +456,8 @@ static void vfio_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(QEMUFile *f, void *opaque,
-                              uint64_t threshold_size,
-                              uint64_t *res_precopy,
-                              uint64_t *res_postcopy)
+static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
+                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index dfea546330..a445bdc3c3 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -761,9 +761,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
-                                      uint64_t max_size,
-                                      uint64_t *res_precopy,
+static void dirty_bitmap_save_pending(void *opaque, uint64_t max_size,
+                                      uint64_t *res_precopy, 
                                       uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
diff --git a/migration/block.c b/migration/block.c
index 4ae8f837b0..b3d680af75 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -862,7 +862,7 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void block_save_pending(void *opaque, uint64_t max_size,
                                uint64_t *res_precopy,
                                uint64_t *res_postcopy)
 {
diff --git a/migration/migration.c b/migration/migration.c
index 440aa62f16..038fc58a96 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3737,8 +3737,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pending_size, pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
-                              &pend_post);
+    qemu_savevm_state_pending(s->threshold_size, &pend_pre, &pend_post);
     pending_size = pend_pre + pend_post;
 
     trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
diff --git a/migration/ram.c b/migration/ram.c
index 20167e1102..48a31b87c8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3434,7 +3434,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
+static void ram_save_pending(void *opaque, uint64_t max_size,
                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index a752ff9ea1..d937ab0b2e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1471,8 +1471,7 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
-                               uint64_t *res_precopy,
+void qemu_savevm_state_pending(uint64_t threshold_size, uint64_t *res_precopy,
                                uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
@@ -1489,7 +1488,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
                 continue;
             }
         }
-        se->ops->save_live_pending(f, se->opaque, threshold_size,
+        se->ops->save_live_pending(se->opaque, threshold_size,
                                    res_precopy, res_postcopy);
     }
 }
-- 
2.37.2


