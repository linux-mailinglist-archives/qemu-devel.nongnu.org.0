Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4910B57EC9B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 10:00:00 +0200 (CEST)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFA3L-00037c-Di
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 03:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oF9tT-0001YH-RE
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:49 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53041
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oF9tN-0000Pm-9J
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:45 -0400
HMM_SOURCE_IP: 172.18.0.218:34686.1353564676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.4 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 44EC82800BC;
 Sat, 23 Jul 2022 15:49:26 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 8657caa07b794076a2f1683504310c19 for
 qemu-devel@nongnu.org; Sat, 23 Jul 2022 15:49:29 CST
X-Transaction-ID: 8657caa07b794076a2f1683504310c19
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
Subject: [PATCH 1/8] qapi/migration: Introduce x-vcpu-dirty-limit-period
 parameter
Date: Sat, 23 Jul 2022 15:49:13 +0800
Message-Id: <22a4776fc05a4174cb07728e0350430a420e2b9c.1658561555.git.huangy81@chinatelecom.cn>
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

Introduce "x-vcpu-dirty-limit-period" migration experimental
parameter, which is used to make dirtyrate calculation period
configurable.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/migration.c | 16 ++++++++++++++++
 monitor/hmp-cmds.c    |  8 ++++++++
 qapi/migration.json   | 31 ++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e03f698..7b19f85 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -116,6 +116,8 @@
 #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
 #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
 
+#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
+
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
 
@@ -962,6 +964,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
                        s->parameters.block_bitmap_mapping);
     }
 
+    params->has_x_vcpu_dirty_limit_period = true;
+    params->x_vcpu_dirty_limit_period = s->parameters.x_vcpu_dirty_limit_period;
+
     return params;
 }
 
@@ -1662,6 +1667,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->has_block_bitmap_mapping = true;
         dest->block_bitmap_mapping = params->block_bitmap_mapping;
     }
+
+    if (params->has_x_vcpu_dirty_limit_period) {
+        dest->x_vcpu_dirty_limit_period = params->x_vcpu_dirty_limit_period;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1784,6 +1793,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
             QAPI_CLONE(BitmapMigrationNodeAliasList,
                        params->block_bitmap_mapping);
     }
+    if (params->has_x_vcpu_dirty_limit_period) {
+        s->parameters.x_vcpu_dirty_limit_period =
+            params->x_vcpu_dirty_limit_period;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -4384,6 +4397,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
     DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
     DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
+    DEFINE_PROP_UINT64("x-vcpu-dirty-limit-period", MigrationState,
+                       parameters.x_vcpu_dirty_limit_period,
+                       DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a6dc79e..64c996c 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -532,6 +532,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
                 }
             }
         }
+
+        monitor_printf(mon, "%s: %" PRIu64 " ms\n",
+        MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD),
+        params->x_vcpu_dirty_limit_period);
     }
 
     qapi_free_MigrationParameters(params);
@@ -1351,6 +1355,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         error_setg(&err, "The block-bitmap-mapping parameter can only be set "
                    "through QMP");
         break;
+    case MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD:
+        p->has_x_vcpu_dirty_limit_period = true;
+        visit_type_size(v, param, &p->x_vcpu_dirty_limit_period, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4..332c087 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -776,8 +776,12 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
+#                             Defaults to 500ms. (Since 7.1)
+#
 # Features:
-# @unstable: Member @x-checkpoint-delay is experimental.
+# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
+#            are experimental.
 #
 # Since: 2.4
 ##
@@ -795,8 +799,9 @@
            'multifd-channels',
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
-           'multifd-zlib-level' ,'multifd-zstd-level',
-           'block-bitmap-mapping' ] }
+           'multifd-zlib-level', 'multifd-zstd-level',
+           'block-bitmap-mapping',
+           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] } ] }
 
 ##
 # @MigrateSetParameters:
@@ -941,8 +946,12 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
+#                             Defaults to 500ms. (Since 7.1)
+#
 # Features:
-# @unstable: Member @x-checkpoint-delay is experimental.
+# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
+#            are experimental.
 #
 # Since: 2.4
 ##
@@ -976,7 +985,9 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
+                                            'features': [ 'unstable' ] } } }
 
 ##
 # @migrate-set-parameters:
@@ -1141,8 +1152,12 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
+#                             Defaults to 500ms. (Since 7.1)
+#
 # Features:
-# @unstable: Member @x-checkpoint-delay is experimental.
+# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
+#            are experimental.
 #
 # Since: 2.4
 ##
@@ -1174,7 +1189,9 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
+                                            'features': [ 'unstable' ] } } }
 
 ##
 # @query-migrate-parameters:
-- 
1.8.3.1


