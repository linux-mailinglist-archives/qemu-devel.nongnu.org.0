Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA1D474143
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:16:01 +0100 (CET)
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5mq-00046x-SO
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:16:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5be-0007jL-MA
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:29 -0500
Received: from mail-bn8nam11on2089.outbound.protection.outlook.com
 ([40.107.236.89]:48577 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bc-00071W-B2
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2GAZhIlepJWPWvxLdRPWIlI3Y8ii4T69GBezZrnzGlj+9PfsWXlYwT734htUCTKwgo71m1JWGm65s85QZMZoZ2DQIDUPZG9FvFIDevXnahNOYhhmTe3aTxRrIV6tR3OpejxVzjIJi9RhA6tKYV1VDKLd3ui2QXmAQQMn1bSNgrbllj+fWpUNwD+aLTF6WOgm8xA0HjKzF46zUSmKo8363UTy0IJLgOVIdi+0YFjt6DCvEb8CBccbsnlf+HpbirHREBQGCMOUGcG0oLxa44jZ2HB7xENF2UIMBSN992VjCUNZE26e2Gk1Y/nSUxnrjn+qJXWy4ILvqByr232wDVkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc/b93xzdDMBUpaAHnRB2pjCA4XAldDDz9WPBLONyyY=;
 b=Kf017WXXhT6gVF3hTrrnTS4F5FtCcpQo/JpTDOAxNAUTcsBxh3Nm7I7J8z26xF6R5Xn5NgRuiERvCrRQhwwHYTdzlVlAFYZxoHnt9CXhpMzIFbL7LRIKNOCmwLkT1CAlxJpPYGDvViWSXlSjikH74wLUzBzWxPHxVwqzZYCWVJVBLTY2xmPDOYWGPfOA8019tujRMX6m0MeEmB7O5cfMCrCO4MBdbo7nrGzPKM1k9btFCj1c6bg4xyjYJLWn+id5/M3/xbLGEkBT+crtewf6oiVV/UBfmH0d3795kRvR1H23d/UGHthvWNDgoarwidzP0qrFhJ0k6m4w0yFLyy9eIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rc/b93xzdDMBUpaAHnRB2pjCA4XAldDDz9WPBLONyyY=;
 b=kiOtGbjft6TsnYt8qvCbOiAUAA5g04scnsG5MBbIsRNEEmmMjUJuGWdKR5FlLTweGMDg9TKFeDT3SoA/r8lc8TyaqbhfGACvVW+i9CxzGXb6vqhRRHubsWnhcBXOuDrb7tBv2xqYJ/xEi7Lu+95iZoOSMD6dlnszXSCY2Kwiju0=
Received: from DM5PR15CA0067.namprd15.prod.outlook.com (2603:10b6:3:ae::29) by
 BYAPR02MB4120.namprd02.prod.outlook.com (2603:10b6:a02:f3::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 11:04:18 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::55) by DM5PR15CA0067.outlook.office365.com
 (2603:10b6:3:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:06 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:06 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bK-000F5K-5l; Tue, 14 Dec 2021 03:04:06 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 05/12] hw/dma: Add the DMA control interface
Date: Tue, 14 Dec 2021 11:03:47 +0000
Message-ID: <20211214110354.21816-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6297560f-9d6d-473b-9423-08d9bef1797b
X-MS-TrafficTypeDiagnostic: BYAPR02MB4120:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB4120207D6EBA4ADD5F4148D8AD759@BYAPR02MB4120.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5V/6cBFrW4nGv1rG1EKEFVN0BvLpYQEotVgiUpfiJW97h4DTqvJiKOko549iU0Q9PqVMB8aNogV1oTGmHlbbV+NiklkTUBzIre0CpPFfCIIyrHhpL48iwsY1dFGVOg1HhkMhf1hc125BGE6QJAe1mrcRsbkHB0l3H7clivyZ2vuCZUjEbf81xnYEssS9WL7J9jt08aD5ljT96NHaYwtY3j9ODcTBtJ9dr3Zh/rQxOOtLr/L7fZTNvCjqX5TeNc47D5YEMFmw6oCcsOQ+Ryjx6HO8bNtOV/RB9zmdSFe+Vpoqg5pKDPTkBAIzCFAYRKe3pYGiHhL0Luv1BRr3XNA/o5CIx6BeCsPwbG2CwN01pJ3Pe5E+qqM5pG30azFol6y0YV2Q/x2nvy6y2e8t2EV17dlvpynFj6BMLir/OOD1CaTqj1OwMwdhOMAl0DP8FXv6x2mksyJ5+mXJQMsEr2VyZoe96i7tXS69fLMbuB0wCAdFCuRn6vz0+IwUIM5RTJJTmgbzqSkEkQn4l6zj+nSJChwbT5GCDwIM6wGrxQWXJRPhqHbq/5wM1z2wBuJdg9AolADlKKZY3xZQ0g7LtB+NzJq0z/EOH8R8vuBmQmXYeEBv48/OxUpRVZe3amwtOv4r4ig1+iV+lLT5+0XMfrGLwgNs7z4eFujgiteVaQYj/gHF2XOYSsW+aZOjL2QnbCVgEq9oq3n+9NP5rTCJSQABrKEicEHhh+JJfTuVP1mNmA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(70206006)(4326008)(70586007)(26005)(316002)(8676002)(54906003)(8936002)(5660300002)(7696005)(9786002)(6916009)(1076003)(6666004)(508600001)(82310400004)(2906002)(36756003)(36860700001)(2616005)(44832011)(186003)(426003)(336012)(356005)(47076005)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:18.3236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6297560f-9d6d-473b-9423-08d9bef1797b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4120
Received-SPF: pass client-ip=40.107.236.89; envelope-from=figlesia@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An option on real hardware when embedding a DMA engine into a peripheral
is to make the peripheral control the engine through a custom DMA control
(hardware) interface between the two. Software drivers in this scenario
configure and trigger DMA operations through the controlling peripheral's
register API (for example, writing a specific bit in a register could
propagate down to a transfer start signal on the DMA control interface).
At the same time the status, results and interrupts for the transfer might
still be intended to be read and caught through the DMA engine's register
API (and signals).

This patch adds a QEMU DMA control interface that can be used for
modelling above scenario. Through this new interface a peripheral model
embedding a DMA engine model will be able to directly initiate transfers
through the DMA. At the same time the transfer state, result and
completion signaling will be read and caught through the DMA engine
model's register API and signaling.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/dma/dma-ctrl-if.c         | 30 ++++++++++++++++++++++++++
 hw/dma/meson.build           |  1 +
 include/hw/dma/dma-ctrl-if.h | 51 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 hw/dma/dma-ctrl-if.c
 create mode 100644 include/hw/dma/dma-ctrl-if.h

diff --git a/hw/dma/dma-ctrl-if.c b/hw/dma/dma-ctrl-if.c
new file mode 100644
index 0000000000..30b6ff8d90
--- /dev/null
+++ b/hw/dma/dma-ctrl-if.c
@@ -0,0 +1,30 @@
+/*
+ * DMA control interface.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+#include "hw/dma/dma-ctrl-if.h"
+
+void dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len)
+{
+    DmaCtrlIfClass *dcc =  DMA_CTRL_IF_GET_CLASS(dma);
+    dcc->read(dma, addr, len);
+}
+
+static const TypeInfo dma_ctrl_if_info = {
+    .name          = TYPE_DMA_CTRL_IF,
+    .parent        = TYPE_INTERFACE,
+    .class_size = sizeof(DmaCtrlIfClass),
+};
+
+static void dma_ctrl_if_register_types(void)
+{
+    type_register_static(&dma_ctrl_if_info);
+}
+
+type_init(dma_ctrl_if_register_types)
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index f3f0661bc3..c43c067856 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
+common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl-if.c'))
diff --git a/include/hw/dma/dma-ctrl-if.h b/include/hw/dma/dma-ctrl-if.h
new file mode 100644
index 0000000000..0882cf0a57
--- /dev/null
+++ b/include/hw/dma/dma-ctrl-if.h
@@ -0,0 +1,51 @@
+/*
+ * DMA control interface.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_DMA_CTRL_IF_H
+#define HW_DMA_CTRL_IF_H
+
+#include "hw/hw.h"
+#include "qom/object.h"
+
+#define TYPE_DMA_CTRL_IF "dma-ctrl-if"
+typedef struct DmaCtrlIfClass DmaCtrlIfClass;
+DECLARE_CLASS_CHECKERS(DmaCtrlIfClass, DMA_CTRL_IF,
+                       TYPE_DMA_CTRL_IF)
+
+#define DMA_CTRL_IF(obj) \
+     INTERFACE_CHECK(DmaCtrlIf, (obj), TYPE_DMA_CTRL_IF)
+
+typedef struct DmaCtrlIf {
+    Object Parent;
+} DmaCtrlIf;
+
+typedef struct DmaCtrlIfClass {
+    InterfaceClass parent;
+
+    /*
+     * read: Start a read transfer on the DMA engine implementing the DMA
+     * control interface
+     *
+     * @dma_ctrl: the DMA engine implementing this interface
+     * @addr: the address to read
+     * @len: the number of bytes to read at 'addr'
+     */
+    void (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
+} DmaCtrlIfClass;
+
+/*
+ * Start a read transfer on a DMA engine implementing the DMA control
+ * interface.
+ *
+ * @dma_ctrl: the DMA engine implementing this interface
+ * @addr: the address to read
+ * @len: the number of bytes to read at 'addr'
+ */
+void dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
+
+#endif /* HW_DMA_CTRL_IF_H */
-- 
2.11.0


