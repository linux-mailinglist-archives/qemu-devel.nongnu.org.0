Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70E3F4FFD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:57:01 +0200 (CEST)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEBw-00041Y-7W
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4t-000586-Bn; Mon, 23 Aug 2021 13:49:43 -0400
Received: from mail-dm6nam11on2042.outbound.protection.outlook.com
 ([40.107.223.42]:35329 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4q-0001E4-Pw; Mon, 23 Aug 2021 13:49:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eotbuo8dcHzMFEaTqE7kZ7OCIK5dFRW1xgobduLkaiR6t3ezDO6xpbVz0YpUlMno1O/s7x0PzeOi8wfDK/cCL4LWzhf3IbHDs9e1k6ApwCv6JM9TJesuO6jmtbLUM54zfVRaUr8+3YKwGH5dYrynEyxKjdo0Vn1Nnro+xw95x3gQm6iUcRdJEG4oKW2nMW/ev8LvJ3rXCfU/gmwCSk2xXTFWcWgrswllif4HEy5Ld9QGHhX7so5GQeguNBvX2zy9sxjuPPjlA8EheCj9pvMmB4tFU4Sd5Qr3Olxt40OVaQklhy9fJor50C3+vxWcLwu7L/tQ5l4DqvLVKvC/47sHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4270VPp1le0nTwoHI47Cdjpot+5mR4hcmlN9riSFRrc=;
 b=YD9lkUE1Xougms+qGYtUKSwGak6kNTOFEowxzzDi7iLWyAIlmjeQm0uWRQzxeaufPmt0p1FmAejhOD6Si9P6mP2F/Nd/Pt/6du56FDijVr599xARd99QWgVREw4Wi6fX8ZLRW9128X9HzbXrPvf+A6pZkWp9bEj3MXMX1jvttD//tV41Q2PRuJ5R0xA42LFsEfyTlnKOZLbZlKUQCnzX8Iff1Gi74GbT6jUlDBTay7yk7DAdwC/bvvexGReV6OTMZXCDeE8q9vFlghPIQgDe5XXGhJy2NZnvj/pxzUocOzBiZCqztraq22wQA7qho2iXNmoxBA6r4QWf98Oohx0NNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4270VPp1le0nTwoHI47Cdjpot+5mR4hcmlN9riSFRrc=;
 b=Vk3bOoek7m851yHpgcrUYlHFaynzTb6+x4RwFhD8iVmM0rd5cIEohnIRdm9EGaTyzT/JVSP9n/6uZ+Q2qAGuu+uKbj7mdM1jz9y7mtDb8s0iNe73pXty8Npiu3EHwKfw8a6WrE7/dUYXFqwHdoKI7rsuQPg9itwb4qZXVkpl4P4=
Received: from DM5PR22CA0016.namprd22.prod.outlook.com (2603:10b6:3:101::26)
 by BN7PR02MB3908.namprd02.prod.outlook.com (2603:10b6:406:f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 17:49:33 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::b6) by DM5PR22CA0016.outlook.office365.com
 (2603:10b6:3:101::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-St; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 9/9] docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE
 Usage
Date: Mon, 23 Aug 2021 10:49:24 -0700
Message-ID: <20210823174924.201669-10-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e7e3d1-6fef-4442-4955-08d9665e5dc1
X-MS-TrafficTypeDiagnostic: BN7PR02MB3908:
X-Microsoft-Antispam-PRVS: <BN7PR02MB390879871DD673C432F0F77ECDC49@BN7PR02MB3908.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONUJPIo6fLSuD+/5YmXnMAZRRxKDUmjjUDoSC9B5AH/rG4JrRFJN3Fz8iAfDBXan7ZClkETpCcDCElnrGTkgrq0cFDxL6k20FPn6g/shO9PDA8VeK9xO1d0UFPCcx9D/d9JyavZ4IkUHJzwMjApCi4SBgCHEIa3Q0K0DB0+LRepkwlNRaLSCwKYHl6Yj6C4vwHbP+nyUasbJSKmAW64p8ve4bjkmPkEJ1UTrGaQQMlk+ebmpbQqMdNyx/OKEwio63h+VJJTaSneHMLFVXGtEMKymJMsWjNZXbnypOybx2wSpITHRgaPsbX6HIJwcmlgQevZihJ3IIP1HDa5gXxmJroDrGXLWA9k2Zq/1De1wlrgqILhKwxEKytI+7SypKEk/54hxPAi1Qk63IaL3a04u6tASiUyuD3S0ljXrZEvKFx0UT/E5/VVLQQL4cGjWSw9Ejx5jt6s+cXcYtudeGj7NfHam3Bdvw75uf5lBVc/tmxz8OW9I7b8RYkTu7JFOFrHRsEcqs0QsppiCKeLaCWSkd3Uuoo3V2yn8f3VuCsfquoJtvyYs9LeIpvManOSVGJu6Q+YLqi1CJ/qNKsF7JDwD3WzwEHsOPaUsD4epWUVZYJqxgsCNVej5jO0dmxNDBjPMlVWXZTtE+F4j05WelGWPo4BYMQZco/qrNTGTNEjWa81xOO1RXfsFH+Q4B7tEPpm+1x38NDU9c4GffaRCbMWwcNoA5HipKGIY3juIzK76bSE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(186003)(336012)(426003)(8676002)(2906002)(70586007)(36860700001)(70206006)(107886003)(8936002)(26005)(7696005)(9786002)(36756003)(1076003)(6916009)(47076005)(82310400003)(2616005)(83380400001)(54906003)(508600001)(4326008)(5660300002)(7636003)(356005)(44832011)(36906005)(316002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:33.4633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e7e3d1-6fef-4442-4955-08d9665e5dc1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB3908
Received-SPF: pass client-ip=40.107.223.42; envelope-from=tongh@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

Add BBRAM and eFUSE usage to the Xilinx Versal Virt board
document.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 docs/system/arm/xlnx-versal-virt.rst | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 27f73500d9..84afac3734 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -32,6 +32,8 @@ Implemented devices:
 - OCM (256KB of On Chip Memory)
 - XRAM (4MB of on chip Accelerator RAM)
 - DDR memory
+- BBRAM (36 bytes of Battery-backed RAM)
+- eFUSE (3072 bytes of one-time field-programmable bit array)
 
 QEMU does not yet model any other devices, including the PL and the AI Engine.
 
@@ -175,3 +177,50 @@ Run the following at the U-Boot prompt:
   fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
   booti 30000000 - 20000000
 
+BBRAM File Backend
+""""""""""""""""""
+BBRAM can have an optional file backend, which must a seekable
+binary file with a size of 36 bytes or larger. A file with all
+binary 0s is a 'blank'.
+
+To add a file-backend for the BBRAM:
+
+.. code-block:: bash
+
+  -drive if=pflash,index=0,file=versal-bbram.bin,format=raw
+
+To use a different index value, N, from default of 0, add:
+
+.. code-block:: bash
+
+  -global xlnx,bbram-ctrl.drive-index=N
+
+eFUSE File Backend
+""""""""""""""""""
+eFUSE can have an optional file backend, which must a seekable
+binary file with a size of 3072 bytes or larger. A file with all
+binary 0s is a 'blank'.
+
+To add a file-backend for the eFUSE:
+
+.. code-block:: bash
+
+  -drive if=pflash,index=1,file=versal-efuse.bin,format=raw
+
+To use a different index value, N, from default of 1, add:
+
+.. code-block:: bash
+
+  -global xlnx,efuse.drive-index=N
+
+.. warning::
+  In actual physical Versal, BBRAM and eFUSE contain sensitive data.
+  The QEMU device models do **not** encrypt nor obfuscate any data
+  when holding them in models' memory or when writing them to their
+  file backends.
+
+  Thus, a file backend should be used with caution, and 'format=luks'
+  is highly recommended (albeit with usage complexity).
+
+  Better yet, do not use actual product data when running guest image
+  on this Xilinx Versal Virt board.                      |
-- 
2.25.1


