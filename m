Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF0E6F0284
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwxD-0001K3-E1; Thu, 27 Apr 2023 04:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwxB-0001Jm-Bu
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx7-0001Fn-Dq
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r49GhQxzXX7Zk2fCZWIDoDXJGCAHCiemWIaNzj9NuPo=;
 b=NZMsNt31CFBp/fvb2ZckZefvy79pbYJ4zTy2GVwoVVtvYYtyHJ6DPHgDDvsS9O9PSFXdPZ
 OGQBkUZPHgx19G9SnFfcRdAjd1G+0LnOMw2/mc8wX0vJFgDhQ+Thd0qI4L+CyV9v+OgSNh
 +qqA8LvOpGMJ3mw0NuitJiys0pRd3aM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-VdsvSq-wPyCGiHQl6j_Eyw-1; Thu, 27 Apr 2023 04:26:07 -0400
X-MC-Unique: VdsvSq-wPyCGiHQl6j_Eyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADF0EA0F380;
 Thu, 27 Apr 2023 08:26:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2165CC15BA0;
 Thu, 27 Apr 2023 08:26:04 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 4/7] migration: Move qmp_migrate_set_parameters() to options.c
Date: Thu, 27 Apr 2023 10:25:54 +0200
Message-Id: <20230427082557.20994-5-quintela@redhat.com>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/migration.c | 420 ------------------------------------------
 migration/options.c   | 418 +++++++++++++++++++++++++++++++++++++++++
 migration/options.h   |  11 ++
 3 files changed, 429 insertions(+), 420 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 02c2355d0d..22e8586623 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -67,19 +67,10 @@
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
-/* Amount of time to allocate to each "chunk" of bandwidth-throttled
- * data. */
-#define BUFFER_DELAY     100
-#define XFER_LIMIT_RATIO (1000 / BUFFER_DELAY)
-
 /* Time in milliseconds we are allowed to stop the source,
  * for sending the last part */
 #define DEFAULT_MIGRATE_SET_DOWNTIME 300
 
