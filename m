Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88B40F1A0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:31:05 +0200 (CEST)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6Sm-0003VN-3Y
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MK-0002pK-V8; Fri, 17 Sep 2021 01:24:24 -0400
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com
 ([40.107.92.59]:25312 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MJ-00065I-8d; Fri, 17 Sep 2021 01:24:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1N9G2K4qFygmPJNzsgbAhlJ4qL7WTKNchS11XdjtGbitvCp+gb7SO/zr+JZKbtimAiL7RZsKrg6wqI0JT2Q1c1ETpIY9MCbKoINU13YsQPfGvFeYc9ATaknE6QhKLOoEO79fdQhJC8EjVFMt54bM7JAwlvnw1ZOO4l/p0O0aMxoLKnLQFK9TjHORyLf1P0roKje6w79pIeIgzv4h1yl8blvWMO23zOHOOm08GrSGPLTPVHloOBvCOC0s3690VEGsQqFIx+yoekVrhmM/ZdYF8CrfX57JGZkKuZ57wbKUHTu5v+GXx6yja4zFtl170BmbzOzuM3f+27wXmlo/GLAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nrTdR/n/sMT6IVhrO6KZrvuoPcX36NipLeQsyFIzeBY=;
 b=HlSKwNeYNJmqtlpog/XgZ3lTU+N977rQ2uZC6vcYpPb/koq5jXuE/0E5VaNfxg8VAnYtuLVljwL0RW71KW7MAa/4XZEMBrpVm3ciihfHbV5MQGR6QG88/3Ti+mnQ0low+54VgaTj9h2Bt5RDXJo1dgTArLM55jh4iRIlXIjVwpM9Mw7/AeVGEoFEWEcPdGkILWN1HpO/jzfWpgtd1zc0uXETbsFg8DAulFvX+A1Dawm6g8j3NfHOZu8kcf5Fvs5e8j8OV3KeEgOmHg5Q9KqmuOza+oExTYdCz/16UySDEtxgqU6bWW1WcWMNKszfHJ0tdC36LhpAth4HfAob1wmbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrTdR/n/sMT6IVhrO6KZrvuoPcX36NipLeQsyFIzeBY=;
 b=cO2A4aEx97auWuIGCaTdw/9jDagqqmDWBFzH/RFB3YR0izYny0NafbhPzXhT7CG5LkVoWABkCd4shorKEEuINWOEbrEq+XInRDlAC5bDox09u+dmfmEa7UGDZ5wh8vZqcYRSosgSh5uhWAWWjWr02d76dxpZ70MvNGLy5ybPW6w=
Received: from DM5PR19CA0002.namprd19.prod.outlook.com (2603:10b6:3:151::12)
 by SN6PR02MB4654.namprd02.prod.outlook.com (2603:10b6:805:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 05:24:20 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::4d) by DM5PR19CA0002.outlook.office365.com
 (2603:10b6:3:151::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:01 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:01 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-WE; Thu, 16 Sep 2021 22:24:01 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 9/9] docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE
 Usage
Date: Thu, 16 Sep 2021 22:24:00 -0700
Message-ID: <20210917052400.1249094-10-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a648e9f4-adbf-43ba-7811-08d9799b66d1
X-MS-TrafficTypeDiagnostic: SN6PR02MB4654:
X-Microsoft-Antispam-PRVS: <SN6PR02MB465483C525C117520AE2525ACDDD9@SN6PR02MB4654.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDvj301pGde3yJ71h8CN+LSclcTvYPI/tPQzo1XYV+96XYS0Q7Efi6eOxCbw1SYUuSRwvLdqw4WmaPnjEKDB/U+zg648kN+/ESJvh9Ty/kcRhxkVpop/7crx7Es2rYTpCfWOOQm3sLGl3eU0BniDCid+StBkgRtV26CGRUXoF51IVlqt+obyhGDELd562ZHtKuzUzDkbuouF9edHqCEgplqZ3t35BnBSbqKwbLmPdK5IYEt44oYwylS4JX7Ldjj5iJFyxF7RkJKZSrkBXj/geSQD0pUu2ErH6a6uctZJ/8HM+XgryWJwCAkx0MYjBhHAAO0cw+xbAHVg1UCS+2eBKJ9eRsl4ck4hdUzxIdoYLZDscGf5Skyhpqqf1mcuy4mnsMH54xjF/HcxaHIKa2u5ZKZs+VdW21w414igeeZ0gfVGXT4JYV4ZklZRbzTvzrbj256uOiyeEtB9K86x1gcOxuQ+SYbrL9c7zgR0nPjjk6z/tVUA7QmuFxxpcz2hS1kTnCIK8WfCWXZV4cCRmGE3BU4o5wlmsXUEWM9veJGJfrxCvTQ/CNDmFwxPCexOyfBWTUcw9qZ8DQ+Jo4INRetdMIQ5e2s+FOy4gyvJ8cyE0Vo5cRTod8sOpV2pX78RXdqAS/AlQXLOELfTyKv9nBGre7P1kvlC6ZIobEZyqgZB/kHB5F01FCDk8GPrQ9bPFmJ8Y2UzYyWvUju0OgkjenagLWkz61tpdj4prRefzn+GvhE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(36860700001)(70586007)(356005)(7696005)(70206006)(2906002)(9786002)(44832011)(8936002)(4326008)(83380400001)(82310400003)(8676002)(2616005)(26005)(186003)(36906005)(336012)(426003)(7636003)(36756003)(82740400003)(54906003)(316002)(47076005)(1076003)(5660300002)(478600001)(107886003)(6916009)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:20.0621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a648e9f4-adbf-43ba-7811-08d9799b66d1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4654
Received-SPF: pass client-ip=40.107.92.59; envelope-from=tongh@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
index 27f73500d9..92ad10d2da 100644
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
+BBRAM can have an optional file backend, which must be a seekable
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
+eFUSE can have an optional file backend, which must be a seekable
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
+  on this Xilinx Versal Virt board.
-- 
2.25.1


