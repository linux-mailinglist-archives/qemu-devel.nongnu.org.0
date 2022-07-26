Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3F58171E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:15:59 +0200 (CEST)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNDy-0008V6-KV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9e-0002cI-2I
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9a-00069Z-Ta
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:29 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnPjv006246;
 Tue, 26 Jul 2022 16:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Hq5Lcyhok4JEPa68Dr7lhFUs7IbghRLotg6m//Z2H5U=;
 b=1xoyLAQUvsUddjRnes1fDAYgCg1k4Wk9LzA3ih4iSPDje00dYXr4Pd8eMOZ0MG9VhOb+
 0kj1uffEzT7qtpF7xQ6aB7FPRxQob4XACBK6bEyWWMUx1gMklLqxx9vBe8Ren7dKHpBV
 3/tiD230K9uxeUAlPPpCB8pwGcxXiRnW1IWi0o3OpTWs5Krjdl+Ug6svFXIcYl7virXW
 2ol9pUVD5MXuCwTUzKxbZN+7KI88l2iAxfAQX8Au1nEqpUZrlxQ/wCuR3rAeAk6YHLGl
 O00ZVPaHtijPeeA5pzjfgCKKjfmTr3IkCbIoOz7jybsWrjmjp9xgQQDpsDSVkhTDWE30 dA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940ptyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFniKp006262; Tue, 26 Jul 2022 16:10:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq178-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSH023334;
 Tue, 26 Jul 2022 16:10:51 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-5; Tue, 26 Jul 2022 16:10:51 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 04/46] migration: mode parameter
Date: Tue, 26 Jul 2022 09:10:01 -0700
Message-Id: <1658851843-236870-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: OyVVGMJQ63FyHYbLCn850ATM5olnSvD9
X-Proofpoint-ORIG-GUID: OyVVGMJQ63FyHYbLCn850ATM5olnSvD9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Create a mode migration parameter that can be used to select alternate
migration algorithms.  The default mode is normal, representing the
current migration algorithm, and does not need to be explicitly set.

