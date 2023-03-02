Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58076A86FA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:40:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltE-0006R3-Uz; Thu, 02 Mar 2023 11:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt6-0006Ja-5p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt4-0007GP-A1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/p8MKO/JiEqlgCEusWTnSUa7UTtSaJ+G6H9bI7s/llE=;
 b=FXDPiegMrQyiZbvp+ljJ4mySeN20HI91dK1aP1kW607AjbSC9euJir+gYrpIQIz4hPoxPN
 dAfUjyFts1oGTGmGGCj0PZGZcDWkfzogh/SWe9Uk8JpfkEY9khbc5Heebp04BvcpLY5r1S
 UnziSPo4REdhfNfgax1I5SQ/oMMYQ14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-YR_kGV8iPtik5c_19d-sbQ-1; Thu, 02 Mar 2023 11:34:30 -0500
X-MC-Unique: YR_kGV8iPtik5c_19d-sbQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD8A9857A84;
 Thu,  2 Mar 2023 16:34:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C347F492C3E;
 Thu,  2 Mar 2023 16:34:27 +0000 (UTC)
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
Subject: [PATCH 07/43] migration: Move migrate_use_events() to options.c
Date: Thu,  2 Mar 2023 17:33:34 +0100
Message-Id: <20230302163410.11399-8-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_events()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/migration.c | 11 +----------
 migration/options.c   |  9 +++++++++
 migration/ram.c       |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 394728dd44..9d0b1fa45b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -436,7 +436,6 @@ int migrate_compress_level(void);
 int migrate_compress_threads(void);
 int migrate_compress_wait_thread(void);
 int migrate_decompress_threads(void);
-bool migrate_use_events(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/options.h b/migration/options.h
index aa9c165c94..caf3b3aa69 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -23,6 +23,7 @@ bool migrate_background_snapshot(void);
 bool migrate_colo(void);
 bool migrate_compress(void);
 bool migrate_dirty_bitmaps(void);
+bool migrate_events(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
 bool migrate_pause_before_switchover(void);
diff --git a/migration/migration.c b/migration/migration.c
index 661c7c33d8..6c87aab8af 100644
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
@@ -2556,15 +2556,6 @@ int migrate_decompress_threads(void)
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
diff --git a/migration/options.c b/migration/options.c
index d1c44462c5..507b71631e 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -59,6 +59,15 @@ bool migrate_dirty_bitmaps(void)
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
diff --git a/migration/ram.c b/migration/ram.c
index fb868312f4..98ad8e0130 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1252,7 +1252,7 @@ static void migration_bitmap_sync(RAMState *rs)
         rs->num_dirty_pages_period = 0;
         rs->bytes_xfer_prev = stat64_get(&ram_counters.transferred);
     }
-    if (migrate_use_events()) {
+    if (migrate_events()) {
         qapi_event_send_migration_pass(ram_counters.dirty_sync_count);
     }
 }
-- 
2.39.2


