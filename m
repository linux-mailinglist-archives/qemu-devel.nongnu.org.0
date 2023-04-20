Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727DB6E95B6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:22:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUB7-0001pH-Hm; Thu, 20 Apr 2023 09:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAp-0001V5-Ic
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAn-0005dr-Vr
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjcTrAksCxmbiPlNvbjUXnHDSgjwXW8MBUgNQYev5Eg=;
 b=HpxA0L8Mj2PNmwH7DQfFP8q5lSRmry2/a6gVMwGkfo+DaCME3K9txxHjgqgm7D/F2tQg/O
 T6SHsKPdrILWhKY/e+ciAeZIN+gmpcvjlgqtWIw6d6C/heJGjhA+mXLnL3kdnG/LFE5f6S
 M0BxLgsPGQWvu6o+zFLLmRHPUMz3kBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342--rSU_mW-MVSzzapI13V6RA-1; Thu, 20 Apr 2023 09:18:03 -0400
X-MC-Unique: -rSU_mW-MVSzzapI13V6RA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4385087A9E6
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:18:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78711C16024;
 Thu, 20 Apr 2023 13:18:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 09/20] migration: Make dirty_sync_count atomic
Date: Thu, 20 Apr 2023 15:17:40 +0200
Message-Id: <20230420131751.28534-10-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c |  3 ++-
 migration/ram.c       | 13 +++++++------
 migration/ram.h       |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4ca2173d85..97c227aa85 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1148,7 +1148,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->normal = stat64_get(&ram_counters.normal);
     info->ram->normal_bytes = info->ram->normal * page_size;
     info->ram->mbps = s->mbps;
-    info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
+    info->ram->dirty_sync_count =
+        stat64_get(&ram_counters.dirty_sync_count);
     info->ram->dirty_sync_missed_zero_copy =
         stat64_get(&ram_counters.dirty_sync_missed_zero_copy);
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
diff --git a/migration/ram.c b/migration/ram.c
index b1722b6071..3c13136559 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -764,7 +764,7 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
     /* We don't care if this fails to allocate a new cache page
      * as long as it updated an old one */
     cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
-                 ram_counters.dirty_sync_count);
+                 stat64_get(&ram_counters.dirty_sync_count));
 }
 
 #define ENCODING_FLAG_XBZRLE 0x1
@@ -790,13 +790,13 @@ static int save_xbzrle_page(RAMState *rs, PageSearchStatus *pss,
     int encoded_len = 0, bytes_xbzrle;
     uint8_t *prev_cached_page;
     QEMUFile *file = pss->pss_channel;
+    uint64_t generation = stat64_get(&ram_counters.dirty_sync_count);
 
-    if (!cache_is_cached(XBZRLE.cache, current_addr,
-                         ram_counters.dirty_sync_count)) {
+    if (!cache_is_cached(XBZRLE.cache, current_addr, generation)) {
         xbzrle_counters.cache_miss++;
         if (!rs->last_stage) {
             if (cache_insert(XBZRLE.cache, current_addr, *current_data,
-                             ram_counters.dirty_sync_count) == -1) {
+                             generation) == -1) {
                 return -1;
             } else {
                 /* update *current_data when the page has been
@@ -1209,7 +1209,7 @@ static void migration_bitmap_sync(RAMState *rs)
     RAMBlock *block;
     int64_t end_time;
 
-    ram_counters.dirty_sync_count++;
+    stat64_add(&ram_counters.dirty_sync_count, 1);
 
     if (!rs->time_last_bitmap_sync) {
         rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
@@ -1246,7 +1246,8 @@ static void migration_bitmap_sync(RAMState *rs)
         rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
     }
     if (migrate_use_events()) {
-        qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
+        uint64_t generation = stat64_get(&ram_counters.dirty_sync_count);
+        qapi_event_send_migration_pass(generation);
     }
 }
 
diff --git a/migration/ram.h b/migration/ram.h
index bb52632424..8c0d07c43a 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -42,7 +42,7 @@
  */
 typedef struct {
     int64_t dirty_pages_rate;
-    int64_t dirty_sync_count;
+    Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
     Stat64 downtime_bytes;
     Stat64 duplicate;
-- 
2.39.2


