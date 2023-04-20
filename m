Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE86E9619
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:43:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWd-0003yA-8Z; Thu, 20 Apr 2023 09:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWb-0003xJ-9R
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWY-0005mM-GJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxKHi/IoxvF9Uw4va4Ge9DHM89puqo4EbUxS6NA3fTY=;
 b=a4/AXdsoDxRqcx3J9oD59l6KyST1LeKl6tHi297t4OUZvuR1laqO2Fv90Rb9T0AHfT6Ih6
 0mV+tmDI5NZQqVNlh3KsSxUVm4X/CaD4LPtENdF+KXywkhBnJUqqhbI3hGt4riE7+J1MLQ
 p+7KMfpwTfhRB+P09vdEoKSuY/avsYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-lY4wwrAVPeOusCpD17wIBw-1; Thu, 20 Apr 2023 09:40:32 -0400
X-MC-Unique: lY4wwrAVPeOusCpD17wIBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B540C8028A5;
 Thu, 20 Apr 2023 13:40:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 279F14020BED;
 Thu, 20 Apr 2023 13:40:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 08/43] migration: Move migrate_use_multifd() to options.c
Date: Thu, 20 Apr 2023 15:39:27 +0200
Message-Id: <20230420134002.29531-9-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
index de797c4114..465b7ba5a5 100644
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
 
@@ -2559,15 +2559,6 @@ int migrate_decompress_threads(void)
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
index 663f20d6f0..f2341e25f2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2364,7 +2364,7 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
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


