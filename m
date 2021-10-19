Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AC433857
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:21:46 +0200 (CEST)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcpzt-0007KV-6C
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpu9-0000E5-VZ; Tue, 19 Oct 2021 10:15:50 -0400
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com
 ([40.107.94.58]:15169 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpu7-0000ls-8o; Tue, 19 Oct 2021 10:15:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8iyQBoUhUKZIj0FewDtO7JeSEl4SftHFdOI3HrO37vUQ8PmknGRoxocHKXyQLkymzneeVneUw2Wi8Si5nBPWEaEjrrtqZ5S84KNS8LN4jeuGWlJKO8mRk+WIr6u1R/aAOlRFpw/oTwqxdJUI1tj64RCjx1/I12RK85ONAi8ruv5rRTny0wTME038JTo9sKuv5YVDwgDPUXgPOswJXfbLazYti6hxUSJYT2Rj5CohVeMyeiN/9r3vusSLGbIKw2MkSRtkGZB25FVT+2z7/TwT9K7mPA0I3IilccrgzaCLIb5MxvcutFm+WPmr8zB8fZKtJWsWcI2O+hENE1wdRUTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alyu/i2TwkR8S079eslNyZl6jtkkgtY3RvJk+MKDVP8=;
 b=nkZsW1xNVjpZyEh5TwnrGoFjAcP7rYHnb99lh2FAQDLQIrKeXOTquJofX/FL4AExqinQRV+of5hULBXdKLcSGupZOqy5VlnQCm+w7ZZuAx7r9dpCT31WPCbcovT5w1/9cfabzkDz2yH8iVvJod9Kblxc8IAefijp3jrzWxWnSySy/F5J0T1/y06ZoTswogtvce/35vI1grX1heSIZbCbZxJTSd2PjLKDEP9IBwXQy6QgOaepspqmLeIRdFzR2HnXBz8bkXCt3qcO4VgMxqrI3K9sCUO0pt5ImC/dx12o8ER6beZz/5pVnQ2NfXCuvRJUhnNoIj9duDa3JN5UrrXzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alyu/i2TwkR8S079eslNyZl6jtkkgtY3RvJk+MKDVP8=;
 b=J7xxOxaffGOMPtt+WWNysHzTdv8aYJZqQvSqWEfCNN1mD4/248nTOhKyTgtmAATpR0SfIIKmGSAOSOg8VRehe9KvGis21qBgF3+ZEpoJrsDcUm3iDr7gR7/AY0az2JRZk/pPbbahfn1d2X8uhux+DDcikawQB6gT+y+/mCS0OcY=
Received: from DM3PR11CA0018.namprd11.prod.outlook.com (2603:10b6:0:54::28) by
 BN8PR12MB3364.namprd12.prod.outlook.com (2603:10b6:408:40::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 14:15:42 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::70) by DM3PR11CA0018.outlook.office365.com
 (2603:10b6:0:54::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:15:41 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:15:38 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 12/64] qemu-config: parse configuration files to a QDict
Date: Tue, 19 Oct 2021 09:08:52 -0500
Message-ID: <20211019140944.152419-13-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69a9f0e5-6bfd-451a-be17-08d9930aeefe
X-MS-TrafficTypeDiagnostic: BN8PR12MB3364:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3364A10CE710721E9EE8802295BD9@BN8PR12MB3364.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjxcvIq3wG8+BZGiXFalxG0/opK9n5U/lZ829ZJK8HHTVfDZsoOXzB7ju1+bc0qsde/63+8rBvml9UEV2OUCtRVO7EtgF1nzOc83vY8mhPKgkKukGygwKgKeZLMdsPnC+wqFuojDZUDD9imnyMShBgNN3bBwyJXOi10Wi4m04ueWq1uhiNSozUdSa/fgAoaloL3hoQtja5vBtQeblQ646Xf1I7o0bOQ3/WsVxQcghUy9U4cZnRwSgGABVl9YRtYZ9Xfxj9UTeXLHEDqxA1kwToNV71qAvDuJzf43nl8548tieImpP9zr+7hFk4wu+cVL6DmtLLbhy47F7VkIeBNnjJ+itboiyosD/tcQzqmMvmZL0tz5D0TAJgxyLEzfZsESmehQLBCbkDQXkTPZ2XYLUns8vtvUTPOoc59vHZcpekXxr/6KYVIoUQAGm2sCcWg+ALJQ7nNPNBnrPqL7S0QjTJZEHbKPuKWNXhRM99ryN1hfMhB9u/UdkpT31PZjpErkgsASeowPXsadEixktgcip+qb6DabXunw6SVcbNSdmAPevUf8kQlWiPdiWPh+I5HkIkC5WFSmYNJNx7uqErCxIg+2rlcswK5ummKWkSlHiztFOBcoZWbLnJtXVOF6J5ZbgPZK8S72pILeo2ASNuIh8ac/diXVkYWLsAXPB2cPML/T3koegWfevOCux1gUTEuDGx4QIgcTnMmV1wpXLAeuOuW4gPHGdPp4qVTsdT6v6RE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70586007)(1076003)(70206006)(26005)(36756003)(81166007)(8676002)(6666004)(54906003)(2906002)(16526019)(2616005)(426003)(316002)(82310400003)(356005)(508600001)(44832011)(8936002)(83380400001)(4326008)(47076005)(36860700001)(6916009)(336012)(86362001)(186003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:15:41.7524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a9f0e5-6bfd-451a-be17-08d9930aeefe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3364
Received-SPF: softfail client-ip=40.107.94.58;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Paolo Bonzini <pbonzini@redhat.com>

Change the parser to put the values into a QDict and pass them
to a callback.  qemu_config_parse's QemuOpts creation is
itself turned into a callback function.

This is useful for -readconfig to support keyval-based options;
getting a QDict from the parser removes a roundtrip from
QDict to QemuOpts and then back to QDict.

Unfortunately there is a disadvantage in that semantic errors will
point to the last line of the group, because the entries of the QDict
do not have a location attached.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210524105752.3318299-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 37701411397c7b7d709ae92abd347cc593940ee5)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 include/qemu/config-file.h |  7 ++-
 softmmu/vl.c               |  4 +-
 util/qemu-config.c         | 98 ++++++++++++++++++++++++++------------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 0500b3668d..f605423321 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -1,6 +1,8 @@
 #ifndef QEMU_CONFIG_FILE_H
 #define QEMU_CONFIG_FILE_H
 
