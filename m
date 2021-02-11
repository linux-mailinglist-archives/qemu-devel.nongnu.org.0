Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFEC318644
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:24:26 +0100 (CET)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7Gz-0004Lh-FN
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76B-0002o5-9r; Thu, 11 Feb 2021 03:13:15 -0500
Received: from mail-dm6nam10on2056.outbound.protection.outlook.com
 ([40.107.93.56]:29025 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA761-0004b6-7g; Thu, 11 Feb 2021 03:13:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2aggZu63WclOjleOkexrzunmZyWtj1PnSn84gduVHGVP3Ef15hScS2q1bwXdWx4AJgAGRM2fLVhEG9+eLm9EG/a1n211CFFy/MUnWcUJhHLQSdpiDTWPPxMZT9EJR81XlDB8QexnuYr7l//aurlm5kKF+zREQ9+98COUY7zK3SXrwklhK5zdXEKYRCmaQ/JvVLlzFIrEr1X2cyFTAlHhqAEeoqyNFY3BU3pMTYzVrAG32tWr/9YpCojM4AIvE5sLWPKqPpkNzzaOhDHAroGxuZPHpAUDHsVlMS8EjnbHPTCkal8xwsM4rmcoeCxcDh1pvdPSZ6COZTFPUKfax014Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+DogOLxCf3TJttx/Rg+l42AmtN6qDwoB09Rl8eBiaY=;
 b=DXpM+CKTiuKrZpaxS6tSFfjZaRM9g4jxuAnNsIyjnkXWz2yGFxtSC+mqMGgCJ8U4rf/R/q4kB9lM/IMCMg3j5GvZdFKDytA8U7wk0q/ENva3aRuDVKs735Mkg15opPaMvZ/YKZwuRtPNDppBP4bmvsEGJGxIyTGKc+8hymL6BlWvXnm0u0ICG5D5fbjB2auyQ4m7ffk26EJ2AvHSICRd6vICzsu+YlsDu9fQwkpxiS57DfnYOtGduh4vxPVosAW3OushREw58t9HQgDEZf2MF2PZ+BqzgZA+IYkhm6hJM4166u7jT/dBf1X89DeRC1an4fPoe3vSniWg0LjaMrEkBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+DogOLxCf3TJttx/Rg+l42AmtN6qDwoB09Rl8eBiaY=;
 b=gTbUj7CRngAZPV+11FF+1ZcsmlCcOhJpCiwjAXTPNQiA8DGMfYsatSMQ149EsZY8qTU6QJW/9eUwvu1zWdqESyF+IAO/3iFb59MRyF0x5ydwI9opnRVuGIGliU5R9lSxRba1gnWCRG/GJ8JqQhiIHWdxS0gQkJt8Oe/ahH4q9v0=
Received: from BLAPR03CA0054.namprd03.prod.outlook.com (2603:10b6:208:32d::29)
 by DM6PR02MB5193.namprd02.prod.outlook.com (2603:10b6:5:49::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 11 Feb
 2021 08:13:01 +0000
Received: from BL2NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:32d:cafe::3c) by BLAPR03CA0054.outlook.office365.com
 (2603:10b6:208:32d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT028.mail.protection.outlook.com (10.152.77.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:48 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:48 -0800
Received: from [10.140.6.35] (port=49672 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75k-0000QC-7t; Thu, 11 Feb 2021 00:12:48 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id C26E613C063C; Thu, 11 Feb 2021 13:48:10 +0530 (IST)
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
Subject: [RFC PATCH 03/15] sd: emmc: Dont not update CARD_CAPACITY for eMMC
 cards
Date: Thu, 11 Feb 2021 13:47:14 +0530
Message-ID: <1613031446-22154-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85cf6946-f76d-4253-1e7d-08d8ce64d96f
X-MS-TrafficTypeDiagnostic: DM6PR02MB5193:
X-Microsoft-Antispam-PRVS: <DM6PR02MB519336053166F37A3604CC7BCA8C9@DM6PR02MB5193.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7M3XDel9Mt7Tl5SVgeZOraO9B7octnwSyatQ5Aiq+veYP5xfipVF9Lg2s2GJlJEV0ruQi5xUZzkaaaPbH12QlbdAFXOm+M3Rojwi0opCNdxGpG2hIjtdKeW9kIZkBWfcADcFyqvMsTQAFMSLaq/mgYqmyxF5K8Uy056DzEIea0AlUEFvPoXLIKtyW9Cytsozklo5JANBNn/FIOM5qyK33sf8oKyQqZOR/ngCf8PNv/L0Cgk9iaKIWxRwAyA2lx5bWDtoqcrQ8++k7XhZgX6G4JxkkrHAeG1G556LmgRY08Ttp0fvf+xtwRhyQ9U1PiOOzjAlUq4LGxbfx2l3i20N8hJVetNyQMmDV3MDUVkQS7R2GYnJ5i8OeKexRu2srOUcSR9+Aqq1DJby1zeqPCqAhfOvoCiiIIFbZENs4XkqrRXZSvDaAT0eNkIsAMaLJKDI00nbXGc/jT0m7GQY3xqbsA974+8nRB+56IL0ZqeW0XGn10KmvxRdfE2kgql8WtGrvIVVz4OQkGY+WSVQ3MN8XfBblJdgrto2OkoPMOJkPlvq7DOf+x9WODld51+WqBpCaEP7+b7IiVtx8OOBTv+AN3+alVI3rqFJNPTc49wqdZp8iPAue2KOpsYA936jONC2pMalWCr77WGFL4MuKTp7WhF3zV0lEcowZnjpoKMKiAAP7m41ANACU3sPgR8cq0Jj0BOT8AQ8WxfLX6W23h3cMqgP9+gaFL/zUeENAwPfu18=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(8936002)(82310400003)(5660300002)(921005)(4744005)(36906005)(356005)(36860700001)(83380400001)(7636003)(186003)(26005)(82740400003)(110136005)(54906003)(2906002)(42186006)(316002)(2616005)(4326008)(6266002)(107886003)(336012)(7416002)(426003)(36756003)(47076005)(8676002)(70586007)(478600001)(70206006)(102446001)(192303002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:01.1505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cf6946-f76d-4253-1e7d-08d8ce64d96f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5193
Received-SPF: pass client-ip=40.107.93.56; envelope-from=saipava@xilinx.com;
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

OCR.CARD_CAPACITY field is only valid for sd cards, So skip it for eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a75fa1c..57fff89 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -308,7 +308,8 @@ static void sd_ocr_powerup(void *opaque)
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


