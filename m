Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E13CECAF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:22:39 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zmg-0007kO-Ue
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5Zlc-0006m5-4j
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:21:32 -0400
Received: from mail-dm6nam12on20608.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::608]:4577
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5ZlZ-0002BG-Oa
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:21:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAcR6R9HqBFrsWMxt26rnHhHew1pEOdGF1DKHRHgWunXDxrMxYaPiCTNETH1g/l++hZa5cGnkc+L8qS/6VVnVOZgYrsmQpmcjFZB4I+rZSjQR45fXPzUIxXhA+CQFP81BYtU6VjsMijR14wyfHsM7AR19N/mwEO9SSZwKi438j5VAO6LmgvWTRagZrnz/zpCz2QTFbfFoHRGyp3DdyG1hK2XBd2e5XPL0Z+jhNH7GU7fPk0sUNHMSjVKyi4HoKZIVWRbk22MeNJSb0P+nTa0q1NuyMtqQhV+4UJcytu7LJrtUpuOC01ehnKefvWFSz0uTayCGAaiE5BGz9WjsFishg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/J1YwR8vTO5lL4s+blaW6WOjmM2BEAZEXwdwi0vnlU=;
 b=WuJq3/T6+VEQhcjBKz0tplnbQAeyT8V1zeppebcnqoUW4QyRjJS2Fc8H8/fjC4JkLGrMmGvdsa/7wBvEU9RwPZ0FypcGVNHl0OMxeuJQwpP5oQzLujKxv7jIpFA/MxQBEcDCxs/ZVddIfImzjZzINuazfYTsaxepE8JSJZE4BFUktInh+11eFMi7SPVhk0lHNM0VkwBfWiogeTzbFkxzIituGfNdQmIS08POItXN3cfGbFWTa3eGQtghejaA3mxlZX8NFbBTyf/5GrnRIMUEe46hYLDJHAazVq07jysbG91npzyOu6lKnKYFQCTesAHiHfQt/PaBfYkHjPBFyT2OCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/J1YwR8vTO5lL4s+blaW6WOjmM2BEAZEXwdwi0vnlU=;
 b=MyJLpSNN7z/QuYXYSRop+46vesTT1XKHzWGEqfMJhc80pdWHgI4WIuIZw1xBiM7M1GV9xcLDE7DZbMWWH48H7OUNBln9re1T/PM6i97yay4FjeJggMn8tsRBVSDbzN8PkFdghTCH9SM8ANEmaIE5jN+Erm15q/1uJ80C+usihX8=
Received: from SA0PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:d3::7)
 by CO6PR02MB7604.namprd02.prod.outlook.com (2603:10b6:303:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 20:16:25 +0000
Received: from SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::46) by SA0PR11CA0002.outlook.office365.com
 (2603:10b6:806:d3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Mon, 19 Jul 2021 20:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0057.mail.protection.outlook.com (10.97.4.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:16:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 13:16:23 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 13:16:23 -0700
Received: from [172.19.2.32] (port=56664 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5Zgd-0004Hs-PF; Mon, 19 Jul 2021 13:16:23 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/2] hw/core/register: Add more 64-bit utilities
Date: Mon, 19 Jul 2021 13:16:22 -0700
Message-ID: <1626725783-133765-2-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626725783-133765-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626725783-133765-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbefadf6-fbf7-400f-2e25-08d94af2155b
X-MS-TrafficTypeDiagnostic: CO6PR02MB7604:
X-Microsoft-Antispam-PRVS: <CO6PR02MB76041DF58F51E789B86AAF90D0E19@CO6PR02MB7604.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AtjZQq57Bczx9tRKK1hHdrq7tdJrW43yfAYZitNsi/FjhL3Ui/bVapHBm2aL/pCzhMe7VNhsyjGtnYqyloJsvcFH8ZikQN1CDnPJmqPMJDZdN9MPjYbnUnMKtlfYHsU9RB9UvR/V1HT6rWorecExONl56HL4vn57dmim8pQOhzwuz7FaB2YX8fb+hIXoKe23vQ1sf0ZySlTmoTNQJ8mA/Sjn9xJL7nesR8i7+lvfqYh1tcmLZtpg47KTxNVznDxGTSKEHlE3OMMxA+uugUGCv32WusX6Jqq0fyQurhnZxV9kBsaHTVxGwtysImC7nyQg5ufFtlzzIMJCYMPCZjxlK8awZg9EXztOcmpAYTTVibKGGZEwACcMU+waKLBW5507Z6121r2L2QiVDa37oNIA8JV/c9OCUzkNCZNm7zpCB0uH2HdqHiTfSMV4fge2xks8/MywDKvhIQS4Hw8OT8lRDrvmfy53ph66CDUuBl/NpdfbFOG/crXaWgloWw6a6PVGIqsDJPmJmoGrO6/i1dEbQDL2Z3LjCCLvvuD6ScpNYvK4sCG96Q9cTj/8im2BisjuNJuHcs9kG7wiPHU1YsrbspHJOisbpwDkgUI1Lg7TBh6+DhfGAzuhDErQ+x4ppRvE25+fXyR0eoNTInXKbjRpwAGrT+8Gy7LRHSI4tGXiiu6VpIUuefUwgCO5RhtrGkCECA8SbChiA/613PukLrK3Y7V2W22+cX6y4ftc+HRmLxc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(7696005)(26005)(426003)(4326008)(316002)(44832011)(6916009)(36906005)(70586007)(7636003)(356005)(36756003)(86362001)(478600001)(70206006)(82310400003)(186003)(5660300002)(36860700001)(82740400003)(2616005)(2906002)(8936002)(8676002)(336012)(47076005)(83380400001)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:16:24.9664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbefadf6-fbf7-400f-2e25-08d94af2155b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7604
Received-SPF: pass client-ip=2a01:111:f400:fe59::608;
 envelope-from=komlodi@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair@alistair23.me
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
index d6f8c20..ab20258 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -300,6 +300,18 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
                                data, ops, debug_enabled, memory_size, 32);
 }
 
+RegisterInfoArray *register_init_block64(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint32_t *data,
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
index b480e38..0197e45 100644
--- a/include/hw/register.h
+++ b/include/hw/register.h
@@ -204,6 +204,14 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
                                          bool debug_enabled,
                                          uint64_t memory_size);
 
+RegisterInfoArray *register_init_block64(DeviceState *owner,
+                                         const RegisterAccessInfo *rae,
+                                         int num, RegisterInfo *ri,
+                                         uint32_t *data,
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


