Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A148ED5F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:48:07 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Oo9-0000YO-SY
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVv-0002uy-C1
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:15 -0500
Received: from mail-bn8nam11on2083.outbound.protection.outlook.com
 ([40.107.236.83]:35297 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVs-0007Xo-Je
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbeDG/8OiCTpqPwofYvfDDYMQ4ghuxwaJ/HVTKnChSmsWcs0yAdDdXw6jJazStsT1XouTQHHClzHmxEcXeNxq9fTKBAQ2KsjAbqEMiDovQI7zN74/QJDND4fvb23pYDz4dQeFRkffbGAc9vh8A3NWjjdM0Fv5RPYk2VC0+lTYCfSZr/XaVZSu7hnuSWPajchcUSDqF1A648ys7sRQ0FSHqhWJE/xkAmNR8oJ/UpDH7nyNtycDTfuV/Oiwc4gsXUs3orggyNLjWaHEsrDpuSJP/Qd3qYsKyyyd2SHo6KBnO2nCdRdDoFWHZxhbJ3eRN+u5pTtv8W3R4qUcDEw3NXpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI+gNn1f1uKo1ecJM6Hxi2WEtfrRNW3pS3X7dEXtD54=;
 b=gVBApbF4zuu4YMlHV6A+Bynd7qDuc5ZjwSb4FFSWZ+imoGljn6rc8ju5pAsm58ntrF2t3TdXe4Z4vODPKcDPprZ4pM23t0hdbrDmR8NN/hdpz6UU67JC+FkQOj9T/u19M35Onecb4lhG38094Vx/OkFEGgXJpq2GBAcyPe9L1iJqbIyBJEkKI4MTAv+qKCfQJim4K2syB2YS5qdonwXHjS1rW/pPoTgz0S1tEHh97kU8m8xhT61RQUL0jG9ot3oNkiZWEE2pOFIVS91qMIh8+4pSdGavWcY8fgWsFGqA1/fWaq293vRvR3rBlq5pLLcKOPcJz61HRmEfXzPr9KmcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI+gNn1f1uKo1ecJM6Hxi2WEtfrRNW3pS3X7dEXtD54=;
 b=QMqYtJxnqfInq9ubY1OSfTGjgik5GR2NJbrSZZwKnE6M3yo01tl1E0DEDFhdSx2HNHbJNeuicBGrjFzZTC2aIwbTvHvhb0Z5Ao6r4UJqC7ne95QXrCRoKHqF4zhHcAc78bfLBKi21QMx6TPt6d9mIDtlNtItbJnYmC24pP1FTD8=
Received: from SN1PR12CA0108.namprd12.prod.outlook.com (2603:10b6:802:21::43)
 by BL3PR02MB8068.namprd02.prod.outlook.com (2603:10b6:208:35b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 15:29:08 +0000
Received: from SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::43) by SN1PR12CA0108.outlook.office365.com
 (2603:10b6:802:21::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Fri, 14 Jan 2022 15:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0007.mail.protection.outlook.com (10.97.5.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:29:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:29:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:29:03 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVj-0004L4-Ki; Fri, 14 Jan 2022 07:29:03 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 10/12] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes
 to the OSPI
Date: Fri, 14 Jan 2022 15:28:39 +0000
Message-ID: <20220114152841.1740-11-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ffcefae-e938-478d-031e-08d9d7729b9c
X-MS-TrafficTypeDiagnostic: BL3PR02MB8068:EE_
X-Microsoft-Antispam-PRVS: <BL3PR02MB806887E998A07D323821E220AD549@BL3PR02MB8068.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHwBIpH5rG+brbfmFtZ35Y/U7sIb5cO/T46px5NgY+fMk7j/aZAZzZF4VFr/Ns3ROqw+BWGfXUHhiBicYv/+AD1tSUQVWmJTR1GlphwEOuq7l3bY7oUXgq14HTH/nknpcdFtcUYsoTBlR3RJ+6IG2BFy8GTagWfmDeFfY0/wqPVjYTTE3zTLjYVaISWFT8OURPIysR/qvVy+52hTiAx4lNOZib32JqDdBpo7cELhDzGUGpiT6NNR48GYGLkPbYrdJgOEzaNySSHW7OLhA455hNUWW12y5N0Jp3B0/0cdC9usgJCgbQSL1p7ZIsI5sO0gv7wt1UkPy/8rx2Jr/Jvmk/luKH5uSXaDf0JEnrpgs229e0kRD0O4BT0ARStHPkXfPiu71OOUrgZLZH4XAfqeyASXCRCDW5LKIbMe4UmxoIEiAPIrKKoRoerQxw7V4bGQwqoMrbmJZKY5bj6a7Ddv0R3NFv6h/9SFb9k+1kRhbCzIWIoVOdHXC75xxhwomvIPkynbSxiZsxExx2/galpkfrqixdG2+0nNXD/rwLa69T0Q/Spaa+Z5QOM3aWetKw3oafZuPSRvss1xgN6Zsf6hailVlSYL9CAkun7QYTXnWd4QtjGodLgf5qX46ZGzPLrhNtmp091IklG9q5zSzzAphLjGSb0V/W1nmvyS8GSXM1p5K1Ka6Fpcc0flqp/1NoRTzK2nYlttFHB1leHsc89/mWwgAl0e3QajWtloKsl3FXg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6916009)(7696005)(186003)(356005)(26005)(2906002)(9786002)(6666004)(36860700001)(54906003)(8936002)(5660300002)(4326008)(70586007)(8676002)(47076005)(336012)(426003)(83380400001)(44832011)(70206006)(1076003)(7636003)(508600001)(36756003)(316002)(82310400004)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:29:08.5791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffcefae-e938-478d-031e-08d9d7729b9c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8068
Received-SPF: pass client-ip=40.107.236.83; envelope-from=figlesia@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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


