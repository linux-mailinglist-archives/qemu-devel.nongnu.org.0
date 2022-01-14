Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDC48ED2B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:35:04 +0100 (CET)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ObX-0002Y7-Pz
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVf-0002J8-T8
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:00 -0500
Received: from mail-dm6nam10on2059.outbound.protection.outlook.com
 ([40.107.93.59]:25499 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVd-0007Vm-VE
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYDJhaakqOoGM06AIXJ97jzwM1K2LOxTa8OW+wq0Tgo3EXVIgKgiJzAW/qyAO/sMv+Q0z7JVevt5kicNl22MFLwH17tvhwhEzwjy/lMd879hzOVbZy1Sk+FP0PePMYGNoNUMSkPaLbnGv+XsEwR9ZKOdb38qRUqOJt9qOo7bTeFRRcXSmyE74alAUpn6Lx2IqK3S16MUwjuTmBXjCoNYb/9gmM7lk4T3EgiYwlwQcLEh0DG/EwS1Bg0uBzcZTgA7JTejxO2w1lhFVszAVSBjB/CHNMuFIEnmb2OXWKMLEftHxiKVLD6mRKfJTrUUoTztEFS9wyWrAtp2iqodGuTUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR+6+gEJkHsGXfO7T3UX7htd7wAbSADkBDIFyvNdKUE=;
 b=Wn2U65kzMBvp81Ymc7s69tNvw3o//U8isHRg4B0CRbb1ZIV27hgdjZ+aP7no9ydSH+KmCFvbTLu2K7eP/uLzLq7dG34Yv8oEnH0jDTNl0Zfix2mPBN2sMGnPVkdkZmF2xLBd14QPtmZZ5BLsLsAsdTLrhTCREoOG88up9DLsfwHyJtHXIPD8HTIIlQsxxG3zMaFptldzTnArpZeq0qmKvVrjudGPIfD2mCQMjLskLWadTyZJ4ktBwQL5Cadftejl7LPahtfeAkQtc/X+Uv6emd3SliPc1jENGAdg+N7WVODXnOPRMtFtsnC0oGfEzAkTrJ9zR18UASMz3T5e3EvQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR+6+gEJkHsGXfO7T3UX7htd7wAbSADkBDIFyvNdKUE=;
 b=G//wgw5AO/c0b/nicYMajqSyDf5GrpgqTSZKmZudqKtxecJbrFSAqnKclhQ0yD1hp8CsGoKUtPUt/kZop7wecK9rJaQk/F5m3e10TtvJsliTwRC6H6AFLDSXtUwDjMiIV4I3164iUr6yzDpDZvrgPQZJzSNRtVY7ShSpoxdM27A=
Received: from SN4PR0501CA0049.namprd05.prod.outlook.com
 (2603:10b6:803:41::26) by BN0PR02MB8158.namprd02.prod.outlook.com
 (2603:10b6:408:16a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 15:28:55 +0000
Received: from SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::58) by SN4PR0501CA0049.outlook.office365.com
 (2603:10b6:803:41::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.2 via Frontend
 Transport; Fri, 14 Jan 2022 15:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0039.mail.protection.outlook.com (10.97.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:28:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:54 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:54 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVZ-0004L4-S8; Fri, 14 Jan 2022 07:28:54 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 05/12] hw/dma: Add the DMA control interface
Date: Fri, 14 Jan 2022 15:28:34 +0000
Message-ID: <20220114152841.1740-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 174a2849-0133-45a9-84fb-08d9d7729348
X-MS-TrafficTypeDiagnostic: BN0PR02MB8158:EE_
X-Microsoft-Antispam-PRVS: <BN0PR02MB81584BCD809C38CEFAE8C433AD549@BN0PR02MB8158.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/RG3zX6Swrzq+32H09399DuB38y+ZS36wKZuWbBfuIEOj3Hg1JRSDdiylNUA6/XSzNLMgC/GF0JbxB6IWnfx2FO5qvLNuRAqnvUj5iv766wZAYQFV8j4SpUOXGWlzpuQv0rUN/zRdxyuyA9et3wQqfQ5osP/yMUQ1VmPxT5DCW/ad6xZ7iK0lYyk4VkdD9syvpPWu0o8JTA1PCrr/B/GsV90xTT0GAQo3+61nhzDm6NaQPatUaDLEss8FJ3QD9/klBqlNJPxJoKWKhjH/tZ7jJY4LuTO+uW+rWo30iGz2PC43hlYPmmTdAx2hrFwRMj/dyobZuZu1OMMttQGRDVg+cB9ku6pJqvMJKlzeyUBlwGvJxSBFsspJOv6gorQF5u6jHImeP3lAt9O2dmHsFeitBCN4ZIlCLuXnYIFuj89hdDL6Hc4li0Xjtl///MKmedc9RTQ66thEzmhCPUr+mphE/RfKWFMGCH0ZoENBa+eFxaHNHqKa4COK8FXIUU7qwp4kLff6xK8TQFRo6bF7pAYpMqc3+rdYy+vJIqq/7FPcQqLswPs2v/AfxleRPIyZDDoSonrwzIMjigHWalLOUAQy1PNcMDRiOktkuafrpszm8VxbMIfY6aoVBTWHFnn85TlqhGOlYgrG3IY5jBAmMN7DQ+kTspF4WKXsk5Y7fyQZsZlVCI83nABJx6om7WOaVVbAnxywe9r6DkQtEC8iwsl5UE5lwm392fODw1YtEsFI4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(508600001)(5660300002)(426003)(2616005)(8676002)(8936002)(6666004)(186003)(82310400004)(356005)(7636003)(26005)(47076005)(1076003)(36756003)(336012)(7696005)(36860700001)(9786002)(4326008)(54906003)(316002)(44832011)(70586007)(2906002)(70206006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:28:54.5945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 174a2849-0133-45a9-84fb-08d9d7729348
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8158
Received-SPF: pass client-ip=40.107.93.59; envelope-from=figlesia@xilinx.com;
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
 hw/dma/dma-ctrl-if.c         | 30 +++++++++++++++++++++++
 hw/dma/meson.build           |  1 +
 include/hw/dma/dma-ctrl-if.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 hw/dma/dma-ctrl-if.c
 create mode 100644 include/hw/dma/dma-ctrl-if.h

diff --git a/hw/dma/dma-ctrl-if.c b/hw/dma/dma-ctrl-if.c
new file mode 100644
index 0000000000..895edac277
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
+MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len)
+{
+    DmaCtrlIfClass *dcic =  DMA_CTRL_IF_GET_CLASS(dma);
+    return dcic->read(dma, addr, len);
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
index 0000000000..0662149e14
--- /dev/null
+++ b/include/hw/dma/dma-ctrl-if.h
@@ -0,0 +1,58 @@
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
+#include "exec/memory.h"
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
+     *
+     * @return a MemTxResult indicating whether the operation succeeded ('len'
+     * bytes were read) or failed.
+     */
+    MemTxResult (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
+} DmaCtrlIfClass;
+
+/*
+ * Start a read transfer on a DMA engine implementing the DMA control
+ * interface.
+ *
+ * @dma_ctrl: the DMA engine implementing this interface
+ * @addr: the address to read
+ * @len: the number of bytes to read at 'addr'
+ *
+ * @return a MemTxResult indicating whether the operation succeeded ('len'
+ * bytes were read) or failed.
+ */
+MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
+
+#endif /* HW_DMA_CTRL_IF_H */
-- 
2.11.0


