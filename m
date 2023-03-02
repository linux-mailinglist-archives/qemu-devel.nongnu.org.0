Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B46A86D0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXluk-0001Gy-P4; Thu, 02 Mar 2023 11:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlto-0000GM-6z
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltm-00082D-3z
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GwpzEuB6c08fTi0dZzjYe8/PMgocUsLa/fJGKYbgnYU=;
 b=inNaL4ijzLDTW5D0WLrzkY45zJce4WvSGC5sxlRbDzFdVB2Ugs86MDBoFruRYmJoK0Vldl
 VPCHozI7MLiQX7e8UaRBO0mN5FtgCs352+HlIkz9tXxcMSLgXf0A446yCCPDhy1ICqsUGV
 CeOSqoPdhVDgBukH+6Sj5yJITNsuu/Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-7okEX_hnMgin5L7BKvwrEw-1; Thu, 02 Mar 2023 11:35:13 -0500
X-MC-Unique: 7okEX_hnMgin5L7BKvwrEw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 737D03C14103;
 Thu,  2 Mar 2023 16:35:12 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78450492C3E;
 Thu,  2 Mar 2023 16:35:10 +0000 (UTC)
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
Subject: [PATCH 20/43] migration: Move migrate_use_block_incremental() to
 option.c
Date: Thu,  2 Mar 2023 17:33:47 +0100
Message-Id: <20230302163410.11399-21-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

To be consistent with every other parameter, rename to migrate_block_incremental().

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/block.c     |  2 +-
 migration/migration.c | 11 +----------
 migration/options.c   |  9 +++++++++
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 5509924c57..bf24a0d471 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -412,7 +412,6 @@ bool migrate_postcopy(void);
 
 int migrate_use_tls(void);
 
-bool migrate_use_block_incremental(void);
 int migrate_max_cpu_throttle(void);
 
 uint64_t ram_get_total_transferred_pages(void);
diff --git a/migration/options.h b/migration/options.h
index 1c1f1a6d47..ea45c87cfe 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -47,6 +47,7 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
 
 /* parameters */
 
+bool migrate_block_incremental(void);
 int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
diff --git a/migration/block.c b/migration/block.c
index 2cacd5a184..11541a28ff 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -418,7 +418,7 @@ static int init_blk_migration(QEMUFile *f)
         bmds->bulk_completed = 0;
         bmds->total_sectors = sectors;
         bmds->completed_sectors = 0;
-        bmds->shared_base = migrate_use_block_incremental();
+        bmds->shared_base = migrate_block_incremental();
 
         assert(i < num_bs);
         bmds_bs[i].bmds = bmds;
diff --git a/migration/migration.c b/migration/migration.c
index 713eba06ac..62478ac8c1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2155,7 +2155,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
             error_setg(errp, "No disk migration is required in COLO mode");
             return false;
         }
-        if (migrate_block() || migrate_use_block_incremental()) {
+        if (migrate_block() || migrate_block_incremental()) {
             error_setg(errp, "Command options are incompatible with "
                        "current migration capabilities");
             return false;
@@ -2271,15 +2271,6 @@ int migrate_use_tls(void)
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
diff --git a/migration/options.c b/migration/options.c
index cd5a131c69..b2f15eda6c 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -465,6 +465,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
 
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
-- 
2.39.2


