Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7DE5299D0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 08:49:37 +0200 (CEST)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqr1U-0003x9-9x
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 02:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nqqoK-0004l4-Ae
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:03 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:46484
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nqqoG-0007fF-EX
 for qemu-devel@nongnu.org; Tue, 17 May 2022 02:36:00 -0400
HMM_SOURCE_IP: 172.18.0.48:35216.1855245433
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.84 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 165162800C4;
 Tue, 17 May 2022 14:35:28 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 0f37b2a2d829483b9507aa9146dd6eda for
 qemu-devel@nongnu.org; Tue, 17 May 2022 14:35:33 CST
X-Transaction-ID: 0f37b2a2d829483b9507aa9146dd6eda
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
Subject: [RFC 1/6] qapi/migration: Introduce vcpu-dirtylimit-period parameters
Date: Tue, 17 May 2022 14:35:01 +0800
Message-Id: <23b507e7d9d230f1ea46bfe907acc09315505174.1652762652.git.huangy81@chinatelecom.cn>
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

Introduce "vcpu-dirtylimit-period" migration parameters,
which is used to makes dirtyrate calculation period
configurable.

To implement that, refactor vcpu_dirty_rate_stat_collect
so that period can be configured instead of hardcode.

Meanwhile, introduce migrate_dirtylimit function to help
check if dirtylimit enabled during live migration, set
it false by default.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/migration.c | 20 ++++++++++++++++++++
 migration/migration.h |  1 +
 monitor/hmp-cmds.c    |  8 ++++++++
 qapi/migration.json   | 19 +++++++++++++++----
 softmmu/dirtylimit.c  | 11 ++++++++++-
 5 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 695f0f2..5e20b2a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -116,6 +116,8 @@
 #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
 #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
 
+#define DEFAULT_MIGRATE_VCPU_DIRTYLIMIT_PERIOD      500     /* ms */
+
 static NotifierList migration_state_notifiers =
     NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
 
@@ -921,6 +923,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
                        s->parameters.block_bitmap_mapping);
     }
 
+    params->has_vcpu_dirtylimit_period = true;
+    params->vcpu_dirtylimit_period = s->parameters.vcpu_dirtylimit_period;
+
     return params;
 }
 
@@ -1581,6 +1586,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->has_block_bitmap_mapping = true;
         dest->block_bitmap_mapping = params->block_bitmap_mapping;
     }
+
+    if (params->has_vcpu_dirtylimit_period) {
+        dest->vcpu_dirtylimit_period = params->vcpu_dirtylimit_period;
+    }
 }
 
 static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
@@ -1703,6 +1712,9 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
             QAPI_CLONE(BitmapMigrationNodeAliasList,
                        params->block_bitmap_mapping);
     }
+    if (params->has_vcpu_dirtylimit_period) {
+        s->parameters.vcpu_dirtylimit_period = params->vcpu_dirtylimit_period;
+    }
 }
 
 void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
@@ -2403,6 +2415,11 @@ bool migrate_auto_converge(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
 }
 
+bool migrate_dirtylimit(void)
+{
+    return false;
+}
+
 bool migrate_zero_blocks(void)
 {
     MigrationState *s;
@@ -4221,6 +4238,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_SIZE("announce-step", MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    DEFINE_PROP_UINT64("vcpu-dirtylimit-period", MigrationState,
+                      parameters.vcpu_dirtylimit_period,
+                      DEFAULT_MIGRATE_VCPU_DIRTYLIMIT_PERIOD),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/migration/migration.h b/migration/migration.h
index 2de861d..43541cf 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -369,6 +369,7 @@ bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 
 bool migrate_auto_converge(void);
+bool migrate_dirtylimit(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6349684..fa33a35 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -525,6 +525,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
                 }
             }
         }
+
+        monitor_printf(mon, "%s: %" PRIu64 " MB/s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_VCPU_DIRTYLIMIT_PERIOD),
+            params->vcpu_dirtylimit_period);
     }
 
     qapi_free_MigrationParameters(params);
@@ -1344,6 +1348,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         error_setg(&err, "The block-bitmap-mapping parameter can only be set "
                    "through QMP");
         break;
+    case MIGRATION_PARAMETER_VCPU_DIRTYLIMIT_PERIOD:
+        p->has_vcpu_dirtylimit_period = true;
+        visit_type_size(v, param, &p->vcpu_dirtylimit_period, &err);
+        break;
     default:
         assert(0);
     }
diff --git a/qapi/migration.json b/qapi/migration.json
index 6a21027..260fb66 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -760,6 +760,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
+#                          Defaults to 500ms. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -779,8 +782,8 @@
            'multifd-channels',
            'xbzrle-cache-size', 'max-postcopy-bandwidth',
            'max-cpu-throttle', 'multifd-compression',
-           'multifd-zlib-level' ,'multifd-zstd-level',
-           'block-bitmap-mapping' ] }
+           'multifd-zlib-level', 'multifd-zstd-level',
+           'block-bitmap-mapping', 'vcpu-dirtylimit-period'] }
 
 ##
 # @MigrateSetParameters:
@@ -925,6 +928,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
+#                          Defaults to 500ms. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -960,7 +966,8 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*vcpu-dirtylimit-period': 'uint64'} }
 
 ##
 # @migrate-set-parameters:
@@ -1125,6 +1132,9 @@
 #                        block device name if there is one, and to their node name
 #                        otherwise. (Since 5.2)
 #
+# @vcpu-dirtylimit-period: Periodic time (ms) of dirtylimit during live migration.
+#                          Defaults to 500ms. (Since 7.0)
+#
 # Features:
 # @unstable: Member @x-checkpoint-delay is experimental.
 #
@@ -1158,7 +1168,8 @@
             '*multifd-compression': 'MultiFDCompression',
             '*multifd-zlib-level': 'uint8',
             '*multifd-zstd-level': 'uint8',
-            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
+            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
+            '*vcpu-dirtylimit-period': 'uint64'} }
 
 ##
 # @query-migrate-parameters:
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 365bd43..affe993 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -23,6 +23,8 @@
 #include "exec/memory.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
+#include "migration/misc.h"
+#include "migration/migration.h"
 #include "trace.h"
 
 /*
@@ -75,11 +77,18 @@ static bool dirtylimit_quit;
 
 static void vcpu_dirty_rate_stat_collect(void)
 {
+    MigrationState *s = migrate_get_current();
     VcpuStat stat;
     int i = 0;
+    int64_t period = DIRTYLIMIT_CALC_TIME_MS;
+
+    if (migrate_dirtylimit() &&
+        migration_is_active(s)) {
+        period = s->parameters.vcpu_dirtylimit_period;
+    }
 
     /* calculate vcpu dirtyrate */
-    vcpu_calculate_dirtyrate(DIRTYLIMIT_CALC_TIME_MS,
+    vcpu_calculate_dirtyrate(period,
                              &stat,
                              GLOBAL_DIRTY_LIMIT,
                              false);
-- 
1.8.3.1