-/* Maximum migrate downtime set to 2000 seconds */
-#define MAX_MIGRATE_DOWNTIME_SECONDS 2000
-#define MAX_MIGRATE_DOWNTIME (MAX_MIGRATE_DOWNTIME_SECONDS * 1000)
-
 /* Default compression thread count */
 #define DEFAULT_MIGRATE_COMPRESS_THREAD_COUNT 8
 /* Default decompression thread count, usually decompression is at
@@ -1140,417 +1131,6 @@ MigrationInfo *qmp_query_migrate(Error **errp)
     return info;
 }
 
-/*
- * Check whether the parameters are valid. Error will be put into errp
- * (if provided). Return true if valid, otherwise false.
- */
-static bool migrate_params_check(MigrationParameters *params, Error **errp)
-{
-    if (params->has_compress_level &&
-        (params->compress_level > 9)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "compress_level",
-                   "a value between 0 and 9");
-        return false;
-    }
-
-    if (params->has_compress_threads && (params->compress_threads < 1)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "compress_threads",
-                   "a value between 1 and 255");
-        return false;
-    }
-
-    if (params->has_decompress_threads && (params->decompress_threads < 1)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "decompress_threads",
-                   "a value between 1 and 255");
-        return false;
-    }
-
-    if (params->has_throttle_trigger_threshold &&
-        (params->throttle_trigger_threshold < 1 ||
-         params->throttle_trigger_threshold > 100)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "throttle_trigger_threshold",
-                   "an integer in the range of 1 to 100");
-        return false;
-    }
-
-    if (params->has_cpu_throttle_initial &&
-        (params->cpu_throttle_initial < 1 ||
-         params->cpu_throttle_initial > 99)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "cpu_throttle_initial",
-                   "an integer in the range of 1 to 99");
-        return false;
-    }
-
-    if (params->has_cpu_throttle_increment &&
-        (params->cpu_throttle_increment < 1 ||
-         params->cpu_throttle_increment > 99)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "cpu_throttle_increment",
-                   "an integer in the range of 1 to 99");
-        return false;
-    }
-
-    if (params->has_max_bandwidth && (params->max_bandwidth > SIZE_MAX)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "max_bandwidth",
-                   "an integer in the range of 0 to "stringify(SIZE_MAX)
-                   " bytes/second");
-        return false;
-    }
-
-    if (params->has_downtime_limit &&
-        (params->downtime_limit > MAX_MIGRATE_DOWNTIME)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "downtime_limit",
-                   "an integer in the range of 0 to "
-                    stringify(MAX_MIGRATE_DOWNTIME)" ms");
-        return false;
-    }
-
-    /* x_checkpoint_delay is now always positive */
-
-    if (params->has_multifd_channels && (params->multifd_channels < 1)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "multifd_channels",
-                   "a value between 1 and 255");
-        return false;
-    }
-
-    if (params->has_multifd_zlib_level &&
-        (params->multifd_zlib_level > 9)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zlib_level",
-                   "a value between 0 and 9");
-        return false;
-    }
-
-    if (params->has_multifd_zstd_level &&
-        (params->multifd_zstd_level > 20)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zstd_level",
-                   "a value between 0 and 20");
-        return false;
-    }
-
-    if (params->has_xbzrle_cache_size &&
-        (params->xbzrle_cache_size < qemu_target_page_size() ||
-         !is_power_of_2(params->xbzrle_cache_size))) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "xbzrle_cache_size",
-                   "a power of two no less than the target page size");
-        return false;
-    }
-
-    if (params->has_max_cpu_throttle &&
-        (params->max_cpu_throttle < params->cpu_throttle_initial ||
-         params->max_cpu_throttle > 99)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "max_cpu_throttle",
-                   "an integer in the range of cpu_throttle_initial to 99");
-        return false;
-    }
-
-    if (params->has_announce_initial &&
-        params->announce_initial > 100000) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "announce_initial",
-                   "a value between 0 and 100000");
-        return false;
-    }
-    if (params->has_announce_max &&
-        params->announce_max > 100000) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "announce_max",
-                   "a value between 0 and 100000");
-       return false;
-    }
-    if (params->has_announce_rounds &&
-        params->announce_rounds > 1000) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "announce_rounds",
-                   "a value between 0 and 1000");
-       return false;
-    }
-    if (params->has_announce_step &&
-        (params->announce_step < 1 ||
-        params->announce_step > 10000)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "announce_step",
-                   "a value between 0 and 10000");
-       return false;
-    }
-
-    if (params->has_block_bitmap_mapping &&
-        !check_dirty_bitmap_mig_alias_map(params->block_bitmap_mapping, errp)) {
-        error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
-        return false;
-    }
-
-#ifdef CONFIG_LINUX
-    if (migrate_zero_copy_send() &&
-        ((params->has_multifd_compression && params->multifd_compression) ||
-         (params->tls_creds && *params->tls_creds))) {
-        error_setg(errp,
-                   "Zero copy only available for non-compressed non-TLS multifd migration");
-        return false;
-    }
-#endif
-
-    return true;
-}
-
-static void migrate_params_test_apply(MigrateSetParameters *params,
-                                      MigrationParameters *dest)
-{
-    *dest = migrate_get_current()->parameters;
-
-    /* TODO use QAPI_CLONE() instead of duplicating it inline */
-
-    if (params->has_compress_level) {
-        dest->compress_level = params->compress_level;
-    }
-
-    if (params->has_compress_threads) {
-        dest->compress_threads = params->compress_threads;
-    }
-
-    if (params->has_compress_wait_thread) {
-        dest->compress_wait_thread = params->compress_wait_thread;
-    }
-
-    if (params->has_decompress_threads) {
-        dest->decompress_threads = params->decompress_threads;
-    }
-
-    if (params->has_throttle_trigger_threshold) {
-        dest->throttle_trigger_threshold = params->throttle_trigger_threshold;
-    }
-
-    if (params->has_cpu_throttle_initial) {
-        dest->cpu_throttle_initial = params->cpu_throttle_initial;
-    }
-
-    if (params->has_cpu_throttle_increment) {
-        dest->cpu_throttle_increment = params->cpu_throttle_increment;
-    }
-
-    if (params->has_cpu_throttle_tailslow) {
-        dest->cpu_throttle_tailslow = params->cpu_throttle_tailslow;
-    }
-
-    if (params->tls_creds) {
-        assert(params->tls_creds->type == QTYPE_QSTRING);
-        dest->tls_creds = params->tls_creds->u.s;
-    }
-
-    if (params->tls_hostname) {
-        assert(params->tls_hostname->type == QTYPE_QSTRING);
-        dest->tls_hostname = params->tls_hostname->u.s;
-    }
-
-    if (params->has_max_bandwidth) {
-        dest->max_bandwidth = params->max_bandwidth;
-    }
-
-    if (params->has_downtime_limit) {
-        dest->downtime_limit = params->downtime_limit;
-    }
-
-    if (params->has_x_checkpoint_delay) {
-        dest->x_checkpoint_delay = params->x_checkpoint_delay;
-    }
-
-    if (params->has_block_incremental) {
-        dest->block_incremental = params->block_incremental;
-    }
-    if (params->has_multifd_channels) {
-        dest->multifd_channels = params->multifd_channels;
-    }
-    if (params->has_multifd_compression) {
-        dest->multifd_compression = params->multifd_compression;
-    }
-    if (params->has_xbzrle_cache_size) {
-        dest->xbzrle_cache_size = params->xbzrle_cache_size;
-    }
-    if (params->has_max_postcopy_bandwidth) {
-        dest->max_postcopy_bandwidth = params->max_postcopy_bandwidth;
-    }
-    if (params->has_max_cpu_throttle) {
-        dest->max_cpu_throttle = params->max_cpu_throttle;
-    }
-    if (params->has_announce_initial) {
-        dest->announce_initial = params->announce_initial;
-    }
-    if (params->has_announce_max) {
-        dest->announce_max = params->announce_max;
-    }
-    if (params->has_announce_rounds) {
-        dest->announce_rounds = params->announce_rounds;
-    }
-    if (params->has_announce_step) {
-        dest->announce_step = params->announce_step;
-    }
-
-    if (params->has_block_bitmap_mapping) {
-        dest->has_block_bitmap_mapping = true;
-        dest->block_bitmap_mapping = params->block_bitmap_mapping;
-    }
-}
-
-static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
-{
-    MigrationState *s = migrate_get_current();
-
-    /* TODO use QAPI_CLONE() instead of duplicating it inline */
-
-    if (params->has_compress_level) {
-        s->parameters.compress_level = params->compress_level;
-    }
-
-    if (params->has_compress_threads) {
-        s->parameters.compress_threads = params->compress_threads;
-    }
-
-    if (params->has_compress_wait_thread) {
-        s->parameters.compress_wait_thread = params->compress_wait_thread;
-    }
-
-    if (params->has_decompress_threads) {
-        s->parameters.decompress_threads = params->decompress_threads;
-    }
-
-    if (params->has_throttle_trigger_threshold) {
-        s->parameters.throttle_trigger_threshold = params->throttle_trigger_threshold;
-    }
-
-    if (params->has_cpu_throttle_initial) {
-        s->parameters.cpu_throttle_initial = params->cpu_throttle_initial;
-    }
-
-    if (params->has_cpu_throttle_increment) {
-        s->parameters.cpu_throttle_increment = params->cpu_throttle_increment;
-    }
-
-    if (params->has_cpu_throttle_tailslow) {
-        s->parameters.cpu_throttle_tailslow = params->cpu_throttle_tailslow;
-    }
-
-    if (params->tls_creds) {
-        g_free(s->parameters.tls_creds);
-        assert(params->tls_creds->type == QTYPE_QSTRING);
-        s->parameters.tls_creds = g_strdup(params->tls_creds->u.s);
-    }
-
-    if (params->tls_hostname) {
-        g_free(s->parameters.tls_hostname);
-        assert(params->tls_hostname->type == QTYPE_QSTRING);
-        s->parameters.tls_hostname = g_strdup(params->tls_hostname->u.s);
-    }
-
-    if (params->tls_authz) {
-        g_free(s->parameters.tls_authz);
-        assert(params->tls_authz->type == QTYPE_QSTRING);
-        s->parameters.tls_authz = g_strdup(params->tls_authz->u.s);
-    }
-
-    if (params->has_max_bandwidth) {
-        s->parameters.max_bandwidth = params->max_bandwidth;
-        if (s->to_dst_file && !migration_in_postcopy()) {
-            qemu_file_set_rate_limit(s->to_dst_file,
-                                s->parameters.max_bandwidth / XFER_LIMIT_RATIO);
-        }
-    }
-
-    if (params->has_downtime_limit) {
-        s->parameters.downtime_limit = params->downtime_limit;
-    }
-
-    if (params->has_x_checkpoint_delay) {
-        s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
-        if (migration_in_colo_state()) {
-            colo_checkpoint_notify(s);
-        }
-    }
-
-    if (params->has_block_incremental) {
-        s->parameters.block_incremental = params->block_incremental;
-    }
-    if (params->has_multifd_channels) {
-        s->parameters.multifd_channels = params->multifd_channels;
-    }
-    if (params->has_multifd_compression) {
-        s->parameters.multifd_compression = params->multifd_compression;
-    }
-    if (params->has_xbzrle_cache_size) {
-        s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
-        xbzrle_cache_resize(params->xbzrle_cache_size, errp);
-    }
-    if (params->has_max_postcopy_bandwidth) {
-        s->parameters.max_postcopy_bandwidth = params->max_postcopy_bandwidth;
-        if (s->to_dst_file && migration_in_postcopy()) {
-            qemu_file_set_rate_limit(s->to_dst_file,
-                    s->parameters.max_postcopy_bandwidth / XFER_LIMIT_RATIO);
-        }
-    }
-    if (params->has_max_cpu_throttle) {
-        s->parameters.max_cpu_throttle = params->max_cpu_throttle;
-    }
-    if (params->has_announce_initial) {
-        s->parameters.announce_initial = params->announce_initial;
-    }
-    if (params->has_announce_max) {
-        s->parameters.announce_max = params->announce_max;
-    }
-    if (params->has_announce_rounds) {
-        s->parameters.announce_rounds = params->announce_rounds;
-    }
-    if (params->has_announce_step) {
-        s->parameters.announce_step = params->announce_step;
-    }
-
-    if (params->has_block_bitmap_mapping) {
-        qapi_free_BitmapMigrationNodeAliasList(
-            s->parameters.block_bitmap_mapping);
-
-        s->parameters.has_block_bitmap_mapping = true;
-        s->parameters.block_bitmap_mapping =
-            QAPI_CLONE(BitmapMigrationNodeAliasList,
-                       params->block_bitmap_mapping);
-    }
-}
-
-void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
-{
-    MigrationParameters tmp;
-
-    /* TODO Rewrite "" to null instead */
-    if (params->tls_creds
-        && params->tls_creds->type == QTYPE_QNULL) {
-        qobject_unref(params->tls_creds->u.n);
-        params->tls_creds->type = QTYPE_QSTRING;
-        params->tls_creds->u.s = strdup("");
-    }
-    /* TODO Rewrite "" to null instead */
-    if (params->tls_hostname
-        && params->tls_hostname->type == QTYPE_QNULL) {
-        qobject_unref(params->tls_hostname->u.n);
-        params->tls_hostname->type = QTYPE_QSTRING;
-        params->tls_hostname->u.s = strdup("");
-    }
-
-    migrate_params_test_apply(params, &tmp);
-
-    if (!migrate_params_check(&tmp, errp)) {
-        /* Invalid parameter */
-        return;
-    }
-
-    migrate_params_apply(params, errp);
-}
-
-
 void qmp_migrate_start_postcopy(Error **errp)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/options.c b/migration/options.c
