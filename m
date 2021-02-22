Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCE23211EA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:24:19 +0100 (CET)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6Vu-0005n4-UP
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OH-0004nK-5s; Mon, 22 Feb 2021 03:16:25 -0500
Received: from mail-eopbgr760081.outbound.protection.outlook.com
 ([40.107.76.81]:59396 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OD-0001oq-C7; Mon, 22 Feb 2021 03:16:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpj9c3tWS7XG7AU1oTz8n4VkR4Iiugo+ZkR70d8cPa3+x3kqZGjuaML9xkg204IfdzS8ZPFOlBAWDSgxN2E3aalGEocmz6rKtbjVAK/x7q+lB/BNVjjWbvfyeyW9vbK+Mi0+h0pZmowgODV6IDD1usqMYYU3s55tAM/S80WQ6FhMYTcQrAuBc8E9ZW2JOM2DLWlmLnJcyWqxhnaUoobiByYgtFT+yVuQ1O08UQSo3OTb7248EMGmf/ROzbDwiB/XbPHgxHXOTMGl6+BtapJaEknOqju9n1viZJltDe2EkuGVITpiAtp92gIDjHV2bSsNL0E4jt5tOiDwB8SP/NRMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIVxXGsVxwnC7SUqsi7fE/rw+hELAEn+5axvjCHb0lg=;
 b=XeO2MJXJGery/n7sb9FrSTym0pRztbVbAu0VS3b/Z4yrOi+yIuhp8LUGMaLUeJfAhgIB88EZL52Das/8bh7UZV07kDGpGNMnbEfHAX/q5/fkiOARMwL3JvQyyRUdAfueS+2aN2SKdHFoWMXa5Iz+WCU2jx0A+WZQll52szeyiyNB7KlySYUYNHjBbVFtjzxCqKOQ9NzH9XliGQkee1WbkjQCVtJO3hceqH+xBTVfdZRmSMWI/2B6Qk3qROhz2kTDZWJCZ3DiF0MjdzpTn/nd0wZF36Th97LUZsW67wNOt5c72jC5N2qzAHPvCdN5/HxcLPxDSdbIKb59rVhVJT+Y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIVxXGsVxwnC7SUqsi7fE/rw+hELAEn+5axvjCHb0lg=;
 b=aa5QLlh90IasCmHkgLQCHFZeqv1KtnoRShCYzdjJSyNoVgXGklr7ruhJ3I1GUDBBRBwrn39ALXRicMFbyPpTiSB4biLv4Y21dJrHtp42vai78GUrS9xCL+P7Ow8RgD3Vo3TCeDCDtJhHNpq3qxrOULjSw60zFdaDIXsGiAyoRSc=
Received: from CY4PR18CA0064.namprd18.prod.outlook.com (2603:10b6:903:13f::26)
 by BYAPR02MB4248.namprd02.prod.outlook.com (2603:10b6:a02:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 08:16:18 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::2e) by CY4PR18CA0064.outlook.office365.com
 (2603:10b6:903:13f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59048 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Ns-0004M6-00; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 064CB13C0AA0; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 12/22] sd: emmc: add CMD21 tuning sequence
Date: Mon, 22 Feb 2021 13:50:29 +0530
Message-ID: <1613982039-13861-13-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb33f0b-d340-4a16-3b55-08d8d70a2120
X-MS-TrafficTypeDiagnostic: BYAPR02MB4248:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4248AE169702A46978F8946CCA819@BYAPR02MB4248.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3JQU6d6vk91BrkoAm62zOsXL2YE0VeGhoAC4Z5Zz5tXZ5TeHFDBDEK/Nh8494oUwnRiNO8uBzxU8rz3Odn0ydo5vo2w4vbTtdNxpkGNOIhr6L3VDkSsQigmGZ5Xh38gOJKl2nIDfmJ780aBO6W7HWo2cBJp3xf9UhyGV9+ujQEZvWhSZonsD/IVMs8hUTRvo5TYdRaSCGw6zPFMLg3oqGyZ99AXhc2fEkMb8nJ+0lG3yqg9zKNzOZWng6OD9Xlab2iEQZruFKspBujq2MXuHcuVoXRYRNEP8S1F9kGLSs/Jdo0OcsYh+huLDB/wvyHK0V0rYDpckHPVNMMv9FDPTM/zsdbqrq5Y5wDbab4U0j7Z0Y2AMFcIGJ0aI+nb3N3CySwuGOcXSDpAWnr6p56/wHYsqp2n3RiBwscRLLQuIniROrWuL4WsHPtrXHGIB89qKYqBVV7qJDG5ImqdxfGVQpl2WE0yo7kw/TMDPN2Bi5eej1YxV6DnVtnzLmsnjVpX+ccVhVK1FXts0yVtBuUXGRn1LBxXOEONA5ZI18DRYGqedxvQk95ixemlpLr390M9cEC19Z49lX84eNo6J6amSAIMyY0eDphvivmO00I1r7XJYCtxgD2sawIfzTjFh+DArfjYDpe7+MwPPpJ9ni17vDpTkW80eg9lJKXT4j2UIilsGcJflYlJMcCUnzB8hbrTmsR1DVBTQKK4+h8h+houlQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(46966006)(36840700001)(82740400003)(7636003)(478600001)(2906002)(6666004)(26005)(70206006)(70586007)(5660300002)(186003)(921005)(36756003)(356005)(336012)(47076005)(54906003)(7416002)(426003)(107886003)(6266002)(36860700001)(2616005)(110136005)(4326008)(8676002)(83380400001)(36906005)(42186006)(82310400003)(316002)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:17.7700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb33f0b-d340-4a16-3b55-08d8d70a2120
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4248
Received-SPF: pass client-ip=40.107.76.81; envelope-from=saipava@xilinx.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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

eMMC cards support tuning sequence for entering HS200 mode.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e50d40b..d702027 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1378,6 +1378,14 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
+    case 21:    /* CMD21: mmc SEND TUNING_BLOCK */
+        if (sd->emmc && (sd->state == sd_transfer_state)) {
+            sd->state = sd_sendingdata_state;
+            sd->data_offset = 0;
+            return sd_r1;
+        }
+        break;
+
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
             break;
@@ -2112,6 +2120,30 @@ static const uint8_t sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] = {
     0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
 };
 
