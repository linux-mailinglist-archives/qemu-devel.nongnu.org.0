Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F96A86CF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlv3-0002IO-3S; Thu, 02 Mar 2023 11:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlug-0001Xf-Ao
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluc-00005A-4a
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpGaBdMJpbteE54+rvwEe6h48l574bnjZ0usvxVnCz0=;
 b=hxeWPH2+HB1J03HkWQywHusRTvRgotzKRdYu22MpG7OQ7VF3uyFmSQgDP6PPSED3xbb4XY
 ItdWe+kV0RFERGo3ZnUxAoyM2e9TZgj317uuTLqw6zGvcdRJqpmWd3k1+pirdN5j2C6f88
 22Iobq/HZOL1OmvTPC0Qs6BhV5MXlYM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-xyC8FdsYOrqyyrcQCM5mFw-1; Thu, 02 Mar 2023 11:36:04 -0500
X-MC-Unique: xyC8FdsYOrqyyrcQCM5mFw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CEC03804065;
 Thu,  2 Mar 2023 16:36:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E38DE492B00;
 Thu,  2 Mar 2023 16:36:00 +0000 (UTC)
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
Subject: [PATCH 32/43] migration: Move qmp_migrate_set_parameters() to
 options.c
Date: Thu,  2 Mar 2023 17:33:59 +0100
Message-Id: <20230302163410.11399-33-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h   |  11 ++
 migration/migration.c | 420 ------------------------------------------
 migration/options.c   | 418 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 429 insertions(+), 420 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index 17ac53429e..95338d1efd 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -16,6 +16,13 @@
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
@@ -76,4 +83,8 @@ int migrate_multifd_zstd_level(void);
 uint8_t migrate_throttle_trigger_threshold(void);
 uint64_t migrate_xbzrle_cache_size(void);
 
+/* parameters helpers */
+
+bool migrate_params_check(MigrationParameters *params, Error **errp);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 77ff3b97c3..5d43e815ed 100644
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
@@ -1138,417 +1129,6 @@ MigrationInfo *qmp_query_migrate(Error **errp)
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
index 91879967b1..efa9c6788d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -14,17 +14,25 @@
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
@@ -733,3 +741,413 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
 
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
-- 
2.39.2


