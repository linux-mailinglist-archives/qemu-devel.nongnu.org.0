Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5716024D3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:59:44 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgZi-0008RE-MV
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6D-0005gc-94
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg64-0001Ed-JS
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HecHKwM1KVV0Ncbec0gGJUx2Q7/jUxLusYA5/WFDJHc=;
 b=iuxahXXrpffF8EGNAyymsx0oG7fxJVErdP+UpcJsMExHtlyCxuOR6b1+f48cc8bT4u9Bpz
 LaU3nUYD/3C0S3sR+DhfKEquPgBlj4g3hq2DQYJOwJZinVcu17lM0QzMknCTBP33nMg/an
 oNpJ8W3pnQDTosbvG3twrPeHw6JujaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-i6kDdsDJNiaP1ypugPJTiQ-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: i6kDdsDJNiaP1ypugPJTiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6789810BDD;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2290111DCE3;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49F5E21E660F; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 14/28] qapi migration: Elide redundant has_FOO in generated
 C
Date: Tue, 18 Oct 2022 08:28:35 +0200
Message-Id: <20221018062849.3420573-15-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/migration.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/block-dirty-bitmap.c |  4 ++--
 migration/colo.c               |  1 -
 migration/migration.c          | 27 ++++++++-------------------
 monitor/hmp-cmds.c             | 26 +++++++++++---------------
 monitor/misc.c                 |  2 +-
 scripts/qapi/schema.py         |  1 -
 6 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..283017d7d3 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -551,7 +551,7 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
             }
 
             bitmap_alias = bmap_inner->alias;
