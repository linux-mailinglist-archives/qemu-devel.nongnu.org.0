Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6D3211E3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:21:53 +0100 (CET)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6TY-0002Xv-C0
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OC-0004cS-Ra; Mon, 22 Feb 2021 03:16:20 -0500
Received: from mail-co1nam11on2067.outbound.protection.outlook.com
 ([40.107.220.67]:7424 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6O8-0001n3-PZ; Mon, 22 Feb 2021 03:16:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA42uDtEXkROnSo05z9pnMfCJFsxchls+1Cwtn7RqM5FjbbaTFjUlLZe77C0nLD4YBKIg2ZLfw6GogqXWy7YFNqQPrwJO+nAWzTDoycWSUyIs/m87TUcR6sNsCh7IWI1OWtHRKxN6WBhuHvhTL5ZPnQ0LqnGl4+LB+PYf2AP1BBl+f4+4zf2bMCHa7YSsQUWtBAKcnCN4c2D3RRMlpwP7erUvp749Hh+zvxy6X3PKzDRT7F7P3RHT5u6wWkuW1dJ2xIn3mrQ1m6sLQJvOh9hkAnNV1zesADViedI1I98XBoBC9ZgTlBiv/8kV5TSVU+tStz9ATs00EVrensp2LdqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQEYKZgbFLJYb7UP3r/0/Os+2TpCqx+Ck+8z+FDvzTM=;
 b=dZDcSIyutLOhR8WV0fOE68SoInPshf0LsBw6ApbtTWFJNZ4GYYQF67nHa+oT1lWkdVZFqtnQgmgWpdM7qC1oeZIj6n/o9T9wOJylvk2HTtdh4Ah7EnY1lM7HnI/NsLReGP3AjbGub64SJw+IKAyvVP5xeEOJ62UgTzUGVyui0Fotp0KJPENYOnLgmu61sTo1bvbtedKWk+Z3liMN0/BkPAj8+NnZMUB7JhKp+s2FTG0MEFPKxzemq8NcCZZxkwFV4i0cy9J4McGVj7Tesz4MNdmQEi5le99o3YJO6YmBvmS3hEzlhedupYEqx1T4AkTKhv284pE0VF1s1jIeCYc18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQEYKZgbFLJYb7UP3r/0/Os+2TpCqx+Ck+8z+FDvzTM=;
 b=Fj/H3Vze7eue/KJFLOTncjJmaPXmbRUvhhBYOG4td1tQpMSA2WUa0upXYjn9hiFFjvLKpeW6AktTrr4w0LFrW/5bxH8AVyi+O1ESxgNC5XJw9otcKgjKj/9/cAwUXd7vuEX10uzglVQO1lmov8M6GA8FxJ/Mli0DK96pLDH4kGw=
Received: from SN4PR0501CA0074.namprd05.prod.outlook.com
 (2603:10b6:803:22::12) by MW2PR02MB3738.namprd02.prod.outlook.com
 (2603:10b6:907:f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 08:16:11 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::f0) by SN4PR0501CA0074.outlook.office365.com
 (2603:10b6:803:22::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:11 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:01 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:01 -0800
Received: from [10.140.6.35] (port=59054 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nt-0004ND-2o; Mon, 22 Feb 2021 00:16:01 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 1CA6313C0ADA; Mon, 22 Feb 2021 13:50:58 +0530 (IST)
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
Subject: [PATCH v2 15/22] sd: emmc: Update CID structure for eMMC
Date: Mon, 22 Feb 2021 13:50:32 +0530
Message-ID: <1613982039-13861-16-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb7a7608-6744-4ae1-d480-08d8d70a1d6d
X-MS-TrafficTypeDiagnostic: MW2PR02MB3738:
X-Microsoft-Antispam-PRVS: <MW2PR02MB37383D2513912B8845B30725CA819@MW2PR02MB3738.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6X0U0a6Wb0ZPi+cQxjTTc7MGZNCZ8Olu2ecnhCui7i+oRn/YCXFgTiy5QgLirVxcDnwxIXQ3FRDvJXtUmN2R1LPDK+FfKaqnft+ibpYkj/KvS91eN2yHqSaRQbZqG4DWc0xGC/VQTQHoL4Icm74NlSk0+NQGAkMyjIxUSXiQQhTHmF9i3q6xTy7wtfcn30WcMbn/nDBtq7xY8qkJgFPOcsuWkIled206QNc7F5zYTwwaDWWD2WKVBbvnxock6DWrn4N3yYOXap+O9wRja5uPn+phVQhVv/2jSZwc+vp4z5g700Fu/Xk56Xcsy8quhCusa9teS0XQxsH0TbJx6fYtR8gamOamoyRxcFPM0OLe0iLXl/jrNh3amkOlUB2YPMVKaoyvfmWx88MgIm4QrAqGIirefSS7ubzQSFnK6E1boNPUinh9EToA15Qd7GBfG+3MvNXihffieEuMMDW6QyQxbRrcR2rOH2Aj5D9Tf3nxj+CdZ6tARjSC5JTuLmxXybtnSvFdu2td8z0rt6Z7TYMx7whUMYKke5N08Gal4JiApkHmWNd7zSziw9gnH5NQryJj3N1ufn5U1QOW0iMUsMsc/6ani24fzR7FWPawY48a97BG+IaWOLQaBAIWhalTsI+RMGoE29uStqAPtr5GnF8J9CirVaC03qxVDDj6szF0cCQblPiMNGMfTIxH9s41CLZMdWED/nZlR2r5cygukW2NYw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(36840700001)(46966006)(336012)(107886003)(426003)(36860700001)(2616005)(6266002)(47076005)(7416002)(4326008)(82310400003)(54906003)(42186006)(36906005)(8676002)(110136005)(356005)(83380400001)(7636003)(6666004)(316002)(478600001)(2906002)(8936002)(70206006)(82740400003)(921005)(36756003)(186003)(26005)(5660300002)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:11.5487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7a7608-6744-4ae1-d480-08d8d70a1d6d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3738
Received-SPF: pass client-ip=40.107.220.67; envelope-from=saipava@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

CID structure is little different for eMMC, w.r.t to product name and
manufacturing date.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 6d2ef2b..3c24810 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -361,23 +361,36 @@ static void sd_set_scr(SDState *sd)
 
 static void sd_set_cid(SDState *sd)
 {
-    sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
-    sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
-    sd->cid[2] = OID[1];
-    sd->cid[3] = PNM[0];    /* Fake product name (PNM) */
-    sd->cid[4] = PNM[1];
-    sd->cid[5] = PNM[2];
-    sd->cid[6] = PNM[3];
-    sd->cid[7] = PNM[4];
-    sd->cid[8] = PRV;       /* Fake product revision (PRV) */
-    sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
-    sd->cid[10] = 0xad;
-    sd->cid[11] = 0xbe;
-    sd->cid[12] = 0xef;
-    sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
-        ((MDT_YR - 2000) / 10);
-    sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
-    sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
+    if (sd->emmc) {
+        sd->cid[0] = MID;
+        sd->cid[1] = 0x1;       /* CBX */
+        sd->cid[2] = OID[0];    /* OEM/Application ID (OID) */
+        sd->cid[8] = 0x0;
+        sd->cid[9] = PRV;        /* Fake product revision (PRV) */
+        sd->cid[10] = 0xde;      /* Fake serial number (PSN) */
+        sd->cid[11] = 0xad;
+        sd->cid[12] = 0xbe;
+        sd->cid[13] = 0xef;
+        sd->cid[14] = ((MDT_YR - 1997) % 0x10); /* MDT */
+    } else {
+        sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
+        sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
+        sd->cid[2] = OID[1];
+        sd->cid[8] = PRV;       /* Fake product revision (PRV) */
+        sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
+        sd->cid[10] = 0xad;
+        sd->cid[11] = 0xbe;
+        sd->cid[12] = 0xef;
+        sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
+            ((MDT_YR - 2000) / 10);
+        sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
+   }
+   sd->cid[3] = PNM[0];    /* Fake product name (PNM) 48bit */
+   sd->cid[4] = PNM[1];
+   sd->cid[5] = PNM[2];
+   sd->cid[6] = PNM[3];
+   sd->cid[7] = PNM[4];
+   sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
 #define HWBLOCK_SHIFT   9           /* 512 bytes */
-- 
2.7.4


