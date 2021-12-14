Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC847411E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:08:42 +0100 (CET)
Received: from localhost ([::1]:50608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5fl-0002AZ-CH
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:08:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bi-0007kU-8A
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:30 -0500
Received: from mail-co1nam11on2047.outbound.protection.outlook.com
 ([40.107.220.47]:1993 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bf-00071l-BZ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3JdkaRK6mT49OEkVwkv89uVFsPZ5IlsXOI49GWsJU9oif4RJMg0SmFwlx/XEo/Z/+C/2yU4/KUsorF0LfqoCEJdJV5oKGGtCx88FH9YSc3AEuzAQNMOFzVmKZHNqP3IqbUOFHXTZSJZDHW1DzeRwvwa2v6rD1yD/ozlcbjqMaCOrSOVH5VJpQ3oogFLJVkKE3bauW9Lonu9hY/M8X2DYCeWoU4MnyMqQJhXuSYUNFVmOUVcUPhdmnk+29k/Gt7fT3oRLy0L725EhPnrBjvLVfnVX5+3Wlbwz4ZL5JONigHFxtqTwtSHL9iLdJT8qJP2wD1EoRBCI0FaHzzHzu50jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=Oh2e+xkFL34O/eFxW9AhbXp2bGkDWScFT7MUUFqsoBUtG+zdeRzOxph3UdylnVxz68AUkrOQzQ2zFTu5kJPwhG35dpLWclTYQNR6lsSYb+I1DK/hJPLY6S1bqn0t2LCwte3VJWuesU459jm6eY6uLBFpUXIKwsaGAKZzj4j7papDJ34ofVY9oTwC83JuzvVOH0qddrTdHL7+MWicnP7YJh59bTdPD/IulUJtefcYBh3IrZ3V5K8St4ubo2F1dI1yH2RfyloNiPeWQzl/sJdtXh94DKtaCXqQsvhThpRJx2oDzMsHTRv81q4xSd8s4HPAkKoy++B8mECneS6iIlwq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=Je6wP7g3XxpzxixcrCuxjqnfxIVF2fuep4aGCQ+IGRrTX1sQDLp90YTMxXz3OZiTYpvX6SleoTVHrZ2zGNEJ6+lyzB4yEXYBiDt4gfoUZsC2HSPQqyySiLr7d76HgF19ZsentGqjrI2FMbiWldQnbW+QNXw5QRdlR/QLwUaJ/P8=
Received: from DM5PR15CA0054.namprd15.prod.outlook.com (2603:10b6:3:ae::16) by
 BY5PR02MB6081.namprd02.prod.outlook.com (2603:10b6:a03:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Tue, 14 Dec
 2021 11:04:23 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::9d) by DM5PR15CA0054.outlook.office365.com
 (2603:10b6:3:ae::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:13 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:13 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bR-000F5K-Km; Tue, 14 Dec 2021 03:04:13 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 09/12] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Tue, 14 Dec 2021 11:03:51 +0000
Message-ID: <20211214110354.21816-10-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bf61952-425c-4a19-8ddd-08d9bef17c4b
X-MS-TrafficTypeDiagnostic: BY5PR02MB6081:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6081FA361E04343667145571AD759@BY5PR02MB6081.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xz7QOAfVfVrQy5R+5JHnYc8Kz4jO6cSTIJLCwaneG0OfTlIi6FVFPljtm5HwZUo1CQyt8uAAoQag/LR62MvTgWCqGEvRdJJ3Wbl5V/C54ao+ZTiQKAA8BF9iUvKx5eG8qh2qgvq/wB4II1ZZV4TJCPIS2ZlpraPHQpmBFriZMjXZEF0uyXeK6QLSSyeHv0Evd4kxIWg4rAYq7ARlGQZNm1C4+9ZpBzCvw0yOg7NNtoPcl2ZJJ/Nn7mn1X03nLwWeGHn25wwu+NMSX0hCacCl8ptjV3L1FCj5W1ixG45sCnlCkE81yNWZJHpNRK01a25USSmbhw9Ns+tQq7jY8hqAY+kAvv5Arpqk6Ci9lykjDhg3EODnofnKBKNx+fPNKopf4AuLG41pN8MBPOsqid47iExXLOv/VI/5GvdTd3f1/CcnXNto83agwPr+kWrjgebYhGal9kpB1nnM0kYdbLGfzyQCNu7xpjHc2DKjH5XI7aVFyuW8DgOMaZNqimyWDu4jsOQrTKwTDKSOmGUN/Fg8nafOI337IFPBMbz7D5G/KobcNExYDdJPFPddqajsFKOfRlcwiG4peksjENDt9CWrdsem1HnMAJL9Kc7n9BQhcU3E/IpNxfUo8GuaoX4zMf3ma65cb1X0Ir6f/95vepybLvk9LaBJxGIBSP9RguAxGPqiZWiyugvGiGhPYQen3d76kQz7n2wKCm2nJoZbXHBHipYUdM0IsDdHAKFfGA1NvFA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(44832011)(6666004)(356005)(508600001)(6916009)(7636003)(4326008)(426003)(336012)(83380400001)(8676002)(7696005)(4744005)(47076005)(70586007)(316002)(8936002)(36860700001)(36756003)(9786002)(26005)(186003)(2616005)(54906003)(82310400004)(70206006)(5660300002)(1076003)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:23.0420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf61952-425c-4a19-8ddd-08d9bef17c4b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6081
Received-SPF: pass client-ip=40.107.220.47; envelope-from=figlesia@xilinx.com;
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


