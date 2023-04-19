Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD296E7F9E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:26:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbt-0000hW-NF; Wed, 19 Apr 2023 12:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbr-0000hL-N7
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbl-0008Gk-01
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehQkTo3bnLllD+yH5cNQq51We/l5X/OxurIXrcO/NLg=;
 b=U2myWXBF3Pvcos/UboZgM2PI0xZ7EA9xQgVmIrUaHVju8uz3ImiqUGtqwMUQ0tr2PKzOaq
 Q2MRXnH5+Yd2/MCck0gYnF6R2dcCD06w3cvYkAJnS//D0PIVbp6Qh0qHr54DsOdaO+MH2t
 5V8HMJLMnPL4/yazcUVDisbOjJzebpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-8_ffTTKFPti26h3pIFmTMA-1; Wed, 19 Apr 2023 12:24:32 -0400
X-MC-Unique: 8_ffTTKFPti26h3pIFmTMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 178918279CB
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292961121319;
 Wed, 19 Apr 2023 16:24:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 12/12] migration: Rename normal to full_pages
Date: Wed, 19 Apr 2023 18:24:15 +0200
Message-Id: <20230419162415.16260-13-quintela@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
And historically, this showed the number of full pages transferred.
The name "normal" refered to the fact that they were sent without any
optimization (compression, xbzrle, zero_page, ...).

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       |  2 +-
 migration/migration.c |  2 +-
 migration/ram.c       | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index b27ce01f2e..421673aa26 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -48,7 +48,7 @@ typedef struct {
     Stat64 downtime_bytes;
     Stat64 zero_pages;
     Stat64 multifd_bytes;
-    Stat64 normal;
+    Stat64 full_pages;
     Stat64 postcopy_bytes;
     Stat64 postcopy_requests;
     Stat64 precopy_bytes;
diff --git a/migration/migration.c b/migration/migration.c
index 20ef5b683b..26c61ece55 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1145,7 +1145,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->duplicate = stat64_get(&ram_counters.zero_pages);
     /* legacy value.  It is not used anymore */
     info->ram->skipped = 0;
-    info->ram->normal = stat64_get(&ram_counters.normal);
+    info->ram->normal = stat64_get(&ram_counters.full_pages);
     info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count =
diff --git a/migration/ram.c b/migration/ram.c
index 34126f0274..09ed5cdf27 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1118,7 +1118,7 @@ uint64_t ram_pagesize_summary(void)
 
 uint64_t ram_get_total_transferred_pages(void)
 {
-    return stat64_get(&ram_counters.normal) +
+    return stat64_get(&ram_counters.full_pages) +
         stat64_get(&ram_counters.zero_pages) +
         compression_counters.pages + xbzrle_counters.pages;
 }
@@ -1359,7 +1359,7 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
     }
 
     if (bytes_xmit > 0) {
-        stat64_add(&ram_counters.normal, 1);
+        stat64_add(&ram_counters.full_pages, 1);
     } else if (bytes_xmit == 0) {
         stat64_add(&ram_counters.zero_pages, 1);
     }
@@ -1393,7 +1393,7 @@ static int save_normal_page(PageSearchStatus *pss, RAMBlock *block,
         qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
     }
     ram_transferred_add(TARGET_PAGE_SIZE);
-    stat64_add(&ram_counters.normal, 1);
+    stat64_add(&ram_counters.full_pages, 1);
     return 1;
 }
 
@@ -1449,7 +1449,7 @@ static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
     if (multifd_queue_page(file, block, offset) < 0) {
         return -1;
     }
-    stat64_add(&ram_counters.normal, 1);
+    stat64_add(&ram_counters.full_pages, 1);
 
     return 1;
 }
@@ -2625,7 +2625,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     if (zero) {
         stat64_add(&ram_counters.zero_pages, pages);
     } else {
-        stat64_add(&ram_counters.normal, pages);
+        stat64_add(&ram_counters.full_pages, pages);
         ram_transferred_add(size);
         qemu_file_credit_transfer(f, size);
     }
-- 
2.39.2


