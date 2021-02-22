Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431493211FF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:28:18 +0100 (CET)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Zl-0001Hy-98
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OJ-0004t6-FW; Mon, 22 Feb 2021 03:16:27 -0500
Received: from mail-mw2nam10on2046.outbound.protection.outlook.com
 ([40.107.94.46]:17800 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OE-0001pG-V0; Mon, 22 Feb 2021 03:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNpobVs8XdPoBVrc5Nm2MXJh8ii6DNV9Vl2mOtvMUo20qbAAb++LaOqvL1wdI0bS7VuyiS7xK7oR60qia4/0tXsBF+Wn7Lrp8ij2trsnkC6opgVApZemLoBgyZMW8MtANjFd4sLLUyeujs/nUmBSk2CgJNCmyK8D9ZJTKw86Ki06/Wgg4ivxH9NMlEaozo7VcTzotWVmlmjZkMO8bf2/XU6Kv2czh4vNk+O0DsiGXqLXT5PVDrZuI8fZGj1lr0oNayaPdfBr3G6BK1kUlQ+wjCKxUNy+gM9gTHWruDA1ym6orhdcJHnN+yR1dcc97Cb3snJb/j9oa7akCYqx8+QgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcDK66wp68Ls/9OPpGyStT159w+JN+cBUrxZemeqkpU=;
 b=LtP13jcS69IIg/yeokbvsrnI3cRw5vnym/t74lRagW5yKbuAT9EIy21jp1XRqpjWlB2Pmi56bS8t8CQiJVAUlYTgDcfU7HKzhaTZUI3Wa/2z3tLXkOz6WXEBDfcOYf/vyDXfBmaloKR0IGXdoSnyIQBkKlE3KDYDFtqZYa4Z7u3stJNdEng21qnSulfFFCL/FzXbBI7zU3rY/CqSul/ds7ZCsofpp/hm+9ZglkIBpWfzpxKg9eN/t3csFPC/rmnB2lsxzK8rwobjmTbCMdqFK4OSTftn/Khfq7yg54OEKXyo5GmOTr9cCfMIXuFvQiT/sDdLH3S6/F9nsLhwhDjukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcDK66wp68Ls/9OPpGyStT159w+JN+cBUrxZemeqkpU=;
 b=thhupB2WxL+qjN+Nmwp9ZZKn90LSO49hIBGa4TxMtaCPXjQX5GOtfad7YLStVVLMzxEGTqKCrW8cQMNTtkfylL3QxNnT4TYuxQ998anfRCOpxQJicwXTZDfhO8smQcPeO6lXamyvE87ts9TaAr3doAUPX4XULD+PrfkIY6LWe+c=
Received: from DM3PR14CA0131.namprd14.prod.outlook.com (2603:10b6:0:53::15) by
 DM6PR02MB5658.namprd02.prod.outlook.com (2603:10b6:5:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31; Mon, 22 Feb 2021 08:16:18 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::2f) by DM3PR14CA0131.outlook.office365.com
 (2603:10b6:0:53::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59034 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-00036y-TO; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id C106413C09AA; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 05/22] sd: emmc: Add support for EXT_CSD & CSD for eMMC
Date: Mon, 22 Feb 2021 13:50:22 +0530
Message-ID: <1613982039-13861-6-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc385592-a3aa-4a98-4267-08d8d70a2192
X-MS-TrafficTypeDiagnostic: DM6PR02MB5658:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5658ACDDF7D151201C79DC2DCA819@DM6PR02MB5658.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: apK87TURba01JjSkI+FTdW8YBHfscwqLBMR0cdeZkLGuEXOy0Gt3GhfPfbF0zUAHa/kgWToPIMNafkX3hEkyoaPzmyhGinZroBfGj4Zv2uzyDPC6C/dLOvpF3wLR8/PlHIu5OhhX0ZQYa262w9LPvI7tEvUmoWPgxTqzDBgIay//1WVcSL2wvz2LvHlN8bxTKTrukraUQWBnqQp4axO27B5D1eLQv1U7wh4zXMoIYk1Tv838D269bHufCSLX6ovlmuuDl1bsZ98hiqRRAOymvdA6gwZXcBOTieIyh2rfrfm6RZgPISWcrYMxrqasBHuIUXLlDkoxg3wapqB5CES58ZVIH6kHG5wmz9ElgmI/c/4BTAdBbPiUWH6Jt1pCXTwTqa20kBMdB/zC7/SN7jU+TPZxYVWhwWRabW5puuSMzk+ZxiAJY8pC2TwGz6tpxB+x2C7ZKUL4n2KTLiv9/4by4E/j4ZE5xORujDxl0TeblNTwqyPgf2XcvwSkWFBPDUrDlbfzXx4yDwdG2PcCzdfUjWUf5OAMN9SNjklyc+WWtnbvwoe5APX1Q7RAexC3ZiQg1hCS0MqjCwiyms6czy/kUqWT+O3UHFrls7rdaQhc//0EGA3REY82vBeZOChFoVCMyy7hCizf5+W36LheRiyFW1RjWplgN1grH+NolbV4tGR2ExoNKqVax18hiB1x7JQ8tD2O9g8KAcZBVA5FNw0SFg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966006)(36840700001)(921005)(83380400001)(478600001)(7416002)(70586007)(6666004)(4326008)(36756003)(8936002)(82740400003)(336012)(2616005)(356005)(316002)(7636003)(70206006)(426003)(5660300002)(54906003)(36860700001)(36906005)(42186006)(26005)(107886003)(6266002)(82310400003)(2906002)(47076005)(186003)(8676002)(110136005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:18.5173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc385592-a3aa-4a98-4267-08d8d70a2192
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5658
Received-SPF: pass client-ip=40.107.94.46; envelope-from=saipava@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

eMMC CSD is similar to SD with an option to refer EXT_CSD for larger
devices.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 430bea5..4c211ba 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -135,6 +135,7 @@ struct SDState {
     uint64_t data_start;
     uint32_t data_offset;
     uint8_t data[512];
+    uint8_t ext_csd[512];
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
@@ -389,6 +390,51 @@ static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
 };
 
+static void mmc_set_ext_csd(SDState *sd, uint64_t size)
+{
+    uint32_t sectcount = size >> HWBLOCK_SHIFT;
+
+    memset(sd->ext_csd, 0, sizeof(sd->ext_csd));
+    sd->ext_csd[504] = 0x1; /* supported command sets */
+    sd->ext_csd[503] = 0x1; /* HPI features  */
+    sd->ext_csd[502] = 0x1; /* Background operations support */
+    sd->ext_csd[241] = 0xA; /* 1st initialization time after partitioning */
+    sd->ext_csd[232] = 0x1; /* Trim multiplier */
+    sd->ext_csd[231] = 0x15; /* Secure feature support */
+    sd->ext_csd[230] = 0x96; /* Secure erase support */
+    sd->ext_csd[229] = 0x96; /* Secure TRIM multiplier */
+    sd->ext_csd[228] = 0x7; /* Boot information */
+    sd->ext_csd[226] = 0x8; /* Boot partition size */
+    sd->ext_csd[225] = 0x6; /* Access size */
+    sd->ext_csd[224] = 0x4; /* HC Erase unit size */
+    sd->ext_csd[223] = 0x1; /* HC erase timeout */
+    sd->ext_csd[222] = 0x1; /* Reliable write sector count */
+    sd->ext_csd[221] = 0x4; /* HC write protect group size */
+    sd->ext_csd[220] = 0x8; /* Sleep current VCC  */
+    sd->ext_csd[219] = 0x7; /* Sleep current VCCQ */
+    sd->ext_csd[217] = 0x11; /* Sleep/Awake timeout */
+    sd->ext_csd[215] = (sectcount >> 24) & 0xff; /* Sector count */
+    sd->ext_csd[214] = (sectcount >> 16) & 0xff; /* ... */
+    sd->ext_csd[213] = (sectcount >> 8) & 0xff;  /* ... */
+    sd->ext_csd[212] = (sectcount & 0xff);       /* ... */
+    sd->ext_csd[210] = 0xa; /* Min write perf for 8bit@52Mhz */
+    sd->ext_csd[209] = 0xa; /* Min read perf for 8bit@52Mhz  */
+    sd->ext_csd[208] = 0xa; /* Min write perf for 4bit@52Mhz */
+    sd->ext_csd[207] = 0xa; /* Min read perf for 4bit@52Mhz */
+    sd->ext_csd[206] = 0xa; /* Min write perf for 4bit@26Mhz */
+    sd->ext_csd[205] = 0xa; /* Min read perf for 4bit@26Mhz */
+    sd->ext_csd[199] = 0x1; /* Partition switching timing */
+    sd->ext_csd[198] = 0x1; /* Out-of-interrupt busy timing */
+    sd->ext_csd[196] = 0xFF; /* Card type */
+    sd->ext_csd[194] = 0x2; /* CSD Structure version */
+    sd->ext_csd[192] = 0x5; /* Extended CSD revision */
+    sd->ext_csd[168] = 0x1; /* RPMB size */
+    sd->ext_csd[160] = 0x3; /* Partinioning support */
+    sd->ext_csd[159] = 0x00; /* Max enhanced area size */
+    sd->ext_csd[158] = 0x00; /* ... */
+    sd->ext_csd[157] = 0xEC; /* ... */
+}
+
 static void sd_set_csd(SDState *sd, uint64_t size)
 {
     int hwblock_shift = HWBLOCK_SHIFT;
@@ -402,8 +448,11 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     }
     csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
 
-    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
-        sd->csd[0] = 0x00;  /* CSD structure */
+    if (size <= SDSC_MAX_CAPACITY || sd->emmc) { /* Standard Capacity SD */
+        if (sd->emmc && size >= SDSC_MAX_CAPACITY) {
+            csize = 0xfff;
+        }
+        sd->csd[0] = sd->emmc ? 0xd0 : 0x00;  /* CSD structure */
         sd->csd[1] = 0x26;  /* Data read access-time-1 */
         sd->csd[2] = 0x00;  /* Data read access-time-2 */
         sd->csd[3] = 0x32;      /* Max. data transfer rate: 25 MHz */
@@ -447,6 +496,10 @@ static void sd_set_csd(SDState *sd, uint64_t size)
         sd->csd[14] = 0x00;
     }
     sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
+
+    if (sd->emmc) {
+        mmc_set_ext_csd(sd, size);
+    }
 }
 
 static void sd_set_rca(SDState *sd, uint16_t value)
-- 
2.7.4


