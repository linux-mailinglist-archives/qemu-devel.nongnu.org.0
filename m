Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA35299CF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:49:33 +0200 (CEST)
Received: from localhost ([::1]:59454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqr1Q-0003mV-EQ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nqqoK-0004kx-5d
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:03 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:46489
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nqqoG-0007fb-Dv
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:35:59 -0400
HMM_SOURCE_IP: 172.18.0.48:35216.1855245433
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D872B2800CB;
 Tue, 17 May 2022 14:35:33 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 036f46472a594c689f4d67785179dbc2 for
 qemu-devel@nongnu.org; Tue, 17 May 2022 14:35:35 CST
X-Transaction-ID: 036f46472a594c689f4d67785179dbc2
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [RFC 2/6] qapi/migration: Introduce vcpu-dirtylimit parameters
Date: Tue, 17 May 2022 14:35:02 +0800
Message-Id: <2fbc49b77115b5f8fbebbee00476f6f34dad4770.1652762652.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652762652.git.huangy81@chinatelecom.cn>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1652762652.git.huangy81@chinatelecom.cn>
References: <cover.1652762652.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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

Introduce "vcpu-dirtylimit" migration parameter used
to limit dirty page rate during live migration.

"vcpu-dirtylimit" and "vcpu-dirtylimit-period" are
two dirtylimit-related migration parameters, which can
be set before and during live migration by qmp
migrate-set-parameters.

This two parameters are used to help implement the dirty
page rate limit algo of migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/migration.c | 13 +++++++++++++
 monitor/hmp-cmds.c    |  7 +++++++
 qapi/migration.json   | 18 +++++++++++++++---
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5e20b2a..9e4ce01 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -117,6 +117,7 @@
 #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
 
 #define DEFAULT_MIGRATE_VCPU_DIRTYLIMIT_PERIOD      500     /* ms */
+#define DEFAULT_MIGRATE_VCPU_DIRTYLIMIT             1       /* MB/s */
 
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
@@ -925,6 +926,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
 
     params->has_vcpu_dirtylimit_period = true;
     params->vcpu_dirtylimit_period = s->parameters.vcpu_dirtylimit_period;
+    params->has_vcpu_dirtylimit = true;
+    params->vcpu_dirtylimit = s->parameters.vcpu_dirtylimit;
 
     return params;
 }
@@ -1590,6 +1593,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_vcpu_dirtylimit_period) {
         dest->vcpu_dirtylimit_period = params->vcpu_dirtylimit_period;
     }
+
+    if (params->has_vcpu_dirtylimit) {
+        dest->vcpu_dirtylimit = params->vcpu_dirtylimit;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1715,6 +1722,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_vcpu_dirtylimit_period) {
         s->parameters.vcpu_dirtylimit_period = params->vcpu_dirtylimit_period;
     }
+    if (params->has_vcpu_dirtylimit) {
+        s->parameters.vcpu_dirtylimit = params->vcpu_dirtylimit;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -4241,6 +4251,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_UINT64("vcpu-dirtylimit-period", MigrationState,
                       parameters.vcpu_dirtylimit_period,
                       DEFAULT_MIGRATE_VCPU_DIRTYLIMIT_PERIOD),
+    DEFINE_PROP_UINT64("vcpu-dirtylimit", MigrationState,
+                      parameters.vcpu_dirtylimit,
+                      DEFAULT_MIGRATE_VCPU_DIRTYLIMIT),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fa33a35..31a0564 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -529,6 +529,9 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
             MigrationParameter_str(MIGRATION_PARAMETER_VCPU_DIRTYLIMIT_PERIOD),
             params->vcpu_dirtylimit_period);
+        monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_VCPU_DIRTYLIMIT),
+            params->vcpu_dirtylimit);
     }
 
     qapi_free_MigrationParameters(params);
@@ -1352,6 +1355,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_vcpu_dirtylimit_period = true;
         visit_type_size(v, param, &p->vcpu_dirtylimit_period, &err);
         break;
+    case MIGRATION_PARAMETER_VCPU_DIRTYLIMIT:
+        p->has_vcpu_dirtylimit = true;
+        visit_type_size(v, param, &p->vcpu_dirtylimit, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 260fb66..68c1fe0 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -763,6 +763,9 @@
 # @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
 #                          Defaults to 500ms. (Since 7.0)
 #
+# @vcpu-dirtylimit: Dirtyrate limit (MB/s) during live migration.
+#                   Defaults to 1. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -783,7 +786,8 @@
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
            'multifd-zlib-level', 'multifd-zstd-level',
-           'block-bitmap-mapping', 'vcpu-dirtylimit-period'] }
+           'block-bitmap-mapping', 'vcpu-dirtylimit-period',
+           'vcpu-dirtylimit'] }
 
 ##
 # @MigrateSetParameters:
@@ -931,6 +935,9 @@
 # @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
 #                          Defaults to 500ms. (Since 7.0)
 #
+# @vcpu-dirtylimit: Dirtyrate limit (MB/s) during live migration.
+#                   Defaults to 1. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -967,7 +974,8 @@
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
-            '*vcpu-dirtylimit-period': 'uint64'} }
+            '*vcpu-dirtylimit-period': 'uint64',
+            '*vcpu-dirtylimit': 'uint64'} }
 
 ##
 # @migrate-set-parameters:
@@ -1135,6 +1143,9 @@
 # @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
 #                          Defaults to 500ms. (Since 7.0)
 #
+# @vcpu-dirtylimit: Dirtyrate limit (MB/s) during live migration.
+#                   Defaults to 1. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -1169,7 +1180,8 @@
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
             '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
-            '*vcpu-dirtylimit-period': 'uint64'} }
+            '*vcpu-dirtylimit-period': 'uint64',
+            '*vcpu-dirtylimit': 'uint64'} }
 
 ##
 # @query-migrate-parameters:
-- 
1.8.3.1


