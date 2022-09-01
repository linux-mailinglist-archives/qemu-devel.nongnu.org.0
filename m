Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1655A9E08
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:33:49 +0200 (CEST)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTo4a-0002GH-EP
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oTnu8-0000B4-Oa
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:00 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:56515
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oTnu4-000363-TD
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 13:23:00 -0400
HMM_SOURCE_IP: 172.18.0.218:57590.1734067809
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.60 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 67D472800D2;
 Fri,  2 Sep 2022 01:22:47 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 4a581dfc70754d23a013f45f3fc4e65c for
 qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:22:49 CST
X-Transaction-ID: 4a581dfc70754d23a013f45f3fc4e65c
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v1 2/8] qapi/migration: Introduce x-vcpu-dirty-limit parameters
Date: Fri,  2 Sep 2022 01:22:30 +0800
Message-Id: <58009ed32bc30ce40228b191fdd9cacc259ac859.1662052189.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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

Introduce "x-vcpu-dirty-limit" migration parameter used
to limit dirty page rate during live migration.

"x-vcpu-dirty-limit" and "x-vcpu-dirty-limit-period" are
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
index a8a8065..a748fe5 100644
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
 
+    params->has_x_vcpu_dirty_limit = true;
+    params->x_vcpu_dirty_limit = s->parameters.x_vcpu_dirty_limit;
+
     return params;
 }
 
@@ -1671,6 +1675,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_x_vcpu_dirty_limit_period) {
         dest->x_vcpu_dirty_limit_period = params->x_vcpu_dirty_limit_period;
     }
+
+    if (params->has_x_vcpu_dirty_limit) {
+        dest->x_vcpu_dirty_limit = params->x_vcpu_dirty_limit;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1797,6 +1805,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.x_vcpu_dirty_limit_period =
             params->x_vcpu_dirty_limit_period;
     }
+    if (params->has_x_vcpu_dirty_limit) {
+        s->parameters.x_vcpu_dirty_limit = params->x_vcpu_dirty_limit;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -4401,6 +4412,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT64("x-vcpu-dirty-limit-period", MigrationState,
                        parameters.x_vcpu_dirty_limit_period,
                        DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD),
+    DEFINE_PROP_UINT64("vcpu-dirty-limit", MigrationState,
+                       parameters.x_vcpu_dirty_limit,
+                       DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 7569859..b362fae 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -536,6 +536,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %" PRIu64 " ms\n",
         MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD),
         params->x_vcpu_dirty_limit_period);
+
+        monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT),
+            params->x_vcpu_dirty_limit);
     }
 
     qapi_free_MigrationParameters(params);
@@ -1359,6 +1363,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_x_vcpu_dirty_limit_period = true;
         visit_type_size(v, param, &p->x_vcpu_dirty_limit_period, &err);
         break;
+    case MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT:
+        p->has_x_vcpu_dirty_limit = true;
+        visit_type_size(v, param, &p->x_vcpu_dirty_limit, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 332c087..8554d33 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -779,6 +779,9 @@
 # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
 #                             Defaults to 500ms. (Since 7.1)
 #
+# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                      Defaults to 1. (Since 7.1)
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
+           'x-vcpu-dirty-limit'] }
 
 ##
 # @MigrateSetParameters:
@@ -949,6 +953,9 @@
 # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
 #                             Defaults to 500ms. (Since 7.1)
 #
+# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                      Defaults to 1. (Since 7.1)
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
+            '*x-vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @migrate-set-parameters:
@@ -1155,6 +1163,9 @@
 # @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
 #                             Defaults to 500ms. (Since 7.1)
 #
+# @x-vcpu-dirty-limit: Dirtyrate limit (MB/s) during live migration.
+#                      Defaults to 1. (Since 7.1)
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
+            '*x-vcpu-dirty-limit': 'uint64'} }
 
 ##
 # @query-migrate-parameters:
-- 
1.8.3.1


