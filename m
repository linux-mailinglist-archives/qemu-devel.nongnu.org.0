Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9436318643
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:23:55 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7GU-0003mo-Pl
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76N-0002zC-7R; Thu, 11 Feb 2021 03:13:27 -0500
Received: from mail-dm6nam10on2068.outbound.protection.outlook.com
 ([40.107.93.68]:39904 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76G-0004fj-4q; Thu, 11 Feb 2021 03:13:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QauPFGgsY1hjHaA+fjL067mYt8SKT1aKvIncuSgvpNHSS4uoul0jDDNpEOAfe6xsdEx6rZTbEfMr8UejjyXA2vEf1SowMwwn6QPvG3xalSWBF824ngvlPoZLKdnktQ58P1MuTsSc176BqMBVrvSq6vZmXEj563GY6ba1o/WSV1JL0x/GGnnDgkHLO+BkMd1vWj6aM/CBVVjBObZ6RsfMa0eZqVwcvFyNZflVNO2r5RoPyRZtoTa29klV+uQeMYf2FRYMZ4Ftws1JMAmKYj/efqrtU+SdOC4ikNT0h1srhyqH8RNUxkzC3x8fsyI2kvqkKVx78Ga2DxUcFiqOtPfw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzN8vwLYNSmXs52aOhtqWWanGDIxUnCAfRCbyHwNLp0=;
 b=oagOTAuwTTNANT1YeKmFsassbw03c5t0CTi2umXdFBsQZji+PB5ta3FzXMAdq0kq4MjnHjGFrZ54LWv3hiOzBKsIxunU6n7Bm84jjLowOC0CFVFmK7vV0ZWLpO6c2vLrqhtUBBjzMHndISTe64UVRtoX9YoU/Kg3J2S11FG6e/SMoZPNwTDFnRGBxu9c9ktl0YztOEHeKLehZDAHpaKh0pcFd3QNngGwXe1aKi3ZXyn0Sdv/iIpsPOgBesYPG3sx9Y/iH1lxaLV3wVwmJdJRGDBtRcJlbcI87/WvpI+1edBsplHds9wlI6ZnxPzUq75eL59O2+uqatl/LbRqp26UtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzN8vwLYNSmXs52aOhtqWWanGDIxUnCAfRCbyHwNLp0=;
 b=ZupcTYNnv0pRcoM01bDRok5U7YDwz9399QZAG3AY9Z5s1PXDjFFrOccIJRVG0ITXlHXzo5K/q8xJAFaPl9KyI4HAwfZ4hDcspSb2K0ayLIOab6/AmVFHLPsDASpkD9+jnjCOYPX04pySnabsHGA1ze+YHgIGQh2/YI0277PI7hU=
Received: from BL0PR02CA0121.namprd02.prod.outlook.com (2603:10b6:208:35::26)
 by BYAPR02MB5704.namprd02.prod.outlook.com (2603:10b6:a03:9c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 08:13:17 +0000
Received: from BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:35:cafe::da) by BL0PR02CA0121.outlook.office365.com
 (2603:10b6:208:35::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT009.mail.protection.outlook.com (10.152.77.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:53 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:53 -0800
Received: from [10.140.6.35] (port=49678 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75o-0000QS-7M; Thu, 11 Feb 2021 00:12:53 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id C298413C063C; Thu, 11 Feb 2021 13:48:14 +0530 (IST)
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
Subject: [RFC PATCH 08/15] sd: emmc: Make ACMD41 illegal for mmc
Date: Thu, 11 Feb 2021 13:47:19 +0530
Message-ID: <1613031446-22154-9-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7115eb0-0404-4139-6926-08d8ce64e2ab
X-MS-TrafficTypeDiagnostic: BYAPR02MB5704:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5704382C3F0C53C9DC09C8EACA8C9@BYAPR02MB5704.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdRH5pokLEfRM+EXZaWCATGlRKbDONNptnfPLE3Fwpcg6eXMZsg4VNItNt1f+kGwgcbH2lqYo6GqMfMdPXUCfa1qiN2LHVnPfwAjXdmyX1jCZGC19w7tdEr4bYHdhato0lalxJb3/CoxLszsVPL1HPBgYv5byYkaJ2rV9POXZGom+Iz4eDo3mBhTmdaHECILYFG2aIAmqEiPSY+jJyGmNF5h6jcSb7zpbUvvi2hadAgr/kiD20jn8opvVFzUHvvbnJOHQLGOPDvX5LkVjgdg1cdCkvsQ9Gj5ykWfLR3E9vmKG2c3A2Ut3IXDCqYgEPPl/ke7qXrc5jCWh1bQLeFEEROqzoB6HE4Ln8Ldtf0bebi94ii4yneCNJiTi8QA1h0MGNXRqQ4BxRu6PQwDEaptU4HHlQOQukbeTTHPD3s7M4qSVYtPq5KG1B7nknu5x8DUyZfAcSUY2qAnSeyTzSrKaowTZlE7meEPp8+II5IIAWgI/EC08+KLTI43qPI0dPV3pz+vOZUeTHFVDHi7HGtfTDJk0aYS4XoSCdekHWoTFhStfMIQorZeLgfv+GSCxtHs9j9k2kKmb3H89POeSrUEiYoxXt+8CYEX3pil7VeL3NMFCfxjuO/HavXrzX/UuhgnZqjFvRwiAoZ3h0+1Q0ifN2rH1pBIpYi3RtMsryZpGorM8U21wXcSDz/Z1/bYQhe1eVmv8NX4/BurbPSdpRe3Bw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(6266002)(47076005)(4326008)(107886003)(8676002)(2906002)(82310400003)(7416002)(54906003)(356005)(70206006)(921005)(82740400003)(7636003)(110136005)(36860700001)(2616005)(5660300002)(26005)(478600001)(336012)(8936002)(70586007)(36906005)(4744005)(42186006)(186003)(426003)(316002)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:16.6451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7115eb0-0404-4139-6926-08d8ce64e2ab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5704
Received-SPF: pass client-ip=40.107.93.68; envelope-from=saipava@xilinx.com;
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

ACMD41 is not applicable for eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 90359f6..236f2b8 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1729,6 +1729,9 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         break;
 
     case 41:	/* ACMD41: SD_APP_OP_COND */
+        if (sd->emmc) {
+            break;
+        }
         if (sd->spi) {
             /* SEND_OP_CMD */
             sd->state = sd_transfer_state;
-- 
2.7.4


