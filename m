Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD36A86C1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXltp-0000D7-AK; Thu, 02 Mar 2023 11:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltj-0008QA-5u
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXltg-00080l-Km
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfmBlzjZVZw1XdBLtMKc7cikeGp6GAJCTBwc8Cve+Qg=;
 b=VzjwDk056CMntB4lsCJhOZJ7pwhX+wzO6Ji3VUybKbiALnWKwLQTr4nBDMrIH2vwyl3XZe
 RnUxB85/cd+CLEbxy7O9Gm9BAfMwDPULSgYgwmvINgOYf5P3gxIl302cic7eUpDRM8/nw5
 59vU9irjy6muODlrL83yRvXqYRLpItc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-ck18AsNQMXKZo1oyg6A5sQ-1; Thu, 02 Mar 2023 11:35:08 -0500
X-MC-Unique: ck18AsNQMXKZo1oyg6A5sQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECBC9857A84;
 Thu,  2 Mar 2023 16:35:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4EA0492C3E;
 Thu,  2 Mar 2023 16:34:59 +0000 (UTC)
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
Subject: [PATCH 18/43] migration: Move parameters functions to option.c
Date: Thu,  2 Mar 2023 17:33:45 +0100
Message-Id: <20230302163410.11399-19-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h    | 11 -----
 migration/options.h      | 13 ++++++
 migration/migration.c    | 91 ---------------------------------------
 migration/multifd-zlib.c |  1 +
 migration/multifd-zstd.c |  1 +
 migration/options.c      | 93 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 108 insertions(+), 102 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 34fbaa15a3..5509924c57 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -410,24 +410,13 @@ MigrationState *migrate_get_current(void);
 
 bool migrate_postcopy(void);
 
-int migrate_multifd_channels(void);
-MultiFDCompression migrate_multifd_compression(void);
-int migrate_multifd_zlib_level(void);
-int migrate_multifd_zstd_level(void);
-
 int migrate_use_tls(void);
-uint64_t migrate_xbzrle_cache_size(void);
 
 bool migrate_use_block_incremental(void);
 int migrate_max_cpu_throttle(void);
 
 uint64_t ram_get_total_transferred_pages(void);
 
-int migrate_compress_level(void);
-int migrate_compress_threads(void);
-int migrate_compress_wait_thread(void);
-int migrate_decompress_threads(void);
-
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
                           uint32_t value);
diff --git a/migration/options.h b/migration/options.h
index c4ca321b98..1c1f1a6d47 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -45,4 +45,17 @@ bool migrate_zero_copy_send(void);
 bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
 bool migrate_cap_set(int cap, bool value, Error **errp);
 
+/* parameters */
+
+int migrate_compress_level(void);
+int migrate_compress_threads(void);
+int migrate_compress_wait_thread(void);
+int migrate_decompress_threads(void);
+int64_t migrate_max_postcopy_bandwidth(void);
+int migrate_multifd_channels(void);
+MultiFDCompression migrate_multifd_compression(void);
+int migrate_multifd_zlib_level(void);
+int migrate_multifd_zstd_level(void);
+uint64_t migrate_xbzrle_cache_size(void);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 219ca3d37a..a04b323fc7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2262,79 +2262,6 @@ bool migrate_postcopy(void)
     return migrate_postcopy_ram() || migrate_dirty_bitmaps();
 }
 
-int migrate_compress_level(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.compress_level;
-}
-
-int migrate_compress_threads(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.compress_threads;
-}
-
-int migrate_compress_wait_thread(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.compress_wait_thread;
-}
-
-int migrate_decompress_threads(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.decompress_threads;
-}
-
-int migrate_multifd_channels(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.multifd_channels;
-}
-
-MultiFDCompression migrate_multifd_compression(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    assert(s->parameters.multifd_compression < MULTIFD_COMPRESSION__MAX);
-    return s->parameters.multifd_compression;
-}
-
-int migrate_multifd_zlib_level(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.multifd_zlib_level;
-}
-
-int migrate_multifd_zstd_level(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.multifd_zstd_level;
-}
-
 int migrate_use_tls(void)
 {
     MigrationState *s;
@@ -2344,24 +2271,6 @@ int migrate_use_tls(void)
     return s->parameters.tls_creds && *s->parameters.tls_creds;
 }
 
-uint64_t migrate_xbzrle_cache_size(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.xbzrle_cache_size;
-}
-
-static int64_t migrate_max_postcopy_bandwidth(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.max_postcopy_bandwidth;
-}
-
 bool migrate_use_block_incremental(void)
 {
     MigrationState *s;
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 37770248e1..81701250ad 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -18,6 +18,7 @@
 #include "qapi/error.h"
 #include "migration.h"
 #include "trace.h"
+#include "options.h"
 #include "multifd.h"
 
 struct zlib_data {
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index f4a8e1ed1f..d1d29e76cc 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -18,6 +18,7 @@
 #include "qapi/error.h"
 #include "migration.h"
 #include "trace.h"
+#include "options.h"
 #include "multifd.h"
 
 struct zstd_data {
diff --git a/migration/options.c b/migration/options.c
index cd0ffb8a20..cd5a131c69 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -462,3 +462,96 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
         s->capabilities[cap->value->capability] = cap->value->state;
     }
 }
+
+/* parameters */
+
+int migrate_compress_level(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.compress_level;
+}
+
+int migrate_compress_threads(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.compress_threads;
+}
+
+int migrate_compress_wait_thread(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.compress_wait_thread;
+}
+
+int migrate_decompress_threads(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.decompress_threads;
+}
+
+int64_t migrate_max_postcopy_bandwidth(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.max_postcopy_bandwidth;
+}
+
+int migrate_multifd_channels(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.multifd_channels;
+}
+
+MultiFDCompression migrate_multifd_compression(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    assert(s->parameters.multifd_compression < MULTIFD_COMPRESSION__MAX);
+    return s->parameters.multifd_compression;
+}
+
+int migrate_multifd_zlib_level(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.multifd_zlib_level;
+}
+
+int migrate_multifd_zstd_level(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.multifd_zstd_level;
+}
+
+uint64_t migrate_xbzrle_cache_size(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.xbzrle_cache_size;
+}
-- 
2.39.2


