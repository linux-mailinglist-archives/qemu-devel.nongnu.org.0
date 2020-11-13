Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC12B148F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:13:09 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPWO-0005tF-6g
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUM-00048o-Ou; Thu, 12 Nov 2020 22:11:02 -0500
Received: from mail-bn8nam12on2073.outbound.protection.outlook.com
 ([40.107.237.73]:31457 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUJ-0008NR-N1; Thu, 12 Nov 2020 22:11:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/HhHroWJR8pPqOSk2j3rymHFE6ws7105cGUS5SAQ+1NeiuPOHIIit/02z7bekhOqeKb6nenVUJ6I5Xi5ymdoDlqb+cYBP9DJCyaFiyipWLr+StOLwhY7uznUuN5oYb84PhD0ecIbeT6jq/1Y0JEnoHNnihhz/fcdBo4uR093yDqu13kLSyfHAyNLa3/mu8aapEAD/L3tI202I7X9ukw7yOAoxhlieiXTCHYwp2SyAHQGya6Jz+glxHqFXX57CJu0ps9wE2Ef+Nu2PlATpmgsjXAMNOvfDbIhOuI+L6JtZyritxUEL1HekadVXZzd/n+CIUpx9QT/yJqgfRXMI8tVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euaI1M9x3H4lwn8c7NWo2yKUYhwvBn9kDJm71R2d1BM=;
 b=K3CZ+bQQlzYW+Pwj3TvS7CUQDJ2hciXYm96Hpxb7IKkmOEbuUKpv6Hvc9wEQ0UftmtRkE1H+tgYzybhDs/WZgTh4lTD6MI35Vd4drtOoZ+y3BrgJHuczpy2Oe5isWtzVw4BVxR8xv6TotP+4BluTKiLzKi0/8g4R29C77bfTJDAYvkIdcWHdp1lo0RzVZyNSNPkt9uvsWRTajqIqPqN6KYnpas7EGpDLMAW2obNcSfOiOFTKFNDI3v6P+d2S/SdiYeoI9QY735Bjb8j7YmLAZ9OokK6srkMOZW3Ja5TdZw02Hq1mhyOhz4G6WabjlRus8i/XopsX41JZpb27YKD/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euaI1M9x3H4lwn8c7NWo2yKUYhwvBn9kDJm71R2d1BM=;
 b=s61vGDHU6sIajiOnMOr8eYMUu5z9KmkruT1JiQm1+eMEIa5Pa1WcgPERZT6iZYYPYehqWDM4KF7ysJhlbd+RXXI/KJRDLS2S140LjqfIvKmJ+AHvkBOKpZdBxg4WaWBkdcWseng7W3SJiyCYVcAKtRfwEGpelZ4zw0CK1Fqlvs8=
Received: from MN2PR16CA0036.namprd16.prod.outlook.com (2603:10b6:208:134::49)
 by SJ0PR02MB7327.namprd02.prod.outlook.com (2603:10b6:a03:29c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Fri, 13 Nov
 2020 03:10:57 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::57) by MN2PR16CA0036.outlook.office365.com
 (2603:10b6:208:134::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 03:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 03:10:56 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 19:10:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 19:10:55 -0800
Received: from [172.19.2.32] (port=54046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1kdPUF-0004vx-PJ; Thu, 12 Nov 2020 19:10:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 1/4] hw/block/m25p80: Make Numonyx config field names more
 accurate
Date: Thu, 12 Nov 2020 19:10:52 -0800
Message-ID: <1605237055-393580-2-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
References: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b19fbdf4-0272-4d93-58ab-08d88781bd44
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7327:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB732766F667021C714126DF94D0E60@SJ0PR02MB7327.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eCHsgrEDcKwbN6L67oxCh6vckEZ92Cu7mCzRzNgH6WdWPoLOfe87QX3el/6le/rSGl69gpjioFw7KX4MCYY+6LoVhbu/A4dbwGdPArTLLQFMPXhhp0XrI/RtPcU47WwZYUuUaTWyqI8stHaUUOqbLup2lEAL1IuzPXZnV2tFtkvOF1MicddCV7/hC5hGn7VJ3Gz0gNfT/BTC1y9nofrUD+kOuvaKIEbh2ls6RKzcl/c8xfQLAl4ztGRHlcQE/ApQ3YJMW7xXV6qok6uA0fReZNKJQyEtT/5FaNrHrijcEWLeqmk6IQH9LqlRq0o5cjcEGHAcbw9BUMwtzA4Cng3UCJE+eukVEehcK0QYvksvgKDEyX/nOL1xqFzbbsJO6BUhvyqSdV4sXr0bl05dRCiot+Z6KsvwaJ1fk4frLzKmSBs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(8936002)(47076004)(26005)(86362001)(54906003)(82310400003)(7696005)(6666004)(4326008)(8676002)(9786002)(478600001)(82740400003)(7636003)(36906005)(83380400001)(36756003)(44832011)(316002)(70206006)(6916009)(186003)(336012)(426003)(5660300002)(2616005)(70586007)(2906002)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 03:10:56.7419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19fbdf4-0272-4d93-58ab-08d88781bd44
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7327
Received-SPF: pass client-ip=40.107.237.73; envelope-from=komlodi@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 22:10:58
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: figlesia@xilinx.com, alistair@alistair23.me,
 philippe.mathieu.daude@gmail.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous naming of the configuration registers made it sound like that if
the bits were set the settings would be enabled, while the opposite is true.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
---
 hw/block/m25p80.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 483925f..452d252 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -136,7 +136,7 @@ typedef struct FlashPartInfo {
 #define VCFG_WRAP_SEQUENTIAL 0x2
 #define NVCFG_XIP_MODE_DISABLED (7 << 9)
 #define NVCFG_XIP_MODE_MASK (7 << 9)
-#define VCFG_XIP_MODE_ENABLED (1 << 3)
+#define VCFG_XIP_MODE_DISABLED (1 << 3)
 #define CFG_DUMMY_CLK_LEN 4
 #define NVCFG_DUMMY_CLK_POS 12
 #define VCFG_DUMMY_CLK_POS 4
@@ -144,9 +144,9 @@ typedef struct FlashPartInfo {
 #define EVCFG_VPP_ACCELERATOR (1 << 3)
 #define EVCFG_RESET_HOLD_ENABLED (1 << 4)
 #define NVCFG_DUAL_IO_MASK (1 << 2)
-#define EVCFG_DUAL_IO_ENABLED (1 << 6)
+#define EVCFG_DUAL_IO_DISABLED (1 << 6)
 #define NVCFG_QUAD_IO_MASK (1 << 3)
-#define EVCFG_QUAD_IO_ENABLED (1 << 7)
+#define EVCFG_QUAD_IO_DISABLED (1 << 7)
 #define NVCFG_4BYTE_ADDR_MASK (1 << 0)
 #define NVCFG_LOWER_SEGMENT_MASK (1 << 1)
 
@@ -769,7 +769,7 @@ static void reset_memory(Flash *s)
         s->volatile_cfg |= VCFG_WRAP_SEQUENTIAL;
         if ((s->nonvolatile_cfg & NVCFG_XIP_MODE_MASK)
                                 != NVCFG_XIP_MODE_DISABLED) {
-            s->volatile_cfg |= VCFG_XIP_MODE_ENABLED;
+            s->volatile_cfg |= VCFG_XIP_MODE_DISABLED;
         }
         s->volatile_cfg |= deposit32(s->volatile_cfg,
                             VCFG_DUMMY_CLK_POS,
@@ -784,10 +784,10 @@ static void reset_memory(Flash *s)
         s->enh_volatile_cfg |= EVCFG_VPP_ACCELERATOR;
         s->enh_volatile_cfg |= EVCFG_RESET_HOLD_ENABLED;
         if (s->nonvolatile_cfg & NVCFG_DUAL_IO_MASK) {
-            s->enh_volatile_cfg |= EVCFG_DUAL_IO_ENABLED;
+            s->enh_volatile_cfg |= EVCFG_DUAL_IO_DISABLED;
         }
         if (s->nonvolatile_cfg & NVCFG_QUAD_IO_MASK) {
-            s->enh_volatile_cfg |= EVCFG_QUAD_IO_ENABLED;
+            s->enh_volatile_cfg |= EVCFG_QUAD_IO_DISABLED;
         }
         if (!(s->nonvolatile_cfg & NVCFG_4BYTE_ADDR_MASK)) {
             s->four_bytes_address_mode = true;
-- 
2.7.4


