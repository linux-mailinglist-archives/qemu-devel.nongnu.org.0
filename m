Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121C6ECADC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:03:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtxN-0006W0-1q; Mon, 24 Apr 2023 07:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxI-0006RA-Bw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxG-00007f-Jk
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682334117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAzy9si/jMA37GnbGAXLG/QcG7k1YO+xVO8d5UViEw0=;
 b=gDdPNjd42++LOaKNdCWyIH2LwdFAgdHAGtkq7U24WTqRyBRtstJrk0bWTuim6jRCDB+2uY
 V37JudE6uXm546g3B80c7pWL+/V0A4CUHRxbIaetxE/kO2mjRN75hfOYAh5ltHRYCI1he0
 6bhkqut2hz+t8yeeQ6UUPAYEsCRBGfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-WqEYC8d3PBiQ6Dw9MYVs8w-1; Mon, 24 Apr 2023 07:01:56 -0400
X-MC-Unique: WqEYC8d3PBiQ6Dw9MYVs8w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D14B58F61FA
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 11:01:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2CCD492C13;
 Mon, 24 Apr 2023 11:01:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 10/17] migration: Rename duplicate to zero_pages
Date: Mon, 24 Apr 2023 13:01:12 +0200
Message-Id: <20230424110119.68520-11-quintela@redhat.com>
In-Reply-To: <20230424110119.68520-1-quintela@redhat.com>
References: <20230424110119.68520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
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
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c |  2 +-
 migration/ram.c       | 10 +++++-----
 migration/ram.h       |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 09b37a6603..c8b360a2df 100644
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
index fe69ecaef4..19d345a030 100644
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
 
@@ -1320,7 +1320,7 @@ static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *block,
     int len = save_zero_page_to_file(pss, f, block, offset);
 
     if (len) {
-        stat64_add(&ram_counters.duplicate, 1);
+        stat64_add(&ram_counters.zero_pages, 1);
         ram_transferred_add(len);
         return 1;
     }
@@ -1359,7 +1359,7 @@ static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
     if (bytes_xmit > 0) {
         stat64_add(&ram_counters.normal, 1);
     } else if (bytes_xmit == 0) {
-        stat64_add(&ram_counters.duplicate, 1);
+        stat64_add(&ram_counters.zero_pages, 1);
     }
 
     return true;
@@ -1486,7 +1486,7 @@ update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-        stat64_add(&ram_counters.duplicate, 1);
+        stat64_add(&ram_counters.zero_pages, 1);
         return;
     }
 
@@ -2621,7 +2621,7 @@ void acct_update_position(QEMUFile *f, size_t size, bool zero)
     uint64_t pages = size / TARGET_PAGE_SIZE;
 
     if (zero) {
-        stat64_add(&ram_counters.duplicate, pages);
+        stat64_add(&ram_counters.zero_pages, pages);
     } else {
         stat64_add(&ram_counters.normal, pages);
         ram_transferred_add(size);
diff --git a/migration/ram.h b/migration/ram.h
index afa68521d7..55258334fe 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -45,7 +45,7 @@ typedef struct {
     Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
     Stat64 downtime_bytes;
-    Stat64 duplicate;
+    Stat64 zero_pages;
     Stat64 multifd_bytes;
     Stat64 normal;
     Stat64 postcopy_bytes;
-- 
2.39.2