-            if (bmap_inner->has_transform) {
+            if (bmap_inner->transform) {
                 bitmap_transform = bmap_inner->transform;
             }
         } else {
@@ -821,7 +821,7 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
     }
 
     if (s->bmap_inner &&
-        s->bmap_inner->has_transform &&
+        s->bmap_inner->transform &&
         s->bmap_inner->transform->has_persistent) {
         persistent = s->bmap_inner->transform->persistent;
     } else {
diff --git a/migration/colo.c b/migration/colo.c
index 2b71722fd6..232c8d44b1 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -250,7 +250,6 @@ ReplicationStatus *qmp_query_xen_replication_status(Error **errp)
     replication_get_error_all(&err);
     if (err) {
         s->error = true;
-        s->has_desc = true;
         s->desc = g_strdup(error_get_pretty(err));
     } else {
         s->error = false;
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..4c8a0403ae 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -918,11 +918,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->cpu_throttle_increment = s->parameters.cpu_throttle_increment;
     params->has_cpu_throttle_tailslow = true;
     params->cpu_throttle_tailslow = s->parameters.cpu_throttle_tailslow;
-    params->has_tls_creds = true;
     params->tls_creds = g_strdup(s->parameters.tls_creds);
-    params->has_tls_hostname = true;
     params->tls_hostname = g_strdup(s->parameters.tls_hostname);
-    params->has_tls_authz = true;
     params->tls_authz = g_strdup(s->parameters.tls_authz ?
                                  s->parameters.tls_authz : "");
     params->has_max_bandwidth = true;
@@ -1047,7 +1044,6 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 {
     size_t page_size = qemu_target_page_size();
 
-    info->has_ram = true;
     info->ram = g_malloc0(sizeof(*info->ram));
     info->ram->transferred = ram_counters.transferred;
     info->ram->total = ram_bytes_total();
@@ -1069,7 +1065,6 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
 
     if (migrate_use_xbzrle()) {
-        info->has_xbzrle_cache = true;
         info->xbzrle_cache = g_malloc0(sizeof(*info->xbzrle_cache));
         info->xbzrle_cache->cache_size = migrate_xbzrle_cache_size();
         info->xbzrle_cache->bytes = xbzrle_counters.bytes;
@@ -1081,7 +1076,6 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     }
 
     if (migrate_use_compression()) {
-        info->has_compression = true;
         info->compression = g_malloc0(sizeof(*info->compression));
         info->compression->pages = compression_counters.pages;
         info->compression->busy = compression_counters.busy;
@@ -1106,7 +1100,6 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
 static void populate_disk_info(MigrationInfo *info)
 {
     if (blk_mig_active()) {
-        info->has_disk = true;
         info->disk = g_malloc0(sizeof(*info->disk));
         info->disk->transferred = blk_mig_bytes_transferred();
         info->disk->remaining = blk_mig_bytes_remaining();
@@ -1171,7 +1164,6 @@ static void fill_source_migration_info(MigrationInfo *info)
     case MIGRATION_STATUS_FAILED:
         info->has_status = true;
         if (s->error) {
-            info->has_error_desc = true;
             info->error_desc = g_strdup(error_get_pretty(s->error));
         }
         break;
@@ -1557,7 +1549,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
 #ifdef CONFIG_LINUX
     if (migrate_use_zero_copy_send() &&
         ((params->has_multifd_compression && params->multifd_compression) ||
-         (params->has_tls_creds && params->tls_creds && *params->tls_creds))) {
+         (params->tls_creds && *params->tls_creds))) {
         error_setg(errp,
                    "Zero copy only available for non-compressed non-TLS multifd migration");
         return false;
@@ -1606,12 +1598,12 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->cpu_throttle_tailslow = params->cpu_throttle_tailslow;
     }
 
-    if (params->has_tls_creds) {
+    if (params->tls_creds) {
         assert(params->tls_creds->type == QTYPE_QSTRING);
         dest->tls_creds = params->tls_creds->u.s;
     }
 
-    if (params->has_tls_hostname) {
+    if (params->tls_hostname) {
         assert(params->tls_hostname->type == QTYPE_QSTRING);
         dest->tls_hostname = params->tls_hostname->u.s;
     }
@@ -1703,19 +1695,19 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.cpu_throttle_tailslow = params->cpu_throttle_tailslow;
     }
 
-    if (params->has_tls_creds) {
+    if (params->tls_creds) {
         g_free(s->parameters.tls_creds);
         assert(params->tls_creds->type == QTYPE_QSTRING);
         s->parameters.tls_creds = g_strdup(params->tls_creds->u.s);
     }
 
-    if (params->has_tls_hostname) {
+    if (params->tls_hostname) {
         g_free(s->parameters.tls_hostname);
         assert(params->tls_hostname->type == QTYPE_QSTRING);
         s->parameters.tls_hostname = g_strdup(params->tls_hostname->u.s);
     }
 
-    if (params->has_tls_authz) {
+    if (params->tls_authz) {
         g_free(s->parameters.tls_authz);
         assert(params->tls_authz->type == QTYPE_QSTRING);
         s->parameters.tls_authz = g_strdup(params->tls_authz->u.s);
@@ -1792,14 +1784,14 @@ void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
     MigrationParameters tmp;
 
     /* TODO Rewrite "" to null instead */
-    if (params->has_tls_creds
+    if (params->tls_creds
         && params->tls_creds->type == QTYPE_QNULL) {
         qobject_unref(params->tls_creds->u.n);
         params->tls_creds->type = QTYPE_QSTRING;
         params->tls_creds->u.s = strdup("");
     }
     /* TODO Rewrite "" to null instead */
-    if (params->has_tls_hostname
+    if (params->tls_hostname
         && params->tls_hostname->type == QTYPE_QNULL) {
         qobject_unref(params->tls_hostname->u.n);
         params->tls_hostname->type = QTYPE_QSTRING;
@@ -4474,9 +4466,6 @@ static void migration_instance_init(Object *obj)
     params->has_announce_max = true;
     params->has_announce_rounds = true;
     params->has_announce_step = true;
-    params->has_tls_creds = true;
-    params->has_tls_hostname = true;
-    params->has_tls_authz = true;
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index cdfb804925..8077ed82c9 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -240,8 +240,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
     if (info->has_status) {
         monitor_printf(mon, "Migration status: %s",
                        MigrationStatus_str(info->status));
-        if (info->status == MIGRATION_STATUS_FAILED &&
-            info->has_error_desc) {
+        if (info->status == MIGRATION_STATUS_FAILED && info->error_desc) {
             monitor_printf(mon, " (%s)\n", info->error_desc);
         } else {
             monitor_printf(mon, "\n");
@@ -263,7 +262,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         }
     }
 
-    if (info->has_ram) {
+    if (info->ram) {
         monitor_printf(mon, "transferred ram: %" PRIu64 " kbytes\n",
                        info->ram->transferred >> 10);
         monitor_printf(mon, "throughput: %0.2f mbps\n",
@@ -316,7 +315,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         }
     }
 
-    if (info->has_disk) {
+    if (info->disk) {
         monitor_printf(mon, "transferred disk: %" PRIu64 " kbytes\n",
                        info->disk->transferred >> 10);
         monitor_printf(mon, "remaining disk: %" PRIu64 " kbytes\n",
@@ -325,7 +324,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
                        info->disk->total >> 10);
     }
 
-    if (info->has_xbzrle_cache) {
+    if (info->xbzrle_cache) {
         monitor_printf(mon, "cache size: %" PRIu64 " bytes\n",
                        info->xbzrle_cache->cache_size);
         monitor_printf(mon, "xbzrle transferred: %" PRIu64 " kbytes\n",
@@ -342,7 +341,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
                        info->xbzrle_cache->overflow);
     }
 
-    if (info->has_compression) {
+    if (info->compression) {
         monitor_printf(mon, "compression pages: %" PRIu64 " pages\n",
                        info->compression->pages);
         monitor_printf(mon, "compression busy: %" PRIu64 "\n",
@@ -389,7 +388,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "]\n");
     }
 
-    if (info->has_vfio) {
+    if (info->vfio) {
         monitor_printf(mon, "vfio device transferred: %" PRIu64 " kbytes\n",
                        info->vfio->transferred >> 10);
     }
@@ -469,11 +468,11 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %u\n",
             MigrationParameter_str(MIGRATION_PARAMETER_MAX_CPU_THROTTLE),
             params->max_cpu_throttle);
-        assert(params->has_tls_creds);
+        assert(params->tls_creds);
         monitor_printf(mon, "%s: '%s'\n",
             MigrationParameter_str(MIGRATION_PARAMETER_TLS_CREDS),
             params->tls_creds);
-        assert(params->has_tls_hostname);
+        assert(params->tls_hostname);
         monitor_printf(mon, "%s: '%s'\n",
             MigrationParameter_str(MIGRATION_PARAMETER_TLS_HOSTNAME),
             params->tls_hostname);
@@ -1258,19 +1257,16 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         visit_type_uint8(v, param, &p->max_cpu_throttle, &err);
         break;
     case MIGRATION_PARAMETER_TLS_CREDS:
-        p->has_tls_creds = true;
         p->tls_creds = g_new0(StrOrNull, 1);
         p->tls_creds->type = QTYPE_QSTRING;
         visit_type_str(v, param, &p->tls_creds->u.s, &err);
         break;
     case MIGRATION_PARAMETER_TLS_HOSTNAME:
-        p->has_tls_hostname = true;
         p->tls_hostname = g_new0(StrOrNull, 1);
         p->tls_hostname->type = QTYPE_QSTRING;
         visit_type_str(v, param, &p->tls_hostname->u.s, &err);
         break;
     case MIGRATION_PARAMETER_TLS_AUTHZ:
-        p->has_tls_authz = true;
         p->tls_authz = g_new0(StrOrNull, 1);
         p->tls_authz->type = QTYPE_QSTRING;
         visit_type_str(v, param, &p->tls_authz->u.s, &err);
@@ -1382,7 +1378,7 @@ void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
 
     qmp_client_migrate_info(protocol, hostname,
                             has_port, port, has_tls_port, tls_port,
-                            !!cert_subject, cert_subject, &err);
+                            cert_subject, &err);
     hmp_handle_error(mon, err);
 }
 
@@ -1540,7 +1536,7 @@ static void hmp_migrate_status_cb(void *opaque)
     info = qmp_query_migrate(NULL);
     if (!info->has_status || info->status == MIGRATION_STATUS_ACTIVE ||
         info->status == MIGRATION_STATUS_SETUP) {
-        if (info->has_disk) {
+        if (info->disk) {
             int progress;
 
             if (info->disk->remaining) {
@@ -1558,7 +1554,7 @@ static void hmp_migrate_status_cb(void *opaque)
         if (status->is_block_migration) {
             monitor_printf(status->mon, "\n");
         }
-        if (info->has_error_desc) {
+        if (info->error_desc) {
             error_report("%s", info->error_desc);
         }
         monitor_resume(status->mon);
diff --git a/monitor/misc.c b/monitor/misc.c
index 6436a8786b..a51f0996cb 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -397,7 +397,7 @@ static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 void qmp_client_migrate_info(const char *protocol, const char *hostname,
                              bool has_port, int64_t port,
                              bool has_tls_port, int64_t tls_port,
-                             bool has_cert_subject, const char *cert_subject,
+                             const char *cert_subject,
                              Error **errp)
 {
     if (strcmp(protocol, "spice") == 0) {
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 9d729468b5..ad5b665212 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/migration.json',
             'qapi/misc.json',
             'qapi/net.json',
             'qapi/pci.json',
-- 
2.37.2


