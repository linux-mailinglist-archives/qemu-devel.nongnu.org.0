Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420032742B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:35:34 +0100 (CET)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRqn-0006PN-9K
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlB-0000Fe-Hf; Sun, 28 Feb 2021 14:29:45 -0500
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com
 ([40.107.243.46]:4096 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkz-0003Bo-Rb; Sun, 28 Feb 2021 14:29:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BencsjVH2lIgpPa5nHz66gijgYX0RP8Klx0vxPDxnSp3FGSO6P1wkE0AFX0+qCbSFMbrQfUEDyIku2cbpngZFyXaF9SUlwpZsp63A9QlJsgdLLJ+9p0iL2OhMqKA80yBbvW9jcpDvYNXi2nDRJNbo2zDbhA6hYCwtsE69Nw7wA2Q6zGjPY7lA3zKbJPAjqPxzYVdlsLnqAibzX6QavmAs+wRlhyV9SxvSPT50y12wj0750ZyHJRPOYxldtO1N6u1STRTZM6ge+Vd3BrUR3fe5XtfGIXL4FT7rbRHOavKphEDz8TGhh6jXQfyyOUOyu7fnoBRQQUKS9d9Mpr9tq4zOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e9XFGU0YRS8i227VrynEUaXS6C9LJ8Z0iOADrj+eNE=;
 b=iKgdJdrsP8A8gmDm8Vi0VIRpHd0nJS/Dr727hpbiK2nfoaFoc15xE1NpiKa3jAIkN3x6rsLjR8ANBV7IsZr81gw/DpEqmGyqBlXoTx4hRjbpVG5vou0KtSMg7z/YZDL5C712OSn2cIXkSFwLnyE/DmTOv5/UPt3TWchQzam8aVIgFYXUousdMroqcPb77Zq9A8DwQLIwpVbL8RbZ75dFP774ZJ4mCO6Gzne3+FO/LETZFHc5V2gDwRugxEc26FuitJVRhh1LWXkfjByxymE2ogMO5ELdJDi9J02gUsqpwB6yOJDHHaviwB3+5cfIbd+DuVw9EsejQp2PgPbn3CclvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e9XFGU0YRS8i227VrynEUaXS6C9LJ8Z0iOADrj+eNE=;
 b=V3gaHbxKQ1uci0q7jfL6txBOEmYplR/S8bec52+9FTKa9DERZjl7D7/QytdMTmqAUVNNDybO/f+RVtCdyRRUIDAJN0gp/TZ4zMpj4hxdZfXpGY8PWhBGqUltfD3bmJ7h+L2Kfmd+K91BN9WYufZ3ZtXuxI6jBR+7r93zk/UA9OE=
Received: from CY4PR03CA0015.namprd03.prod.outlook.com (2603:10b6:903:33::25)
 by SN6PR02MB5199.namprd02.prod.outlook.com (2603:10b6:805:70::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Sun, 28 Feb
 2021 19:29:28 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::21) by CY4PR03CA0015.outlook.office365.com
 (2603:10b6:903:33::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57756 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRki-0003ME-9e; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 4ADBD13C0542; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 01/21] sd: sd: Remove usage of tabs in the file
Date: Mon, 1 Mar 2021 01:03:07 +0530
Message-ID: <1614540807-30686-2-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4ef8f26-763f-4680-852c-08d8dc1f2a14
X-MS-TrafficTypeDiagnostic: SN6PR02MB5199:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5199BD684F25C79A59A0DCC9CA9B9@SN6PR02MB5199.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jfz2lR9Uc4t1+7Faet2XcQyUTah9C9VHzExHrau2mJp6KVMFI2KtJ8XtruR4ChokFkzjwfKiPgKzQU8aHE42m8EksafnW5Xvd56YVUbpCLLrDjQ3L0Jfc9GpKkOwA7lruRNTS9pqrlnuSt1Dhmx4ZgHQRwoodzipzqA/Z1XrencPOaLR/1sGW/602SZ+//8TxzMDHMZ+VtWpKwhKW7Ax3sjkHDzV3krQL8dwqHhL9YGkJmPUeyRTdI6f4IOGi1tHPdMibQntUaKUFDk4Mpbbve1iWvTc7zIK1qUhdwke05WKIGvprD2QtE521mElexTKIrmrClK3SvOzMIVUml0xQrLG0sMcuv3ELDavpqNOFmjqH2QMqrKwPnKdd0sWMO2OK2EBU3MnFyiQocKixITf5aHNyApVcobW2H7NjUlAtLXn/PdO7mfG2ZNHGA4SgJuOOQfs+6aGBezzDJeKt8umqXCgpsKkutaW/Su1un5LwFhyebUSEQ79E7Y6CN4DQkretZf+95I42CiWIl+FyjNR/kl8PqYuaeF21fUu3e6iMTKN+8ImOnxaS+xWLiIXodqxqtpvcXtFc64/VimYjucQNp3LUXjuWQpzgAwRC+kT9C+s3PnYN0izdIgJxc4coKTPVL+5uvyR3ed3oUxvquEgxDFkxZMjVak0Kw4ifx3I41+8NH0bGSRaJLIAZLAued959kLWOIx+fyOn4mEsqE/20g==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(376002)(346002)(46966006)(36840700001)(54906003)(186003)(36756003)(316002)(82740400003)(107886003)(336012)(5660300002)(26005)(83380400001)(42186006)(356005)(478600001)(7636003)(36860700001)(921005)(4326008)(2906002)(110136005)(82310400003)(30864003)(70586007)(8936002)(47076005)(8676002)(426003)(7416002)(2616005)(6266002)(70206006)(36906005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:28.0370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ef8f26-763f-4680-852c-08d8dc1f2a14
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5199
Received-SPF: pass client-ip=40.107.243.46; envelope-from=saipava@xilinx.com;
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

Set tabstop as 4 and used expandtabs

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 190 ++++++++++++++++++++++++++++++-------------------------------
 1 file changed, 95 insertions(+), 95 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8517dbc..74b9162 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -332,39 +332,39 @@ static void sd_set_scr(SDState *sd)
     sd->scr[7] = 0x00;
 }
 
