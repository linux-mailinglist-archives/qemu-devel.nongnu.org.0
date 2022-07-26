Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549AB581835
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:15:53 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGO9v-0001KL-Af
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNB9-0004kO-DQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:13:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAx-0006ME-RI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:13:03 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnPIw006232;
 Tue, 26 Jul 2022 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=FZbECMmy0A6yeHc+ZJjpbphG6Rxb7zPlETgh6KENBnU=;
 b=gVymN89Yvai6Hqf3O5gXIUGZD5duqs5CUl4s4fSpeRcygqiwCOxpVrBH5PcsWvSGALEg
 qIoU7aWnIWVHCS4e3Hj8B72LjSG9OKAzcjahZuAf6VhJLmVW8BbDD9vYW7c+YlDFEfAw
 m8F+SYXwtJGivkKYr1tC/bmLWHEAwDVZ6If9+ITPjybGGj6jeh9rithWcChW0UzrJ5lB
 M064xEM7X961LMfx30clp3tX5+T5FyhCy5ufZzA5rXAne0lG5V/tO6GfMRau5DbdNOZg
 i0HagRjGjWsCTmz6sN0VZL6p1RiDu3vvevDxmE/bWNUv7gIBts9o8GzRGGWgtmOTtEV3 uQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940pu1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:08 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEbnNE006229; Tue, 26 Jul 2022 16:11:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:07 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSd023334;
 Tue, 26 Jul 2022 16:11:07 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-16; Tue, 26 Jul 2022 16:11:06 +0000
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
Subject: [PATCH V9 15/46] migration: cpr-exec-args parameter
Date: Tue, 26 Jul 2022 09:10:12 -0700
Message-Id: <1658851843-236870-16-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: CPRhCrBnOVXJd1W1XmHsW-l2LDWmlfeB
X-Proofpoint-ORIG-GUID: CPRhCrBnOVXJd1W1XmHsW-l2LDWmlfeB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Create the cpr-exec-args migration parameter, defined as a list of
strings.  It will be used for cpr-exec migration mode in a subsequent
patch.

No functional change, except that cpr-exec-args is shown by the
'info migrate' command.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       |  2 +-
 migration/migration.c | 15 +++++++++++++++
 monitor/hmp-cmds.c    | 20 ++++++++++++++++++++
 qapi/migration.json   |  9 +++++++++
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 182e639..6f5154b 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1006,7 +1006,7 @@ ERST
 
     {
         .name       = "migrate_set_parameter",
-        .args_type  = "parameter:s,value:s",
+        .args_type  = "parameter:s,value:S",
         .params     = "parameter value",
         .help       = "Set the parameter for migration",
         .cmd        = hmp_migrate_set_parameter,
diff --git a/migration/migration.c b/migration/migration.c
index 0e62227..80b7d09 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -923,6 +923,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     params->cpu_throttle_increment = s->parameters.cpu_throttle_increment;
     params->has_cpu_throttle_tailslow = true;
     params->cpu_throttle_tailslow = s->parameters.cpu_throttle_tailslow;
+    params->has_cpr_exec_args = true;
+    params->cpr_exec_args = QAPI_CLONE(strList, s->parameters.cpr_exec_args);
     params->has_tls_creds = true;
     params->tls_creds = g_strdup(s->parameters.tls_creds);
     params->has_tls_hostname = true;
@@ -1615,6 +1617,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
         dest->cpu_throttle_tailslow = params->cpu_throttle_tailslow;
     }
 
+    if (params->has_cpr_exec_args) {
+        dest->cpr_exec_args = params->cpr_exec_args;
+    }
+
     if (params->has_tls_creds) {
         assert(params->tls_creds->type == QTYPE_QSTRING);
         dest->tls_creds = params->tls_creds->u.s;
@@ -1716,6 +1722,12 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.cpu_throttle_tailslow = params->cpu_throttle_tailslow;
     }
 
+    if (params->has_cpr_exec_args) {
+        qapi_free_strList(s->parameters.cpr_exec_args);
+        s->parameters.cpr_exec_args =
+            QAPI_CLONE(strList, params->cpr_exec_args);
+    }
+
     if (params->has_tls_creds) {
         g_free(s->parameters.tls_creds);
         assert(params->tls_creds->type == QTYPE_QSTRING);
@@ -4481,6 +4493,8 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT),
     DEFINE_PROP_BOOL("x-cpu-throttle-tailslow", MigrationState,
                       parameters.cpu_throttle_tailslow, false),
