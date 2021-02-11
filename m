Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824431863C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:21:31 +0100 (CET)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7EA-0001iT-6O
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76H-0002tJ-0u; Thu, 11 Feb 2021 03:13:21 -0500
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com
 ([40.107.93.86]:59335 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76F-0004fZ-4L; Thu, 11 Feb 2021 03:13:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiYBNkuVpHRWMc+UgYR4H/GexFukhEcze+H8puzgDThU/zRgVHtJ8rzpDo53mXhDqBs97B3Z0ZVy0t4SLR/ExCH2UEbHd4tqx3bX0YSktXfRmt1AJhBYxGJIqKT9WLP5LjsrOSLLFUnqrtP3dwjox0zzixO8bH+64WNpeHFDE81PkceuJXaluf9kHhvGztYLz2GCNWdG/ORomw5buOm56aMls2vkYqZ+TB72/G5FxZHRROMAR2fJR7XbGUlA5l1RCUpLfZX6SU3brd5fXZp4MyV9F9IUOsyzV0db5a6a8FrLtKqB+FX+DCcj79MpsTSkMrNOBadZ0CqXRoGLFUoFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2WX94tSM8uvqZIAR/41G0wh2sl1F6e/7ROJCFsAqIE=;
 b=dIvl2Wb2werrZyIOfTi6QQvf7nQF1TD66VuLb5tDsMsM52gDFULUUpUC+e4StQxBOpTIpEflKr1EP91vP7k2SCFrK2NPteh1HX2JZM5x2b0DUg3eb+R9dOjTAhs8rVTPwkOEcwmd12AaltWKbe4CtGztJ8Hcfgl8A7IamNdf8zrk6NP678mry05K7S4dejICEDZNQw7JNnkmyoe1YgYHjbgNr9HjkUvVz0jHzWzRp/2dvJuyiEjxGWVYBGIv3pXgk+HPaPIzTB4kq4DuZaEFgtnuyEGz/cBuSa6D4GKdNxUKBaWjdhV9Pwfj9hgTnQV0GaJtfNbqx8xyKmyplVko9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2WX94tSM8uvqZIAR/41G0wh2sl1F6e/7ROJCFsAqIE=;
 b=Tp0fxSFJ54WRtLHeB9gtB9FRSPUvz3zMPA7c1ChenR+NlFSOXdEp2zzoZXPmpkvuQgETnCDhJSbD6xBpub++/2KM+EzeiI89ONtMzGSxPZ0n2+ew6k+dabeb1N0gOsazkJLibHAvc/C+jQ42aW0ApdGfT3OD/tb23qSFF8Ds4Ig=
Received: from BL0PR0102CA0020.prod.exchangelabs.com (2603:10b6:207:18::33) by
 DM6PR02MB4523.namprd02.prod.outlook.com (2603:10b6:5:2b::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Thu, 11 Feb 2021 08:13:15 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:18:cafe::1c) by BL0PR0102CA0020.outlook.office365.com
 (2603:10b6:207:18::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:15 +0000
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
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:15 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:50 -0800
Received: from [10.140.6.35] (port=49674 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75m-0000Gw-0N; Thu, 11 Feb 2021 00:12:50 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 1005213C0653; Thu, 11 Feb 2021 13:48:13 +0530 (IST)
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
Subject: [RFC PATCH 06/15] sd: emmc: Add mmc switch function support
Date: Thu, 11 Feb 2021 13:47:17 +0530
Message-ID: <1613031446-22154-7-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 754fa72c-667e-48ac-4934-08d8ce64e208
X-MS-TrafficTypeDiagnostic: DM6PR02MB4523:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4523572A8513B60208A7D67ACA8C9@DM6PR02MB4523.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PHgKt+atTfaMlaN5nZbFH/knmsh9JHQDI/b7ApFYJssgTL83QvYP+qd5xnSA6ZpjCzEToeyPvsfSzYnfUlsrG+pP1MehPm+cgNwUwjCsStMiWm8t1ciZyjuGMWNxHVq3nUspoEcOY2Q8riFyWNoOBDtTPX/GRk7HTRdBArwazHhb7k/EASapDHF9xfD0Th4BkQxecDoaUbDaHZFYLayW/gcxLG/EEcSFF+6I9NhzItKgY75qfXHeIbs3PRFTQZpZW7aE614sj48GhQCq/OIfV9EML2v7LbOA1qgGBloQIhnKLISGRfQm99/ZkNzPuXt2Qx1MFpwQ0S9k3NsZVqZrHjNkjVzCBzuOa0CtRMlWKFvwn7suac+5UnS5PCZbNynEWWTmGZ0/dny7yCnU+/SG1cxz2LM2OpfQ4I0M1oqvlEi7lmcnLt+/2HsnW23IExAvDBPr13lOSFV27LYTM9grsf9Uj0/5fpsQkVkJ1rEyueni19w6g7jFg5lFhWuvM5gpyDzIvlp1Bd4KdmY4oAXglxY37Sr37bZctyg1MmvLTT+nyjxJuSLZW9snZUpLrMztFQpR+pE00Pue1yyVuTOEzWLnZb5n5ylRh2xh5pvFMR0DvSJOe/OaRhVHhkcZ0WIf7v5C869J0Hkv0Jg4wcQzHP3pvLMJarnBxwpZTXRypIX1EtbrU3tu9aNeZJ7R5wqLaoAxjnARybSWNzhgHTyZQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(82310400003)(921005)(4326008)(83380400001)(47076005)(36860700001)(107886003)(2906002)(8676002)(7416002)(82740400003)(6266002)(36756003)(478600001)(54906003)(316002)(70206006)(26005)(2616005)(336012)(70586007)(42186006)(426003)(36906005)(5660300002)(356005)(7636003)(110136005)(186003)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:15.5771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 754fa72c-667e-48ac-4934-08d8ce64e208
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4523
Received-SPF: pass client-ip=40.107.93.86; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

switch operation in eMMC card updates the ext_csd register to
request changes in card operations. Here we implement similar
sequence but requests are mostly dummy and make no change.

Implement SWITCH_ERROR if the write operation extends goes beyond length
of ext_csd.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 69289e0..7925174 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -519,6 +519,7 @@ static void sd_set_rca(SDState *sd, uint16_t value)
 FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
 FIELD(CSR, APP_CMD,                     5,  1)
 FIELD(CSR, FX_EVENT,                    6,  1)
+FIELD(CSR, SWITCH_ERROR,                7,  1)
 FIELD(CSR, READY_FOR_DATA,              8,  1)
 FIELD(CSR, CURRENT_STATE,               9,  4)
 FIELD(CSR, ERASE_RESET,                13,  1)
@@ -878,6 +879,43 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
     return ret;
 }
 
+enum {
+    MMC_CMD6_ACCESS_COMMAND_SET = 0,
+    MMC_CMD6_ACCESS_SET_BITS,
+    MMC_CMD6_ACCESS_CLEAR_BITS,
+    MMC_CMD6_ACCESS_WRITE_BYTE,
+};
+
+static void mmc_function_switch(SDState *sd, uint32_t arg)
+{
+    uint32_t access = extract32(arg, 24, 2);
+    uint32_t index = extract32(arg, 16, 8);
+    uint32_t value = extract32(arg, 8, 8);
+    uint8_t b = sd->ext_csd[index];
+
+    switch (access) {
+    case MMC_CMD6_ACCESS_COMMAND_SET:
+        qemu_log_mask(LOG_UNIMP, "MMC Command set switching not supported\n");
+        return;
+    case MMC_CMD6_ACCESS_SET_BITS:
+        b |= value;
+        break;
+    case MMC_CMD6_ACCESS_CLEAR_BITS:
+        b &= ~value;
+        break;
+    case MMC_CMD6_ACCESS_WRITE_BYTE:
+        b = value;
+        break;
+    }
+
+    if (index >= 192) {
+        sd->card_status |= R_CSR_SWITCH_ERROR_MASK;
+        return;
+    }
+
+    sd->ext_csd[index] = b;
+}
+
 static void sd_function_switch(SDState *sd, uint32_t arg)
 {
     int i, mode, new_func;
@@ -1097,12 +1135,18 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 6:	/* CMD6:   SWITCH_FUNCTION */
         switch (sd->mode) {
         case sd_data_transfer_mode:
-            sd_function_switch(sd, req.arg);
-            sd->state = sd_sendingdata_state;
-            sd->data_start = 0;
-            sd->data_offset = 0;
-            return sd_r1;
-
+            if (sd->emmc) {
+                sd->state = sd_programming_state;
+                mmc_function_switch(sd, req.arg);
+                sd->state = sd_transfer_state;
+                return sd_r1b;
+            } else {
+                sd_function_switch(sd, req.arg);
+                sd->state = sd_sendingdata_state;
+                sd->data_start = 0;
+                sd->data_offset = 0;
+                return sd_r1;
+            }
         default:
             break;
         }
-- 
2.7.4


