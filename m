Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B46F6A56
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:46:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXOY-0004k3-F1; Thu, 04 May 2023 07:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXOK-0004hY-En
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:44:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXOH-0004m2-Q3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8IQDMRfVSmvUTSKd8FFQA9JpW3rPFH3vhoL2IfUwcM=;
 b=Ou3suk9ILiFHGLOVgBK9kFQQBNYf04xzxkbDUTPxRa7jADdWSJzpVkHxdMDz4F7VIUXV55
 q8V+X4obyckqkggf//6KatYTemZf33xMA4EujDGrB6Iwd+YbrkvyZ0clZycWNVeS4aMGB9
 9yVSxt4gEbTmmXbfXuqCt9VKNg9k1wU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-zKfxL9oJMx-E0dx_yKwX-w-1; Thu, 04 May 2023 07:44:50 -0400
X-MC-Unique: zKfxL9oJMx-E0dx_yKwX-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A2A811E7D
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 11:44:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 694062026D16;
 Thu,  4 May 2023 11:44:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 5/5] migration/rdma: Check for postcopy sooner
Date: Thu,  4 May 2023 13:44:43 +0200
Message-Id: <20230504114443.23891-6-quintela@redhat.com>
In-Reply-To: <20230504114443.23891-1-quintela@redhat.com>
References: <20230504114443.23891-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

It makes no sense first try to see if there is an rdma error and then
do nothing on postcopy stage.  Change it so we check we are in
postcopy before doing anything.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 17c4b9206f..2cd8f1cc66 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3234,19 +3234,19 @@ static size_t qemu_rdma_save_page(QEMUFile *f,
     RDMAContext *rdma;
     int ret;
 
-    RCU_READ_LOCK_GUARD();
-    rdma = qatomic_rcu_read(&rioc->rdmaout);
-
-    if (!rdma) {
-        return -EIO;
-    }
-
-    CHECK_ERROR_STATE();
-
     if (migration_in_postcopy()) {
         return RAM_SAVE_CONTROL_NOT_SUPP;
     }
 
+    RCU_READ_LOCK_GUARD();
+    rdma = qatomic_rcu_read(&rioc->rdmaout);
+
+    if (!rdma) {
+        return -EIO;
+    }
+
+    CHECK_ERROR_STATE();
+
     qemu_fflush(f);
 
     /*
@@ -3866,6 +3866,10 @@ static int qemu_rdma_registration_start(QEMUFile *f,
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
 
+    if (migration_in_postcopy()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmaout);
     if (!rdma) {
@@ -3874,10 +3878,6 @@ static int qemu_rdma_registration_start(QEMUFile *f,
 
     CHECK_ERROR_STATE();
 
-    if (migration_in_postcopy()) {
-        return 0;
-    }
-
     trace_qemu_rdma_registration_start(flags);
     qemu_put_be64(f, RAM_SAVE_FLAG_HOOK);
     qemu_fflush(f);
@@ -3897,6 +3897,10 @@ static int qemu_rdma_registration_stop(QEMUFile *f,
     RDMAControlHeader head = { .len = 0, .repeat = 1 };
     int ret = 0;
 
+    if (migration_in_postcopy()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmaout);
     if (!rdma) {
@@ -3905,10 +3909,6 @@ static int qemu_rdma_registration_stop(QEMUFile *f,
 
     CHECK_ERROR_STATE();
 
-    if (migration_in_postcopy()) {
-        return 0;
-    }
-
     qemu_fflush(f);
     ret = qemu_rdma_drain_cq(f, rdma);
 
-- 
2.40.0


