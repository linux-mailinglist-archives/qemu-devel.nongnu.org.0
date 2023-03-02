Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023D6A86C9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltL-0006vC-EU; Thu, 02 Mar 2023 11:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltJ-0006kf-1b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltH-0007Jd-IX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LM6fOWW5Jv3JQzsSp8Kvb6okLlcueio9Mo4TxpP4LAM=;
 b=gsg+PJ3FtsUIWkoHHpVvxPfcGbiskIjDUjvzyJhtDhnkpJ09HdKlnMruNm4D8OegAsJq85
 CQ8UteXBVJQb4rZHWzwF1yOOFR/oQwi4LMJ6vKkcGaNl2toqCcH4rZUU/NaLXZPDK3JI/B
 +yee/pKNawz8KfZpwBQVLRg4fe5gpCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-8hZz5S3_OUicekLhqVIdyw-1; Thu, 02 Mar 2023 11:34:41 -0500
X-MC-Unique: 8hZz5S3_OUicekLhqVIdyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D7D329A9CA4;
 Thu,  2 Mar 2023 16:34:41 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DE42492B00;
 Thu,  2 Mar 2023 16:34:39 +0000 (UTC)
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
Subject: [PATCH 12/43] migration: Move migrate_use_return() to options.c
Date: Thu,  2 Mar 2023 17:33:39 +0100
Message-Id: <20230302163410.11399-13-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_return_path()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/migration.c | 11 +----------
 migration/options.c   |  9 +++++++++
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index ecd6f7658d..34fbaa15a3 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -420,7 +420,6 @@ uint64_t migrate_xbzrle_cache_size(void);
 
 bool migrate_use_block_incremental(void);
 int migrate_max_cpu_throttle(void);
-bool migrate_use_return_path(void);
 
 uint64_t ram_get_total_transferred_pages(void);
 
diff --git a/migration/options.h b/migration/options.h
index 541a4a2026..51c7f2a043 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -33,6 +33,7 @@ bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
 bool migrate_postcopy_ram(void);
 bool migrate_release_ram(void);
+bool migrate_return_path(void);
 bool migrate_validate_uuid(void);
 bool migrate_xbzrle(void);
 bool migrate_zero_blocks(void);
diff --git a/migration/migration.c b/migration/migration.c
index 66847e52cc..8424eaf2e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2620,15 +2620,6 @@ static int64_t migrate_max_postcopy_bandwidth(void)
     return s->parameters.max_postcopy_bandwidth;
 }
 
-bool migrate_use_return_path(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
-}
-
 bool migrate_use_block_incremental(void)
 {
     MigrationState *s;
@@ -4167,7 +4158,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
      * precopy, only if user specified "return-path" capability would
      * QEMU uses the return path.
      */
-    if (migrate_postcopy_ram() || migrate_use_return_path()) {
+    if (migrate_postcopy_ram() || migrate_return_path()) {
         if (open_return_path_on_source(s, !resume)) {
             error_report("Unable to open return-path for postcopy");
             migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
diff --git a/migration/options.c b/migration/options.c
index 66735c1cd9..c1182bf01a 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -149,6 +149,15 @@ bool migrate_release_ram(void)
     return s->capabilities[MIGRATION_CAPABILITY_RELEASE_RAM];
 }
 
+bool migrate_return_path(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_RETURN_PATH];
+}
+
 bool migrate_validate_uuid(void)
 {
     MigrationState *s;
-- 
2.39.2


