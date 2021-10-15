Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BCE42FD0F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:38:29 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTyG-0000c3-7P
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTvd-0005xf-BR; Fri, 15 Oct 2021 16:35:47 -0400
Received: from mail-dm3nam07on2054.outbound.protection.outlook.com
 ([40.107.95.54]:55009 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTvX-0002zw-5V; Fri, 15 Oct 2021 16:35:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvEbCVlncKFbBNy+J+bhdXnpLq5067fAVJRcZiLUOgEZ8IHJohzKGTWS+u7rjzLSFTDAVsROiYKPS9jIN52uck4tcU06+gEZQmB4rsgnD54sCiLOwieekBULrG0ol3Db4YNPXvNXVbOJGyCp7tUuRr72eBSQjkYqAIEvn5gVn4tO4LkOOGjdYayC8WkhFu0hLD2jrhOMnXaiuq+3Fjyo3yV++sdD6SlW5HI/38+IziFL+eifClt2S+aU+RyHaZZrnY8wCi2+DKpzgbu3jQ83H0zS1IjR5bVfIORK44/AT+g2rv+sXc9TDMP9VKp8BRnR0AqhJT0doEiDwBPebbWemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqxfvuh8RRB6RMaGgrd8f7uXryQj4BoXncVWQqH8ZSs=;
 b=Z1vDKbN+8WKBPohabD4RjtB/3XvvOHnRrMWpGsyAfpm3tMVeGnHYQcf+HQJ+bPZPMYhNpebgYKUCLueiF4Qn/GWZrmJQCCHm34iZI/54kqu+0b4p4QgIh2avt9ymXH+U+mYkog1rIR2q22fklAUJ6PBq58wnP3eaMNY4QXZFKuWHncunw4u2ncRGJgPvuVS0FAO628wvkEYH34eXAX/AlQ9/Q8r364szunSjMGdo0GENh1I3hhnBrI8vbIfBKU7NaA7FDDoeOD5NzNNB3zf6K65U+NczMRmu6/Jth91JZNpe87Z944sHdY/71h5wRKrEi18Cy9Sj+g6CIxB7EPx3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqxfvuh8RRB6RMaGgrd8f7uXryQj4BoXncVWQqH8ZSs=;
 b=OiqyTS+/ogJgMTTWK7F5oXTBMpkxJfaL3sKV5veDId3QNwn3CF6T7hQdBYRBx5gCNdlhmK9x9K4rGEha9C4XhRPnuFxUGR6xrbQvF7RAl169aXmDGEVULMLqyJapQzBwZVDeAyBTLlEa4UuZvZZzohB2I+G58vgZ2JkPsdxcA44=
Received: from DM6PR03CA0065.namprd03.prod.outlook.com (2603:10b6:5:100::42)
 by BL0PR02MB4387.namprd02.prod.outlook.com (2603:10b6:208:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 20:35:33 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::66) by DM6PR03CA0065.outlook.office365.com
 (2603:10b6:5:100::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 20:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 20:35:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 15 Oct 2021 13:35:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 15 Oct 2021 13:35:32 -0700
Received: from [172.19.2.40] (port=43112 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mbTvQ-000G9T-5Q; Fri, 15 Oct 2021 13:35:32 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 3/3] hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
Date: Fri, 15 Oct 2021 13:35:32 -0700
Message-ID: <20211015203532.2463705-4-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015203532.2463705-1-tong.ho@xilinx.com>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd1aa73-407c-4ef4-dd24-08d9901b55f1
X-MS-TrafficTypeDiagnostic: BL0PR02MB4387:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4387C3933076E305DE1BF94BCDB99@BL0PR02MB4387.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BojlDlY/UokrGejJStO3gGODQUlPQx1AoFA3+nJu+7kLi31gGzFEoTRzREJEJ42orcvNU6rLe1LU4WUfcibhAIbN9ZiXS0TTTiEuBRqKUld2D7ihaboueMw6E7V7ZEVa+HlfSA8oucy6M+i2lLVJDMEsFMfUzzAOEaAmR1bjYGD6bXFROYu7YQzzFERD1/zsWDpx44qwOBYYE/DXGr6eupsqZbP41aVQDB3jHTs1AYxS1fnyLZvrIj6hAPYFtK2R+hLSsx47BKCrBVjCyUn89sM54cRMLtohU8idyo0KUnN9nfavsfHrGoodqOXmmPiZrmuereHPXH88WNrInl26n+WWUZXX01+YYUo+JICe5+9R3l1dAsMKtKEJMz9i7DSDQ1qiIW0sQ75vXzTp661Luv3te8aeq2NjMgFC9yI/cDbWIAIHv89b+IY3q1dJ5mlIVvT4gNiBZl2wcTMhP3Giml3uMYsWI7NvAMJ5Ka+wtePEyms5d2k4btsxTlMlahVTld5n4pZ3ABQ7pM7AWXWkfCkSNGk+xAdGNu22zyjRlHNTHt/NKt12k8boo654l/H4de88L21cOo5JSNJAWzzKKWwBUgjuvPY4pA7cqU+dFtveAIED4eyggGvwSR4UVvy8want09r/u3dzPXUBUx77k1BXcUFFvOEPCYg3NS8TlGaXZlu8LefiJGTsSOTEnd4l33qptGd2cWQ3jH1Ua8nPXn/QxMUK2KleL3sRd0UV3kA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36906005)(316002)(186003)(26005)(356005)(54906003)(508600001)(2906002)(47076005)(107886003)(5660300002)(7636003)(36860700001)(1076003)(7696005)(8676002)(36756003)(426003)(336012)(2616005)(70586007)(82310400003)(6916009)(4326008)(83380400001)(70206006)(44832011)(9786002)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 20:35:32.9157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd1aa73-407c-4ef4-dd24-08d9901b55f1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4387
Received-SPF: pass client-ip=40.107.95.54; envelope-from=tongh@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/xlnx-zynqmp-efuse.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
index 1f87dbf988..228ba0bbfa 100644
--- a/hw/nvram/xlnx-zynqmp-efuse.c
+++ b/hw/nvram/xlnx-zynqmp-efuse.c
@@ -434,11 +434,12 @@ static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
     if (!errmsg) {
         ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 0);
     } else {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 1);
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s - eFuse write error: %s; addr=0x%x\n",
-                      object_get_canonical_path(OBJECT(s)),
-                      errmsg, (unsigned)val64);
+                      path, errmsg, (unsigned)val64);
     }
 
     ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_DONE, 1);
