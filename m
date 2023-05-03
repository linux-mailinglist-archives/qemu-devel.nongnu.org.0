Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A96F58E5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:20:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCNx-0005QG-4B; Wed, 03 May 2023 09:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNi-0005Nz-TI
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNh-0006jf-7q
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82GKF6jBsZ6yZicTA6C03KmhNS2Tm23Lf/xYhoERaSw=;
 b=WpVAtH2vpZsSnQtZJ2BmvuO0G1cU8w9+/y0bkjAfYfMC9SutP1VCw9Hgbib6D+TZNV6oYH
 lG2o9x47x3JPfElmaQM3XIImJbphozWkdAQH2+k84xXWSy4s/R9QmDme30qCabjlKIVgxV
 GL4sBvyGcqpvx3GsOQtV1Z05en0RiXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-PGI94O9_PJOU3fmUawc2NQ-1; Wed, 03 May 2023 09:18:51 -0400
X-MC-Unique: PGI94O9_PJOU3fmUawc2NQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBDAE811E7B
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:18:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC51DC15BAD;
 Wed,  3 May 2023 13:18:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 02/16] migration/rdma: Unfold ram_control_before_iterate()
Date: Wed,  3 May 2023 15:18:33 +0200
Message-Id: <20230503131847.11603-3-quintela@redhat.com>
In-Reply-To: <20230503131847.11603-1-quintela@redhat.com>
References: <20230503131847.11603-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Once there:
- Remove unused data parameter
- unfold it in its callers.
- change all callers to call qemu_rdma_registration_start()

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 13 +------------
 migration/qemu-file.h |  2 --
 migration/ram.c       | 16 +++++++++++++---
 migration/rdma.c      |  8 +++++---
 migration/rdma.h      |  6 ++++++
 5 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index ee04240a21..b6dca23706 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -30,6 +30,7 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "rdma.h"
 
 #define IO_BUF_SIZE 32768
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
@@ -314,18 +315,6 @@ void qemu_fflush(QEMUFile *f)
     f->iovcnt = 0;
 }
 
-void ram_control_before_iterate(QEMUFile *f, uint64_t flags)
-{
-    int ret = 0;
-
-    if (f->hooks && f->hooks->before_ram_iterate) {
-        ret = f->hooks->before_ram_iterate(f, flags, NULL);
-        if (ret < 0) {
-            qemu_file_set_error(f, ret);
-        }
-    }
-}
-
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
 {
     int ret = 0;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index d16cd50448..c898c5c537 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -56,7 +56,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
                                  uint64_t *bytes_sent);
 
 typedef struct QEMUFileHooks {
-    QEMURamHookFunc *before_ram_iterate;
     QEMURamHookFunc *after_ram_iterate;
     QEMURamHookFunc *hook_ram_load;
     QEMURamSaveFunc *save_page;
@@ -150,7 +149,6 @@ void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
 int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
 
-void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
 
diff --git a/migration/ram.c b/migration/ram.c
index 7d81c4a39e..ce5dfc3c86 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -58,6 +58,7 @@
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
+#include "rdma.h"
 #include "options.h"
 
 #include "hw/boards.h" /* for machine_dump_guest_core() */
@@ -3277,7 +3278,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ram_control_before_iterate(f, RAM_CONTROL_SETUP);
+    ret = qemu_rdma_registration_start(f, RAM_CONTROL_SETUP);
+    if (ret < 0) {
+        qemu_file_set_error(f, ret);
+    }
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
     migration_ops = g_malloc0(sizeof(MigrationOps));
@@ -3337,7 +3341,10 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         /* Read version before ram_list.blocks */
         smp_rmb();
 
-        ram_control_before_iterate(f, RAM_CONTROL_ROUND);
+        ret = qemu_rdma_registration_start(f, RAM_CONTROL_ROUND);
+        if (ret < 0) {
+            qemu_file_set_error(f, ret);
+        }
 
         t0 = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
         i = 0;
@@ -3442,7 +3449,10 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
             migration_bitmap_sync_precopy(rs);
         }
 
-        ram_control_before_iterate(f, RAM_CONTROL_FINISH);
+        ret = qemu_rdma_registration_start(f, RAM_CONTROL_FINISH);
+        if (ret < 0) {
+            qemu_file_set_error(f, ret);
+        }
 
         /* try transferring iterative blocks of memory */
 
diff --git a/migration/rdma.c b/migration/rdma.c
index b026e98519..d8a194ff26 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3860,12 +3860,15 @@ static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
     }
 }
 
-static int qemu_rdma_registration_start(QEMUFile *f,
-                                        uint64_t flags, void *data)
+int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
 
+    if (!migrate_rdma()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmaout);
     if (!rdma) {
@@ -4004,7 +4007,6 @@ static const QEMUFileHooks rdma_read_hooks = {
 };
 
 static const QEMUFileHooks rdma_write_hooks = {
-    .before_ram_iterate = qemu_rdma_registration_start,
     .after_ram_iterate  = qemu_rdma_registration_stop,
     .save_page          = qemu_rdma_save_page,
 };
diff --git a/migration/rdma.h b/migration/rdma.h
index de2ba09dc5..901c829c8b 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -22,4 +22,10 @@ void rdma_start_outgoing_migration(void *opaque, const char *host_port,
 
 void rdma_start_incoming_migration(const char *host_port, Error **errp);
 
+
+#ifdef CONFIG_RDMA
+int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags);
+#else
+int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags) { return 0; }
+#endif
 #endif
-- 
2.40.0


