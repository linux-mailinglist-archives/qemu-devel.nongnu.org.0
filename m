Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198332B8517
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:51:18 +0100 (CET)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTU5-0005q9-48
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1kfTS2-0004NW-2J
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:49:10 -0500
Received: from mail-mw2nam12on2080.outbound.protection.outlook.com
 ([40.107.244.80]:49467 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>) id 1kfTRy-0005Ya-W2
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:49:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9x975oHg5b9khGl1uIgER79QnCsYcID7K/AMO7yRlV3TBRUr+fFMNk/lN4z2D9GuF+PhxlcdvH4VE3WuiC80sSJqvU5xuJpJk42c5OKh7UkJ6sp9J6K67ajJJ1FdmlbhqsKgTta8+lxA9cw/mmK0M1xxyQ6e6pUT3acyzT7qYzm2AqLOdXNM40Ua3KhTiUnWEXpzGZKClodohltly4/YoYTnnBHlFVnZHauq/WJvPFN68sXoLmUAwWp1JoU9tT9alFHvmbbQ14xNM1Ce0cCEwlpsH56hI8mTPX2xFYe0vJtu3c1jIOTwJvAs/jFMmVDdURJ0sApPmZMe32cGaeLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzXBABBh3RN7rpqsrFWWBz9hU1S7g1JHE8nFHCOo798=;
 b=huCvsrphI37j8WX4ZqVLbd6wLaoB4Q4gRT2K7i8x47nZWrYkY7JM8EpoVhLKxZ2gFjE9X4zoglrCQ/HuEtjwElYYJS/rBelF/XHIyThcKTx69o09HZRkjpwnfY4iD1ErmpEt3b5L6+s8EMpuHMXOHcq8d4fmiqCGcub0XHzF0ga3XbVyWvwdgTLxA9IQxi4RcBf/Fvx2u+ZVy5DXDnO9WgBZ6F0jARawK/yGzXIPa0uW2x8gtzcdFp47mcXFQitwrD7FN/xptl4PJ7HpWu9MfjkvUEVM/jcxR5NneV1nTY1KYtdt4f8d9wT1PI6b7rAhAu4xUID4YQMZ4u2YwCEa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzXBABBh3RN7rpqsrFWWBz9hU1S7g1JHE8nFHCOo798=;
 b=oH4BAhvZVZd/c9gucF5LzL159NL9RTEnmmJuy4oVAjSS0Q5WFZENDldMrIXBhIJSYUgx3QRqi+632zT0fzB/v/vfPsP19le2j9fQ9XEjyUd91TyPd9i/n4z8erY6W5/iUBWnQWfykeqy51byHSG6xuMJ4GtNm9n3HYSVFoCiM7w=
Received: from BL1PR13CA0190.namprd13.prod.outlook.com (2603:10b6:208:2be::15)
 by MN2PR02MB6784.namprd02.prod.outlook.com (2603:10b6:208:15f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 19:49:03 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2be:cafe::1c) by BL1PR13CA0190.outlook.office365.com
 (2603:10b6:208:2be::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.14 via Frontend
 Transport; Wed, 18 Nov 2020 19:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 19:49:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 11:49:01 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 11:49:01 -0800
Received: from [172.19.2.115] (port=52002 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kfTRt-0003iK-Sg; Wed, 18 Nov 2020 11:49:01 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v12 4/4] MAINTAINERS: Add maintainer entry for Xilinx ZynqMP
 CAN controller
Date: Wed, 18 Nov 2020 11:48:46 -0800
Message-ID: <1605728926-352690-5-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
References: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 713a3140-7ea7-4d44-5731-08d88bfb00b5
X-MS-TrafficTypeDiagnostic: MN2PR02MB6784:
X-Microsoft-Antispam-PRVS: <MN2PR02MB678415045FF604C9D5129955BCE10@MN2PR02MB6784.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0uQpFnpkdzYhQiNp684SzSCg+X7uzSMNJ8T/spBIr7+ZrDty3H6WsdQABhzs2cytE7/P4URgvs0OdC8BZlZa5W1vlJ1BzmnmNsKNEX3PBJJC+GaTpZr1SCg46nlMVdlo2mGuZKcSpcwrMrmJDK8nMpzj9vEa31XIKELJLd0tQOesCvme/Y5gef8n4t6qgTsStZlZNdlFQ9VUIyvVGTZNtlsP+2JQ4Hjch/q6fEgGOpALFyeDUe7j7BbGmKlHdd0FjlcDU9y0PeB+ZQMUnwDmWaWqp1ptUwV8NkQTur+OnAJdgo0EOOXIB01IXxpy8hQc7MbCcFEnM+Ru8h3/2CMZl757eRz6auxFWqxihirzt9ux6fyt7Zesm7Th2VtQd+nGh10Mbuh8lGM6ogy9+kdk95VXilbqgOU7QCztXsOxrHQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(5660300002)(316002)(478600001)(54906003)(6666004)(36906005)(186003)(426003)(8936002)(7696005)(107886003)(2616005)(36756003)(70586007)(70206006)(82310400003)(26005)(4744005)(82740400003)(6916009)(336012)(2906002)(7636003)(8676002)(9786002)(4326008)(356005)(47076004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 19:49:03.6442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 713a3140-7ea7-4d44-5731-08d88bfb00b5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6784
Received-SPF: pass client-ip=40.107.244.80; envelope-from=fnuv@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 14:49:05
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: francisco.iglesias@xilinx.com, Vikram
 Garhwal <fnu.vikram@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63223e1..447b7f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1554,6 +1554,14 @@ F: hw/net/opencores_eth.c
 
 Devices
 -------
+Xilinx CAN
+M: Vikram Garhwal <fnu.vikram@xilinx.com>
+M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+S: Maintained
+F: hw/net/can/xlnx-*
+F: include/hw/net/xlnx-*
+F: tests/qtest/xlnx-can-test*
+
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
 S: Maintained
-- 
2.7.4


