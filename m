Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D834642FD0D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:38:05 +0200 (CEST)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTxs-0008QM-ML
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTva-0005vl-2T; Fri, 15 Oct 2021 16:35:42 -0400
Received: from mail-dm6nam10on2044.outbound.protection.outlook.com
 ([40.107.93.44]:4705 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTvX-0002zY-5B; Fri, 15 Oct 2021 16:35:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAabhwJaldT5BeOQaHtDTC7Bj4pWEliMnuftUWnmDxCJ2PpAWEJYI3ud+IkuP7f/Td+5es6mp1hYS+Y6q0NQ4RiuKz7GjcEzQ4yzM9EbuYUu0/OWfma+p5e4ZnmJw4OctqyUWTGIBTwgIPVOPwqsPmvq0FIUkA1MHFg3SZttKtZ944KTt/hIvRFtLBDn+fPwk/H/QB/g0N2Fw9c7JRYLkkkkBGM43SwkkUScMHUy60UEldc2ez+bWvgu3K73MDVXlGYX6YBMnpiMpA2DlpmF5n+Ds9xz2vp43yX0KrCdzlctasx6J6N7wq5PVNqECsje+skf6VX7ms4XBuEEVdxVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44ym02oqKCkHhcQYAEtpIr7L9jSE7pjBLKnT/tC1DWs=;
 b=KSqkClTZ4fofUjbc5o9IF+RhMr65obnyTyFvqdem9VUdR84QxZxjqrt/cYTZ4LxuxfisstDapzShFI7VsNclgsRaDCu2248lEJF4fZVf8fapGfmXJKXhvUWlV46c9eK542BFw6NaXIC3SpUM7b6wdkL6YQV+draqziXoRvmLTDgaQ/Py/mzVOZTi/dVRdCZbxeaUVIThWtCeVIizb7y9kIfoYNgopxfHBO0taJ4NctX8aJXsKenkBVUyShsZ12c1kCpOO9JRJESZtzCyBK9RucTKsQkzD7XTAciKBH4z48DF0yHWLkJ0/bCrjQXsKtHnzynvRgw+PgpPpRuQtVzKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44ym02oqKCkHhcQYAEtpIr7L9jSE7pjBLKnT/tC1DWs=;
 b=UPEZInA5KLXydTCDzcEqv7Sty40RuS61VdYnVia3bsENbFJRnQoauuIyG+nv//3pr5pwyQG7MlNUvguX7Ek3xIsj+fdHMKL8CU31pR1wN0MeqPqAh0Pz0VI30XxR3hwPehu62XefnmUosV9KPgnpR1SsryAfqCp7Eebda2OOMCo=
Received: from SN6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:805:66::23)
 by DM5PR02MB2777.namprd02.prod.outlook.com (2603:10b6:3:110::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 20:35:33 +0000
Received: from SN1NAM02FT0036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::e1) by SN6PR08CA0010.outlook.office365.com
 (2603:10b6:805:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 20:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0036.mail.protection.outlook.com (10.97.4.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 20:35:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 13:35:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 13:35:32 -0700
Received: from [172.19.2.40] (port=43112 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mbTvQ-000G9T-3v; Fri, 15 Oct 2021 13:35:32 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 1/3] hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
Date: Fri, 15 Oct 2021 13:35:30 -0700
Message-ID: <20211015203532.2463705-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015203532.2463705-1-tong.ho@xilinx.com>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19fee84f-6e34-44cf-fe24-08d9901b5635
X-MS-TrafficTypeDiagnostic: DM5PR02MB2777:
X-Microsoft-Antispam-PRVS: <DM5PR02MB27773140D626774E30C089BFCDB99@DM5PR02MB2777.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:43;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CVdDzguqj7J5gevlWTLAtuTyDD8JLtRodCjiKam6Gy5IGVBgiDiAVV91OLCVdhyDoOBPHwUDoZJYoPkpTs+fk1rhpcUwgXarm3CJzFrzKAu4XwB+8kz78x7VAtQPleDSzr41Hrxjt+zX6t9xSILoDhdfPdmmfCyjHDuhuOG5ivwFkNnmp4lDEUS63J5PCSMs+VD+qchfBBzDICIFMzX44eNfwlBKFYc1OEyZ0I7mY/+KG/+lNUQYPNu9WbPWP9wBJMdQR58y9vpbqPIRFjLvQMlYA8SZmHKswc1IyK9uU/94GqoUiIqS0dqxwaOehHW0NrsfPQaddvKpV+Q9/roATJSN/LG/1LuFGxWNP4rghp/uRinbhRhhmjNCg/WajzR8NVf/nihSNM/JDx0iI4vWTdvYmiQyJ7nwh8S7m4KjquXrdsF1z75NbNgti+N2FSTpTCfnUXfX1Wchn5Lbcdy0Zy0S9Xi++bNXWLrcQ3d7ujA6+MbwsyiDNKyBDT0DsfosCs+56h81X6lrCqURUOR+2AcnmcH7CcEVxONag2igbXlo92JyV7tBYls/mqTOYM+cPK0b7QXbSUIrW1BPCmC1OVec+eYkmbSzWUoRqIx8qnQ1KD+5rAAOnYWoq0dddAvuuOWXDHVz04HVjxiJGEYEs+kM9Yxb2Tc65ROwFuNFBN5ZO7mIOhNGkSWNZ76/2XHXTw3GrNEBOp7u1zK5WeIe4MX5Du7bbNGHkAqq9lqk4fQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36906005)(83380400001)(4326008)(9786002)(36860700001)(508600001)(82310400003)(47076005)(356005)(6916009)(54906003)(7636003)(186003)(336012)(44832011)(107886003)(26005)(1076003)(8936002)(316002)(2906002)(70206006)(70586007)(426003)(2616005)(7696005)(36756003)(5660300002)(8676002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 20:35:33.3721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fee84f-6e34-44cf-fe24-08d9901b5635
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2777
Received-SPF: pass client-ip=40.107.93.44; envelope-from=tongh@xilinx.com;
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/xlnx-efuse.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index ee1caab54c..a0fd77b586 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -144,10 +144,11 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
 bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
 {
     if (efuse_ro_bits_find(s, bit)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR, "%s: WARN: "
                       "Ignored setting of readonly efuse bit<%u,%u>!\n",
-                      object_get_canonical_path(OBJECT(s)),
-                      (bit / 32), (bit % 32));
+                      path, (bit / 32), (bit % 32));
         return false;
     }
 
@@ -202,9 +203,11 @@ static void efuse_realize(DeviceState *dev, Error **errp)
     efuse_ro_bits_sort(s);
 
     if ((s->efuse_size % 32) != 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp,
                    "%s.efuse-size: %u: property value not multiple of 32.",
-                   object_get_canonical_path(OBJECT(dev)), s->efuse_size);
+                   path, s->efuse_size);
         return;
     }
 
-- 
2.25.1


