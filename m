Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C024D4F67D1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:48:31 +0200 (CEST)
Received: from localhost ([::1]:39020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9le-0003J7-Rk
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gf-0000Md-FZ; Wed, 06 Apr 2022 13:43:22 -0400
Received: from mail-dm6nam12on20607.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::607]:46081
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gb-0004Ru-GT; Wed, 06 Apr 2022 13:43:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X24Y1OBncDUVfEWcHcUCmWruJXK24/KUKlg7+uZLzV6XwPUbkmyYunci+RIzS8S/1xJQ7a3khJYEdJY1wUkFEGu2tkIPOd5gRg/C+oPblT7C0L52yO+3C26XinzBBgjF/OhVPixwcj9ITFnYyPV77hbjk4a922GbalO7GunbvnLQte+CXz63fS0Y3Ga8XEYqXYpmZe8HUwwnwsWJGIeEBlNyU9ZJi7lL0ObNjzEM7At8jO24XFECZOIE2U1mYakWJlkd8SBlAACQw0ykf5ukQ61JQMUi2cB3TGUMinCXY7g0YywJlm58B1xyBWzJHrfjsPJRNdSNTydoECzX1eemWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10X1PKnLIDK0cL4XhWukLPFTCJmoAhqtkUkBZyMHetM=;
 b=LyuzwzVy4Y7LoF08hXHTVdz8k/lQSlRhkcqFxQuUbVd1E1QXqow1ITATZvMHCaqROWB7pGdoa66wZm51R1rfDiny+Lvxo3cDi7hMJ/mdntO36ZQBi3A3nkQTCfXmt2Al9sw/ljdpHgZ6xjPGdowQqKFFAoXUD2sZUW9M4JE24ado7XD9RZzseNMfU/uvtu5fTVpCXHf4mBdXN/4h0utkdn6GehNjt5neJgJvjZDB7S8aucXLXMV5rHpE/0iCLJYyD0H+FndfhAKvtP3kiGS/9mVlUBsnKZJ3hMwBpj8yYIXCEDy9fq/Ut1Sdn1Lw3qux1Fx8dzCGbO/GQzj83zToEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10X1PKnLIDK0cL4XhWukLPFTCJmoAhqtkUkBZyMHetM=;
 b=bV4rYMgBOzzBNSQfpZNfGWSYHlkt/vFK0mVRTb5WH/WtYXf8Uh76cr1GIT6hPwHvlsHRVdDhML2J0fYJYlaB04aYj/dVSejpwxt/TvPML1dM0E/rPVsF9w18iYwvYKaf/7VoqeNTNrURxjownTVxQxkiTsQ/TVJM3EqxIFyZ+VM=
Received: from SA9PR11CA0020.namprd11.prod.outlook.com (2603:10b6:806:6e::25)
 by SJ0PR02MB8687.namprd02.prod.outlook.com (2603:10b6:a03:3f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:43:09 +0000
Received: from SN1NAM02FT0012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::eb) by SA9PR11CA0020.outlook.office365.com
 (2603:10b6:806:6e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19 via Frontend
 Transport; Wed, 6 Apr 2022 17:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0012.mail.protection.outlook.com (10.97.4.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 17:43:08 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 18:43:05 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 18:43:05 +0100
Received: from [172.21.132.222] (port=46353 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nc9gP-0001DI-0H; Wed, 06 Apr 2022 18:43:05 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 2/4] hw/arm: versal: Add the Cortex-R5Fs
Date: Wed, 6 Apr 2022 18:43:01 +0100
Message-ID: <20220406174303.2022038-3-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ffcf860-8dc7-420c-05bc-08da17f4e9ca
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8687:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB8687B2C8ADB089DACE8AB734ABE79@SJ0PR02MB8687.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrXzsouIuEU8Sqo2gXx/MoDsKCMfv3CTTOI6WXkA/MX63Os9WjcJx6Wo7uvYVc3ciOOc5GmRbeaZejc8RX0rU0tUr3LqGivbD4wUXJVdHraBrmD4da1cAZi5tevkIyP4tPKXyDAzL8TvGbeWeFq/cf9dwhvv31zMj0/5xuVeCzMY15mG7+F0A/PmgVN5Dt3W93wj7FbcOM+nCm43MKua1yrYHBuIo6adA+98ZfR3wVkflucd+Q/tHFIL/L7be7G4yPq7kFJVZEFiFkj4OpyAOadwrHljvLdV5vANJ24fvL6iPCvxDjGnnvIsoNvi0VEAWrBoIs3F0iMJ3mpcOk7M4E5qn3ORfZevGwl5d2cTZMxwvMAizPO9cr+vPmLv3UhGXvp0ldWer9ErQPb3NuusiVSOz1eRXwH3QCnapek7Fs7L0khYE6KYonQsy5a/eflmyEc2RzykTelERLuLq2FxzsaQ197FGXjlMgV4ZTx0LA2x7y8XW/6WmyXazd7e4xd1wTOmDlSkWj/baVR0KgTo+a5ZtkF2azReQkiz5nzxm/Pwl453Z9wJdV9zSgtMc+w/SpW9NiuOYf8wjFSHlPjBHRttfp20pBAhwYNCjBR+aY6O64RVSkyuAmWQTDBwFLJQxAPEIJ9iz7l/XiYriZKPXkCKaCqzR1iHAmsYYygoqbM31u5W7aIZAldk27IXTdRF
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70206006)(36860700001)(316002)(54906003)(70586007)(508600001)(6916009)(40460700003)(83380400001)(6666004)(26005)(47076005)(7636003)(356005)(82310400005)(336012)(1076003)(8676002)(9786002)(2616005)(8936002)(4326008)(5660300002)(36756003)(426003)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:43:08.5324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffcf860-8dc7-420c-05bc-08da17f4e9ca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8687
Received-SPF: pass client-ip=2a01:111:f400:fe59::607;
 envelope-from=edgari@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 fkonrad@xilinx.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add the Cortex-R5Fs of the Versal RPU (Real-time Processing Unit)
subsystem.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xlnx-versal-virt.c    |  6 +++---
 hw/arm/xlnx-versal.c         | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 10 ++++++++++
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 7c7baff8b7..66a2de7e13 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -721,9 +721,9 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Xilinx Versal Virtual development board";
     mc->init = versal_virt_init;
-    mc->min_cpus = XLNX_VERSAL_NR_ACPUS;
-    mc->max_cpus = XLNX_VERSAL_NR_ACPUS;
-    mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
+    mc->min_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
+    mc->max_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
+    mc->default_cpus = XLNX_VERSAL_NR_ACPUS + XLNX_VERSAL_NR_RCPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
 }
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 4415ee413f..ebad8dbb6d 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -25,6 +25,7 @@
 #include "hw/sysbus.h"
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
+#define XLNX_VERSAL_RCPU_TYPE ARM_CPU_TYPE_NAME("cortex-r5f")
 #define GEM_REVISION        0x40070106
 
 #define VERSAL_NUM_PMC_APB_IRQS 3
