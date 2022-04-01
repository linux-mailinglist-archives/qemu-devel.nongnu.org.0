Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A744EFBBE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 22:41:22 +0200 (CEST)
Received: from localhost ([::1]:48808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naO5A-0001qW-Vg
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 16:41:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1naO2p-0000UG-Gl; Fri, 01 Apr 2022 16:38:55 -0400
Received: from [2a01:111:f400:7eae::612] (port=28897
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1naO2m-0005Jz-Sq; Fri, 01 Apr 2022 16:38:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPuz/9cW95gpZVbQgHvvq8VgDa/yhfZCYN8dIjHFcoGR8RX5lD69KzHFnugx31Bjqk5A9VP8REAm0q3GCwdmhWr1lmUm74WCyhr86sE7mkRh+kDy/NPJ/ixihnYKXqtBKwtYQCt0SfoF8cFbCGW7CZu/N/aPXqqkHCL5cLPu20iulcOE2dJhJh5yNIMhPPdE4yt7lZwyGAeQ+C0wUsE0QFdQMkZOYV10DgneMTugGt12TtYCJqbhq+EfQsYZziFmjFuA79TBwgBITYWI6ViVW3e7c1l7N3wfTIrWyu8/vjz9GdW0Ktk7KxsJpC1EJyI444CIEeaCGdZ05QLND74LCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Oi7GzghZDoIVt5nTJbThLbZn1qRtPhgapwHTUJ5q1c=;
 b=V/1FJ+1h1n7txnCMLrQhSVxdJX85Ytucg8SFoIWp0A0Q16Y/SkpcCodxfN7eAPGYsBqa8coTJMiPPc8FV3Q9nAWxaTiUpEuXVu5GCgkJenj5V9EM409OrcTewcpOojHhgGmbkHskxCAp2t4To2GSp99bIHiFbkxjWvtunUTv83KSaNtvvQOWr3La/Z9i5NxtGiQpHFsHukuc80RiujNv9qDZsuP0UR4RPlRiNoVM/Ms0qSS5t7gB4jFjBpSBWkyOX3g0Dsdwn0US05CwOef2GWxmHAMfZXvQAqUQnVo5m9V4xE3qSP4Pj7t/y8TeQ6L2P1oGouIRftEuAWR6DKwVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oi7GzghZDoIVt5nTJbThLbZn1qRtPhgapwHTUJ5q1c=;
 b=O8r1RTOskLrkuYCVABh4gb7keQM6jAmjNRckicVrAHY8HAOEu4QNJqQasBLHyrNjImPxkFL963F0kOd3sIArjM+eIgLoZ1SWfh8c1z5QUiQmOJ0XqgWnQe3tRMvzXtvkEPEw8sRGuZoRXSXrUIQ19JMX56EmJTwNQIiayuAQoak=
Received: from SA0PR11CA0105.namprd11.prod.outlook.com (2603:10b6:806:d1::20)
 by MWHPR02MB2335.namprd02.prod.outlook.com (2603:10b6:300:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 19:06:33 +0000
Received: from SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::c9) by SA0PR11CA0105.outlook.office365.com
 (2603:10b6:806:d1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28 via Frontend
 Transport; Fri, 1 Apr 2022 19:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0052.mail.protection.outlook.com (10.97.5.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 19:06:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Apr 2022 12:06:31 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 1 Apr 2022 12:06:31 -0700
Received: from [172.19.2.40] (port=36786 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1naMbP-000Fiy-Rr; Fri, 01 Apr 2022 12:06:31 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 1/1] xlnx-bbram: hw/nvram: Fix uninitialized Error *
Date: Fri, 1 Apr 2022 12:06:31 -0700
Message-ID: <20220401190631.1697408-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401190631.1697408-1-tong.ho@xilinx.com>
References: <20220401190631.1697408-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc71950f-0ed9-4534-cdfc-08da1412bc17
X-MS-TrafficTypeDiagnostic: MWHPR02MB2335:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB2335156C608EDF1469A3DDDFCDE09@MWHPR02MB2335.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtrfuHoDyt/nPkFxSvuUhuCijwB9z0xXPMmD9/k2sXldk3pAq13XEzLAUyl8wpAUbIOmFrACOaBfHTHOP7kWc2TN5LBS/stJ+nleXKn1Toy2Xey0BxLBVULvLT13Vbvf7u01rqzBXHlOwGSsP+qoFJVKmI6nntPXzB2hnJd25r4QOcv7sG/evQPfE2pjtIgy3/05x76wgXDx97oAEeL4o6wlKXwUuZk41O3zqvTBofONa2cQBHl+28dUazu/eztCXDDJxgdZmvpMJcbnqZcep+qknJljD6i2Fs3PDf4OePwdVdR2NtKZGCuKLoxgp/209ZtXG/sj70mRj+Rq5FDk0HxSpCgRBxiG079ET917EquZkirn+qUzNPwHhcXckioLgY/NupUfJZsqIIjMkXKdrRY29Sj0x2XRSOuv8EZYKzC9g+pug8TMMTJgc1jeL0Hek6mXOaYKkE+wL62TsGohFcssax3xk7S036G5gvPl0jOGZA7K9hR6OYaHOwduGsUsU8quLpPpSybU6SeaQG9DGox5fnhxvYV9Ri2z8+a0rwf1VU7OM367fBh8tjLk2oxlxlag23ydcnDefF2g3ysbEThHNchDIJzUQpu4yPx5Ihbmmb4sBZvCW+dU6ByXDhIUEx6GdzVsB7bbV9pqIXx+Ee1OHcU6fTOnUfFEFBpJpGRohDsbFPBg6cjzXJqvrScrd2k1OFDHRt608fXPvg/8kg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(54906003)(7696005)(36756003)(107886003)(2616005)(508600001)(6916009)(336012)(186003)(316002)(40460700003)(26005)(83380400001)(426003)(1076003)(7636003)(8676002)(9786002)(36860700001)(70206006)(4326008)(70586007)(47076005)(8936002)(82310400004)(2906002)(5660300002)(356005)(44832011)(4744005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 19:06:32.3208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc71950f-0ed9-4534-cdfc-08da1412bc17
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2335
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7eae::612
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7eae::612;
 envelope-from=tongh@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This adds required initialization of Error * variable.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/xlnx-bbram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
index b70828e5bf..6ed32adad9 100644
--- a/hw/nvram/xlnx-bbram.c
+++ b/hw/nvram/xlnx-bbram.c
@@ -89,7 +89,7 @@ static bool bbram_pgm_enabled(XlnxBBRam *s)
 
 static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
 {
-    Error *errp;
+    Error *errp = NULL;
 
     error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
                      blk_name(s->blk), detail);
-- 
2.25.1


