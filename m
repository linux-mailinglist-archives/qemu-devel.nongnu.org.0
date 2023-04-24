Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C66ECF4C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:39:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwFv-0008CY-EH; Mon, 24 Apr 2023 09:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFW-0007OK-Ul
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFT-0001VY-Bn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1J6OxRTtglwpDj4Nlt4o9omlyc507QrI635JBEbBnU=;
 b=ey+bMsPuK6+IyWcWJiaza7aMSxr8EbabNu53CYCnFxmcybc4A9gttP5JwJ2aPMSYO4Ibhm
 zMTb22c0qpIjHZNb8YizmeV9yH1lj9LReXVhuPE+a/89kH1fgMStpyXiNSKynpG+F4xDtx
 1KsuqiY0NtVykRNuKVFn4UHsr6RM2XA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-Se3WLglJPZ6kvnUPcV4YWQ-1; Mon, 24 Apr 2023 09:28:38 -0400
X-MC-Unique: Se3WLglJPZ6kvnUPcV4YWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1298E2823803;
 Mon, 24 Apr 2023 13:28:37 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BD7214171B8;
 Mon, 24 Apr 2023 13:28:34 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 21/30] migration: Move migrate_use_block_incremental() to
 option.c
Date: Mon, 24 Apr 2023 15:27:21 +0200
Message-Id: <20230424132730.70752-22-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

To be consistent with every other parameter, rename to
migrate_block_incremental().

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/block.c     |  2 +-
 migration/migration.c | 11 +----------
 migration/migration.h |  1 -
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index f0977217cf..6d532ac7a2 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -417,7 +417,7 @@ static int init_blk_migration(QEMUFile *f)
         bmds->bulk_completed = 0;
         bmds->total_sectors = sectors;
         bmds->completed_sectors = 0;
-        bmds->shared_base = migrate_use_block_incremental();
+        bmds->shared_base = migrate_block_incremental();
 
         assert(i < num_bs);
         bmds_bs[i].bmds = bmds;
diff --git a/migration/migration.c b/migration/migration.c
index 4a9e5310f1..5ab1e48f57 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2157,7 +2157,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
             error_setg(errp, "No disk migration is required in COLO mode");
             return false;
         }
-        if (migrate_block() || migrate_use_block_incremental()) {
+        if (migrate_block() || migrate_block_incremental()) {
             error_setg(errp, "Command options are incompatible with "
                        "current migration capabilities");
             return false;
@@ -2273,15 +2273,6 @@ int migrate_use_tls(void)
     return s->parameters.tls_creds && *s->parameters.tls_creds;
 }
 
-bool migrate_use_block_incremental(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.block_incremental;
-}
-
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
diff --git a/migration/migration.h b/migration/migration.h
index 8451e5f2fe..86051af132 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -451,7 +451,6 @@ bool migrate_postcopy(void);
 
 int migrate_use_tls(void);
 
-bool migrate_use_block_incremental(void);
 int migrate_max_cpu_throttle(void);
 
 uint64_t ram_get_total_transferred_pages(void);
diff --git a/migration/options.c b/migration/options.c
index 8d15be858c..2b6d88b4b9 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -463,6 +463,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 
 /* parameters */
 
+bool migrate_block_incremental(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.block_incremental;
+}
+
 int migrate_compress_level(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index b24ee92283..96d5a8e6e4 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -45,6 +45,7 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
 
 /* parameters */
 
+bool migrate_block_incremental(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
-- 
2.39.2


