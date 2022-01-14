Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A045F48ED2E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:36:02 +0100 (CET)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OcT-0003LF-NY
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVj-0002To-N0
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:03 -0500
Received: from mail-co1nam11on2067.outbound.protection.outlook.com
 ([40.107.220.67]:30752 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVi-0007WO-2H
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuoBVaeK8da0GzVt32OKnQPPQDvlQp2KL6C6zJ+ZZ2ftqdrdfKjdgXHCEfaXQtnE7Un+2uNsjOEaqyj+0YnsJBsJGnXMd7p9Yup+7LvE6+vdQsz6M/J4si+hU2sgDoYH5JJLMGuACkEXP7RztluGFbzPRPSeB59Bh2qtzSK4gHEzdfPm7SOk/dWQGpRAVgR4O5gEYiv6m4U+WgK8fOTTuPdIuA/prO4Jfy9rNMtYa86ogo+LqIxdf4lnEM4u7zQrxIbZenBrZr2zqUSQJLLhVDGGIS8hmBoI+GTcVtwQSdlyBtdmtenhXQrztPQ0ti9fa8nUtajHN/9DTWcA2nvb7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll0iVtXH/wXJPrHJndUM5Xjbo3GdAJy2+hETg1ZblaY=;
 b=Leq0llAspOHhL3C4BsJpYfNC09yndhUyCfefqQt5df3p9P4ZRlpO5eExwgKzilpcrPOAAigzYDOQUs+kKVrsMJB06VHJXWRowfjFyHQvr6gvQD4Ehc7z3fMgjgoKcuDFDC9zsn7eVvWYRToV+v6UI45PYld5EB3Lq1lDxzJh3YgDeCICnJZVlIGJWws6aDA2m7QBxO99RKtMg6Vo7yb5Gce5RJi5fxbmKD0btyyaj3H2f78RT+MtuwpsSKlHeAnkwVRgWqyfTd2s92M6dB1pfVkGeA70d8SX6xPUeR4OAhi+2gxMk0vrKA2ChzAR1L0ZDrFSXd/Ir1P1JillloRdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll0iVtXH/wXJPrHJndUM5Xjbo3GdAJy2+hETg1ZblaY=;
 b=JvLLfc3x7dRi1vmO4o50MXTXwVtMXY/jaJxqUanscTS3566jsD1zPcbYV8BY3ZvdcKO0DjcUV6yI6qNcpQ2Uj09JGQ1YcDU1YTPVoYhkxWNQnz3Tgt67Cxmwy24gI2zVqLoACJWv7mv2ezTsdeU/7d2rPknUPzlyAbnldHgRdHI=
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by BL0PR02MB5507.namprd02.prod.outlook.com (2603:10b6:208:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 15:28:53 +0000
Received: from BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::2c) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.2 via Frontend
 Transport; Fri, 14 Jan 2022 15:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT051.mail.protection.outlook.com (10.13.2.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:28:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:52 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVY-0004L4-2T; Fri, 14 Jan 2022 07:28:52 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 04/12] include/hw/dma/xlnx_csu_dma: Add in missing includes
 in the header
Date: Fri, 14 Jan 2022 15:28:33 +0000
Message-ID: <20220114152841.1740-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b85998ec-ded5-47a4-db8c-08d9d77292c5
X-MS-TrafficTypeDiagnostic: BL0PR02MB5507:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB5507B6E9A995B269358DA8C9AD549@BL0PR02MB5507.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BCUxrZJVjIfglY2yMJ/kS5wdDJFBXHJpE2M9Ffp0Nb4QrJmUxUT0QYW0vtOJtMLBqkdOP6Y/AYErA/JCn6cU4v6pKWbyEkMkaYKeYVGg9fk4sqYk37HLQ2LqAsFIR/kg8g23o3+Ej51sIB4JA5vcpaQHMAkaH72/mdLXpnU8LRtae106lh78q9iKPMjp1vWcTR6PuyWiDpVKwe9xOcdhStnTHy3H6G5381dGEUMlck/Zm8Pd2+IW6AXupE6I30cE5geW7jOiARwNKt2xbRfN7tsR4WKl+EE1RRNFuvLo3cXRSSRa1KudI/SF2LZfFxjBSoA5mNJQFLDmg5Op5NIgbYdr0S5Vc6bG2BxkbIK9lOoYguIuu05RZxeA+O+esqZxF8w+Fxxmnd3GGBJJP6ooqg/NRILJ8PNiyl7+86+S7wyOTZTdjHgJxhqEAGRdwdeeFAcEynnUqIGqdV5DBzJubkQXpF1dgzE1DdRmeD/zb50hM3wScTkizWmOkCCmznSZMVAmmoBdfWLEZueVFvgiuuUGt0mdhUQeUJn4fh8TCCp/y1j1WSJ73TpFV3XWtgNDqMV4nP56e2EbT6AFY2L/ODx/Sxte1q5nYZZ6zmaJXOyZEi2f9COG8sfu1qS0oBITfOwyitOngdsG9bsZc6KeepVNg+Ub4dmq/KBbK/UVBKnLJjWhKN/mKCC2e+cE7YfPwjf2/HT1kK5UFdCA0mnDh5hTOysVps45ylf+Suv7MUw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70206006)(6666004)(356005)(5660300002)(54906003)(316002)(4326008)(1076003)(47076005)(70586007)(7636003)(4744005)(6916009)(36756003)(7696005)(36860700001)(26005)(82310400004)(2616005)(44832011)(426003)(336012)(186003)(9786002)(508600001)(8936002)(2906002)(8676002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:28:53.6913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85998ec-ded5-47a4-db8c-08d9d77292c5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5507
Received-SPF: pass client-ip=40.107.220.67; envelope-from=figlesia@xilinx.com;
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