+    DEFINE_PROP_STRLIST("cpr-exec-args", MigrationState,
+                      parameters.cpr_exec_args),
     DEFINE_PROP_SIZE("x-max-bandwidth", MigrationState,
                       parameters.max_bandwidth, MAX_THROTTLE),
     DEFINE_PROP_UINT64("x-downtime-limit", MigrationState,
@@ -4597,6 +4611,7 @@ static void migration_instance_init(Object *obj)
     params->has_compress_threads = true;
     params->has_decompress_threads = true;
     params->has_throttle_trigger_threshold = true;
+    params->has_cpr_exec_args = true;
     params->has_cpu_throttle_initial = true;
     params->has_cpu_throttle_increment = true;
     params->has_cpu_throttle_tailslow = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index a394526..8794459 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -387,6 +387,18 @@ void hmp_info_migrate_capabilities(Monitor *mon, const QDict *qdict)
     qapi_free_MigrationCapabilityStatusList(caps);
 }
 
+static void monitor_print_cpr_exec_args(Monitor *mon, strList *args)
+{
+    monitor_printf(mon, "%s:",
+        MigrationParameter_str(MIGRATION_PARAMETER_CPR_EXEC_ARGS));
+
+    while (args) {
+        monitor_printf(mon, " %s", args->value);
+        args = args->next;
+    }
+    monitor_printf(mon, "\n");
+}
+
 void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
 {
     MigrationParameters *params;
@@ -446,6 +458,8 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "%s: %u\n",
             MigrationParameter_str(MIGRATION_PARAMETER_MAX_CPU_THROTTLE),
             params->max_cpu_throttle);
+        assert(params->has_cpr_exec_args);
+        monitor_print_cpr_exec_args(mon, params->cpr_exec_args);
         assert(params->has_tls_creds);
         monitor_printf(mon, "%s: '%s'\n",
             MigrationParameter_str(MIGRATION_PARAMETER_TLS_CREDS),
@@ -1190,6 +1204,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
     uint64_t valuebw = 0;
     uint64_t cache_size;
     Error *err = NULL;
+    g_autofree char *str = NULL;
     int val, ret;
 
     val = qapi_enum_parse(&MigrationParameter_lookup, param, -1, &err);
@@ -1238,6 +1253,11 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_max_cpu_throttle = true;
         visit_type_uint8(v, param, &p->max_cpu_throttle, &err);
         break;
+    case MIGRATION_PARAMETER_CPR_EXEC_ARGS:
+        p->has_cpr_exec_args = true;
+        visit_type_str(v, param, &str, &err);
+        p->cpr_exec_args = strList_from_string(str, ' ');
+        break;
     case MIGRATION_PARAMETER_TLS_CREDS:
         p->has_tls_creds = true;
         p->tls_creds = g_new0(StrOrNull, 1);
diff --git a/qapi/migration.json b/qapi/migration.json
index 55f0479..839fcd4 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -712,6 +712,8 @@
 #                         at tail stage.
 #                         The default value is false. (Since 5.1)
 #
+# @cpr-exec-args: defined in a subsequent patch.
+#
 # @tls-creds: ID of the 'tls-creds' object that provides credentials for
 #             establishing a TLS connection over the migration data channel.
 #             On the outgoing side of the migration, the credentials must
@@ -816,6 +818,7 @@
            'compress-wait-thread', 'throttle-trigger-threshold',
            'cpu-throttle-initial', 'cpu-throttle-increment',
            'cpu-throttle-tailslow',
+           'cpr-exec-args',
            'tls-creds', 'tls-hostname', 'tls-authz', 'max-bandwidth',
            'downtime-limit',
            { 'name': 'x-checkpoint-delay', 'features': [ 'unstable' ] },
@@ -882,6 +885,8 @@
 #                         at tail stage.
 #                         The default value is false. (Since 5.1)
 #
+# @cpr-exec-args: defined in a subsequent patch.
+#
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
 #             for establishing a TLS connection over the migration data
 #             channel. On the outgoing side of the migration, the credentials
@@ -993,6 +998,7 @@
             '*cpu-throttle-initial': 'uint8',
             '*cpu-throttle-increment': 'uint8',
             '*cpu-throttle-tailslow': 'bool',
+            '*cpr-exec-args': [ 'str' ],
             '*tls-creds': 'StrOrNull',
             '*tls-hostname': 'StrOrNull',
             '*tls-authz': 'StrOrNull',
@@ -1084,6 +1090,8 @@
 #                         at tail stage.
 #                         The default value is false. (Since 5.1)
 #
+# @cpr-exec-args: defined in a subsequent patch.
+#
 # @tls-creds: ID of the 'tls-creds' object that provides credentials
 #             for establishing a TLS connection over the migration data
 #             channel. On the outgoing side of the migration, the credentials
@@ -1195,6 +1203,7 @@
             '*cpu-throttle-initial': 'uint8',
             '*cpu-throttle-increment': 'uint8',
             '*cpu-throttle-tailslow': 'bool',
+            '*cpr-exec-args': [ 'str' ],
             '*tls-creds': 'str',
             '*tls-hostname': 'str',
             '*tls-authz': 'str',
-- 
1.8.3.1


