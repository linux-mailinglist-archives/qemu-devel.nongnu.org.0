Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82477327425
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:33:05 +0100 (CET)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRoO-0002nr-Bv
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl5-00006s-5i; Sun, 28 Feb 2021 14:29:39 -0500
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41]:43360 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0003BA-Pv; Sun, 28 Feb 2021 14:29:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnxtgFTCAiNnRgJHz0FmceMlAByU6OJg6gtd7D+0lj7shPczb7RrIZac0FAG3EBQgFvWdzm2qSrqdrhB9ufOVhv2nQJezPBfBj5Qd0w0yOFwBOyJLOfaAWFPg9WymsWPIJTuy0Jc/85B+P9fQ9K69vBrYTkmyMoRsGInz55oeO7Kzmi6xvnVV71RK2H2sD8zVEUAI6VmyPGNnPUkgVH71+dnnIiKP6I9i2MLuGf+t8SeCslBjJ0BRfZs04XdpL4JeygB4l0CtX/STtIqGhitjkOIT5catjlGdMHjPz6+GGgMMwR7GWtot4wG75j+YDAI9IvIQUtmm8gH8I+8eNSYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM/wb83RADPwb/lNDgTWDciL4aUC3VqMx5JRIZDRQR0=;
 b=InpS5Z/s/rG8rqmrsmDfwOIooMbZTfpNeTlhM52OKnamKwu+R7/M8eNW3eV7qWAxl6NVMO68KegckJqWTj9v5SuZwvUZ+cHK1+YMGepags+bQvbjtFP+8pQF5e//zpcr58iUsXzDcGpYcNp12gWm493c6zS+kWdD8ashiUGhXh1zhaYByqIduQoXqc6m1HFHtzIB70FxvNE7mo5YPxXFXiqYDa4BykuNKHpqzZmF1CgrpOAnN7WI6LjKxRqBtYioR0/U1NZS4bIWfqwFMUpuYRnG7SwiVQu68pFmjYtYEBia4dA8MwduK6yXoZZjoUAsv9bKTbZHA+ITcVK84YY4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zM/wb83RADPwb/lNDgTWDciL4aUC3VqMx5JRIZDRQR0=;
 b=j+IvkQlOJOVvhCP/ALx+RPjf4O7k9/ygKp5oa8RlV5EnQPK2uP+h27pkw9HRn+a5pCOQh2OjqE4G5fL1uaDfyq7+HAwzjMsPgFiTohKZmDLPPqTivlFUrzDCUoJFF2N/ua0R+O/YaWyXW2X3NYD1jeKfiA85lJ3LDxBnc7OLjfU=
