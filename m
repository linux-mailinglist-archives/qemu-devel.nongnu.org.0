Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248033D01C7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:37:19 +0200 (CEST)
Received: from localhost ([::1]:52408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ucI-0004Em-7W
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5uX0-0006ef-Gi
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:50 -0400
Received: from mail-dm3nam07on2046.outbound.protection.outlook.com
 ([40.107.95.46]:18529 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5uWx-0002Eq-Hb
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE4wER/yh92hj7QM/NHtTqFRuPF1hdal76ialbTlowO8GhVT858tkB8W95+hiePJGn8G+A6w5W4GrSF5oIg6WHwyxXqNTkOCBWKTAsCswpMs9oONrsRpgsyaFBE3kA3gTNXyYp9kiza7TR3eCDMERGYO3+nEhrRYuN0k9cmNfuog1lIJi6wqLvX4JV9hw4+16Wgnq6XCAGHghIrz4jqygvBCpFXkbkBeoxTqckWTMKTSDxxTU/rJoKtJa483SY8wm9RgDQ031A0BDojKt3c3Q+OWkfSKXeCQYiyrxf8IN5FXDonDU2hnnXi9uT2fR9Ga5JZF/nl+NSx1Q3G/QtsX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7lZd9DS2+PC/FEtMpoTpg85IInSZh4+tkA3sV/hzWU=;
 b=jqN0hytwBbdbxvLMt91MhKnpv16op8XZSAQUu+zPN3G/5O4LOL0fm2LTWIHsITiquTqBYWmqhAN/1qMTL5ktdzcJgNGj2QzA45ustIbkvg61qpN8/f4ZkXYi/cojlCQBypCGo5X1aTfK1DRm0zpoS+QP6C1geAHt61HqqeEpY2wDv2FRvtfe+EQH446ceGXGBZA0AEVjBzL2u40Q4C8q1Xhcvh6+26BOqkmwqcdLZZQ0EpdB5Ma1R1lpnpOAZEUZEWNleL1arG7yLjjpa2IFgoce99Oo31Llisfj+pSW4CBDPSnOxXK8fkMN4+W+Tm9uMI2JCVkv4cij4KtfjQUnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7lZd9DS2+PC/FEtMpoTpg85IInSZh4+tkA3sV/hzWU=;
 b=HK3mVrPMJ63SwqDNfiRL9JGwuosMp26HAgmPer3FJbroiejxi2srdQroBsBzvT5NDIZ7j/g7PMLW0JVyeyxk4aMCiZdlm+YaiAAZDTlSXzsewkXrg1rsi6a8inZOOFNT88YXohhp4AuGZzOzvIDTaQJctY9lbU2Y8NBAuABisxI=
Received: from SA9PR03CA0005.namprd03.prod.outlook.com (2603:10b6:806:20::10)
 by PH0PR02MB7350.namprd02.prod.outlook.com (2603:10b6:510:1a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Tue, 20 Jul
 2021 18:31:45 +0000
Received: from SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::e8) by SA9PR03CA0005.outlook.office365.com
 (2603:10b6:806:20::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 18:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0017.mail.protection.outlook.com (10.97.4.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 18:31:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 20 Jul 2021 11:31:43 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 20 Jul 2021 11:31:43 -0700
Received: from [172.19.2.32] (port=57332 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5uWt-000H05-Kc; Tue, 20 Jul 2021 11:31:43 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/2] hw/core/register: Add more 64-bit utilities
Date: Tue, 20 Jul 2021 11:31:42 -0700
Message-ID: <1626805903-162860-2-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626805903-162860-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef909781-785d-4b8e-234f-08d94baca096
X-MS-TrafficTypeDiagnostic: PH0PR02MB7350:
X-Microsoft-Antispam-PRVS: <PH0PR02MB73505B0EA56A3B09069F7058D0E29@PH0PR02MB7350.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4lZwKcNrKLH4xniw8jwbFJ1hjv7yzALySf/QYfUMliZNKbhf4otJRkj3RTzYQzImG4fuTTnJquc5dRG9hdQKC+ZFwfr6reBncPj73Y9IhfG4hld2xlKthmRfiOgxTnMp52IlqrEt0MZc1BVoYJxDlyO2ZMewi6iplHIMpQPMSBg8LZ7hDbxYAmK4KJxJVFWkj/mvRly6uWJtT33LBmOfZckE3FoPZ72nrxztC4PfpO4a9k0NMhsAvVRUTVo3gQoSfvhkdSPhMw/mztJGgUGzOMrZyufayjfw87kuIhkXBQukIhA4pJEe7mIZqDh18gr34go4Za2znYqgCp3r+cw66UmyTPAboK1Aoq0Mb9aBM5Lrgq5CllGFJr421U9Q6ZkZ/+u+eYdmHWI9jBaPob75e/Ap708Hjsj9oP6TK3A9la1NMVJzwyPfugqhFZn45DvcHUyktTs7oniqU1pJZ0JL0N97MdxSew6uq6jQk414WuSHXjUwzXbjosrQ3ySvB1s59Xn/wd1SqpQVGVbBy3rJv0bo5JntEsCo479N37bSE0uca/j1AzgFt/7q7dzhy9GgknbGMM75IyuTti7Nj95AwlZooG5xz+6MaQqqv5TE9R3SbFIxmR/OKP7KmO3JkeK6nFXG09IrZT/1Vw2qvAXe9eWH3eDQKFe8Xm69zi/FWeFyTLE6z7I6W8rqxu7DYS46y/QPCn0K95dk3Pq0aSL48fVptSKe6V3ALwukfLQSmA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7696005)(2616005)(54906003)(47076005)(26005)(86362001)(186003)(2906002)(6916009)(36860700001)(316002)(36906005)(70586007)(70206006)(7636003)(356005)(9786002)(5660300002)(508600001)(8936002)(36756003)(8676002)(83380400001)(4326008)(426003)(82310400003)(44832011)(336012)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 18:31:44.9468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef909781-785d-4b8e-234f-08d94baca096
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7350
Received-SPF: pass client-ip=40.107.95.46; envelope-from=komlodi@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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
Cc: alistair23@gmail.com, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some utilities to handle 64-bit wide registers, so this just
adds some more for:
- Initializing 64-bit registers
- Extracting and depositing to an array of 64-bit registers

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
---
 hw/core/register.c          | 12 ++++++++++++
 include/hw/register.h       |  8 ++++++++
 include/hw/registerfields.h |  8 ++++++++
 3 files changed, 28 insertions(+)

diff --git a/hw/core/register.c b/hw/core/register.c
index d6f8c20..95b0150 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -300,6 +300,18 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
                                data, ops, debug_enabled, memory_size, 32);
 }
 
+RegisterInfoArray *register_init_block64(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint64_t *data,
+                                         const MemoryRegionOps *ops,
+                                         bool debug_enabled,
+                                         uint64_t memory_size)
+{
+    return register_init_block(owner, rae, num, ri, (void *)
+                               data, ops, debug_enabled, memory_size, 64);
+}
+
 void register_finalize_block(RegisterInfoArray *r_array)
 {
     object_unparent(OBJECT(&r_array->mem));
diff --git a/include/hw/register.h b/include/hw/register.h
index b480e38..6a076cf 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -204,6 +204,14 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
                                          bool debug_enabled,
                                          uint64_t memory_size);
 
+RegisterInfoArray *register_init_block64(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint64_t *data,
+                                         const MemoryRegionOps *ops,
+                                         bool debug_enabled,
+                                         uint64_t memory_size);
+
 /**
  * This function should be called to cleanup the registers that were initialized
  * when calling register_init_block32(). This function should only be called
diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 93fa4a8..9a03ac5 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -30,6 +30,10 @@
     enum { A_ ## reg = (addr) };                                          \
     enum { R_ ## reg = (addr) / 2 };
 
+#define REG64(reg, addr)                                                  \
+    enum { A_ ## reg = (addr) };                                          \
+    enum { R_ ## reg = (addr) / 8 };
+
 /* Define SHIFT, LENGTH and MASK constants for a field within a register */
 
 /* This macro will define R_FOO_BAR_MASK, R_FOO_BAR_SHIFT and R_FOO_BAR_LENGTH
@@ -58,6 +62,8 @@
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                                \
     FIELD_EX32((regs)[R_ ## reg], reg, field)
+#define ARRAY_FIELD_EX64(regs, reg, field)                                \
+    FIELD_EX64((regs)[R_ ## reg], reg, field)
 
 /* Deposit a register field.
  * Assigning values larger then the target field will result in
@@ -99,5 +105,7 @@
 /* Deposit a field to array of registers.  */
 #define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
     (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
+#define ARRAY_FIELD_DP64(regs, reg, field, val)                           \
+    (regs)[R_ ## reg] = FIELD_DP64((regs)[R_ ## reg], reg, field, val);
 
 #endif
-- 
2.7.4


