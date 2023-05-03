Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660146F54AC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:27:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8kg-0004gW-Ph; Wed, 03 May 2023 05:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8ke-0004gC-Py
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kd-0002fg-Bz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l38tWqn5Fu5lrmauLijpLYzD9pCl3Gw0p0V7GhyMam8=;
 b=JaVDKp3wsDZdXpKwjH0wvzF3rwsegG9HP/JJFKoCOQrjh+cUdig7yxXY52tKo/rU6J7aNk
 RBK21WOLpxa0bYQKnJD/MQZW7fGtRYMfV8tCNQEEpbhPdXbTNKXop8G1H87P7IEPDjp7L6
 hv0X6HbqJi14cLvyBsOXVcNxVXfXBi4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-RCdC6i10MmGttxY91A0UFg-1; Wed, 03 May 2023 05:26:15 -0400
X-MC-Unique: RCdC6i10MmGttxY91A0UFg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CE661C04331;
 Wed,  3 May 2023 09:26:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA95492B00;
 Wed,  3 May 2023 09:26:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 6/8] migration/rdma: Unfold last user of acct_update_position()
Date: Wed,  3 May 2023 11:26:04 +0200
Message-Id: <20230503092606.9415-7-quintela@redhat.com>
In-Reply-To: <20230503092606.9415-1-quintela@redhat.com>
References: <20230503092606.9415-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c  | 9 ---------
 migration/ram.h  | 1 -
 migration/rdma.c | 4 +++-
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index c249a1f468..7d81c4a39e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2629,15 +2629,6 @@ static int ram_find_and_save_block(RAMState *rs)
     return pages;
 }
 
-void acct_update_position(QEMUFile *f, size_t size)
-{
-    uint64_t pages = size / TARGET_PAGE_SIZE;
-
-    stat64_add(&mig_stats.normal_pages, pages);
-    ram_transferred_add(size);
-    qemu_file_credit_transfer(f, size);
-}
-
 static uint64_t ram_bytes_total_with_ignored(void)
 {
     RAMBlock *block;
diff --git a/migration/ram.h b/migration/ram.h
index 3804753ca3..6fffbeb5f1 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -53,7 +53,6 @@ void mig_throttle_counter_reset(void);
 
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
-void acct_update_position(QEMUFile *f, size_t size);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
 void ram_postcopy_send_discard_bitmap(MigrationState *ms);
diff --git a/migration/rdma.c b/migration/rdma.c
index 7a9b284c3f..7e747b2595 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2231,7 +2231,9 @@ retry:
     }
 
     set_bit(chunk, block->transit_bitmap);
-    acct_update_position(f, sge.length);
+    stat64_add(&mig_stats.normal_pages, sge.length / qemu_target_page_size());
+    ram_transferred_add(sge.length);
+    qemu_file_credit_transfer(f, sge.length);
     rdma->total_writes++;
 
     return 0;
-- 
2.40.0