+typedef void QEMUConfigCB(const char *group, QDict *qdict, void *opaque, Error **errp);
+
 void qemu_load_module_for_opts(const char *group);
 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
@@ -14,7 +16,10 @@ void qemu_config_write(FILE *fp);
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname,
                       Error **errp);
 
-int qemu_read_config_file(const char *filename, Error **errp);
+/* A default callback for qemu_read_config_file().  */
+void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp);
+
+int qemu_read_config_file(const char *filename, QEMUConfigCB *f, Error **errp);
 
 /* Parse QDict options as a replacement for a config file (allowing multiple
    enumerated (0..(n-1)) configuration "sections") */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 70b68ec7c4..00fde923bc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2119,7 +2119,7 @@ static void qemu_read_default_config_file(Error **errp)
     int ret;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, errp);
+    ret = qemu_read_config_file(file, qemu_config_do_parse, errp);
     if (ret < 0) {
         if (ret == -ENOENT) {
             error_free(*errp);
@@ -3385,7 +3385,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, &error_fatal);
+                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 34974c4b47..374f3bc460 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -2,6 +2,7 @@
 #include "block/qdict.h" /* for qdict_extract_subqdict() */
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 #include "qemu/error-report.h"
@@ -351,19 +352,19 @@ void qemu_config_write(FILE *fp)
 }
 
 /* Returns number of config groups on success, -errno on error */