-#define MID	0xaa
-#define OID	"XY"
-#define PNM	"QEMU!"
-#define PRV	0x01
-#define MDT_YR	2006
-#define MDT_MON	2
+#define MID 0xaa
+#define OID "XY"
+#define PNM "QEMU!"
+#define PRV 0x01
+#define MDT_YR  2006
+#define MDT_MON 2
 
 static void sd_set_cid(SDState *sd)
 {
-    sd->cid[0] = MID;		/* Fake card manufacturer ID (MID) */
-    sd->cid[1] = OID[0];	/* OEM/Application ID (OID) */
+    sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
+    sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
     sd->cid[2] = OID[1];
-    sd->cid[3] = PNM[0];	/* Fake product name (PNM) */
+    sd->cid[3] = PNM[0];    /* Fake product name (PNM) */
     sd->cid[4] = PNM[1];
     sd->cid[5] = PNM[2];
     sd->cid[6] = PNM[3];
     sd->cid[7] = PNM[4];
-    sd->cid[8] = PRV;		/* Fake product revision (PRV) */
-    sd->cid[9] = 0xde;		/* Fake serial number (PSN) */
+    sd->cid[8] = PRV;       /* Fake product revision (PRV) */
+    sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
     sd->cid[10] = 0xad;
     sd->cid[11] = 0xbe;
     sd->cid[12] = 0xef;
-    sd->cid[13] = 0x00 |	/* Manufacture date (MDT) */
+    sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
         ((MDT_YR - 2000) / 10);
     sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
     sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
-#define HWBLOCK_SHIFT	9			/* 512 bytes */
-#define SECTOR_SHIFT	5			/* 16 kilobytes */
-#define WPGROUP_SHIFT	7			/* 2 megs */
-#define CMULT_SHIFT	9			/* 512 times HWBLOCK_SIZE */
-#define WPGROUP_SIZE	(1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
+#define HWBLOCK_SHIFT   9           /* 512 bytes */
+#define SECTOR_SHIFT    5           /* 16 kilobytes */
+#define WPGROUP_SHIFT   7           /* 2 megs */
+#define CMULT_SHIFT 9           /* 512 times HWBLOCK_SIZE */
+#define WPGROUP_SIZE    (1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
 
 static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -385,31 +385,31 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
 
     if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
-        sd->csd[0] = 0x00;	/* CSD structure */
-        sd->csd[1] = 0x26;	/* Data read access-time-1 */
-        sd->csd[2] = 0x00;	/* Data read access-time-2 */
+        sd->csd[0] = 0x00;  /* CSD structure */
+        sd->csd[1] = 0x26;  /* Data read access-time-1 */
+        sd->csd[2] = 0x00;  /* Data read access-time-2 */
         sd->csd[3] = 0x32;      /* Max. data transfer rate: 25 MHz */
-        sd->csd[4] = 0x5f;	/* Card Command Classes */
-        sd->csd[5] = 0x50 |	/* Max. read data block length */
+        sd->csd[4] = 0x5f;  /* Card Command Classes */
+        sd->csd[5] = 0x50 | /* Max. read data block length */
             hwblock_shift;
-        sd->csd[6] = 0xe0 |	/* Partial block for read allowed */
+        sd->csd[6] = 0xe0 | /* Partial block for read allowed */
             ((csize >> 10) & 0x03);
-        sd->csd[7] = 0x00 |	/* Device size */
+        sd->csd[7] = 0x00 | /* Device size */
             ((csize >> 2) & 0xff);
-        sd->csd[8] = 0x3f |	/* Max. read current */
+        sd->csd[8] = 0x3f | /* Max. read current */
             ((csize << 6) & 0xc0);
-        sd->csd[9] = 0xfc |	/* Max. write current */
+        sd->csd[9] = 0xfc | /* Max. write current */
             ((CMULT_SHIFT - 2) >> 1);
-        sd->csd[10] = 0x40 |	/* Erase sector size */
+        sd->csd[10] = 0x40 |    /* Erase sector size */
             (((CMULT_SHIFT - 2) << 7) & 0x80) | (sectsize >> 1);
-        sd->csd[11] = 0x00 |	/* Write protect group size */
+        sd->csd[11] = 0x00 |    /* Write protect group size */
             ((sectsize << 7) & 0x80) | wpsize;
-        sd->csd[12] = 0x90 |	/* Write speed factor */
+        sd->csd[12] = 0x90 |    /* Write speed factor */
             (hwblock_shift >> 2);
-        sd->csd[13] = 0x20 |	/* Max. write data block length */
+        sd->csd[13] = 0x20 |    /* Max. write data block length */
             ((hwblock_shift << 6) & 0xc0);
-        sd->csd[14] = 0x00;	/* File format group */
-    } else {			/* SDHC */
+        sd->csd[14] = 0x00; /* File format group */
+    } else {            /* SDHC */
         size /= 512 * KiB;
         size -= 1;
         sd->csd[0] = 0x40;
@@ -503,7 +503,7 @@ static int sd_req_crc_validate(SDRequest *req)
     buffer[0] = 0x40 | req->cmd;
     stl_be_p(&buffer[1], req->arg);
     return 0;
-    return sd_crc7(buffer, 5) != req->crc;	/* TODO */
+    return sd_crc7(buffer, 5) != req->crc;  /* TODO */
 }
 
 static void sd_response_r1_make(SDState *sd, uint8_t *response)
