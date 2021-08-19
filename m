Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94063F1245
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 06:15:18 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGZSX-0002F6-MZ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 00:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZOE-0001lT-M7; Thu, 19 Aug 2021 00:10:50 -0400
Received: from mail-dm6nam11on2077.outbound.protection.outlook.com
 ([40.107.223.77]:7072 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZHi-0003E7-8R; Thu, 19 Aug 2021 00:04:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DInDU3O/AEY5HzG/idsVn/EKStNDcme8CoofxtSp1aQUaPkqJpAdWAR48cRMjIAF+SdjtuFsLTnU1nC25QbW4W/90C0LBfEy/L66auhu9j1rpsdU5rbsneaKB1RCdCAua4SmWMKW0ouQuQf1gPzTbN3Lz5V/bydBePa6sskFawAbVu3mb5y1Lsf82GGxKbXJX20LIhwcI7kX0P1QCluVCQ1z2p5jnQlEdgukeoWpiXxVTH9H0VILwiCuobxBq5mjPMZv6FhZUqpbrDvqurBnxmtOHGrfmgjDeep6zBFpEyMSBcPw/7GbmnlXJ+4CFCIWY3UdgWRvtgxcv31tWT2zHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4270VPp1le0nTwoHI47Cdjpot+5mR4hcmlN9riSFRrc=;
 b=mR79XKffqfxUJpCnXAobCR2AiOMvfmQgpHcuCZMXIBGpn8S51qzdyIf7M2Ynhbeh4OPgjnJSV8Ufqewur0dEKUexqauJrwabOWpkgSOlE0s8r11tokfF8IPeeaDo9UtsPDOXr9Xo0LMUnUHQWm2WsW0YVcgTO3LGYftCtabwwotstYfu1rFi8s9b7yI1w9dqVOYBg5mgbUKk4OD1pPXFHnz0NwhW31SHtkDVsYuIWFh/3+lqE8U7cZXMqVOgIAu410cDhVWOnjHajoF9vFmnvn7GMRSGHJfjn1M4kH8/hZqKOBNB8az8EasT9Rm7Djqpyfc3yeSB7rhRzEEYgyLPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4270VPp1le0nTwoHI47Cdjpot+5mR4hcmlN9riSFRrc=;
 b=B3lF1wlUebmbx0jIwQWKoxhNr6WP9+QqHVur7weoa6oFNHLCoXIWH8NI933bfHRwbCvjFQIxmIuthFs7jbbLLrN/TsXgeo8BiD+XQ622LXIU/7A76RLlPY0a7TCYLeahK4KOgvxHyqfbWaG3RaefUhkFOUKL6QB+Sbkm6z7mRsc=
Received: from SN7PR18CA0021.namprd18.prod.outlook.com (2603:10b6:806:f3::12)
 by MWHPR02MB2239.namprd02.prod.outlook.com (2603:10b6:300:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 04:04:03 +0000
Received: from SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::79) by SN7PR18CA0021.outlook.office365.com
 (2603:10b6:806:f3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 04:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0014.mail.protection.outlook.com (10.97.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 04:04:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 21:04:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 21:04:00 -0700
Received: from [172.19.2.40] (port=52318 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGZHc-0000M7-DZ; Wed, 18 Aug 2021 21:04:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 1/9] docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE Usage
Date: Wed, 18 Aug 2021 21:03:00 -0700
Message-ID: <20210819040308.675057-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819040308.675057-1-tong.ho@xilinx.com>
References: <20210819040308.675057-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1fa7b36-0301-4e65-24bb-08d962c66163
X-MS-TrafficTypeDiagnostic: MWHPR02MB2239:
X-Microsoft-Antispam-PRVS: <MWHPR02MB22399F082371F2813A7CE0E3CDC09@MWHPR02MB2239.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBkQtcWGfFFV8RwaNVEO5cj+rKm1Y8X1KlA0pa5F0XsgEqYHhp0wtPkn/kMG/9/r3fSR598UstMeZ8glychQSUFVrjCi/cPTRepRmaZpZovlxpV+4OWj2dFruXFA4hzy3THBY4Gwi6Qn4AWs2AITn42BoXZjH69ZkIl0oDN6dXG1q3DBLHj/r3lly12KCZ9TC8A0bT/sXt+LuekSxyDFX9Dqgh4oE4/WNFDcJYqTBNQblPK0TgIuX6mOuadbY223vo1+p2qJ/E+qZO8sUrR0Vj9BRrEemd5R8EtMzSRBTJNR7r63LiYoHUJfbxs2EPp3Q01SnuUywhh0ABOq2qjhL3hoMJlisHstKALmlJy5YbGSUbARFB/jVH3IfCZO/dunh3vuANlA+PyI7mqVdqngxY39SfxUTjbq6GyTLqi4465Ms7SEmVb6SoWgvfz5wXPE8mPV45/KHSIkryJEgyslAv1CJ1gBZvQJciKTmodMTIpx9Ziu0MwP7WQdYCO1ekFd+BmeHe49U3eX1iQz3zfhXHoVZKaTlAPA9XuwspxaUI8XnA/fm2g7lJfYIy1IEQ+Avoy9fOeEn3moIvI48b68gUoZ11YP+VTlm01U4Nqfv2M2Yahu61tl2xU5M5csDTHMM0HflTUJzINgWj1X47K9DEqv+IYVtrgj+2p7yuHiYJIdZCpZTEaU94VodQAXt+6QCIWnXfft61DJ52LOUrtFltEiTNOKwB3aEuBQVwfebZs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(8676002)(4326008)(7636003)(26005)(426003)(2616005)(54906003)(316002)(107886003)(82740400003)(36906005)(356005)(186003)(44832011)(6916009)(478600001)(8936002)(336012)(70586007)(1076003)(70206006)(82310400003)(36860700001)(2906002)(7696005)(47076005)(83380400001)(36756003)(9786002)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 04:04:02.5760 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fa7b36-0301-4e65-24bb-08d962c66163
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2239
Received-SPF: pass client-ip=40.107.223.77; envelope-from=tongh@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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


