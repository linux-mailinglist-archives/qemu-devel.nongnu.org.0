Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02214465216
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:51:39 +0100 (CET)
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRtS-0007RS-2L
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:51:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjI-0004FN-Ak
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:11 -0500
Received: from mail-co1nam11on2049.outbound.protection.outlook.com
 ([40.107.220.49]:36032 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjG-0000Jt-OQ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUTWl3LggxbZfP6nwHDhv8AHmitUlA3I8rt58TbwaFaPMzZOzK3SWWo1liwBCk118BRTZkLd2lR/VQq5qgRllwf+JWV7YbsAUskd77suAMEvge3CGUsSoCTmhEEQLY3TTdZQ+PORNvbrkwF2rXdux3zhaeTmdCxSyQ3bx6EH43FSZMWcyPIss5XqsbEK5ORt/C5WaCEhg9WO39/RtiwDxjNwGvE0Q3X/FUMlGz7oAhV460xWG2nzoYIly1ETf85RkjDhaidk+1SOpjHjwqF2K7UAwet4jvKUzRncCL4hSoQjufCPA6UsoUQ3uaFz/EU6HkJ4Xt6616x3SKMpPoXQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZJy76dPPLI+AR/ScLpnGxlxF3mNIXGV8Let227PGe0=;
 b=ibZMRnVGLtQhHPswsUwer8OIUZTOz3X9i/klX+1aAvgXTzHzoxZX5aJDa/spFdjSVyDUFIGU8ajqXGK/McgO4uDfKIOCkgkSfEWotHhyVvO0LZoQ38k8+tCHglw3SsEvdvgj3VdIjhoQdht2SgwjwmUtH/JjLqPKWzk0M2Xexr2TFK2nhPcD88kC7cfhtAsKwHJNxfsNTtBkwTixeyg0bfKC5d1MUjTMmM/LWdiV0xomhL+IdJmwXTf1/d4xOwmHSabQ+l0yaiSobNvLZlzrX4+xqf8o4ai1NqzrJ0Oh13NxF5QbOEaCbtOZNddUEsxu4JBha+qoz8j6zvApnxytNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZJy76dPPLI+AR/ScLpnGxlxF3mNIXGV8Let227PGe0=;
 b=OFnBhhuKmKzvXTGgT+UKP7Oq9t2GAUfujnqBWkp69Ck1mltKQpFPxrn2UE4f9Cu6DDrMpk7ry3MeOIw1fmvUsS3Gcln0K4IFa90yuJpKc0SUfMk+xgdS0AQFTXxf3EiDtTuosaW8kLdjf/+/c3wKujGospA96O0mb8AKxDWwMMg=
Received: from BN9PR03CA0180.namprd03.prod.outlook.com (2603:10b6:408:f4::35)
 by PH0PR02MB7733.namprd02.prod.outlook.com (2603:10b6:510:4c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 15:41:03 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::1e) by BN9PR03CA0180.outlook.office365.com
 (2603:10b6:408:f4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 15:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:41:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:43 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:43 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRit-0002FY-Db; Wed, 01 Dec 2021 07:40:43 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 09/11] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes
 to the OSPI
Date: Wed, 1 Dec 2021 15:40:21 +0000
Message-ID: <20211201154023.13931-10-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5cb134a-d1b1-4de9-f2ca-08d9b4e0f9bd
X-MS-TrafficTypeDiagnostic: PH0PR02MB7733:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7733705E4EB0C399379864C0AD689@PH0PR02MB7733.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FbdUta9YVE+yio9Y5BkyZAqY4jUNpnEMjP0EZ4l9crCA39lZGU2avkKQk4t278lT2/knMhZKxXTbudO49Kpxkq+IYJQkg4tP4AIL3KJrVHC59fIirujCvmB3N8Gmxj8oZgx7XqHgAdh9hkwj34fbfJAiiQ8We054EZU1qFuRA89oyNtO2+NAotk3gBc2YgHvKvaI3qoOgnCkv8bSGaZ6QBFGoVejNZMnPdae6vYmdIzjvbOAtR3rAcgaUirMBn7Z63GRkKZrAd7TbTT7/jOhYYCP2NIjJsEUyp2H4NIsNWusuEFQx02AR8HQFucGM3OqebsbgPOaQKO/vLafElBJZUC5kf5bKl3OEjcgr/hosUiToT4K2mYlHWfFRYNwH2JdV4pI0Pj25nJz/dAz2M8uojSmCmUZDtdUwVfGM2Pe5mHF+8lj0hkM1rInqyL9N1MqQvyeJBTNcm4nGEuD7p8UhEfUfKXvxu4+wq0GyDUx+22Rik4OXzhSk8TpJzHMY7KbATHDGtNj6s5tmgJ0Rnnumgkr3Om9Al5vDU7U54gdQVEysWx87Z5Hzc+AL4vsdEhyZ/4yaNor0Ub712gltKeSvbinz+fxjcl5GE0Y1gIZcluq302pM+tyZ5aCw0uEeVHkxsTyjfX4tkHkwgU0yqh+kQIA8SEXaP+I2LEPnEGTUh9zN4179nQfxIPuOcCCYuSheU+xDP5jihQpyffEwtUZvMXVlilzsB5kGXgZdi7chI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(70586007)(2616005)(7696005)(2906002)(8676002)(6916009)(508600001)(1076003)(70206006)(5660300002)(356005)(36756003)(316002)(4326008)(26005)(8936002)(36860700001)(426003)(336012)(6666004)(82310400004)(54906003)(83380400001)(44832011)(7636003)(186003)(47076005)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:41:00.3722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cb134a-d1b1-4de9-f2ca-08d9b4e0f9bd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7733
Received-SPF: pass client-ip=40.107.220.49; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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


