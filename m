Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B694962C7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:28:46 +0100 (CET)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwmL-0005Pd-UK
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:28:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwX0-0006XM-3Y
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:54 -0500
Received: from mail-dm6nam08on2053.outbound.protection.outlook.com
 ([40.107.102.53]:14624 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWy-0006CR-9O
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMyP8H5TK+QxuJ6Y239/VwzEvZCSXno4NQMq8JZiSYUfGF6p77DKNRAtU3dxyASWRLHbi5Gl3jXw57LTp0qX7yZlXUor6S/YCwIGl5T/wqcGPCk9fnIHEmtFzAgjDr3TpY37y9ZNw5/mNTP+i4UE8RTa8OUhu+XGWCRk+m0m4sotDXR34n2g/FS1ODJ01PbtcAFmkkV1y8wpUJtP6bmU4ZIMi30pzQz8meCke6F5wE4GNCFoMIq6PckR/1zmGrc6EP/6DnGbqGWBQv8Myhu2IRrDRPK1nnhJI1XDdvXLYxmkwgESAmU9VRbdIC5EupOgs6SathtJmhykEYMCLEM5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI+gNn1f1uKo1ecJM6Hxi2WEtfrRNW3pS3X7dEXtD54=;
 b=GVpV+eQZqvNyBK4DqEDJf8nAN3HBI35Bhhjmebk6oR/f5PUx6A8p4brGFXBmTI9PAjl9h6ixaVuoFNS2UL7lqzXxhFo1rafHcB0cC1YmVc/fMocZ+vMzYnu1crBruQDscSNtdyCD7jpSJBsEZgbUYecOD75f6Yi0fdInsdkecr2OqYi1ADwmRePNnJtpGnXVwO+f1yHtoOA6ACUWdV9id77RbgJKXc/x2ixrTC8mLIbDc4c7gx0lgNMq/nr4fa2VHcNw4mJWHHDI7ZniF1HpjqQHo2TtUSYfD3Dijlkg0WEEluV6lfd/Q+m23s5yzveadAJAN6ow3htS5xF5gB3ZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI+gNn1f1uKo1ecJM6Hxi2WEtfrRNW3pS3X7dEXtD54=;
 b=W0DH0QTJJjMel+opbysrDBGmvwrLf+ac0wlidjuKY/NVO1nVj8QeOqKUYw72UbAk2rleDUkCM2aUZNFCsFEhfIZvHSWErjmpx4IM6CErNSnNnzW+uxjIPBGn1k1jW9YbmA0RgxoOseqQLY5tUr9fl3Y1N0QzQ691NcdW7etIys0=
Received: from BN9PR03CA0364.namprd03.prod.outlook.com (2603:10b6:408:f7::9)
 by PH0PR02MB7240.namprd02.prod.outlook.com (2603:10b6:510:1e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:12:49 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::5c) by BN9PR03CA0364.outlook.office365.com
 (2603:10b6:408:f7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Fri, 21 Jan 2022 16:12:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:12:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:12:11 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:12:11 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwWA-0002nH-Fy; Fri, 21 Jan 2022 08:12:02 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 09/10] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes
 to the OSPI
Date: Fri, 21 Jan 2022 16:11:40 +0000
Message-ID: <20220121161141.14389-10-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd80cc12-8481-4ff7-bacb-08d9dcf8de81
X-MS-TrafficTypeDiagnostic: PH0PR02MB7240:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB724050A6F4E66F65A843E1CDAD5B9@PH0PR02MB7240.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvlcC7LXNuIB//00pKtxcnyX0UjHwz7ZxJfh52BTgBlXrWYUxMlHxzYVOL0h6BLCFsNA1GH51RiTn02Kh8Mbc03dPY65WHMtZYCdo/kxXkzka/Yf0ughGS++9DT4aDLIb5AeZPYQZvyhZLaOdCkYRixmjJR1z88cGD5Nxj3ZRjCEnyJHNAQXR9QPZCokzPHg3VM73WfdXyOoDPS6/ySadHQvAsuw7Jgear/VVxfEQhx+4Pd51W35lq8UaZJ8TxdexGIgG45cxayboBl6ce/waIIJM8+fj2EKON3TOC3yEtwIV2VzINPTrXnEuNq/UdU1hrFL0XgZ3+7emuW/K2ARJBKb5eyG74mo7yossEZhc5gjo6FMomJtAr3BGczNOMLFArAZbNmtDiIa/oCRj1ZgfH+n4Ge9FcauHqL7pl0tw07Benrc3z7Z7FbhdeCIEX36jok6KYolilxnuVJIrJBraurjG++OSb+qFV5L7nFpk707LSy56Fm1/VL7GILhxn9urOhAn4AZjtX5n2cU0sN7FomhNGHvdU9GXW0VWnBgu+q8+wxDJ3JW9nld/6TGPHTkbnOJVL1t5k6kny5jCEOpU4pL/JQAhuOhtjjX9D7T/ihzZWULvWPpKeBPrkUYxUagg+6+vKYG9F0qu/E4wqIDxEov970yhmReYhFOEDemPoL69Klo4St2SSVhXrfgQmpfl9SonTFUvJbHPyf7ktlSnL0MSlVTh2t7jXKV/epapvg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(54906003)(2906002)(426003)(7636003)(316002)(4326008)(82310400004)(47076005)(186003)(44832011)(8676002)(8936002)(9786002)(6666004)(1076003)(6916009)(36756003)(356005)(70206006)(70586007)(508600001)(83380400001)(2616005)(5660300002)(336012)(36860700001)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:12:48.5649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd80cc12-8481-4ff7-bacb-08d9dcf8de81
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7240
Received-SPF: pass client-ip=40.107.102.53; envelope-from=figlesia@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
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
index 8ea9979710..3f56ae28ee 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -25,6 +25,8 @@
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
 OBJECT_DECLARE_SIMPLE_TYPE(VersalVirt, XLNX_VERSAL_VIRT_MACHINE)
 
+#define XLNX_VERSAL_NUM_OSPI_FLASH 4
+
 struct VersalVirt {
     MachineState parent_obj;
 
@@ -691,6 +693,27 @@ static void versal_virt_init(MachineState *machine)
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


