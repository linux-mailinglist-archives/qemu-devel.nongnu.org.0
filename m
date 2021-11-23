Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1256F45A06D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:39:34 +0100 (CET)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTD3-0005Eh-5v
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:39:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8t-0005Tw-CF
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:35:15 -0500
Received: from mail-dm6nam08on2084.outbound.protection.outlook.com
 ([40.107.102.84]:24737 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8q-0000ju-0Z
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:35:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMSjgK5KIY7Ul5KZENZFI4ZxF63rzo/waWE2nPirFyzrlC6+Aue+vV5O3SE2PoiZ2bcjaV6ZynSthuHXC0LNhohgrRmiJHtEA5OgnJ3+avOIvQeRbjWF5snHgCqWxgJ5J4K3sy+YSlvatoSdvsY0eEGeIbuMC8hztxEryH9p2TBrT39ptsntZghkUAM2DgSVPSsYU6rhzTY5KcsyH/xrFVhrWMl1FF/tmhBJFCk0MWXuOG5+WrFCFq4b1DzgMwdzE7NvMx/Y0qwIn0pCFa0KTTpoetnW0w39cH88xvJlYnfh4CPZFw/TitNemSqzqI/droOmkz1SLG9WS9i1LHcZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=lM5Abp48v7Pvb6NI4Ic2OmsACSsA6D9NYYJMknYBtEYNgfHv3pSpZ5gpChwCgIqJi3B/+2q5bm+V8OvZULhMWKMWEd3ryvUUEZYh78MuvtWGdQgrB7uBfXqz372GL/MhFOySykf3AkNn6XPM6tjTC7Ya3sExoDibcoNGNMILRbboZEqj6bv+BwTQw1r97B48iMg9/BIUzsqlUiTkO8N+vgF17LiAjGYbOokGlbvFgUGRNZOow/SH7Oi7X4qtyg9UweooGotrLMx1rrFpFUQELcJDjb1hh+WtyLisJL883j/grQPrfEdGx4B5youEcHsvHdCL62V3GWv7p11hcoV8Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=SE+H95p5VGouZ+bVbS0o/C+gyRr/giLTAlHdT5wyxVdnoBcjtvqVyBaCxAWqEDbUAEc2c7AeYjCis3KLuhRRJJUlLKVKh2UqHZcxcTsZohiFYqP5UXKyEgQzXmU5W/CHGcqc8YGnUNdItVEWO1ZW1u9DwLdUSuZV8kh2JgUV+Vc=
Received: from BN6PR1201CA0023.namprd12.prod.outlook.com
 (2603:10b6:405:4c::33) by MW2PR02MB3785.namprd02.prod.outlook.com
 (2603:10b6:907:6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 10:35:08 +0000
Received: from BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::f3) by BN6PR1201CA0023.outlook.office365.com
 (2603:10b6:405:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 10:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT062.mail.protection.outlook.com (10.13.2.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:35:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:44 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:44 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8N-000GX6-Vq; Tue, 23 Nov 2021 02:34:44 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 08/10] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Tue, 23 Nov 2021 10:34:26 +0000
Message-ID: <20211123103428.8765-9-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4dac913-a51c-4fe9-6f47-08d9ae6ceb9f
X-MS-TrafficTypeDiagnostic: MW2PR02MB3785:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3785A5158380277401F3E434AD609@MW2PR02MB3785.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KB3aYV178r4cmI4nlgZfOy7UEIC8mlr2s6uqIXwZhxIzqjEpPu9Pa2gCkYcPjtftGByComd+wjsms0ADA20TkwqIN4B4GhIAPgzHeFpcIbG+B999Ggk6YibKXs1qDi0+y4VImgfViuUlErOmle8+f6AVkSkt3DnPbETCbZH5+xtSuwkmF/B5q+/78WDHYWuBdvPZohkzyqXxA9Le7zBZ86VTUDE3LXJS40HBd1BFoRv6k+/R6Cp8K3+Gf/G4gNLk+K5cCR4I1pDbCeZf53x/e8gi7oG3tgR+0e289pWTY6mL+6FkLgnckcRnVYxrGsHp30nvH2x/J8+P4COUmA67smLQFLdVA8ngEnvxOmZiBN5W1fv7pDV8wN+Lhdy8oAbdJE++wzSkBITsqwPt3xM/G/Mwcy146DWfki3kje4sjkwTPheYd8ynW/Ka7mTHVDQ8gKdBkn5Q38nzljqIdm4xZILa2bYvqxvsEw//IrPySYvak5/eo5+pPMndThiiFm9QJ+m7l6SZrNT3OOaHk4r7pTiRbgy7WYwcgoScDbL0XDC+NKEeA7G26BGQiKyl6Be7mjSCmUyJhYEkhew8QWM3yGfiqn2C3wsE/wRqGSDhG8+Jhbw3kmmc8jXpptDuaYvKW5detjkcyg66wkWGMp0pT7V74p5AySIaRQ3uN0Br31a+8m+yjxAnAMjrhYFaLpDyy13gBazZiZ2qbbZEjQNmFhc2lVZmTDh+cc8G5BhUik=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(2616005)(508600001)(83380400001)(426003)(54906003)(356005)(2906002)(1076003)(4326008)(47076005)(186003)(26005)(6916009)(336012)(44832011)(36860700001)(70206006)(7696005)(8676002)(9786002)(6666004)(4744005)(8936002)(316002)(70586007)(5660300002)(36906005)(36756003)(82310400004)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:35:08.0931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dac913-a51c-4fe9-6f47-08d9ae6ceb9f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3785
Received-SPF: pass client-ip=40.107.102.84; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
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


