Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC5327437
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:43:05 +0100 (CET)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRxz-0000cu-MI
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlE-0000Mz-7g; Sun, 28 Feb 2021 14:29:48 -0500
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41]:43360 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl5-0003BA-TH; Sun, 28 Feb 2021 14:29:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J52gA+BX8IeKlSWR0aS/LAEVwA3IQSPMS0rovhotb8+z87xtB9tMVF2Pgm7jY72lpcg48FgQb6+7uQ56xGp8b+nRAXBNsaTRGR2CuHp7EUXe5f0QouG+0KuYGSHyQmalqDOTb997hSXa8scKB1/D5DLT+hWPndM1mD2F7IjU2WzQQzjKv7BYhLHUyxgpkJPE09dJT1vIkk8KqMHEUKcoIHfYHW5rBHxIfzQbdIp0ETA5u+v0+NENFHCCexkKIUIT/LgKi4P3UhgHtcMcJCtJaOeEHD4tVeqatSKjhtjCF8CTwetR3D8gAulGfPn3FbQdV/abyyJV0cMq7udaJvnftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fY9HpVPoQ5z0IBxhOa1n/ZuBIQZwWxDpcKbgQV9lnI=;
 b=TBkD/tLNnHe+CD+JaCAr16pnbFEh6sAMCraKaqMLCxpjxkfn0RKl4TE3ZP7lwKHQENaWmt0Q+Q214sY00BgJORvOX0Dp2hQNfaf0p2p34CxXPFMj8BEtwdEVpZDxAT8XOFLIoiKgGf9a0FVXdjSKQfjRs1gy/GoV6AH5y9MHfNNpHdqbdLZaQZCGwa28V9Bi731U0vpDGo4FN7Z+sy3e5zmkK4AHOGS5Y2c1gNo3G5rkwN5HwFF/SZcoA1c3fEKgtUOnGcokyc/Wxgl015ZNerUeIqVza1IsvupjM9KkOP5soanSdaTV5EHqNYgkLTJfGSNQ0HRO81wpC9LRzhH4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fY9HpVPoQ5z0IBxhOa1n/ZuBIQZwWxDpcKbgQV9lnI=;
 b=r2QnrJODxG0ZmoJej5tAp8su8cDVdZUm4IW76SaziIAAq8jtcnEu2TaTLDS2qb+IQe2E9+FXuz04G+fZ+fXAe+MAOsg2N0C+3zKlD5kFHKf70QkBdFOlyUcyGSYMQ3RoIZiZeA9bRJh1kgzVgifm67jAnpKARnId3NB2+Zd5aeU=
