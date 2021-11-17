Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CA4548A1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:24:12 +0100 (CET)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLr9-0008M8-OD
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:24:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmG-0008JA-CK
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:08 -0500
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com
 ([40.107.236.81]:28128 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmE-0004Wu-6P
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRlSjawLG3xiEc6NI+1tSpsAibFJ938ezBlPZD9a3AKgAGR7CM3YPK6sWr4U/A+KM+k1czP42d4h1juPARM3+8a3AkL1rG/07Jy7TS7h8ZQHN75PZFqaI3C7CwI6OQBF8A9EZA47yqpkvkSeFonsAb3spmI/b62bJPOPEQLHzsg/YFDRSvXuYwPVCcwOq2lmetEx1EFVfAB5wOyLDbjfILQtlM/RYYcStYdiTdKYqVZA2kk/khKQXPkyEPl7oONNLqJt00l3V+A5Z95v4dVmDLPm8alf5bw2mtvGTrMLaabhhaiCyneEnrUE0ndnUoy2aO+KtJPrki8xD6NkxhBlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3bKyWmG9rYEEkJrNsL8UqbG9n72GI/jmPeH4xqMl3U=;
 b=Lk5jn2lJeSJJnvlNiYE7qLs1xQDpkMuV5QyGvzfYHe3XpSJ4lsYAl2b5g95rP7NdcjJkQ/5vYr5L8bxrrZm0GaNbIpVULN89ZbZu7wYT9JG1F44Sz27vgbqFQYohgDsLm2RwL5lHnl54Qu0Shr3LXg9M2PaNBtVQotEjsKcQR31gfOtPcNxx1RT8Y6Qn2qC//Y4uGK01yG6oxWd7DcQwKHcktPrVfnunI6SXcxDzAI0e5BAVxY2I32kzezwq4xpYFRsEGRJ7Mmhz0vT4iVhHckLONIaRsPRVDZj6F4BvzDaNINoOJOc2cYrUYYJT0vbCT3yFXGis5fOxFaUJ8u83Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3bKyWmG9rYEEkJrNsL8UqbG9n72GI/jmPeH4xqMl3U=;
 b=QslA+hoXiv/mGEF4dTH2uBFPZlEARtYXtuUeAj1NomQ0s8ezEJmPQrWZ9LyZC2mjpW0d1D4OG+Bgu5OhpXbFJa1ag1PJ+wc4KwDRjnIIBPYyCI89x1RF5Kb3EWcrB8UL0igPKDKaDFRywId6nm3B4Eq79qJtCC3V5lNGTTCm9Bk=
Received: from BN7PR06CA0056.namprd06.prod.outlook.com (2603:10b6:408:34::33)
 by BN7PR02MB5027.namprd02.prod.outlook.com (2603:10b6:408:2c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 14:19:03 +0000
Received: from BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::c2) by BN7PR06CA0056.outlook.office365.com
 (2603:10b6:408:34::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Wed, 17 Nov 2021 14:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT064.mail.protection.outlook.com (10.13.2.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:19:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:50 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLly-000Dy8-I6; Wed, 17 Nov 2021 06:18:50 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 4/9] hw/dma: Add the DMA control interface
Date: Wed, 17 Nov 2021 14:18:36 +0000
Message-ID: <20211117141841.4696-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8387379b-fa82-4efd-b718-08d9a9d5354f
X-MS-TrafficTypeDiagnostic: BN7PR02MB5027:
X-Microsoft-Antispam-PRVS: <BN7PR02MB5027643788837089220A79E9AD9A9@BN7PR02MB5027.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9SX2YoEsWxDpOp+nUnZqg4QdNa14lZLYsnovwZ3xWGrF5I/aOsKSYz4sYqfwKk0UpIeL4KbgsZxUYY6faxv5YTaTCZD0tjuBMvr9SCqp60SWFrYPN3AFOOs4/sAM6taYA3AlprUIv0d4EoefgYlleU8GhgI09Mt+SQIh18z4AIdslRi5YInTM5rgLfK3OnMSp7xm7FJjYguNtJ7/uMEYQJca7pXTOFhN9F/ZkAQEZYpEOXLBirhxzJOgjz3u1x2BGMZacQQB2p9IbYGxFN6+lBP+rGw3UFS7MMTZZWYkg1uERp6opuONwqfolpSu/4t/FlxRW5XKe3sGEQJbza77QVQ4VNt0EtOogGSfGdEOcOn7ITYJRpIcUqE6oH/WpoovwBMJU51573Uh1Y3fWsP9sAfnRLF8IT9H/SPHqK/7fXO2fs3eXXZCmu4TeQwGgVKePPm1NanEV1KLT/OAn06Gz7ytqUCv9V4aEXqRRbua8tl1ZwQTmK4sB4puGsk4dKz3eYboYdYd9Wkn5E6xI/BIvrHU4sfLa9P5bcgohAN4Y6PiiKkaIwW9vHGO5C22J7M6qYNrBc1w3t1UT/4e0L8BkrVEB2rw8qYPSR5Cr3TERjDAbSdqUgg1jKSc8X3vS88pcLyx2+6tnB7wTg0Uqtc+b/KTc9zS7+NxKL0zL/ZkJH4A6Zdf1uj9xefc2tfQBeQdss+uOj9GGMNtGQm7SMgUFVi+tX1R2TeIf//0zxjJ3rw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(8676002)(7696005)(36756003)(26005)(2906002)(9786002)(82310400003)(5660300002)(7636003)(186003)(2616005)(1076003)(44832011)(36860700001)(508600001)(70586007)(70206006)(8936002)(336012)(356005)(426003)(4326008)(6916009)(36906005)(316002)(54906003)(6666004)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:19:03.5771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8387379b-fa82-4efd-b718-08d9a9d5354f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5027
Received-SPF: pass client-ip=40.107.236.81; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an interface for controlling DMA models that are reused with other
models. This allows a controlling model to start transfers through the
DMA while reusing the DMA's handling of transfer state and completion
signaling.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/dma/dma-ctrl.c         | 31 ++++++++++++++++++++
 hw/dma/meson.build        |  1 +
 include/hw/dma/dma-ctrl.h | 74 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 hw/dma/dma-ctrl.c
 create mode 100644 include/hw/dma/dma-ctrl.h

diff --git a/hw/dma/dma-ctrl.c b/hw/dma/dma-ctrl.c
new file mode 100644
index 0000000000..4a9b68dac1
--- /dev/null
+++ b/hw/dma/dma-ctrl.c
@@ -0,0 +1,31 @@
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
+#include "hw/dma/dma-ctrl.h"
+
+void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
+                               DmaCtrlNotify *notify, bool start_dma)
+{
+    DmaCtrlClass *dcc =  DMA_CTRL_GET_CLASS(dma_ctrl);
+    dcc->read(dma_ctrl, addr, len, notify, start_dma);
+}
+
+static const TypeInfo dma_ctrl_info = {
+    .name          = TYPE_DMA_CTRL,
+    .parent        = TYPE_INTERFACE,
+    .class_size = sizeof(DmaCtrlClass),
+};
+
+static void dma_ctrl_register_types(void)
+{
+    type_register_static(&dma_ctrl_info);
+}
+
+type_init(dma_ctrl_register_types)
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index f3f0661bc3..c0bc134046 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
+common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('dma-ctrl.c'))
diff --git a/include/hw/dma/dma-ctrl.h b/include/hw/dma/dma-ctrl.h
new file mode 100644
index 0000000000..498469395f
--- /dev/null
+++ b/include/hw/dma/dma-ctrl.h
@@ -0,0 +1,74 @@
+/*
+ * DMA control interface.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * Written by Francisco Iglesias <francisco.iglesias@xilinx.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_DMA_CTRL_H
+#define HW_DMA_CTRL_H
+
+#include "qemu-common.h"
+#include "hw/hw.h"
+#include "qom/object.h"
+
+#define TYPE_DMA_CTRL "dma-ctrl"
+
+#define DMA_CTRL_CLASS(klass) \
+     OBJECT_CLASS_CHECK(DmaCtrlClass, (klass), TYPE_DMA_CTRL)
+#define DMA_CTRL_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(DmaCtrlClass, (obj), TYPE_DMA_CTRL)
+#define DMA_CTRL(obj) \
+     INTERFACE_CHECK(DmaCtrl, (obj), TYPE_DMA_CTRL)
+
+typedef void (*dmactrl_notify_fn)(void *opaque);
+
+typedef struct DmaCtrlNotify {
+    void *opaque;
+    dmactrl_notify_fn cb;
+} DmaCtrlNotify;
+
+typedef struct DmaCtrl {
+    Object Parent;
+} DmaCtrl;
+
+typedef struct DmaCtrlClass {
+    InterfaceClass parent;
+
+    /*
+     * read: Start a read transfer on the DMA implementing the DMA control
+     * interface
+     *
+     * @dma_ctrl: the DMA implementing this interface
+     * @addr: the address to read
+     * @len: the amount of bytes to read at 'addr'
+     * @notify: the structure containg a callback to call and opaque pointer
+     * to pass the callback when the transfer has been completed
+     * @start_dma: true for starting the DMA transfer and false for just
+     * refilling and proceding an already started transfer
+     */
+    void (*read)(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
+                 DmaCtrlNotify *notify, bool start_dma);
+} DmaCtrlClass;
+
+/*
+ * Start a read transfer on a DMA implementing the DMA control interface.
+ * The DMA will notify the caller that 'len' bytes have been read at 'addr'
+ * through the callback in the DmaCtrlNotify structure. For allowing refilling
+ * an already started transfer the DMA notifies the caller before considering
+ * the transfer done (e.g. before setting done flags, generating IRQs and
+ * modifying other relevant internal device state).
+ *
+ * @dma_ctrl: the DMA implementing this interface
+ * @addr: the address to read
+ * @len: the amount of bytes to read at 'addr'
+ * @notify: the structure containing a callback to call and opaque pointer
+ * to pass the callback when the transfer has been completed
+ * @start_dma: true for starting the DMA transfer and false for just
+ * refilling and proceding an already started transfer
+ */
+void dma_ctrl_read_with_notify(DmaCtrl *dma_ctrl, hwaddr addr, uint32_t len,
+                   DmaCtrlNotify *notify, bool start_dma);
+
+#endif /* HW_DMA_CTRL_H */
-- 
2.11.0


