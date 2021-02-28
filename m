Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FE327427
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:34:53 +0100 (CET)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRq8-0005ot-BF
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl1-00004u-VA; Sun, 28 Feb 2021 14:29:37 -0500
Received: from mail-dm6nam10on2083.outbound.protection.outlook.com
 ([40.107.93.83]:7764 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0003Ax-J3; Sun, 28 Feb 2021 14:29:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL7MJcquxIgzUT+LDKxTCDQ3/6Qv1rZGt3Z9WtCqqkg/ZIzjm58U/nuQUbnfc60GASylmDyZZ5d/FvBrvb7UXK6JXIBd9UKXm9PEAS8W5qxrXzbOV0bu2kM/yoUxH6UpHFuCdIJvk9/8/Wu3xTouNaV5pJL/P16vYCwzhUgaPC32bEQmVyAbmDISoYe2j/3BfPAx0dwQDKcpaW6PDaxWsorkqAZSOtCmLbA8WDOamycmCGupXE2fHR0DRuFU8X+PNAdggI2/CnmF3ktsbvmxfED7rVpCYEH31lwZOBMJwt/wppouhrzjZZD3ERv6mmXIkrVeMY8wm91WFTVKjFpK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJjid8O73JbjGuZhgnVYVSjPII4cATb/znl6qcWgJLE=;
 b=WxHJRa4mbb/VuprHNaOPumNRUvkl+oOfOZWQnrPBQY0+ucTtQHDBELkYG9oGpDVKgk9IvClYL1FmE6ufR+/nkE2oKdoF0tpYX8v2sEVpbjM0PUSNb3TGe6+gqI2tZLpNCPp6SUTB81K+Fh1TmCJUdqJlwgGcxF7yaezeNHGG/39XHrA5N4O0XyVK4ILvuzkoOA31ivh3zA3M9m9cW/SFEWhbNgnTpwbwmtcNGY+P+XR8wxsvGolKCebO4RgbeSaoPfDVJSuaqdrL/XcWSGePvFwIPR6PKQyOybkxm4TlsORbny/DBpC2asYZ7DeEHx9bpmrBdCI2etEqvRSFq4i9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJjid8O73JbjGuZhgnVYVSjPII4cATb/znl6qcWgJLE=;
 b=R0q5fAifWLK1BNfbFQnB8EgYR7kbNEpz0FoaaBRmNrAHKW4CdQxyhbJw7/nMByYAaTm2sedtfYCOLd2uYalP4xbjHhQqCeLTXHa96uUazdZftj0/sT7XcQQ9uVJoyqjDmxuIJw5rjVEFC/xvJfXDGovuxrkrBp6VyqgW/MBeXcQ=
Received: from CY4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:903:33::31)
 by BYAPR02MB5445.namprd02.prod.outlook.com (2603:10b6:a03:a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Sun, 28 Feb
 2021 19:29:27 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::19) by CY4PR03CA0021.outlook.office365.com
 (2603:10b6:903:33::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:26 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:16 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:16 -0800
Received: from [10.140.6.35] (port=57760 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRki-0008An-Ba; Sun, 28 Feb 2021 11:29:16 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 5983E13C089C; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 03/21] sd: emmc: Update SET_RELATIVE_ADDR command
Date: Mon, 1 Mar 2021 01:03:09 +0530
Message-ID: <1614540807-30686-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13aa54f6-fbec-4ee2-a77a-08d8dc1f2917
X-MS-TrafficTypeDiagnostic: BYAPR02MB5445:
X-Microsoft-Antispam-PRVS: <BYAPR02MB54459D798ABD1CAD7064CDDECA9B9@BYAPR02MB5445.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s5bFa6DT8nZFK3NygKB23Itro4DMj64+6QWnK9L3x7zcwr753qQ0auTEO/7i4cKnvr8cQ9n0O/RuzAQkJDBkA2SGaTsTKTLKVijUY/Vl9hLP1jkBq7Gt52L+qmbXkPzhupbvlJI9GiSKybR0pVH3TRO73y3H5WyVic65RRzpsHzMNE435ISU3prPX9FwUpYFJsD5PmvswVQsU5qBwSJ8YV0hi7iX0/Sn1Y7zJr/fdKAOlUBwteySyQFIFRTmv5NbCq6rzT8LXW61dspcB7JVqDOrC/fskIh4ZobvKN4jZm0V8VNHngJH1Xu2KTa/EvvBzp9MLXqdTKRXyo2fK8IBV4oP5QAfFGBHnXSKsQfJU7oJXLdFMDdvvbYUgIjVLQWCEbSmdYrbJ8StS7PSrLznyaVa52/B5+omuUmQQO3xzWTUU1QyMF6mO+48vNf8+HACFZ9GlUDLBD0ynUwXOWGtJuC0EaamWvKDzp3Zc0cQ/NJSJWnlkySD3C/+vonCqvMr/uiYc7W2S7nA793bR4jKeoWvzeGDvHBkfDjWv1U2TWZxssLXJ3UdAJvYyKIbxON/CVI8F9OZwj0AK5U5LcACAE4pd31WUDT7NqyaED589BbNPtI2ue/LUyJVrLfW+XVwSsAIY15NDFoOGS6g0dO+an6GF6WlWAVGj11U5A81zlTTciB0PIMRvYZQt6iM2BronJ5cG/Z+aPrLG5D8Tjvq5A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(46966006)(36840700001)(42186006)(8676002)(70586007)(2906002)(70206006)(82740400003)(921005)(316002)(478600001)(4326008)(107886003)(82310400003)(110136005)(54906003)(6266002)(36906005)(7416002)(356005)(336012)(2616005)(5660300002)(7636003)(426003)(83380400001)(36860700001)(186003)(8936002)(47076005)(36756003)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:26.3808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13aa54f6-fbec-4ee2-a77a-08d8dc1f2917
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5445
Received-SPF: pass client-ip=40.107.93.83; envelope-from=saipava@xilinx.com;
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

Change SET_RELATIVE_ADDR command to assign relative address
as requested by user.

Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[spb: Split original patch series]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a23af6d..6de414b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -436,9 +436,13 @@ static void sd_set_csd(SDState *sd, uint64_t size)
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
@@ -984,8 +988,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         case sd_identification_state:
         case sd_standby_state:
             sd->state = sd_standby_state;
-            sd_set_rca(sd);
-            return sd_r6;
+            sd_set_rca(sd, req.arg >> 16);
+            return sd->emmc ? sd_r1 : sd_r6;
 
         default:
             break;
-- 
2.7.4


