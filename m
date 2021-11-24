Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D331A45B861
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:31:14 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppYX-0007Dj-Vu
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:31:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppK6-0001RS-0S
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:18 -0500
Received: from mail-dm6nam08on2081.outbound.protection.outlook.com
 ([40.107.102.81]:4320 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppK3-0002eQ-Ua
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZfxNnMX1X9FsMpEYxPmn8K/fB00c/nPXASFQaUCnpfb5h2aJFrKDMQwOzYmCa5WXnTwcFDB85Mzerl7OoUTvkTPEkxyq/zrqDVvYjicrJ0BBqinXvDYEO67x0vX1OAqs66rUPHPodUYOE0oJaETlQvsEMUEL6TLBpboQuZxXf15G+dAItWSTlLE4zmiRpNr1LUbcJM/VGJvAn+ko3WnA+IBESxy2x6MMosiqtFROcmeN0DxEoDZWw7hQwQow0y2jWP8C8Yt9kB21Yr3ZkioAfX3wJ56LVehvnoERkSpq11uqkPqff578M/MJYi2ErE15tFdkUuaxx+wgs+nQj6hFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=XnrIuOzyFGyPe5uVJIaaLTN5NM+9fu4BvTsjeQdyxbhtPB7NPOdIU6NolWnxwZxH+cG3iidIcsnHtwuahh8CdEK9a7x2jM23J15vd46eEJVfX3fE1LfoLnfssCkv17s8MC5EEp/yD+//4KH2tTGjMCBMdg4asyleHAStrMgxhwuYPv5IzKRQTdavwJGkttUora1BvMIY77W7IK5dZibI4jnvoEA4XrHzz8ibT2iFJlLnwaEwQBg2VQD5+cbaa8+/1izzDP4ANF4UvTCFBSngufYKhpgGqDyTxBarlWLaWM50Q4kyLyet8NNH9nFHyq4hX9QB+ps1ftCYeahwSQ831A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=YhKMtdCxbyfRHekkDBx4Fq/6K4FZ9IQqQWwW32uxDpfhuo9Sprw9YJuzUjrJRZvIjlntf4LlvgbvpC0xvUx3BgQE9mw7xZdFxfduWCb5AdsHW6XUBdOSTYzDO86hYvq1CTGqqLwjQtGywuMd5X0tjY0PrgUS+m8um/oJxDPLm14=
Received: from DM6PR10CA0028.namprd10.prod.outlook.com (2603:10b6:5:60::41) by
 DM5PR02MB2524.namprd02.prod.outlook.com (2603:10b6:3:3a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Wed, 24 Nov 2021 10:16:13 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::43) by DM6PR10CA0028.outlook.office365.com
 (2603:10b6:5:60::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:13 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:13 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppK0-00036z-VK; Wed, 24 Nov 2021 02:16:13 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 08/10] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Wed, 24 Nov 2021 10:15:53 +0000
Message-ID: <20211124101555.1410-9-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6980eb8c-380a-4767-3463-08d9af3371d4
X-MS-TrafficTypeDiagnostic: DM5PR02MB2524:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2524997814B178140AAEDB17AD619@DM5PR02MB2524.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GosNczGgBkS0JO0Jc2+7R273XfqlOb61AenZQPLEzn1AviB4QCCbjSWja66PS1dYyXz6SsteY6bh0al3OxFpdBUceQ7Yf2T37ms/8j+U8O77zuPfCQ/rUv7IKTu70x+4Dag6mGl4AcVLCfWe0EEy/URGAW1jOuTNZTI3V/bP41D41N1UuX6ujJHp5+dJ3W3xe00PgauTYa1oEmXWSMTTNlUG0barKxz8Ivm6VKqJUyx5mVA32fDOMepb4QIT2gJxkfc4zBvkXfPjFgTMZ/hhCbFVWc/QHX1u9eM7RTZzqEVMrRkROAsqcwsUZyEJV7YY//ncUYVDB1MK1PX9CF9emQ/o97KWS3gncq/toHjZA12g6+EVzj2uYDnx78BvX9CcBnuFVSv7+Sk2k33IY4V7OYZiN4vV7+3VbLmUYZIDemau8vsIiCSgwxPb/HwhUCtAJPH+pWofVLisf7mq/dm+Qmp+xxFV20gWsVCVMBASqeNIcIy0bH9MCjoQh/cW1AfT3D8zjaRk0lN6suir1aJtqBBdx6jQzhvJf2l8OV/Vtyfe+ctYkT86aaaAGVAQ368PHSi42/jXikufc9WsBui+wiq8GxilNkgGFhOwVLhKaIxTZ5WYeGHZehOlsN8MT/VlhIJFP3NMzfhz/4rG+gdG///7ibN9n8LYlc9v2GcaEU8TPQEzMnQku+K06AyvVQWqv6VNRf1FvdXqk7bTLcFTUnN0bnCIHG3pKBP4olt/FI4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(47076005)(508600001)(6666004)(5660300002)(336012)(70586007)(7696005)(356005)(4744005)(186003)(1076003)(54906003)(70206006)(7636003)(36860700001)(2616005)(26005)(426003)(82310400004)(2906002)(8676002)(4326008)(83380400001)(36756003)(6916009)(44832011)(9786002)(8936002)(316002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:13.6631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6980eb8c-380a-4767-3463-08d9af3371d4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2524
Received-SPF: pass client-ip=40.107.102.81; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for Micron Xccela flash mt35xu01g.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/block/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b77503dc84..c6bf3c6bfa 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -255,6 +255,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
+    { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
+                   ER_4K | ER_32K, 2) },
     { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-- 
2.11.0