-int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
+static int qemu_config_foreach(FILE *fp, QEMUConfigCB *cb, void *opaque,
+                               const char *fname, Error **errp)
 {
-    char line[1024], group[64], id[64], arg[64], value[1024];
+    char line[1024], prev_group[64], group[64], arg[64], value[1024];
     Location loc;
-    QemuOptsList *list = NULL;
     Error *local_err = NULL;
-    QemuOpts *opts = NULL;
+    QDict *qdict = NULL;
     int res = -EINVAL, lno = 0;
     int count = 0;
 
     loc_push_none(&loc);
     while (fgets(line, sizeof(line), fp) != NULL) {
-        loc_set_file(fname, ++lno);
+        ++lno;
         if (line[0] == '\n') {
             /* skip empty lines */
             continue;
@@ -372,39 +373,39 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error *
             /* comment */
             continue;
         }
-        if (sscanf(line, "[%63s \"%63[^\"]\"]", group, id) == 2) {
-            /* group with id */
-            list = find_list(lists, group, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                goto out;
+        if (line[0] == '[') {
+            QDict *prev = qdict;
+            if (sscanf(line, "[%63s \"%63[^\"]\"]", group, value) == 2) {
+                qdict = qdict_new();
+                qdict_put_str(qdict, "id", value);
+                count++;
+            } else if (sscanf(line, "[%63[^]]]", group) == 1) {
+                qdict = qdict_new();
+                count++;
             }
-            opts = qemu_opts_create(list, id, 1, NULL);
-            count++;
-            continue;
-        }
-        if (sscanf(line, "[%63[^]]]", group) == 1) {
-            /* group without id */
-            list = find_list(lists, group, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                goto out;
+            if (qdict != prev) {
+                if (prev) {
+                    cb(prev_group, prev, opaque, &local_err);
+                    qobject_unref(prev);
+                    if (local_err) {
+                        error_propagate(errp, local_err);
+                        goto out;
+                    }
+                }
+                strcpy(prev_group, group);
+                continue;
             }
-            opts = qemu_opts_create(list, NULL, 0, &error_abort);
-            count++;
-            continue;
         }
+        loc_set_file(fname, lno);
         value[0] = '\0';
         if (sscanf(line, " %63s = \"%1023[^\"]\"", arg, value) == 2 ||
             sscanf(line, " %63s = \"\"", arg) == 1) {
             /* arg = value */
-            if (opts == NULL) {
+            if (qdict == NULL) {
                 error_setg(errp, "no group defined");
                 goto out;
             }
-            if (!qemu_opt_set(opts, arg, value, errp)) {
-                goto out;
-            }
+            qdict_put_str(qdict, arg, value);
             continue;
         }
         error_setg(errp, "parse error");
@@ -417,11 +418,48 @@ int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error *
     }
     res = count;
 out:
+    if (qdict) {
+        cb(group, qdict, opaque, errp);
+        qobject_unref(qdict);
+    }
     loc_pop(&loc);
     return res;
 }
 
-int qemu_read_config_file(const char *filename, Error **errp)
+void qemu_config_do_parse(const char *group, QDict *qdict, void *opaque, Error **errp)
+{
+    QemuOptsList **lists = opaque;
+    const char *id = qdict_get_try_str(qdict, "id");
+    QemuOptsList *list;
+    QemuOpts *opts;
+    const QDictEntry *unrecognized;
+
+    list = find_list(lists, group, errp);
+    if (!list) {
+        return;
+    }
+
+    opts = qemu_opts_create(list, id, 1, errp);
+    if (!opts) {
+        return;
+    }
+    if (!qemu_opts_absorb_qdict(opts, qdict, errp)) {
+        qemu_opts_del(opts);
+        return;
+    }
+    unrecognized = qdict_first(qdict);
+    if (unrecognized) {
+        error_setg(errp, QERR_INVALID_PARAMETER, unrecognized->key);
+        qemu_opts_del(opts);
+    }
+}
+
+int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname, Error **errp)
+{
+    return qemu_config_foreach(fp, qemu_config_do_parse, lists, fname, errp);
+}
+
+int qemu_read_config_file(const char *filename, QEMUConfigCB *cb, Error **errp)
 {
     FILE *f = fopen(filename, "r");
     int ret;
@@ -431,7 +469,7 @@ int qemu_read_config_file(const char *filename, Error **errp)
         return -errno;
     }
 
-    ret = qemu_config_parse(f, vm_config_groups, filename, errp);
+    ret = qemu_config_foreach(f, cb, vm_config_groups, filename, errp);
     fclose(f);
     return ret;
 }
-- 
2.25.1


