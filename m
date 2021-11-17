Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B64548A9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:25:47 +0100 (CET)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLsg-0004hG-LB
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:25:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmX-0000vB-T8
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:25 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com
 ([40.107.94.67]:52737 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmW-0004ZP-G3
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnIX6D68sJ7THnl/p5T41Gggatr+NcPq43jBI8Uk0ZmiEuqaIWI1GCODy16/LIRVVFHxxjO66KxQ4eIO8AkYbTNPITGWGh0ByFlU4cDlDjYxFhsm0aYX9gSUy3DiT1AbMqhgQLSY5tx87cwhCjQt/lySOP12bL6H+3jLjM0bxy167BLS8LGSPyyJoNq3FYC6oBli+yyYMuebLsDcGnnHAZPOT0Ty/s3MKqpwHqUfYUd5/Wi9VdDIgZVCF0pV3xJK5K624yxN6NuUJ9dbdyawIAlsUjABBSs8QVkPcjkcnCHUebkR5SyxihhJHX3iQoDuZiREQfoqbeSUj/YvQNwu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feoaICo/YSToBT297ZkWnbCZSGoPOLSJjgdwKCkk/H0=;
 b=XN6XP3Ml7u1tiAQr3cn88VpdkPpqF0okGBNxq6+h3F0+YI4mNIcytnTuOXBrHNZFvZ3Avs2X6tMyXSGey5lFzdVclD4Ubliw5qKJeCjg1l9gUcGFdcsyq2pU0cyKi20N4D3CskN5LiA7iK3qBQM5FuiSLs08ndxQxaTASUnCngIJ+jgHPONh0pX1DhYwPiLb/KcDs1JwsmDdk3tWUy7I5Ny6haBJdyWXXc9oA2etFg/xPO7ivYCT9WJxJG2fhhvTboHzcazbQ2Vq7oV0BnShoZ3xcRaO+MC+aMrJbpXhs7YajUZL6v7nGrqWEzcvmZVc6g6DPZ6XA+FWuUDppdgkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feoaICo/YSToBT297ZkWnbCZSGoPOLSJjgdwKCkk/H0=;
 b=XHUkjCDAIRazURt4+skiBaJz/TqtG+6OYnexr6z2kMez9wQdvSbk3r/C8NfgsQJE0HP7kKz0VY2t5qakimbEs018ZIKfBOaH8H0xdXcs592s9ep1yUegyw5LiS0FbY+/pFNR+AJtE298guXsSlT0BqITBOQQL8Zy/0CBuCKj8v8=
Received: from BN9PR03CA0805.namprd03.prod.outlook.com (2603:10b6:408:13f::30)
 by MW2PR02MB3788.namprd02.prod.outlook.com (2603:10b6:907:a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 14:19:21 +0000
Received: from BN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::13) by BN9PR03CA0805.outlook.office365.com
 (2603:10b6:408:13f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 14:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT048.mail.protection.outlook.com (10.13.2.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:19:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:57 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:57 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLm5-000Dy8-BF; Wed, 17 Nov 2021 06:18:57 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 8/9] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Wed, 17 Nov 2021 14:18:40 +0000
Message-ID: <20211117141841.4696-9-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40953b12-ced3-4f65-3ca4-08d9a9d53f9a
X-MS-TrafficTypeDiagnostic: MW2PR02MB3788:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3788A6AE44F33B61CD893981AD9A9@MW2PR02MB3788.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ys1UcmRSNImu8Ku9tlo+9hb5i+ca6lSdhoKo1kSePgAXk/1rw8riJBwF8eUeD4zBJVMZiWcFbd6DfHdoz58Fk/LEFE8NAvrPtvw8vc2gaxdOlTHoou/EBbdIHRzYHVeMSmlJeXxFUqNOdp9dsiYnYy//umu2Kma3Z/H3tZeTcq0pxAHN6yq06XZrdVGgDz5ZjsvSjtFguFp73/m3a6LhS424z9HIiXKoliW3dcwa5i19AU7x8mKhoBnPQ2d07YpKr6dxEoBoK0Rz0mb6Z7G1ooN/cHC+1f0zMS+SoYue6qVMqL+DRQdP52ZT+5hovu8B8GwR0eZ67CIw+RuzNofoBF4Y63BO2Xi+N+QTgQnVmvZrOmayPaYXaeN30qQcjy8vYrpuqhYsoUyeeDEGwhtei+A2bMD9OrOACFWjtPdEhN5MBvdl+/hIvwhpCIbrpW0/p/XBHabeDqJY6yL2nEYW7UfiZ610yaPc5fldv/i2RVjs5NfEmzUSG5MZU/CoI0/AOTZ3hoNaQN073w+ZFg9W4m5NTcYa4X5gHE7TUPN9eRF6+ILwz9A38z0+epY7n8ZbXSyWMrVEBzut7bmadwQMtTIGO7Sni2nL7iAo9NK6sksR11YaE132Dv1IDQCMhhaEAt2lEkRXDbhuLFXLHiD8UnDe48TFGMmpMOesZsNHNv9KR9i7r7tAVjlUNS2EO+QhKclnzrKhYEz7MhOAF6II68wVH/8le2B2kJ4eVZbRllY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(70206006)(70586007)(47076005)(8676002)(6666004)(83380400001)(356005)(82310400003)(9786002)(7636003)(8936002)(316002)(2616005)(2906002)(5660300002)(336012)(426003)(36906005)(186003)(508600001)(6916009)(54906003)(36756003)(26005)(4744005)(4326008)(7696005)(36860700001)(44832011)(1076003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:19:20.8347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40953b12-ced3-4f65-3ca4-08d9a9d53f9a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3788
Received-SPF: pass client-ip=40.107.94.67; envelope-from=figlesia@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

Add support for Micron Xccela flash mt35xu01g.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
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


