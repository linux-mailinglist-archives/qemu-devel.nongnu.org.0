Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A586999CB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:20:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgzB-0001Fj-Vk; Thu, 16 Feb 2023 11:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pSgzA-00013u-6P
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:52 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pSgz6-00056e-KJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:51 -0500
HMM_SOURCE_IP: 172.18.0.188:50698.1319324123
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.27 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 6D26C2800E0;
 Fri, 17 Feb 2023 00:19:23 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([118.116.19.27])
 by app0023 with ESMTP id e29e24eb84094dd8bbb670df53ad86fb for
 qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:19:27 CST
X-Transaction-ID: e29e24eb84094dd8bbb670df53ad86fb
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.27
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v4 05/10] qapi/migration: Introduce vcpu-dirty-limit parameters
Date: Fri, 17 Feb 2023 00:18:34 +0800
Message-Id: <901dc3fb01cb4bee7209e22de0fc5ca4386d313d.1676563222.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
Acked-by: Peter Xu <peterx@redhat.com>
---
 migration/migration-hmp-cmds.c |  8 ++++++++
 migration/migration.c          | 23 +++++++++++++++++++++++
 qapi/migration.json            | 18 +++++++++++++++---
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 3bc751bec9..a61ec80d9d 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -349,6 +349,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %" PRIu64 " ms\n",
         MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD),
         params->x_vcpu_dirty_limit_period);
+
+        monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_VCPU_DIRTY_LIMIT),
+            params->vcpu_dirty_limit);
     }
 
     qapi_free_MigrationParameters(params);
@@ -609,6 +613,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
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
diff --git a/migration/migration.c b/migration/migration.c
index 6162f048ae..e479c86575 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -120,6 +120,7 @@
 #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
 
 #define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     1000    /* microsecond */
+#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT            1       /* MB/s */
 
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
@@ -1021,6 +1022,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->has_x_vcpu_dirty_limit_period = true;
     params->x_vcpu_dirty_limit_period = s->parameters.x_vcpu_dirty_limit_period;
 
+    params->has_vcpu_dirty_limit = true;
+    params->vcpu_dirty_limit = s->parameters.vcpu_dirty_limit;
+
     return params;
 }
 
@@ -1674,6 +1678,14 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
 
@@ -1777,6 +1789,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_x_vcpu_dirty_limit_period) {
         dest->x_vcpu_dirty_limit_period = params->x_vcpu_dirty_limit_period;
     }
+
+    if (params->has_vcpu_dirty_limit) {
+        dest->vcpu_dirty_limit = params->vcpu_dirty_limit;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1904,6 +1920,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.x_vcpu_dirty_limit_period =
             params->x_vcpu_dirty_limit_period;
     }
+    if (params->has_vcpu_dirty_limit) {
+        s->parameters.vcpu_dirty_limit = params->vcpu_dirty_limit;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -4539,6 +4558,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT64("x-vcpu-dirty-limit-period", MigrationState,
                        parameters.x_vcpu_dirty_limit_period,
                        DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD),
+    DEFINE_PROP_UINT64("vcpu-dirty-limit", MigrationState,
+                       parameters.vcpu_dirty_limit,
+                       DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4629,6 +4651,7 @@ static void migration_instance_init(Object *obj)
     params->has_announce_rounds = true;
     params->has_announce_step = true;
     params->has_x_vcpu_dirty_limit_period = true;
+    params->has_vcpu_dirty_limit = true;
 
     qemu_sem_init(&ms->postcopy_pause_sem, 0);
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
diff --git a/qapi/migration.json b/qapi/migration.json
index f43e4061b4..d33cc2d582 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -779,6 +779,9 @@
 #                             live migration. Should be in the range 1 to 1000ms,
 #                             defaults to 1000ms. (Since 8.0)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 8.0)
+#
 # Features:
 # @unstable: Members @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -801,7 +804,8 @@
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level', 'multifd-zstd-level',
            'block-bitmap-mapping',
-           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] } ] }
+           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] },
+           'vcpu-dirty-limit'] }
 
 ##
 # @MigrateSetParameters:
@@ -950,6 +954,9 @@
 #                             live migration. Should be in the range 1 to 1000ms,
 #                             defaults to 1000ms. (Since 8.0)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 8.0)
+#
 # Features:
 # @unstable: Members @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -988,7 +995,8 @@
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
             '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
-                                            'features': [ 'unstable' ] } } }
+                                            'features': [ 'unstable' ] },
+            '*vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @migrate-set-parameters:
@@ -1157,6 +1165,9 @@
 #                             live migration. Should be in the range 1 to 1000ms,
 #                             defaults to 1000ms. (Since 8.0)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 8.0)
+#
 # Features:
 # @unstable: Members @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -1193,7 +1204,8 @@
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
             '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
-                                            'features': [ 'unstable' ] } } }
+                                            'features': [ 'unstable' ] },
+            '*vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @query-migrate-parameters:
-- 
2.17.1


