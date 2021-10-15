Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8289742FD0E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:38:06 +0200 (CEST)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTxt-0008QK-IK
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTva-0005vm-2S; Fri, 15 Oct 2021 16:35:42 -0400
Received: from mail-bn1nam07on2065.outbound.protection.outlook.com
 ([40.107.212.65]:57422 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mbTvX-0002xB-Ej; Fri, 15 Oct 2021 16:35:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRxoM/ez+Jpnvul6K9WTwdz/77bg6fl5sZ4v2CpaobfIXRduRoRIsGdPJBp96SN17o2799+MpaJMlSF6YiAQoue9ENqjet7qs/OYq1c4zM54+uNzJBDCy2BNULZryFSFBDOS00VbuxZDDx6T5ne0KGJKy+1VcSSs8GAOpbg8CmEJ65wzlTsePk2J5J6mBUmGGfsQe4oPbuTVsBZOZJSzd2ZQy7H8/wZm3OhKEbQ7xq+RqKExTc19dwaP3teJuSo1okT0X4SI34ts3pKqETen6Ia9tT7LYuDChq8KWax5pAhf02ADaLgRAsFv6A0Gctw/3BpK2Y74jY+0lzeUqD7fCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MFbwrO1LiLtXWp7q8THpptRkvc0FDwGBtQkCMEZ4gE=;
 b=i5R4sA0OgIOj5q/va3gqopGjXH89bKZmLxHSOzKfAmD+urBnHE2CCgHGif10BEZnpEseugcMU88OmGb5MSthr5QD4FDD+PQsCKdb1eIbxZ5PKALRlIIJfscvRiU1YnmmtB9vz7tibH6vK1j6kgMezmrepdlLnYzbclJaVVAlc/0A0/SXZqgikGhpzjUhb0Z9pQVIQj9ljTYpkLoqemCc3cMOACgl8ZuLCUk+IzbYTirqMDJiXRfXWR18mpAtpCb+ELmoPJNcNojIjo3B0YUejYzo+vjnQX/f5o/lobLEP9NypUfl7ww4OMmT9rvxKjGdxzz77LMh4vD0g3QPv++KOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MFbwrO1LiLtXWp7q8THpptRkvc0FDwGBtQkCMEZ4gE=;
 b=amhKmxKuRWRmfxYJr9dA1uDXI7SoA1fUD2G/1mCnYVhH/YREFYZGjpuu57xbL3yqLBMnEMysSOX4Z9XvikA7AgCeHM7qTDQ+3kvrjT+rUyLp/jt5rnO4l42r9NgRN4FYQvrzeNgZhXiClmOkou2O9i7E4YU8S3HQjB2g0KAxZiA=
Received: from DM6PR03CA0052.namprd03.prod.outlook.com (2603:10b6:5:100::29)
 by DM6PR02MB6714.namprd02.prod.outlook.com (2603:10b6:5:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 15 Oct
 2021 20:35:34 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::8d) by DM6PR03CA0052.outlook.office365.com
 (2603:10b6:5:100::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 20:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 20:35:34 +0000
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
 id 1mbTvQ-000G9T-4e; Fri, 15 Oct 2021 13:35:32 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 2/3] hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
Date: Fri, 15 Oct 2021 13:35:31 -0700
Message-ID: <20211015203532.2463705-3-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015203532.2463705-1-tong.ho@xilinx.com>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 811ae0bb-6969-43a7-8843-08d9901b56c0
X-MS-TrafficTypeDiagnostic: DM6PR02MB6714:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6714215D93E41541BDA9BFBFCDB99@DM6PR02MB6714.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bz80w6iuvwwLWjF2QaDd5LxvlyBgRKXsQ6fVCkQ3bbs3t/+E92phgYB3iW+IAo19rnb/knnDqXP9WhRLENbj51J2vjiCkqSqFyv7w7+r8ioxmMEKaygu85SR9ztS1kUHvLEGSVJRHLNi7gJ+QkxlwSCFQkZwsBihzUFVJ0HFTkCdxImQNmDdRoQd7XDex2YmF6TAo9uxXlVZfHAwPuF5yYqtiObvcp8EbN7CX2AALGQckdhn26ULjnXJhJrASJczxa5Vy4jQhA+LEE58FWqL4LKRf//IrW5qjAx6lGbgDZNDLUUfK4Al7dJqPIIePHzxdh/TxskR/KAqTGd/qBfHDvOGwHzO+HkaQkPhGs5cSG1rKb26GaEUzvtXGz7vGZPUHGOoV2fnEWZ4T52G9dqcS5rJRxjtBwwR2Gemo4szxIs/NYWjsrEPggHNo0poJoDZhDDZ1828zpUTz8Ljf69XKV7IK9agMZtI5Ja2WfeSzmY3q2ZrMyqCv0BW7e6Hswzkv+DpL42xHUGZHLq7Bmp1KvrMRaOTht6R94u0PklnkTLirFghFWi7y0frhiF0bTsdVOvUg6zAkf17K4CXYQ/B8cSFvJXJD8eOUtY6YleOdtVjUc1n9v1H/WPY7KZrVCL4iwoa/GuRYYnRqRkac7RgSomJkADNY++eL+39ZVJ9TScqYCmoQlaz/sNSryUrbRsPwgWJ2jtE/WWQ9hqSgLxCWAvm8Dftl2rnmNjoUAfRX5Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(107886003)(70586007)(36906005)(1076003)(2616005)(47076005)(36756003)(26005)(82310400003)(186003)(44832011)(336012)(4326008)(316002)(426003)(70206006)(508600001)(2906002)(8676002)(36860700001)(9786002)(8936002)(6916009)(54906003)(5660300002)(356005)(83380400001)(7696005)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 20:35:34.2681 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811ae0bb-6969-43a7-8843-08d9901b56c0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6714
Received-SPF: pass client-ip=40.107.212.65; envelope-from=tongh@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
index d362376703..b35ba65ab5 100644
--- a/hw/nvram/xlnx-versal-efuse-ctrl.c
+++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
@@ -439,9 +439,11 @@ static void efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
      *       up to guest to do so (or by reset).
      */
     if (efuse_pgm_locked(s, bit)) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Denied setting of efuse<%u, %u, %u>\n",
-                      object_get_canonical_path(OBJECT(s)),
+                      path,
                       FIELD_EX32(bit, EFUSE_PGM_ADDR, PAGE),
                       FIELD_EX32(bit, EFUSE_PGM_ADDR, ROW),
                       FIELD_EX32(bit, EFUSE_PGM_ADDR, COLUMN));
