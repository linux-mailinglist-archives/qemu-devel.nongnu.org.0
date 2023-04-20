Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2CE6E95BE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:23:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUB5-0001gJ-Ci; Thu, 20 Apr 2023 09:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAu-0001VW-KQ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAr-0005fa-Lr
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gL0ykmtNo3ZxZwrOtOTDv2wucS3IWqU34lcBpNTCV7s=;
 b=MAHhab8CX3Qy4b3h2q3eURk4UqQ/O7UemTHneYuMyMVhFuPCdKnSqWS6rNi2Dhsp0BJ/r9
 PC/f2nu5L/F9CPF47VNbQhIwv01avf1gQjTvHwQVo4oQ9hNtXOPD530rUWDBHTWKKghS7U
 CkqLlfnTJdwwvjm8QY8v+y6O63kUOds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-hKKLIVenMce8txMiY6F9_w-1; Thu, 20 Apr 2023 09:18:00 -0400
X-MC-Unique: hKKLIVenMce8txMiY6F9_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2A5085A5A3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:17:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22D94C16026;
 Thu, 20 Apr 2023 13:17:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 06/20] migration: Make dirty_sync_missed_zero_copy atomic
Date: Thu, 20 Apr 2023 15:17:37 +0200
Message-Id: <20230420131751.28534-7-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 2 +-
 migration/multifd.c   | 2 +-
 migration/ram.c       | 5 -----
 migration/ram.h       | 4 +---
 4 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c3debe71f6..66e5197b77 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1150,7 +1150,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
     info->ram->dirty_sync_missed_zero_copy =
-            ram_counters.dirty_sync_missed_zero_copy;
+        stat64_get(&ram_counters.dirty_sync_missed_zero_copy);
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
diff --git a/migration/multifd.c b/migration/multifd.c
index 1c992abf53..903df2117b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -576,7 +576,7 @@ static int multifd_zero_copy_flush(QIOChannel *c)
         return -1;
     }
     if (ret == 1) {
-        dirty_sync_missed_zero_copy();
+        stat64_add(&ram_counters.dirty_sync_missed_zero_copy, 1);
     }
 
     return ret;
diff --git a/migration/ram.c b/migration/ram.c
index 71320ed27a..93e0a48af4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -472,11 +472,6 @@ void ram_transferred_add(uint64_t bytes)
     stat64_add(&ram_counters.transferred, bytes);
 }
 
-void dirty_sync_missed_zero_copy(void)
-{
-    ram_counters.dirty_sync_missed_zero_copy++;
-}
-
 struct MigrationOps {
     int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
 };
diff --git a/migration/ram.h b/migration/ram.h
index ed70391317..2170c55e67 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -43,7 +43,7 @@
 typedef struct {
     int64_t dirty_pages_rate;
     int64_t dirty_sync_count;
-    uint64_t dirty_sync_missed_zero_copy;
+    Stat64 dirty_sync_missed_zero_copy;
     uint64_t downtime_bytes;
     Stat64 duplicate;
     Stat64 multifd_bytes;
@@ -114,6 +114,4 @@ void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
-void dirty_sync_missed_zero_copy(void);
-
 #endif
-- 
2.39.2


