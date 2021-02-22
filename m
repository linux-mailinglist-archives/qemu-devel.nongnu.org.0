Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0A3211DB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:19:12 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Qx-0006em-Tw
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O4-0004X4-JY; Mon, 22 Feb 2021 03:16:12 -0500
Received: from mail-bn8nam12on2055.outbound.protection.outlook.com
 ([40.107.237.55]:29795 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O0-0001i9-1B; Mon, 22 Feb 2021 03:16:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOxLXZm9QkX/YJvR5UFgl03TFCqRIr2L05pq967wpp3mxKMQG/FLxrORHOZXrb4OYt8Zhsmyh6Ck7+j6vRZo7yaO6YrEj1x47fxqOlJTGBVTsiazofnGVbxudECUSGr9IlhdOwaRxjLimz8uF4rvr983ueH04lJx+zkZtohrnp9z1kfQb+LfO2g1Dn965l6VlVgkzFXAcVGBXcQklFJdI74XyRVO92Hy/WnwT9VuzzDjf/aUsc3p+/BwcOWYKLOtSrVCvJ1+zPs588QeiOLYxjfTRKdZDfFq8mkxOyWtSdLUsQjg+j1V7juxLHJstDZWo4aqdBW+eRNvUK+QB/HJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+F0ocLDa7Zd899BGTGzpWOl0sKChGmJiyYbEDAklCA=;
 b=exbJC77veWP1jvFqua8xt3FDrigf25m++F+Y4rGAJKyW+5Dfr7N8d10bGPRaPCaCZyIWw90qiCGDarp38uDJU0rHcT6Y+2UOaXERlds5Y64xgacMS5KSe/zIDQUJlUSkr8QkQ/k4wgHXpu7JJkf46f756mLisoXbBCeEIivj87kPk4Dwv85WGUi6ovjwYJN28j2sX58KnlGXV1Jz7QnH6fP8BqDZIsUICJlpb6hbiboUevopGJKtsibDHuFFKsYNTxrlTPC7m4YMYRMtT27dYhM/wCDe891fP5ewy9/y9oN2KuA1HfNH7TKArPmYMHhhD/QvNLwsVK1RLXhHLWuyAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+F0ocLDa7Zd899BGTGzpWOl0sKChGmJiyYbEDAklCA=;
 b=nhZ4gpo1uNJQIBrDbtSJrnvcd0vLzZU/isTnUf6HEhwSBpkcQA7Bl9w45xyE6OuoZSQ3UNJfXx6h/lq+hLgS02S8LepDE6KetoYPe6tKDqWuo2mYvvqVK8+QyKMi0KPM1Ct61P5Mp17B+3Ip4pNdZg3cYNOoZpa5EsdLLXpzkT8=
Received: from CY4PR16CA0046.namprd16.prod.outlook.com (2603:10b6:910:60::33)
 by PH0PR02MB7366.namprd02.prod.outlook.com (2603:10b6:510:8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Mon, 22 Feb
 2021 08:16:04 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:60:cafe::7a) by CY4PR16CA0046.outlook.office365.com
 (2603:10b6:910:60::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:03 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:15:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:15:59 -0800
Received: from [10.140.6.35] (port=59032 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nq-0004Lq-R2; Mon, 22 Feb 2021 00:15:59 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id BBF8313C09CF; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 04/22] sd: emmc: update OCR fields for eMMC
Date: Mon, 22 Feb 2021 13:50:21 +0530
Message-ID: <1613982039-13861-5-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 811c30d4-26dc-4e9e-3ac0-08d8d70a18ea
X-MS-TrafficTypeDiagnostic: PH0PR02MB7366:
X-Microsoft-Antispam-PRVS: <PH0PR02MB73661F18E3937F4E4DBD8CA8CA819@PH0PR02MB7366.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: stjI8fD7JK8KM0uenXGSHyrayoWhuPeSIjli5Qhy+0oEA/+OKyoHETiLoUMqDPwKHWg7bpZ49Xb1kttOTvh1oe0dBU9Ya5COYjuFTFFDHgkCZd/xdktHu71gOSlMkY/sG/rXu3Ti855fpIhuell1Pn1Z2b0t2cXZZPBcw4qflmdylEMqUMDNQKPbDPrO0QTBrBItpv1EapPTD57t4D2/XrdMuyzZGmeITzXJ/vm6OZPPwCyk3dchfawN6z8P19Aa88sNJqo5tviRwfwenh+cYHrL1nUXKOE4NRkYCrKG25jIqJpZFUbeZZ3RuKa4oNRvUvWySNJ8COIAWSqgh+UeclSAujw18jqK6pBcam0+htOjWNNghBdARkZwV830CICPXtfbozTbZQwq5AfYwGYgmFvaXELpST9/A4KBonlcCxv2tUNO6UPhopoKAJ5hv7/9S4/3Me6Jex0qVt3hMeTgjDK9FtyWBu9ISyph+MsWkIUk3VAauhqbLJtVcAJ/KWBHpRtcX+Eia8+Z9wagByI4WUy9URLqQJvLxUYhUR06W9CUPezpKbzbEl6Ka0VpTRWROSs29MsxYv+qHRqfB6knduQFxZBovvBYWw58ye4EQQKBbrZ+0n5dzKrCpx+Aogsmfofx6oLgrxnavuxVKeQriHw2ycZwwHuhjQzmOKoaxsMnv1L/BODDmZwJjwWDUHRyyIUE9t5aHzfpej8vcjtLeg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(36840700001)(46966006)(316002)(110136005)(42186006)(54906003)(186003)(36906005)(82740400003)(356005)(7636003)(5660300002)(36860700001)(70206006)(70586007)(478600001)(8936002)(4326008)(82310400003)(6666004)(8676002)(2906002)(83380400001)(921005)(7416002)(47076005)(26005)(2616005)(107886003)(36756003)(6266002)(336012)(426003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:03.9943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811c30d4-26dc-4e9e-3ac0-08d8d70a18ea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7366
Received-SPF: pass client-ip=40.107.237.55; envelope-from=saipava@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 42ee49c..430bea5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -283,6 +283,15 @@ FIELD(OCR, UHS_II_CARD,                29,  1) /* Only UHS-II */
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
@@ -292,8 +301,16 @@ FIELD(OCR, CARD_POWER_UP,              31,  1)
 
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
@@ -521,7 +538,11 @@ static void sd_response_r1_make(SDState *sd, uint8_t *response)
 
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


