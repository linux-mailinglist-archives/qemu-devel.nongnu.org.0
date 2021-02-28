Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B26327429
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:34:57 +0100 (CET)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRqB-0005vQ-SO
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl9-00009Z-Cd; Sun, 28 Feb 2021 14:29:43 -0500
Received: from mail-bn8nam12on2074.outbound.protection.outlook.com
 ([40.107.237.74]:12928 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRky-0003Aq-3M; Sun, 28 Feb 2021 14:29:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmIb5RedANLZ6jeD8toT/NqlXlnZNwWzvjb5BqjaM77u21Qcl8ZeC/vkdJTaGX+tak3t2xLqOpyQkQMd39yM5Lfe0xXuM3cPYqPlRHNR8QMHrBIt1160/0GiD3JDR+PMT2hqyCeqCseKEhOd8YZfT5vlyN9qRJU4ggVtmwOY1sXbdjd63WHGvvR7+j31mSv0PCPy1PfMFXzTvwqN1AvzgL7N/NbfzUHCWANArX1kRiwbze7iVaCSycqpEkfq1oVJfMcKjo4BUemhm3tpBCgnt2xg48Ywuj3cdWROMKyX9AP/VJPO23Yjw3GlgktQ63YXAai8uq13xmRnLvo9rEdXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRUVfeGhlAifpE3RRsN8dffnGuj2I0re8LcDWEDB0LA=;
 b=hyV6VP7DfQ/Lh6emvtEHI2n19qi093SaPfaR+ZquUS/k7I9A5ING9/FMeRK9Gk4V4OQlLc6vpBXeBKKuN+cO/b33JnDHZNhBqMFSvZMK9TzPBKUVAf58cHNHjbDOeUto4x9jeWyrtwHfDSVo7Z0QysM6wPvRIj50J1atOXDXDXqpVwXGdrzZE+5IxhZK3KmS5v7oZcAygk3Khy25utwCVEUcfGCGRUmb7XMMgQkL4HRqh8Reol9dglNMs8W8thD+W43RuJTa6/eLZ4+DVcEHADhA5Aouk53JvSRtEXOYt1hQfDrMs8w5h6Un7WhMgtWyjepxuvavQJ4S+K01Q6n16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRUVfeGhlAifpE3RRsN8dffnGuj2I0re8LcDWEDB0LA=;
 b=VvmeiEo8LBr6TOyZHQ5VeHQFJPzAGyBiw6faqgusuiQEf7rbo6mL/voNm/h0IXVCQcRRni6U631vaBjT+Ca7zd1/g1URoa7+8LK+evNTQ6K1/zhDBN37ggn16eAInRvEs5BLxwQMfxRLo18G/jRuROFid8XcFZ3elSUaSJiMZzY=
Received: from CY4PR13CA0077.namprd13.prod.outlook.com (2603:10b6:903:152::15)
 by BYAPR02MB4838.namprd02.prod.outlook.com (2603:10b6:a03:48::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:24 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:152:cafe::6c) by CY4PR13CA0077.outlook.office365.com
 (2603:10b6:903:152::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:23 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57778 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0003MP-GA; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 9A83113C0AA0; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 11/21] sd: emmc: Add mmc switch function support
Date: Mon, 1 Mar 2021 01:03:17 +0530
Message-ID: <1614540807-30686-12-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab75258-3deb-4b68-29eb-08d8dc1f277b
X-MS-TrafficTypeDiagnostic: BYAPR02MB4838:
X-Microsoft-Antispam-PRVS: <BYAPR02MB48387173164DC30B5673A238CA9B9@BYAPR02MB4838.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdRlUEaf5iQjKrCKlV3hNTd+8/GA5Uko804QOYbOsQjNMEfLTYbEw51PUvuOsiHZ5xmdhpp0LjbBrQhEfWMCP39u/xOEF/CzBFShViwKMjH+OocmGOedUloVnGbgLGa/0VYr2fy7p7DoHD9N7mPmqqqTqDIBobW4kF8dgmSv1W9ug+GwcosbpZKOyNxXcH40m2zTD7//0RuHPV8rcSORjf0c/IAh3xCEzadsAdadqDA0F4RWWgwxvlM/zh76oxle/4WBoXtwioZbS8CtCZoNrui7fy2TNTwAD0GrQiuSQzPPHiNGZ8ll+y7cIpexIRKCw/fE2nyxs9omqeIg6X+sYLrgRIdOU535Hkd3XUmRSPqCoITw/VkQ4llyY5vQxVCHcGQKWBiaRIWFB9a1/DjSioXZUs3JYxCVmf48kbydxE5BzJWtKTuV1L4SDB5DKLJKFyK9D5P0BVQz4MkC62Q9Fml/85ccLnOP/9XAoOih2i3OHKSR6NzOu5RZqTXzbWJAFmEr5BrowKxMLD8hbYmRAyLFTqiR6qd5g1hdCvIWrhqVwgxG9nNSsmU2tWx7eQhNYdY1vZ68R9Cjb8dFEviOwbbF+AuLGQAm/OXAp+03HEuy1VHc0GD7xLhY7j2ImLF7ygmQv0WHgjbDqK6T/QAkBXoKTFql6g8bh4VkdfgsVRXsZk4H53vMSKAlem/K7SXb7LSW0a9xZYZPq+v7JVNarQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(36840700001)(46966006)(2616005)(2906002)(70206006)(82740400003)(7416002)(7636003)(8936002)(8676002)(5660300002)(47076005)(921005)(70586007)(186003)(36860700001)(36906005)(110136005)(356005)(336012)(316002)(54906003)(26005)(82310400003)(6266002)(478600001)(6666004)(36756003)(4326008)(42186006)(426003)(83380400001)(107886003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:23.6785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab75258-3deb-4b68-29eb-08d8dc1f277b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4838
Received-SPF: pass client-ip=40.107.237.74; envelope-from=saipava@xilinx.com;
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
index 8a7d0de..bf963ec 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -523,6 +523,7 @@ static void sd_set_rca(SDState *sd, uint16_t value)
 FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
 FIELD(CSR, APP_CMD,                     5,  1)
 FIELD(CSR, FX_EVENT,                    6,  1)
+FIELD(CSR, SWITCH_ERROR,                7,  1)
 FIELD(CSR, READY_FOR_DATA,              8,  1)
 FIELD(CSR, CURRENT_STATE,               9,  4)
 FIELD(CSR, ERASE_RESET,                13,  1)
@@ -886,6 +887,43 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
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
@@ -1105,12 +1143,18 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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


