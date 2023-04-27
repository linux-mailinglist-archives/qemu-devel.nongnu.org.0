Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A636F0A03
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:38:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4at-0005Xs-Cn; Thu, 27 Apr 2023 12:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4ap-0005XU-HR
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4aZ-0006m0-QS
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojgGHfB+wMyc8rrE0L1a8xisZz4sPMDO7VyWT6Ur3c4=;
 b=VnZs6oKCKBzzDBQ4GV/Q8LJJvy2bZHGR3QknFtUtUkGUWRkLjcFfzvuZmsyD5I2JwAic8c
 CUKex7bnAPFWdgjuWCxoz3MAt9kz2lv/8PXN1kF3WtjfeTbq4V8BLVwOC604GK0ixVlAvK
 AmLoOvxIFV2bwf+t3x85hazKSOeKcyQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-0K7PqJ5eP7CO1ghiBktfCg-1; Thu, 27 Apr 2023 12:35:10 -0400
X-MC-Unique: 0K7PqJ5eP7CO1ghiBktfCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A31B388CE15
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:35:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5C3D10DF8;
 Thu, 27 Apr 2023 16:35:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 15/19] migration/rdma: Unfold hook_ram_load()
Date: Thu, 27 Apr 2023 18:34:45 +0200
Message-Id: <20230427163449.27473-16-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

There is only one flag called with: RAM_CONTROL_BLOCK_REG.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 10 ----------
 migration/qemu-file.h | 11 -----------
 migration/ram.c       |  6 ++++--
 migration/rdma.c      | 25 +++++--------------------
 migration/rdma.h      |  2 ++
 5 files changed, 11 insertions(+), 43 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 014db96984..9d86900efe 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -315,16 +315,6 @@ void qemu_fflush(QEMUFile *f)
     f->iovcnt = 0;
 }
 
-void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
-{
-    if (f->hooks && f->hooks->hook_ram_load) {
-        int ret = f->hooks->hook_ram_load(f, flags, data);
-        if (ret < 0) {
-            qemu_file_set_error(f, ret);
-        }
-    }
-}
-
 size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
                              ram_addr_t offset, size_t size,
                              uint64_t *bytes_sent)
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 7623e3c475..d69f5d65e8 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -29,20 +29,12 @@
 #include "exec/cpu-common.h"
 #include "io/channel.h"
 
-/*
- * This function provides hooks around different
- * stages of RAM migration.
- * 'data' is call specific data associated with the 'flags' value
- */
-typedef int (QEMURamHookFunc)(QEMUFile *f, uint64_t flags, void *data);
-
 /*
  * Constants used by ram_control_* hooks
  */
 #define RAM_CONTROL_SETUP     0
 #define RAM_CONTROL_ROUND     1
 #define RAM_CONTROL_FINISH    3
-#define RAM_CONTROL_BLOCK_REG 4
 
 /*
  * This function allows override of where the RAM page
@@ -55,7 +47,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
                                  uint64_t *bytes_sent);
 
 typedef struct QEMUFileHooks {
-    QEMURamHookFunc *hook_ram_load;
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
 
@@ -147,8 +138,6 @@ void qemu_fflush(QEMUFile *f);
 void qemu_file_set_blocking(QEMUFile *f, bool block);
 int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
 
-void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
-
 /* Whenever this is found in the data stream, the flags
  * will be passed to ram_control_load_hook in the incoming-migration
  * side. This lets before_ram_iterate/after_ram_iterate add
diff --git a/migration/ram.c b/migration/ram.c
index c0110ca8cb..d29dd67d5f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4418,8 +4418,10 @@ static int ram_load_precopy(QEMUFile *f)
                             ret = -EINVAL;
                         }
                     }
-                    ram_control_load_hook(f, RAM_CONTROL_BLOCK_REG,
-                                          block->idstr);
+                    ret = rdma_block_notification_handle(f, block->idstr);
+                    if (ret < 0) {
+                        qemu_file_set_error(f, ret);
+                    }
                 } else {
                     error_report("Unknown ramblock \"%s\", cannot "
                                  "accept migration", id);
diff --git a/migration/rdma.c b/migration/rdma.c
index e72584483a..72ea08ee95 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3804,14 +3804,12 @@ out:
 }
 
 /* Destination:
- * Called via a ram_control_load_hook during the initial RAM load section which
- * lists the RAMBlocks by name.  This lets us know the order of the RAMBlocks
- * on the source.
- * We've already built our local RAMBlock list, but not yet sent the list to
- * the source.
+ * Called during the initial RAM load section which lists the
+ * RAMBlocks by name.  This lets us know the order of the RAMBlocks on
+ * the source.  We've already built our local RAMBlock list, but not
+ * yet sent the list to the source.
  */
-static int
-rdma_block_notification_handle(QEMUFile *f, const char *name)
+int rdma_block_notification_handle(QEMUFile *f, const char *name)
 {
     RDMAContext *rdma;
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
@@ -3845,18 +3843,6 @@ rdma_block_notification_handle(QEMUFile *f, const char *name)
     return 0;
 }
 
-static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
-{
-    switch (flags) {
-    case RAM_CONTROL_BLOCK_REG:
-        return rdma_block_notification_handle(f, data);
-
-    default:
-        /* Shouldn't be called with any other values */
-        abort();
-    }
-}
-
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
@@ -3995,7 +3981,6 @@ err:
 }
 
 static const QEMUFileHooks rdma_read_hooks = {
-    .hook_ram_load = rdma_load_hook,
 };
 
 static const QEMUFileHooks rdma_write_hooks = {
diff --git a/migration/rdma.h b/migration/rdma.h
index 8d0253047c..1266a90e07 100644
--- a/migration/rdma.h
+++ b/migration/rdma.h
@@ -27,9 +27,11 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp);
 int qemu_rdma_registration_handle(QEMUFile *f);
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags);
 int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags);
+int rdma_block_notification_handle(QEMUFile *f, const char *name);
 #else
 int qemu_rdma_registration_handle(QEMUFile *f) { return 0; }
 int qemu_rdma_registration_start(QEMUFile *f, uint64_t flags) { return 0; }
 int qemu_rdma_registration_stop(QEMUFile *f, uint64_t flags) { return 0; }
+int rdma_block_notification_handle(QEMUFile *f, const char *name) { return 0; }
 #endif
 #endif
-- 
2.40.0


