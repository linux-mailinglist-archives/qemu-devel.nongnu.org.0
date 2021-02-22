Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40D321217
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:36:03 +0100 (CET)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6hG-0005PV-FD
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OH-0004pS-UF; Mon, 22 Feb 2021 03:16:25 -0500
Received: from mail-bn8nam08on2076.outbound.protection.outlook.com
 ([40.107.100.76]:20396 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OD-0001p2-QZ; Mon, 22 Feb 2021 03:16:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGmZ8UxRMjh5v6g8Cl3v/0HIhKlCIDKtJiqkMFLuFsthzuNWx6oplLNN2YJZgoU2FY4P/JeMdlXMXYShrm4AQ+0MvqXVOW3i2b5qM0PbB+/w0QxlovktPMbJ+b78Zh0hTcRX1jjopsgu3zOTJXGtHKg1qkgva7ss7qXoZknY8IPD+u2oWnw5gzdBZV124r9d+xNyItMetInQ1Xa+nSwHt3dnuaOZtilNfA6QDCDdHDAfr1nV0Yy2egIA9JNFZbZp6sehsj3YB90qLdEIaEnlKjGut3wP4NBsEIjuFk8Ysz6e1WYD9+WUbY8bTFGXccaxHlgbNoKNJpvJNVNEp8YaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYJbWbPg5PSh8eOo/Cg8+A8btjhpEWU4xUEXPl6QyGA=;
 b=BJI+RCT/uTshOBvTBF+/hkImN4fxXopXwUpRSRqZNOv57gKEpXNMqQA7ZRSErfsvdwLx8sAmUr81jw3+KAckO3wOoxN7ftBPXIFFS1ZgMMS0Pa6d2Y9J7P/g+qCWv6wH1zttp2H7F6tnE9BLF0iLZql6dyvpdLAR6SHvSq/0urf9KEVOiwTOVhN5DnoFxk5td+kyIoUqatzfLDt9z5YM6oFuakgMGTaiYhM1bRdE0bfwlKqR8bHseKB6zoWOqkdl3s4gub+1hYPXkNZyzvC0DZ5fxtEEgRawxX0t/MttrUPSl72YHmpJK7QnbsKy+1q2fNAatWwh+fmYHU+woyp6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYJbWbPg5PSh8eOo/Cg8+A8btjhpEWU4xUEXPl6QyGA=;
 b=pQd7d24PSGoCE2BOihnO9Y64RnHZ5FxBRRMWwJmp40U5p87uc289eyHRhiYW7jDNPsj8pnwTimqNM6mxbER6BN7A3QHGOaQjAewRLwxNsTk6Cv2ucV4Zr2E04lq+aVLqezM36hqfXOmSwkSyU2bgNnv0mP9EgnGYxZUmYZSxpHY=
Received: from DM3PR14CA0147.namprd14.prod.outlook.com (2603:10b6:0:53::31) by
 MW2PR02MB3835.namprd02.prod.outlook.com (2603:10b6:907:7::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31; Mon, 22 Feb 2021 08:16:18 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::1e) by DM3PR14CA0147.outlook.office365.com
 (2603:10b6:0:53::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59036 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-00036z-TR; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id CAC8F13C0A08; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 06/22] sd: emmc: Update CMD8 to send EXT_CSD register
Date: Mon, 22 Feb 2021 13:50:23 +0530
Message-ID: <1613982039-13861-7-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d995d623-88da-4afb-e532-08d8d70a210b
X-MS-TrafficTypeDiagnostic: MW2PR02MB3835:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3835ADE94A301FDDD9266A00CA819@MW2PR02MB3835.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3O/bdrQdFh6r609UUG+bjLgFh6BngxCyrnXPr8vzat3sQJ/uyUcs2p2agmnMpe08mwL5FN6rFDve5YsYlvt1DAnfjRGngLGu6GLhLPYXqIUzHOkBD1PUSgj5C5kFVqRXa347+t7+pDtgjpngr4SrptCkKPD/GmUqfkG8svu5r78QwAo1rT6GCG1YHc9bdMBDRss6MLUPOazgwD3mzlCIdc7GZR+Nur1AMyhhQOywoOlzVg8LyTnze9NTjVc7QoNuX3k13JfRFs+Rxn68sVbqOuuCNzxcVjVuOweYi1MRqRI/2jcoBTLQGyHmyiEK39OPofCPWDtJzLkWzKMUP7adtFxEGUMUzZiH0zPJjYIf+I/Qp8gmHba3ZvuPBo65+mwYI1PMqs85uletWE07+C6teSdy6pETtLwjccAgsJRN167uF9NyXN5w58h1xLS1ZLcj6kMWYh3CC32+fEhtF5ToO4VJ4DFPbwlDGwHDBPHJxMSKoZuT4s6jzOmBkOj050Yspn4fPgZS1fV5gLs2kjB3sgwN7rTlt62GWfsaSNdG6gBZr5DsmRQfFCvhYN5qr1z23J93DIxhI3gkxKSqMOnUp343NBkl9NUhV6M8twvg+UmZO4MLV6tu5hP3EGDELOHJv4V2Gf7jFOvO73vZbKipp8wEYyq+3f9DT+Hf0Poxj5apC3PzXVoGEi3DaOTqANT1IUSISya73upcJtGLZ6KbyA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(46966006)(36840700001)(2906002)(82310400003)(356005)(83380400001)(8676002)(921005)(110136005)(336012)(107886003)(6266002)(4326008)(426003)(82740400003)(2616005)(42186006)(54906003)(6666004)(36906005)(5660300002)(186003)(70206006)(316002)(70586007)(478600001)(36756003)(7416002)(8936002)(47076005)(36860700001)(26005)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:17.6367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d995d623-88da-4afb-e532-08d8d70a210b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3835
Received-SPF: pass client-ip=40.107.100.76; envelope-from=saipava@xilinx.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 52 ++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4c211ba..a4f93b5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1133,24 +1133,37 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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
@@ -2073,6 +2086,13 @@ uint8_t sd_read_byte(SDState *sd)
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


