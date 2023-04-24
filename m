Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D786ECF56
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:40:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwF4-0006kv-SD; Mon, 24 Apr 2023 09:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEi-0006UK-Pj
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEf-0001Ke-1Y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOqQ3mEQyXxMfcm7V3aOqynSHUTQaxXWKv+Y9TcpCqE=;
 b=HdSCHUyhHBoIOlLsS2/mcY1zgXXZvZ0r8ZhVeYa8iShfOH0pSLE56nHgW8pifQv96N12aX
 vzwutFiUXgGx325WWWsMD6wG4peLiP8sYzeHHrhBekF34gYsqFeH0sxDyixmK69pjozEQ5
 S7APXF0K73C0/ik0iS8vJuOGmfIc18o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-UjKFJfjyNb2epSX6OP6prQ-1; Mon, 24 Apr 2023 09:28:00 -0400
X-MC-Unique: UjKFJfjyNb2epSX6OP6prQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58B793C10EC7;
 Mon, 24 Apr 2023 13:28:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7A3F14171BA;
 Mon, 24 Apr 2023 13:27:56 +0000 (UTC)
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
Subject: [PULL 08/30] migration: Move migrate_use_events() to options.c
Date: Mon, 24 Apr 2023 15:27:08 +0200
Message-Id: <20230424132730.70752-9-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Once that we are there, we rename the function to migrate_events()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 11 +----------
 migration/migration.h |  1 -
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 migration/ram.c       |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2c409fa27c..16800a624a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -353,7 +353,7 @@ void migration_incoming_state_destroy(void)
 
 static void migrate_generate_event(int new_state)
 {
-    if (migrate_use_events()) {
+    if (migrate_events()) {
         qapi_event_send_migration(new_state);
     }
 }
@@ -2558,15 +2558,6 @@ int migrate_decompress_threads(void)
     return s->parameters.decompress_threads;
 }
 
-bool migrate_use_events(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_EVENTS];
-}
-
 bool migrate_use_multifd(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 77aa91c840..bd06520c19 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -475,7 +475,6 @@ int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
-bool migrate_use_events(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/options.c b/migration/options.c
index fa7a13d3dc..d2219ee0e4 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -57,6 +57,15 @@ bool migrate_dirty_bitmaps(void)
     return s->capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
 }
 
+bool migrate_events(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_EVENTS];
+}
+
 bool migrate_ignore_shared(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index da2193fd94..b998024eba 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -21,6 +21,7 @@ bool migrate_background_snapshot(void);
 bool migrate_colo(void);
 bool migrate_compress(void);
 bool migrate_dirty_bitmaps(void);
+bool migrate_events(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
 bool migrate_pause_before_switchover(void);
diff --git a/migration/ram.c b/migration/ram.c
index d050d0c5fd..ee454a3849 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1246,7 +1246,7 @@ static void migration_bitmap_sync(RAMState *rs)
         rs->num_dirty_pages_period = 0;
         rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
     }
-    if (migrate_use_events()) {
+    if (migrate_events()) {
         uint64_t generation = stat64_get(&ram_counters.dirty_sync_count);
         qapi_event_send_migration_pass(generation);
     }
-- 
2.39.2


