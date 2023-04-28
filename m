Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE276F1EA2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:14:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWA-0004kC-EA; Fri, 28 Apr 2023 15:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTW7-0004hg-Uu
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTW1-0002vu-UY
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l38tWqn5Fu5lrmauLijpLYzD9pCl3Gw0p0V7GhyMam8=;
 b=cgaijLEAhJ99KlI+zAaKnP6YpfwJCQkqqP12pZfzEJ8yShIK367ukCo0Yb1LxtiU+wMNqk
 E8Un4XizGXApudLt94s8KAmv7VKIejrMlz7kwsXlxY/uQMP1y4ddBsIOGViS5g7uPbZT8x
 KrHg/nQ9XAgl2LanotXUyfWxTxv4iAs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Mg7PsS7zPg68PYi-_VxlMg-1; Fri, 28 Apr 2023 15:12:16 -0400
X-MC-Unique: Mg7PsS7zPg68PYi-_VxlMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D48C9185A7A2;
 Fri, 28 Apr 2023 19:12:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71DFA2166B4F;
 Fri, 28 Apr 2023 19:12:14 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 06/21] migration/rdma: Unfold last user of
 acct_update_position()
Date: Fri, 28 Apr 2023 21:11:48 +0200
Message-Id: <20230428191203.39520-7-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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


