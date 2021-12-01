Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5333465221
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:53:19 +0100 (CET)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRv5-0002BO-14
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRj2-0003oO-A0
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:52 -0500
Received: from mail-mw2nam10on2059.outbound.protection.outlook.com
 ([40.107.94.59]:24736 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRj0-00009k-0d
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqyM1Kv8evdHvPdi7OQFzR47fWeqSZkQ9B8DPKqVGInTljBPnX6IIu9/fBJ3gmKP4NrSPP7uAmL6nlOrczUNbhoHvqMikzQgP09ldVJJe0D/P4Ya17F9MWJ7y4MC9H4FDUUVs0Er9oWaDFPHoOLWGBND3HXEFBesKXo+iQ2xHtpr+1/X93evPmL50DpY2TYa3U/B3W/SqhwIu0BqFynlBBQZp7csyDcTBCtuhCdmsQ/KxNqPpWYB+TF8yAIW/UQ6o5rQdvvqou/5Y0om3luW39SB74v0fa+r1tMcSDCR5HFIBQY0y2NgJCkBAkVYdRLe/jMox3GpzTMpt0ASqjRHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMV5nfrL/oNMTUchKu4IeU0JKTBzmYNFDepWAVRZNVY=;
 b=NbTNLaG+GyX8X+I6K4MkSvh52jpJyd+UPGseB7Gn0bujkJXgAsOUXiP+vJlkNrx2NqAaV0H/nhDATL1SYI8hzOXdbXd66WbRMwGgQDb8meAaCYU4mxhdWgF6YhwfjFQF+KZdxGsENAekJpHs9kgJTJsnDt6Ib/wl3eUxsfBgv3QyBwOIT4dbH+FiV00E6fs4XoRUh/ytTyM0sTbVdUTm8ox7RlhnqVGDj07tTJZN5CNivLFQhGT5FPjK42tJsZwmMZZjgBvWHzW04O0f13OvjS6Uz0n1v5gobMepGgNHZrWhRi9wgLkTpun+oW793SEnC9F8WExnO5n1FGmhPBhxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMV5nfrL/oNMTUchKu4IeU0JKTBzmYNFDepWAVRZNVY=;
 b=AgvBDxPyIQ1I/PAv7cZ04Eq6imt1fBbL2eiMxZJQznSO1o/XHCRwKL6srenK1mL7gyNeZI8uTfiJbEX1wmfJS8fISOv6pw2i5hUQmucV02Ky26Stc6oSeMOB5eG4BqjLBJJr/LnhBXhBSpYAzART5946g6rYxLnTNzHUsVcO6Tc=
Received: from DS7PR03CA0272.namprd03.prod.outlook.com (2603:10b6:5:3ad::7) by
 BN7PR02MB4130.namprd02.prod.outlook.com (2603:10b6:406:fd::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23; Wed, 1 Dec 2021 15:40:44 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::93) by DS7PR03CA0272.outlook.office365.com
 (2603:10b6:5:3ad::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:34 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:34 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRik-0002FY-3X; Wed, 01 Dec 2021 07:40:34 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 04/11] hw/dma: Add the DMA control interface
Date: Wed, 1 Dec 2021 15:40:16 +0000
Message-ID: <20211201154023.13931-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43c5571b-4a95-4371-f234-08d9b4e0f021
X-MS-TrafficTypeDiagnostic: BN7PR02MB4130:
X-Microsoft-Antispam-PRVS: <BN7PR02MB413046DC1587C58A4DC9B0BAAD689@BN7PR02MB4130.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AcAB5/8d0pQowFxcUZO9moT/IiIqDwjSYRiuEm5G98HvWURK0ocNeG4Z30PRgVN+m/k/dL2vQachwr+W4r01Y6bPqobKGkrrmG1ajH5003gY8AN8182ldZszEMydhLyAygJ2HjZM+SSlLYG87+nhzkVw7UdhaK/fQc3x8HkaJEmhigGHLWQzJIlfAwb2E3VOD2/w04SvGIv77WGbNblnMY93KJNipIp9zqhHjdmxGPoPtQlTT9N9uKzYbLGH3aLRtp9POcMbnHC4sb8Hi51kQ8GKsKme8RvaqogVhxB2+g8ADM18e15zZZlJ7tLZ6bxOBBo9Lzj5hmSefdHOjdvgvqX+dTXodURaNBLzBTIZ7ecULGbccTxBm/npDNhZvJINjOA8FLrVjbB+rNmBdJqEMd30u1nhbdvl+LIYOwa1VmiquIpDb95fzXMDY2kLevf7s74mrF+vBweMTS2j1chFMkYTeQVJZTR25guwzz2f6Z96IeuDCd+e1hs9puPJoL0Wb/YaZKcLwSY67b1RPxbxw6dtVyA855wX9+URwAZyQeKV8LdKMj89ukYk1nInozfsft/3x6OhJhkfW0PKmwNq6BlNLJ9Hq83rQk4tCRvh5rmZyvRvIR0OKq7GVnZD7Qs+icMrjb2l3WbNW5oRlFi3ck86wGy0IYfPqqCh+dcjcAcPBwlKstK9CimqbJ19F13XI37QfDn9SFisKUacBVp19069J3bgg3VgXsN7Rl0ngN8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36860700001)(8936002)(36756003)(8676002)(7636003)(2616005)(508600001)(47076005)(6916009)(26005)(186003)(54906003)(6666004)(316002)(4326008)(5660300002)(44832011)(1076003)(70206006)(7696005)(2906002)(336012)(70586007)(426003)(9786002)(356005)(82310400004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:44.3128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c5571b-4a95-4371-f234-08d9b4e0f021
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4130
Received-SPF: pass client-ip=40.107.94.59; envelope-from=figlesia@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
register API (for example could writing a specific bit in a register
propagate down to a transfer start signal on the DMA control interface).
At the same time the status, results and interrupts for the transfer might
still be intended to be read and catched through the DMA engine's register
API (and signals).

This patch adds a QEMU DMA control interface that can be used for
modelling above scenario. Through this new interface a peripheral model
embedding a DMA engine model will be able to directly initiate transfers
through the DMA. At the same time the transfer state, result and
completion signaling will be read and catched through the DMA engine
model's register API and signaling.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/dma/dma-ctrl-if.c         | 31 +++++++++++++++++++
 hw/dma/meson.build           |  1 +
 include/hw/dma/dma-ctrl-if.h | 72 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 hw/dma/dma-ctrl-if.c
 create mode 100644 include/hw/dma/dma-ctrl-if.h

diff --git a/hw/dma/dma-ctrl-if.c b/hw/dma/dma-ctrl-if.c
new file mode 100644
index 0000000000..d82372bc12
--- /dev/null
+++ b/hw/dma/dma-ctrl-if.c
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
+#include "hw/dma/dma-ctrl-if.h"
+
+void dma_ctrl_if_read_with_notify(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
+                                  DmaCtrlIfNotify *notify, bool start_dma)
+{
+    DmaCtrlIfClass *dcc =  DMA_CTRL_IF_GET_CLASS(dma);
+    dcc->read(dma, addr, len, notify, start_dma);
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
index 0000000000..bfd1db4c02
--- /dev/null
+++ b/include/hw/dma/dma-ctrl-if.h
@@ -0,0 +1,72 @@
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
+typedef void (*dmactrlif_notify_fn)(void *opaque);
+
+typedef struct DmaCtrlIfNotify {
+    void *opaque;
+    dmactrlif_notify_fn cb;
+} DmaCtrlIfNotify;
+
+typedef struct DmaCtrlIf {
+    Object Parent;
+} DmaCtrlIf;
+
+typedef struct DmaCtrlIfClass {
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
+    void (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
+                 DmaCtrlIfNotify *notify, bool start_dma);
+} DmaCtrlIfClass;
+
+/*
+ * Start a read transfer on a DMA implementing the DMA control interface.
+ * The DMA will notify the caller that 'len' bytes have been read at 'addr'
+ * through the callback in the DmaCtrlIfNotify structure. For allowing refilling
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
+void dma_ctrl_if_read_with_notify(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
+                                  DmaCtrlIfNotify *notify, bool start_dma);
+
+#endif /* HW_DMA_CTRL_IF_H */
-- 
2.11.0


