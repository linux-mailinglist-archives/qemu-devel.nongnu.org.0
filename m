Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E46E960C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:42:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWk-00043w-5b; Thu, 20 Apr 2023 09:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWi-00042Z-AK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWe-0005oD-Vo
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fw/JwC3B8wKdI2zwfn320zzwq7sI5H8AmnPVJNTwB0I=;
 b=Khu+YwpJX8T86xrDyUvrnyIIDAvae8v0Pi/svvi345O92eymrP6F4VMqzMkG1ecO23DuDS
 /cmgGD9KEcklJdbHX/rMAzKwih5Pzth7/06h5Rr+RndbrWu9h7WVBSmV2x6nqbadWiUn/j
 LewjJcqU8miu8mmuCLSgh2dUm9bGzMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-XHjlsUjbM42dxqA4ZaYFyQ-1; Thu, 20 Apr 2023 09:40:36 -0400
X-MC-Unique: XHjlsUjbM42dxqA4ZaYFyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86D0A885620;
 Thu, 20 Apr 2023 13:40:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1AEB4020BF1;
 Thu, 20 Apr 2023 13:40:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 10/43] migration: Move migrate_use_xbzrle() to options.c
Date: Thu, 20 Apr 2023 15:39:29 +0200
Message-Id: <20230420134002.29531-11-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Once that we are there, we rename the function to migrate_xbzrle()
to be consistent with all other capabilities.
We change the type to return bool also for consistency.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 11 +----------
 migration/migration.h |  1 -
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 migration/ram.c       | 10 +++++-----
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a17b1598dc..f34c5f1895 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1122,7 +1122,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->downtime_bytes = stat64_get(&ram_counters.downtime_bytes);
     info->ram->postcopy_bytes = stat64_get(&ram_counters.postcopy_bytes);
 
-    if (migrate_use_xbzrle()) {
+    if (migrate_xbzrle()) {
         info->xbzrle_cache = g_malloc0(sizeof(*info->xbzrle_cache));
         info->xbzrle_cache->cache_size = migrate_xbzrle_cache_size();
         info->xbzrle_cache->bytes = xbzrle_counters.bytes;
@@ -2605,15 +2605,6 @@ int migrate_use_tls(void)
     return s->parameters.tls_creds && *s->parameters.tls_creds;
 }
 
-int migrate_use_xbzrle(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_XBZRLE];
-}
-
 uint64_t migrate_xbzrle_cache_size(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index c939f82d53..e2bb5b1e2f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -455,7 +455,6 @@ int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
 int migrate_use_tls(void);
-int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
 bool migrate_use_block(void);
diff --git a/migration/options.c b/migration/options.c
index f357c99996..25264c500e 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -147,6 +147,15 @@ bool migrate_validate_uuid(void)
     return s->capabilities[MIGRATION_CAPABILITY_VALIDATE_UUID];
 }
 
+bool migrate_xbzrle(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_XBZRLE];
+}
+
 bool migrate_zero_blocks(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index ad22f4d24a..8f76a88329 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -31,6 +31,7 @@ bool migrate_postcopy_preempt(void);
 bool migrate_postcopy_ram(void);
 bool migrate_release_ram(void);
 bool migrate_validate_uuid(void);
+bool migrate_xbzrle(void);
 bool migrate_zero_blocks(void);
 bool migrate_zero_copy_send(void);
 
diff --git a/migration/ram.c b/migration/ram.c
index f2341e25f2..7f28588dde 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -156,14 +156,14 @@ static struct {
 
 static void XBZRLE_cache_lock(void)
 {
-    if (migrate_use_xbzrle()) {
+    if (migrate_xbzrle()) {
         qemu_mutex_lock(&XBZRLE.lock);
     }
 }
 
 static void XBZRLE_cache_unlock(void)
 {
-    if (migrate_use_xbzrle()) {
+    if (migrate_xbzrle()) {
         qemu_mutex_unlock(&XBZRLE.lock);
     }
 }
@@ -1138,7 +1138,7 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
         return;
     }
 
-    if (migrate_use_xbzrle()) {
+    if (migrate_xbzrle()) {
         double encoded_size, unencoded_size;
 
         xbzrle_counters.cache_miss_rate = (double)(xbzrle_counters.cache_miss -
@@ -1628,7 +1628,7 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
             /* Flag that we've looped */
             pss->complete_round = true;
             /* After the first round, enable XBZRLE. */
-            if (migrate_use_xbzrle()) {
+            if (migrate_xbzrle()) {
                 rs->xbzrle_enabled = true;
             }
         }
@@ -2981,7 +2981,7 @@ static int xbzrle_init(void)
 {
     Error *local_err = NULL;
 
-    if (!migrate_use_xbzrle()) {
+    if (!migrate_xbzrle()) {
         return 0;
     }
 
-- 
2.39.2


