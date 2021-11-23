Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA24B45A063
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:39:12 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTCh-0003qt-R2
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8M-0004WH-Cj
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:42 -0500
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com
 ([40.107.93.64]:19296 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8J-0000gB-RS
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQkpu996p58/XWr4kPeVLt7fY2Pl4gUWxqlszPV+2w1ya5/D2Y5U/OxCpLlbg7IFOPpg0tB9hf97LV9+S+hrmF/ksJzYv8Z94e5Q0BSH+TSGp4E+s4k/RfFlnEYKXMuPYBKuqCDCxdpFyjieT0Bc6UQxPV9rFDjaid9+CayNaGp1qyEtiUKjv5ZW6jPfnbniol7Edk/LvT0bcB86KnjNlqyKFImhBGt4uWMf5SnpVJwgJErz8rW9oPkk3gAB9xegWygh4zfMelFH0gjWAtNy9xJBQz2B7Kb+zSX0WKJGoFvvW37FJFt92mMpRXp+mFHuuzRTMcyTT0Zm1u4IN+hY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nqRu9hAriGCDY8wXrJ2ZR8F9wDDPQuQ30VcoOLDeos=;
 b=fpg5NFJlfMyR6eMqdAhcAbJHbn0Tvy8sDFC5utVuAAWjIAkG6wgffWxIuXwT7E7K0PDDUgqPESxefc4Ei3OHmWvUkvCD84RF8hvSCLDvU0v0hM5Uj2z6hItgx+AzliOGoxrEqxC8DQdMuJXv386QCGt+U1f/fOPmTRww+fViv3ldDElql1GA+HHIK5M7P8AitOApz4lLErOzLWECIlpqGbLSvMPSAxlYF+PnbKgdZjoEMoFik3DxZUXGwheQT34I6RGQfPVruV8SHXvyySo/NZLC+GHFxtzcUIdTN62js9eo0T1gz7l7ZGuYAcWr8C4Fcn3pkxwZ0wXIsp+4XBVccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nqRu9hAriGCDY8wXrJ2ZR8F9wDDPQuQ30VcoOLDeos=;
 b=ZEQ/1NbV7VJe1a2XoGV8UKLapoP9TEUDUnI3IUxelwrJVF0rNhMJsf0g0jVpMjru/QYoOO7pVFTVHu1r3KzxnMO7ykINeID4RuOR4+mJJnlj0gR3qQH3BLC1fAs1Aoh+cumAbnCJCBVQXFrR8gOhgV1c+7mqJasmIWNrWd7okhY=
Received: from DM6PR03CA0036.namprd03.prod.outlook.com (2603:10b6:5:40::49) by
 BY5PR02MB6275.namprd02.prod.outlook.com (2603:10b6:a03:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 10:34:36 +0000
Received: from DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::a4) by DM6PR03CA0036.outlook.office365.com
 (2603:10b6:5:40::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Tue, 23 Nov 2021 10:34:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT015.mail.protection.outlook.com (10.13.5.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:34:36 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:35 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:35 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8F-000GX6-Ju; Tue, 23 Nov 2021 02:34:35 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 03/10] include/hw/dma/xlnx_csu_dma: Include ptimer.h and
 stream.h in the header
Date: Tue, 23 Nov 2021 10:34:21 +0000
Message-ID: <20211123103428.8765-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e972fee-9808-4927-5ed3-08d9ae6cd8a9
X-MS-TrafficTypeDiagnostic: BY5PR02MB6275:
X-Microsoft-Antispam-PRVS: <BY5PR02MB627506B658B7820E12746524AD609@BY5PR02MB6275.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHxLIko7bukShGTEx9YXpsMcZ3odPC/T6iZG/99JlWnD1SeHsgOjYCafWU+9c3CObWLm8pDWRBQhBICI70nXBjgcBbR5gluaiMs5btA/c5XmaAB7oaLk2Len19G1f8L4HReJBV5jMv0cgNxHpaNWu0pmV8TkBr3Xlw1dueP6naMUVWUf7g8K2k3kasbHGkY7EjDx8F7ccrpRTRucB1iqS57ie4qyoVp0zn2A5/Jmn8zJyuAmOLJaFuIrk4Q3ciSTFeAIyrR3qwmY0V/oF1u++wW5VZYBgitcF/FQo+wnTfPLQJ/2qfqowEQijWbZ4/Ij/d/A0pfmas6FYEIIHB8PR+XCTrrXEnxjmzHw4l2IfgwPvu2D1RdjxbBzs+nwJc3tBQZCnHW5GAEJA5bz1pzOi5uJ/W0HheOmy9W1M4nkxx+/yCUMoGt6iRfJ+s2UfPuu4MTz6qmddbpf+DCofn/cyYnt21PMAqznkYglDdL3+3TiuFsipMHBtmK2b6RT+ocj26Ozh0hVS6kQFAe0SlgdSsnEkCgoAvOwWHJV3HsHHy0fOeqIGqi7HZwQIYpWwNqXyb9J4qW3e5py3g/fCYCqcywzzwvPov1yPUewoGih5iHzUKi2ymS2H/5bWUvs0WHYDNKk07gi4F86h91aT5S83SDXgnUK4W0O+tKGxyu7Se5BlUX1BwBniMxhTsAx3nhdeLW2FsF54Uy9CdaKG2iLuNTUqNzjs5nTLISYMLjugdQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(8936002)(6666004)(36860700001)(36756003)(44832011)(356005)(6916009)(5660300002)(186003)(7696005)(47076005)(4326008)(426003)(2616005)(316002)(54906003)(4744005)(36906005)(8676002)(2906002)(9786002)(508600001)(26005)(1076003)(336012)(82310400004)(7636003)(70206006)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:34:36.3405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e972fee-9808-4927-5ed3-08d9ae6cd8a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6275
Received-SPF: pass client-ip=40.107.93.64; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include ptimer.h and stream.h in the header for being able to build and
reuse the DMA model (the first usage of StreamSink, StreamCanPushNotifyFn
and ptimer_state is in the header).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 include/hw/dma/xlnx_csu_dma.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 9e9dc551e9..8c39e46f58 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -21,6 +21,9 @@
 #ifndef XLNX_CSU_DMA_H
 #define XLNX_CSU_DMA_H
 
+#include "hw/ptimer.h"
+#include "hw/stream.h"
+
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
 #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
-- 
2.11.0


