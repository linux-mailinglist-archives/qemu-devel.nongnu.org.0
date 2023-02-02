Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149396883BA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc7i-0007MU-6p; Thu, 02 Feb 2023 11:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7M-00075E-CC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7H-00051q-Hp
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HN6fE7PnB7WVc8fIdCfznWEmfB0jU4iizxbfGPavGPw=;
 b=KXJVM1SB6LiDRLCJ2cd310XKwbDN+VVmNVpuqyh3SaMv4OVWbYLXLsKEQwtJOcKD7a7opA
 5asoRqDHa2Mh6PYECnr5MwfL3fin/68/Vor+hcR7qjnEpOa6TRq8/piGSVXlszZiw9LMPx
 +ZLB+L8sffevsvieR6ShQZpApNXCQqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-rfIPKHn0ORi8Mzb97cPVHQ-1; Thu, 02 Feb 2023 11:07:11 -0500
X-MC-Unique: rfIPKHn0ORi8Mzb97cPVHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4101218E0920;
 Thu,  2 Feb 2023 16:07:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 835D751E5;
 Thu,  2 Feb 2023 16:07:01 +0000 (UTC)
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
Subject: [PULL 04/26] migration: Remove unused threshold_size parameter
Date: Thu,  2 Feb 2023 17:06:18 +0100
Message-Id: <20230202160640.2300-5-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Until previous commit, save_live_pending() was used for ram.  Now with
the split into state_pending_estimate() and state_pending_exact() it
is not needed anymore, so remove them.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/register.h   |  2 --
 migration/savevm.h             |  6 ++----
 hw/s390x/s390-stattrib.c       |  2 +-
 hw/vfio/migration.c            |  1 -
 migration/block-dirty-bitmap.c |  1 -
 migration/block.c              |  2 +-
 migration/migration.c          | 10 ++++------
 migration/ram.c                |  4 ++--
 migration/savevm.c             | 11 ++++-------
 migration/trace-events         |  4 ++--
 10 files changed, 16 insertions(+), 27 deletions(-)

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
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 8f573ebb10..3e32002eab 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,7 +182,7 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_state_pending(void *opaque, uint64_t max_size,
+static void cmma_state_pending(void *opaque,
                                uint64_t *res_precopy_only,
                                uint64_t *res_compatible,
                                uint64_t *res_postcopy_only)
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


