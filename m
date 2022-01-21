Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AA4962AB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:16:28 +0100 (CET)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwaR-0000MY-2L
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWr-00064f-IH
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:45 -0500
Received: from mail-bn8nam11on2073.outbound.protection.outlook.com
 ([40.107.236.73]:24608 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWp-0006Ad-4i
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqdFDfUeAmv64IZir6eo+7fNQdeyvKPrJzBuFuaj2Ho3P3VYwc5LzKQvEDs5HWg+8hf2MIGTt2pGl/ZPLX3b/DlXPzfevMwzb0V4ZTjeGBbSaJ8L4v/YBl6YOWiQmBg/6kYPazQNBkZO3jfesZ3OSRFBF+wceR9Bk/lTWf4vdmxZoS4zeGYL6P2Ye8y2QE6tpAd3EWcfS51Zc51JsSausDtTeq5wP6woMsHliKnVVf3CaokSviOowIKZwmFcqv1md+jPm1+Z+mnEmpETLn4wWGKpYVGb5d2B7Q8C9vRuFJoTkuHLbX36Jn2LZFy8RuOQ8LyfKn5hsnmz9cQJbsBAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgBZZmHiI+gh9qnUiX4TjNCl/hNY4K4uVyberFDnN5g=;
 b=NOoysYWSbiqQ3EwXzqkvQNtJYaSBZlQKCk8c05eG3kqDnrMyEiF1Z/bLNdQt/HeuIq7dsI9VCr/ckOhr7/eG65hEHth1Niy3SSqlW8RhYAbUCx1P0huqVlx+TwZNh2DwFDWOWOW7bcaI4zAiv9d5e+zsMsKoCY4DtwD9nnjS/+oA9pvrEJLzKxiIHhTSXLtJXeRkieXCQNgIcdOFJTuAYez+7y40xwsf2ceoqn8hUs3EteRvWPrGICNK0QTD879SSe4c8m9zCqg1ysRt66I1XMe7waG51OmdQHxO8X1EEhXlkJfcazJMsRHoXb4fBnPKWLFcoo8xys/1JXW3OgtEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgBZZmHiI+gh9qnUiX4TjNCl/hNY4K4uVyberFDnN5g=;
 b=k0SAerh9XRbjCDUBenkkX45kEYTRAWHwiD0AYi/b/RlGIGlXN2ygga7hrQttJUY13Iqv/RQpju2yjdgJqCktz70PoU5YTkX/BykFDXnUvbLQ7t+SA7Ey3DEs0T0mMCCO15+1L0FnNTxpQ/Fh4j8FrSkcQGGE5OfzxBSbhPsrX0w=
Received: from DS7P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::20) by
 PH0PR02MB7176.namprd02.prod.outlook.com (2603:10b6:510:1d::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Fri, 21 Jan 2022 16:12:41 +0000
Received: from DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::d3) by DS7P222CA0021.outlook.office365.com
 (2603:10b6:8:2e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Fri, 21 Jan 2022 16:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT027.mail.protection.outlook.com (10.13.5.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:12:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:12:11 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:12:11 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwWC-0002nH-Lw; Fri, 21 Jan 2022 08:12:05 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 10/10] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Fri, 21 Jan 2022 16:11:41 +0000
Message-ID: <20220121161141.14389-11-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e55428-1b54-48a8-0515-08d9dcf8d95a
X-MS-TrafficTypeDiagnostic: PH0PR02MB7176:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB71767C89917AB8BE82FB8DCEAD5B9@PH0PR02MB7176.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjJdLn+y8xX2KrFESPr2RgR2k0lp+IbE3bD09VpDjyRUUUMYbDp7QsDbNCdjFI8VUCTt9u+f9/rtqg79mH/FaXYfLUIc0pqICB57A97JIYFn8Ue/FIZMbrilw/pxJAwxK1RMxulKS3VmdPqRhwwfsxl438ZQLz3mGA3fMEoOqFNOlZ8acWSsEJ118moTtcnuzLRyrUUN7SNyFlJ6RhRURyyPfL3gvi/DtbbkWRYa2H2XboGt4OTTO/7BGuYtZI7apozd4CN+0dYeAYAXdCeaTxvdD1uUdbf/3+Nyr47f7oXopp3IIynQrHfNd0gWvipUhSr/L8xOOWv4C/TdEEDDfTG3zPMIxgWyiiETWTVzeoRP/GI7XtuZGhi4sAA7ND7pJhgr193vruMFSu49utco26fXWi5fa3bnIICW4qg5cdaa0Ccmj3t1lLDXQgGNPR7JAebWUuKk0FwnYSx77YNhzfbau6FMqC3E0p5u93NqlX59EPNlnhE/wN3uUW57OzfhkDnIchKGMtQs8KtjWPdvPwJkKNuSN4aGIX5aN87P7gAroGWkrOt51GgPDy+iR45QlbJmnAEU0r3Jr9ohRV+IyySeE6XnvRgq0ylEwCKfen5IHd38TGKL8m4YRlZnARuqSysoAtJ/gWnsiopNsjiqRMlUoA5PofGeA+b6l7XOnFhqYhHnxHGF/7lRoAUSMu1tx+6k5br/i6yjEPzqVPZN/+xa9aU1EeBoVj1oRYBce28=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(316002)(7696005)(356005)(4744005)(6916009)(4326008)(336012)(54906003)(36756003)(82310400004)(36860700001)(2906002)(9786002)(508600001)(8936002)(1076003)(8676002)(44832011)(5660300002)(26005)(426003)(70586007)(2616005)(186003)(70206006)(6666004)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:12:40.5410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e55428-1b54-48a8-0515-08d9dcf8d95a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7176
Received-SPF: pass client-ip=40.107.236.73; envelope-from=figlesia@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
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
index e4b3a4bcdf..6797a270e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -958,6 +958,12 @@ F: hw/display/dpcd.c
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


