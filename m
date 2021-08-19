Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21A3F1184
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 05:22:54 +0200 (CEST)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGYdp-00010D-PS
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 23:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGYYL-0001jK-7x; Wed, 18 Aug 2021 23:17:14 -0400
Received: from mail-bn1nam07on2051.outbound.protection.outlook.com
 ([40.107.212.51]:33536 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGYYI-00080J-PX; Wed, 18 Aug 2021 23:17:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz/8kyn4DcGpPvEqGHLMq/K7E4X2mQaByntQlsgfDKhVFjwvE2Q9t/BIAqS/wl8Sb9IpPDzit+QYFQZw46ckylSnRPAsq3t+w/BLX3TT57rpsAqKg6L7SN0uBYIBpZMqSXrs0nOTvuWYN8QTBiyIWiViukzuiHAqDe+i8ZrSfQ2tcdFwYfXJ9PQRtQEitibulcOReLXgLfQgyW65gW4xAojnQs5AG3xAtKri9XEXVHJOFES5BV9662Vao8dB7fsHCwOHadLoJgjoa45BRBrhBht1lj1E4RuUvg4i6tEBJ/nnhWmLUofwDtsZv9R2+WY48cE3k5BixKZIpEatCy8e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kasTZaZFn7PyNqmBw7AZanmXx4ZRWY5h7Gx53M8Cyew=;
 b=k7Ly62NXOC9oc3w2+ePlzXbQntV3XQklPQRUfzJuv/LrOjmIkueo7UEEqmcnAf1xjh2ndpSvNDLXOdyXZfoJ2NFv9Z66yRuQ42fzItNY2ohICpivz4fQnEIjVX6mCCFVs02KfJzty64V96s2omtHz2U9QC4CZutLkVc5CDyyvBQRs48sTjV+6gienDHWsVGo5ktyAUFJhnNOHbhvvhP53rUDN98wC8+K6yDyOwWpkr2a/wCdcgWsIcKRtr5vP70G71Km25xf2fs0ZmeV4uI1S8KFVEAWmpJZs8FC+Ck2S5P+UJ2G7vQQ6vGJR+o9xm4951LJV0S63KlhFzi2M8Nk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kasTZaZFn7PyNqmBw7AZanmXx4ZRWY5h7Gx53M8Cyew=;
 b=JI3YBBW+qFknGjTyhAHDQ+SGcS6uIkyKLsWj1ggGdZn8a5oUziPy/jQU7z+fQn0lWUOhJipC/eV2K42O1MD9y1jkUZhRTok8hnd1kQ5nK5m73Ko18thBTuA+nIIQy9cX4NvP5LzS+F8BVlTJcYwHsPU/OVDwFO3cgJIHWSF6FnA=
Received: from SN4PR0501CA0057.namprd05.prod.outlook.com
 (2603:10b6:803:41::34) by BYAPR02MB4360.namprd02.prod.outlook.com
 (2603:10b6:a03:5a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Thu, 19 Aug
 2021 03:17:04 +0000
Received: from SN1NAM02FT0008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::1b) by SN4PR0501CA0057.outlook.office365.com
 (2603:10b6:803:41::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.6 via Frontend
 Transport; Thu, 19 Aug 2021 03:17:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0008.mail.protection.outlook.com (10.97.5.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 03:17:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 20:17:02 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 20:17:02 -0700
Received: from [172.19.2.40] (port=52298 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGYYA-0002Wl-CK; Wed, 18 Aug 2021 20:17:02 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [Patch 1/2] hw/arm/xlnx-versal: Add unimplemented APU mmio
Date: Wed, 18 Aug 2021 20:15:24 -0700
Message-ID: <20210819031525.653995-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819031525.653995-1-tong.ho@xilinx.com>
References: <20210819031525.653995-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bac5ca3-5a29-4646-61e8-08d962bfd1cc
X-MS-TrafficTypeDiagnostic: BYAPR02MB4360:
X-Microsoft-Antispam-PRVS: <BYAPR02MB436097AECF585F69F17867C2CDC09@BYAPR02MB4360.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:267;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q7m+c9IyXCH0hV6IpbdZVH7axYM0S38G1ck7Sc7VZFvRZzmFYumdIpmGIhyezWdtyFLJfOtoLLShvmYUFluFnzG/Ls4u7y/IYH3qPEi8qq6TQ8M9YoNrT0Qo3czoPr9KrvOxqnRUjzcjnPtTBPgIsh5uwfRtr2cy/Gud9ATNCERXgDmDeyvnqI7uRRmlad8M+BpuRC/z9xTCcCGO8/6Nf0x4899yLXSAbyhAVQGLowUR0hYysAQUvbKa2y8vhAHVuro6HufuiJAfjZGUkIWptcIc2bpsxXO1Iq0ULesdxIKahCi9g35LAXLqNg+/W3SqX76V1bfoH91UAgYvGnn/RqoES8R3ZxC8yKOpEOwQz9sqjusJxTnIAL3Q276VVYtluefqKzUrHf7oBqxzz0iFuu4SMHyK2eo57MiuWDZ2PiDuXl1rK4bT8xFxgMrEx0VK2SF9hsiLhnCsCzJsOUxhDxZMg/KwzNFfqVVlUarc5fheAYXvgF9Z/3jcwRQRd1ba8huqbVIJntsXWdH5iPq1Wlso/fL4pcrba5lr/4mhficXtvOQq00ZOrGtjDBvNjTkRaXb2YSJFmU+gKHizBaNez3dSt6UT4z0Z4taX7vXbH2aEmYZMt2blRyv41mRSLeuK4UNRmbTh8FLkuGi5GYiQOUohWar1cbRXupAfIRsYlEnTI3i/HTPzPoswMtZUC+JjIqJILxofqgtHfV30JIcuGvKaYNYGoPzejdsfbaLpm/5at+l0hFVczMwr+1SFaFZoEjjiYRhN3UM/tyYjweIrb4u9r++QKDa2NOGJyojRYkzpu7E31/m5Xr6EEpLGpVO
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7636003)(5660300002)(44832011)(36860700001)(7696005)(336012)(107886003)(316002)(508600001)(1076003)(356005)(54906003)(2616005)(186003)(36756003)(966005)(426003)(36906005)(70586007)(47076005)(4326008)(8676002)(2906002)(70206006)(26005)(8936002)(6666004)(82310400003)(9786002)(6916009)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 03:17:04.6934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bac5ca3-5a29-4646-61e8-08d962bfd1cc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4360
Received-SPF: pass client-ip=40.107.212.51; envelope-from=tongh@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me,
 Tong Ho <tong.ho@xilinx.com>, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add unimplemented APU mmio region to xlnx-versal for booting
bare-metal guests built with standalone bsp published at:
  https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 2 ++
 include/hw/arm/xlnx-versal.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fb776834f7..cb6ec0a4a0 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -376,6 +376,8 @@ static void versal_unimp(Versal *s)
                         MM_CRL, MM_CRL_SIZE);
     versal_unimp_area(s, "crf", &s->mr_ps,
                         MM_FPD_CRF, MM_FPD_CRF_SIZE);
+    versal_unimp_area(s, "apu", &s->mr_ps,
+                        MM_FPD_FPD_APU, MM_FPD_FPD_APU_SIZE);
     versal_unimp_area(s, "crp", &s->mr_ps,
                         MM_PMC_CRP, MM_PMC_CRP_SIZE);
     versal_unimp_area(s, "iou-scntr", &s->mr_ps,
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 22a8fa5d11..9b79051747 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -167,6 +167,8 @@ struct Versal {
 #define MM_IOU_SCNTRS_SIZE          0x10000
 #define MM_FPD_CRF                  0xfd1a0000U
 #define MM_FPD_CRF_SIZE             0x140000
+#define MM_FPD_FPD_APU              0xfd5c0000
+#define MM_FPD_FPD_APU_SIZE         0x100
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
-- 
2.25.1


