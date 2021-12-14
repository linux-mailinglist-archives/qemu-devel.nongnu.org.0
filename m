Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073D0474146
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:16:13 +0100 (CET)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5n2-0004n8-3i
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:16:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bl-0007la-MZ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:35 -0500
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com
 ([40.107.93.88]:8284 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bi-000729-22
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hic5jxvFTM/iNEriP/TdLuOsGW3PzI8ZFI8CWSxauYfoZa2jQzxdGACbha4qgvXvtGh+sW/ZxLsrFJF9RtwjbOIYkQ4FW5cMfyzgfhy2Cyl03woTqOM532t2IW1/B2rJEAZtR18nCrUDumEbgAInVEblLINjnkOxI4k4ujA4vvr+fKcedoGoFirqEMhMALtZWv2TmV+m8Jk/o/dEEm+z0+eSILJMeHl82a8onjRbA3FGsbWqIHBi/kZLnU7Cm9DNp8/GY5MBwXQbd5UYsUdAbJ2tbr0kEw9jq2JtYNxe7MVrZydxfQ/CE2NttEQPqN40jFk1khl15q8jsbHvQWipIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNY2u3QKSIQj6KiRm6ZCW4SQPdMyKkj4X8jTWstAVpE=;
 b=TYs4C44CFY0xkJneRUeH/RgRdPCVhNzP2Hmh7iuwG4qqiV8Tbq6WHoetrxDrHRFDeQqGPtCroMrtobGPmjfdbu9OI9aqS8FFfEGZGpyq5Qwxt08Q02c1ztE/8cA0rfE/tmhCYB017KrF2PHIZuVOPGclZ4wEdz4O9ysg2yKcBc093KPcO/g5uX5npjKDyBNSkNqah/7WEVPmK0lxZNZEDGb2svzSSsh/NindQQQ0k2P1Dy4pEmnTXaST1+E2dVZR7CmNMlWuDPqrIcuHw5E0gY9VAn+YeOSIbA9ocrsZlKfxaPQf/NDhC3bMzdguQPjymqOVH2OJnqEBAJ9+rBUF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNY2u3QKSIQj6KiRm6ZCW4SQPdMyKkj4X8jTWstAVpE=;
 b=Hn7saM/ifNLT3rFOHAUe9t1Ikbm48IB7ZqAJum/K6icXWynwlfNe2fqEVthlYSM6eXRjqw9II4AyHOEk2RwS67X+hqHiGLRAyHkZC4H8lR2QMEE0xdS4daneBxKkaciscdsngKlacXr0olnxPoDxnIUkhEFqWa9SPpZh7xgLldA=
Received: from DM5PR15CA0054.namprd15.prod.outlook.com (2603:10b6:3:ae::16) by
 CH2PR02MB6553.namprd02.prod.outlook.com (2603:10b6:610:34::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.15; Tue, 14 Dec 2021 11:04:26 +0000
Received: from DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::9d) by DM5PR15CA0054.outlook.office365.com
 (2603:10b6:3:ae::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT012.mail.protection.outlook.com (10.13.5.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:19 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:19 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bX-000F5K-1s; Tue, 14 Dec 2021 03:04:19 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 12/12] docs/devel: Add documentation for the DMA control
 interface
Date: Tue, 14 Dec 2021 11:03:54 +0000
Message-ID: <20211214110354.21816-13-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e74dec1-e19c-4315-2f0f-08d9bef17e7e
X-MS-TrafficTypeDiagnostic: CH2PR02MB6553:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB6553EBE036EFED06A8E974C9AD759@CH2PR02MB6553.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ol1K9M05gqCUZvvLFSd13UwTrsBoVQoN9tBYdbgpxHHFHoKokQUOc3RhisXSObMditxMqbfcWoLvaXNjs/YsNlL6Z6/eCcO+ICHENM4Gzu/cvfmGlI7xNy+6Vtk3BExZzaEr1KslOw1AAUgcqV9HspUTuCgbRJKrbuemXV+gCIaHyfk9D2X2uTxEcxxtXd1sdluBeVCKeFa/tF0eIDB1hfqQIAssXNr/CNh5htxrIoe6CzDenJ/j+8mq4NxBAPhlxrLUgs99XSYorzEal5+DqANsvGQzXCe0WspxVmmYjizFfmSEVTbB7hEa6KEISvHsGfxExW3YnDjBtHKpKt4iTiB2rNXYK+g0is/uTX4SmKYkLpg4S80mPH5q99161zB3Ef/mmRehghX2hRy9BuwSnGF+ua3ppwB2j3+GfNnhOjo3kr18nYU8fEIxvcywzQjdbcCoah43n+gTEwRhgXfH68XPFgGnYyzyaKpv7KLr5DSboq+mbbQq/XQkvbV639nKQUfWWV/EnKYVE0GSNXqg2KqJpBCl1JUNc4Taec7XLeh+Ot02jy5vcWGEGoXQPZ1ebOkYjt29oazv1kYlvdkqYH/R2lLC0Z4/m8+eNfMIn0vbJgEWKZaTBkWtiMDqvq2eBhViS2hB6ThJXkt4cwzw3vkLtgAX4/ldRB3ljw+ShrGAlNyKl4rhhyTk3T5so1gXyMGRh2804S5oZFSVrhxjwr70FbVyqyLWO4GwUOC7iKM=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(70206006)(186003)(1076003)(356005)(4326008)(8676002)(47076005)(8936002)(336012)(7696005)(9786002)(44832011)(2616005)(26005)(70586007)(82310400004)(7636003)(6666004)(36860700001)(6916009)(2906002)(36756003)(508600001)(426003)(316002)(83380400001)(5660300002)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:26.7292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e74dec1-e19c-4315-2f0f-08d9bef17e7e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6553
Received-SPF: pass client-ip=40.107.93.88; envelope-from=figlesia@xilinx.com;
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

Also, since being the author, list myself as maintainer for the file.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 MAINTAINERS                |   1 +
 docs/devel/dma-ctrl-if.rst | 234 +++++++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst       |   1 +
 3 files changed, 236 insertions(+)
 create mode 100644 docs/devel/dma-ctrl-if.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index e52cc94840..ffefcc841f 100644
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
index 0000000000..5f54a83ad0
--- /dev/null
+++ b/docs/devel/dma-ctrl-if.rst
@@ -0,0 +1,234 @@
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
+         */
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
+     */
+    void dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr, uint32_t len);
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
+    static void xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
+                                              uint32_t len)
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
+            dma_ctrl_if_read(s->dma_src, 0, n_bytes);
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