No functional change until a new mode is added, except that the mode is
shown by the 'info migrate' command.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/qdev-properties-system.c    | 12 ++++++++++++
 include/hw/qdev-properties-system.h |  4 ++++
 include/migration/misc.h            |  4 ++++
 migration/migration.c               | 28 ++++++++++++++++++++++++++++
 monitor/hmp-cmds.c                  |  8 ++++++++
 qapi/migration.json                 | 28 +++++++++++++++++++++++++---
 6 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a91f605..0a7b25b 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -650,6 +650,18 @@ const PropertyInfo qdev_prop_multifd_compression = {
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
+/* --- MigMode --- */
+
+const PropertyInfo qdev_prop_mig_mode = {
+    .name = "MigMode",
+    .description = "mig_mode values, "
+                   "normal/exec",
+    .enum_table = &MigMode_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
+
 /* --- Reserved Region --- */
 
 /*
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 0ac327a..1418801 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -7,6 +7,7 @@ extern const PropertyInfo qdev_prop_chr;
 extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_reserved_region;
 extern const PropertyInfo qdev_prop_multifd_compression;
+extern const PropertyInfo qdev_prop_mig_mode;
 extern const PropertyInfo qdev_prop_losttickpolicy;
 extern const PropertyInfo qdev_prop_blockdev_on_error;
 extern const PropertyInfo qdev_prop_bios_chs_trans;
@@ -41,6 +42,9 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 #define DEFINE_PROP_MULTIFD_COMPRESSION(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_multifd_compression, \
                        MultiFDCompression)
+#define DEFINE_PROP_MIG_MODE(_n, _s, _f, _d) \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_mig_mode, \
+                       MigMode)
 #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
                         LostTickPolicy)
diff --git a/include/migration/misc.h b/include/migration/misc.h
index 4659067..1e01134 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -15,6 +15,7 @@
 #define MIGRATION_MISC_H
 
 #include "qemu/notify.h"
+#include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-types-net.h"
 
 /* migration/ram.c */
@@ -75,4 +76,7 @@ bool migration_in_bg_snapshot(void);
 /* migration/block-dirty-bitmap.c */
 void dirty_bitmap_mig_init(void);
 
+MigMode migrate_mode(void);
+MigMode migrate_mode_of(MigrationState *s);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index d1cfca1..38584db 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -904,6 +904,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
 
     /* TODO use QAPI_CLONE() instead of duplicating it inline */
     params = g_malloc0(sizeof(*params));
+    params->has_mode = true;
+    params->mode = s->parameters.mode;
     params->has_compress_level = true;
     params->compress_level = s->parameters.compress_level;
     params->has_compress_threads = true;
@@ -1576,6 +1578,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
 
     /* TODO use QAPI_CLONE() instead of duplicating it inline */
 
+    if (params->has_mode) {
+        dest->mode = params->mode;
+    }
+
     if (params->has_compress_level) {
         dest->compress_level = params->compress_level;
     }
@@ -1673,6 +1679,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
 
     /* TODO use QAPI_CLONE() instead of duplicating it inline */
 
+    if (params->has_mode) {
+        s->parameters.mode = params->mode;
+    }
+
     if (params->has_compress_level) {
         s->parameters.compress_level = params->compress_level;
     }
@@ -2663,6 +2673,20 @@ int migrate_use_tls(void)
     return s->parameters.tls_creds && *s->parameters.tls_creds;
 }
 
+MigMode migrate_mode(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.mode;
+}
+
+MigMode migrate_mode_of(MigrationState *s)
+{
+    return s->parameters.mode;
+}
+
 int migrate_use_xbzrle(void)
 {
     MigrationState *s;
@@ -4321,6 +4345,9 @@ static Property migration_properties[] = {
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
 
     /* Migration parameters */
+    DEFINE_PROP_MIG_MODE("mode", MigrationState,
+                      parameters.mode,
+                      MIG_MODE_NORMAL),
     DEFINE_PROP_UINT8("x-compress-level", MigrationState,
                       parameters.compress_level,
                       DEFAULT_MIGRATE_COMPRESS_LEVEL),
@@ -4454,6 +4481,7 @@ static void migration_instance_init(Object *obj)
     params->tls_creds = g_strdup("");
 
     /* Set has_* up only for parameter checks */
+    params->has_mode = true;
     params->has_compress_level = true;
     params->has_compress_threads = true;
     params->has_decompress_threads = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c6cd6f9..6632ada 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -431,6 +431,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %" PRIu64 " ms\n",
             MigrationParameter_str(MIGRATION_PARAMETER_ANNOUNCE_STEP),
             params->announce_step);
+        assert(params->has_mode);
+        monitor_printf(mon, "%s: %s\n",
+            MigrationParameter_str(MIGRATION_PARAMETER_MODE),
+            qapi_enum_lookup(&MigMode_lookup, params->mode));
         assert(params->has_compress_level);
         monitor_printf(mon, "%s: %u\n",
             MigrationParameter_str(MIGRATION_PARAMETER_COMPRESS_LEVEL),
@@ -1219,6 +1223,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
     }
 
     switch (val) {
+    case MIGRATION_PARAMETER_MODE:
+        p->has_mode = true;
+        visit_type_MigMode(v, param, &p->mode, &err);
+        break;
     case MIGRATION_PARAMETER_COMPRESS_LEVEL:
         p->has_compress_level = true;
         visit_type_uint8(v, param, &p->compress_level, &err);
diff --git a/qapi/migration.json b/qapi/migration.json
index 81185d4..931c492 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -568,6 +568,16 @@
             { 'name': 'zstd', 'if': 'CONFIG_ZSTD' } ] }
 
 ##
+# @MigMode:
+#
+# @normal: the original form of migration.
+#
+# Since: 7.1
+##
+{ 'enum': 'MigMode',
+  'data': [ 'normal' ] }
+
+##
 # @BitmapMigrationBitmapAliasTransform:
 #
 # @persistent: If present, the bitmap will be made persistent
@@ -627,6 +637,9 @@
 #
 # Migration parameters enumeration
 #
+# @mode: Migration mode. See description in @MigMode. Default is 'normal'.
+#        (Since 7.1)
+#
 # @announce-initial: Initial delay (in milliseconds) before sending the first
 #                    announce (Since 4.0)
 #
@@ -782,7 +795,8 @@
 # Since: 2.4
 ##
 { 'enum': 'MigrationParameter',
-  'data': ['announce-initial', 'announce-max',
+  'data': ['mode',
+           'announce-initial', 'announce-max',
            'announce-rounds', 'announce-step',
            'compress-level', 'compress-threads', 'decompress-threads',
            'compress-wait-thread', 'throttle-trigger-threshold',
@@ -801,6 +815,9 @@
 ##
 # @MigrateSetParameters:
 #
+# @mode: Migration mode. See description in @MigMode. Default is 'normal'.
+#        (Since 7.1)
+#
 # @announce-initial: Initial delay (in milliseconds) before sending the first
 #                    announce (Since 4.0)
 #
@@ -949,7 +966,8 @@
 # TODO either fuse back into MigrationParameters, or make
 # MigrationParameters members mandatory
 { 'struct': 'MigrateSetParameters',
-  'data': { '*announce-initial': 'size',
+  'data': { '*mode': 'MigMode',
+            '*announce-initial': 'size',
             '*announce-max': 'size',
             '*announce-rounds': 'size',
             '*announce-step': 'size',
@@ -999,6 +1017,9 @@
 #
 # The optional members aren't actually optional.
 #
+# @mode: Migration mode. See description in @MigMode. Default is 'normal'.
+#        (Since 7.1)
+#
 # @announce-initial: Initial delay (in milliseconds) before sending the
 #                    first announce (Since 4.0)
 #
@@ -1147,7 +1168,8 @@
 # Since: 2.4
 ##
 { 'struct': 'MigrationParameters',
-  'data': { '*announce-initial': 'size',
+  'data': { '*mode': 'MigMode',
+            '*announce-initial': 'size',
             '*announce-max': 'size',
             '*announce-rounds': 'size',
             '*announce-step': 'size',
-- 
1.8.3.1


