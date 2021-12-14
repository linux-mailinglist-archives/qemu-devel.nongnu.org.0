Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B88474167
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:23:30 +0100 (CET)
Received: from localhost ([::1]:57258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5u5-0000e3-6l
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bi-0007ka-Sl
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:31 -0500
Received: from mail-mw2nam12on2054.outbound.protection.outlook.com
 ([40.107.244.54]:12864 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bf-00071w-UR
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZwxXsVFOAGM5XSDa24kIeR194PxhDj0oFbXIVzPegG8cr9+i2DJXMlDQCHAKgk7UcmipqixbEgN5TGNR3UAAdZgY+HYDfWB1R8geoh60aN3rzwoxxbJ2tHNy/a10aFRnZKSKbehFG6Dc0D8Xt+F8cMfFT6aSydrvlPYsH1aifJ0t13jTrylxorTUtFF/gAsD9PjeIF/GDlXFImwaIwEwsBYOg4KG4tIHJsFFpyTSJdRb9kPYfmyZphPQxhMp8gMtvhYjQLqxfJ3AZyExCTnGPxc4NG+aLnrJVYTunIpaxPLB8bhoE1LDqK9oeVBYY2uKD8O4KZrAzaMc74MD+EmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+wmxUcUFeFS4sYr1jolFjEoVHPn/tFn1JE/CDH01lw=;
 b=la/tdA6o8PFH+zH0bl3MrJP+AvxbhVcOTYvHkrAwgP/ZKaUTTZX9GPPFi+8jM6CtkpcxbkRstEsecWM7i3r0+MDFg+dn10D2lwanOdQzdgZ31/WPkzH12J1I0Xv5SsZBXZPcSxp087CsC91jUFhUgBPVtwKK6DPGdzpf/qEO+uadIARYRN3+aIGN7YhfPmsCjlVKWVpqnowIwdHC6R06Vk2bFzsc4Bhg+wBbQf+yl2B9jnvpBNv4WKemanb8Qrw07/HGyHna+/c9AdcE4ffr7UHirGXiln6CEYfWsiD378Bsy57repgJpE+pPXUxzkDxSbOt8aqNRuXRwSgW50uhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+wmxUcUFeFS4sYr1jolFjEoVHPn/tFn1JE/CDH01lw=;
 b=AtJx8xO2OBDqt2i+/qOkFWalSrPoQGzz8Nm1QjFkbcVAxlR/M7avPNKaJohqn2HFXHN6zQPi3S62wNGv/kN/e5Wb/AZWAKuFT4jvQsRt3bt858nb5pRy2TaszDejqQ4ua9ZJTDRvFsHY+Jm1OTKf6p9O/aCBx9iwIcdHVRRvaHk=
Received: from DM5PR15CA0057.namprd15.prod.outlook.com (2603:10b6:3:ae::19) by
 PH0PR02MB8825.namprd02.prod.outlook.com (2603:10b6:510:f0::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 11:04:25 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::87) by DM5PR15CA0057.outlook.office365.com
 (2603:10b6:3:ae::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:17 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bV-000F5K-6t; Tue, 14 Dec 2021 03:04:17 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 11/12] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Tue, 14 Dec 2021 11:03:53 +0000
Message-ID: <20211214110354.21816-12-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbe9ec67-7c62-4199-0176-08d9bef17daa
X-MS-TrafficTypeDiagnostic: PH0PR02MB8825:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB882589D44CCB7059DB8C2BA3AD759@PH0PR02MB8825.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4ilLwXDoCRG6MZfy9CsWgd6sb0ibigubPveWK/zRQxGp1J6EJpPZnkXXJYFjRizdl2pmdQ1OBwKK3+3uJFzhmiqz+zasBTlkXM4iEavVpEl85VHpqrHiMLo87JPmAp/IjzPWRpSatEsivgUZIdj1+euDoVzkXYJGNXyWVSYx7XcBDFaLv73Bb6cgLbjpXkRjY8tSw1jfUUQLyAepVeA/8++tQg5OppQsFilkGtfXFBPAJVRpdHO61giJCqGgQvq3cBmmWxapnblNPb/6MiKFdcLXzX8LGcR5k2nn7zXv78a+54nrYcSmGEGYghFvtngbNm38BQoplW4t0OKX4TPeuQIl5zaIqR+Di/KZZXtfSm07UOJqOTODW59FRtjNCmgvgqSlaGRbHRd4gbERQQixyiXKIK8ZyncErXuk9wikSU12Cfhdb7StzPUJThUO6LfAptz/hoEd7BHWW1jCjnXJxdhWonDnFi7jarC8k6ZzCQQsGmZb6cYeG6m4HTlB7rau9mlA8edrd0kLh4/EXPY4DE8ninr3S52wlylpUS0i6XzR0vwEuW9s2BQVdiZUse9HvhoKk9JCsBhgvZgI9D1EJ7jEheBnOwRJH84Az/l3b4/P1/UFwmrPkZciwTSgId9TAXI5mo2oGmrvT1lEQFEe2jZlVk8Bx/ajbeiQYDj++81uqfkhInpXtyOE9gMdJtK42XYeskv+FyElzXsboU9XccvoNJ73ztlJbSZLy170gs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(9786002)(47076005)(70586007)(4326008)(8936002)(5660300002)(82310400004)(4744005)(6666004)(7696005)(7636003)(2906002)(36756003)(70206006)(186003)(54906003)(6916009)(1076003)(426003)(336012)(356005)(36860700001)(44832011)(2616005)(508600001)(316002)(26005)(8676002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:25.3387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe9ec67-7c62-4199-0176-08d9bef17daa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8825
Received-SPF: pass client-ip=40.107.244.54; envelope-from=figlesia@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

List myself as maintainer for the Xilinx Versal OSPI controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..e52cc94840 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -963,6 +963,12 @@ F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
 
+Xilinx Versal OSPI
+M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+S: Maintained
+F: hw/ssi/xlnx-versal-ospi.c
+F: include/hw/ssi/xlnx-versal-ospi.h
+
 ARM ACPI Subsystem
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.11.0


