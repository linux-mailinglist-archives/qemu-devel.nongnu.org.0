Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83A6A8701
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:41:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvW-0003jD-Dy; Thu, 02 Mar 2023 11:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlv0-0002QK-7D
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluy-0000Yz-Ra
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LP4nQDpNy/evUFzrJ1tFCb0pkVZZ+TvRlr6tCVxCdl8=;
 b=T9satt5mSS80EZUXt1pekXv268qwpZHJrXJ+udARmZN0DXmZ47Kywmj5N6rqoWQeXgIzGj
 +ed51YpyhS7eiis4AdPIQUXGw5QFFbzo4i7i+EcHJ+fPNyG6d9/cpOP2jBrcmxX5BXg2Tf
 G+Srh2cKjxP/ihHKl2+TYG6cjmsRnMk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-NtG2m1BZPsOp_cFQ5-iWig-1; Thu, 02 Mar 2023 11:36:27 -0500
X-MC-Unique: NtG2m1BZPsOp_cFQ5-iWig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E414100F908;
 Thu,  2 Mar 2023 16:36:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95A72492B02;
 Thu,  2 Mar 2023 16:36:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 42/43] migration: Create migrate_block_bitmap_mapping()
 function
Date: Thu,  2 Mar 2023 17:34:09 +0100
Message-Id: <20230302163410.11399-43-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Notice that we changed the test of ->has_block_bitmap_mapping
for the test that block_bitmap_mapping is not NULL.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h            |  1 +
 migration/block-dirty-bitmap.c | 14 ++++++++------
 migration/options.c            |  7 +++++++
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 3284f95312..698514cf76 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -64,6 +64,7 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
 
 /* parameters */
 
+BitmapMigrationNodeAliasList *migrate_block_bitmap_mapping(void);
 bool migrate_block_incremental(void);
 uint32_t migrate_checkpoint_delay(void);
 int migrate_compress_level(void);
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index a6ffae0002..62b2352bbb 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -605,11 +605,12 @@ static int init_dirty_bitmap_migration(DBMSaveState *s)
     SaveBitmapState *dbms;
     GHashTable *handled_by_blk = g_hash_table_new(NULL, NULL);
     BlockBackend *blk;
-    const MigrationParameters *mig_params = &migrate_get_current()->parameters;
     GHashTable *alias_map = NULL;
+    BitmapMigrationNodeAliasList *block_bitmap_mapping =
+        migrate_block_bitmap_mapping();
 
-    if (mig_params->has_block_bitmap_mapping) {
-        alias_map = construct_alias_map(mig_params->block_bitmap_mapping, true,
+    if (block_bitmap_mapping) {
+        alias_map = construct_alias_map(block_bitmap_mapping, true,
                                         &error_abort);
     }
 
@@ -1158,7 +1159,8 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
 static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
 {
     GHashTable *alias_map = NULL;
-    const MigrationParameters *mig_params = &migrate_get_current()->parameters;
+    BitmapMigrationNodeAliasList *block_bitmap_mapping =
+        migrate_block_bitmap_mapping();
     DBMLoadState *s = &((DBMState *)opaque)->load;
     int ret = 0;
 
@@ -1170,8 +1172,8 @@ static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
         return -EINVAL;
     }
 
-    if (mig_params->has_block_bitmap_mapping) {
-        alias_map = construct_alias_map(mig_params->block_bitmap_mapping,
+    if (block_bitmap_mapping) {
+        alias_map = construct_alias_map(block_bitmap_mapping,
                                         false, &error_abort);
     }
 
diff --git a/migration/options.c b/migration/options.c
index 96d20a9cfc..e7f66cfc26 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -456,6 +456,13 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 
 /* parameters */
 
+BitmapMigrationNodeAliasList *migrate_block_bitmap_mapping(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.block_bitmap_mapping;
+}
+
 bool migrate_block_incremental(void)
 {
     MigrationState *s = migrate_get_current();
-- 
2.39.2


