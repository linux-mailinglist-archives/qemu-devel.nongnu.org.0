Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6D3211F9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:27:18 +0100 (CET)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Yn-0000MK-UT
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OG-0004lg-Ix; Mon, 22 Feb 2021 03:16:24 -0500
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com
 ([40.107.236.46]:17377 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OD-0001ot-B2; Mon, 22 Feb 2021 03:16:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOGiwTNz1hGDjIT3Q9FZqBDYeP1JNQlyaz+3mBS94VaBrJSbGD/ljnmJ7KIOKAe422Wms/Yo5PyIoOWIzykj0R9ockP5dJA3XeB0MKJDIvdY9Qi6Q3sxZ+gfVmz2HEJqKFadNvHuQQJOKB1HWIZt3Qx6WIzD3qZOZdM8yTK+L5pUR2St5XJtikDhc6haQOF/fmePp14bNU0VhChOSYVEEdqqQ5Tyl6RUFa5KxGp35Du6NoG7dx7ByoPilW2XEQrq9AliQhW4HqqOw1gkIvZFStHDikGW/bT6fNGHaeBM7Z5wP4NLWvzLcwMyDE7D56nBTKkmwD6ERhTLQh33uhP6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdcxjJOnUS44mzIzeRMKZBaeJI+cGAne7OCsEsnZDKE=;
 b=VPkgMzCJsVu8/gaT2C/ihpltlRuy4+hzqGphWkR68goVkpxUno83HUAyxWgP04ckgdR9AiZOuYrE6Rx9VIMWMRr7GTUTcw1ycv3kNt9Ls/vFLXSqItum7wArh2pJT7JKb82zvCZzWIeZZ7Cd0iAPLenjxv/chk+L75Anp2jvl6MOv+vD5ekon/H6HdsnYfLu/R5OVEJ7lLh26SO3JvCqxGPInHPNMYt+Byp1hwRLk4GoYOKNs0ErbyUsxYmNAEwoNWTN+WgSspz/udUesL/CnA9kCw/6ivLMvCfmTUutTMNwmQFNVF4HJk4JmGxmigOeOF0CArfsCZQiAFocg0MH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdcxjJOnUS44mzIzeRMKZBaeJI+cGAne7OCsEsnZDKE=;
 b=LhNLrc8K9TPDWtBz+EU6BJZL7luueH+wVJJM0ufU1HSwsGPpqYC+twUBUaFfl2+XoKRfDm4kzz8A8fyRZ+kjdAIUR+FHQveM22JZWPQ+VBNEsozYYzV/RHx0ZYfau5hLMxwTEn+sXCcVq1/tlAAFFxBpOP7BB8+sNOZeBLKeGWc=
Received: from CY4PR18CA0068.namprd18.prod.outlook.com (2603:10b6:903:13f::30)
 by BYAPR02MB4167.namprd02.prod.outlook.com (2603:10b6:a02:fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:18 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::13) by CY4PR18CA0068.outlook.office365.com
 (2603:10b6:903:13f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:18 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59046 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-000372-WA; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id F283C13C0A9D; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 11/22] sd: emmc: Add mmc switch function support
Date: Mon, 22 Feb 2021 13:50:28 +0530
Message-ID: <1613982039-13861-12-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d59440bf-2869-4611-f276-08d8d70a216c
X-MS-TrafficTypeDiagnostic: BYAPR02MB4167:
X-Microsoft-Antispam-PRVS: <BYAPR02MB416751AAC6CB9F2B8733CC17CA819@BYAPR02MB4167.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RABzgN3dmQNamS3/PKxGoROsVf7KavYoIkhYDrUxxf94v8gTlPDGy9MwcE7CoI8BVsP+arrqjL+M2mwYWTkTryPX9BT6+bCycuZh4Naf38PypO6m+8A7QxE09ylBbd4aNzCP9cDm0hZx0qTaJZqY1OBfUrX2Qj/ouc4ljJM9VwOoXMUoSGt8uH8bvYtV38vGxfsmatExbFOeMAalhKWFeZ6yQlQ9wqfDSfcPhZrRRPO0yZbwYWEgDG18umUh7rQ8jZeUfx1HoZBHMuc2wDsZO9qszryIZ+IiRJoPY2I2b5Qid923dGnYqJeRJ97xjYo+IlGXJnfjTuvGtUCI9SEo0oByd22168Dqx+rP7e1zAbcxVcXly2ls1xLFWycVNrEPj3ALs4vpU38WnuNQd0gRlnjc0U6USdPKgX3MT6HpU8y8pAnPCfxAW1JHw3bVIG5WCPX+qP0J80wFcbXqoNTZN7ISoTJQcYBpYeDDyuazsLDHtY52J2jovoYYlj1cVn91tbJWFuy+GrpcGZiy6sT11i/bZ82f+99v+I8mmGlL36dsDFTM90tuNKXoZvL/kY4ux4vF1A3LffqFroGbPd8b9d8hbBpQck4MgkneW2G4VwPYJ6KcGPbtjuF5tgwgZGJpYQ2pAm6ls6UVjqGbBhsxBWTKfpe5IypGOsjcwqyFG/GIz51l4RR0Kh10QTUl02Y+0w2zT3gtUn9mkONFMJ8e0g==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(136003)(376002)(396003)(36840700001)(46966006)(70206006)(36860700001)(336012)(921005)(8936002)(36756003)(356005)(2906002)(5660300002)(82740400003)(107886003)(70586007)(42186006)(8676002)(4326008)(36906005)(110136005)(316002)(6266002)(82310400003)(7416002)(426003)(186003)(2616005)(6666004)(54906003)(7636003)(26005)(83380400001)(478600001)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:18.2728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59440bf-2869-4611-f276-08d8d70a216c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4167
Received-SPF: pass client-ip=40.107.236.46; envelope-from=saipava@xilinx.com;
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
index ae5c5e8..e50d40b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -515,6 +515,7 @@ static void sd_set_rca(SDState *sd, uint16_t value)
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
     case 6: /* CMD6:   SWITCH_FUNCTION */
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


