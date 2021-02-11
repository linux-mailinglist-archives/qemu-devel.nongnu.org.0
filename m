Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1B318629
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:16:29 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA79I-0004ma-B8
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA764-0002n3-W9; Thu, 11 Feb 2021 03:13:09 -0500
Received: from mail-bn8nam11on2073.outbound.protection.outlook.com
 ([40.107.236.73]:64865 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75z-0004ao-BC; Thu, 11 Feb 2021 03:13:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTB43+Oremp1vFPWezWislsyq7s9HGZsp82R6B+lZuMJohZSFniHV+wM2b4IsDNxpZAaWatzKPqvbYwE21mWNhW3aT0EA0AoU3YcPoyTTQE9cYCXtsgB/KTJIFUz/meZaBXO51JyGqcYBAKYVdSHLXS+DlE+LHgNkp1C/jE2mwkru1u++/PIsq1PY4qSGPRLQ+PlFirvJyTQpLSL/Q4E6SoyYV9nZ+aOx2U5VgTErSs5/A3oYxpzGABiDdstxOeXrkegzPow/bJGPNh0fSAqMz7ZqZmth/v8+TPYlKthgyp7k7x+6Xe15WGCiN1i6CBig192nKccDlOByprV9NHfeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY506UkXxsO6EhPc+amcUwLCZ5ww9snMvhTZt8m/+Xo=;
 b=BC3vPTw5jP0CdhXRJBo1TXYfnmxW8px6WTD9xR/nx81t224J+EsQuwg0bF5FnaSrZVsgQvJuYDd4/yyKgRYuu7dk9KdMkOP/gRO1ORlcRiyD2Kf2ydPJqbUW8lnuzorAT+UTTjrPRftN58TVVjYzhKX5PbIYUngIiJzat54Su0SlCWai5Ae89GuHQU/MDQ/nxPr0JYCir0VXfyDQHiW/mmMVjAm+fcZm03SBePzNUvXKa3HVHj8l4vi8x8OPLHQdjp6nt93VQLjaWWTk9MG99VLtq3ISw/BwmCiLFqy3cH5VsB0gJGNVtCevWsBueZqg75mQ3m0xMd8Ddt0CS+oZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY506UkXxsO6EhPc+amcUwLCZ5ww9snMvhTZt8m/+Xo=;
 b=nALp9WhImpHeAXWe+erbIQKm0RKdOiSuB9125FKG78Dvzj6O/Mfd2QBW/2wpdYbDYtEGnIaKNIqghJSGEnUB2xK+fEywLtWytIdUlKcksikht11Hhs8QLSGDtH9ayKT1fswFlHjmph+6IpbX7JtdV/X7zR7uZc8+Eit0gifNLbs=
Received: from MN2PR19CA0057.namprd19.prod.outlook.com (2603:10b6:208:19b::34)
 by DM5PR02MB3161.namprd02.prod.outlook.com (2603:10b6:4:61::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Thu, 11 Feb
 2021 08:12:58 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:19b:cafe::ab) by MN2PR19CA0057.outlook.office365.com
 (2603:10b6:208:19b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:55 -0800
Received: from [10.140.6.35] (port=49686 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75r-0000Qa-EH; Thu, 11 Feb 2021 00:12:55 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id F3D0C13C0653; Thu, 11 Feb 2021 13:48:17 +0530 (IST)
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
Subject: [RFC PATCH 12/15] sd: emmc: Support boot area in emmc image
Date: Thu, 11 Feb 2021 13:47:23 +0530
Message-ID: <1613031446-22154-13-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c060275b-e3c7-4321-ceb7-08d8ce64d790
X-MS-TrafficTypeDiagnostic: DM5PR02MB3161:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3161A47FB004444DAAD0E0F4CA8C9@DM5PR02MB3161.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9keHFVamQ5gfQDzBRqZ/WOkgKU+0eBZXAL+XJi8ocNpz5yucKeDx3Oq9QnLBNwBUEYSCIVLzN6TjQeUH0x3yo+Qe18HNVcG81RBWgEtLk/pOuefias+iJS2y8Vhol0xk3+brhqx4DNIrxgs3xXt7vwAfqLddOthHZR1IMqu+H651NTu5FnHN4F3QtByjqfg/u4ap3vukZNrMExxSOewIbF3aGcwydZ3r/coC2gh9KIUTa0wzCuqKLa9x+4CfZ5x782EC/aiO4JQ2YQlXfTrnFWWrEOxGpRJ21qKdCPjnAon0P0wzACsomHAS0UeOs6HSk1ahqtW/qB2gOjE84k6dN01EZAhr0hjHeEXniJpfMYLWmWFYgHXeur0xGXwGV32b2hUUikVKdtPQN9NxvbTXLcN584G6CQSUH6R165yOqCpcQIzGghU4XMdvL3SwogzJAOo96ctD33bvWYu3p5TrOiWdRZid1HZbz6JU8dAJN2Y9lGi8N0/fL0Pqw7gRU0VFPVvNkbTMf2yfNZt0WnOcL+EHB7pNCEGHdYuZ2xyPd2RtIio85VHfQZ66GNPhRgOiL+3Y4N/U3Gp0CI8iGsvXhv4KU4LAeMbGi1/l+oYEKoaPTiQ60F3HX9x8a43TYUTT8gq1FjSTW79mXH9oP6nA3FwBgorVkjp8H9LUKeQBBlIcK56VN/lEy+lYi4GbNT8WD70g5Caees6qF8qD5RklQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(36840700001)(46966006)(921005)(54906003)(66574015)(2906002)(8676002)(110136005)(478600001)(6266002)(36860700001)(336012)(107886003)(426003)(2616005)(7416002)(36906005)(5660300002)(7636003)(82740400003)(42186006)(26005)(47076005)(83380400001)(82310400003)(70586007)(6666004)(70206006)(8936002)(4326008)(186003)(356005)(316002)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:58.0150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c060275b-e3c7-4321-ceb7-08d8ce64d790
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3161
Received-SPF: pass client-ip=40.107.236.73; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
index 54fba7b..55c1104 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1045,6 +1045,34 @@ static void sd_lock_command(SDState *sd)
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
@@ -1360,6 +1388,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1379,6 +1410,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1435,6 +1469,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1465,6 +1502,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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