index 943936a320..fe7d7754c4 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -12,17 +12,25 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/target_page.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qnull.h"
 #include "sysemu/runstate.h"
+#include "migration/colo.h"
 #include "migration/misc.h"
 #include "migration.h"
+#include "qemu-file.h"
 #include "ram.h"
 #include "options.h"
 
+/* Maximum migrate downtime set to 2000 seconds */
+#define MAX_MIGRATE_DOWNTIME_SECONDS 2000
+#define MAX_MIGRATE_DOWNTIME (MAX_MIGRATE_DOWNTIME_SECONDS * 1000)
+
 bool migrate_auto_converge(void)
 {
     MigrationState *s;
@@ -734,3 +742,413 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
 
     return params;
 }
+
+/*
+ * Check whether the parameters are valid. Error will be put into errp
+ * (if provided). Return true if valid, otherwise false.
+ */
+bool migrate_params_check(MigrationParameters *params, Error **errp)
+{
+    if (params->has_compress_level &&
+        (params->compress_level > 9)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "compress_level",
+                   "a value between 0 and 9");
+        return false;
+    }
+
+    if (params->has_compress_threads && (params->compress_threads < 1)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "compress_threads",
+                   "a value between 1 and 255");
+        return false;
+    }
+
+    if (params->has_decompress_threads && (params->decompress_threads < 1)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "decompress_threads",
+                   "a value between 1 and 255");
+        return false;
+    }
+
+    if (params->has_throttle_trigger_threshold &&
+        (params->throttle_trigger_threshold < 1 ||
+         params->throttle_trigger_threshold > 100)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "throttle_trigger_threshold",
+                   "an integer in the range of 1 to 100");
+        return false;
+    }
+
+    if (params->has_cpu_throttle_initial &&
+        (params->cpu_throttle_initial < 1 ||
+         params->cpu_throttle_initial > 99)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "cpu_throttle_initial",
+                   "an integer in the range of 1 to 99");
+        return false;
+    }
+
+    if (params->has_cpu_throttle_increment &&
+        (params->cpu_throttle_increment < 1 ||
+         params->cpu_throttle_increment > 99)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "cpu_throttle_increment",
+                   "an integer in the range of 1 to 99");
+        return false;
+    }
+
+    if (params->has_max_bandwidth && (params->max_bandwidth > SIZE_MAX)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "max_bandwidth",
+                   "an integer in the range of 0 to "stringify(SIZE_MAX)
+                   " bytes/second");
+        return false;
+    }
+
+    if (params->has_downtime_limit &&
+        (params->downtime_limit > MAX_MIGRATE_DOWNTIME)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "downtime_limit",
+                   "an integer in the range of 0 to "
+                    stringify(MAX_MIGRATE_DOWNTIME)" ms");
+        return false;
+    }
+
+    /* x_checkpoint_delay is now always positive */
+
+    if (params->has_multifd_channels && (params->multifd_channels < 1)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "multifd_channels",
+                   "a value between 1 and 255");
+        return false;
+    }
+
+    if (params->has_multifd_zlib_level &&
+        (params->multifd_zlib_level > 9)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zlib_level",
+                   "a value between 0 and 9");
+        return false;
+    }
+
+    if (params->has_multifd_zstd_level &&
+        (params->multifd_zstd_level > 20)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zstd_level",
+                   "a value between 0 and 20");
+        return false;
+    }
+
+    if (params->has_xbzrle_cache_size &&
+        (params->xbzrle_cache_size < qemu_target_page_size() ||
+         !is_power_of_2(params->xbzrle_cache_size))) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "xbzrle_cache_size",
+                   "a power of two no less than the target page size");
+        return false;
+    }
+
+    if (params->has_max_cpu_throttle &&
+        (params->max_cpu_throttle < params->cpu_throttle_initial ||
+         params->max_cpu_throttle > 99)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "max_cpu_throttle",
+                   "an integer in the range of cpu_throttle_initial to 99");
+        return false;
+    }
+
+    if (params->has_announce_initial &&
+        params->announce_initial > 100000) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "announce_initial",
+                   "a value between 0 and 100000");
+        return false;
+    }
+    if (params->has_announce_max &&
+        params->announce_max > 100000) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "announce_max",
+                   "a value between 0 and 100000");
+       return false;
+    }
+    if (params->has_announce_rounds &&
+        params->announce_rounds > 1000) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "announce_rounds",
+                   "a value between 0 and 1000");
+       return false;
+    }
+    if (params->has_announce_step &&
+        (params->announce_step < 1 ||
+        params->announce_step > 10000)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "announce_step",
+                   "a value between 0 and 10000");
+       return false;
+    }
+
+    if (params->has_block_bitmap_mapping &&
+        !check_dirty_bitmap_mig_alias_map(params->block_bitmap_mapping, errp)) {
+        error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
+        return false;
+    }
+
+#ifdef CONFIG_LINUX
+    if (migrate_zero_copy_send() &&
+        ((params->has_multifd_compression && params->multifd_compression) ||
+         (params->tls_creds && *params->tls_creds))) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#endif
+
+    return true;
+}
+
+static void migrate_params_test_apply(MigrateSetParameters *params,
+                                      MigrationParameters *dest)
+{
+    *dest = migrate_get_current()->parameters;
+
+    /* TODO use QAPI_CLONE() instead of duplicating it inline */
+
+    if (params->has_compress_level) {
+        dest->compress_level = params->compress_level;
+    }
+
+    if (params->has_compress_threads) {
+        dest->compress_threads = params->compress_threads;
+    }
+
+    if (params->has_compress_wait_thread) {
+        dest->compress_wait_thread = params->compress_wait_thread;
+    }
+
+    if (params->has_decompress_threads) {
+        dest->decompress_threads = params->decompress_threads;
+    }
+
+    if (params->has_throttle_trigger_threshold) {
+        dest->throttle_trigger_threshold = params->throttle_trigger_threshold;
+    }
+
+    if (params->has_cpu_throttle_initial) {
+        dest->cpu_throttle_initial = params->cpu_throttle_initial;
+    }
+
+    if (params->has_cpu_throttle_increment) {
+        dest->cpu_throttle_increment = params->cpu_throttle_increment;
+    }
+
+    if (params->has_cpu_throttle_tailslow) {
+        dest->cpu_throttle_tailslow = params->cpu_throttle_tailslow;
+    }
+
+    if (params->tls_creds) {
+        assert(params->tls_creds->type == QTYPE_QSTRING);
+        dest->tls_creds = params->tls_creds->u.s;
+    }
+
+    if (params->tls_hostname) {
+        assert(params->tls_hostname->type == QTYPE_QSTRING);
+        dest->tls_hostname = params->tls_hostname->u.s;
+    }
+
+    if (params->has_max_bandwidth) {
+        dest->max_bandwidth = params->max_bandwidth;
+    }
+
+    if (params->has_downtime_limit) {
+        dest->downtime_limit = params->downtime_limit;
+    }
+
+    if (params->has_x_checkpoint_delay) {
+        dest->x_checkpoint_delay = params->x_checkpoint_delay;
+    }
+
+    if (params->has_block_incremental) {
+        dest->block_incremental = params->block_incremental;
+    }
+    if (params->has_multifd_channels) {
+        dest->multifd_channels = params->multifd_channels;
+    }
+    if (params->has_multifd_compression) {
+        dest->multifd_compression = params->multifd_compression;
+    }
+    if (params->has_xbzrle_cache_size) {
+        dest->xbzrle_cache_size = params->xbzrle_cache_size;
+    }
+    if (params->has_max_postcopy_bandwidth) {
+        dest->max_postcopy_bandwidth = params->max_postcopy_bandwidth;
+    }
+    if (params->has_max_cpu_throttle) {
+        dest->max_cpu_throttle = params->max_cpu_throttle;
+    }
+    if (params->has_announce_initial) {
+        dest->announce_initial = params->announce_initial;
+    }
+    if (params->has_announce_max) {
+        dest->announce_max = params->announce_max;
+    }
+    if (params->has_announce_rounds) {
+        dest->announce_rounds = params->announce_rounds;
+    }
+    if (params->has_announce_step) {
+        dest->announce_step = params->announce_step;
+    }
+
+    if (params->has_block_bitmap_mapping) {
+        dest->has_block_bitmap_mapping = true;
+        dest->block_bitmap_mapping = params->block_bitmap_mapping;
+    }
+}
+
+static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
+{
+    MigrationState *s = migrate_get_current();
+
+    /* TODO use QAPI_CLONE() instead of duplicating it inline */
+
+    if (params->has_compress_level) {
+        s->parameters.compress_level = params->compress_level;
+    }
+
+    if (params->has_compress_threads) {
+        s->parameters.compress_threads = params->compress_threads;
+    }
+
+    if (params->has_compress_wait_thread) {
+        s->parameters.compress_wait_thread = params->compress_wait_thread;
+    }
+
+    if (params->has_decompress_threads) {
+        s->parameters.decompress_threads = params->decompress_threads;
+    }
+
+    if (params->has_throttle_trigger_threshold) {
+        s->parameters.throttle_trigger_threshold = params->throttle_trigger_threshold;
+    }
+
+    if (params->has_cpu_throttle_initial) {
+        s->parameters.cpu_throttle_initial = params->cpu_throttle_initial;
+    }
+
+    if (params->has_cpu_throttle_increment) {
+        s->parameters.cpu_throttle_increment = params->cpu_throttle_increment;
+    }
+
+    if (params->has_cpu_throttle_tailslow) {
+        s->parameters.cpu_throttle_tailslow = params->cpu_throttle_tailslow;
+    }
+
+    if (params->tls_creds) {
+        g_free(s->parameters.tls_creds);
+        assert(params->tls_creds->type == QTYPE_QSTRING);
+        s->parameters.tls_creds = g_strdup(params->tls_creds->u.s);
+    }
+
+    if (params->tls_hostname) {
+        g_free(s->parameters.tls_hostname);
+        assert(params->tls_hostname->type == QTYPE_QSTRING);
+        s->parameters.tls_hostname = g_strdup(params->tls_hostname->u.s);
+    }
+
+    if (params->tls_authz) {
+        g_free(s->parameters.tls_authz);
+        assert(params->tls_authz->type == QTYPE_QSTRING);
+        s->parameters.tls_authz = g_strdup(params->tls_authz->u.s);
+    }
+
+    if (params->has_max_bandwidth) {
+        s->parameters.max_bandwidth = params->max_bandwidth;
+        if (s->to_dst_file && !migration_in_postcopy()) {
+            qemu_file_set_rate_limit(s->to_dst_file,
+                                s->parameters.max_bandwidth / XFER_LIMIT_RATIO);
+        }
+    }
+
+    if (params->has_downtime_limit) {
+        s->parameters.downtime_limit = params->downtime_limit;
+    }
+
+    if (params->has_x_checkpoint_delay) {
+        s->parameters.x_checkpoint_delay = params->x_checkpoint_delay;
+        if (migration_in_colo_state()) {
+            colo_checkpoint_notify(s);
+        }
+    }
+
+    if (params->has_block_incremental) {
+        s->parameters.block_incremental = params->block_incremental;
+    }
+    if (params->has_multifd_channels) {
+        s->parameters.multifd_channels = params->multifd_channels;
+    }
+    if (params->has_multifd_compression) {
+        s->parameters.multifd_compression = params->multifd_compression;
+    }
+    if (params->has_xbzrle_cache_size) {
+        s->parameters.xbzrle_cache_size = params->xbzrle_cache_size;
+        xbzrle_cache_resize(params->xbzrle_cache_size, errp);
+    }
+    if (params->has_max_postcopy_bandwidth) {
+        s->parameters.max_postcopy_bandwidth = params->max_postcopy_bandwidth;
+        if (s->to_dst_file && migration_in_postcopy()) {
+            qemu_file_set_rate_limit(s->to_dst_file,
+                    s->parameters.max_postcopy_bandwidth / XFER_LIMIT_RATIO);
+        }
+    }
+    if (params->has_max_cpu_throttle) {
+        s->parameters.max_cpu_throttle = params->max_cpu_throttle;
+    }
+    if (params->has_announce_initial) {
+        s->parameters.announce_initial = params->announce_initial;
+    }
+    if (params->has_announce_max) {
+        s->parameters.announce_max = params->announce_max;
+    }
+    if (params->has_announce_rounds) {
+        s->parameters.announce_rounds = params->announce_rounds;
+    }
+    if (params->has_announce_step) {
+        s->parameters.announce_step = params->announce_step;
+    }
+
+    if (params->has_block_bitmap_mapping) {
+        qapi_free_BitmapMigrationNodeAliasList(
+            s->parameters.block_bitmap_mapping);
+
+        s->parameters.has_block_bitmap_mapping = true;
+        s->parameters.block_bitmap_mapping =
+            QAPI_CLONE(BitmapMigrationNodeAliasList,
+                       params->block_bitmap_mapping);
+    }
+}
+
+void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
+{
+    MigrationParameters tmp;
+
+    /* TODO Rewrite "" to null instead */
+    if (params->tls_creds
+        && params->tls_creds->type == QTYPE_QNULL) {
+        qobject_unref(params->tls_creds->u.n);
+        params->tls_creds->type = QTYPE_QSTRING;
+        params->tls_creds->u.s = strdup("");
+    }
+    /* TODO Rewrite "" to null instead */
+    if (params->tls_hostname
+        && params->tls_hostname->type == QTYPE_QNULL) {
+        qobject_unref(params->tls_hostname->u.n);
+        params->tls_hostname->type = QTYPE_QSTRING;
+        params->tls_hostname->u.s = strdup("");
+    }
+
+    migrate_params_test_apply(params, &tmp);
+
+    if (!migrate_params_check(&tmp, errp)) {
+        /* Invalid parameter */
+        return;
+    }
+
+    migrate_params_apply(params, errp);
+}
diff --git a/migration/options.h b/migration/options.h
index 13318a16c7..89067e59a0 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -14,6 +14,13 @@
 #ifndef QEMU_MIGRATION_OPTIONS_H
 #define QEMU_MIGRATION_OPTIONS_H
 
+/* constants */
+
+/* Amount of time to allocate to each "chunk" of bandwidth-throttled
+ * data. */
+#define BUFFER_DELAY     100
+#define XFER_LIMIT_RATIO (1000 / BUFFER_DELAY)
+
 /* capabilities */
 
 bool migrate_auto_converge(void);
@@ -74,4 +81,8 @@ int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
+/* parameters helpers */
+
+bool migrate_params_check(MigrationParameters *params, Error **errp);
+
 #endif
-- 
2.40.0


