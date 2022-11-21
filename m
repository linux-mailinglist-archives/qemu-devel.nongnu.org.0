Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F9632965
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9dj-0000dl-J5; Mon, 21 Nov 2022 11:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ox9dh-0000dS-MC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:21 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ox9dd-0001uI-AC
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:19 -0500
HMM_SOURCE_IP: 172.18.0.218:59746.263116816
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.159 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 545652800C1;
 Tue, 22 Nov 2022 00:27:12 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.40.159])
 by app0025 with ESMTP id fa910eb28b474418b8a989063fac653b for
 qemu-devel@nongnu.org; Tue, 22 Nov 2022 00:27:15 CST
X-Transaction-ID: fa910eb28b474418b8a989063fac653b
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.40.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v2 05/11] qapi/migration: Introduce vcpu-dirty-limit parameters
Date: Mon, 21 Nov 2022 11:26:37 -0500
Message-Id: <3fe7b2324c350b65f2a6fe6e4c585e9de5402e0c.1669047366.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1669047366.git.huangy81@chinatelecom.cn>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1669047366.git.huangy81@chinatelecom.cn>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce "vcpu-dirty-limit" migration parameter used
to limit dirty page rate during live migration.

"vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
two dirty-limit-related migration parameters, which can
be set before and during live migration by qmp
migrate-set-parameters.

This two parameters are used to help implement the dirty
page rate limit algo of migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/migration.c | 23 +++++++++++++++++++++++
 monitor/hmp-cmds.c    |  8 ++++++++
 qapi/migration.json   | 18 +++++++++++++++---
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 701267c..e2aada2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -117,6 +117,7 @@
 #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
 
 #define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
+#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT            1       /* MB/s */
 
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
@@ -968,6 +969,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->has_x_vcpu_dirty_limit_period = true;
     params->x_vcpu_dirty_limit_period = s->parameters.x_vcpu_dirty_limit_period;
 
+    params->has_vcpu_dirty_limit = true;
+    params->vcpu_dirty_limit = s->parameters.vcpu_dirty_limit;
+
     return params;
 }
 
@@ -1578,6 +1582,14 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         return false;
     }
 
+    if (params->has_vcpu_dirty_limit &&
+        (params->vcpu_dirty_limit < 1)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+                   "vcpu_dirty_limit",
+                   "is invalid, it must greater then 1 MB/s");
+        return false;
+    }
+
     return true;
 }
 
@@ -1681,6 +1693,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_x_vcpu_dirty_limit_period) {
         dest->x_vcpu_dirty_limit_period = params->x_vcpu_dirty_limit_period;
     }
+
+    if (params->has_vcpu_dirty_limit) {
+        dest->vcpu_dirty_limit = params->vcpu_dirty_limit;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1807,6 +1823,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.x_vcpu_dirty_limit_period =
             params->x_vcpu_dirty_limit_period;
     }
+    if (params->has_vcpu_dirty_limit) {
+        s->parameters.vcpu_dirty_limit = params->vcpu_dirty_limit;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -4411,6 +4430,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT64("x-vcpu-dirty-limit-period", MigrationState,
                        parameters.x_vcpu_dirty_limit_period,
                        DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD),
+    DEFINE_PROP_UINT64("vcpu-dirty-limit", MigrationState,
+                       parameters.vcpu_dirty_limit,
+                       DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4503,6 +4525,7 @@ static void migration_instance_init(Object *obj)
     params->has_tls_hostname = true;
     params->has_tls_authz = true;
     params->has_x_vcpu_dirty_limit_period = true;
+    params->has_vcpu_dirty_limit = true;
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a3170ca..9ad6ee5 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -517,6 +517,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %" PRIu64 " ms\n",
         MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD),
         params->x_vcpu_dirty_limit_period);
+
+        monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_VCPU_DIRTY_LIMIT),
+            params->vcpu_dirty_limit);
     }
 
     qapi_free_MigrationParameters(params);
@@ -1340,6 +1344,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_x_vcpu_dirty_limit_period = true;
         visit_type_size(v, param, &p->x_vcpu_dirty_limit_period, &err);
         break;
+    case MIGRATION_PARAMETER_VCPU_DIRTY_LIMIT:
+        p->has_vcpu_dirty_limit = true;
+        visit_type_size(v, param, &p->vcpu_dirty_limit, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 5175779..dd667dd 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -780,6 +780,9 @@
 #                             Should be in the range 1 to 1000ms, defaults to 500ms.
 #                             (Since 7.1)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 7.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -802,7 +805,8 @@
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level', 'multifd-zstd-level',
            'block-bitmap-mapping',
-           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] } ] }
+           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] },
+           'vcpu-dirty-limit'] }
 
 ##
 # @MigrateSetParameters:
@@ -951,6 +955,9 @@
 #                             Should be in the range 1 to 1000ms, defaults to 500ms.
 #                             (Since 7.1)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 7.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -989,7 +996,8 @@
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
             '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
-                                            'features': [ 'unstable' ] } } }
+                                            'features': [ 'unstable' ] },
+            '*vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @migrate-set-parameters:
@@ -1158,6 +1166,9 @@
 #                             Should be in the range 1 to 1000ms, defaults to 500ms.
 #                             (Since 7.1)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 7.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -1194,7 +1205,8 @@
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
             '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
-                                            'features': [ 'unstable' ] } } }
+                                            'features': [ 'unstable' ] },
+            '*vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @query-migrate-parameters:
-- 
1.8.3.1