@@ -130,6 +131,35 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_rpu_cpus(Versal *s)
+{
+    int i;
+
+    object_initialize_child(OBJECT(s), "rpu-cluster", &s->lpd.rpu.cluster,
+                            TYPE_CPU_CLUSTER);
+    qdev_prop_set_uint32(DEVICE(&s->lpd.rpu.cluster), "cluster-id", 1);
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
+        Object *obj;
+
+        object_initialize_child(OBJECT(&s->lpd.rpu.cluster),
+                                "rpu-cpu[*]", &s->lpd.rpu.cpu[i],
+                                XLNX_VERSAL_RCPU_TYPE);
+        obj = OBJECT(&s->lpd.rpu.cpu[i]);
+        object_property_set_bool(obj, "start-powered-off", true,
+                                 &error_abort);
+
+        object_property_set_int(obj, "mp-affinity", 0x100 | i, &error_abort);
+        object_property_set_int(obj, "core-count", ARRAY_SIZE(s->lpd.rpu.cpu),
+                                &error_abort);
+        object_property_set_link(obj, "memory", OBJECT(&s->lpd.rpu.mr),
+                                 &error_abort);
+        qdev_realize(DEVICE(obj), NULL, &error_fatal);
+    }
+
+    qdev_realize(DEVICE(&s->lpd.rpu.cluster), NULL, &error_fatal);
+}
+
 static void versal_create_uarts(Versal *s, qemu_irq *pic)
 {
     int i;
@@ -638,6 +668,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
 
     versal_create_apu_cpus(s);
     versal_create_apu_gic(s, pic);
+    versal_create_rpu_cpus(s);
     versal_create_uarts(s, pic);
     versal_create_usbs(s, pic);
     versal_create_gems(s, pic);
@@ -659,6 +690,8 @@ static void versal_realize(DeviceState *dev, Error **errp)
 
     memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
     memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
+    memory_region_add_subregion_overlap(&s->lpd.rpu.mr, 0,
+                                        &s->lpd.rpu.mr_ps_alias, 0);
 }
 
 static void versal_init(Object *obj)
@@ -666,7 +699,10 @@ static void versal_init(Object *obj)
     Versal *s = XLNX_VERSAL(obj);
 
     memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
+    memory_region_init(&s->lpd.rpu.mr, obj, "mr-rpu", UINT64_MAX);
     memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
+    memory_region_init_alias(&s->lpd.rpu.mr_ps_alias, OBJECT(s),
+                             "mr-rpu-ps-alias", &s->mr_ps, 0, UINT64_MAX);
 }
 
 static Property versal_properties[] = {
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index d2d3028e18..155e8c4b8c 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -35,6 +35,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
 
 #define XLNX_VERSAL_NR_ACPUS   2
+#define XLNX_VERSAL_NR_RCPUS   2
 #define XLNX_VERSAL_NR_UARTS   2
 #define XLNX_VERSAL_NR_GEMS    2
 #define XLNX_VERSAL_NR_ADMAS   8
@@ -73,6 +74,15 @@ struct Versal {
             VersalUsb2 usb;
         } iou;
 
+        /* Real-time Processing Unit.  */
+        struct {
+            MemoryRegion mr;
+            MemoryRegion mr_ps_alias;
+
+            CPUClusterState cluster;
+            ARMCPU cpu[XLNX_VERSAL_NR_RCPUS];
+        } rpu;
+
         struct {
             qemu_or_irq irq_orgate;
             XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
-- 
2.25.1


