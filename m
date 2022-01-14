Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491B48ED67
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:49:40 +0100 (CET)
Received: from localhost ([::1]:50710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Opf-0004P5-C7
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:49:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OW6-0003Q2-1M
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:26 -0500
Received: from mail-bn1nam07on2072.outbound.protection.outlook.com
 ([40.107.212.72]:48723 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OW0-0007ZE-M7
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxE1ELWUsDpv2L/qNX7NCrrp3KIhTQWCNtSs1xIy71nJf28C2fT11E2j6X740Lwlcr3k5fSSjXH4VSxMr103cjGZHL6xugayaR/ZlU/yuvbt7me9ysy9ZpaMj3gZWVI+amWMHb44NSsv9BJbPl8yzuMJIim0zinLimnJnqJsAGmGQ1vf+I0FzENjIV0DbqybxpPFRHCHm3+MnN49deR/ucRyrufCAardZXPcMdjZbZhBSmwCDnYxaRAv2Sy8ByEc7jK+3TczgiBTQEgR05BRk5xpty05iA8HZPBUbZwZiK/S37qQMrMN/TKCzIHGdblzAeGB/QJ4a9qicjEFMJ7ehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPMrSSc4hBnODNWceCsi8o6v703yX1OrzoqpLc3lT/s=;
 b=GwDl6PW3kc1tRAvjZviLX0iKMPxh0xBBwFAhH+lmxbd1iMoyv0E97Qnybz1IyFLayCH/wcfjp15NXrzp2Ue2z8FjLQbtW/Qg14ErcLy6uNnUw97+o1WseOLoM0wKYOxJxYi/6l80C3zRCDPguA1q8zt3nRVwmmIB94bH6kvLZahkh8rGZtK3AcNNomfZjo2LzRy/SncwFqe9eZdhp1dNgxN08LriCSGT7SmWve4XytJzOssoVvnP9uaZQYTXohecu5uQ7OiqsZRbj0NYBBEbe17cW8nfVLlF/swCSC640D6oEtOIPtkp/vB/b1wGACFcEICkNF1OEJ4rCYHmz0QVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPMrSSc4hBnODNWceCsi8o6v703yX1OrzoqpLc3lT/s=;
 b=HjmZ0A5Y2FjrKneRn3c0pgVDFv78cCK2vVo/RbhmDyoxOSen9PCUJMM9BqYMsi7rkd7P/XxvG94hz9+ND/bV6Ir6WN0gmmnHWIXZkRfhzlZuXVtJm5XcG2TqhJUJ9VJVVx1nGJhu3FKByWdcDRa1gAs/sGrCaeRULYYP4MF/Lac=
Received: from BN6PR1101CA0017.namprd11.prod.outlook.com
 (2603:10b6:405:4a::27) by SN6PR02MB5472.namprd02.prod.outlook.com
 (2603:10b6:805:e2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 15:29:16 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::32) by BN6PR1101CA0017.outlook.office365.com
 (2603:10b6:405:4a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Fri, 14 Jan 2022 15:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:29:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:29:07 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:29:07 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVn-0004L4-9Q; Fri, 14 Jan 2022 07:29:07 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 12/12] docs/devel: Add documentation for the DMA control
 interface
Date: Fri, 14 Jan 2022 15:28:41 +0000
Message-ID: <20220114152841.1740-13-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d44311c-a756-44f6-7774-08d9d772a055
X-MS-TrafficTypeDiagnostic: SN6PR02MB5472:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB54722C618D93118F58FD3BC4AD549@SN6PR02MB5472.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7A15iTX2NBjqd41Jk4lkw81jvUE11Gq2BwP+Hda//5GlV5rI+hhbiYz3rXeHzYzjbahaLvizHlcP7HSnhA6mlhw0a/8LrZ17j3S9paB+dVzKcigWlBGqrVtDMxLaJ654HVwa3RcG4isKnP4LP72qiXjWbZhnji50o0OuDAPxAQrtC1xpJTkOec1RgeGRTlzq7mGSWlksJorracXG6OEPKKWd/9vr6Bzci+RsavzcnMLgiQvErWz+neOn4X0b4RPDjc1xQyeuFgc6peHJTYmAwsRB2mcfKVvuDbb44CDO9F7zVqmrXxdSXp6N0n4nN4t9+gSoCPdYLZRDkZ2ZapfJZQ0tfzJ4ngzlzqwYQYNIGUGrjlgI+6BRRoHnBP8ASRFrh+LX8R7y+KPUD/Q/SJrI9FS5y3lp9YeZVC5/kKRMc/vgCnu75vqez9tQGwrTpG3ldbIbzTLCrD1y1eizN0Ni8ylQ+c+ZlXwRn7ODd4iRKKp+2FD5WifotBQcnPZQd74pErw/sWeGrRigwIxBzbSLAVwdRgjizNErcFAGKXklecP5F9P9NJbQGIwJ1I8FkYrHEbKz1uMryJeERwv5bloVze7gZeYBBCmc6c/yARnrB/1tRE2ClG/RCxss88YRLdIbM/aAOXyCB+CYuxCWWFl8Cu8004OZjTLongj0BY5TLTCpY3AhSWqFohIOZ1s0HnUsIFr98TuLz2nYHB+B5d8MXFNYEXMzhCBC9zhOVdSK8k=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(70206006)(2616005)(508600001)(7636003)(36860700001)(7696005)(336012)(47076005)(5660300002)(426003)(2906002)(6916009)(83380400001)(316002)(70586007)(1076003)(82310400004)(186003)(9786002)(8676002)(4326008)(8936002)(6666004)(54906003)(44832011)(356005)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:29:16.4428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d44311c-a756-44f6-7774-08d9d772a055
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5472
Received-SPF: pass client-ip=40.107.212.72; envelope-from=figlesia@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

Also, since being the author, list myself as maintainer for the file.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 MAINTAINERS                |   1 +
 docs/devel/dma-ctrl-if.rst | 243 +++++++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst       |   1 +
 3 files changed, 245 insertions(+)
 create mode 100644 docs/devel/dma-ctrl-if.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e31569d65..5736ce0675 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -968,6 +968,7 @@ M: Francisco Iglesias <francisco.iglesias@xilinx.com>
 S: Maintained
 F: hw/ssi/xlnx-versal-ospi.c
 F: include/hw/ssi/xlnx-versal-ospi.h
+F: docs/devel/dma-ctrl-if.rst
 
 ARM ACPI Subsystem
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
diff --git a/docs/devel/dma-ctrl-if.rst b/docs/devel/dma-ctrl-if.rst
new file mode 100644
index 0000000000..15ef6491cd
--- /dev/null
+++ b/docs/devel/dma-ctrl-if.rst
@@ -0,0 +1,243 @@
+DMA control interface
+=====================
+
+About the DMA control interface
+-------------------------------
+
+DMA engines embedded in peripherals can end up being controlled in
+different ways on real hardware. One possible way is to allow software
+drivers to access the DMA engine's register API and to allow the drivers
+to configure and control DMA transfers through the API. A model of a DMA
+engine in QEMU that is embedded and (re)used in this manner does not need
+to implement the DMA control interface.
+
+Another option on real hardware is to allow the peripheral embedding the
+DMA engine to control the engine through a custom hardware DMA control
+interface between the two. Software drivers in this scenario configure and
+trigger DMA operations through the controlling peripheral's register API
+(for example, writing a specific bit in a register could propagate down to
+a transfer start signal on the DMA control interface). At the same time
+the status, result and interrupts for the transfer might still be intended
+to be read and caught through the DMA engine's register API (and
+signals).
+
+::
+
+    Hardware example
+                   +------------+
+                   |            |
+                   | Peripheral |
+                   |            |
+                   +------------+
+                        /\
+                        ||   DMA control IF (custom)
+                        \/
+                   +------------+
+                   | Peripheral |
+                   |    DMA     |
+                   +------------+
+
+Figure 1. A peripheral controlling its embedded DMA engine through a
+custom DMA control interface
+
+The above scenario can be modelled in QEMU by implementing this DMA control
+interface in the DMA engine model. This will allow a peripheral embedding
+the DMA engine to initiate DMA transfers through the engine using the
+interface. At the same time the status, result and interrupts for the
+transfer can be read and caught through the DMA engine's register API and
+signals. An example implementation and usage of the DMA control interface
+can be found in the Xilinx CSU DMA model and Xilinx Versal's OSPI model.
+
+::
+
+    Memory address
+    (register API)
+      0xf1010000   +---------+
+                   |         |
+                   | Versal  |
+                   |  OSPI   |
+                   |         |
+                   +---------+
+                       /\
+                       ||  DMA control IF
+                       \/
+      0xf1011000   +---------+
+                   |         |
+                   | CSU DMA |
+                   |  (src)  |
+                   |         |
+                   +---------+
+
+Figure 2. Xilinx Versal's OSPI controls and initiates transfers on its
+CSU source DMA through a DMA control interface
+
+DMA control interface files
+---------------------------
+
+``include/hw/dma/dma-ctrl-if.h``
+``hw/dma/dma-ctrl-if.c``
+
+DmaCtrlIfClass
+--------------
+
+The ``DmaCtrlIfClass`` contains the interface methods that can be
+implemented by a DMA engine.
+
+.. code-block:: c
+
+    typedef struct DmaCtrlIfClass {
+        InterfaceClass parent;
+
+        /*
+         * read: Start a read transfer on the DMA engine implementing the DMA
+         * control interface
+         *
+         * @dma_ctrl: the DMA engine implementing this interface
+         * @addr: the address to read
+         * @len: the number of bytes to read at 'addr'
+         *
+         * @return a MemTxResult indicating whether the operation succeeded ('len'
+         * bytes were read) or failed.
+         */
+        MemTxResult (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
+    } DmaCtrlIfClass;
+
+
+dma_ctrl_if_read
+----------------------------
+
+The ``dma_ctrl_if_read`` function is used from a model embedding the DMA engine
+for starting DMA read transfers.
+
+.. code-block:: c
+
+    /*
+     * Start a read transfer on a DMA engine implementing the DMA control
+     * interface.
+     *
+     * @dma_ctrl: the DMA engine implementing this interface
+     * @addr: the address to read
+     * @len: the number of bytes to read at 'addr'
+     *
+     * @return a MemTxResult indicating whether the operation succeeded ('len'
+     * bytes were read) or failed.
+     */
+    MemTxResult dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
+
+
+Example implementation of the DMA control interface
+---------------------------------------------------
+
+The example code below showing an implementation of the DMA control
+interface is taken from the Xilinx CSU DMA model.
+
+The DMA control interface related code inside ``hw/dma/xlnx_csu_dma.c`` is
+shown below. A DMA control interface read function gets installed in the
+class init function through which DMA read transfers can be started.
+
+.. code-block:: c
+
+    .
+    .
+    .
+    static MemTxResult xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
+                                                     uint32_t len)
+    {
+    .
+    .
+    .
+    static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
+    {
+        DeviceClass *dc = DEVICE_CLASS(klass);
+        StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+        DmaCtrlIfClass *dcic = DMA_CTRL_IF_CLASS(klass);
+    .
+    .
+    .
+        dcic->read = xlnx_csu_dma_dma_ctrl_if_read;
+    }
+    .
+    .
+    .
+    static const TypeInfo xlnx_csu_dma_info = {
+    .
+    .
+    .
+        .interfaces = (InterfaceInfo[]) {
+            { TYPE_STREAM_SINK },
+            { TYPE_DMA_CTRL_IF },
+            { }
+        }
+    };
+
+Example DMA control interface read transfer start
+-------------------------------------------------
+
+The DMA read transfer example is taken from the Xilinx Versal's OSPI
+model. The DMA read transfer is started by a register write to the OSPI
+controller.
+
+The DMA control interface related code inside
+``include/hw/ssi/xlnx-versal-ospi.h`` is shown below. The header includes
+``include/hw/dma/dma-ctrl-if.h`` and the state structure contains a
+pointer to a DMA engine that has implemented the DMA control interface.
+
+.. code-block:: c
+
+    .
+    .
+    .
+    #include "hw/dma/dma-ctrl-if.h"
+    .
+    .
+    .
+    struct XlnxVersalOspi {
+    .
+    .
+    .
+        DmaCtrlIf *dma_src;
+    .
+    .
+    .
+    };
+    .
+    .
+    .
+
+The DMA control interface related code inside
+``hw/ssi/xlnx-versal-ospi.c`` can be seen below. OSPI DMA read transfers
+are performed and executed through the DMA control interface read function
+(and with the CSU source DMA).
+
+.. code-block:: c
+
+    static void ospi_dma_read(XlnxVersalOspi *s)
+    {
+    .
+    .
+    .
+    .
+    .
+        if (dma_ctrl_if_read(s->dma_src, 0, dma_len) != MEMTX_OK) {
+            qemu_log_mask(LOG_GUEST_ERROR, "OSPI DMA configuration error\n");
+        }
+    .
+    .
+    .
+    }
+    .
+    .
+    .
+    static void xlnx_versal_ospi_init(Object *obj)
+    {
+    .
+    .
+    .
+        object_property_add_link(obj, "dma-src", TYPE_DMA_CTRL_IF,
+                                 (Object **)&s->dma_src,
+                                 object_property_allow_set_link,
+                                 OBJ_PROP_LINK_STRONG);
+    .
+    .
+    .
+    }
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index afd937535e..0d424bdf34 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -37,6 +37,7 @@ modifying QEMU's source code.
    reset
    s390-dasd-ipl
    clocks
+   dma-ctrl-if
    qom
    modules
    block-coroutine-wrapper
-- 
2.11.0


