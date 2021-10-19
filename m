Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4596433881
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:38:27 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqG2-0007Qz-RO
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpto-0008TL-4e; Tue, 19 Oct 2021 10:15:31 -0400
Received: from mail-sn1anam02on2044.outbound.protection.outlook.com
 ([40.107.96.44]:17029 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpti-0007gG-M1; Tue, 19 Oct 2021 10:15:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMu2ZBJ7mMe6cHZ5P+rhhXdFYpU52ZgmAGdbGeihzVMzPQwcea40L2Q6pKzujHbU5CFn01cVWXIr6/poWuBovdXadEGQFh7x3cRu7si6LoDrC4E+Bi79txRiHf+teQFghB/H+dtPxm2JakQUAABwu/2eEmqGpmcGLr6nJxJ8ClcTSosrFlhp1BQ958FqFaDMb5G0WxIk+/GrLuvqJ44eEwEJRvsk76lcSInoEv7J85NLVwg5I2iw+sJW/SVhmJP7zZwKCrVC9c3HfuLdhSmxdL7L8hRRB4B5GYPxafkvKCd2AfJK6cDKGDlanKLh58j/0OHynK6EARSUYRClZE6kZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvR90lhKuYGGLVI4Lj6wlw1wI7Mceww7cQs0lkEJzBw=;
 b=jXeyJAr3r975b/CFpwLu6jEvntfKZxCgaEGQAXSvbGe40gmPQkOci4jFrPtD/MgvosdNEUPA3NDfr+ih9Pd5is9ZiZBf4NCFnI0aVeWbfcknwOT2HsX5OCgH41vo0WsSRwYi334cqeFjR4oyFRCo5Q0QPw123GQaFSkbOgiTOEMtoVrppuKX2CHjIpDbawojjWHg6dVT9OmymWGc1HuBLqegFSkcBDcmZnPVAQ+/1fA2D7hd/6FSWeYeXNLVu1NS70OS4iBj7BmcOaYjQMQjRQpNRPa7jBFwks+7V+EHlg0wF5FBNsd4EFRKBB34er49VQtm6JTk2AZCMNcEP8qJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvR90lhKuYGGLVI4Lj6wlw1wI7Mceww7cQs0lkEJzBw=;
 b=KcdiQOScJBWvjoY0wcvdLGGsscGAXh0PUIlq8el7ydH+YplrXKyZLlNBdFZKtcnh7jcBz1ctiJt4lgv0anWiHFEmnjgqzEzsnvlFthBhuDeHBSVDb1RUJDSm43+JyPUH5IHnORf6QseB/tC9Qmw7PGh5/IvcygjNvWcu9sTRkXc=
Received: from DM3PR12CA0103.namprd12.prod.outlook.com (2603:10b6:0:55::23) by
 BYAPR12MB3350.namprd12.prod.outlook.com (2603:10b6:a03:ab::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 14:15:17 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::be) by DM3PR12CA0103.outlook.office365.com
 (2603:10b6:0:55::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:15:17 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:15:16 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 11/64] qemu-config: load modules when instantiating option
 groups
Date: Tue, 19 Oct 2021 09:08:51 -0500
Message-ID: <20211019140944.152419-12-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae80c242-0717-4f82-485d-08d9930ae042
X-MS-TrafficTypeDiagnostic: BYAPR12MB3350:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3350025766E57D7E35486C3695BD9@BYAPR12MB3350.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvDcJZhT8Z0ZNXOmruG7p4oIzpNnnDVJ1fm0OHQgW1xkL/BpzIg6kRUKWalv3zdTnk7zMkty06AT0Zl02DGpKO9PWPDtsJbrz9WbbY+qvzAEo/e4ImKHnPXC2tBVHt4R7LLdobpep9ONF73p5bk/RRtJ6060k23FKwQAC7iBgw4XyYQVitPjzetPP9shezWafVsWJy/HyZODoq6W+E2YtpuHSUhIbAgrrlmdLcK8At2bs6MKfJgKq2PSV9xcknDLcfk5yTd6ekEIkTED7lziy95XLOEH+4CKcL2HSWtZtdZ+xSwasZ6DG41keRuuKM3Mpr7j5A49PZF+uSfojVoc5ZB62b05B2fgmit6bp7Qb4C109Gwiu2BRCSYIrIBRMTLI500Y2YxuYNLXcyjEzZEtj1PgRI0ZyiABMK121yNuGpWa2Lf6MjkSiOyP+SwJHMStrm+bUnWyeX9cV4H/VhNhs5yaQ7WcieXUk9MHML0nNU8iW5Wjf1t2WW8xH6Uc/3ZYuvntiZcQUDhqItYNXV20THBdsYuu/RHVjK8fqO3xQk8hSf4rChVkOlwOMMIAdjmHPOPctJwI+CGfwticfgxDlGK2I8k3xKT9gT96mRVVUIQmFcwpL3VYfdcnkrs/MfqRFU5Ck7gfM83CRhy18MvRr35hhls3s8D4odB4h5eSH0PYIhktD6YoJTxLQhn2TBvP9u+jTKLWwELBqYf98lxmOBYSxzGX0Zg2eeaB8is/x2mZc6GXE4ZNeP3DI/E78yNWSIWsW14KvrYyKBhjfSqzMnbea3EDPjhFxtGHA2/F8sLoC89YeF0Rvp65JOjWk5D
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(44832011)(16526019)(186003)(426003)(2906002)(81166007)(2616005)(336012)(70586007)(70206006)(356005)(6916009)(316002)(6666004)(36756003)(5660300002)(508600001)(4326008)(47076005)(82310400003)(1076003)(8936002)(8676002)(966005)(83380400001)(86362001)(36860700001)(26005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:15:17.0182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae80c242-0717-4f82-485d-08d9930ae042
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3350
Received-SPF: softfail client-ip=40.107.96.44;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

Right now the SPICE module is special cased to be loaded when processing
of the -spice command line option.  However, the spice option group
can also be brought in via -readconfig, in which case the module is
not loaded.

Add a generic hook to load modules that provide a QemuOpts group,
and use it for the "spice" and "iscsi" groups.

Fixes: #194
Fixes: https://bugs.launchpad.net/qemu/+bug/1910696
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 632a8873500d27022c584256afc11e57e2418b94)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 include/qemu/config-file.h |  2 +-
 softmmu/vl.c               | 21 +++++++++++++++++----
 stubs/meson.build          |  1 +
 stubs/module-opts.c        |  6 ++++++
 util/qemu-config.c         |  1 +
 5 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 stubs/module-opts.c

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index 8d3e53ae4d..0500b3668d 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -1,7 +1,7 @@
 #ifndef QEMU_CONFIG_FILE_H
 #define QEMU_CONFIG_FILE_H
 
-
+void qemu_load_module_for_opts(const char *group);
 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
 QemuOpts *qemu_find_opts_singleton(const char *group);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 29d6415d5c..70b68ec7c4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2613,6 +2613,23 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+#ifdef CONFIG_MODULES
+void qemu_load_module_for_opts(const char *group)
+{
+    static bool spice_tried;
+    if (g_str_equal(group, "spice") && !spice_tried) {
+        ui_module_load_one("spice-core");
+        spice_tried = true;
+    }
+
+    static bool iscsi_tried;
+    if (g_str_equal(group, "iscsi") && !iscsi_tried) {
+        block_module_load_one("iscsi");
+        iscsi_tried = true;
+    }
+}
+#endif
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
@@ -3372,10 +3389,6 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
-                if (!olist) {
-                    ui_module_load_one("spice-core");
-                    olist = qemu_find_opts("spice");
-                }
                 if (!olist) {
                     error_report("spice support is disabled");
                     exit(1);
diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d609e..5555b69103 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -22,6 +22,7 @@ stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
 stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
 stub_ss.add(files('migr-blocker.c'))
+stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
 stub_ss.add(files('pci-bus.c'))
diff --git a/stubs/module-opts.c b/stubs/module-opts.c
new file mode 100644
index 0000000000..a7d0e4ad6e
--- /dev/null
+++ b/stubs/module-opts.c
@@ -0,0 +1,6 @@
+#include "qemu/osdep.h"
+#include "qemu/config-file.h"
+
+void qemu_load_module_for_opts(const char *group)
+{
+}
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 670bd6ebca..34974c4b47 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -16,6 +16,7 @@ static QemuOptsList *find_list(QemuOptsList **lists, const char *group,
 {
     int i;
 
+    qemu_load_module_for_opts(group);
     for (i = 0; lists[i] != NULL; i++) {
         if (strcmp(lists[i]->name, group) == 0)
             break;
-- 
2.25.1


