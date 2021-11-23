Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C745A06E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:39:37 +0100 (CET)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTD6-0005Tx-Ky
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:39:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8v-0005bv-SL
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:35:17 -0500
Received: from mail-co1nam11on2059.outbound.protection.outlook.com
 ([40.107.220.59]:56160 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8t-0000kJ-IS
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:35:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYnxxkwscZ2mq1virvd+IIrJmpa02u1Tf7ixhqCm+tvUg1i2r1iHfSMmW0opfC+GZPyNdjWPtgfIfgwIgJz/jUJXHyyo4hIYsARCS4RqxXMsd7UscFCvNF+WIX57Q61BDIVZGDJoMZyeITAXSQHa4TA88m+BfQ2MawHzg2F1J/eTaJbaSRI307aBMIi2P4FsW9pRhBzQHvBDOnrG7u60wSVmfPgIUvgPqxxS4PmIRDvUtvqFx4x7tPqeEshw+OkjnNj2bqwXyxXX/YAl31+i5/NQ5uFkvaWrxCCFWq7Myx8hGuytwRMNfwgt9z4GcGr29SJrb7x5AK641mA31PfqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS8mHJY7T0TY8wWVIdrWCkbTICI5nV0X1YkuddzNAuc=;
 b=IVOJP29/990rQp+K1REp9lV5rW/Pvlfj3DBq0E8Y8bVaaPwLPHAlHCtgaoAcmFF7d1iMcbRHhEMKCAkFxI3C+j5Klc6a6hCII9uqqCD7E+6DG88rzZDGgs+Sc/eOPVEcT43iKGaEkCeqretH4Z+ir0EziR719DSyK5K22T0rhIUMBWitMHCuT0IEyjZ4qZ7S1IWZleh+CFRQsMPQaopHXw5Yx66qZtK+iagZhDjBB/vocZWUOzuxDN8M3F6gyza0pqq95/Jkx0KXvViK/LnO/zfOGUe2wZQAAeY/4ibTA9D9p080qAiwetBEk1iB6N41/lb9kUvthZdU/+rXU7DJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS8mHJY7T0TY8wWVIdrWCkbTICI5nV0X1YkuddzNAuc=;
 b=QLu6NQqIfBqGf1XVz+OHV5MDibaSqcI0++pB0JPxNr10jqswj7uO94HLWYTjaH36jiiFNKCUHkdIp7amQEbEVmPRB3FA0l8fn6fA2svIknAUoChzJjDWtCHHitk1rReLnhlPgklqwJUJ8+djnDdW8ulgoVJX4OePlSjv8dJ9F4M=
Received: from BN0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:e4::30)
 by SJ0PR02MB8718.namprd02.prod.outlook.com (2603:10b6:a03:3e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 10:35:13 +0000
Received: from BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::bf) by BN0PR02CA0025.outlook.office365.com
 (2603:10b6:408:e4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Tue, 23 Nov 2021 10:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT051.mail.protection.outlook.com (10.13.2.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:35:11 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:47 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8R-000GX6-8G; Tue, 23 Nov 2021 02:34:47 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 10/10] MAINTAINERS: Add an entry for Xilinx Versal OSPI
Date: Tue, 23 Nov 2021 10:34:28 +0000
Message-ID: <20211123103428.8765-11-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 749df3b1-7ce3-48a1-1388-08d9ae6ced96
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8718:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB8718E8CAFB1B9B3496AE7AB7AD609@SJ0PR02MB8718.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNQR6/Y7liethSdO6FqYcBgMb56t4ltQDmjCvEtclczUxj3+7rRg2+YyjDpbEhxXEPBkM0WJqOIGmXg1Nd3aNiLgPuqTi+uUmIee2KAXcf3uNqusnCDLFN4s0i2pEQA7XgfBaQCNrdtDmZCba/wh/7nKB6EAK6PbBwo4J/pxsSLfNgwOeEoXC0wkWAkM7ULPe8wIvF+4KUC01YxpePZbkMfTzax/llHLKe0jRj/rXoH6Qh52U8Lcc9I2xcwjlTSqse27vJgp7eP17Xsx9yuK2UYvI3bW3FGgC0uUaNFlStuqCQOPeT6Guuob2Rap6cN6SrrDHnOHYEVk8ddlY7edY9nJvVD4UQ+zkQ513Epc2mL++qv5InKGydIOsM9qJIOWuSmX4eWIrBY3ay8eI5/rw0+C3xrOKUHqhkwpYVCwJnkyoGabjmn+qObnWCqlOWhyvp8IKMRqLe4G/m3IIb6GRQxermD+5oq2BexfMFBSrk+DQLOpANTC2WwD6LJSfRM6H9dqIR41vXbdj3bc7Fx4yYZETXM/KHr+RrZKdAY1uyty1EwRDSHuk3gBX7bX1E8S/sUm0VzWzlsKQv3liQcTkuWrQEVRDfli9igELtko7emPRY+cKHT97WLXN90pa0u1RCfWiHSiuhRmS0XjwfLaKHxRk2nOIme+NavUl5HHrJOSUC4pfPbZuTb/lNLlIzv9nqU6S3Y/wUjEsojv6ed67lzRCEJTBHtNcf60RSiiJSM=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(336012)(6666004)(70586007)(426003)(186003)(36756003)(6916009)(70206006)(8676002)(47076005)(26005)(44832011)(82310400004)(356005)(8936002)(2616005)(1076003)(7696005)(7636003)(36906005)(54906003)(36860700001)(9786002)(5660300002)(4744005)(316002)(2906002)(4326008)(508600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:35:11.3883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 749df3b1-7ce3-48a1-1388-08d9ae6ced96
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8718
Received-SPF: pass client-ip=40.107.220.59; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

List myself as maintainer for the Xilinx Versal OSPI controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..8c2b01a282 100644
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


