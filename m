Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A45327428
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:34:54 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRq9-0005qE-M1
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0008S7-Jr; Sun, 28 Feb 2021 14:29:31 -0500
Received: from mail-dm6nam12on2048.outbound.protection.outlook.com
 ([40.107.243.48]:16556 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRks-00039K-V1; Sun, 28 Feb 2021 14:29:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnjLEEOaxVoh8l2xUiQK70GH4OclEQf8FXPi0ZMFtR9pnU3odQGeN+YgG1Hlfrhc+OiSb5TKdGthykyRnplY+eRbN55Xj4AP8X3JKGoeED0KpOn4wr84siTyrS6gfelEciZk0QtM0bY0//C+cQTXSzZxX9aSdNeZmviMejsG+kyF7lMv7j/KxPxGRpAKCFuUvj05opSlQGGUeLiquYF9Myrb6sa0QNSMDSPpyCSS5yxf+61AHeUWvtwGZ5YHM0O7Vl4leb4/LmOkPPlsMWnCwH3CCzqf1a4GMWmrBoa2JdXjguDUo2jFB2MCtF/1ZcnEY+UgDUWJ0aLUKmWNYrUU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8zukIHfoPtN2nUzsZ2wbyDYviBosaS9aQO43YfgFFY=;
 b=MjZhDGTzLu6ZYngTpbnMJwoXNJ9EYgtfu90Mm+apbD3QSY2fePfBVXYu67GdB/i3hbaB+SFdSi3XJrMium5IQ/5axl7aC/LcgT81+28KP5tvs7t+0W8u1nMQ8N5m/gQ6VaHfl5Inu5Q8H/py3iR4+9HwY0FDYwAv1v8ZE8Mei0+KX66R2TB89mSjvzge1dp+l7uRCjei57HCdEdmF6o/RBnMb+jKddTP/8mzYw9wGcAEOmopk8DBpkKXsM1kTOROLh4GQ33G56E9LyJQgb2Ahy84Vgz/JTY2PgJmNcTrkfdkPT+mOkEtG3WMS4C/91r63E8RmIDzLVEZs4iVG34m2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8zukIHfoPtN2nUzsZ2wbyDYviBosaS9aQO43YfgFFY=;
 b=kzWzqrmJAyQvmu+WVxIFis5dD3A01gVuA6Tid+XFycQNHpDky/JbggEyx7SIEtjK+4lI9zMlSDAlPWboONbsBASYxBqpLEKqap/a9mzOLq6qrb13aP/6htET9c1UuFiCYuWT343pxL6XMbbvuO32tXnefecwqESr9YNsjfQa4uk=
Received: from CY4PR20CA0035.namprd20.prod.outlook.com (2603:10b6:903:cb::21)
 by PH0PR02MB7255.namprd02.prod.outlook.com (2603:10b6:510:16::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:22 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:cb:cafe::4) by CY4PR20CA0035.outlook.office365.com
 (2603:10b6:903:cb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:22 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57768 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0008Ax-EW; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 81D3913C0A83; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 08/21] sd: emmc: Dont not update CARD_CAPACITY for eMMC
 cards
Date: Mon, 1 Mar 2021 01:03:14 +0530
Message-ID: <1614540807-30686-9-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 866fc1c1-7040-4f5e-a7de-08d8dc1f26a5
X-MS-TrafficTypeDiagnostic: PH0PR02MB7255:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7255969B7AC215ABB81ADB74CA9B9@PH0PR02MB7255.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AipwyJ9uUcMPgbzz2YFQPZqXmYlfhYuXsWc6fHoLRYqUpiDwqGEFA31giaZ6/5tMEJOnx01hUfh2x01gPXHVobNJefpu6KhGxgc0CJIWgppgRpnW1Kf/TDUWuGPBhvRFVNXqJbPnlbuKB6eVFb8cIdcBchIiGT2L8bKsmqo+YM+girpbG3q9SEM/fcGJoSSOhCQMPGKRRyHsSmfY2lWZWdiONAtBN4iLTDhmfpLNljX7hEcHjXA1N8M58oczCf5vNWaywV3CMnyzvOSoowtf6zYZyEPP7fCKfmWjxleGPFVBqcP/a9QOCERk02hgwJF4DeDGkrNLSseAgvUseIg82dO0a7slPLJRT0FDPHgpXA99VggGzwTMMmuRhR4MC/pR3S/YhtOyqt33wsCqb0XduZsRRkREYNEtLiBTLlQP+CjaFODJdhkQXHAD72cwibzcTJXvCWcBXLWFVjIG4u/ZtL8NcBoz3FvbHvbAF3d08Q1Hamy2UfUW5Ti7CBxyWoGfz4V/5C37+94L0ZuphdmrPbkEsbPXwZgXE0EJPJ3bqAez6CMzR+dVYqFktyj9j3oRwft+uVD+pqLUgauPKTElc1ghn7VokZJWdaUblk5BHNeYBbPL2PFV+9zMwKyDqteaq9A4SnInp8CY1yFXNBCrkDTRQqFOz2X/oExLS0qs85iSgmuA4Wlq3PXupZGMjp3vBRYCGkqj3/a46I+UYsluZyXRFc2uVZiH9E8bqRTLmkE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966006)(36840700001)(2906002)(82310400003)(83380400001)(7416002)(82740400003)(356005)(107886003)(6266002)(7636003)(110136005)(54906003)(316002)(36756003)(36906005)(42186006)(4744005)(5660300002)(47076005)(26005)(8676002)(70206006)(2616005)(186003)(478600001)(36860700001)(921005)(426003)(4326008)(8936002)(70586007)(336012)(6666004)(102446001)(192303002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:22.2783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866fc1c1-7040-4f5e-a7de-08d8dc1f26a5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7255
Received-SPF: pass client-ip=40.107.243.48; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

OCR.CARD_CAPACITY field is only valid for sd cards, So skip it for eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 181e7e2..2612135 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -328,7 +328,8 @@ static void sd_ocr_powerup(void *opaque)
     /* card power-up OK */
     sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
 
-    if (sd->size > SDSC_MAX_CAPACITY) {
+    /* eMMC supports only Byte mode */
+    if (!sd->emmc && sd->size > SDSC_MAX_CAPACITY) {
         sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
     }
 }
-- 
2.7.4


