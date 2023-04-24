Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D356ECE25
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:29:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwG9-0000MK-TS; Mon, 24 Apr 2023 09:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFn-0007rq-9K
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFl-0001eX-CK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAzce2EJ087fvLC7TBOC1YGvh71kLDmvPybq4Ac+vT8=;
 b=hkOLbzsfbIW0H7z98xZnX83VaM81+XpVTLedAG05CoSEsOl8KOwjp3BdrS3n1ZCPQuVEEZ
 uXtBh7BFBbL6vD0y3LldQuVkQreQjDqF36aLRQKayq7fl4p6g2WoDfvbBMHZW7dfZjHUG9
 OiSulv7yRR7WoYz0fpfqjWqSCvAQOSY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-qURR1ThGOba7OX2wOm31wg-1; Mon, 24 Apr 2023 09:29:06 -0400
X-MC-Unique: qURR1ThGOba7OX2wOm31wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C71E2823801;
 Mon, 24 Apr 2023 13:29:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B86A614171B8;
 Mon, 24 Apr 2023 13:29:02 +0000 (UTC)
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
 Juan Quintela <quintela@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PULL 30/30] migration: Create migrate_max_bandwidth() function
Date: Mon, 24 Apr 2023 15:27:30 +0200
Message-Id: <20230424132730.70752-31-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 migration/migration.c | 70 +-------------------------------------
 migration/options.c   | 79 +++++++++++++++++++++++++++++++++++++++++++
 migration/options.h   |  1 +
 3 files changed, 81 insertions(+), 69 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index f20d7bcc06..53dd59f6f6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -886,74 +886,6 @@ void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value)
     migrate_send_rp_message(mis, MIG_RP_MSG_RESUME_ACK, sizeof(buf), &buf);
 }
 
-MigrationParameters *qmp_query_migrate_parameters(Error **errp)
-{
-    MigrationParameters *params;
-    MigrationState *s = migrate_get_current();
-
-    /* TODO use QAPI_CLONE() instead of duplicating it inline */
-    params = g_malloc0(sizeof(*params));
-    params->has_compress_level = true;
-    params->compress_level = s->parameters.compress_level;
-    params->has_compress_threads = true;
-    params->compress_threads = s->parameters.compress_threads;
-    params->has_compress_wait_thread = true;
-    params->compress_wait_thread = s->parameters.compress_wait_thread;
-    params->has_decompress_threads = true;
-    params->decompress_threads = s->parameters.decompress_threads;
-    params->has_throttle_trigger_threshold = true;
-    params->throttle_trigger_threshold = s->parameters.throttle_trigger_threshold;
-    params->has_cpu_throttle_initial = true;
-    params->cpu_throttle_initial = s->parameters.cpu_throttle_initial;
-    params->has_cpu_throttle_increment = true;
-    params->cpu_throttle_increment = s->parameters.cpu_throttle_increment;
-    params->has_cpu_throttle_tailslow = true;
-    params->cpu_throttle_tailslow = s->parameters.cpu_throttle_tailslow;
-    params->tls_creds = g_strdup(s->parameters.tls_creds);
-    params->tls_hostname = g_strdup(s->parameters.tls_hostname);
-    params->tls_authz = g_strdup(s->parameters.tls_authz ?
-                                 s->parameters.tls_authz : "");
-    params->has_max_bandwidth = true;
-    params->max_bandwidth = s->parameters.max_bandwidth;
-    params->has_downtime_limit = true;
-    params->downtime_limit = s->parameters.downtime_limit;
-    params->has_x_checkpoint_delay = true;
-    params->x_checkpoint_delay = s->parameters.x_checkpoint_delay;
-    params->has_block_incremental = true;
-    params->block_incremental = s->parameters.block_incremental;
-    params->has_multifd_channels = true;
-    params->multifd_channels = s->parameters.multifd_channels;
-    params->has_multifd_compression = true;
-    params->multifd_compression = s->parameters.multifd_compression;
-    params->has_multifd_zlib_level = true;
-    params->multifd_zlib_level = s->parameters.multifd_zlib_level;
-    params->has_multifd_zstd_level = true;
-    params->multifd_zstd_level = s->parameters.multifd_zstd_level;
-    params->has_xbzrle_cache_size = true;
-    params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
-    params->has_max_postcopy_bandwidth = true;
-    params->max_postcopy_bandwidth = s->parameters.max_postcopy_bandwidth;
-    params->has_max_cpu_throttle = true;
-    params->max_cpu_throttle = s->parameters.max_cpu_throttle;
-    params->has_announce_initial = true;
-    params->announce_initial = s->parameters.announce_initial;
-    params->has_announce_max = true;
-    params->announce_max = s->parameters.announce_max;
-    params->has_announce_rounds = true;
-    params->announce_rounds = s->parameters.announce_rounds;
-    params->has_announce_step = true;
-    params->announce_step = s->parameters.announce_step;
-
-    if (s->parameters.has_block_bitmap_mapping) {
-        params->has_block_bitmap_mapping = true;
-        params->block_bitmap_mapping =
-            QAPI_CLONE(BitmapMigrationNodeAliasList,
-                       s->parameters.block_bitmap_mapping);
-    }
-
-    return params;
-}
-
 /*
  * Return true if we're already in the middle of a migration
  * (i.e. any of the active or setup states)
@@ -3771,7 +3703,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
             XFER_LIMIT_RATIO;
     } else {
         /* This is a fresh new migration */