@@ -803,19 +803,19 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
     int i, mode, new_func;
     mode = !!(arg & 0x80000000);
 
-    sd->data[0] = 0x00;		/* Maximum current consumption */
+    sd->data[0] = 0x00;     /* Maximum current consumption */
     sd->data[1] = 0x01;
-    sd->data[2] = 0x80;		/* Supported group 6 functions */
+    sd->data[2] = 0x80;     /* Supported group 6 functions */
     sd->data[3] = 0x01;
-    sd->data[4] = 0x80;		/* Supported group 5 functions */
+    sd->data[4] = 0x80;     /* Supported group 5 functions */
     sd->data[5] = 0x01;
-    sd->data[6] = 0x80;		/* Supported group 4 functions */
+    sd->data[6] = 0x80;     /* Supported group 4 functions */
     sd->data[7] = 0x01;
-    sd->data[8] = 0x80;		/* Supported group 3 functions */
+    sd->data[8] = 0x80;     /* Supported group 3 functions */
     sd->data[9] = 0x01;
-    sd->data[10] = 0x80;	/* Supported group 2 functions */
+    sd->data[10] = 0x80;    /* Supported group 2 functions */
     sd->data[11] = 0x43;
-    sd->data[12] = 0x80;	/* Supported group 1 functions */
+    sd->data[12] = 0x80;    /* Supported group 1 functions */
     sd->data[13] = 0x03;
 
     memset(&sd->data[14], 0, 3);
