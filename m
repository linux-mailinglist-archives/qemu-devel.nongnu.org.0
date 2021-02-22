Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933F321205
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:30:24 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6bn-0005JN-1Q
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OK-0004ue-Ik; Mon, 22 Feb 2021 03:16:28 -0500
Received: from mail-bn8nam12on2070.outbound.protection.outlook.com
 ([40.107.237.70]:5984 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OE-0001pA-6W; Mon, 22 Feb 2021 03:16:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx0upN9IwFfnrATOdN09WhfRsoFarqquoe223QWIfxwq9/Wsv+HVvqugh7pSARYuISyy855Lw8tP6jSlzHfv8HhNN/YfNBzhMlNz6a/rLtmlBWmGslR+ogEq7Tt5gV3K36Mho2EDVWHqiR6eqjmbrYP7IODtS67Uh2KzDDKTnVkcasYGtBH8dKMkzBpT/0DnzFAGo9Vg6g7xOGqcNxSB7hRhTfBi/k39m6VMNoczgTFgfiLjNKsCOsc6Td6LDVh/72E9tUEmhHACAQU+cLI0jtlq5Zy4Uv/2DnLWoLEJi9pKoWSEmxqtik7I0kkg/xHaalVRHjBPe5HsqOpMYjQcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmAttSmNV4cYbvzomk+tXWtqOZCo6dfJqxdirbK6fH0=;
 b=gzd6H+EXv43QE2THL4CzHa/seGfzNzSySxZorHnAoAGPG9GpCSLi78GPxJEah95ySexRReJo7UDFwsr4I0C8P3co81Z5/nc1mW9+JKLISSAuFV8pMNp1m1ccJWnd7YUXd9Iw60Zx1aRpZYqoiinLugHSEwaWl6LD7p9aYeuwXvsg3I/ZP1gxeYId8E98y2+mn2aJbeB0cUx8pL1BGR7wAW3lsiRBWtCv+I3C1W491MsJERZ/OgE40caaxnmxQnluLlUJ1Jb/61XU0G1h5LSl1R85iIax1WMNndd3q5pkKUg46hHjiLo5YylNY7Bx+G1RtmLF2mPNsGPhMaqeparMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmAttSmNV4cYbvzomk+tXWtqOZCo6dfJqxdirbK6fH0=;
 b=bHXVGdBoEbLCH6nrOkRmDo5ZJFdesVAwKKSzAoiV+nlAhJbXoNmRZN53Kj8ascckfKLbtzLpIZsqWZeoCD4uWZNOmuyqg23DjdaA0jEFTWY8Lnn3zgRb8UfJ4EbxyuAdtCbQW97j4Z/lDLJ64jufTJijszjl9SxPKLR8/Tvdcr4=
Received: from DM3PR14CA0133.namprd14.prod.outlook.com (2603:10b6:0:53::17) by
 SN6PR02MB5326.namprd02.prod.outlook.com (2603:10b6:805:76::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Mon, 22 Feb 2021 08:16:19 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::66) by DM3PR14CA0133.outlook.office365.com
 (2603:10b6:0:53::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59038 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-000370-Kh; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 2B62813C0ADE; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [PATCH v2 17/22] sd: emmc: Support boot area in emmc image
Date: Mon, 22 Feb 2021 13:50:34 +0530
Message-ID: <1613982039-13861-18-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc614abc-9cb1-4806-1844-08d8d70a21d1
X-MS-TrafficTypeDiagnostic: SN6PR02MB5326:
X-Microsoft-Antispam-PRVS: <SN6PR02MB53262184846DD43C5398BFD8CA819@SN6PR02MB5326.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dK4nU9+IJpprNp5ZfD7q1oKUVe9yVjKKtCPrXn3J6z2V1WKIjuqpJvOOX1s4NLkfq2PNdF2iWHxM0k8eYYGRcEuFk3ho6JBMUV+Gz79iu6Cp9Pczo13TjkAeDYWrL4pnGM9VuQZD9OKRYruds5Plc6T4ir7OiISvmyq7jIYdma1L4QaQ2QGJQTvu6olKdE7C0JQt4ETMPweD19y0TxcDonkBw/Kxvw0KCKDV8tE5+jB8S1g95uchUxEVw/gINc5z5zylogti9kj2e2rZ3H2xVWh14IldyE+Uu6iiq39CpUpmDDRcIBPZf/hVfEVlDbbGPwcP/21GaoCsXl50DTzGUdJCwP+GGy7Q3+eyi82cFy1uHoE891jeUAwajOypWjJeGfxfA+e5nDncKXIV/NMpKlgKw0p3JMez/SF1coZPmyUcigNs5eAifYVJaOsbwCg88+80KZmO2IwCHWD3sj2KQ+sUbfiFSLtZEZbYUUEv4Tp9dmwtFe2iszsOYGscC90M4TG7dX8yLicp1iYQ34kdKyLXANYWwWt09lIm+ZI2In8iFfJ3PEdGHNMeoCgA4layP9jnJK1iUBrNoGdy0zcUS0khJIjbl0UycQa7Gntc5KC7DbwMxhFI/brKn0f6S+Z+9zeObiz4FCl4ADDuctwYFzNyTGv86B3gSWD2czHMHR3ncjZ+3UpgSOrNdudNwXrTRsMXzNyLgyUOijqBpQpf7Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(136003)(346002)(396003)(36840700001)(46966006)(82740400003)(110136005)(47076005)(356005)(2616005)(36860700001)(4326008)(316002)(5660300002)(336012)(83380400001)(478600001)(54906003)(42186006)(66574015)(426003)(8676002)(7636003)(921005)(186003)(2906002)(6266002)(7416002)(107886003)(8936002)(36906005)(70586007)(26005)(70206006)(6666004)(36756003)(82310400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:18.9291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc614abc-9cb1-4806-1844-08d8d70a21d1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5326
Received-SPF: pass client-ip=40.107.237.70; envelope-from=saipava@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This assumes a specially constructued image:

  dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
  dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
  dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
  cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
  truncate --size 16GB mmc.img
  truncate --size 128MB mmc-bootarea.img

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - changes on the definition names ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[spb: use data_start property to access right emmc partition,
      Clean up PARTITION_ENABLE support as incomplete,
      Fix commit message to be generic.]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 60799aa..ab29e54 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1040,6 +1040,34 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
 }
 
+/*
+ * This requires a disk image that has two boot partitions inserted at the
+ * beginning of it. The size of the boot partitions are configured in the
+ * ext_csd structure, which is hardcoded in qemu. They are currently set to
+ * 1MB each.
+ */
+static uint32_t sd_bootpart_offset(SDState *sd)
+{
+    unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG] &
+        EXT_CSD_PART_CONFIG_ACC_MASK;
+    unsigned int boot_capacity = sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
+
+    if (!sd->emmc) {
+        return 0;
+    }
+
+    switch (access) {
+    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
+        return boot_capacity * 2;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
+        return 0;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
+        return boot_capacity * 1;
+    default:
+         g_assert_not_reached();
+    }
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1355,6 +1383,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1374,6 +1405,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1430,6 +1464,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1460,6 +1497,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
-- 
2.7.4


