Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B576A86D1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltF-0006Ri-Lw; Thu, 02 Mar 2023 11:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt9-0006K2-01
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlt7-0007Go-AP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A9zsSFC4/kM0MDFasX8xKeCT7aacfG5AyYtYcQFRorw=;
 b=O9ka+uu9M1FlV1d+D+EMat0GX1g4s85nfmFcZA3+qB9J9WOdfjTamomh+HHylSm/Wuo+xN
 iJkw4RCIuupmFN+yZuSikx8cj196eB55etXLxT82+6lQPaYtik4kkcjQoCGur4HjhFsFOv
 KdN5jGmBBjIJWbS3Nwoic1vKYGx6iCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-rbNHe_YwP6iCc1mjjCvQng-1; Thu, 02 Mar 2023 11:34:35 -0500
X-MC-Unique: rbNHe_YwP6iCc1mjjCvQng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB2F3C10C92;
 Thu,  2 Mar 2023 16:34:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64EB3492B00;
 Thu,  2 Mar 2023 16:34:32 +0000 (UTC)
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
Subject: [PATCH 09/43] migration: Move migrate_use_zero_copy_send() to
 options.c
Date: Thu,  2 Mar 2023 17:33:36 +0100
Message-Id: <20230302163410.11399-10-quintela@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 migration/migration.h |  5 -----
 migration/options.h   |  1 +
 migration/migration.c | 13 +------------
 migration/multifd.c   |  8 ++++----
 migration/options.c   |  9 +++++++++
 migration/socket.c    |  2 +-
 6 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 19008fae0b..7b82913c62 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -415,11 +415,6 @@ MultiFDCompression migrate_multifd_compression(void);
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
diff --git a/migration/options.h b/migration/options.h
index a4f05a5e13..413ef29a2a 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -34,5 +34,6 @@ bool migrate_postcopy_ram(void);
 bool migrate_release_ram(void);
 bool migrate_validate_uuid(void);
 bool migrate_zero_blocks(void);
+bool migrate_zero_copy_send(void);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 97daab9fd4..48cffab413 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1607,7 +1607,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
     }
 
 #ifdef CONFIG_LINUX
-    if (migrate_use_zero_copy_send() &&
+    if (migrate_zero_copy_send() &&
         ((params->has_multifd_compression && params->multifd_compression) ||
          (params->tls_creds && *params->tls_creds))) {
         error_setg(errp,
@@ -2593,17 +2593,6 @@ int migrate_multifd_zstd_level(void)
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
diff --git a/migration/multifd.c b/migration/multifd.c
index 95127feb8b..29d66f5860 100644
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
 
@@ -944,7 +944,7 @@ int multifd_save_setup(Error **errp)
         p->page_size = qemu_target_page_size();
         p->page_count = page_count;
 
-        if (migrate_use_zero_copy_send()) {
+        if (migrate_zero_copy_send()) {
             p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
         } else {
             p->write_flags = 0;
diff --git a/migration/options.c b/migration/options.c
index 59663c460e..2e00609b7b 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -157,3 +157,12 @@ bool migrate_zero_blocks(void)
 
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