-        rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
+        rate_limit = migrate_max_bandwidth() / XFER_LIMIT_RATIO;
 
         /* Notify before starting migration thread */
         notifier_list_notify(&migration_state_notifiers, s);
diff --git a/migration/options.c b/migration/options.c
index 8bd2d949ae..8e8753d9be 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -12,8 +12,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/clone-visitor.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/runstate.h"
 #include "migration/misc.h"
@@ -562,6 +564,15 @@ uint8_t migrate_max_cpu_throttle(void)
     return s->parameters.max_cpu_throttle;
 }
 
+uint64_t migrate_max_bandwidth(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.max_bandwidth;
+}
+
 int64_t migrate_max_postcopy_bandwidth(void)
 {
     MigrationState *s;
@@ -641,3 +652,71 @@ AnnounceParameters *migrate_announce_params(void)
 
     return &ap;
 }
+
+MigrationParameters *qmp_query_migrate_parameters(Error **errp)
+{
+    MigrationParameters *params;
+    MigrationState *s = migrate_get_current();
+
+    /* TODO use QAPI_CLONE() instead of duplicating it inline */
+    params = g_malloc0(sizeof(*params));
+    params->has_compress_level = true;
+    params->compress_level = s->parameters.compress_level;
+    params->has_compress_threads = true;
+    params->compress_threads = s->parameters.compress_threads;
+    params->has_compress_wait_thread = true;
+    params->compress_wait_thread = s->parameters.compress_wait_thread;
+    params->has_decompress_threads = true;
+    params->decompress_threads = s->parameters.decompress_threads;
+    params->has_throttle_trigger_threshold = true;
+    params->throttle_trigger_threshold = s->parameters.throttle_trigger_threshold;
+    params->has_cpu_throttle_initial = true;
+    params->cpu_throttle_initial = s->parameters.cpu_throttle_initial;
+    params->has_cpu_throttle_increment = true;
+    params->cpu_throttle_increment = s->parameters.cpu_throttle_increment;
+    params->has_cpu_throttle_tailslow = true;
+    params->cpu_throttle_tailslow = s->parameters.cpu_throttle_tailslow;
+    params->tls_creds = g_strdup(s->parameters.tls_creds);
+    params->tls_hostname = g_strdup(s->parameters.tls_hostname);
+    params->tls_authz = g_strdup(s->parameters.tls_authz ?
+                                 s->parameters.tls_authz : "");
+    params->has_max_bandwidth = true;
+    params->max_bandwidth = s->parameters.max_bandwidth;
+    params->has_downtime_limit = true;
+    params->downtime_limit = s->parameters.downtime_limit;
+    params->has_x_checkpoint_delay = true;
+    params->x_checkpoint_delay = s->parameters.x_checkpoint_delay;
+    params->has_block_incremental = true;
+    params->block_incremental = s->parameters.block_incremental;
+    params->has_multifd_channels = true;
+    params->multifd_channels = s->parameters.multifd_channels;
+    params->has_multifd_compression = true;
+    params->multifd_compression = s->parameters.multifd_compression;
+    params->has_multifd_zlib_level = true;
+    params->multifd_zlib_level = s->parameters.multifd_zlib_level;
+    params->has_multifd_zstd_level = true;
+    params->multifd_zstd_level = s->parameters.multifd_zstd_level;
+    params->has_xbzrle_cache_size = true;
+    params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
+    params->has_max_postcopy_bandwidth = true;
+    params->max_postcopy_bandwidth = s->parameters.max_postcopy_bandwidth;
+    params->has_max_cpu_throttle = true;
+    params->max_cpu_throttle = s->parameters.max_cpu_throttle;
+    params->has_announce_initial = true;
+    params->announce_initial = s->parameters.announce_initial;
+    params->has_announce_max = true;
+    params->announce_max = s->parameters.announce_max;
+    params->has_announce_rounds = true;
+    params->announce_rounds = s->parameters.announce_rounds;
+    params->has_announce_step = true;
+    params->announce_step = s->parameters.announce_step;
+
+    if (s->parameters.has_block_bitmap_mapping) {
+        params->has_block_bitmap_mapping = true;
+        params->block_bitmap_mapping =
+            QAPI_CLONE(BitmapMigrationNodeAliasList,
+                       s->parameters.block_bitmap_mapping);
+    }
+
+    return params;
+}
diff --git a/migration/options.h b/migration/options.h
index 093bc907a1..1b78fa9f3d 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -64,6 +64,7 @@ uint8_t migrate_cpu_throttle_initial(void);
 bool migrate_cpu_throttle_tailslow(void);
 int migrate_decompress_threads(void);
 uint8_t migrate_max_cpu_throttle(void);
+uint64_t migrate_max_bandwidth(void);
 int64_t migrate_max_postcopy_bandwidth(void);
 int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
-- 
2.39.2


