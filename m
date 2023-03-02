Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137086A86CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltJ-0006iK-0r; Thu, 02 Mar 2023 11:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltD-0006P5-Kn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltB-0007I2-VY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WnusWWZFlAFVaz85DDL/k8LJX62Y0AE4FVr9j6bG++Y=;
 b=SGzGauyniK0YQgPQuLYssHudNIKa2Y8WG0XdhtlgiBeYRcQdrA/8XVLLiGO6kwye2vLnrZ
 g/mJA8UQCoVV9nvzj+4PSD4znLVpV4kd4lhAkPWfrCrqdB9KnRdj4FBD5tjwiW5lFOOuZ0
 LfMQh7lQ4ySU7Sv97Ey+rl/1zQSLGMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-RY-6opL8NXCcoeHnjjxFfg-1; Thu, 02 Mar 2023 11:34:39 -0500
X-MC-Unique: RY-6opL8NXCcoeHnjjxFfg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15DC31881423;
 Thu,  2 Mar 2023 16:34:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26F54492C3E;
 Thu,  2 Mar 2023 16:34:37 +0000 (UTC)
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
Subject: [PATCH 11/43] migration: Move migrate_use_block() to options.c
Date: Thu,  2 Mar 2023 17:33:38 +0100
Message-Id: <20230302163410.11399-12-quintela@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Once that we are there, we rename the function to migrate_block()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/block.c     |  2 +-
 migration/migration.c | 11 +----------
 migration/options.c   |  9 +++++++++
 migration/savevm.c    |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 13d5c7f149..ecd6f7658d 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -418,7 +418,6 @@ int migrate_multifd_zstd_level(void);
 int migrate_use_tls(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
-bool migrate_use_block(void);
 bool migrate_use_block_incremental(void);
 int migrate_max_cpu_throttle(void);
 bool migrate_use_return_path(void);
diff --git a/migration/options.h b/migration/options.h
index e4e7879f40..541a4a2026 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -20,6 +20,7 @@
 
 bool migrate_auto_converge(void);
 bool migrate_background_snapshot(void);
+bool migrate_block(void);
 bool migrate_colo(void);
 bool migrate_compress(void);
 bool migrate_dirty_bitmaps(void);
diff --git a/migration/block.c b/migration/block.c
index c4fe9fea56..2cacd5a184 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -1002,7 +1002,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
 
 static bool block_is_active(void *opaque)
 {
-    return migrate_use_block();
+    return migrate_block();
 }
 
 static SaveVMHandlers savevm_block_handlers = {
diff --git a/migration/migration.c b/migration/migration.c
index e1a8972c0b..66847e52cc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2413,7 +2413,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
             error_setg(errp, "No disk migration is required in COLO mode");
             return false;
         }
-        if (migrate_use_block() || migrate_use_block_incremental()) {
+        if (migrate_block() || migrate_use_block_incremental()) {
             error_setg(errp, "Command options are incompatible with "
                        "current migration capabilities");
             return false;
@@ -2620,15 +2620,6 @@ static int64_t migrate_max_postcopy_bandwidth(void)
     return s->parameters.max_postcopy_bandwidth;
 }
 
-bool migrate_use_block(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_BLOCK];
-}
-
 bool migrate_use_return_path(void)
 {
     MigrationState *s;
diff --git a/migration/options.c b/migration/options.c
index a5b1b1dfda..66735c1cd9 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -35,6 +35,15 @@ bool migrate_background_snapshot(void)
     return s->capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_block(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_BLOCK];
+}
+
 bool migrate_colo(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/savevm.c b/migration/savevm.c
index ebcf571e37..9671211339 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1612,7 +1612,7 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
         return -EINVAL;
     }
 
-    if (migrate_use_block()) {
+    if (migrate_block()) {
         error_setg(errp, "Block migration and snapshots are incompatible");
         return -EINVAL;
     }
-- 
2.39.2


