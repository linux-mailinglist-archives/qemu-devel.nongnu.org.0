Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB746E95C9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:24:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUB5-0001jC-Up; Thu, 20 Apr 2023 09:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAt-0001VL-0Y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAr-0005f4-9a
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JcaSme6KV6OfGQWcqIPJFBdErusq0CmJOoFtFFK0Wc=;
 b=NNDyGbpgbt9Q/P+SYAWTUKIbohnDEbGeozFcbKDp8nw5DN54t/KkJAocUTdD3qBjixUBPZ
 3WHNtYRg315iY2K+EHY7mo4e/muBHXkK4syW8u44flkKWfwy5m8Xrm5HH3iaTvf69wHJHD
 VpxpyVUwFMAWhJrQTHwsxDBJgj/D4x4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-agcG3RgXNsyWAnWBRehSvg-1; Thu, 20 Apr 2023 09:18:05 -0400
X-MC-Unique: agcG3RgXNsyWAnWBRehSvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C608281424A
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:18:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4613C16024;
 Thu, 20 Apr 2023 13:18:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 11/20] migration: Make dirty_pages_rate atomic
Date: Thu, 20 Apr 2023 15:17:42 +0200
Message-Id: <20230420131751.28534-12-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

In this case we use qatomic operations instead of Stat64 wrapper
because there is no stat64_set().  Defining the 64 bit wrapper is
trivial. The one without atomics is more interesting.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 ++++--
 migration/ram.c       | 5 +++--
 migration/ram.h       | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 09b37a6603..50eae2fbcd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1190,7 +1190,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 
     if (s->state != MIGRATION_STATUS_COMPLETED) {
         info->ram->remaining = ram_bytes_remaining();
-        info->ram->dirty_pages_rate = ram_counters.dirty_pages_rate;
+        info->ram->dirty_pages_rate =
+           qatomic_read__nocheck(&ram_counters.dirty_pages_rate);
     }
 }
 
@@ -3844,7 +3845,8 @@ static void migration_update_counters(MigrationState *s,
      * if we haven't sent anything, we don't want to
      * recalculate. 10000 is a small enough number for our purposes
      */
-    if (ram_counters.dirty_pages_rate && transferred > 10000) {
+    if (qatomic_read__nocheck(&ram_counters.dirty_pages_rate) &&
+        transferred > 10000) {
         s->expected_downtime = ram_counters.remaining / bandwidth;
     }
 
diff --git a/migration/ram.c b/migration/ram.c
index fe69ecaef4..7400abf5e1 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1129,8 +1129,9 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
     double compressed_size;
 
     /* calculate period counters */
-    ram_counters.dirty_pages_rate = rs->num_dirty_pages_period * 1000
-                / (end_time - rs->time_last_bitmap_sync);
+    qatomic_set__nocheck(&ram_counters.dirty_pages_rate,
+                         rs->num_dirty_pages_period * 1000 /
+                         (end_time - rs->time_last_bitmap_sync));
 
     if (!page_count) {
         return;
diff --git a/migration/ram.h b/migration/ram.h
index afa68521d7..574a604b72 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -41,7 +41,7 @@
  * one thread).
  */
 typedef struct {
-    int64_t dirty_pages_rate;
+    aligned_uint64_t dirty_pages_rate;
     Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
     Stat64 downtime_bytes;
-- 
2.39.2


