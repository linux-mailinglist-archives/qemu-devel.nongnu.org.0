Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8E6E7F8E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:25:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbm-0000cw-40; Wed, 19 Apr 2023 12:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbh-0000b4-B1
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbf-0008G9-Oh
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6d2LxQy3SvmuAqnXfuczyTRLJPXdqjEoeRC4eEPZKAI=;
 b=CQXuOLz3y+IiAQ3Cb105nVH/ZvPeh8guenNAZenaPghkHJzeIuKpKvhvEtSysw99LhhTKz
 Kr5QgCHyrJFjDVf8xa4tAyRn7aM8xC3fDIJmxovrla4s+K/aV6h9mKqj2N9fkp6olX5wtK
 Vj74lvjr4r2TkFa0bItX8+DP43umlAc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-ZTQ0kg3rNZawhQxVINFykA-1; Wed, 19 Apr 2023 12:24:29 -0400
X-MC-Unique: ZTQ0kg3rNZawhQxVINFykA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3E193C10C6E
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 035621121314;
 Wed, 19 Apr 2023 16:24:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 10/12] migration: Make dirty_bytes_last_sync atomic
Date: Wed, 19 Apr 2023 18:24:13 +0200
Message-Id: <20230419162415.16260-11-quintela@redhat.com>
In-Reply-To: <20230419162415.16260-1-quintela@redhat.com>
References: <20230419162415.16260-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

As we set its value, it needs to be operated with atomics.
We rename it from remaining to better reflect its meaning.

Statistics always return the real reamaining bytes.  This was used to
store how much pages where dirty on the previous generation, so we can
calculate the expected downtime as: dirty_bytes_last_sync /
current_bandwith.

If we use the actual remaining bytes, we would see a very small value
at the end of the iteration.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

I am open to use ram_bytes_remaining() in its only use and be more
"optimistic" about the downtime.
---
 migration/ram.h       | 2 +-
 migration/migration.c | 4 +++-
 migration/ram.c       | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 574a604b72..8093ebc210 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -41,6 +41,7 @@
  * one thread).
  */
 typedef struct {
+    aligned_uint64_t dirty_bytes_last_sync;
     aligned_uint64_t dirty_pages_rate;
     Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
@@ -51,7 +52,6 @@ typedef struct {
     Stat64 postcopy_bytes;
     Stat64 postcopy_requests;
     Stat64 precopy_bytes;
-    int64_t remaining;
     Stat64 transferred;
 } RAMStats;
 
diff --git a/migration/migration.c b/migration/migration.c
index 50eae2fbcd..83d3bfbf62 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3847,7 +3847,9 @@ static void migration_update_counters(MigrationState *s,
      */
     if (qatomic_read__nocheck(&ram_counters.dirty_pages_rate) &&
         transferred > 10000) {
-        s->expected_downtime = ram_counters.remaining / bandwidth;
+        s->expected_downtime =
+            qatomic_read__nocheck(&ram_counters.dirty_bytes_last_sync) /
+                                  bandwidth;
     }
 
     qemu_file_reset_rate_limit(s->to_dst_file);
diff --git a/migration/ram.c b/migration/ram.c
index 55fabec1fe..771596d377 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1224,7 +1224,8 @@ static void migration_bitmap_sync(RAMState *rs)
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(rs, block);
         }
-        ram_counters.remaining = ram_bytes_remaining();
+        qatomic_set__nocheck(&ram_counters.dirty_bytes_last_sync,
+                             ram_bytes_remaining());
     }
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
-- 
2.39.2


