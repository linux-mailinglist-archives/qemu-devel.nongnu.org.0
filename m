Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A01C32742E
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:38:00 +0100 (CET)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRt9-0001gh-8E
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlA-0000DE-KY; Sun, 28 Feb 2021 14:29:44 -0500
Received: from mail-eopbgr750078.outbound.protection.outlook.com
 ([40.107.75.78]:59093 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl1-0003Db-2t; Sun, 28 Feb 2021 14:29:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebCRFoSxxh8G+XAj8Bf2fOCWPazEi/ULBlcq5484xMD83DtIxuAvDm9LMA0lSxLIMeYlbKy8x8b49pEzsn+4WCj5Mi9L3GPMlTO+M0DOwnEN/caz/mrRymfAOcii+hhwNV2oI1mwqZboy7HB2eL9aVILCKSyhIZ/WqmY4kFps6OgdnoTROi0ePhALclbCRQKM1I4pssh2hswGeiphqI9vYLFkvEwpzM84Yxp5HALkRnhhr1MyPNmnS51Rni01gU7Z1FF/FZudyeTGuhe9K3c08ZeRaDb2YfBgieJV5MgWZQqPhJkp1V4i2/QDQezogeo1oHi9s3hSjyqZhxpE6chCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlKzBhFbXxVpm+CJh8vjnZ+UTu8vBUD0PsWP8Ogh/RY=;
 b=UnhIsFpj/qEETRnDehVaAuM6tFhD5hBISXBTbb/LBiRTTWBaDYw2/f0GdMEwTh53n0KTdKJ827MvbqbZrbV7vo684DHjxQMYFzIuoldVXwHTo79JlrzTZr7XVzkf3fEY/AQcqCWohV72O10M1j9ISPjb5MS7Y6A7nY9nR8iV3rBz57bOV2Zo5Xeb+ULx9S83RDwp8om+bBK5dtuDVkdO5EDPJKp7DW324UzJDkxiBDhkGRS2UDzf7PcyR8cq2sxO1uB+fXW6R0Q9E9rQrGdJgKiD6CFBTpIgj7jDUekENuNTBOGPapPmaHYfwVP5rML8H2p62HL/YPA8De2YsC9TtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlKzBhFbXxVpm+CJh8vjnZ+UTu8vBUD0PsWP8Ogh/RY=;
 b=XCwVGLkbPVkzk4LDauKboiH3PK+TYZM89lczT4p/echCf1gF+vuHeoaPLPpNnNJur/lkUgx8ktSdR1bkMKA7zLlGZbRDUsUlC3+q2TQQjhkz8ZPbHmhHhL0RxYYYMiFwZsaxkaxuY86x1jIzoNoRwpyAMgYG0tsr0oqGQxERc6s=
Received: from CY4PR03CA0010.namprd03.prod.outlook.com (2603:10b6:903:33::20)
 by CH2PR02MB6505.namprd02.prod.outlook.com (2603:10b6:610:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Sun, 28 Feb
 2021 19:29:31 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::fe) by CY4PR03CA0010.outlook.office365.com
 (2603:10b6:903:33::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:31 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57764 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0003ML-Dk; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 707EE13C0A6E; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 06/21] sd: emmc: Update CMD8 to send EXT_CSD register
Date: Mon, 1 Mar 2021 01:03:12 +0530
Message-ID: <1614540807-30686-7-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0ba6fcf-2cfa-41d1-919a-08d8dc1f2c44
X-MS-TrafficTypeDiagnostic: CH2PR02MB6505:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6505F45842C7F118A22E4DC4CA9B9@CH2PR02MB6505.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLu1QXD7/yYoNUwNPm1o5gpy8Rt1XBBwfjuQH9v2QmPaswWSQlP7ENm+V7XO/j4SM/In//yvf4O8hOsQjqKW6JlkBOvwIM+SwTORdtOOXAG3EK+tar7VzibKhaMh6xwMWDJsA49itcSqFtnahrfdARNIC/ete91ujl5z640q2vER2Iab+x7IHIREvuST1Ci8P8RafuQHVy0cTk6yOWqCRiDn0q0psBNtGtKGJwA2QwnugPfbFZjMi8fH0wTiBBexvob1iDPDzfyQM8n/9kcC4r7pjy7cNytwums5hRqBE9GimG9HiWjhptPtZMvwF2HC2nRu60obQtKHT8k+juN3ftoC57nqzuw6EFSgvK8DS08cmoHJQyiBrb53rqgprBaJpW1IEJggTilax+8SDYu4bu2j3tE/roIsq9Mi1Hgzf+i5tM9eMLVbjANoDlDRUHRj8XESBqM3xZY72rLMWRZI9Dn8J/7kLpRoOLQxF+gmtjGN4uCU/XcmOGrD/5fDclKuTWdWVNvZro0FOgCO6Z6/YC2KIrDJiYm7XxJ0bvhp72Ve5LBp/yBXFJdckm6NhAuoP6RDP4mRUExzI0BjXq41gezk48q3J6BBKCpAA+DEPfPWkDoxtpxFoeyDb/dgMBfEsVpA5QRtyF2meGUFmFZwydg4O3Gb9rbTRFxQv4hsosH57xi6A4Py+2iMOILORZVIM5hD1UXIETL5QoU3utAL5w==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(46966006)(36840700001)(83380400001)(7636003)(356005)(82740400003)(316002)(82310400003)(42186006)(110136005)(54906003)(921005)(47076005)(36860700001)(36906005)(4326008)(478600001)(5660300002)(70206006)(6666004)(186003)(26005)(6266002)(36756003)(107886003)(7416002)(426003)(2616005)(336012)(8676002)(70586007)(2906002)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:31.7083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ba6fcf-2cfa-41d1-919a-08d8dc1f2c44
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6505
Received-SPF: pass client-ip=40.107.75.78; envelope-from=saipava@xilinx.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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

Sends the EXT_CSD register as response to CMD8.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 52 ++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a26695b..181e7e2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1141,24 +1141,37 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 8: /* CMD8:   SEND_IF_COND */
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
+                memcpy(sd->data, sd->ext_csd, sizeof(sd->ext_csd));
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
     case 9: /* CMD9:   SEND_CSD */
         switch (sd->state) {
         case sd_standby_state:
@@ -2081,6 +2094,13 @@ uint8_t sd_read_byte(SDState *sd)
             sd->state = sd_transfer_state;
         break;
 
+    case 8:     /* CMD8: SEND_EXT_CSD on MMC */
+        ret = sd->data[sd->data_offset++];
+        if (sd->data_offset >= sizeof(sd->ext_csd)) {
+            sd->state = sd_transfer_state;
+        }
+        break;
+
     case 9:     /* CMD9:   SEND_CSD */
     case 10:    /* CMD10:  SEND_CID */
         ret = sd->data[sd->data_offset ++];
-- 
2.7.4


