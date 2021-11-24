Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8B45B8B0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:53:21 +0100 (CET)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpptw-00007m-VH
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKM-0002OH-Ds
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:34 -0500
Received: from mail-dm6nam10on2070.outbound.protection.outlook.com
 ([40.107.93.70]:40897 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKK-0003E8-PI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyQowNa4FGZtUt4IVjhpRQt9S1cg5euRrH+zyE7u3lnP72//Ra0pvwprHNUxfmxHKzcnxWTbLXCqvFl4RSnWInC3xiSivc0TGPVwM7x9k7b5KmR0ZXZFT+PBUTUbl0wo0EG5ltDtty07cgEZLkj1I9t8Y7J9NNSSmov8iUG2hPLL74bgIvt+O6Wq5ZGmIKUC6EFhSTRB6ENvW6q/cVmK/XPhZHiw84Tp1Rys58PnbX8BASebNQhPAL/5bSij0jOLj+Yd+u4kI4tsvjKeahzemeYedccDxe8oGrqCr3RyYTsjtXJis7hYWowCNohzK3wtlg401bG9dsd+FP6JAGA9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZJy76dPPLI+AR/ScLpnGxlxF3mNIXGV8Let227PGe0=;
 b=Nvt/SRDmFln3XS+W4TX1vWnsw3MOh0inJwATQYKbnnQ1ig+riXyxxZVmWXz949IBIySRn+q/4IyX12wT+WnG1KeaTORZgXtyx3Wci2NncbpjgI2m6m5U2wFfLnd6WYH9sFIooWyFPABFWVIbWfrd5GASrhZ22Nqv4kKuxlQmWqQrOID4eY/0C3TX+vn7hPtVxpcR5ybN7CcGhj9Cg2J22oryjE8r55cXyDkJRVzSeUJ0xq/A3nkhFc2s7z/qHhg2AVDVDUppAJtKuGwje+IIak/Yu9AZ2X0ucU4BtXZsIqvOQmyv1cjrnR4EN1lrGRJuprHo6p0uzK+TqlBVExFNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZJy76dPPLI+AR/ScLpnGxlxF3mNIXGV8Let227PGe0=;
 b=l0y8QBIuHKdxLqQ5zGVzbwMBEaaTvK0Z68C7UOy1JYY6bMnMGV8qxZeLLK4NA8ru0/0k8tO+WVoW4I7iNl6HntYTzukSxI0jufBeAN7+R6hsiI4tgF6kHA8O9TDOfUF4WRh9ZtoMk9+w21bnWM7wphDgvW5oooO5BRlNyWTrQX4=
Received: from SN6PR01CA0023.prod.exchangelabs.com (2603:10b6:805:b6::36) by
 CH2PR02MB6293.namprd02.prod.outlook.com (2603:10b6:610:11::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Wed, 24 Nov 2021 10:16:29 +0000
Received: from SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:b6:cafe::27) by SN6PR01CA0023.outlook.office365.com
 (2603:10b6:805:b6::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0051.mail.protection.outlook.com (10.97.5.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:15 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:15 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppK2-00036z-OF; Wed, 24 Nov 2021 02:16:14 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 09/10] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes
 to the OSPI
Date: Wed, 24 Nov 2021 10:15:54 +0000
Message-ID: <20211124101555.1410-10-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ad61e16-9648-4882-ee6b-08d9af337b2b
X-MS-TrafficTypeDiagnostic: CH2PR02MB6293:
X-Microsoft-Antispam-PRVS: <CH2PR02MB62932821E540C7F448D117C6AD619@CH2PR02MB6293.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3kjBJkw6FCyUTrHCzddet4IGU1hWSC6/QdLm3tK9OWOrxh/Hw1vX10xXuPwAaNUOjARaEaGwPiixfP/4evTpCIyHnAvfYEug8c/hexWNGuaJZ+Sg2y8TrUVm6aWpQlmBi8uYdHIK4QscMWjiv9oBsUO5cRZkRmvRsFGrcB5DAF+oRCuqzPKqGkMe1jeAXmR2DuZPFTBLo2gqJ13Zzv7wO9u0MWYMyfamEcsRke9LUphOPqfY/YGO3JcXwpbA7yQjyIKpBv00hgOAYsp4zRYcLk3WOdkHQeXYYHxu6jzsJA8+bzceUfAva++Pd3SLFkezJ4kGHXQQuLOXq3+WnrRCPNPDFGlyCqZsyz6/0BUTNSLb5iCKturG56Yzm45tqPjcrSHGccnM8UQgiqHfeOUInLBqrPXPJdET7j+2H7FnMAcDmCHXwKS0IE0A7OSAT1r0n41B0DfuCvn9J/hkUejlm2cvL4rYNlrAwPEjIWzwr8xB5UY5LAayF/a4qlTSck9xUW2AAthWk9Uwm1jnOvquT563S8Qt2ds41jyYzOA6pxRh4ak2tx8qjNHZ9Sf6ydhzkyLNsaqbsWTLTuoO/+AlfhlY+S6H2hBUgT11wM1BCSg13AGrwKpEXM0vRhkoSajdmLlRO+9F6i7B0bqF1LH2L24a0LGItvi6cEkNmHyUUv3bmPJHRD6OcZZGVm7NNyBr0X9T+G24fZapxaMQESOUzESkXIqh5NxJOV6N4VjgaEM=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(70206006)(83380400001)(2616005)(7696005)(9786002)(6916009)(2906002)(26005)(186003)(82310400004)(336012)(426003)(70586007)(4326008)(1076003)(47076005)(44832011)(316002)(36860700001)(8936002)(8676002)(6666004)(7636003)(54906003)(508600001)(36756003)(356005)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:29.3415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad61e16-9648-4882-ee6b-08d9af337b2b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6293
Received-SPF: pass client-ip=40.107.93.70; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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


