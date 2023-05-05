Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35C46F7A2E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:51:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujcc-00043g-KJ; Thu, 04 May 2023 20:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujca-0003zO-1m
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcU-0000hi-Pi
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rB1KZ0u3Ndgy61yBxUx9qHqRuPMGVsTrUzb+7ibAEU=;
 b=cgaFTGz88/e9Mv0RfMpClRK44/ughGOC5jbEvcjmnQA36PsLB5muI8LprY5pNclwHHK60K
 rzgIehDpo4ulwN76ffgUb99GwzhZXkUsffTkAHycMyj/N9I6zbEmpk6npJx/FdhyGMEGxD
 lxdGkFf1RI6EgKU983idT2PfCWyxoak=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-fBY4ljF3MZO3EHCINddg_A-1; Thu, 04 May 2023 20:48:19 -0400
X-MC-Unique: fBY4ljF3MZO3EHCINddg_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065F91C068D2;
 Fri,  5 May 2023 00:48:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25130404B24D;
 Fri,  5 May 2023 00:48:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PULL 01/16] migration: Fix block_bitmap_mapping migration
Date: Fri,  5 May 2023 02:47:57 +0200
Message-Id: <20230505004812.31583-2-quintela@redhat.com>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

It is valid that params->has_block_bitmap_mapping is true and
params->block_bitmap_mapping is NULL.  So we can't use the trick of
having a single function.

Move to two functions one for each value and the tests are fixed.

Fixes: b804b35b1c8a0edfd127ac20819c234be55ac7fc
       migration: Create migrate_block_bitmap_mapping() function

Reported-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230503181036.14890-1-quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/block-dirty-bitmap.c | 14 +++++---------
 migration/options.c            |  7 +++++++
 migration/options.h            |  2 ++
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 6624f39bc6..20f36e6bd8 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -606,11 +606,9 @@ static int init_dirty_bitmap_migration(DBMSaveState *s)
     GHashTable *handled_by_blk = g_hash_table_new(NULL, NULL);
     BlockBackend *blk;
     GHashTable *alias_map = NULL;
-    const BitmapMigrationNodeAliasList *block_bitmap_mapping =
-        migrate_block_bitmap_mapping();
 
-    if (block_bitmap_mapping) {
-        alias_map = construct_alias_map(block_bitmap_mapping, true,
+    if (migrate_has_block_bitmap_mapping()) {
+        alias_map = construct_alias_map(migrate_block_bitmap_mapping(), true,
                                         &error_abort);
     }
 
@@ -1159,8 +1157,6 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
 static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
 {
     GHashTable *alias_map = NULL;
-    const BitmapMigrationNodeAliasList *block_bitmap_mapping =
-        migrate_block_bitmap_mapping();
     DBMLoadState *s = &((DBMState *)opaque)->load;
     int ret = 0;
 
@@ -1172,9 +1168,9 @@ static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
         return -EINVAL;
     }
 
-    if (block_bitmap_mapping) {
-        alias_map = construct_alias_map(block_bitmap_mapping,
-                                        false, &error_abort);
+    if (migrate_has_block_bitmap_mapping()) {
+        alias_map = construct_alias_map(migrate_block_bitmap_mapping(), false,
+                                        &error_abort);
     }
 
     do {
diff --git a/migration/options.c b/migration/options.c
index 53b7fc5d5d..7395787960 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -626,6 +626,13 @@ const BitmapMigrationNodeAliasList *migrate_block_bitmap_mapping(void)
     return s->parameters.block_bitmap_mapping;
 }
 
+bool migrate_has_block_bitmap_mapping(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.has_block_bitmap_mapping;
+}
+
 bool migrate_block_incremental(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/options.h b/migration/options.h
index 3c322867cd..09841d6a63 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -71,6 +71,8 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
 /* parameters */
 
 const BitmapMigrationNodeAliasList *migrate_block_bitmap_mapping(void);
+bool migrate_has_block_bitmap_mapping(void);
+
 bool migrate_block_incremental(void);
 uint32_t migrate_checkpoint_delay(void);
 int migrate_compress_level(void);
-- 
2.40.0


