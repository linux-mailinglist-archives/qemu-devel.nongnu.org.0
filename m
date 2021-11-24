Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0045B85D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:28:38 +0100 (CET)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppW2-0002hg-13
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:28:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppK2-0001D0-HV
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:14 -0500
Received: from mail-co1nam11on2052.outbound.protection.outlook.com
 ([40.107.220.52]:11360 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJz-0002cL-AR
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6CbiyGzR+0a/IoWnXvJDWg9celC4xPOgL+LVPUOts3v837KhITCMW5QnUp5sVJR0ISiEhEjusVsLqX8zXILz+cI75mBuBfBkxue1T2U/m3Uip9HO85nw7Gavz3GnXaEbbaJy0/ZoU8jBDP94y6D+bvM29PNqDB75MM/2EJNcUa3I/S6TbS69jgDbo4Go9KqTHo9lLRb7HNwXEBoxFwqin/PuYK+zXwnAUHyv/iUpVvn+mmwzeImsFsWKGnfexQ/Z4OWScb3pJBmQQ5RYPUAkRKaBfCrsN1qMQ+r8m90UnT9RHPHfIQL1TCbKxRQexvRW7ZAXtEYyDx2X7bqkhKy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhCzaXc4aImKVpMcjwxjWVho/pSrarlvgXVsQTWFYH4=;
 b=FmaSVC1MredAXl5Psaty1517iCB8UCwxTahPVmWORiryV7Or5knRdJNHSYLBl/8ssZ+tksBn5+XvAW27cHnU7a1hV7WXDyH7C6c6PraQFdpuPmZL1eeeeDXUb+/OWc8YrzJx66EShFNjCqwZNtA5W1Urt+//xl0COoe2OPXVtlroY0MxSLlIZibt/ekTx3BFhUUFi6mtiYvxciTSjt0GPerfrOruoiCB7outgu2J5zRjCykQ/7Nk0Sd9cneTuOGjNr8tR74MA2bsE7h4dOuTVkfLLgEPr3tZsV7LM0cVv3mcZxXM6SpO6CKi20GM6OlNpdl+3cbIvokrvI+8Nyf3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhCzaXc4aImKVpMcjwxjWVho/pSrarlvgXVsQTWFYH4=;
 b=icWuLg43ezqEUw7kWOI8qIZPF5aMbs90yEgKuykkPfu8nDF6dWoTmLrgrU7t7AzBWjosVp811VL6hS6zzr3aCILh2zVRQgr5l5OnTe1PT1DJGz/TPC2fY4+mxN39Ee2kIat2M0JKny9VV6aXWuwgGPTa6Je7BFUdRHhy3bIngvk=
Received: from SN4PR0501CA0080.namprd05.prod.outlook.com
 (2603:10b6:803:22::18) by CO1PR02MB8393.namprd02.prod.outlook.com
 (2603:10b6:303:151::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 24 Nov
 2021 10:16:07 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::ff) by SN4PR0501CA0080.outlook.office365.com
 (2603:10b6:803:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.6 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:07 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:05 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:05 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppJt-00036z-KN; Wed, 24 Nov 2021 02:16:05 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 04/10] hw/dma: Add the DMA control interface
Date: Wed, 24 Nov 2021 10:15:49 +0000
Message-ID: <20211124101555.1410-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17d46330-590d-4a4b-0826-08d9af336df4
X-MS-TrafficTypeDiagnostic: CO1PR02MB8393:
X-Microsoft-Antispam-PRVS: <CO1PR02MB8393C7171CB0767A7222FC85AD619@CO1PR02MB8393.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYrEi9D4Kw9WaauZJtc77qU6aj5G4JgGH4S1H5fiTfHWfKGA6vqA9E34EUv/GH/q53OgtBx3WpHaLru51T+tIpFucVEzGbz5OImWte3IOJlIBFrTskGJu/lQPLKKKtJ5UbhsHGV/gQjNGpyz69gcvVDz6ZzHl4fhqVx0eRdF3jIKvcrgaonna6GJHNbLjVs9i6l9nLHeSJFfRMvbAvNoiBF4+4Oy8qXxUUdOgYO7x/QYtnvBEYpNcluM+NV/qBjNH2dr3HhRBSPG0Z8xw/kQYjGIQ+HJPsj5KM4HspqM92GDUxN6X4BXnAma8RQOXb4qBpWx4VPAPFrw0QIWhsPcu17SdAYuMIn+T8M/+LIPZDeTWfUMJzTn47tXhJgKNEx6MCuSVFaCrco+03a0/Tod3cJtETG0pN6I0LMokks/Oz1WcG5kIEsDljJ/lMNtOGqLeUUGwhgh1mQKUEwXsch0tYhpQkKK1hNDv4FOOH0KUf1pneC1Slzt4IyucyPOhX3+T79lP371pT6Jyg6zcqXvZdeFpg8SoEPKs7a2YZNwU6gGowXgruJILvgFu5SwQUCwn21YGaNz/mlqZWIFIvxiKZ0FJ9jdPvl/NwOJTlYCi2tJo8nZFAYYVmmwrHcMEvLUJzYTo9mJtEGDKXYlsJGeeyiqjCrB+J25tlKIhDEoiGm/IIoQ5vX0y/kPVNFSO/79n/yFQM87C7GhJV5hGHoyp5NiAyynczRze837404WHtk=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(186003)(47076005)(26005)(6666004)(6916009)(426003)(70206006)(336012)(70586007)(7696005)(7636003)(36756003)(5660300002)(2616005)(356005)(44832011)(36860700001)(1076003)(4326008)(9786002)(82310400004)(508600001)(316002)(8936002)(2906002)(54906003)(8676002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:07.1728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d46330-590d-4a4b-0826-08d9af336df4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8393
Received-SPF: pass client-ip=40.107.220.52; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

Add an interface for controlling DMA models that are reused with other
models. This allows a controlling model to start transfers through the
DMA while reusing the DMA's handling of transfer state and completion
signaling.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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


