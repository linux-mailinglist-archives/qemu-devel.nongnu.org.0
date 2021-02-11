Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168F318639
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:19:27 +0100 (CET)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7CA-00006S-Fa
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75t-0002iD-Bp; Thu, 11 Feb 2021 03:12:57 -0500
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com
 ([40.107.93.49]:23521 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75r-0004XW-2U; Thu, 11 Feb 2021 03:12:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9EtxWLsQMyEa81zNPVRFSAsdfBKEwm5fnVxLAp21JXuOuGSNgXNpDEyXjHOudM7+xiZSFGuO2j+bTDbXx/YMAi/i2+YuBHYVAalu2/Dj2m73Rus54gmPs8E2FPLjujL2V2MBhUC0l31q09ucrfbPtHLqgLSfeRaCENMvm0V4d++nwkEJal5baYAZannHaaSC8lRfmKOBdqQ86gcztvEbBYuqgAQAa4RNyy1ip0XhYtoU+zu99SCNrHrLEgH+UR+0cn8QDMcZDSRPWrcNhr+mCPGgxlIIvLdkx99YKtuFksnj9eeNzinVXuj07j2iCOHUnjMafq/QiSSVlOTiPL80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7/cQ5x+ps4bkVyR+oGubwEAe6PptOehwO18lju7sZA=;
 b=MCTabZeZ2slFPAOlvLGf2dQNgLzrVabs4tglaU8dF9gCu78VJKvrG+vK56zho4rxyac2Uh3oxDEGQknP/ngpB4AejusUdMvMQfZmIHT+COKVSukGhhAX2JUjRagk2nqqMtvBO/12T22lNOvU7vFgQGs3x8QNVnI6R4ShvnvZ1yMjBLJ/nKTObDBujEvN0fYDwLupkmzEwPzY8rE3Z6Xy4OBichNNlDz/nPiJyebYGNbbwz3Am0kZa5VlbbQMPpWX519vlg1o3GuJlvpMxIk4fSxa6X+CAu6aBx1OCB7sBw38jhzxdcj1fjee87E3LpgrT5qaFcKgmCuVTYxZA8oKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7/cQ5x+ps4bkVyR+oGubwEAe6PptOehwO18lju7sZA=;
 b=CzI4DTQvlRyaxg2mXXL/4hgYIYxYe9jGa+Oj/xPcjUoVDkcZCPx7ol2WtxVQ8jyPyjb1I3wV4tYN/NjVRFBq6BjyZuLxaTfATpvE+PHQjwThqYxkpXwZF+NbRoj1F80pmEHQfoCB7lmoJ2uFkIXTuCJy9HucAQpst/0IGGnButs=
Received: from MN2PR15CA0026.namprd15.prod.outlook.com (2603:10b6:208:1b4::39)
 by DM6PR02MB6666.namprd02.prod.outlook.com (2603:10b6:5:215::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 08:12:52 +0000
Received: from BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1b4:cafe::4b) by MN2PR15CA0026.outlook.office365.com
 (2603:10b6:208:1b4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT063.mail.protection.outlook.com (10.152.77.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:51 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:48 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:48 -0800
Received: from [10.140.6.35] (port=49670 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75j-0000QA-Fw; Thu, 11 Feb 2021 00:12:48 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 0B56F13C0653; Thu, 11 Feb 2021 13:48:10 +0530 (IST)
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
Subject: [RFC PATCH 02/15] sd: add eMMC support
Date: Thu, 11 Feb 2021 13:47:13 +0530
Message-ID: <1613031446-22154-3-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97cbde26-b25d-4321-dada-08d8ce64d3e4
X-MS-TrafficTypeDiagnostic: DM6PR02MB6666:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6666052D3F0C63BAD490D340CA8C9@DM6PR02MB6666.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZefAbYwfOjbWt/T39xhOySiaw7XSpkOVhwxrGV9WMOTRlHKwPWH+DGKdmtgAsjr52hGQKv61cPq7ExVY/lF8eMFEK68McV1yb7RLit27NLK9HUry+xKZxeDd/ksyuHmcVqv0g7fSGR3STbYllJRghrIWdF8TfIRNPonlnuhJevf86mfIMrrl5EJxGTZ2YHcj9QPOLqOtiMSqbYySwUZ2QP9r9pEhawT8otSpYUwNt6UHUWgqB0k5pQP0OVEcs2C8rnj4RJa5Epc6Va24ZSNyHMzNmRse2KQ2911PYUB5uDh6qE+n3WmbLjXExewii7UALPn9mKNDXd82oAjAtvrw3QlnQsg1x6nZ/Kc7W33XDQECzdt6XSJOOJcABD+DAA1cft1tR8f+b1rGRjklgrPocuos82ATafBCshzBnotuPqO94A67TY3AeW57HqmRoWwVD34jS6LTWC75tHTy8Vv+JOdxAiNaPYa2oNzNYXHO56SA+EB/h5PJyg2vlJUmhbHhWVbKz/0MFq+0aUiY+G2q/BrET+W8fBvtseCP4Cq5BHrfnAdw3XfZsp0VkSCovRib6IwDiG41RwEYxW5ejsGsAB3OkpTr86UzjqYNAVGjv+USn53dv6I1uvb8BUEBInjGDDNG6tcFzSaucpQJdytmtoxCNGK4tPmWOHralkXwSOgtx4aP+6fvvT/RqBN+OuJINMKoce03xpBrweH5tAa61M1U9elpXMyXalyvsIWhMA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(36840700001)(70586007)(70206006)(42186006)(316002)(5660300002)(36906005)(54906003)(8676002)(110136005)(4326008)(107886003)(2906002)(6266002)(7416002)(47076005)(66574015)(83380400001)(82740400003)(2616005)(921005)(478600001)(36756003)(8936002)(36860700001)(336012)(356005)(426003)(7636003)(82310400003)(26005)(186003)(102446001)(357404004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:51.8548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cbde26-b25d-4321-dada-08d8ce64d3e4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6666
Received-SPF: pass client-ip=40.107.93.49; envelope-from=saipava@xilinx.com;
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

From: Vincent Palatin <vpalatin@chromium.org>

The parameters mimick a real 4GB eMMC, but it can be set to various
sizes.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
[SPB: Rebased the patch over qemu 5.1,
      Mark eMMC to support all timing modes]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c             | 143 +++++++++++++++++++++++++++++++++++++++++--------
 hw/sd/sdmmc-internal.c |   2 +-
 2 files changed, 122 insertions(+), 23 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8517dbc..a75fa1c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -108,6 +108,7 @@ struct SDState {
     uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
+    bool emmc;
 
     /* Runtime changeables */
 
@@ -134,6 +135,7 @@ struct SDState {
     uint64_t data_start;
     uint32_t data_offset;
     uint8_t data[512];
+    uint8_t ext_csd[512];
     qemu_irq readonly_cb;
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
@@ -287,7 +289,8 @@ FIELD(OCR, CARD_POWER_UP,              31,  1)
                                | R_OCR_ACCEPT_SWITCH_1V8_MASK \
                                | R_OCR_UHS_II_CARD_MASK \
                                | R_OCR_CARD_CAPACITY_MASK \
-                               | R_OCR_CARD_POWER_UP_MASK)
+                               | R_OCR_CARD_POWER_UP_MASK \
+                               | R_OCR_DUAL_VOLTAGE_CARD_MASK)
 
 static void sd_set_ocr(SDState *sd)
 {
@@ -371,6 +374,51 @@ static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
 };
 
+static void mmc_set_ext_csd(SDState *sd, uint64_t size)
+{
+    uint32_t sectcount = size >> HWBLOCK_SHIFT;
+
+    memset(sd->ext_csd, 0, 512);
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
@@ -384,7 +432,34 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     }
     csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
 
-    if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
+    if (sd->emmc) { /* eMMC */
+        sd->csd[0] = 0xd0;
+        sd->csd[1] = 0x0f;
+        sd->csd[2] = 0x00;
+        sd->csd[3] = 0x32;
+        sd->csd[4] = 0x0f;
+        if (size <= 0x80000000ULL) {
+            /* use 1k blocks */
+            uint32_t csize1k = (size >> (CMULT_SHIFT + 10)) - 1;
+            sd->csd[5] = 0x5a;
+            sd->csd[6] = 0x80 | ((csize1k >> 10) & 0xf);
+            sd->csd[7] = (csize1k >> 2) & 0xff;
+        } else { /* >= 2GB : size stored in ext CSD, block addressing */
+            sd->csd[5] = 0x59;
+            sd->csd[6] = 0x8f;
+            sd->csd[7] = 0xff;
+            sd->ocr |= 1 << 30;
+        }
+        sd->csd[8] = 0xff;
+        sd->csd[9] = 0xff;
+        sd->csd[10] = 0xf7;
+        sd->csd[11] = 0xfe;
+        sd->csd[12] = 0x49;
+        sd->csd[13] = 0x10;
+        sd->csd[14] = 0x00;
+        sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
+        mmc_set_ext_csd(sd, size);
+    } else if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
         sd->csd[0] = 0x00;	/* CSD structure */
         sd->csd[1] = 0x26;	/* Data read access-time-1 */
         sd->csd[2] = 0x00;	/* Data read access-time-2 */
@@ -431,9 +506,13 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
 }
 
-static void sd_set_rca(SDState *sd)
+static void sd_set_rca(SDState *sd, uint16_t value)
 {
-    sd->rca += 0x4567;
+    if (sd->emmc) {
+        sd->rca = value;
+    } else {
+        sd->rca += 0x4567;
+    }
 }
 
 FIELD(CSR, AKE_SEQ_ERROR,               3,  1)
@@ -979,8 +1058,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         case sd_identification_state:
         case sd_standby_state:
             sd->state = sd_standby_state;
-            sd_set_rca(sd);
-            return sd_r6;
+            sd_set_rca(sd, req.arg >> 16);
+            return sd->emmc ? sd_r1 : sd_r6;
 
         default:
             break;
@@ -1054,24 +1133,37 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 8:	/* CMD8:   SEND_IF_COND */
-        if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
-            break;
-        }
-        if (sd->state != sd_idle_state) {
-            break;
-        }
-        sd->vhs = 0;
-
-        /* No response if not exactly one VHS bit is set.  */
-        if (!(req.arg >> 8) || (req.arg >> (ctz32(req.arg & ~0xff) + 1))) {
-            return sd->spi ? sd_r7 : sd_r0;
-        }
+    case 8:    /* CMD8:   SEND_IF_COND / SEND_EXT_CSD */
+        if (sd->emmc) {
+            switch (sd->state) {
+            case sd_transfer_state:
+                /* MMC : Sends the EXT_CSD register as a Block of data */
+                sd->state = sd_sendingdata_state;
+                memcpy(sd->data, sd->ext_csd, 512);
+                sd->data_start = addr;
+                sd->data_offset = 0;
+                return sd_r1;
+            default:
+                break;
+            }
+        } else {
+            if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
+                break;
+            }
+            if (sd->state != sd_idle_state) {
+                break;
+            }
+            sd->vhs = 0;
 
-        /* Accept.  */
-        sd->vhs = req.arg;
-        return sd_r7;
+            /* No response if not exactly one VHS bit is set.  */
+            if (!(req.arg >> 8) || (req.arg >> (ctz32(req.arg & ~0xff) + 1))) {
+                return sd->spi ? sd_r7 : sd_r0;
+            }
 
+            /* Accept.  */
+            sd->vhs = req.arg;
+            return sd_r7;
+        }
     case 9:	/* CMD9:   SEND_CSD */
         switch (sd->state) {
         case sd_standby_state:
@@ -1993,7 +2085,13 @@ uint8_t sd_read_byte(SDState *sd)
         if (sd->data_offset >= 64)
             sd->state = sd_transfer_state;
         break;
+    case 8:     /* CMD8: SEND_EXT_CSD on MMC */
+        ret = sd->data[sd->data_offset++];
 
+        if (sd->data_offset >= 512) {
+            sd->state = sd_transfer_state;
+        }
+        break;
     case 9:	/* CMD9:   SEND_CSD */
     case 10:	/* CMD10:  SEND_CID */
         ret = sd->data[sd->data_offset ++];
@@ -2176,6 +2274,7 @@ static Property sd_properties[] = {
      * board to ensure that ssi transfers only occur when the chip select
      * is asserted.  */
     DEFINE_PROP_BOOL("spi", SDState, spi, false),
+    DEFINE_PROP_BOOL("emmc", SDState, emmc, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/hw/sd/sdmmc-internal.c b/hw/sd/sdmmc-internal.c
index 2053def..8648a78 100644
--- a/hw/sd/sdmmc-internal.c
+++ b/hw/sd/sdmmc-internal.c
@@ -14,7 +14,7 @@
 const char *sd_cmd_name(uint8_t cmd)
 {
     static const char *cmd_abbrev[SDMMC_CMD_MAX] = {
-         [0]    = "GO_IDLE_STATE",
+         [0]    = "GO_IDLE_STATE",           [1]    = "SEND_OP_CMD",
          [2]    = "ALL_SEND_CID",            [3]    = "SEND_RELATIVE_ADDR",
          [4]    = "SET_DSR",                 [5]    = "IO_SEND_OP_COND",
          [6]    = "SWITCH_FUNC",             [7]    = "SELECT/DESELECT_CARD",
-- 
2.7.4


