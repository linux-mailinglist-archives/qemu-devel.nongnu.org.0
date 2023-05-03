Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2D6F58E6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:20:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCO4-0005TJ-Eo; Wed, 03 May 2023 09:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNl-0005OZ-Dr
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNj-0006kF-Qv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9vR67xcAfqMAfIr7lgi1tpMr3s1sASzda0ICfYmT7o=;
 b=cLn4/z6YpK/k/R+H8VChJ04jwPAsimzsYDfpHXod6/J79YTdM5M7DqIMKL5+T1+t/IyFYm
 EuUG1FbjUF5dmRZDRUAB/nL1daUBpSbmVLZXmoRyy5EHiti5hYP53yOvhai/xNKe8NTieW
 6CpCPkACbdVGr6EMXXvbqg5NScmIwvQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-fEQ-muKvO96umbbmhQlYAg-1; Wed, 03 May 2023 09:18:54 -0400
X-MC-Unique: fEQ-muKvO96umbbmhQlYAg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C7AD1C0A581
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:18:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A26EC15BAD;
 Wed,  3 May 2023 13:18:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 03/16] migration/rdma: Unfold ram_control_after_iterate()
Date: Wed,  3 May 2023 15:18:34 +0200
Message-Id: <20230503131847.11603-4-quintela@redhat.com>
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
- unfold it in its callers
- change all callers to call qemu_rdma_registration_stop()

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 12 ------------
 migration/qemu-file.h |  2 --
 migration/ram.c       | 17 ++++++++++++++---
 migration/rdma.c      |  8 +++++---
 migration/rdma.h      |  2 ++
 5 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index b6dca23706..22af45a5db 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -315,18 +315,6 @@ void qemu_fflush(QEMUFile *f)
     f->iovcnt = 0;
 }
 
-void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
-{
-    int ret = 0;
-
-    if (f->hooks && f->hooks->after_ram_iterate) {
-        ret = f->hooks->after_ram_iterate(f, flags, NULL);
-        if (ret < 0) {
-            qemu_file_set_error(f, ret);
-        }
-    }
-}
-
 void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
 {
     int ret = -EINVAL;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index c898c5c537..fac26d7869 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -56,7 +56,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
                                  uint64_t *bytes_sent);
 
 typedef struct QEMUFileHooks {
-    QEMURamHookFunc *after_ram_iterate;
     QEMURamHookFunc *hook_ram_load;
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
@@ -149,7 +148,6 @@ void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
 int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
 
-void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
 void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
 
 /* Whenever this is found in the data stream, the flags
diff --git a/migration/ram.c b/migration/ram.c
index ce5dfc3c86..a5109a0f77 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3282,7 +3282,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     if (ret < 0) {
         qemu_file_set_error(f, ret);
     }
-    ram_control_after_iterate(f, RAM_CONTROL_SETUP);
+
+    ret = qemu_rdma_registration_stop(f, RAM_CONTROL_SETUP);
+    if (ret < 0) {
+        qemu_file_set_error(f, ret);
+    }
 
     migration_ops = g_malloc0(sizeof(MigrationOps));
     migration_ops->ram_save_target_page = ram_save_target_page_legacy;
@@ -3401,7 +3405,10 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
      * Must occur before EOS (or any QEMUFile operation)
      * because of RDMA protocol.
      */
-    ram_control_after_iterate(f, RAM_CONTROL_ROUND);
+    ret = qemu_rdma_registration_stop(f, RAM_CONTROL_ROUND);
+    if (ret < 0) {
+        qemu_file_set_error(f, ret);
+    }
 
 out:
     if (ret >= 0
@@ -3474,7 +3481,11 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         qemu_mutex_unlock(&rs->bitmap_mutex);
 
         flush_compressed_data(rs);
-        ram_control_after_iterate(f, RAM_CONTROL_FINISH);
+
+        int ret = qemu_rdma_registration_stop(f, RAM_CONTROL_FINISH);
+        if (ret < 0) {
+            qemu_file_set_error(f, ret);
+        }
     }
 
     if (ret < 0) {
diff --git a/migration/rdma.c b/migration/rdma.c
index d8a194ff26..ca893c0bba 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3892,14 +3892,17 @@ int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags)
  * Inform dest that dynamic registrations are done for now.
  * First, flush writes, if any.
  */
-static int qemu_rdma_registration_stop(QEMUFile *f,
-                                       uint64_t flags, void *data)
+int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
     RDMAControlHeader head = { .len = 0, .repeat = 1 };
     int ret = 0;
 
+    if (!migrate_rdma()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmaout);
     if (!rdma) {
@@ -4007,7 +4010,6 @@ static const QEMUFileHooks rdma_read_hooks = {
 };
 
 static const QEMUFileHooks rdma_write_hooks = {
-    .after_ram_iterate  = qemu_rdma_registration_stop,
     .save_page          = qemu_rdma_save_page,
 };
 
diff --git a/migration/rdma.h b/migration/rdma.h
index 901c829c8b..a16a8d8bc6 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -25,7 +25,9 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp);
 
 #ifdef CONFIG_RDMA
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags);
+int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags);
 #else
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags) { return 0; }
+int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags) { return 0; }
 #endif
 #endif
-- 
2.40.0