@@ -448,6 +449,7 @@ static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
 static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
 {
     XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(reg->opaque);
+    g_autofree char *path = NULL;
 
     /*
      * Grant reads only to allowed bits; reference sources:
@@ -538,10 +540,10 @@ static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
     return;
 
  denied:
+    path = object_get_canonical_path(OBJECT(s));
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: Denied efuse read from array %u, row %u\n",
-                  object_get_canonical_path(OBJECT(s)),
-                  efuse_ary, efuse_row);
+                  path, efuse_ary, efuse_row);
 
     s->regs[R_EFUSE_RD_DATA] = 0;
 
@@ -731,9 +733,11 @@ static void zynqmp_efuse_reg_write(void *opaque, hwaddr addr,
     s = XLNX_ZYNQMP_EFUSE(dev);
 
     if (addr != A_WR_LOCK && s->regs[R_WR_LOCK]) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s[reg_0x%02lx]: Attempt to write locked register.\n",
-                      object_get_canonical_path(OBJECT(s)), (long)addr);
+                      path, (long)addr);
     } else {
         register_write_memory(opaque, addr, data, size);
     }
@@ -784,8 +788,10 @@ static void zynqmp_efuse_realize(DeviceState *dev, Error **errp)
     XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(dev);
 
     if (!s->efuse) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp, "%s.efuse: link property not connected to XLNX-EFUSE",
-                   object_get_canonical_path(OBJECT(dev)));
+                   path);
         return;
     }
 
-- 
2.25.1


