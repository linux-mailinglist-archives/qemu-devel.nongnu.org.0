Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371116A86F9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlxJ-0004HX-N6; Thu, 02 Mar 2023 11:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlx1-00049o-Mf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlwx-0000uH-1V
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677775113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJdy0araoE+mY5BAtKUKaPwA/GLEotVQRpKWQIQig1A=;
 b=L3U5XwQE2tE3HBlAbeW2E8dTCgxRPXf4wt2bjkSz0N+Pr40eMIk1i9ioUq+4LxcZ5Abbxz
 qHBuOjKzFzex/CviCzTivCsBCCQVio8FyTqloFSKmmzkb836uT4iG/X5spAaOjAI3nNNiv
 Qfxb0LEXOxxbpQST/GbJh2NwfuiLd+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-ESosONUyPOy0v5MZ3LAMlw-1; Thu, 02 Mar 2023 11:36:33 -0500
X-MC-Unique: ESosONUyPOy0v5MZ3LAMlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C691100F90D;
 Thu,  2 Mar 2023 16:36:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1509C492C3E;
 Thu,  2 Mar 2023 16:36:10 +0000 (UTC)
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
Subject: [PATCH 36/43] migration: Move migrate_set_block_incremental() to
 options.c
Date: Thu,  2 Mar 2023 17:34:03 +0100
Message-Id: <20230302163410.11399-37-quintela@redhat.com>
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

Once there, make it more regular and remove th eneed for
MigrationState parameter.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h   | 4 ++++
 migration/migration.c | 9 ++-------
 migration/options.c   | 9 +++++++++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 10a59b1172..0fbe294a65 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -84,6 +84,10 @@ int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
+/* parameters setters */
+
+void migrate_set_block_incremental(bool value);
+
 /* parameters helpers */
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
diff --git a/migration/migration.c b/migration/migration.c
index 9db8e09462..f293fb1fd6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1162,17 +1162,12 @@ void migrate_set_state(int *state, int old_state, int new_state)
     }
 }
 
-static void migrate_set_block_incremental(MigrationState *s, bool value)
-{
-    s->parameters.block_incremental = value;
-}
-
 static void block_cleanup_parameters(MigrationState *s)
 {
     if (s->must_remove_block_options) {
         /* setting to false can never fail */
         migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
-        migrate_set_block_incremental(s, false);
+        migrate_set_block_incremental(false);
         s->must_remove_block_options = false;
     }
 }
@@ -1666,7 +1661,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     }
 
     if (blk_inc) {
-        migrate_set_block_incremental(s, true);
+        migrate_set_block_incremental(true);
     }
 
     migrate_init(s);
diff --git a/migration/options.c b/migration/options.c
index 6034443cee..7838515991 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -590,6 +590,15 @@ uint64_t migrate_xbzrle_cache_size(void)
     return s->parameters.xbzrle_cache_size;
 }
 
+/* parameter setters */
+
+void migrate_set_block_incremental(bool value)
+{
+    MigrationState *s = migrate_get_current();
+
+    s->parameters.block_incremental = value;
+}
+
 /* parameters helpers */
 
 AnnounceParameters *migrate_announce_params(void)
-- 
2.39.2


