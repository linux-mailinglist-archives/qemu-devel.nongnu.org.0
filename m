Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970C6F5903
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:24:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCO5-0005TY-77; Wed, 03 May 2023 09:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNn-0005P3-6p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puCNl-0006ke-Rp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683119937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWBjviquZpV8hMsrV70Qkw8h1FWxcXgFqGwQsinTDv4=;
 b=aynCFw0elz8DDLIzcHqDse5nvVqIToVJdu7qpc95wTFKF9ZmRRkw5tHTjjwCDmaRDKzgQh
 Fen0yD6asCo5IDhqPZcjZ/IehTud4ed/rGO6ll/GUg+rvfXNQgRL+ji4X0d2cLUFLxPm8K
 9YehGjkHtQp0qlaMt34cAV8576IomGU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-YnUbHhf4NPWE9wuKPR5zdQ-1; Wed, 03 May 2023 09:18:55 -0400
X-MC-Unique: YnUbHhf4NPWE9wuKPR5zdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79D5C3806707
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:18:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E208C15BAD;
 Wed,  3 May 2023 13:18:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 06/16] migration/rdma: We can calculate the rioc from the
 QEMUFile
Date: Wed,  3 May 2023 15:18:37 +0200
Message-Id: <20230503131847.11603-7-quintela@redhat.com>
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
 migration/rdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index c37fcab88a..11815d1c11 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3811,9 +3811,10 @@ out:
  * the source.
  */
 static int
-rdma_block_notification_handle(QIOChannelRDMA *rioc, const char *name)
+rdma_block_notification_handle(QEMUFile *f, const char *name)
 {
     RDMAContext *rdma;
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     int curr;
     int found = -1;
 
@@ -3846,10 +3847,9 @@ rdma_block_notification_handle(QIOChannelRDMA *rioc, const char *name)
 
 static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
 {
-    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     switch (flags) {
     case RAM_CONTROL_BLOCK_REG:
-        return rdma_block_notification_handle(rioc, data);
+        return rdma_block_notification_handle(f, data);
 
     case RAM_CONTROL_HOOK:
         return qemu_rdma_registration_handle(f);
-- 
2.40.0


