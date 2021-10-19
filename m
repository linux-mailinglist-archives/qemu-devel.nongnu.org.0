Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F947433842
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:19:51 +0200 (CEST)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcpy1-0005SX-UU
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpuR-0000yx-8r; Tue, 19 Oct 2021 10:16:07 -0400
Received: from mail-bn8nam11on2057.outbound.protection.outlook.com
 ([40.107.236.57]:12352 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpuN-0001bM-RH; Tue, 19 Oct 2021 10:16:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLbqKhggsLd8CLLeWXdUW/mdUiC2ylExtu0EwBMpiCYl1MMKl5afQ6L8RtxW0fUfpekXchWlhQM9sHftYvsCdbt1K1JAkkxBuS0Q+aTYEkBXCzw2Kclkg4nq3/Vfhcx5giVAIXgjjkCjRjtk8dVjaOT2lPzTjn/ZWTxWNIZ1QxMFCQ3k4QIgnUjH8R0oIpjNCf8sOIZXsUrOt5hft4qnOTgHvQEouYAwG7QSQlBiQ/i2gAPH9DMU+NPdTLwwxWJzUBljvweyOFA4k8O0mrXkhnudZ92HSLHJ5ZRq8bAfeA3AiCqer+HjfhOZRdEnHsUZwCr9gLaZfoQ/zHVecuW1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWb34RM8h/XM2+fsGDw2wKhtloEpJ1gAhAf7pnlN9p8=;
 b=DoUW6/Va3zsP3GBt3Ha5DMwCgCRVNrUt8SxEtKm3b0Ah5LZj0jy38CjkRv/ieJhJE7SeZDG8A4yCu/dsm6GqAvvLODl/XAFv70eM6G0U29GKSumUGA0axCf1hIqiheemeeQipWvPSELIxqr70nSXPBjAVcI4/s8O1ENEAUx82Ft8kv/f7bWBzvdGrRpUTJUpDSEbHzsmeVGlsVGBo4nw/06AcdK4B3Ascd1eBIaSL6swcdn1SZ8Amhy3TyClwH2exIetkjOUvNuFiSSnSto26FXIEwvmpPQlgdgNa+/auFUJ7CmncR6qMpBeO3IVaacbmpl6udLXT7ZhgAnxCnHALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWb34RM8h/XM2+fsGDw2wKhtloEpJ1gAhAf7pnlN9p8=;
 b=Da+BPGoOI3mGqxKvBzOZZ0gj8hHHr5MO4dWtls9C3EYRfNjJfj1oXyvN9noofz9yQJ2MMMyLHl0b7dnv2pJSxUgzY8yJTQa+b6LLfoUfzgdArvoqMVTfPCIU0SBf5qUz8rOEzbNFlI9Uw6T0aZlrkaSo3FjR41N+qHrh6+5ZZTY=
Received: from BN8PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:d4::30)
 by BN9PR12MB5164.namprd12.prod.outlook.com (2603:10b6:408:11d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:16:00 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::da) by BN8PR04CA0056.outlook.office365.com
 (2603:10b6:408:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:16:00 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:15:59 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 13/64] vl: plumb keyval-based options into -readconfig
Date: Tue, 19 Oct 2021 09:08:53 -0500
Message-ID: <20211019140944.152419-14-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1794ede1-7775-43eb-a35d-08d9930afa45
X-MS-TrafficTypeDiagnostic: BN9PR12MB5164:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5164DC12FDCB1DEC597D8A7B95BD9@BN9PR12MB5164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzEtPywLli5WOzCNp+vnR7EyizUtOa/dEnYlOsBB/YZCeMjHNHJPQps9qQug2OPHVSSmlViAaqZyD1gyKAP5VYPgy/Irs9ukmdbw/P/SWgJFKerxtVnghndG7fLmawauI1/sQ2AFbQVJOTMl1eXm4n+JYiFuS5MyQ/06h+26+mcxmjnLBkiSdLsOj/QDDiBqkfy2ypwkm8fvjq/tcab5EsTWxOuCh2tjrJHTF/CmitScj5FKmj6s8lp16mDK3NBoW5i8gfRGPURekWSFIcPWDSGgAis/QThJBNnESAX4f1jV/f8MOZI7YkAMB09IGdcLEP0lM9BWuKdiP75N9rP9qTigLnP0CMHuF85iKMi1/Xrs+OetaqGW6xiiIIkiV7RQVwbA3qc+Cb17+xahiyvXspI0Qwd3I6jUY5fJLsuV+Dyou5s5KzoA0W7Vaqyefd4ZWWVCi19a44YNKMpuPYpUcex6RKFZY2Ie2l/aM8J9Bp2RFNitreRxDF6HCAgbdaNYuIvvCufLmx/pDG2kr0EofRDsNzgoIkH4GFpda/sTnDAP0+1UmDtA4udxkMoGFrF+I4Zzr26+PI2nzjb54MwOKIBbLc0QDyJQIHcuPvXHN8K6mQohJZZ9Pj9xydu38XjaZXwZy8SIL9Qv/WswJSKVRlhmY/kO31f7y1b8MSCQ02vM53rgd0YrJOpjnX714Us9Ue26s+NGbc4o5IqdLTsjfFQ/aBtTE56hPUAX2/h7Vyc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(86362001)(336012)(70586007)(6916009)(426003)(82310400003)(4326008)(36756003)(16526019)(2616005)(83380400001)(44832011)(81166007)(186003)(36860700001)(2906002)(1076003)(8936002)(47076005)(26005)(316002)(70206006)(5660300002)(508600001)(54906003)(8676002)(6666004)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:16:00.7030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1794ede1-7775-43eb-a35d-08d9930afa45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
Received-SPF: softfail client-ip=40.107.236.57;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

