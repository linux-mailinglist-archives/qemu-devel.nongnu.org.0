Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B86E7F8F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:25:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbl-0000cI-32; Wed, 19 Apr 2023 12:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbh-0000b8-KT
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbg-0008GG-3P
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoUJC3CVvRvVa9qoex7/S8MB1BQMGM4BM0RBbqteMsY=;
 b=A7m3JocE//laILeich7Ai5a5Sgf/m9N2PeHpuM5GQ45WcwxQPyO8/SxeOFFIA2DAIEkWWP
 WTpXZAefyvIdCvzZxM0erWqU59SjzIq2LLTETBeh2s7N7yU0BOxQ0MAfqg4uxA3jHuNcZB
 GGtk6c81MsXcrddoDhxYngcYHcOd7aI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-Z_XncdQmPC-uddiQzU0m5w-1; Wed, 19 Apr 2023 12:24:30 -0400
X-MC-Unique: Z_XncdQmPC-uddiQzU0m5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D871E88B7AA
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16B411121314;
 Wed, 19 Apr 2023 16:24:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 11/12] migration: Rename duplicate to zero_pages
Date: Wed, 19 Apr 2023 18:24:14 +0200
Message-Id: <20230419162415.16260-12-quintela@redhat.com>
In-Reply-To: <20230419162415.16260-1-quintela@redhat.com>
References: <20230419162415.16260-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Rest of counters that refer to pages has a _pages suffix.
And historically, this showed the number of pages composed of the same
character, here comes the name "duplicated".  But since years ago, it
refers to the number of zero_pages.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       |  2 +-
 migration/migration.c |  2 +-
 migration/ram.c       | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 8093ebc210..b27ce01f2e 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -46,7 +46,7 @@ typedef struct {
     Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
     Stat64 downtime_bytes;
-    Stat64 duplicate;
+    Stat64 zero_pages;
     Stat64 multifd_bytes;
     Stat64 normal;
     Stat64 postcopy_bytes;
diff --git a/migration/migration.c b/migration/migration.c
index 83d3bfbf62..20ef5b683b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1142,7 +1142,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram = g_malloc0(sizeof(*info->ram));
     info->ram->transferred = stat64_get(&ram_counters.transferred);
     info->ram->total = ram_bytes_total();
-    info->ram->duplicate = stat64_get(&ram_counters.duplicate);
+    info->ram->duplicate = stat64_get(&ram_counters.zero_pages);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
     info->ram->normal = stat64_get(&ram_counters.normal);
diff --git a/migration/ram.c b/migration/ram.c
index 771596d377..34126f0274 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1119,7 +1119,7 @@ uint64_t ram_pagesize_summary(void)
 uint64_t ram_get_total_transferred_pages(void)
 {
     return stat64_get(&ram_counters.normal) +
-        stat64_get(&ram_counters.duplicate) +
+        stat64_get(&ram_counters.zero_pages) +
         compression_counters.pages + xbzrle_counters.pages;
 }
 
@@ -1322,7 +1322,7 @@ static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *block,
     int len = save_zero_page_to_file(pss, f, block, offset);
 
     if (len) {
-        stat64_add(&ram_counters.duplicate, 1);
+        stat64_add(&ram_counters.zero_pages, 1);
         ram_transferred_add(len);
         return 1;
     }
@@ -1361,7 +1361,7 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
     if (bytes_xmit > 0) {
         stat64_add(&ram_counters.normal, 1);
     } else if (bytes_xmit == 0) {
-        stat64_add(&ram_counters.duplicate, 1);
+        stat64_add(&ram_counters.zero_pages, 1);
     }
 
     return true;
@@ -1488,7 +1488,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        stat64_add(&ram_counters.duplicate, 1);
+        stat64_add(&ram_counters.zero_pages, 1);
         return;
     }
 
@@ -2623,7 +2623,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        stat64_add(&ram_counters.duplicate, pages);
+        stat64_add(&ram_counters.zero_pages, pages);
     } else {
         stat64_add(&ram_counters.normal, pages);
         ram_transferred_add(size);
-- 
2.39.2


