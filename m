Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB4474136
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:12:30 +0100 (CET)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5jS-0007dO-1b
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bk-0007l3-8T
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:33 -0500
Received: from mail-dm6nam12on2049.outbound.protection.outlook.com
 ([40.107.243.49]:65344 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bh-000727-EM
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZVvh6I3o/9kL9uSSVr65LyBmm78JcMgY+3DHA025qqpWCkw60xo8Qa+TdXhVZC6bCszQYQ8pqDO6XMKC/Qeil1pcS2o5xfOIoVZIU66AO0RyGth0gCFlfaxsDHZn0Nh8zS0vwrnXqbaMe48PYrkoid+Cf0H76j5K4xv/O5djrIE0mFRGeLnZdimmE55ppmS3YvnU65pDnIvwxTam7U9qWb1YIanDAv20qV980QwDydTBMC7VTDaNK5ZyyipqW9EdDfSZK/A4A/aXVtv5A6QzPBPhJtz7V4daJqvnUUHtwA+ipCLSgbiBwf2DQs6biS8IPV9Vo2Lm31LDUkcLd/+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mz7bAPyX5NI2LcxVpqM+4v80aEV5UhXrf/pG1w9XlrA=;
 b=oJ95IGuIVqW824WAOhenZ80hrIr/YdrUa1QA5BcTh5fMMmYaPqLR2zBL46ZjJZWGJ/oQ+z/zrFuQi8XKDGcOBcKLStSsKRRI0ew9n9Mrv4Hztxg+qgw3t5j4oE9cbwY6upPanH9frQ3TS4I5/FbmGkJ85amCzPQcNrmK32Ocw2bjxS+23I+A0huZAUBIheU9gilFmXm9iJFtGfsNQEyk7CS4u3GElgKf3G9y6nl9H382F4P99lMGpQAMeVfgmSSFgjCMYjUkL1ilblpHyayFMTn7DTQNiN6/tddtNW0VHOKpVAscc4WCcMhGZKlihlmMZ4KK50XCcT6EyhU9hj8wjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mz7bAPyX5NI2LcxVpqM+4v80aEV5UhXrf/pG1w9XlrA=;
 b=XwYu4SbaPp/TSDlGz16mEd5Lo65+b3eHSReCEfp7FGbd8U9Ic2+tDValst7+NHwWjc585yOuG6xzRojWmganYIWbRHvIiod38sNN5iSfWGVMVf5OhMtQupiU7LJp2STZOMcu/XId+LnotjEIkOhMA0GIH/gg2zdPosDEnGGcs7o=
Received: from DM5PR15CA0067.namprd15.prod.outlook.com (2603:10b6:3:ae::29) by
 MWHPR02MB2349.namprd02.prod.outlook.com (2603:10b6:300:5c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Tue, 14 Dec 2021 11:04:24 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::d5) by DM5PR15CA0067.outlook.office365.com
 (2603:10b6:3:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:15 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:15 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bT-000F5K-EA; Tue, 14 Dec 2021 03:04:15 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 10/12] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes
 to the OSPI
Date: Tue, 14 Dec 2021 11:03:52 +0000
Message-ID: <20211214110354.21816-11-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 317f2b84-ec8b-4d77-aaf1-08d9bef17ced
X-MS-TrafficTypeDiagnostic: MWHPR02MB2349:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB2349441AF93F509AC30F3C5CAD759@MWHPR02MB2349.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: seoHqNLfaF7xhzIC5vl+2lUIlfFopbjZzpDw0eDslXg1MYB/9B4S5FjPQ3TelBZ9qz6vqqp82FfGVBM95LFfzOC/kKQIEakXEve8nHyytrgRFHPpj5TAI41aBz/LcQ6nLUrDjAnPAVKkPgG7nRxcCG2WMGjwP+vXaA0BFr5qpw9OZ73dBKfaxwxF+aeSEnfSD/7r5Sx/5uWprG7fn2tDnAV1PpgG1w7zuBoJpc6tEgGNmucgPj0cUV2VbMF9TKzYXECJaaTCGUBJvKJZOD9HGzogtN90y/dPbP9mnC9ZZu3nmsPVcBfelkS5k326bwt5r4PGiSIYIZb+FBAMSQrdk+gsKKjjv38VZoFtUOCEFTXaEGXyb5219RWbUNLvnLn59dnJYbRK03IjJJib6MtLFssc9y8LYoiEBy52BkqJox0jrU4Qd0hJqic2HI2tAwKIfLGmZ2V6vinaHDzSt/w+Uw1ziz+jx+2zGG5LNWu2Yh2DsjUHeqVAGdrXuxTx3vTF+SFkkEum3/HcVCT7mHb/O/y8TXvFMaVjtjccWKq1Gwq2sgaDYjd93gL6RY9vBaD9QwOrUS5i8+K5XOdqaCVDMfiZ9+bLmELQo40i35En1Uy/Cr4lsiD6745xS5yLd4HIeg2FGq2WogY5OAMdwvjKpp/PkcZ/7nMsfM6wiXPei/8eObyQfiZXNJS9rkLWKTHHWNqdKcseNyzw2ASm+s+rBfnMEeK70rEVqg/TqK7CCkQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(83380400001)(7696005)(356005)(44832011)(70206006)(316002)(82310400004)(6666004)(8676002)(4326008)(6916009)(70586007)(2906002)(54906003)(7636003)(426003)(1076003)(508600001)(8936002)(2616005)(26005)(47076005)(9786002)(186003)(336012)(5660300002)(36860700001)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:24.0888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317f2b84-ec8b-4d77-aaf1-08d9bef17ced
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2349
Received-SPF: pass client-ip=40.107.243.49; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal-virt.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 10483582c7..85f15e317b 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -25,6 +25,8 @@
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
 OBJECT_DECLARE_SIMPLE_TYPE(VersalVirt, XLNX_VERSAL_VIRT_MACHINE)
 
+#define XLNX_VERSAL_NUM_OSPI_FLASH 4
+
 struct VersalVirt {
     MachineState parent_obj;
 
@@ -690,6 +692,27 @@ static void versal_virt_init(MachineState *machine)
             exit(EXIT_FAILURE);
         }
     }
+
+    for (i = 0; i < XLNX_VERSAL_NUM_OSPI_FLASH; i++) {
+        BusState *spi_bus;
+        DeviceState *flash_dev;
+        qemu_irq cs_line;
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
+
+        spi_bus = qdev_get_child_bus(DEVICE(&s->soc.pmc.iou.ospi), "spi0");
+
+        flash_dev = qdev_new("mt35xu01g");
+        if (dinfo) {
+            qdev_prop_set_drive_err(flash_dev, "drive",
+                                    blk_by_legacy_dinfo(dinfo), &error_fatal);
+        }
+        qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
+
+        cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.pmc.iou.ospi),
+                           i + 1, cs_line);
+    }
 }
 
 static void versal_virt_machine_instance_init(Object *obj)
-- 
2.11.0