@@ -940,7 +940,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 0:	/* CMD0:   GO_IDLE_STATE */
+    case 0: /* CMD0:   GO_IDLE_STATE */
         switch (sd->state) {
         case sd_inactive_state:
             return sd->spi ? sd_r1 : sd_r0;
@@ -952,14 +952,14 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 1:	/* CMD1:   SEND_OP_CMD */
+    case 1: /* CMD1:   SEND_OP_CMD */
         if (!sd->spi)
             goto bad_cmd;
 
         sd->state = sd_transfer_state;
         return sd_r1;
 
-    case 2:	/* CMD2:   ALL_SEND_CID */
+    case 2: /* CMD2:   ALL_SEND_CID */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -972,7 +972,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
+    case 3: /* CMD3:   SEND_RELATIVE_ADDR */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -987,7 +987,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 4:	/* CMD4:   SEND_DSR */
+    case 4: /* CMD4:   SEND_DSR */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1002,7 +1002,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 5: /* CMD5: reserved for SDIO cards */
         return sd_illegal;
 
-    case 6:	/* CMD6:   SWITCH_FUNCTION */
+    case 6: /* CMD6:   SWITCH_FUNCTION */
         switch (sd->mode) {
         case sd_data_transfer_mode:
             sd_function_switch(sd, req.arg);
@@ -1016,7 +1016,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 7:	/* CMD7:   SELECT/DESELECT_CARD */
+    case 7: /* CMD7:   SELECT/DESELECT_CARD */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1054,7 +1054,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 8:	/* CMD8:   SEND_IF_COND */
+    case 8: /* CMD8:   SEND_IF_COND */
         if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
             break;
         }
@@ -1072,7 +1072,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         sd->vhs = req.arg;
         return sd_r7;
 
-    case 9:	/* CMD9:   SEND_CSD */
+    case 9: /* CMD9:   SEND_CSD */
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca != rca)
@@ -1094,7 +1094,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 10:	/* CMD10:  SEND_CID */
+    case 10:    /* CMD10:  SEND_CID */
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca != rca)
@@ -1116,7 +1116,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 12:	/* CMD12:  STOP_TRANSMISSION */
+    case 12:    /* CMD12:  STOP_TRANSMISSION */
         switch (sd->state) {
         case sd_sendingdata_state:
             sd->state = sd_transfer_state;
@@ -1133,7 +1133,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 13:	/* CMD13:  SEND_STATUS */
+    case 13:    /* CMD13:  SEND_STATUS */
         switch (sd->mode) {
         case sd_data_transfer_mode:
             if (sd->rca != rca)
@@ -1146,7 +1146,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 15:	/* CMD15:  GO_INACTIVE_STATE */
+    case 15:    /* CMD15:  GO_INACTIVE_STATE */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->mode) {
@@ -1163,7 +1163,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Block read commands (Classs 2) */
-    case 16:	/* CMD16:  SET_BLOCKLEN */
+    case 16:    /* CMD16:  SET_BLOCKLEN */
         switch (sd->state) {
         case sd_transfer_state:
             if (req.arg > (1 << HWBLOCK_SHIFT)) {
@@ -1180,7 +1180,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 17:	/* CMD17:  READ_SINGLE_BLOCK */
+    case 17:    /* CMD17:  READ_SINGLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
 
@@ -1199,7 +1199,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
+    case 18:    /* CMD18:  READ_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
 
@@ -1244,7 +1244,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Block write commands (Class 4) */
-    case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
+    case 24:    /* CMD24:  WRITE_SINGLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
             /* Writing in SPI mode not implemented.  */
@@ -1274,7 +1274,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
+    case 25:    /* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
             /* Writing in SPI mode not implemented.  */
@@ -1304,7 +1304,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 26:	/* CMD26:  PROGRAM_CID */
+    case 26:    /* CMD26:  PROGRAM_CID */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1319,7 +1319,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 27:	/* CMD27:  PROGRAM_CSD */
+    case 27:    /* CMD27:  PROGRAM_CSD */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1333,7 +1333,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Write protection (Class 6) */
-    case 28:	/* CMD28:  SET_WRITE_PROT */
+    case 28:    /* CMD28:  SET_WRITE_PROT */
         switch (sd->state) {
         case sd_transfer_state:
             if (addr >= sd->size) {
@@ -1352,7 +1352,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 29:	/* CMD29:  CLR_WRITE_PROT */
+    case 29:    /* CMD29:  CLR_WRITE_PROT */
         switch (sd->state) {
         case sd_transfer_state:
             if (addr >= sd->size) {
@@ -1371,7 +1371,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 30:	/* CMD30:  SEND_WRITE_PROT */
+    case 30:    /* CMD30:  SEND_WRITE_PROT */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
@@ -1386,7 +1386,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Erase commands (Class 5) */
-    case 32:	/* CMD32:  ERASE_WR_BLK_START */
+    case 32:    /* CMD32:  ERASE_WR_BLK_START */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_start = req.arg;
@@ -1397,7 +1397,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 33:	/* CMD33:  ERASE_WR_BLK_END */
+    case 33:    /* CMD33:  ERASE_WR_BLK_END */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_end = req.arg;
@@ -1408,7 +1408,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 38:	/* CMD38:  ERASE */
+    case 38:    /* CMD38:  ERASE */
         switch (sd->state) {
         case sd_transfer_state:
             if (sd->csd[14] & 0x30) {
@@ -1428,7 +1428,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Lock card commands (Class 7) */
-    case 42:	/* CMD42:  LOCK_UNLOCK */
+    case 42:    /* CMD42:  LOCK_UNLOCK */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1451,7 +1451,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
 
     /* Application specific commands (Class 8) */
-    case 55:	/* CMD55:  APP_CMD */
+    case 55:    /* CMD55:  APP_CMD */
         switch (sd->state) {
         case sd_ready_state:
         case sd_identification_state:
@@ -1474,7 +1474,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         sd->card_status |= APP_CMD;
         return sd_r1;
 
-    case 56:	/* CMD56:  GEN_CMD */
+    case 56:    /* CMD56:  GEN_CMD */
         switch (sd->state) {
         case sd_transfer_state:
             sd->data_offset = 0;
@@ -1518,7 +1518,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
     switch (req.cmd) {
-    case 6:	/* ACMD6:  SET_BUS_WIDTH */
+    case 6: /* ACMD6:  SET_BUS_WIDTH */
         if (sd->spi) {
             goto unimplemented_spi_cmd;
         }
@@ -1533,7 +1533,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 13:	/* ACMD13: SD_STATUS */
+    case 13:    /* ACMD13: SD_STATUS */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
@@ -1546,7 +1546,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
+    case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
         switch (sd->state) {
         case sd_transfer_state:
             *(uint32_t *) sd->data = sd->blk_written;
@@ -1561,7 +1561,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 23:	/* ACMD23: SET_WR_BLK_ERASE_COUNT */
+    case 23:    /* ACMD23: SET_WR_BLK_ERASE_COUNT */
         switch (sd->state) {
         case sd_transfer_state:
             return sd_r1;
@@ -1571,7 +1571,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 41:	/* ACMD41: SD_APP_OP_COND */
+    case 41:    /* ACMD41: SD_APP_OP_COND */
         if (sd->spi) {
             /* SEND_OP_CMD */
             sd->state = sd_transfer_state;
@@ -1613,7 +1613,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
 
         return sd_r3;
 
-    case 42:	/* ACMD42: SET_CLR_CARD_DETECT */
+    case 42:    /* ACMD42: SET_CLR_CARD_DETECT */
         switch (sd->state) {
         case sd_transfer_state:
             /* Bringing in the 50KOhm pull-up resistor... Done.  */
@@ -1624,7 +1624,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 51:	/* ACMD51: SEND_SCR */
+    case 51:    /* ACMD51: SEND_SCR */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
@@ -1808,9 +1808,9 @@ static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
     }
 }
 
-#define BLK_READ_BLOCK(a, len)	sd_blk_read(sd, a, len)
-#define BLK_WRITE_BLOCK(a, len)	sd_blk_write(sd, a, len)
-#define APP_READ_BLOCK(a, len)	memset(sd->data, 0xec, len)
+#define BLK_READ_BLOCK(a, len)  sd_blk_read(sd, a, len)
+#define BLK_WRITE_BLOCK(a, len) sd_blk_write(sd, a, len)
+#define APP_READ_BLOCK(a, len)  memset(sd->data, 0xec, len)
 #define APP_WRITE_BLOCK(a, len)
 
 void sd_write_byte(SDState *sd, uint8_t value)
@@ -1833,7 +1833,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
                             sd_acmd_name(sd->current_cmd),
                             sd->current_cmd, value);
     switch (sd->current_cmd) {
-    case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
+    case 24:    /* CMD24:  WRITE_SINGLE_BLOCK */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sd->blk_len) {
             /* TODO: Check CRC before committing */
@@ -1846,7 +1846,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
+    case 25:    /* CMD25:  WRITE_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
             /* Start of the block - let's check the address is valid */
             if (sd->data_start + sd->blk_len > sd->size) {
@@ -1881,7 +1881,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 26:	/* CMD26:  PROGRAM_CID */
+    case 26:    /* CMD26:  PROGRAM_CID */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sizeof(sd->cid)) {
             /* TODO: Check CRC before committing */
@@ -1900,7 +1900,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 27:	/* CMD27:  PROGRAM_CSD */
+    case 27:    /* CMD27:  PROGRAM_CSD */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sizeof(sd->csd)) {
             /* TODO: Check CRC before committing */
@@ -1924,7 +1924,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 42:	/* CMD42:  LOCK_UNLOCK */
+    case 42:    /* CMD42:  LOCK_UNLOCK */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sd->blk_len) {
             /* TODO: Check CRC before committing */
@@ -1935,7 +1935,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 56:	/* CMD56:  GEN_CMD */
+    case 56:    /* CMD56:  GEN_CMD */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sd->blk_len) {
             APP_WRITE_BLOCK(sd->data_start, sd->data_offset);
@@ -1987,29 +1987,29 @@ uint8_t sd_read_byte(SDState *sd)
                            sd_acmd_name(sd->current_cmd),
                            sd->current_cmd, io_len);
     switch (sd->current_cmd) {
-    case 6:	/* CMD6:   SWITCH_FUNCTION */
+    case 6: /* CMD6:   SWITCH_FUNCTION */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 64)
             sd->state = sd_transfer_state;
         break;
 
-    case 9:	/* CMD9:   SEND_CSD */
-    case 10:	/* CMD10:  SEND_CID */
+    case 9:     /* CMD9:   SEND_CSD */
+    case 10:    /* CMD10:  SEND_CID */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 16)
             sd->state = sd_transfer_state;
         break;
 
-    case 13:	/* ACMD13: SD_STATUS */
+    case 13:    /* ACMD13: SD_STATUS */
         ret = sd->sd_status[sd->data_offset ++];
 
         if (sd->data_offset >= sizeof(sd->sd_status))
             sd->state = sd_transfer_state;
         break;
 
-    case 17:	/* CMD17:  READ_SINGLE_BLOCK */
+    case 17:    /* CMD17:  READ_SINGLE_BLOCK */
         if (sd->data_offset == 0)
             BLK_READ_BLOCK(sd->data_start, io_len);
         ret = sd->data[sd->data_offset ++];
@@ -2018,7 +2018,7 @@ uint8_t sd_read_byte(SDState *sd)
             sd->state = sd_transfer_state;
         break;
 
-    case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
+    case 18:    /* CMD18:  READ_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
             if (sd->data_start + io_len > sd->size) {
                 sd->card_status |= ADDRESS_ERROR;
@@ -2049,28 +2049,28 @@ uint8_t sd_read_byte(SDState *sd)
         ret = sd_tuning_block_pattern[sd->data_offset++];
         break;
 
-    case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
+    case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 4)
             sd->state = sd_transfer_state;
         break;
 
-    case 30:	/* CMD30:  SEND_WRITE_PROT */
+    case 30:    /* CMD30:  SEND_WRITE_PROT */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 4)
             sd->state = sd_transfer_state;
         break;
 
-    case 51:	/* ACMD51: SEND_SCR */
+    case 51:    /* ACMD51: SEND_SCR */
         ret = sd->scr[sd->data_offset ++];
 
         if (sd->data_offset >= sizeof(sd->scr))
             sd->state = sd_transfer_state;
         break;
 
-    case 56:	/* CMD56:  GEN_CMD */
+    case 56:    /* CMD56:  GEN_CMD */
         if (sd->data_offset == 0)
             APP_READ_BLOCK(sd->data_start, sd->blk_len);
         ret = sd->data[sd->data_offset ++];
-- 
2.7.4


