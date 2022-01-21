Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81284962B3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:21:24 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwfD-00068y-Ms
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:21:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWc-0005ch-8S
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:30 -0500
Received: from mail-dm6nam10on2073.outbound.protection.outlook.com
 ([40.107.93.73]:16089 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWa-00069X-Ds
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlA7ffpqP6hPaZ+sWkW5HUjbHpfzd+T3yhDNnZzKwSJBKFprBYAJoZ89Hs1JkTFgCKvclg1Af3KzR4vKYHDYvFi2ePcanCd/rsSxGVgFzU+8SyCveA1ARj0xDB2EqP8vMqdq6WMj5S2+wy/8Sfm4+X5DGntA2663NmJK8k6bZEArXWPFxDISqSjfH6XpjEK7YPT+SHS352MKSts1eYzlQV0rPtadCelVqOEmkJDTORCzSTDN7OkImz2lr9sIyGeysyvTmff7QQ0xpY5ZE0mNfzxYRu1qTOyPyNwWzIkEW8oEbMpmCZqqO9FHDfMfh4oe23a0mwDawtJTcc1AaCVg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=HWrnTsAAxGQ/XaTybtGaG3RD6lToQHzhzBoIL2GpK4FkqC2LFzUTzEyyuP7ALNzWB4ixJ0R3izaKfqidQ9sNu5elGuKlEEc7XgNrFK9hFPGg55OGc3HXovarDwITZ5w+FeqCj54HD6lJ5LRdGszexj4hnq+FliqiNvTIMXyFFiQgaHE3FazS4T8dMsURT0XbtAKQsTddjghNen1FJFhfqYuK4bJqPTGgSaR8iu3eEHi1/tuQ2dXHiifSQ+dkIYwjx/wwRtHXyuptFT9ML2twV4inrAt23SmV1DOStB6ZQ+vyPfpXZ1LYAtXcaoV5kYbInC25i+oU+WITl6aj+rdlsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=IAAr2bh+sIyvlSIIbXFf3wagOi7wLveg1ASA4VYpbNHHrCIYItGQyZEHJdU5wPgFJcotmkvRw15TMiRWqJCi2zduwg2WttxeMVW/esDhf/UG3ryY6EJTWWkwdIID5i19ymcgK3c05Q7bBExHJNc5g2SMkX7poOlQ/HGiPmpu/CM=
Received: from DS7PR07CA0018.namprd07.prod.outlook.com (2603:10b6:5:3af::27)
 by CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 16:12:26 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::5d) by DS7PR07CA0018.outlook.office365.com
 (2603:10b6:5:3af::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Fri, 21 Jan 2022 16:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:12:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:12:00 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:12:00 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwW8-0002nH-G7; Fri, 21 Jan 2022 08:12:00 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 08/10] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Fri, 21 Jan 2022 16:11:39 +0000
Message-ID: <20220121161141.14389-9-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed0df6d-456e-4649-1d73-08d9dcf8d0d3
X-MS-TrafficTypeDiagnostic: CH2PR02MB6774:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB6774CBE7C6992D4319FD09C3AD5B9@CH2PR02MB6774.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pp2mGhWEITEFIaEyDMMKujLXvc4dokKzKt60xyqYSqt82zVtxEmXZV8zx5rP/KFmw+n0zj8TvQL5vt+Y0wpTNYekDgETSZbm4mEZrjWoQkLa2goowiOpWy2BHwlxpQnwEIjZ7gm9RtJb4BYXNFMLzodE2Td0xVVWFBN5T83C/Xhz7trn2reVpY4/kJ3y60S2MdG9nLXDQQQVZUg+J5ILcCAJLIpbfGSGU4IJQUTbhIigRMfqJ7s6BU3ECfUISI6DZH/GJBFZ6GE4LkCWRswLj7n8aYUeK6t0CiokYwn3EnbVkUCOaCRZ4Ek+lgQdRnuY7BWnbYS37gJBWnvh3Rs+2sMrgrodAU4AXKefQNzpXHj4YIVxBA5FWPqW/vJSoE9kqC75wyfCrJOB/w/cNU9Cr/0JT9E+5TObMFy6OnyumGpWZShcjlVCj3aAEIAFJHUcZw5yI/dmZprwj6Su2DleN9Fl5Q7QNBpop9VFd+esk6yrwgFGevzgnDtYOv9mzBN+SF9Jxf8O4G97HUpKEU3PCRjyNBZNwAaiEIDKl2mMS/afX7NwTeOa3+Nak9sh5Ypgk/rOezM05Zlk/qt7oAQNc4nRaDgKaTOCY6IunSLIWgXPLCprIVmvrY74mNLYoNeepuBPe4XVh3hbbQ+pzTgy5RVHBlQTER7ybG+lEONsmQp+NeRgt2IywGaUofN0ooem+oeVVVKBbnHSpr9V9F0AVRPX1l3GtP1CAn55y/98yvI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(82310400004)(36860700001)(83380400001)(7636003)(47076005)(44832011)(356005)(9786002)(36756003)(2616005)(2906002)(316002)(70206006)(54906003)(7696005)(26005)(5660300002)(6666004)(4326008)(8676002)(426003)(1076003)(186003)(4744005)(8936002)(70586007)(336012)(508600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:12:26.2195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed0df6d-456e-4649-1d73-08d9dcf8d0d3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6774
Received-SPF: pass client-ip=40.107.93.73; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
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


