Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F2B45A069
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:39:24 +0100 (CET)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTCt-0004eH-CL
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:39:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8U-0004pk-Qb
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:50 -0500
Received: from mail-dm6nam10on2083.outbound.protection.outlook.com
 ([40.107.93.83]:34657 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8S-0000hv-Su
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpKdW28makDy+ngtUFoDKP6g/h05bSXX/v9jecwT7fQ70JfcRtonAxHH1ZMu7xbvu80p5gPAD/sRMay6x4W/2HRi1Tf/f9FdvIQUOh9acTaOluGrqrJk/Q3XDs+5NMQ8OLbDnok5LMSh3/ye40yAkGcvNF14CIHm8c94cpT3K1egpBOc/TTkWwpjiU22um+TxwNseEA1ar0OrRi+sJgjOnxR41lDF1QHucqbxrgojUjoiecorF1iyZLIGhogCz8oSUUpO92xvDt+eLIj9CEFUjhgXSQeshXZyxpNcZPXPVEfASa7yFRCQQOL8qskcAaQPo+sHXB8haUhEyPVTAC6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTly0d94gic82VG47etT7iSF+7nThg9n+fRtCh2LOd0=;
 b=c/2fS0dFQhSPWaocDNphBjxCESte8nKRNPR2h3AXEA1PhPOv/BMmtBtUYdInPzsH9nea4oiMEgjXD+TDBJcD861UlTZHK/QKHZacqYFo3TlDwB+64m0QS2lRlwtPtS83nr9VdXGWhqtJOPd3cvlo9K9vHdNilU2vpPTTSEOkKJQ+SCxovotKL2w3eOsWaUwmCxq9UnGaOWWMp727b5J0y0cyH3iqtc9eenArfhXHIOuxMY8ZGa/myJZo5ONc2Pntpe3SjmefRFZuncvmB+lZP6RB2gepT6Lq9sTaZjRUBKWGmbJK3qQChzhd57QOyoiH2MlqVgTJAZ34NOddSZEAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTly0d94gic82VG47etT7iSF+7nThg9n+fRtCh2LOd0=;
 b=jjcTLQG9IXW37RdbRM/WIsujSCPQVHvbZm/VN9pVmmesu8IHMoWxIUvsQhEtPCbkPrNbjeWkFKxAZCO28JMko8W74ZPKukNYqBe4Ij8ipaI8Mupqc4ghyxz0xACnTiiuv59hCRPRWEIR1pCHTC8b1NNC38WtBQ7PoubsFk9ppkg=
Received: from DM5PR13CA0050.namprd13.prod.outlook.com (2603:10b6:3:117::12)
 by DM5PR02MB2827.namprd02.prod.outlook.com (2603:10b6:3:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 10:34:46 +0000
Received: from DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::13) by DM5PR13CA0050.outlook.office365.com
 (2603:10b6:3:117::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Tue, 23 Nov 2021 10:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT035.mail.protection.outlook.com (10.13.4.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:34:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:45 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:45 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8P-000GX6-K3; Tue, 23 Nov 2021 02:34:45 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 09/10] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes
 to the OSPI
Date: Tue, 23 Nov 2021 10:34:27 +0000
Message-ID: <20211123103428.8765-10-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5519fd3-4efb-4208-7ecd-08d9ae6cdea7
X-MS-TrafficTypeDiagnostic: DM5PR02MB2827:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2827FA3DB4440F02174F0340AD609@DM5PR02MB2827.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7RPNd8okVOMBHJRrSRH2byju65rf/kyYW4MyL1J68OPYFaNr6KYitOnBOeV41VLRUwh1fLmIoBDiP2rjC7j+0JEzu+b3PcyXWVLkuYFg5EUtaD6izmW+xWKodchlsUq5lUAXEn+/78UY/fGtBTdtLyMs5ruMvy/+w1ajErnbmjGC9SPjBHgzPLTMI+O3dSLeWL7yXoeKf5uHuq+SYvPLRDtDdJldBbkJl6dm1WJ/FWDXt8SER6hyBF0q9MWANy3P+79l4PsuqSGXwnCE5erJNkH+obsn0DXVRdmuI6mBXBwEMOghGeEkFZe8HpdDemD3bKnJI1wlhi5NXMtoYU9UowDyyj8FL6jcpXCYN6hPcZJ8r1FUr3E5nz8Fvz7I0cPzRa5ErbNox79W2fWeuxnajpxww0riIElbOPR2oJpftZooPQ+EGsrXomrixkLijp3C44C5oitRE+9lyKt0EteXEHTi9g8aUdDGm34bEGJrXR5UaEM+2QNHiDjzPSluUzJy8DgWcjrlvrAKT2oSkY70nIt6hNyaT1n+jN2PyD0QbRuZ6Mf1BOYk0UvgcsMagiEUpxvgeWRI5No1JqU1SP6JcRQrLdgilytPf8rQcSebbTuJxfPfXeh0Q6pRQtUoJAdKJv+iSxejvo57XG7F5VOLj1y+W0iWhhzm/FWxetUrBA7GqqVUxqp4Ty0TWELc3FfTB+cEWGjig9i8HYn9/yLxnBgewG19IvQb89F5FWeX68=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(36860700001)(6666004)(83380400001)(44832011)(356005)(186003)(82310400004)(336012)(47076005)(426003)(70206006)(8676002)(70586007)(7696005)(26005)(7636003)(54906003)(9786002)(36756003)(36906005)(316002)(508600001)(5660300002)(6916009)(8936002)(2616005)(1076003)(4326008)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:34:46.3946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5519fd3-4efb-4208-7ecd-08d9ae6cdea7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2827
Received-SPF: pass client-ip=40.107.93.83; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d2f55e29b6..47f5914e5d 100644
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