@@ -478,9 +480,11 @@ static void efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
     s->regs[R_EFUSE_RD_DATA] = xlnx_versal_efuse_read_row(s->efuse,
                                                           bit, &denied);
     if (denied) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Denied reading of efuse<%u, %u>\n",
-                      object_get_canonical_path(OBJECT(s)),
+                      path,
                       FIELD_EX32(bit, EFUSE_RD_ADDR, PAGE),
                       FIELD_EX32(bit, EFUSE_RD_ADDR, ROW));
 
@@ -625,9 +629,11 @@ static void efuse_ctrl_reg_write(void *opaque, hwaddr addr,
     s = XLNX_VERSAL_EFUSE_CTRL(dev);
 
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
@@ -681,16 +687,20 @@ static void efuse_ctrl_realize(DeviceState *dev, Error **errp)
     const uint32_t lks_sz = sizeof(XlnxEFuseLkSpec) / 2;
 
     if (!s->efuse) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp, "%s.efuse: link property not connected to XLNX-EFUSE",
-                   object_get_canonical_path(OBJECT(dev)));
+                   path);
         return;
     }
 
     /* Sort property-defined pgm-locks for bsearch lookup */
     if ((s->extra_pg0_lock_n16 % lks_sz) != 0) {
+        g_autofree char *path = object_get_canonical_path(OBJECT(s));
+
         error_setg(errp,
                    "%s.pg0-lock: array property item-count not multiple of %u",
-                   object_get_canonical_path(OBJECT(dev)), lks_sz);
+                   path, lks_sz);
         return;
     }
 
-- 
2.25.1