Let -readconfig support parsing command line options into QDict or
QemuOpts.  This will be used to add back support for objects in
-readconfig.

Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210524105752.3318299-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit c0d4aa82f895af67cbf7772324e05605e22b4162)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 include/block/qdict.h    |  2 -
 include/qapi/qmp/qdict.h |  3 ++
 softmmu/vl.c             | 83 ++++++++++++++++++++++++++++------------
 3 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/include/block/qdict.h b/include/block/qdict.h
index d8cb502d7d..ced2acfb92 100644
--- a/include/block/qdict.h
+++ b/include/block/qdict.h
@@ -20,8 +20,6 @@ void qdict_join(QDict *dest, QDict *src, bool overwrite);
 void qdict_extract_subqdict(QDict *src, QDict **dst, const char *start);
 void qdict_array_split(QDict *src, QList **dst);
 int qdict_array_entries(QDict *src, const char *subqdict);
-QObject *qdict_crumple(const QDict *src, Error **errp);
-void qdict_flatten(QDict *qdict);
 
 typedef struct QDictRenames {
     const char *from;
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index 9934539c1b..d5b5430e21 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -64,4 +64,7 @@ const char *qdict_get_try_str(const QDict *qdict, const char *key);
 
 QDict *qdict_clone_shallow(const QDict *src);
 
+QObject *qdict_crumple(const QDict *src, Error **errp);
+void qdict_flatten(QDict *qdict);
+
 #endif /* QDICT_H */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 00fde923bc..8f18f506d9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -122,6 +122,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -2113,13 +2114,53 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+/*
+ * Return whether configuration group @group is stored in QemuOpts, or
+ * recorded as one or more QDicts by qemu_record_config_group.
+ */
+static bool is_qemuopts_group(const char *group)
+{
+    return true;
+}
+
+static void qemu_record_config_group(const char *group, QDict *dict,
+                                     bool from_json, Error **errp)
+{
+    abort();
+}
+
+/*
+ * Parse non-QemuOpts config file groups, pass the rest to
+ * qemu_config_do_parse.
+ */
+static void qemu_parse_config_group(const char *group, QDict *qdict,
+                                    void *opaque, Error **errp)
+{
+    QObject *crumpled;
+    if (is_qemuopts_group(group)) {
+        qemu_config_do_parse(group, qdict, opaque, errp);
+        return;
+    }
+
+    crumpled = qdict_crumple(qdict, errp);
+    if (!crumpled) {
+        return;
+    }
+    if (qobject_type(crumpled) != QTYPE_QDICT) {
+        assert(qobject_type(crumpled) == QTYPE_QLIST);
+        error_setg(errp, "Lists cannot be at top level of a configuration section");
+        return;
+    }
+    qemu_record_config_group(group, qobject_to(QDict, crumpled), false, errp);
+}
+
 static void qemu_read_default_config_file(Error **errp)
 {
     ERRP_GUARD();
     int ret;
     g_autofree char *file = get_relocated_path(CONFIG_QEMU_CONFDIR "/qemu.conf");
 
-    ret = qemu_read_config_file(file, qemu_config_do_parse, errp);
+    ret = qemu_read_config_file(file, qemu_parse_config_group, errp);
     if (ret < 0) {
         if (ret == -ENOENT) {
             error_free(*errp);
@@ -2128,9 +2169,8 @@ static void qemu_read_default_config_file(Error **errp)
     }
 }
 
-static int qemu_set_option(const char *str)
+static void qemu_set_option(const char *str, Error **errp)
 {
-    Error *local_err = NULL;
     char group[64], id[64], arg[64];
     QemuOptsList *list;
     QemuOpts *opts;
@@ -2138,27 +2178,23 @@ static int qemu_set_option(const char *str)
 
     rc = sscanf(str, "%63[^.].%63[^.].%63[^=]%n", group, id, arg, &offset);
     if (rc < 3 || str[offset] != '=') {
-        error_report("can't parse: \"%s\"", str);
-        return -1;
-    }
-
-    list = qemu_find_opts(group);
-    if (list == NULL) {
-        return -1;
-    }
-
-    opts = qemu_opts_find(list, id);
-    if (!opts) {
-        error_report("there is no %s \"%s\" defined",
-                     list->name, id);
-        return -1;
+        error_setg(errp, "can't parse: \"%s\"", str);
+        return;
     }
 
-    if (!qemu_opt_set(opts, arg, str + offset + 1, &local_err)) {
-        error_report_err(local_err);
-        return -1;
+    if (!is_qemuopts_group(group)) {
+        error_setg(errp, "-set is not supported with %s", group);
+    } else {
+        list = qemu_find_opts_err(group, errp);
+        if (list) {
+            opts = qemu_opts_find(list, id);
+            if (!opts) {
+                error_setg(errp, "there is no %s \"%s\" defined", group, id);
+                return;
+            }
+            qemu_opt_set(opts, arg, str + offset + 1, errp);
+        }
     }
-    return 0;
 }
 
 static void user_register_global_props(void)
@@ -2752,8 +2788,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_set:
-                if (qemu_set_option(optarg) != 0)
-                    exit(1);
+                qemu_set_option(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_global:
                 if (qemu_global_option(optarg) != 0)
@@ -3385,7 +3420,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_plugin_opt_parse(optarg, &plugin_list);
                 break;
             case QEMU_OPTION_readconfig:
-                qemu_read_config_file(optarg, qemu_config_do_parse, &error_fatal);
+                qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
-- 
2.25.1


