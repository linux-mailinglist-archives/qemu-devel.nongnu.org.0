Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1009465227
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:53:54 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRvd-0003XI-Lf
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjP-0004Sp-Fz
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:15 -0500
Received: from mail-co1nam11on2080.outbound.protection.outlook.com
 ([40.107.220.80]:60832 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjN-0000b6-3k
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljI6DP/AcKNalHAlMewEx14rhK4jL3OCqFTga5mtmGTB1xk1xbgaxNDnvJvqWMi31YhSXVnilz896gK4LQ0btJnAwsZPuniXzuW2a8EaubgAgrLWTYkxHVtJCDIxf6736KD1Ay5bnTtAKnIdCvlcVbTg8qnw73wcqWIAqKjlfKdTE3xUQ8Rq9ULT0+KzTwuoveIEEjtQZZbS/DKSHrBiu3bgGqXiKtsdqn4D8qLDNroJ9uLq2uZ3rZGTqSyt4YoxeNxMbHNfR6n5IGbBlt+AYFx4rldf40s3r2sCVi47KaRwufGmU4vvQlrMqgt6nhTWNt/Pp21lpUxA/dJXYVad/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG56paUEUQSNgKtG6lfjB7z6mYRCHRZp9xSm+nQxZEg=;
 b=fA6gV0P3VnyczomjbcOumFBQjfFHR9yHxqTeaP4QtT2gBzFJNv+i0kqGAGLLJ6lHfIi0RizhhJ3eqegJmLCIN4smLaP5G0A5pBBFXm/qg6jrW3XWbjaBr//yuvVcnDnda60n+tuOkS3SskTPxp+bv1+HV1G8ElFpHyVWx+CeiCukzsF5JFUnrxSdxD+uHbBSRBidz8vHVCPgkGht6UsY/rWN7Hz+x6bVE6OL2V9/bBaSbxNK2ldtIQBu6O7o3GB3iH0Pe0D3yIt/K7KdiTseHrcDwRWUt1bDblxzro/juSyZ9j+yOBTCyGewd9J+pWyNUgHNQz4b7g/IodJNObMAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG56paUEUQSNgKtG6lfjB7z6mYRCHRZp9xSm+nQxZEg=;
 b=NPvTGc7QzU4xOmQ0QknPEgyO8+zbjuq+VjkJQ7rQw/dHudPkK+R6bodNYSOuLUp0cC3yKuNU65zs0hlKfEdeRdAIz+jkAkKGfqJHWlSz8gohp+Eh0Cww9NDNrpxfLro2h47sEihGCAOJs5O1UwYELn5/tmTGl0NLet9BM10FOZk=
Received: from BN6PR2001CA0002.namprd20.prod.outlook.com
 (2603:10b6:404:b4::12) by SA1PR02MB8605.namprd02.prod.outlook.com
 (2603:10b6:806:1fc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 15:41:09 +0000
Received: from BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:b4:cafe::8) by BN6PR2001CA0002.outlook.office365.com
 (2603:10b6:404:b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 15:41:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT024.mail.protection.outlook.com (10.13.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:41:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:45 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:45 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRiv-0002FY-8v; Wed, 01 Dec 2021 07:40:45 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 10/11] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Wed, 1 Dec 2021 15:40:22 +0000
Message-ID: <20211201154023.13931-11-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a3e4094-d986-44e3-2f3e-08d9b4e0fece
X-MS-TrafficTypeDiagnostic: SA1PR02MB8605:
X-Microsoft-Antispam-PRVS: <SA1PR02MB860542F9E81541648D0759B0AD689@SA1PR02MB8605.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HG6OdmVc41t0CvIMHdPi39Lqyi7rfiRFtXASRoSRK6cGkTzSrXE0UVbug7ygKsibFTq7hft1XcrIp7tJpHFpePObjAZFR3NEc2x4OgmMZzQ2+f9TuhDzcpmIlSLiFj+IYkGdnp6S76e/Wkpk4yFtgExItOLCeZgYY5Dmjr0T6LYg5rJ9pjcVLkMG0SxJRZ3xzBKIqSYdAwIk0n6llYHcoxe6NuvDonSl1x8TTJLJDZHQ2opw/J02GrB+kUa2ClfAYBdwQ9b4ycXsv5nDzlo9HSKiY4lXbjddJv/LaK/XOUJLOBoG1xOCvNQLUezuXa75vI2etF6232BJR20RMwiijYQN8ayZrmyIFRR9Yp6AHBQ39pzUcj43B9lbs2r19eeiZ1oEfkTq4I9XIIbsYfQx3fzv2FpIWaCJ8KuXxdSks6SI1OdC/CLGq70bkecVc3dGdo8WwGzp9IE8m9vVwgi1FCqvnd5mHaufaig+x0Gkui3uQmiCj4pBBANkgo4LoEVyvjmHW3AhvxOHZGY2b43/GJ6PCiFguh6WnGmuCd8YPbIG8OCT7Ju2ZOTfXxcNPXMeyLHe7kxl72ZaYuAgdoSqPVWpQmIg5dQOl1ixzOavUE6UqXK3eJz+QShUxx4ZOhOediAFn8uhVyTT8y8PIPZ5nHDlHhTVz4PlB/EHS4AYC3x5oUHSfPXi/p3y0jDtcBMU2NsTJiRl6Gj2rZfX022LrrOi8Pa07YnfVa2/4NFLnA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(9786002)(1076003)(4326008)(44832011)(82310400004)(316002)(5660300002)(8676002)(2616005)(7636003)(8936002)(54906003)(6916009)(70206006)(7696005)(70586007)(336012)(6666004)(186003)(26005)(36860700001)(356005)(2906002)(508600001)(426003)(36756003)(47076005)(4744005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:41:08.8829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3e4094-d986-44e3-2f3e-08d9b4e0fece
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8605
Received-SPF: pass client-ip=40.107.220.80; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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