+#define EXCSD_BUS_WIDTH_OFFSET 183
+#define BUS_WIDTH_8_MASK    0x4
+#define BUS_WIDTH_4_MASK    0x2
+#define MMC_TUNING_BLOCK_SIZE   128
+
+static const uint8_t mmc_tunning_block_pattern[128] = {
+       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
+       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
+       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
+       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
+       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
+       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
+       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
+       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
+       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
+       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
+       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
+       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
+       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
+       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
+       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
+       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,
+};
+
 uint8_t sd_read_byte(SDState *sd)
 {
     /* TODO: Append CRCs */
@@ -2205,6 +2237,21 @@ uint8_t sd_read_byte(SDState *sd)
         ret = sd_tuning_block_pattern[sd->data_offset++];
         break;
 
+    case 21:    /* CMD21: SEND_TUNNING_BLOCK (MMC) */
+        if (sd->data_offset >= MMC_TUNING_BLOCK_SIZE - 1) {
+            sd->state = sd_transfer_state;
+        }
+        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
+            ret = mmc_tunning_block_pattern[sd->data_offset++];
+        } else {
+            /* Return LSB Nibbles of two byte from the 8bit tuning block
+             * for 4bit mode
+             */
+            ret = mmc_tunning_block_pattern[sd->data_offset++] & 0x0F;
+            ret |= (mmc_tunning_block_pattern[sd->data_offset++] & 0x0F) << 4;
+        }
+        break;
+
     case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
         ret = sd->data[sd->data_offset ++];
 
-- 
2.7.4


