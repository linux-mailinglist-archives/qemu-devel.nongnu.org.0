Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8AA57EC96
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 09:55:59 +0200 (CEST)
Received: from localhost ([::1]:48478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF9zS-0007AV-25
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 03:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oF9tP-0001Y1-Ty
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:44 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53040
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oF9tN-0000Pl-3N
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:43 -0400
HMM_SOURCE_IP: 172.18.0.218:34686.1353564676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.4 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id E0A332800BD;
 Sat, 23 Jul 2022 15:49:29 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 002f8c1861624659bdb326e274126904 for
 qemu-devel@nongnu.org; Sat, 23 Jul 2022 15:49:32 CST
X-Transaction-ID: 002f8c1861624659bdb326e274126904
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH 2/8] qapi/migration: Introduce vcpu-dirty-limit parameters
Date: Sat, 23 Jul 2022 15:49:14 +0800
Message-Id: <01d837637e7725a49d1fd3cd22370d6c9f6b9e61.1658561555.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
 migration/migration.c | 14 ++++++++++++++
 monitor/hmp-cmds.c    |  8 ++++++++
 qapi/migration.json   | 18 +++++++++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 7b19f85..ed1a47b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -117,6 +117,7 @@
 #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
 
 #define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
+#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT            1       /* MB/s */
 
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
@@ -967,6 +968,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->has_x_vcpu_dirty_limit_period = true;
     params->x_vcpu_dirty_limit_period = s->parameters.x_vcpu_dirty_limit_period;
 
+    params->has_vcpu_dirty_limit = true;
+    params->vcpu_dirty_limit = s->parameters.vcpu_dirty_limit;
+
     return params;
 }
 
@@ -1671,6 +1675,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_x_vcpu_dirty_limit_period) {
         dest->x_vcpu_dirty_limit_period = params->x_vcpu_dirty_limit_period;
     }
+
+    if (params->has_vcpu_dirty_limit) {
+        dest->vcpu_dirty_limit = params->vcpu_dirty_limit;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1797,6 +1805,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.x_vcpu_dirty_limit_period =
             params->x_vcpu_dirty_limit_period;
     }
+    if (params->has_vcpu_dirty_limit) {
+        s->parameters.vcpu_dirty_limit = params->vcpu_dirty_limit;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -4400,6 +4411,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT64("x-vcpu-dirty-limit-period", MigrationState,
                        parameters.x_vcpu_dirty_limit_period,
                        DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD),
+    DEFINE_PROP_UINT64("vcpu-dirty-limit", MigrationState,
+                       parameters.vcpu_dirty_limit,
+                       DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 64c996c..acbc5e8 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -536,6 +536,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %" PRIu64 " ms\n",
         MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD),
         params->x_vcpu_dirty_limit_period);
+
+        monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_VCPU_DIRTY_LIMIT),
+            params->vcpu_dirty_limit);
     }
 
     qapi_free_MigrationParameters(params);
@@ -1359,6 +1363,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
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
index 332c087..0963bab 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -779,6 +779,9 @@
 # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
 #                             Defaults to 500ms. (Since 7.1)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 7.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
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
@@ -949,6 +953,9 @@
 # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
 #                             Defaults to 500ms. (Since 7.1)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 7.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -987,7 +994,8 @@
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
             '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
-                                            'features': [ 'unstable' ] } } }
+                                            'features': [ 'unstable' ] },
+            '*vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @migrate-set-parameters:
@@ -1155,6 +1163,9 @@
 # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
 #                             Defaults to 500ms. (Since 7.1)
 #
+# @vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                    Defaults to 1. (Since 7.1)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
 #            are experimental.
@@ -1191,7 +1202,8 @@
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


