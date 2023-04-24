Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43806ECE60
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:31:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwFq-0007zx-Ed; Mon, 24 Apr 2023 09:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEl-0006Vs-Cn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwEj-0001Ok-LM
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dA1YRXtNehBHbK3vNPyVEoRiAwSluNyC6adRuCvp5jQ=;
 b=Y9/KbSNnYQGpShToOWqsFLJdWCqRj0iCmzvMuPjDARu5FjQ9rNWA8UrwXAuhHX6iBL4mcl
 w/6iu8bPmoODejEoKMgkBOjzD2cn3g2MZLxbr6rGLr0r+1PzG7KJY/h2aCbi/pXFMLvtVL
 /cgx5XqEMhJ9ybb92/Jjozjjc4wZ+WQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-4_G4hZH9NJK6PxK-rOTRxQ-1; Mon, 24 Apr 2023 09:28:03 -0400
X-MC-Unique: 4_G4hZH9NJK6PxK-rOTRxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E9963815F7B;
 Mon, 24 Apr 2023 13:28:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9777F14171B8;
 Mon, 24 Apr 2023 13:28:00 +0000 (UTC)
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
Subject: [PULL 09/30] migration: Move migrate_use_multifd() to options.c
Date: Mon, 24 Apr 2023 15:27:09 +0200
Message-Id: <20230424132730.70752-10-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_multifd()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 19 +++++--------------
 migration/migration.h |  1 -
 migration/multifd.c   | 16 ++++++++--------
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 migration/ram.c       |  2 +-
 migration/socket.c    |  2 +-
 7 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 16800a624a..77ceacc59f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -186,7 +186,7 @@ static void migrate_fd_cancel(MigrationState *s);
 
 static bool migration_needs_multiple_sockets(void)
 {
-    return migrate_use_multifd() || migrate_postcopy_preempt();
+    return migrate_multifd() || migrate_postcopy_preempt();
 }
 
 static bool uri_supports_multi_channels(const char *uri)
@@ -732,7 +732,7 @@ void migration_fd_process_incoming(QEMUFile *f, Error **errp)
 static bool migration_should_start_incoming(bool main_channel)
 {
     /* Multifd doesn't start unless all channels are established */
-    if (migrate_use_multifd()) {
+    if (migrate_multifd()) {
         return migration_has_all_channels();
     }
 
@@ -759,7 +759,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
     uint32_t channel_magic = 0;
     int ret = 0;
 
-    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+    if (migrate_multifd() && !migrate_postcopy_ram() &&
         qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
         /*
          * With multiple channels, it is possible that we receive channels
@@ -798,7 +798,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
-        if (migrate_use_multifd()) {
+        if (migrate_multifd()) {
             multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
@@ -834,7 +834,7 @@ bool migration_has_all_channels(void)
         return false;
     }
 
-    if (migrate_use_multifd()) {
+    if (migrate_multifd()) {
         return multifd_recv_all_channels_created();
     }
 
@@ -2558,15 +2558,6 @@ int migrate_decompress_threads(void)
     return s->parameters.decompress_threads;
 }
 
-bool migrate_use_multifd(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
-}
-
 int migrate_multifd_channels(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index bd06520c19..49c0e13f41 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -449,7 +449,6 @@ MigrationState *migrate_get_current(void);
 
 bool migrate_postcopy(void);
 
-bool migrate_use_multifd(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
diff --git a/migration/multifd.c b/migration/multifd.c
index 903df2117b..6807328189 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -516,7 +516,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -587,7 +587,7 @@ int multifd_send_sync_main(QEMUFile *f)
     int i;
     bool flush_zero_copy;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return 0;
     }
     if (multifd_send_state->pages->num) {
@@ -911,7 +911,7 @@ int multifd_save_setup(Error **errp)
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return 0;
     }
 
@@ -1016,7 +1016,7 @@ static void multifd_recv_terminate_threads(Error *err)
 
 void multifd_load_shutdown(void)
 {
-    if (migrate_use_multifd()) {
+    if (migrate_multifd()) {
         multifd_recv_terminate_threads(NULL);
     }
 }
@@ -1025,7 +1025,7 @@ void multifd_load_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1072,7 +1072,7 @@ void multifd_recv_sync_main(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return;
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1170,7 +1170,7 @@ int multifd_load_setup(Error **errp)
      * Return successfully if multiFD recv state is already initialised
      * or multiFD is not enabled.
      */
-    if (multifd_recv_state || !migrate_use_multifd()) {
+    if (multifd_recv_state || !migrate_multifd()) {
         return 0;
     }
 
@@ -1216,7 +1216,7 @@ bool multifd_recv_all_channels_created(void)
 {
     int thread_count = migrate_multifd_channels();
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return true;
     }
 
diff --git a/migration/options.c b/migration/options.c
index d2219ee0e4..58673fc101 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -84,6 +84,15 @@ bool migrate_late_block_activate(void)
     return s->capabilities[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE];
 }
 
+bool migrate_multifd(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_MULTIFD];
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index b998024eba..d07269ee38 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -24,6 +24,7 @@ bool migrate_dirty_bitmaps(void);
 bool migrate_events(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
+bool migrate_multifd(void);
 bool migrate_pause_before_switchover(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
diff --git a/migration/ram.c b/migration/ram.c
index ee454a3849..859dd7b63f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2362,7 +2362,7 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
      * if host page size == guest page size the dest guest during run may
      * still see partially copied pages which is data corruption.
      */
-    if (migrate_use_multifd() && !migration_in_postcopy()) {
+    if (migrate_multifd() && !migration_in_postcopy()) {
         return ram_save_multifd_page(pss->pss_channel, block, offset);
     }
 
diff --git a/migration/socket.c b/migration/socket.c
index ebf9ac41af..f4835a256a 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -183,7 +183,7 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
 
     qio_net_listener_set_name(listener, "migration-socket-listener");
 
-    if (migrate_use_multifd()) {
+    if (migrate_multifd()) {
         num = migrate_multifd_channels();
     } else if (migrate_postcopy_preempt()) {
         num = RAM_CHANNEL_MAX;
-- 
2.39.2


