Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9AD6A86C2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltH-0006YJ-5x; Thu, 02 Mar 2023 11:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltF-0006TB-Pj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltD-0007Io-RV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fer3j9NtghzJYSkTE1TqfTK5BJVt+M9orsQGr13PCpU=;
 b=AJp9jMwhkttpSQobFQ1muMlKLEQk9GOcvSRt/dNYZgYdX6x0xTEu+0urNV1cf0vLzQztMS
 1+zvL/sSE/3TaAl3wnVFi9OeJIU70b0KxJzjL2mcqqRjQjS6iWqSjul4VFJH7XDbStT4BA
 dMHOJhdsORNBdAmT1jBD3uSYLqJDbA0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-rl03NQWzNRuuCTWPkiayCw-1; Thu, 02 Mar 2023 11:34:32 -0500
X-MC-Unique: rl03NQWzNRuuCTWPkiayCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A341280048A;
 Thu,  2 Mar 2023 16:34:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F55E492C3E;
 Thu,  2 Mar 2023 16:34:29 +0000 (UTC)
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
Subject: [PATCH 08/43] migration: Move migrate_use_multifd() to options.c
Date: Thu,  2 Mar 2023 17:33:35 +0100
Message-Id: <20230302163410.11399-9-quintela@redhat.com>
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

Once that we are there, we rename the function to migrate_multifd()
to be consistent with all other capabilities.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  1 -
 migration/options.h   |  1 +
 migration/migration.c | 19 +++++--------------
 migration/multifd.c   | 16 ++++++++--------
 migration/options.c   |  9 +++++++++
 migration/ram.c       |  2 +-
 migration/socket.c    |  2 +-
 7 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 9d0b1fa45b..19008fae0b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -410,7 +410,6 @@ MigrationState *migrate_get_current(void);
 
 bool migrate_postcopy(void);
 
-bool migrate_use_multifd(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
diff --git a/migration/options.h b/migration/options.h
index caf3b3aa69..a4f05a5e13 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -26,6 +26,7 @@ bool migrate_dirty_bitmaps(void);
 bool migrate_events(void);
 bool migrate_ignore_shared(void);
 bool migrate_late_block_activate(void);
+bool migrate_multifd(void);
 bool migrate_pause_before_switchover(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
diff --git a/migration/migration.c b/migration/migration.c
index 6c87aab8af..97daab9fd4 100644
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
 
@@ -2556,15 +2556,6 @@ int migrate_decompress_threads(void)
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
diff --git a/migration/multifd.c b/migration/multifd.c
index 91552d33bf..95127feb8b 100644
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
@@ -910,7 +910,7 @@ int multifd_save_setup(Error **errp)
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return 0;
     }
 
@@ -1015,7 +1015,7 @@ static void multifd_recv_terminate_threads(Error *err)
 
 void multifd_load_shutdown(void)
 {
-    if (migrate_use_multifd()) {
+    if (migrate_multifd()) {
         multifd_recv_terminate_threads(NULL);
     }
 }
@@ -1024,7 +1024,7 @@ void multifd_load_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1071,7 +1071,7 @@ void multifd_recv_sync_main(void)
 {
     int i;
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return;
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1169,7 +1169,7 @@ int multifd_load_setup(Error **errp)
      * Return successfully if multiFD recv state is already initialised
      * or multiFD is not enabled.
      */
-    if (multifd_recv_state || !migrate_use_multifd()) {
+    if (multifd_recv_state || !migrate_multifd()) {
         return 0;
     }
 
@@ -1215,7 +1215,7 @@ bool multifd_recv_all_channels_created(void)
 {
     int thread_count = migrate_multifd_channels();
 
-    if (!migrate_use_multifd()) {
+    if (!migrate_multifd()) {
         return true;
     }
 
diff --git a/migration/options.c b/migration/options.c
index 507b71631e..59663c460e 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -86,6 +86,15 @@ bool migrate_late_block_activate(void)
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
diff --git a/migration/ram.c b/migration/ram.c
index 98ad8e0130..59a624f59a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2368,7 +2368,7 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
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


