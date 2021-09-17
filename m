Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D640F19D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:28:51 +0200 (CEST)
Received: from localhost ([::1]:38000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6Qc-0006xO-Na
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MW-0003Vd-Ry; Fri, 17 Sep 2021 01:24:36 -0400
Received: from mail-co1nam11on2074.outbound.protection.outlook.com
 ([40.107.220.74]:13537 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MT-0006FA-Du; Fri, 17 Sep 2021 01:24:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoecXDz/yRM/YIS9MPtqeK97FhCYtwfZ7IevIUxUb8WHb6sVXpfK3tDYFSccAwTRBnt/RLRTK/rFFvMVaWonQBh+4tE9LfA+k4SW4NKFfpgtgtpZPNHaunM0olCSIc2RrFGTYyLPCl2ofsdmCmwFrLgA2F5U1xIQvJB/Ytvt2sezS/8jOcxJn075uOrY6m9QBUO7t603fHelgmWEYmjnN1VWrtSoqg+OWBaKiNjXZNXeV5ad8Rk9zYMk3KubNMTURV+bE3qrvKAhZXCgLVwSYxNKu0Tbz5Eg4ueYlLPH8eJapfGllI1wy8UcvNCsPQ/o5SWJf4nJwGAViC8R3/knhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nSjXeQCzo2EkisNx4X5thRA0ydl2xZWy3jPz6wrX0qA=;
 b=oVufXiRfuCdzoR3d/Kae4RIqy50I5dzKfktLIth56TqVg7zEWS+wYwOs6VjNSqvZL40dWlVbANp66nACpc2UjrkHY0JxXkm+RgUcLnpmhAg6FkFYgi2RaM1oU+GMpvcoVz+SMMfLkqeZQyKVIPOva8VK54zw/5EhQLv0musgp0boXFQP9SNC6bRCpjcnFWBVeEFaRl4nQzBmApgRtrqJElw+7d1rHyP4+IIa73uJC9ZfA3EI5DE7qfCpoEoxHJnaYxHKK2mUaJWmTEPGH6pBgsyn/LeNAEwpNckE5mv6m0hXeeMy1CNW/yGSvB6KtR4FXG18oQaNd/dqh0lphkoe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSjXeQCzo2EkisNx4X5thRA0ydl2xZWy3jPz6wrX0qA=;
 b=QYxTlYQORuXvhW3HXy6BmwFXZ85aNykBy65BpFfCl6Xvgv3w9wUzvOo9ZvV/pIOQKjRMfQwcf7rwvKiMrc5ZMFljAVvZAu8lTKruoIqtjL7UZPJ4d7cw0pTy+bKdh0N4+xcys9pFN7gS5neRQ8hyF+0nVELVywSFDbO57yW1Zhc=
Received: from BN9PR03CA0694.namprd03.prod.outlook.com (2603:10b6:408:ef::9)
 by BY5PR02MB6470.namprd02.prod.outlook.com (2603:10b6:a03:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 17 Sep
 2021 05:24:28 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::cc) by BN9PR03CA0694.outlook.office365.com
 (2603:10b6:408:ef::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:00 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-TB; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 4/9] hw/nvram: Introduce Xilinx battery-backed ram
Date: Thu, 16 Sep 2021 22:23:55 -0700
Message-ID: <20210917052400.1249094-5-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4874d6b4-8671-44ab-ff59-08d9799b6bb9
X-MS-TrafficTypeDiagnostic: BY5PR02MB6470:
X-Microsoft-Antispam-PRVS: <BY5PR02MB647041C1CD458F622A055036CDDD9@BY5PR02MB6470.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yy/DMKEF7nGdGDJ8NaatlF4UDqfvsnPWFDRKtFU/+eomy8bLNKSVw9wa7MuncXHWCp0RWLXpIOvEb2RiwZwTnh8X0Czq5FcprvrIrE5dSpDMEkzkQAmOY+tZyd4Qx84Zlzvd3BG45N2hsY52/QvjgWyQ16xNHdJ6vdt/QoL9WHGQT1hsas6lskQ4tmBuwmRx0OZ2Mcx8QgNYt5oRa5GYw4MX8+PmT+ghDlrHWz/fgFb83iPQB6N7e51bv5ZYqcp6jSq0IHFF1BDpltg7olQDXOYlBjfH8rSP2CtQepbuR6eCgSHxNrqulS7B7Hlo+Ko/XjyYQ1ONCtc9XD6XXOwjWkNHRJWEEWffHyNLjjwe2eOVdm+Q+hkW1cvcHfuajdSIErJXoJcb03fj81jsFIxGkTg4uHO/nn/vKRs78sW/AZAEs208yLZsoNCrSWiIkM3lA2bBh1RKlshfBFEJMfm1G8HdMoBTbSJS4kW145gu1q6b+oZTNOEgjjLhfoASjjjZCH4LvTaqiTrzZ7sNnRzcM0GEbcg2ICF9BSOeW7QdEMZCKOgC/sBjkanhymLfSuc1cadHsf4icfZwHBL79i9O3qXn9/m0Ng3ThVtExi8+BltgNJt6/7TRx3JdQtw20GzNSDWicYtPi32qS4PwiR/C6ZX1A3sZo9D9lxYyOh8XtNbGfdjplOD6bcy+e5YMXb2xTV1RDQKvw9minD4CW64j0zlUPG2gyL8crUmExClFuGcm1D5TfS0H/kWPh6Z+hKvVYrD1W9L9Mig0HVOhwldhV6FYJWjIVNyHgjQs8wH8xDTT6L90BOlkWSgrfGaO3JTc
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(6666004)(508600001)(54906003)(70206006)(8936002)(7696005)(70586007)(9786002)(6916009)(44832011)(30864003)(107886003)(4326008)(36756003)(5660300002)(26005)(426003)(1076003)(356005)(7636003)(186003)(2616005)(8676002)(2906002)(83380400001)(966005)(36906005)(316002)(36860700001)(336012)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:28.2399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4874d6b4-8671-44ab-ff59-08d9799b6bb9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6470
Received-SPF: pass client-ip=40.107.220.74; envelope-from=tongh@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device is present in Versal and ZynqMP product
families to store a 256-bit encryption key.

Co-authored-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Co-authored-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/nvram/Kconfig              |   4 +
 hw/nvram/meson.build          |   1 +
 hw/nvram/xlnx-bbram.c         | 545 ++++++++++++++++++++++++++++++++++
 include/hw/nvram/xlnx-bbram.h |  54 ++++
 4 files changed, 604 insertions(+)
 create mode 100644 hw/nvram/xlnx-bbram.c
 create mode 100644 include/hw/nvram/xlnx-bbram.h

diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index 3059c5dae0..24cfc18f8b 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -30,3 +30,7 @@ config XLNX_EFUSE_VERSAL
 config XLNX_EFUSE_ZYNQMP
     bool
     select XLNX_EFUSE
+
+config XLNX_BBRAM
+    bool
+    select XLNX_EFUSE_CRC
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 6dc54d9873..202a5466e6 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -16,5 +16,6 @@ softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_VERSAL', if_true: files(
                                                    'xlnx-versal-efuse-ctrl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
                                                    'xlnx-zynqmp-efuse.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
 
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
new file mode 100644
index 0000000000..b70828e5bf
--- /dev/null
+++ b/hw/nvram/xlnx-bbram.c
@@ -0,0 +1,545 @@
+/*
+ * QEMU model of the Xilinx BBRAM Battery Backed RAM
+ *
+ * Copyright (c) 2014-2021 Xilinx Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/nvram/xlnx-bbram.h"
+
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "sysemu/blockdev.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/nvram/xlnx-efuse.h"
+
+#ifndef XLNX_BBRAM_ERR_DEBUG
+#define XLNX_BBRAM_ERR_DEBUG 0
+#endif
+
+REG32(BBRAM_STATUS, 0x0)
+    FIELD(BBRAM_STATUS, AES_CRC_PASS, 9, 1)
+    FIELD(BBRAM_STATUS, AES_CRC_DONE, 8, 1)
+    FIELD(BBRAM_STATUS, BBRAM_ZEROIZED, 4, 1)
+    FIELD(BBRAM_STATUS, PGM_MODE, 0, 1)
+REG32(BBRAM_CTRL, 0x4)
+    FIELD(BBRAM_CTRL, ZEROIZE, 0, 1)
+REG32(PGM_MODE, 0x8)
+REG32(BBRAM_AES_CRC, 0xc)
+REG32(BBRAM_0, 0x10)
+REG32(BBRAM_1, 0x14)
+REG32(BBRAM_2, 0x18)
+REG32(BBRAM_3, 0x1c)
+REG32(BBRAM_4, 0x20)
+REG32(BBRAM_5, 0x24)
+REG32(BBRAM_6, 0x28)
+REG32(BBRAM_7, 0x2c)
+REG32(BBRAM_8, 0x30)
+REG32(BBRAM_SLVERR, 0x34)
+    FIELD(BBRAM_SLVERR, ENABLE, 0, 1)
+REG32(BBRAM_ISR, 0x38)
+    FIELD(BBRAM_ISR, APB_SLVERR, 0, 1)
+REG32(BBRAM_IMR, 0x3c)
+    FIELD(BBRAM_IMR, APB_SLVERR, 0, 1)
+REG32(BBRAM_IER, 0x40)
+    FIELD(BBRAM_IER, APB_SLVERR, 0, 1)
+REG32(BBRAM_IDR, 0x44)
+    FIELD(BBRAM_IDR, APB_SLVERR, 0, 1)
+REG32(BBRAM_MSW_LOCK, 0x4c)
+    FIELD(BBRAM_MSW_LOCK, VAL, 0, 1)
+
+#define R_MAX (R_BBRAM_MSW_LOCK + 1)
+
+#define RAM_MAX (A_BBRAM_8 + 4 - A_BBRAM_0)
+
+#define BBRAM_PGM_MAGIC 0x757bdf0d
+
+QEMU_BUILD_BUG_ON(R_MAX != ARRAY_SIZE(((XlnxBBRam *)0)->regs));
+
+static bool bbram_msw_locked(XlnxBBRam *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, BBRAM_MSW_LOCK, VAL) != 0;
+}
+
+static bool bbram_pgm_enabled(XlnxBBRam *s)
+{
+    return ARRAY_FIELD_EX32(s->regs, BBRAM_STATUS, PGM_MODE) != 0;
+}
+
+static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
+{
+    Error *errp;
+
+    error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
+                     blk_name(s->blk), detail);
+    error_report("%s", error_get_pretty(errp));
+    error_free(errp);
+
+    g_free(detail);
+}
+
+static void bbram_bdrv_read(XlnxBBRam *s, Error **errp)
+{
+    uint32_t *ram = &s->regs[R_BBRAM_0];
+    int nr = RAM_MAX;
+
+    if (!s->blk) {
+        return;
+    }
+
+    s->blk_ro = !blk_supports_write_perm(s->blk);
+    if (!s->blk_ro) {
+        int rc;
+
+        rc = blk_set_perm(s->blk,
+                          (BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE),
+                          BLK_PERM_ALL, NULL);
+        if (rc) {
+            s->blk_ro = true;
+        }
+    }
+    if (s->blk_ro) {
+        warn_report("%s: Skip saving updates to read-only BBRAM backstore.",
+                    blk_name(s->blk));
+    }
+
+    if (blk_pread(s->blk, 0, ram, nr) < 0) {
+        error_setg(errp,
+                   "%s: Failed to read %u bytes from BBRAM backstore.",
+                   blk_name(s->blk), nr);
+        return;
+    }
+
+    /* Convert from little-endian backstore for each 32-bit word */
+    nr /= 4;
+    while (nr--) {
+        ram[nr] = le32_to_cpu(ram[nr]);
+    }
+}
+
+static void bbram_bdrv_sync(XlnxBBRam *s, uint64_t hwaddr)
+{
+    uint32_t le32;
+    unsigned offset;
+    int rc;
+
+    assert(A_BBRAM_0 <= hwaddr && hwaddr <= A_BBRAM_8);
+
+    /* Backstore is always in little-endian */
+    le32 = cpu_to_le32(s->regs[hwaddr / 4]);
+
+    /* Update zeroized flag */
+    if (le32 && (hwaddr != A_BBRAM_8 || s->bbram8_wo)) {
+        ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, BBRAM_ZEROIZED, 0);
+    }
+
+    if (!s->blk || s->blk_ro) {
+        return;
+    }
+
+    offset = hwaddr - A_BBRAM_0;
+    rc = blk_pwrite(s->blk, offset, &le32, 4, 0);
+    if (rc < 0) {
+        bbram_bdrv_error(s, rc, g_strdup_printf("write to offset %u", offset));
+    }
+}
+
+static void bbram_bdrv_zero(XlnxBBRam *s)
+{
+    int rc;
+
+    ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, BBRAM_ZEROIZED, 1);
+
+    if (!s->blk || s->blk_ro) {
+        return;
+    }
+
+    rc = blk_make_zero(s->blk, 0);
+    if (rc < 0) {
+        bbram_bdrv_error(s, rc, g_strdup("zeroizing"));
+    }
+
+    /* Restore bbram8 if it is non-zero */
+    if (s->regs[R_BBRAM_8]) {
+        bbram_bdrv_sync(s, A_BBRAM_8);
+    }
+}
+
+static void bbram_zeroize(XlnxBBRam *s)
+{
+    int nr = RAM_MAX - (s->bbram8_wo ? 0 : 4); /* only wo bbram8 is cleared */
+
+    memset(&s->regs[R_BBRAM_0], 0, nr);
+    bbram_bdrv_zero(s);
+}
+
+static void bbram_update_irq(XlnxBBRam *s)
+{
+    bool pending = s->regs[R_BBRAM_ISR] & ~s->regs[R_BBRAM_IMR];
+
+    qemu_set_irq(s->irq_bbram, pending);
+}
+
+static void bbram_ctrl_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    if (val & R_BBRAM_CTRL_ZEROIZE_MASK) {
+        bbram_zeroize(s);
+        /* The bit is self clearing */
+        s->regs[R_BBRAM_CTRL] &= ~R_BBRAM_CTRL_ZEROIZE_MASK;
+    }
+}
+
+static void bbram_pgm_mode_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    if (val == BBRAM_PGM_MAGIC) {
+        bbram_zeroize(s);
+
+        /* The status bit is cleared only by POR */
+        ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, PGM_MODE, 1);
+    }
+}
+
+static void bbram_aes_crc_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t calc_crc;
+
+    if (!bbram_pgm_enabled(s)) {
+        /* We are not in programming mode, don't do anything */
+        return;
+    }
+
+    /* Perform the AES integrity check */
+    s->regs[R_BBRAM_STATUS] |= R_BBRAM_STATUS_AES_CRC_DONE_MASK;
+
+    /*
+     * Set check status.
+     *
+     * ZynqMP BBRAM check has a zero-u32 prepended; see:
+     *  https://github.com/Xilinx/embeddedsw/blob/release-2019.2/lib/sw_services/xilskey/src/xilskey_bbramps_zynqmp.c#L311
+     */
+    calc_crc = xlnx_efuse_calc_crc(&s->regs[R_BBRAM_0],
+                                   (R_BBRAM_8 - R_BBRAM_0), s->crc_zpads);
+
+    ARRAY_FIELD_DP32(s->regs, BBRAM_STATUS, AES_CRC_PASS,
+                     (s->regs[R_BBRAM_AES_CRC] == calc_crc));
+}
+
+static uint64_t bbram_key_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t original_data = *(uint32_t *) reg->data;
+
+    if (bbram_pgm_enabled(s)) {
+        return val64;
+    } else {
+        /* We are not in programming mode, don't do anything */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Not in programming mode, dropping the write\n");
+        return original_data;
+    }
+}
+
+static void bbram_key_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    bbram_bdrv_sync(s, reg->access->addr);
+}
+
+static uint64_t bbram_wo_postr(RegisterInfo *reg, uint64_t val)
+{
+    return 0;
+}
+
+static uint64_t bbram_r8_postr(RegisterInfo *reg, uint64_t val)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    return s->bbram8_wo ? bbram_wo_postr(reg, val) : val;
+}
+
+static bool bbram_r8_readonly(XlnxBBRam *s)
+{
+    return !bbram_pgm_enabled(s) || bbram_msw_locked(s);
+}
+
+static uint64_t bbram_r8_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    if (bbram_r8_readonly(s)) {
+        val64 = *(uint32_t *)reg->data;
+    }
+
+    return val64;
+}
+
+static void bbram_r8_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    if (!bbram_r8_readonly(s)) {
+        bbram_bdrv_sync(s, A_BBRAM_8);
+    }
+}
+
+static uint64_t bbram_msw_lock_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    /* Never lock if bbram8 is wo; and, only POR can clear the lock */
+    if (s->bbram8_wo) {
+        val64 = 0;
+    } else {
+        val64 |= s->regs[R_BBRAM_MSW_LOCK];
+    }
+
+    return val64;
+}
+
+static void bbram_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+
+    bbram_update_irq(s);
+}
+
+static uint64_t bbram_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_BBRAM_IMR] &= ~val;
+    bbram_update_irq(s);
+    return 0;
+}
+
+static uint64_t bbram_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxBBRam *s = XLNX_BBRAM(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_BBRAM_IMR] |= val;
+    bbram_update_irq(s);
+    return 0;
+}
+
+static RegisterAccessInfo bbram_ctrl_regs_info[] = {
+    {   .name = "BBRAM_STATUS",  .addr = A_BBRAM_STATUS,
+        .rsvd = 0xee,
+        .ro = 0x3ff,
+    },{ .name = "BBRAM_CTRL",  .addr = A_BBRAM_CTRL,
+        .post_write = bbram_ctrl_postw,
+    },{ .name = "PGM_MODE",  .addr = A_PGM_MODE,
+        .post_write = bbram_pgm_mode_postw,
+    },{ .name = "BBRAM_AES_CRC",  .addr = A_BBRAM_AES_CRC,
+        .post_write = bbram_aes_crc_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_0",  .addr = A_BBRAM_0,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_1",  .addr = A_BBRAM_1,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_2",  .addr = A_BBRAM_2,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_3",  .addr = A_BBRAM_3,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_4",  .addr = A_BBRAM_4,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_5",  .addr = A_BBRAM_5,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_6",  .addr = A_BBRAM_6,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_7",  .addr = A_BBRAM_7,
+        .pre_write = bbram_key_prew,
+        .post_write = bbram_key_postw,
+        .post_read = bbram_wo_postr,
+    },{ .name = "BBRAM_8",  .addr = A_BBRAM_8,
+        .pre_write = bbram_r8_prew,
+        .post_write = bbram_r8_postw,
+        .post_read = bbram_r8_postr,
+    },{ .name = "BBRAM_SLVERR",  .addr = A_BBRAM_SLVERR,
+        .rsvd = ~1,
+    },{ .name = "BBRAM_ISR",  .addr = A_BBRAM_ISR,
+        .w1c = 0x1,
+        .post_write = bbram_isr_postw,
+    },{ .name = "BBRAM_IMR",  .addr = A_BBRAM_IMR,
+        .ro = 0x1,
+    },{ .name = "BBRAM_IER",  .addr = A_BBRAM_IER,
+        .pre_write = bbram_ier_prew,
+    },{ .name = "BBRAM_IDR",  .addr = A_BBRAM_IDR,
+        .pre_write = bbram_idr_prew,
+    },{ .name = "BBRAM_MSW_LOCK",  .addr = A_BBRAM_MSW_LOCK,
+        .pre_write = bbram_msw_lock_prew,
+        .ro = ~R_BBRAM_MSW_LOCK_VAL_MASK,
+    }
+};
+
+static void bbram_ctrl_reset(DeviceState *dev)
+{
+    XlnxBBRam *s = XLNX_BBRAM(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        if (i < R_BBRAM_0 || i > R_BBRAM_8) {
+            register_reset(&s->regs_info[i]);
+        }
+    }
+
+    bbram_update_irq(s);
+}
+
+static const MemoryRegionOps bbram_ctrl_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void bbram_ctrl_realize(DeviceState *dev, Error **errp)
+{
+    XlnxBBRam *s = XLNX_BBRAM(dev);
+
+    if (s->crc_zpads) {
+        s->bbram8_wo = true;
+    }
+
+    bbram_bdrv_read(s, errp);
+}
+
+static void bbram_ctrl_init(Object *obj)
+{
+    XlnxBBRam *s = XLNX_BBRAM(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    reg_array =
+        register_init_block32(DEVICE(obj), bbram_ctrl_regs_info,
+                              ARRAY_SIZE(bbram_ctrl_regs_info),
+                              s->regs_info, s->regs,
+                              &bbram_ctrl_ops,
+                              XLNX_BBRAM_ERR_DEBUG,
+                              R_MAX * 4);
+
+    sysbus_init_mmio(sbd, &reg_array->mem);
+    sysbus_init_irq(sbd, &s->irq_bbram);
+}
+
+static void bbram_prop_set_drive(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_prop_drive.set(obj, v, name, opaque, errp);
+
+    /* Fill initial data if backend is attached after realized */
+    if (dev->realized) {
+        bbram_bdrv_read(XLNX_BBRAM(obj), errp);
+    }
+}
+
+static void bbram_prop_get_drive(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    qdev_prop_drive.get(obj, v, name, opaque, errp);
+}
+
+static void bbram_prop_release_drive(Object *obj, const char *name,
+                                     void *opaque)
+{
+    qdev_prop_drive.release(obj, name, opaque);
+}
+
+static const PropertyInfo bbram_prop_drive = {
+    .name  = "str",
+    .description = "Node name or ID of a block device to use as BBRAM backend",
+    .realized_set_allowed = true,
+    .get = bbram_prop_get_drive,
+    .set = bbram_prop_set_drive,
+    .release = bbram_prop_release_drive,
+};
+
+static const VMStateDescription vmstate_bbram_ctrl = {
+    .name = TYPE_XLNX_BBRAM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxBBRam, R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property bbram_ctrl_props[] = {
+    DEFINE_PROP("drive", XlnxBBRam, blk, bbram_prop_drive, BlockBackend *),
+    DEFINE_PROP_UINT32("crc-zpads", XlnxBBRam, crc_zpads, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void bbram_ctrl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bbram_ctrl_reset;
+    dc->realize = bbram_ctrl_realize;
+    dc->vmsd = &vmstate_bbram_ctrl;
+    device_class_set_props(dc, bbram_ctrl_props);
+}
+
+static const TypeInfo bbram_ctrl_info = {
+    .name          = TYPE_XLNX_BBRAM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxBBRam),
+    .class_init    = bbram_ctrl_class_init,
+    .instance_init = bbram_ctrl_init,
+};
+
+static void bbram_ctrl_register_types(void)
+{
+    type_register_static(&bbram_ctrl_info);
+}
+
+type_init(bbram_ctrl_register_types)
diff --git a/include/hw/nvram/xlnx-bbram.h b/include/hw/nvram/xlnx-bbram.h
new file mode 100644
index 0000000000..87d59ef3c0
--- /dev/null
+++ b/include/hw/nvram/xlnx-bbram.h
@@ -0,0 +1,54 @@
+/*
+ * QEMU model of the Xilinx BBRAM Battery Backed RAM
+ *
+ * Copyright (c) 2015-2021 Xilinx Inc.
+ *
+ * Written by Edgar E. Iglesias <edgari@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef XLNX_BBRAM_H
+#define XLNX_BBRAM_H
+
+#include "sysemu/block-backend.h"
+#include "hw/qdev-core.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define RMAX_XLNX_BBRAM ((0x4c / 4) + 1)
+
+#define TYPE_XLNX_BBRAM "xlnx,bbram-ctrl"
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxBBRam, XLNX_BBRAM);
+
+struct XlnxBBRam {
+    SysBusDevice parent_obj;
+    qemu_irq irq_bbram;
+
+    BlockBackend *blk;
+
+    uint32_t crc_zpads;
+    bool bbram8_wo;
+    bool blk_ro;
+
+    uint32_t regs[RMAX_XLNX_BBRAM];
+    RegisterInfo regs_info[RMAX_XLNX_BBRAM];
+};
+
+#endif
-- 
2.25.1


