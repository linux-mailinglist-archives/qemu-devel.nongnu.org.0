Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9B3CEEF5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:07:28 +0200 (CEST)
Received: from localhost ([::1]:59072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5bQ7-0000VJ-S4
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5bLh-0004Ew-Ta
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:02:53 -0400
Received: from mail-dm6nam11on2080.outbound.protection.outlook.com
 ([40.107.223.80]:52028 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5bLg-0001Zn-2p
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:02:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnMl4JGAYjFLNRd4QzjyQHx2jVSxima2/VxfRqLh5nOjEohI91D+6MJ4uuwyXFRmfASb5w9p4h+goq+RopmbLqQeSw3RL7oEc6CSLr+07lInWMdwTOO00VpdrAj+gWkWVMgvPw3q+ZQ1De4nLA+XdV5kzu+njVjyr7zG8jm0Z+i5zt2WYrT9akIx2C65zK3LcrH8qXwNLk+xpFVlQhDn0XXg6vtIbnAZQzpb4A0UHNbXmTgjqYlJwNtx3rEw6qKhBNNklC7RxmqFMDIAx7kzHBT5dlf7vYgiqVG4pXXNgweU98zsKOpGzTdAsxC1xjpZxf0HgUOoYQnPcuUQOq9vMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/J1YwR8vTO5lL4s+blaW6WOjmM2BEAZEXwdwi0vnlU=;
 b=oeCStVuGB3C8KhhK5IarMPexbPnZACnZdr5AjTeyaALDTfvwi5ZxkxX96WQIW7fx0jgDNdiakIzc3/IKGedE6MA1t3QZaraLSCvZYyITCtd/d6rn7mYHIxUdQaF0qiBzZheyihWDWZk61KYlnUuwAwaMO1IW+A69aQuxq/ucE66NGB/4IoZvJ9YRCGwlQrkg+6aCOMnX9jS4GSFSWI5oS94dy6iwp1qudfwGled5snTMAmQPgKVGKDcucxQIghwG7Jq+d1KxKZ+rA0r9OO0cfCgPYdLjorcmyR8BMlmBT1z89eXl59jrhxTrPMlk8GudmNa692n23xcws8RXRLiIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/J1YwR8vTO5lL4s+blaW6WOjmM2BEAZEXwdwi0vnlU=;
 b=nnWCZ3R4SKS6YUNpYAAkzDzgTiEvZGNaHZehm59QvPdgazfxN3xKB5ZdIW1llQCWeDfs2zezLLN0MFKwRDxmgSP4I2IVVGDa081FByl8Yp/X/MR/PsfWGKi0JsOqjTTxq7dHXwHQLTVgRjPpYndpV1cY+qgHSgl3F95V35orcrc=
Received: from DS7PR03CA0181.namprd03.prod.outlook.com (2603:10b6:5:3b6::6) by
 SN4PR0201MB3456.namprd02.prod.outlook.com (2603:10b6:803:43::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 22:02:48 +0000
Received: from DM3NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::7b) by DS7PR03CA0181.outlook.office365.com
 (2603:10b6:5:3b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Mon, 19 Jul 2021 22:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT006.mail.protection.outlook.com (10.13.4.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 22:02:48 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 15:02:45 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 15:02:45 -0700
Received: from [172.19.2.32] (port=56696 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5bLZ-0003YW-Um; Mon, 19 Jul 2021 15:02:45 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/2] hw/core/register: Add more 64-bit utilities
Date: Mon, 19 Jul 2021 15:02:44 -0700
Message-ID: <1626732165-137461-2-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7924a33-f503-498c-81ad-08d94b00f1fe
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3456:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3456F33C8F2EF5978011737CD0E19@SN4PR0201MB3456.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wp29hgfWgxIgJTq21nGNX5PkmgAWYbPszp/itG4MZlldOFIjsyNZ8v1wZd5ZH3MndaevhqBOtdz62htvz+WVAszL+p8W0b68tFMEKXIa0rhcyoNr8SkEaM2GWWSw6NWp8VJEtUNJ/poUvuTvXo84/XInQVopxM8I7S2VMj8UhtS4AQ8W/v744w1oq7zM3H4JgmVx9C9ezRsLrm6ouQFyz62tRIYoNkRAolbmaVVcgSEbZvGO6JpSEIYC7kf77iLAGAQnlKn6lqBMMd5l/mkIQdm7+qlfR2DpvohjaczkazRvFZm4kuJgIImYi9WY6HRQJX291y0aEy/CgsCJfMaVF89Ur9GalD42nla81EQY3+oAnqaTCKdwkMOrcqcj+Xp29aRU/uYGkgDYnvzCWgAFUpeGXDsXGNq7Sd3JZ5LC55T525wMrL1XeH12gRpBt9quebXGE+erXSHlTJpL60KCLMB2LEMg4m+/t6pm+Y/MXj5YddMwV0d3RM5VxOm+OcYEahbufGLYNNzOVENpey87UHOn/DAKs+8Zx9ZS6pdfrzR0mRGWX3lpMuv/+T6QA5Wg45cTJLX8UnqrcRhhJ80O+MrnMzhYpM6KjWgLv20bu0LjDTEqA26gn/RmQTO1deopUT2Z9t7khWKMX8kYTsNpktYekXZRNu7Ze6sXjfKvbHFd3eTWr06cl1Ufiugb/MUoEl127sMXi6rEnBRSxg7ynBjw8HTXr73wHvui2EVA+9c=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966006)(36840700001)(4326008)(54906003)(9786002)(44832011)(6916009)(2906002)(36756003)(36860700001)(83380400001)(36906005)(356005)(316002)(8936002)(82740400003)(8676002)(7636003)(70206006)(47076005)(7696005)(70586007)(186003)(2616005)(5660300002)(478600001)(426003)(26005)(82310400003)(336012)(86362001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 22:02:48.0727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7924a33-f503-498c-81ad-08d94b00f1fe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3456
Received-SPF: pass client-ip=40.107.223.80; envelope-from=komlodi@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: alistair@alistair23.me, richard.henderson@linaro.org
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


