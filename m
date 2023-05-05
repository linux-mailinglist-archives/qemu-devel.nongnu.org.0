Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927736F7A25
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:50:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujcz-0004JG-6r; Thu, 04 May 2023 20:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcs-0004H6-FH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcp-0001IE-QK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9VbCH1BUc5dCY3vpQamrrAnEyyhHj4L4BSIXudcaB4=;
 b=cJ2JpUMy18S5fxn37TWe4R0sd5yloc9qODqERnh1Rf9tGON5HNFURbeozRpB0BMGmNwCR+
 5mzB7RzSQtFUssFfR2tdOJgm6LUFEnPqM1KvGMnnDglUz25tW5ui1EKRy0Udxdk6AuQP0x
 8lbGCEt0N0oztJjNeb7HJaGjN5kQZpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-AxlFN8qGN46YKZXlPc3H8A-1; Thu, 04 May 2023 20:48:37 -0400
X-MC-Unique: AxlFN8qGN46YKZXlPc3H8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABF9F29AA3BD;
 Fri,  5 May 2023 00:48:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB650404B24D;
 Fri,  5 May 2023 00:48:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 10/16] migration/rdma: Check for postcopy sooner
Date: Fri,  5 May 2023 02:48:06 +0200
Message-Id: <20230505004812.31583-11-quintela@redhat.com>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230504114443.23891-6-quintela@redhat.com>
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