Received: from CY4PR13CA0080.namprd13.prod.outlook.com (2603:10b6:903:152::18)
 by MWHPR02MB2302.namprd02.prod.outlook.com (2603:10b6:300:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:27 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:152:cafe::a8) by CY4PR13CA0080.outlook.office365.com
 (2603:10b6:903:152::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57764 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0003ML-3B; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id B675A13C0A7E; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [PATCH v3 15/21] sd: emmc: Update CID structure for eMMC
Date: Mon, 1 Mar 2021 01:03:21 +0530
Message-ID: <1614540807-30686-16-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a17fd97e-b6c7-4ff5-ae07-08d8dc1f29a0
X-MS-TrafficTypeDiagnostic: MWHPR02MB2302:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2302E3B8AAF82C0C628819A1CA9B9@MWHPR02MB2302.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wUDGks30FdjxjZTjlP9r+J2GXBYqHrHpdEaVtwiHhnkXuk593QCSX/HIi2y+rtLWQl/X5qxEsM4KhjXHinCx8xF+3T4lqazxPQJk2/kEREPlF60w6dMjnVFv3n90DvqdukH/CfP/J8jiKZi358L3U/lJcHugKH3/Pik7/v01kmhVbLGKDitJmZ9RuOb77d2xCVK3vy8UyC1mD+Ht8XFGrtXMdIWl7eITFoBoL/lcU7tLdsRblJrmMQl/TVylldZSpJX5H2nMrTeDdDxbCEBEA2CqKyH2b8x0PKpHlAEFAOOMyTs56Dokm7gZCc8/cmA0mGtSyb7c/lBXlB54oEDLkepNKGUIAudxMk/ayA4/xKlPzab/kWILKIsES4jl5/e7Nu/6m8a0sBgbAzXhwNYDeEHlkZFBBJ73fVzzduhHr/O46tjPIBFCLc7HbeefCd54Vvhk7oUygYOH56pmNS1jiW+q1wVAlHWIquulH/nwXlyLtph1zUbqWu5ldR84OZnqiym+iyfkVND7bjoFJriqSckEpb4/VeEdq7IQd3/PZURceXdtaxyFsUsC+f10INO3jp3eytociy5991cruedLJGFUzrG55mf8RtGj6zCpvapBpXpQI2g+EMf4BF8XdvD9hgRCGkAlkqdKDVvuSind5ywvl+tukVQnqTwH/pLAxEc/P/ZgbiLLN+5UcSWXlY5JiIs5osDnnJUqMIj2VB1BfA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(36840700001)(46966006)(5660300002)(82740400003)(8936002)(70586007)(921005)(7416002)(54906003)(2906002)(2616005)(356005)(186003)(70206006)(36860700001)(4326008)(7636003)(42186006)(110136005)(6666004)(6266002)(336012)(316002)(426003)(83380400001)(36906005)(36756003)(47076005)(478600001)(26005)(107886003)(82310400003)(8676002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:27.2778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17fd97e-b6c7-4ff5-ae07-08d8dc1f29a0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2302
Received-SPF: pass client-ip=40.107.236.41; envelope-from=saipava@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CID structure is little different for eMMC, w.r.t to product name and
manufacturing date.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bba0446..08b77ad 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -365,23 +365,36 @@ static void sd_set_scr(SDState *sd)
 
 static void sd_set_cid(SDState *sd)
 {
-    sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
-    sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
-    sd->cid[2] = OID[1];
-    sd->cid[3] = PNM[0];    /* Fake product name (PNM) */
-    sd->cid[4] = PNM[1];
-    sd->cid[5] = PNM[2];
-    sd->cid[6] = PNM[3];
-    sd->cid[7] = PNM[4];
-    sd->cid[8] = PRV;       /* Fake product revision (PRV) */
-    sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
-    sd->cid[10] = 0xad;
-    sd->cid[11] = 0xbe;
-    sd->cid[12] = 0xef;
-    sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
-        ((MDT_YR - 2000) / 10);
-    sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
-    sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
+    if (sd->emmc) {
+        sd->cid[0] = MID;
+        sd->cid[1] = 0x1;       /* CBX */
+        sd->cid[2] = OID[0];    /* OEM/Application ID (OID) */
+        sd->cid[8] = 0x0;
+        sd->cid[9] = PRV;        /* Fake product revision (PRV) */
+        sd->cid[10] = 0xde;      /* Fake serial number (PSN) */
+        sd->cid[11] = 0xad;
+        sd->cid[12] = 0xbe;
+        sd->cid[13] = 0xef;
+        sd->cid[14] = ((MDT_YR - 1997) % 0x10); /* MDT */
+    } else {
+        sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
+        sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
+        sd->cid[2] = OID[1];
+        sd->cid[8] = PRV;       /* Fake product revision (PRV) */
+        sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
+        sd->cid[10] = 0xad;
+        sd->cid[11] = 0xbe;
+        sd->cid[12] = 0xef;
+        sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
+            ((MDT_YR - 2000) / 10);
+        sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
+   }
+   sd->cid[3] = PNM[0];    /* Fake product name (PNM) 48bit */
+   sd->cid[4] = PNM[1];
+   sd->cid[5] = PNM[2];
+   sd->cid[6] = PNM[3];
+   sd->cid[7] = PNM[4];
+   sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
 #define HWBLOCK_SHIFT   9           /* 512 bytes */
-- 
2.7.4


