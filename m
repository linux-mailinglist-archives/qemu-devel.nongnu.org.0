Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319A45A05F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:37:54 +0100 (CET)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTBR-00082Z-00
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8M-0004Wl-N8
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:42 -0500
Received: from mail-dm6nam10on2071.outbound.protection.outlook.com
 ([40.107.93.71]:58785 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8K-0000gr-Mg
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy5/HTb9vg+eoozEnASbXTzSzxGDm8Ffk8HbA8r5yQZvUpcF92x1C//JYsqnSA5DvpNz+QnY0Y/7N+ShwGpMIuIAsJFVWmrFdq+cxNieM9qDDXoF3f8SmYJBA8RynLEGTa2PzE7a+jkfgeARAN86QFdOUJYTpU9hQJI7zMqk6IknVh/5MFcBiMZIqmpEtmHI7wdmnuQyXlgGLflYBL8+UP1Lz63se9F5tLkWlc2PAI2pSJC+Qe355V/XtwtfzH6cALJyZDPHOAmeb8SYd5j3GruAIm48mYeI0gaBSqpYyndc7syeCq9Wp5hqbH9xTxmonExeZh4H54JMy8/ehiAo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhCzaXc4aImKVpMcjwxjWVho/pSrarlvgXVsQTWFYH4=;
 b=OSWSpQVUw5XsDulkVN3adBKc6YFULHcw3JRRWa6MyjwozdqmFuc3basyyqPJNtKKnk6kK3v1jR/+6V1PklGkqHKgq19p5rRPYVZqy/PYQaDow5MUVY35BQMVIECpfGmYTdI+Y6OR0FNafHQ5ZIyLoN6S9NU6yQS7yA88rRQit77zP7zktPRFU5LewOedX/qseSXyoW9cUdhDvnRyYtTFg0KrsT6YwM4/nhJA8uUsQSzlBvSZeIBKkVdWj8AloLVkI8ZHsVTqlNHOCMahnHQBapkKptVAmlNL0x4iHVCwB8uUS/cBNbrJdiRq4qdRd6BpXfU/MJUD2BCJTKMvAuuG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhCzaXc4aImKVpMcjwxjWVho/pSrarlvgXVsQTWFYH4=;
 b=QQoJ6Z4PevR/8G5NlF+e4BII8HGnXJU+Uq31WfAILADVRO3SCCLczQ8zgVBV1XjZsAkAJ/Labl9UGSRRe3R85pJNii15audofVaOvKMY2e+ttpoUjX1XHPoSfnVidvoWh2aGZJeMYw64j00MLjM4FwSJ8d//e398LyQIE4oAwBU=
Received: from BN9PR03CA0780.namprd03.prod.outlook.com (2603:10b6:408:13a::35)
 by MN2PR02MB6720.namprd02.prod.outlook.com (2603:10b6:208:1db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 10:34:38 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::46) by BN9PR03CA0780.outlook.office365.com
 (2603:10b6:408:13a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 10:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:34:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:37 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:37 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8H-000GX6-8h; Tue, 23 Nov 2021 02:34:37 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 04/10] hw/dma: Add the DMA control interface
Date: Tue, 23 Nov 2021 10:34:22 +0000
Message-ID: <20211123103428.8765-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f15797-826a-44ec-4af0-08d9ae6cd9d2
X-MS-TrafficTypeDiagnostic: MN2PR02MB6720:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6720647CE1AB2B7FC5403CB4AD609@MN2PR02MB6720.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmUvwfgRBqe6T45RbBfsUAv8K71yhl4oYaG/LhMuZ+11ia/QF9z82hcPneOMX6GCW2ajqF2u4zxE0y4TKBnvYtLC8kvpIX2/LgScO4GgiBb7DYepjqO673+o8BoVASYlD14nQkhobLneDI4QiM31kx2dJzVyfgSJ4QwjKLbIf8waqz+IryObV+hRlHPFv5Q11TB5Wl6dj6yVlGJLX5yOhU0mb2F6I5BvdYN3RF7Glj/0fxqEsUiiULYkVmCL8C0/8UG73EKozF2PGGHohXqAyOzUcI/ePJuuANt1UQiPUygXA4GEl2nRlX4w3/YX2byYFcvd94TaqZQdCox8m3WvgLA7SQ/I70/GpOlftcZ720DhPR5QeDHwy87eyBvcZ8/cIRbzRgNu+zSaNgDUjE0DsK34EOi3O00dpDzFDoBrZbgLwBiodsvsdA1cAN9xeY0tq7e3wgzovpD9XVdNE61ZgtFPeAnxjetDZptIRw+jYIUGWoJvKqL4ZAATJPxPZo7OTS81dibQpC36n6gIpJHn/XJJZJX1zC4YpLPI5+7A9KWTkIiFmDg314KUMynkXQ1kLap32qBZA0BsdV38PX8fGAyo+nJoaxkK67lLE2G2IiElZJvQigmcbI6r14nFuuZn3gPpUaoF9mfXgcuhX7whuRqZXlQdEagJro853theL54oOPE6a91nUEYAm7y+4kpTZ8wQ1o0zaSqtetXmNbRjnp3zD2NJuahRWI0Hw3ncA1w=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(426003)(44832011)(8676002)(2616005)(36906005)(8936002)(508600001)(36756003)(54906003)(356005)(316002)(47076005)(26005)(336012)(5660300002)(70206006)(6916009)(1076003)(7636003)(4326008)(6666004)(36860700001)(70586007)(7696005)(2906002)(82310400004)(186003)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:34:38.2365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f15797-826a-44ec-4af0-08d9ae6cd9d2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6720
Received-SPF: pass client-ip=40.107.93.71; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


