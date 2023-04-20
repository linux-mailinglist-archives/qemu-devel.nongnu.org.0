Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A27B6E9607
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:41:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUWi-00042K-ER; Thu, 20 Apr 2023 09:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWg-00041c-Q0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUWc-0005ng-3L
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9IuF7Cqxone8erMv1YEL2OagXSlhKaIjTkV6mjrdCI=;
 b=DZ78K3vzJRyRL4LkFtkwUjwTC1WBd0otNTeH0e3nbWeQhGhP5kRcZV1PYmmmIPDdACnJvD
 SCDqsVJLPG1DZkhtClF1boj6doW9qZaDbyoOsKLJ82L2aYGlIkb1kf/igqsQRGATNwVzX8
 a0Xoab5F1i4JKxpxzhdduJ1AnGfhcUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519--a4cJJTzMqehau7o0vC0AQ-1; Thu, 20 Apr 2023 09:40:33 -0400
X-MC-Unique: -a4cJJTzMqehau7o0vC0AQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD4E0185A7A4;
 Thu, 20 Apr 2023 13:40:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04ADC4020BF1;
 Thu, 20 Apr 2023 13:40:29 +0000 (UTC)
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
Subject: [PATCH v2 09/43] migration: Move migrate_use_zero_copy_send() to
 options.c
Date: Thu, 20 Apr 2023 15:39:28 +0200
Message-Id: <20230420134002.29531-10-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Once that we are there, we rename the function to
migrate_zero_copy_send() to be consistent with all other capabilities.

We can remove the CONFIG_LINUX guard.  We already check that we can't
setup this capability in migrate_caps_check().

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 13 +------------
 migration/migration.h |  5 -----
 migration/multifd.c   |  8 ++++----
 migration/options.c   |  9 +++++++++
 migration/options.h   |  1 +
 migration/socket.c    |  2 +-
 6 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 465b7ba5a5..a17b1598dc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1610,7 +1610,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
     }
 
 #ifdef CONFIG_LINUX
-    if (migrate_use_zero_copy_send() &&
+    if (migrate_zero_copy_send() &&
         ((params->has_multifd_compression && params->multifd_compression) ||
          (params->tls_creds && *params->tls_creds))) {
         error_setg(errp,
@@ -2596,17 +2596,6 @@ int migrate_multifd_zstd_level(void)
     return s->parameters.multifd_zstd_level;
 }
 
-#ifdef CONFIG_LINUX
-bool migrate_use_zero_copy_send(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
-}
-#endif
-
 int migrate_use_tls(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 49c0e13f41..c939f82d53 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -454,11 +454,6 @@ MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
 
-#ifdef CONFIG_LINUX
-bool migrate_use_zero_copy_send(void);
-#else
-#define migrate_use_zero_copy_send() (false)
-#endif
 int migrate_use_tls(void);
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
diff --git a/migration/multifd.c b/migration/multifd.c
index 6807328189..cce3ad6988 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -25,7 +25,7 @@
 #include "trace.h"
 #include "multifd.h"
 #include "threadinfo.h"
-
+#include "options.h"
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
 #include "yank_functions.h"
@@ -608,7 +608,7 @@ int multifd_send_sync_main(QEMUFile *f)
      * all the dirty bitmaps.
      */
 
-    flush_zero_copy = migrate_use_zero_copy_send();
+    flush_zero_copy = migrate_zero_copy_send();
 
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
@@ -653,7 +653,7 @@ static void *multifd_send_thread(void *opaque)
     MigrationThread *thread = NULL;
     Error *local_err = NULL;
     int ret = 0;
-    bool use_zero_copy_send = migrate_use_zero_copy_send();
+    bool use_zero_copy_send = migrate_zero_copy_send();
 
     thread = MigrationThreadAdd(p->name, qemu_get_thread_id());
 
@@ -945,7 +945,7 @@ int multifd_save_setup(Error **errp)
         p->page_size = qemu_target_page_size();
         p->page_count = page_count;
 
-        if (migrate_use_zero_copy_send()) {
+        if (migrate_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
         } else {
             p->write_flags = 0;
diff --git a/migration/options.c b/migration/options.c
index 58673fc101..f357c99996 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -155,3 +155,12 @@ bool migrate_zero_blocks(void)
 
     return s->capabilities[MIGRATION_CAPABILITY_ZERO_BLOCKS];
 }
+
+bool migrate_zero_copy_send(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
+}
diff --git a/migration/options.h b/migration/options.h
index d07269ee38..ad22f4d24a 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -32,5 +32,6 @@ bool migrate_postcopy_ram(void);
 bool migrate_release_ram(void);
 bool migrate_validate_uuid(void);
 bool migrate_zero_blocks(void);
+bool migrate_zero_copy_send(void);
 
 #endif
diff --git a/migration/socket.c b/migration/socket.c
index f4835a256a..1b6f5baefb 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -98,7 +98,7 @@ static void socket_outgoing_migration(QIOTask *task,
 
     trace_migration_socket_outgoing_connected(data->hostname);
 
-    if (migrate_use_zero_copy_send() &&
+    if (migrate_zero_copy_send() &&
         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
         error_setg(&err, "Zero copy send feature not detected in host kernel");
     }
-- 
2.39.2


