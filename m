Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5E6E7F9B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:26:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbk-0000c4-1w; Wed, 19 Apr 2023 12:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbd-0000YC-Ml
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbc-0008Et-6E
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkbjSBUwOmIaRullc4SjxxrgOzU+jkLxAJ0q5tOVLHM=;
 b=NXfK+A7hqcqJ8pBKSMCRVCD3VVXP7pzq2dsGlwydQunAewxHDhfGrQoNHDEe1tH+w4Sjvk
 u9qbrRvxi3xrs9H8MXeXrkO5JRPPeSEZj1hyoNHNpxLLGzwqo2SpWfKz7ZmMs6xd/pnbSc
 Zou+UBtliEF4v7mxFqQE06DblVAosIQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-7Wg7qcEQMveQtTCCbWWJEQ-1; Wed, 19 Apr 2023 12:24:25 -0400
X-MC-Unique: 7Wg7qcEQMveQtTCCbWWJEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83B39381D4CB
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:25 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B88861121314;
 Wed, 19 Apr 2023 16:24:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 07/12] migration: Make dirty_sync_count atomic
Date: Wed, 19 Apr 2023 18:24:10 +0200
Message-Id: <20230419162415.16260-8-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       |  2 +-
 migration/migration.c |  3 ++-
 migration/ram.c       | 13 +++++++------
 3 files changed, 10 insertions(+), 8 deletions(-)

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
index 35abbcda02..b391546020 100644
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
 
-- 
2.39.2


