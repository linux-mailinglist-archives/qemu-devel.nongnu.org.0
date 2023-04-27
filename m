Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B861B6F03C2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:54:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryJE-0004nb-Lz; Thu, 27 Apr 2023 05:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pryJC-0004nF-Vc
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pryJB-0000HY-GE
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682589180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVaAGkd90v4uDbu+kLsSb8DWnudH2FhKxKrBsvhqo6A=;
 b=C72rvIdu6EgG3F7jh3fseOaHEZvrjwljB065gsYZUCS3Rl4oWVIiKstDDlI3xjH8wZUSe9
 o76LgbTIJrjxhaGjtV4GuAuNCyLErL6mQuixYNm5YEGVBz3c1wfHRIxKzr/WIYkygdIHDg
 CLjqJpzfXikfGZD48y8rmBJE6t6Os6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-roNPYZRbPOiE5Etaj4zlTg-1; Thu, 27 Apr 2023 05:52:56 -0400
X-MC-Unique: roNPYZRbPOiE5Etaj4zlTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0BDA0F387;
 Thu, 27 Apr 2023 09:52:56 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A33A2166B41;
 Thu, 27 Apr 2023 09:52:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: [PATCH v6 3/3] migration: Make dirty_bytes_last_sync atomic
Date: Thu, 27 Apr 2023 11:52:50 +0200
Message-Id: <20230427095250.22350-4-quintela@redhat.com>
In-Reply-To: <20230427095250.22350-1-quintela@redhat.com>
References: <20230427095250.22350-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

As we set its value, it needs to be operated with atomics.
We rename it from remaining to better reflect its meaning.

Statistics always return the real reamaining bytes.  This was used to
store how much pages where dirty on the previous generation, so we can
calculate the expected downtime as: dirty_bytes_last_sync /
current_bandwith.

If we use the actual remaining bytes, we would see a very small value
at the end of the iteration.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

I am open to use ram_bytes_remaining() in its only use and be more
"optimistic" about the downtime.

Don't use __nocheck() functions.
Use stat64_get() now that it exists.
---
 migration/migration.c | 3 ++-
 migration/ram.c       | 2 +-
 migration/ram.h       | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 900dfb6855..cc09a88aac 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2754,7 +2754,8 @@ static void migration_update_counters(MigrationState *s,
      */
     if (stat64_get(&ram_counters.dirty_pages_rate) &&
         transferred > 10000) {
-        s->expected_downtime = ram_counters.remaining / bandwidth;
+        s->expected_downtime =
+            stat64_get(&ram_counters.dirty_bytes_last_sync) / bandwidth;
     }
 
     qemu_file_reset_rate_limit(s->to_dst_file);
diff --git a/migration/ram.c b/migration/ram.c
index fa94c99766..fcdcf78ec7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1223,7 +1223,7 @@ static void migration_bitmap_sync(RAMState *rs)
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(rs, block);
         }
-        ram_counters.remaining = ram_bytes_remaining();
+        stat64_set(&ram_counters.dirty_bytes_last_sync, ram_bytes_remaining());
     }
     qemu_mutex_unlock(&rs->bitmap_mutex);
 
diff --git a/migration/ram.h b/migration/ram.h
index f189cc79f8..04b05e1b2c 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -41,6 +41,7 @@
  * one thread).
  */
 typedef struct {
+    Stat64 dirty_bytes_last_sync;
     Stat64 dirty_pages_rate;
     Stat64 dirty_sync_count;
     Stat64 dirty_sync_missed_zero_copy;
@@ -51,7 +52,6 @@ typedef struct {
     Stat64 postcopy_bytes;
     Stat64 postcopy_requests;
     Stat64 precopy_bytes;
-    int64_t remaining;
     Stat64 transferred;
 } RAMStats;
 
-- 
2.40.0


