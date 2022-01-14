Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A100C48ED2A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:34:42 +0100 (CET)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ObB-0001LE-PE
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVs-0002jc-FY
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:12 -0500
Received: from mail-mw2nam08on2069.outbound.protection.outlook.com
 ([40.107.101.69]:51041 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVq-0007XF-Pg
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad18ZmtOi1OyEUscT7VhbfGYpDAgscszji4yT/Kmcpm1sVoZRvbeP3bL8vh7r4en6fL6Rv2IB/7Qxkivtc5WI0cUAivELortQ0HNNlSRB7foDXJSngo6s8m7IQLCHwpgUdUvK0qP70IKELg4cDPTorUum3eCohY11obYmiGocKm5UGYwvt4z7GqdZej4YdLWcXf4x3Pv2xzpF8RGTtgCvCKjf2zS+MUtrmE27UiWDtho7e5h/V+Wni1Z1ULef7YsRG9ekFKow/FMClBwJ26+Xgp9/rsWMVpLEBQio8QhLKD27HPcXnpv/ASq4BrvNO1qS3U1w1vWqUOuFdeDRX8DIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=fiv+JujL0+NyCLQZDcqpIyrqZQ//6ga3zBQ6f7l4ficUz8tYZBservY0ha2Uo6xmZl+B21oO5DsFV3FkyALPbm0vlZeEpeXX/eBxZx9h58IC6WI9RmFnHBLSuJWZyII57122lzQceaqt+kKEiXmy95wRmGkxYQ+NtTje4Gw2GIv5z8x7uWcTApCmxAswKnlofnoRtXWAHuheOoE+DqnD+yHTi9l37J4hffA07FvlHNTyq3qE9z6bH4OOhfH5h4HyMYRlrceRchWXsjh0/p3zwFKBwS4NRr169putnCPE9rKK7qswym0cx26Z9a8xsTWrS74CH8WHY63M20YLYGbPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=ohdF1Txh1IYU3CnX4IE0Y549QiGmUOmtLO97+sPvWH+pnbgUPdw6dFfHstLmPGLA//fB3xykIXv6UtLXanDMzoTWG6m9xiJ0tCz0iPWTzykc6ZAGUV015NpTZbWvp6NDKqx6Od0e3qbSmlf8gEo8QNL/oDUnPSWOc5QdNvJ4hN8=
Received: from SN1PR12CA0094.namprd12.prod.outlook.com (2603:10b6:802:21::29)
 by BN7PR02MB3954.namprd02.prod.outlook.com (2603:10b6:406:f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 15:29:04 +0000
Received: from SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::de) by SN1PR12CA0094.outlook.office365.com
 (2603:10b6:802:21::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11 via Frontend
 Transport; Fri, 14 Jan 2022 15:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0007.mail.protection.outlook.com (10.97.5.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:29:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:29:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:29:01 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVh-0004L4-Od; Fri, 14 Jan 2022 07:29:01 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 09/12] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Fri, 14 Jan 2022 15:28:38 +0000
Message-ID: <20220114152841.1740-10-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c26123d6-1f4c-4f9e-7550-08d9d772991f
X-MS-TrafficTypeDiagnostic: BN7PR02MB3954:EE_
X-Microsoft-Antispam-PRVS: <BN7PR02MB3954080958C8E3DDA781F2E4AD549@BN7PR02MB3954.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvalPB2tjlnRN2/tXtOmzCl3TlxUXCs1rL7YO/U6JkinHfxGHrUlWIr+pUw3v8ZgWVcE1tfHQ6yavtGFBlsxrLgBRM9dmFz4zfRj8OcwSwVkbrc8ZFQPWEqIbWdd1iL/NO6gKr2wqk0CfrsL48AjPfl4VbZmionW7BWNmyB5mHkrej4/Xz1tbLmJyREqLwhdrjvCyb8e5+bXWJtcqDV+2LW0sJUFL+wOxji2iKilcpC6RebD51I+K+1nU8AuH1rOxXX4BSylQA7ojKgsbTKutByui8yw4NY2gy6ldtTiRLkwOAqXpND6NKx3Uh8QdybjDlusFL/88oJ6Ybth6N0m9zMWHahigkTkpWGHt229V7SH4lV+V/4TilNxFzlPxbfCJTNBNi2VgXIMwZcC+IiJMO8EI+cAonsR+9at5XfpsdImXZbwX2+1pA+fkmeEg/o/awtTjf5m6WSLloLFTEYB+OMQQeCxXRQYM3XHYltnrF4BGqL47jQOCckI1DKzeomQPaPDBoinp2GQqSCFAB2ra4uCspZ0PG5EOyiW7E6/UUKRUxSLeS4gCjCkuDiaW9OXVlf+oYl4GRuiyRUYGFDiglD9kGVNv9noh+t4pjE5vYKAvOjjBeJX4RDSRWaOK3XAth/XcZ3QYMpjPVqIAfqYQ3igzPauvhpAb4TlHz6QYYW7BLWNd7PL6XH6w8XNkkv+1pkTBtR09k3Zn0ds2MOqdxr7iFbik6kxlfky8E21M+I=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(54906003)(2906002)(9786002)(6916009)(6666004)(8936002)(508600001)(8676002)(1076003)(26005)(7696005)(316002)(36860700001)(7636003)(336012)(186003)(82310400004)(2616005)(83380400001)(4326008)(356005)(426003)(70206006)(70586007)(4744005)(5660300002)(36756003)(44832011)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:29:04.3917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26123d6-1f4c-4f9e-7550-08d9d772991f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB3954
Received-SPF: pass client-ip=40.107.101.69; envelope-from=figlesia@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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