Received: from CY4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:903:33::25)
 by MWHPR02MB2302.namprd02.prod.outlook.com (2603:10b6:300:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:27 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::21) by CY4PR03CA0015.outlook.office365.com
 (2603:10b6:903:33::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:16 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:16 -0800
Received: from [10.140.6.35] (port=57762 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRki-0003MF-Cd; Sun, 28 Feb 2021 11:29:16 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 6111813C091C; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 04/21] sd: emmc: update OCR fields for eMMC
Date: Mon, 1 Mar 2021 01:03:10 +0530
Message-ID: <1614540807-30686-5-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 862776a0-36e1-4ee0-338b-08d8dc1f29ac
X-MS-TrafficTypeDiagnostic: MWHPR02MB2302:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2302597A3329D8662681801FCA9B9@MWHPR02MB2302.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EugIWa4zWn/aDdGnfrSxXdgwl8r84/PPp8evrYnB5Fjgfyp8BSVeo/LLPuj5wJSIZvJaoJbglC31S9JQ6YeKo+XbLdHoF4IR/ynGAanwFpvxQK+fHBavLGI7PzkLZwsJ+JDFPBMdXxiBmJwVWi9L9rAPp6AdvRKFqUQQuvk2/qrH1BmUBQUsCKasPR1tgsSh5+55r51i8rhZwFqdhWzQr6yI+a4ggvXswIA0XyKbIH+od6lku/kc+wBrMj4F4SDSlYFM/9tzKlKBtswy2SCHJTNAl5RG68ZuQRoZefHDaHu9mb+A88evSSNI0qrxiH++mFRBBH44uJEbX4p09oOGPD/OnaD7NyovAgU9biJiIqLKRUgRSPvGDxdPa/ArPHPDFNTLtyBjqEZdWq1B8yco+YQ1J6caXUw9WfhcGoD9JXMdcHsX+XBpk2TT81LVH9ColQGGTTcesB8fM3CrQ5J1iH2Kbeikp03713mw7Eo/VSJ9cUMK9p2bcsec30R2Z+tJMpeB/OrCZ9xDGwSPPsqh82vZsGiVxaa5Fe42pmQrU6/SMHLbj2XLhoM/iAvxJFWTMiNW0SSiNKIJLFVJa+HM2PSOaoLoDscPF7BD7d+jug3coLnx0y0b5T5n6C83NPbKNf6clpQjtYhxzSqQp19etX4wJORiI+z1Zfp6eP3WJve2XCUibKMr8isD566HCVkp41Y+LL67q2mWsIzTikwvsg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(36840700001)(46966006)(5660300002)(82740400003)(8936002)(70586007)(921005)(7416002)(54906003)(2906002)(2616005)(356005)(186003)(70206006)(36860700001)(4326008)(7636003)(42186006)(110136005)(6666004)(6266002)(336012)(316002)(426003)(83380400001)(36906005)(36756003)(47076005)(478600001)(26005)(107886003)(82310400003)(8676002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:27.3543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862776a0-36e1-4ee0-338b-08d8dc1f29ac
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
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

From: Vincent Palatin <vpalatin@chromium.org>

eMMC OCR register doesn't has UHS-II field and voltage fields are
different.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 6de414b..bc9d913 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -287,6 +287,15 @@ FIELD(OCR, UHS_II_CARD,                29,  1) /* Only UHS-II */
 FIELD(OCR, CARD_CAPACITY,              30,  1) /* 0:SDSC, 1:SDHC/SDXC */
 FIELD(OCR, CARD_POWER_UP,              31,  1)
 
+/*
+ * eMMC OCR register
+ */
+FIELD(EMMC_OCR, VDD_WINDOW_0,  7, 1)
+FIELD(EMMC_OCR, VDD_WINDOW_1,  8, 7)
+FIELD(EMMC_OCR, VDD_WINDOW_2, 15, 9)
+FIELD(EMMC_OCR, ACCESS_MODE,  29, 2)
+FIELD(EMMC_OCR, POWER_UP,     31, 1)
+
 #define ACMD41_ENQUIRY_MASK     0x00ffffff
 #define ACMD41_R3_MASK          (R_OCR_VDD_VOLTAGE_WIN_HI_MASK \
                                | R_OCR_ACCEPT_SWITCH_1V8_MASK \
@@ -296,8 +305,16 @@ FIELD(OCR, CARD_POWER_UP,              31,  1)
 
 static void sd_set_ocr(SDState *sd)
 {
-    /* All voltages OK */
-    sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
+    if (sd->emmc) {
+        /*
+         * Dual Voltage eMMC card
+         */
+        sd->ocr = R_EMMC_OCR_VDD_WINDOW_0_MASK |
+                  R_EMMC_OCR_VDD_WINDOW_2_MASK;
+    } else {
+        /* All voltages OK */
+        sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
+    }
 }
 
 static void sd_ocr_powerup(void *opaque)
@@ -525,7 +542,11 @@ static void sd_response_r1_make(SDState *sd, uint8_t *response)
 
 static void sd_response_r3_make(SDState *sd, uint8_t *response)
 {
-    stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
+    if (sd->emmc) {
+        stl_be_p(response, sd->ocr);
+    } else {
+        stl_be_p(response, sd->ocr & ACMD41_R3_MASK);
+    }
 }
 
 static void sd_response_r6_make(SDState *sd, uint8_t *response)
-- 
2.7.4


