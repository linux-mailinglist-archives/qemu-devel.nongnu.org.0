Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000B6F58ED
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:21:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCO7-0005Un-Fc; Wed, 03 May 2023 09:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNy-0005SD-Td
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNx-0006mG-E5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTodSp/PhnjrR1P9iaM2nwu2PZjN+aaUzx1fblb92+E=;
 b=f5JjuIrAKxSqiQwd+Oewf7pVfcICosLkLMe9KC/e8HTgj21WyKJaxkqX6eR67otfAfcBzW
 MzxwSDo6F758kaxsXutJDnW6YZ7b6NHvMWO/GVkxXxfHHpGQ2fGgYVgf9Mygigk3xtw6AN
 +ZhSNjOy1o3PprovV+JnzBBJdy4OnQs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-GiJEUkq0PjOtAW1L6xXcgQ-1; Wed, 03 May 2023 09:19:07 -0400
X-MC-Unique: GiJEUkq0PjOtAW1L6xXcgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40F5128237C0
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:19:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7881DC15BAD;
 Wed,  3 May 2023 13:19:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 16/16] migration/rdma: If we are in postcopy don't do
 anything
Date: Wed,  3 May 2023 15:18:47 +0200
Message-Id: <20230503131847.11603-17-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index d6b4398620..4bc9c5cb91 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3243,10 +3243,6 @@ static size_t qemu_rdma_save_page(QEMUFile *f,
 
     CHECK_ERROR_STATE();
 
-    if (migration_in_postcopy()) {
-        return RAM_SAVE_CONTROL_NOT_SUPP;
-    }
-
     qemu_fflush(f);
 
     /*
@@ -3323,6 +3319,10 @@ size_t rdma_control_save_page(QEMUFile *f, ram_addr_t block_offset,
         return RAM_SAVE_CONTROL_NOT_SUPP;
     }
 
+    if (migration_in_postcopy()) {
+        return RAM_SAVE_CONTROL_NOT_SUPP;
+    }
+
     int ret = qemu_rdma_save_page(f, block_offset, offset, size, bytes_sent);
     if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
         qemu_file_acct_rate_limit(f, size);
@@ -3883,6 +3883,10 @@ int rdma_registration_start(QEMUFile *f, uint64_t flags)
         return 0;
     }
 
+    if (migration_in_postcopy()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmaout);
     if (!rdma) {
@@ -3891,10 +3895,6 @@ int rdma_registration_start(QEMUFile *f, uint64_t flags)
 
     CHECK_ERROR_STATE();
 
-    if (migration_in_postcopy()) {
-        return 0;
-    }
-
     trace_rdma_registration_start(flags);
     qemu_put_be64(f, RAM_SAVE_FLAG_HOOK);
     qemu_fflush(f);
@@ -3917,6 +3917,10 @@ int rdma_registration_stop(QEMUFile *f, uint64_t flags)
         return 0;
     }
 
+    if (migration_in_postcopy()) {
+        return 0;
+    }
+
     RCU_READ_LOCK_GUARD();
     rdma = qatomic_rcu_read(&rioc->rdmaout);
     if (!rdma) {
@@ -3925,10 +3929,6 @@ int rdma_registration_stop(QEMUFile *f, uint64_t flags)
 
     CHECK_ERROR_STATE();
 
-    if (migration_in_postcopy()) {
-        return 0;
-    }
-
     qemu_fflush(f);
     ret = qemu_rdma_drain_cq(f, rdma);
 
-- 
2.40.0


