Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C4318652
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:31:45 +0100 (CET)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7O3-00017t-Uc
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76N-0002zh-EW; Thu, 11 Feb 2021 03:13:27 -0500
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com
 ([40.107.244.75]:63553 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76H-0004gr-KO; Thu, 11 Feb 2021 03:13:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vm2Jdpb8kQaMdWzNzNiGhTnda4ETGPDsjmmftEuIh3dcMO7fgG9558qfApaKEqBTpqzET6sYgmkVYfIu3cdCMB0ZqSdnEnAMbngt3E4q8kphPEORTvr9dCUHjKT9cEI3rSlsReqgqN2tM9EIp0ntb8cMwS18yaW7sU72yryxXVAoErBHgarRWswqoulCuCjillSPv5/6zUgkYiDyinkrQVd7Fkanh0D108NgiPph/nc0k85nRfVc7TLK4cFLPP6SCLtrGHmAivcJzsCEmUUqON+MBxYlyICppBwxx2Y/kbooyifINANsJfwjugqqiHCfPMqBReWPNc0xg3ldn/U6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyABf3eDMNEkDY1iB+BhJEthHtM8IVaih+J7OynGKc0=;
 b=WcATplag9dJN2Qy1LjtfVN1YPEu7te6TFe3KXql10va1B6TlOgVaRDz0P07wm73eNMDg42DQSXV3oYXwcSDwIsRq1EQYfflXrNLbS2luX3ZCV7f0Szt0OCTvebZCHO1DdiLjAdo+r1IFdkajIfCDHh0ULUuW3yghFONXvesSFo47qIk/OiLviYhaz1nHyv7vAT3wJ67bns9MCc4dHoHtAPGMUz788vafy7JfPfrEWX8goI/9W15JVMGEOpJ8qCndAS62iYvyMBziyvgK9HNnBtViIJZABwuNjFbTv60q5iUTFeSAKlBm7L8mTXCtjdNeMIyH+AX5zPpv4SdAvsNuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyABf3eDMNEkDY1iB+BhJEthHtM8IVaih+J7OynGKc0=;
 b=ZnBkjIom+mIiE4xNDD99Lo7A/Hex72yHfi+xWrOwQ3TS+so+SaXoEGEh6LfRtDf2KjlvKZ2Gs8s+Vr54hoVyXExSmp7bxBsZmHNU8NA1s9yTROKyB1GQE7tavO5IKrAR3mWcuDVXVpIjssUBFoFDHMpuqzDK6yAfpXmW4SdcBiY=
Received: from BL0PR0102CA0003.prod.exchangelabs.com (2603:10b6:207:18::16) by
 SN6PR02MB4080.namprd02.prod.outlook.com (2603:10b6:805:2c::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Thu, 11 Feb 2021 08:13:17 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:18:cafe::40) by BL0PR0102CA0003.outlook.office365.com
 (2603:10b6:207:18::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:17 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:54 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:54 -0800
Received: from [10.140.6.35] (port=49682 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75q-0000HE-8r; Thu, 11 Feb 2021 00:12:54 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 3A7F913C06B8; Thu, 11 Feb 2021 13:48:16 +0530 (IST)
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
Subject: [RFC PATCH 10/15] sd: emmc: Update CID structure for eMMC
Date: Thu, 11 Feb 2021 13:47:21 +0530
Message-ID: <1613031446-22154-11-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7e3dc53-9ee7-466b-d4af-08d8ce64e30f
X-MS-TrafficTypeDiagnostic: SN6PR02MB4080:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4080D1F215067CBD0EC4E11ACA8C9@SN6PR02MB4080.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWhW2Sy1maBbyUp5GuYSru5A/kvq8mPDaVd/CTsdHFoJAUbpPt/GoPLqwGjH3S4h8BMEzENXUjad/yYs0BcsvBdwVY59OChutjOMGlqcTdQY0+u1hTQ/pXQ7BTyJx90qvcBROSerEQdpWWdq+lcvFpsnGPpe+3q4K+O6oQ7sBIE0W097vpCj/eLOdWit5sXcPh1ubSvEEKzLkLGAnwXaLWqfVmireZ+Me2YGwlb8HZZ4KVEbWNBAsdUy/XwXdtp11EMM0nezsG/DU4DLSyK7dLvewx0dSqOwWyqBsvplwrNf9YFKR+sK1NbhuOZW1CqBHNHcH3ACoNM5Vo4RYDBAzkivuFM909YaVUVc+9dhmY4GmAWOhOCwi9+B36jGRGTvAeLkH9U+nvJKx3bQKax5Z/cHcv+wv5LcMppZuZ9zhSFCO+TNjxyFPlRokwhwUnjEYEEvqwBrC9pLf9an7xSe9jhZp3npDqi88mnZ1bXAaeZNUbifELZUgUnWN1akDlyaUYidXVy3DlJFpm4C7FwQDXVj5M43nppU84Cpm0dDkWiDPa6byOt2+6yKD0qJD3r9Yw+iUGUI3mmq93/mnUjr+YIoNWls6ycVEPTwkoiekx1h2k40qFFyxhMSKRVQ8PNFOIW+0AHKaEvfpynFEYxDo1470/3cGhw78Rm4A/x4o4Gzq5VS5t9ugYGkx27gvnDCDjSXj5JUSi7W3LXLydXZrw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(46966006)(426003)(70586007)(70206006)(336012)(107886003)(316002)(47076005)(5660300002)(7416002)(82310400003)(83380400001)(2616005)(2906002)(36860700001)(921005)(7636003)(26005)(356005)(54906003)(110136005)(186003)(8936002)(82740400003)(6666004)(478600001)(36756003)(36906005)(6266002)(42186006)(8676002)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:17.3032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e3dc53-9ee7-466b-d4af-08d8ce64e30f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4080
Received-SPF: pass client-ip=40.107.244.75; envelope-from=saipava@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
 hw/sd/sd.c | 52 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7aab647..45311fa 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -345,23 +345,41 @@ static void sd_set_scr(SDState *sd)
 
 static void sd_set_cid(SDState *sd)
 {
-    sd->cid[0] = MID;		/* Fake card manufacturer ID (MID) */
-    sd->cid[1] = OID[0];	/* OEM/Application ID (OID) */
-    sd->cid[2] = OID[1];
-    sd->cid[3] = PNM[0];	/* Fake product name (PNM) */
-    sd->cid[4] = PNM[1];
-    sd->cid[5] = PNM[2];
-    sd->cid[6] = PNM[3];
-    sd->cid[7] = PNM[4];
-    sd->cid[8] = PRV;		/* Fake product revision (PRV) */
-    sd->cid[9] = 0xde;		/* Fake serial number (PSN) */
-    sd->cid[10] = 0xad;
-    sd->cid[11] = 0xbe;
-    sd->cid[12] = 0xef;
-    sd->cid[13] = 0x00 |	/* Manufacture date (MDT) */
-        ((MDT_YR - 2000) / 10);
-    sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
-    sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
+    if (sd->emmc) {
+        sd->cid[0] = MID;
+        sd->cid[1] = 0x1;       /* CBX */
+        sd->cid[2] = OID[0];    /* OEM/Application ID (OID) */
+        sd->cid[3] = PNM[0];    /* Fake product name (PNM) 48bit */
+        sd->cid[4] = PNM[1];
+        sd->cid[5] = PNM[2];
+        sd->cid[6] = PNM[3];
+        sd->cid[7] = PNM[4];
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
+        sd->cid[3] = PNM[0];    /* Fake product name (PNM) 40bit */
+        sd->cid[4] = PNM[1];
+        sd->cid[5] = PNM[2];
+        sd->cid[6] = PNM[3];
+        sd->cid[7] = PNM[4];
+        sd->cid[8] = PRV;       /* Fake product revision (PRV) */
+        sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
+        sd->cid[10] = 0xad;
+        sd->cid[11] = 0xbe;
+        sd->cid[12] = 0xef;
+        sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
+            ((MDT_YR - 2000) / 10);
+        sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
+   }
+   sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
 #define HWBLOCK_SHIFT	9			/* 512 bytes */
-- 
2.7.4


