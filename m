Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527786ED499
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 20:39:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr101-0000QI-Cr; Mon, 24 Apr 2023 14:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zw-0000JK-AS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zj-0005ez-QV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682361175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPBJogRHOixp3KZKB1TK9lokwpKUyot/J9v/7Ob/qWk=;
 b=cFTzc9Qkc0ST3+FTj7/q6Q6tw+4LwzHFw2s8IdBi2yy6GK5gZHUqr1Mqg4qm833to8AgHd
 /PVenABkcXNBltRc8YJOkcY7XOAuwmYcfohQLnsI8ymx+G2hIieEZ062Pk7Bn9qFN+NQut
 /TxM14OieTmbO6XXe7fb4Ybb4dgXtyY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-b__nUaQoNAyFHSO5M7tqIg-1; Mon, 24 Apr 2023 14:32:51 -0400
X-MC-Unique: b__nUaQoNAyFHSO5M7tqIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E908C299E74A;
 Mon, 24 Apr 2023 18:32:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 578B2C15BA0;
 Mon, 24 Apr 2023 18:32:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 06/13] migration: Move migrate_set_block_incremental() to
 options.c
Date: Mon, 24 Apr 2023 20:32:29 +0200
Message-Id: <20230424183236.74561-7-quintela@redhat.com>
In-Reply-To: <20230424183236.74561-1-quintela@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 migration/migration.c | 9 ++-------
 migration/options.c   | 9 +++++++++
 migration/options.h   | 4 ++++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ee8e9416ce..9a42f73aeb 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1164,17 +1164,12 @@ void migrate_set_state(int *state, int old_state, int new_state)
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
@@ -1668,7 +1663,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
     }
 
     if (blk_inc) {
-        migrate_set_block_incremental(s, true);
+        migrate_set_block_incremental(true);
     }
 
     migrate_init(s);
diff --git a/migration/options.c b/migration/options.c
index ba854f613f..37f7051d9d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -586,6 +586,15 @@ uint64_t migrate_xbzrle_cache_size(void)
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
diff --git a/migration/options.h b/migration/options.h
index e982103c0d..d261a25441 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -82,6 +82,10 @@ int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
+/* parameters setters */
+
+void migrate_set_block_incremental(bool value);
+
 /* parameters helpers */
 
 bool migrate_params_check(MigrationParameters *params, Error **errp);
-- 
2.39.2


