Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09FD557711
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:48:41 +0200 (CEST)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4JS4-0001Lj-6P
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8j-0000PB-0Y
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8S-0004sL-B5
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLPVE62NxXG9LH47QW/57qaPPZAVyugkyDQy6DkO4CU=;
 b=MLI9N0mtawZQkbp/mbQ6Kz1RtvKb8934yWnU1noEgJ1lkpUaG5z/dyE+I4Fv4agvG20jva
 rInAr5/4XOWS2CbDm1HEPnxh0WhJb7nAnhJgrKFXKpaWY7il+2kCJesSMAaTiFuVhGQG1i
 GOqIIy5N8sa/EG01hP/Z5lD/nVvWymA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-poS8dvqkNGOV2QsLjPa7Nw-1; Thu, 23 Jun 2022 05:28:21 -0400
X-MC-Unique: poS8dvqkNGOV2QsLjPa7Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D92185A7B2;
 Thu, 23 Jun 2022 09:28:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A7B40C1289;
 Thu, 23 Jun 2022 09:28:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 04/33] migration: Change zero_copy_send from migration
 parameter to migration capability
Date: Thu, 23 Jun 2022 10:27:41 +0100
Message-Id: <20220623092810.96234-5-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Bras <leobras@redhat.com>

When originally implemented, zero_copy_send was designed as a Migration
paramenter.

But taking into account how is that supposed to work, and how
the difference between a capability and a parameter, it only makes sense
that zero-copy-send would work better as a capability.

Taking into account how recently the change got merged, it was decided
that it's still time to make it right, and convert zero_copy_send into
a Migration capability.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: always define the capability, even on non-Linux but error if
set; avoids build problems with the capability
---
 migration/migration.c | 58 +++++++++++++++++++------------------------
 monitor/hmp-cmds.c    |  6 -----
 qapi/migration.json   | 33 +++++++-----------------
 3 files changed, 34 insertions(+), 63 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 31739b2af9..5863af1b13 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -163,7 +163,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
     MIGRATION_CAPABILITY_COMPRESS,
     MIGRATION_CAPABILITY_XBZRLE,
     MIGRATION_CAPABILITY_X_COLO,
-    MIGRATION_CAPABILITY_VALIDATE_UUID);
+    MIGRATION_CAPABILITY_VALIDATE_UUID,
+    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
 
 /* When we add fault tolerance, we could have several
    migrations at once.  For now we don't need to add
@@ -910,10 +911,6 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->multifd_zlib_level = s->parameters.multifd_zlib_level;
     params->has_multifd_zstd_level = true;
     params->multifd_zstd_level = s->parameters.multifd_zstd_level;
-#ifdef CONFIG_LINUX
-    params->has_zero_copy_send = true;
-    params->zero_copy_send = s->parameters.zero_copy_send;
-#endif
     params->has_xbzrle_cache_size = true;
     params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
     params->has_max_postcopy_bandwidth = true;
@@ -1275,6 +1272,24 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+#ifdef CONFIG_LINUX
+    if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
+        (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
+         migrate_use_compression() ||
+         migrate_use_tls())) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#else
+    if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
+        error_setg(errp,
+                   "Zero copy currently only available on Linux");
+        return false;
+    }
+#endif
+
+
     /* incoming side only */
     if (runstate_check(RUN_STATE_INMIGRATE) &&
         !migrate_multi_channels_is_allowed() &&
@@ -1497,16 +1512,6 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
         return false;
     }
-#ifdef CONFIG_LINUX
-    if (params->zero_copy_send &&
-        (!migrate_use_multifd() ||
-         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
-         (params->tls_creds && *params->tls_creds))) {
-        error_setg(errp,
-                   "Zero copy only available for non-compressed non-TLS multifd migration");
-        return false;
-    }
-#endif
     return true;
 }
 
@@ -1580,11 +1585,6 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
-#ifdef CONFIG_LINUX
-    if (params->has_zero_copy_send) {
-        dest->zero_copy_send = params->zero_copy_send;
-    }
-#endif
     if (params->has_xbzrle_cache_size) {
         dest->xbzrle_cache_size = params->xbzrle_cache_size;
     }
@@ -1697,11 +1697,6 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
-#ifdef CONFIG_LINUX
-    if (params->has_zero_copy_send) {
-        s->parameters.zero_copy_send = params->zero_copy_send;
-    }
-#endif
     if (params->has_xbzrle_cache_size) {
         s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
         xbzrle_cache_resize(params->xbzrle_cache_size, errp);
@@ -2593,7 +2588,7 @@ bool migrate_use_zero_copy_send(void)
 
     s = migrate_get_current();
 
-    return s->parameters.zero_copy_send;
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
 }
 #endif
 
