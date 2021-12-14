Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60077474151
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:17:34 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5oL-0008TX-H1
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bb-0007jG-Pf
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:26 -0500
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com
 ([40.107.243.72]:48339 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bY-000714-L4
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LATEIoaT7Pwtz7AbuotdKAn4h7i62VQVj5VBGELf7Nh3MPJZqF1quJ2EByZtZYdVDBgVtxuaTx/KPlycN5YNoesP5OCesXbgxeNguCBtT+gl0+RNxeWmgq0Krfv3s+rryTZNWsAfIIc25FZ1EH53cjnOrw76WE1VZcdvHfjFOZq5MvLxoASWTEOA2R3utwOHWfau5X+RTZpzuleWdH6qOgmZCipbLwPkAtWcWzesH0HJXCrOe7TOYGlAjoD9juzO/nG6Tw1GqzeSCCA5u7PDoSAzQ7o4N6sjE2R8KbxE9tkmydE2PmGIqq5g38C/biK5V9aTkwcQf6+qJBeF/tcHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll0iVtXH/wXJPrHJndUM5Xjbo3GdAJy2+hETg1ZblaY=;
 b=jKGKD+Q5+EaCJLFS+HP960GYHAvi0S1IKSh0q9Sa31VNvjp3J83wfQzc1s1ag2yOImMh7nKy6TYk7ZpXO+uSlOS+t6ryaoUe15k237S9zYDwcf9Jz7eXTGRdac7OW8ul9RsFbdi9IA8901ucHhNT08JPFTNHuSMFPgOUJZet9xLSd8/vmIYxdKWUljrDK3/wgcemwExTH+sS2MgIjAJojFNH77Yv9POzb1+q2Xu5Ec2UojB8Km6pKU6mD0EVExIH6QzvJItcvTaaQmrOz6eNUOZZGS6ujCU16gmb91EZSROV2JJ/WpHVz8nc7CWzPzJyDMAHOQyaHOLr8TVVZjF5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll0iVtXH/wXJPrHJndUM5Xjbo3GdAJy2+hETg1ZblaY=;
 b=kjpsn7KJizj10WPlCq2wWINQxZ7btbFaSX/WOjd0OU/+IcdPe6oTlDDZ8eJ94X7eP7n7mSeE97S8eaqxiy7tYIotYPMNr/JCuMSUQGSz47oXbExQRw9hzJwNcX1vcJV4lE6obV6jdjtThIynUgG9vxUMk95If3BhnxH5BWqIGUc=
Received: from DM5PR15CA0071.namprd15.prod.outlook.com (2603:10b6:3:ae::33) by
 SN4PR0201MB8758.namprd02.prod.outlook.com (2603:10b6:806:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 11:04:18 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::d5) by DM5PR15CA0071.outlook.office365.com
 (2603:10b6:3:ae::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:04 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bI-000F5K-CZ; Tue, 14 Dec 2021 03:04:04 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 04/12] include/hw/dma/xlnx_csu_dma: Add in missing includes
 in the header
Date: Tue, 14 Dec 2021 11:03:46 +0000
Message-ID: <20211214110354.21816-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f2446b-0522-4086-39b2-08d9bef178fd
X-MS-TrafficTypeDiagnostic: SN4PR0201MB8758:EE_
X-Microsoft-Antispam-PRVS: <SN4PR0201MB875807CA798854BE8259271AAD759@SN4PR0201MB8758.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5QjizmSJ5pmHY5J529KlwaWVOUziqZ6Uw/1bfzG2KMjOzhkDxRzYXSYVaOqQu1SX/tiP5yVzdQlzlww+tELAMfuem+O7JYbVdoqbSN/KJM0VCXpeQ2gpd7zmQk1JcV4CfCYKJTcS2b5Yvs7Am52wbdakzIS6r2Y1U0KmhKnGbWYfr9vPzFXu20WkVltsNFfwYPtzwIZJQCCFNqpZ9O5gwE0MFLcyFxn1SpYeE4PMXd6BROMH7x5foKFlkS6FgtKxHt5LjTXoEmgE/iBZiMbdOrisCe4OSk1VdO+b2p4gSXHZeNOk3aB1t830btmKdvFJNTdz32ctScsxHEIDGFjvOVEOTWJqvO12RbnLcnQMYtHBjHCJg4rlFtDxBxwqKKuv9ZJOL0FvANHhrub1a3OMEA2Vjm16/7ANwHwGcoOlpEBbJgcPDw5RWfWphNcXxFJOTv+vN9JyuvkAIKjxxeh5xF2Ylpe3CDw6esw9RWHkooq5K4D40g5iV5CcWNnv74BgZSeYTSnSAMGhaWGvOrxZjtY18N4SbpnJsgpSckkp/10zZ2CXI4ZKAvFtTscUJCVBu4rgrGToUjnOPlPh8Db3eGicjRRlgZwu0GNPLAfkEY1QxiEDPAI6812YZ1XD0zle6Hrhe7D9i0VfPgUbU+bbZAtI1NJIOix3kcNeIKgOOTKqVQZTcyyYMeS1MqzFLC8HyxPa8TqvjBoP80Q4HM67RtRiL9xi7g1b6V7tTPvFzg=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(70206006)(426003)(70586007)(4744005)(6916009)(44832011)(8936002)(1076003)(2616005)(508600001)(7636003)(8676002)(9786002)(54906003)(316002)(4326008)(82310400004)(5660300002)(26005)(36756003)(2906002)(36860700001)(186003)(336012)(356005)(7696005)(6666004)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:17.5111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f2446b-0522-4086-39b2-08d9bef178fd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8758
Received-SPF: pass client-ip=40.107.243.72; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

Add in the missing includes in the header for being able to build the DMA
model when reusing it.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/xlnx_csu_dma.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 9e9dc551e9..28806628b1 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -21,6 +21,11 @@
 #ifndef XLNX_CSU_DMA_H
 #define XLNX_CSU_DMA_H
 
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/ptimer.h"
+#include "hw/stream.h"
+
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
 #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
-- 
2.11.0


