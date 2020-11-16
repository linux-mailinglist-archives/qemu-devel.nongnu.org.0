Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F258E2B54CF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 00:14:59 +0100 (CET)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keni7-00011b-2p
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 18:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneX-0005xL-2y; Mon, 16 Nov 2020 18:11:17 -0500
Received: from mail-bn8nam11on2050.outbound.protection.outlook.com
 ([40.107.236.50]:56480 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneU-0003xW-Pn; Mon, 16 Nov 2020 18:11:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUefF2pID87ZFAj1a6+KIVoebssecoG2mqCgCyGM2S7Dw2bMaS+KENHquaIagSQb8NpSyyObsKoxq7K9ey518IiGKhYuN06qZOu0KrIU4uEBCEGimyT4CNXWcYuRNSLBYFzpaZ8one6/UReTn/+ly75C9mHwxGKIMirLFWuutT7nygtewybB4A1N8fujsw1cQL/5slpwVHl5XgDd6qZ8cqqtA7ZFN9q58sa/0dlen7HPaS+1gPqMLPsvap6othi/lrme9u3eC5Rm6WOIYvxffXYwDI2P1BX3sQOagTejLAgGjHwy0zJwRFW+FUCkiegjLHCiaWp0/MhqTRmC+S1tpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB72zoCgJMQKkC69oOANDzU8BLU6bdkDfmXEYRE1ftA=;
 b=TOWZlC2dbisfLt8AkscH47YfZ+TjXEGOsVqhCmfKEpNfMGXkd0eaP50/9zOrWHzN0WgGl6v0Fa/DrZnnfCNK5TolaXdXnycdWNsT+ndIMEQ60SjmaE02l4GGoD8GWXFwEznQP9HIuFMB8DMIz6UoMy6js6KDlENrY5NyJat0U2LdJ7itESVpWvl5viKEwKXfiCCVGvHw2Ri8ShAwX3lzpm117Cl8Um3y0hhlBJf02DeVNHIvjhLadoBD0oSzoTPmIcrWdOjpvyI1x4Z0Lqxy7lqb4rkyPmmaQ9qkzYsGbJP1hByRJhKre5MndQBs1Zq+K40cVOXZPMhjgK3+4UWT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB72zoCgJMQKkC69oOANDzU8BLU6bdkDfmXEYRE1ftA=;
 b=ns1IT9rmQVBnI749v0Y1pwVzhHrmFqLuQqqI1YO2w1MCleDzNSHze7BnwcRDeGHfBmTaEsHRoEL+4MerkV9bwtUeUqASd1gcBHisgQ0XasXBn03lip+dmq6r5U+8K3M4ZO9JBGNKC1fOImgkAsMbSq0gA4ftUBBuTGKFezHQNNg=
Received: from DM6PR10CA0031.namprd10.prod.outlook.com (2603:10b6:5:60::44) by
 CH2PR02MB6854.namprd02.prod.outlook.com (2603:10b6:610:aa::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Mon, 16 Nov 2020 23:11:08 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::27) by DM6PR10CA0031.outlook.office365.com
 (2603:10b6:5:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 23:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 23:11:08 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 15:11:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 15:11:04 -0800
Received: from [172.19.2.32] (port=55506 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1keneK-0007S0-Ib; Mon, 16 Nov 2020 15:11:04 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 1/4] hw/block/m25p80: Make Numonyx config field names more
 accurate
Date: Mon, 16 Nov 2020 15:11:01 -0800
Message-ID: <1605568264-26376-2-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
References: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b19dbd0f-b10c-4767-550c-08d88a84e6de
X-MS-TrafficTypeDiagnostic: CH2PR02MB6854:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6854934AEFDEB82F07E5CCB8D0E30@CH2PR02MB6854.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H3J4Q99Zj0ZUc/wrDq8O91ookCB+8Xw5iI6lXRJS3vf6vt0U2A4cmWCkczf0FwkfwyAZYkFppjJLkx/Lj3nKQyX8EJkpcl+dIHBVf452sSRghmrW7xArJCATqI7v8BcwkUA5Vrt1VA99BFsAxw13zaRXKgktI1sppK0CUFgGAs969mlK0IRuhOcZVAzZ1IISbOzHISI+3v/86iECGxrV5nfZQPSuHfLTCsxLEunRizz9BvMFJj1H76ukJajqiLWh6qFVhp6odwNT9mUP8BQLqO1vAiGCNFEL+jcXBb89PTchMLgf2xFj3sJWuwyH6zGinACj/Wp5a7E8/RPU4m1+ONwNUTQyNtfJ2JTwzP6xrI8LEcxfAKFNg47+53ddD/7REEJOF3ScneNc25UEqXkVWT45yIf8XsjweRjsNRErAW4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(2616005)(478600001)(44832011)(356005)(316002)(4326008)(36906005)(82740400003)(47076004)(2906002)(9786002)(7636003)(8936002)(5660300002)(54906003)(6916009)(8676002)(83380400001)(70206006)(82310400003)(70586007)(36756003)(26005)(186003)(6666004)(86362001)(336012)(426003)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 23:11:08.5932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19dbd0f-b10c-4767-550c-08d88a84e6de
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6854
Received-SPF: pass client-ip=40.107.236.50; envelope-from=komlodi@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 18:11:13
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
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
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


