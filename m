Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496253211E0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:21:09 +0100 (CET)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Sq-0001dL-A1
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:21:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O6-0004Yd-U2; Mon, 22 Feb 2021 03:16:15 -0500
Received: from mail-dm6nam10on2047.outbound.protection.outlook.com
 ([40.107.93.47]:48609 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O3-0001jY-GH; Mon, 22 Feb 2021 03:16:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RevB8xkuxUD2erhp7Ea7Jz+RV214zMKUGW19YECmvxxCZl7RnEMqfi/2KKpUA4xbbYdi8PJ77kPH3OHKY40PdIG858D4+8dCo5XpZuAz9Ak2aaa/GqdlypQOLDDh46lR0TJamh30GqoTND2HLMFlZvTEi2v5z/U8d3LK3v+oIWG3HsRoukAX71hTlNWqtMu7RhcStvVPz29t6XCvA0xdBsK+AxeQF/ikGw+/YJ2YSx2gaidzhm4ajWtk8f54u0JY8S/1dpYxCspt/4SaGB17s74d51tC72V9b0Kc5yb+N859aY9e+SgUV9kh/Q4SkArbiWj0ksdTVv0jzEixwa/fjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0+mhnlPyjB8La6iTFLxmLFtXlw0HL5IleRPvLVvicQ=;
 b=Fb9MB11k7HUe/Z9duS5yD7pxzpTAaaeMQlLEy5FBck+5vApf+UXjSDVPYAoUt0+QXWPWJhWXEtiz59Rx4tLMMDdFrdomNO93Wx0VNOj5ITFkFHRQPkmeknOiSuuUAf3nTj/UBnowdycmyyEBeF+ZoDoPieUoY564gfQ0Sq4szB4OftofxUJabUAi2URooS6VDkmgsILVnmPzs4xzUmTbgC/mSPNnFNreHHfGOPXMGriZ3gPcTWwAmvN51jXo7ZwlvG15Y/JUzbeQAUf1YH/6jHjXvFqYyCmMmQGjdMTPeiZT2Xc4PtMgT05RSif/IGpDu/9OxFgZdv6kEIbu+7Y28g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0+mhnlPyjB8La6iTFLxmLFtXlw0HL5IleRPvLVvicQ=;
 b=kW8JwpW8Hmd7zI+oBfPjd15wfL7mghPpKvL2n5UJQYluXi1KtcPF0k307fKCYDr/pN/aL0i8Cb6W4e2qOdF1G64kLKVLyAkLGs3kzQR7NOk7Yy+1MdZDY3WPrORsy9P8L0qYlwCGV5zAuStHGaMqQiSe9MfZokrXvyjY7HbH62Q=
Received: from SN4PR0501CA0075.namprd05.prod.outlook.com
 (2603:10b6:803:22::13) by DM6PR02MB6331.namprd02.prod.outlook.com
 (2603:10b6:5:1fa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:08 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::f2) by SN4PR0501CA0075.outlook.office365.com
 (2603:10b6:803:22::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:08 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:15:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:15:59 -0800
Received: from [10.140.6.35] (port=59030 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nq-0004Lp-PU; Mon, 22 Feb 2021 00:15:59 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id B195213C07A2; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 03/22] sd: emmc: Add support for eMMC cards
Date: Mon, 22 Feb 2021 13:50:20 +0530
Message-ID: <1613982039-13861-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66c5a06a-febe-40cb-48d1-08d8d70a1bad
X-MS-TrafficTypeDiagnostic: DM6PR02MB6331:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6331B8B1847AC3CCD8857744CA819@DM6PR02MB6331.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYIM98YMICq7wHrBONjlWSq4sMuWuwn+SnET5PvTw1mcuy8LtEUSOiQ13VCdg97bCRQdW/Cqq0D4pw9O1Cr3ts7AqnCJtjJ73Lwk3fjjJSEcRGu1RDghWYKd5dTgMVYW8SF72lROggr/F06L2+To4LP8aqCIwI7cDXoYkc9OmN7sZ03CUT7ie97T7YgabPuD+ATR4CHbHWR38DcNTA0Q52nbhMnujeftTS2kRb5vaDmopRn3tbgbz29WDeKhXeEFEgXUAwIaWUcteKlX4wA+A5JHFgP7h0q4QvcIFsBJpJNHNRD0YRZru7Zsv8EpoeEfba7saEuEGDftxHist2Xz/2v4m0JjPNgiHpwNx1F/7dRLMDL2WhKKIwtor0KEqIBKJDJ5nQj9fb+0Fgf3y/SVZl3pMBqJ3C85mhNwfMLrzrmfSgGjAf8hBuvdf561OUdMkJAGAjjEcfDUUBcLIuvzRcUoH4DK+xvhgFPpeTBPxMzmHZLys8CRze1UYu91YHFzpgSd8Cwgo29Ee7p+lYbCUI83NWx6kY632DhSnlxly9b+H346dJ6unIIvI7VtUNM0p4xsFAFDRtMBCKnr4FaJidqNoB97ekXcpJ3ikH7UYUY2B8oqwrnyczz2EPf/rcOsjV/HqyCtitpTot8H1dDqu7n7fTSuFY6H+KFQ2sdOh9vmytVTuaANpxbeuk1nlG38hNFrORlk/gCBJ6gLjfuypg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(36840700001)(7636003)(2906002)(70206006)(36906005)(36756003)(110136005)(6666004)(70586007)(42186006)(54906003)(8676002)(82310400003)(107886003)(82740400003)(478600001)(356005)(8936002)(2616005)(83380400001)(26005)(426003)(186003)(316002)(6266002)(7416002)(47076005)(921005)(36860700001)(336012)(5660300002)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:08.6091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c5a06a-febe-40cb-48d1-08d8d70a1bad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6331
Received-SPF: pass client-ip=40.107.93.47; envelope-from=saipava@xilinx.com;
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

This patch adds support for eMMC cards, change SET_RELATIVE_ADDR
command to assign relative address as requested by user.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[spb: Split original patch series]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 74b9162..42ee49c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -108,6 +108,7 @@ struct SDState {
     uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
+    bool emmc;
 
     /* Runtime changeables */
 
@@ -431,9 +432,13 @@ static void sd_set_csd(SDState *sd, uint64_t size)
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
@@ -979,8 +984,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         case sd_identification_state:
         case sd_standby_state:
             sd->state = sd_standby_state;
-            sd_set_rca(sd);
-            return sd_r6;
+            sd_set_rca(sd, req.arg >> 16);
+            return sd->emmc ? sd_r1 : sd_r6;
 
         default:
             break;
@@ -2176,6 +2181,7 @@ static Property sd_properties[] = {
      * board to ensure that ssi transfers only occur when the chip select
      * is asserted.  */
     DEFINE_PROP_BOOL("spi", SDState, spi, false),
+    DEFINE_PROP_BOOL("emmc", SDState, emmc, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.7.4


