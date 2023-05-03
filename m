Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7676F58F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:22:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCO5-0005Tj-Tq; Wed, 03 May 2023 09:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNw-0005Rj-Q5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNv-0006lj-8i
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fl0epjSKhpGNi8MqyrXiQY+3YRvXKVYBVvQbsVkLOFM=;
 b=DdWer+KclzUkNLG97vKMErvm8ISD18YRIzq3zrV5Wg5KheJUNEeHdzgn2q52ocIbFXc3Vq
 hRlpT2OoQfQ3fOh5V2vXW+lmflYr37xq80WAIrpVUKyrsYgoA5f4vF0PRlhbeK4iJ4fyA9
 xkVO1bgzHvTnR5wjdyfn/0IA/smQhEE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-qrQoGzl7PfycX2b7a1Dtqw-1; Wed, 03 May 2023 09:19:04 -0400
X-MC-Unique: qrQoGzl7PfycX2b7a1Dtqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03A4A0F3A3
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:19:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34D8FC15BAD;
 Wed,  3 May 2023 13:19:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 13/16] qemu-file: Remove QEMUFileHooks
Date: Wed,  3 May 2023 15:18:44 +0200
Message-Id: <20230503131847.11603-14-quintela@redhat.com>
In-Reply-To: <20230503131847.11603-1-quintela@redhat.com>
References: <20230503131847.11603-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

The only user was rdma, and its use is gone.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 6 ------
 migration/qemu-file.h | 4 ----
 migration/rdma.c      | 9 ---------
 3 files changed, 19 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 8d3f33fe41..c0c2195a6e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -36,7 +36,6 @@
 #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
 
 struct QEMUFile {
-    const QEMUFileHooks *hooks;
     QIOChannel *ioc;
     bool is_writable;
 
@@ -160,11 +159,6 @@ QEMUFile *qemu_file_new_input(QIOChannel *ioc)
     return qemu_file_new_impl(ioc, false);
 }
 
-void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks)
-{
-    f->hooks = hooks;
-}
-
 /*
  * Get last error for stream f with optional Error*
  *
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index ae3a704772..9c99914b21 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -36,12 +36,8 @@
 #define RAM_CONTROL_ROUND     1
 #define RAM_CONTROL_FINISH    3
 
-typedef struct QEMUFileHooks {
-} QEMUFileHooks;
-
 QEMUFile *qemu_file_new_input(QIOChannel *ioc);
 QEMUFile *qemu_file_new_output(QIOChannel *ioc);
-void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_fclose(QEMUFile *f);
 
 /*
diff --git a/migration/rdma.c b/migration/rdma.c
index c984a2840a..78d8f5a199 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4021,13 +4021,6 @@ err:
     return ret;
 }
 
-static const QEMUFileHooks rdma_read_hooks = {
-};
-
-static const QEMUFileHooks rdma_write_hooks = {
-};
-
-
 static void qio_channel_rdma_finalize(Object *obj)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(obj);
@@ -4086,12 +4079,10 @@ static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
         rioc->file = qemu_file_new_output(QIO_CHANNEL(rioc));
         rioc->rdmaout = rdma;
         rioc->rdmain = rdma->return_path;
-        qemu_file_set_hooks(rioc->file, &rdma_write_hooks);
     } else {
         rioc->file = qemu_file_new_input(QIO_CHANNEL(rioc));
         rioc->rdmain = rdma;
         rioc->rdmaout = rdma->return_path;
-        qemu_file_set_hooks(rioc->file, &rdma_read_hooks);
     }
 
     return rioc->file;
-- 
2.40.0