@@ -4249,10 +4244,6 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT8("multifd-zstd-level", MigrationState,
                       parameters.multifd_zstd_level,
                       DEFAULT_MIGRATE_MULTIFD_ZSTD_LEVEL),
-#ifdef CONFIG_LINUX
-    DEFINE_PROP_BOOL("zero_copy_send", MigrationState,
-                      parameters.zero_copy_send, false),
-#endif
     DEFINE_PROP_SIZE("xbzrle-cache-size", MigrationState,
                       parameters.xbzrle_cache_size,
                       DEFAULT_MIGRATE_XBZRLE_CACHE_SIZE),
@@ -4290,6 +4281,10 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
     DEFINE_PROP_MIG_CAP("x-background-snapshot",
             MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
+#ifdef CONFIG_LINUX
+    DEFINE_PROP_MIG_CAP("x-zero-copy-send",
+            MIGRATION_CAPABILITY_ZERO_COPY_SEND),
+#endif
 
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -4350,9 +4345,6 @@ static void migration_instance_init(Object *obj)
     params->has_multifd_compression = true;
     params->has_multifd_zlib_level = true;
     params->has_multifd_zstd_level = true;
-#ifdef CONFIG_LINUX
-    params->has_zero_copy_send = true;
-#endif
     params->has_xbzrle_cache_size = true;
     params->has_max_postcopy_bandwidth = true;
     params->has_max_cpu_throttle = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 47a27326ee..ca98df0495 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1311,12 +1311,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_multifd_zstd_level = true;
         visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
         break;
-#ifdef CONFIG_LINUX
-    case MIGRATION_PARAMETER_ZERO_COPY_SEND:
-        p->has_zero_copy_send = true;
-        visit_type_bool(v, param, &p->zero_copy_send, &err);
-        break;
-#endif
     case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
         p->has_xbzrle_cache_size = true;
         if (!visit_type_size(v, param, &cache_size, &err)) {
diff --git a/qapi/migration.json b/qapi/migration.json
index 6130cd9fae..7102e474a6 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -461,6 +461,13 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# @zero-copy-send: Controls behavior on sending memory pages on migration.
+#                  When true, enables a zero-copy mechanism for sending
+#                  memory pages, if host supports it.
+#                  Requires that QEMU be permitted to use locked memory
+#                  for guest RAM pages.
+#                  (since 7.1)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -474,7 +481,8 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot'] }
+           'validate-uuid', 'background-snapshot',
+           'zero-copy-send'] }
 
 ##
 # @MigrationCapabilityStatus:
@@ -738,12 +746,6 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
-# @zero-copy-send: Controls behavior on sending memory pages on migration.
-#                  When true, enables a zero-copy mechanism for sending
-#                  memory pages, if host supports it.
-#                  Requires that QEMU be permitted to use locked memory
-#                  for guest RAM pages.
-#                  Defaults to false. (Since 7.1)
 #
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
@@ -784,7 +786,6 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level' ,'multifd-zstd-level',
-           { 'name': 'zero-copy-send', 'if' : 'CONFIG_LINUX'},
            'block-bitmap-mapping' ] }
 
 ##
@@ -911,13 +912,6 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
-# @zero-copy-send: Controls behavior on sending memory pages on migration.
-#                  When true, enables a zero-copy mechanism for sending
-#                  memory pages, if host supports it.
-#                  Requires that QEMU be permitted to use locked memory
-#                  for guest RAM pages.
-#                  Defaults to false. (Since 7.1)
-#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -972,7 +966,6 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
@@ -1119,13 +1112,6 @@
 #                      will consume more CPU.
 #                      Defaults to 1. (Since 5.0)
 #
-# @zero-copy-send: Controls behavior on sending memory pages on migration.
-#                  When true, enables a zero-copy mechanism for sending
-#                  memory pages, if host supports it.
-#                  Requires that QEMU be permitted to use locked memory
-#                  for guest RAM pages.
-#                  Defaults to false. (Since 7.1)
-#
 # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
 #                        aliases for the purpose of dirty bitmap migration.  Such
 #                        aliases may for example be the corresponding names on the
@@ -1178,7 +1164,6 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*zero-copy-send': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
 
 ##
-- 
2.36.1


