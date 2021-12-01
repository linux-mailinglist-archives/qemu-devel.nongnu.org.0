Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC89465226
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:53:46 +0100 (CET)
Received: from localhost ([::1]:58916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRvV-00038R-8n
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:53:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjG-0004DL-NL
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:06 -0500
Received: from mail-dm6nam12on2042.outbound.protection.outlook.com
 ([40.107.243.42]:60129 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjC-0000Eg-6s
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOePCTBIBtA5GA2ncKqJaPLFnZrJTQ69IGp23eyfdB40d4YUGx9zTpu6Dpe81zj8DzB6Qe3BPFGVeKZf6Nn6dlfdSleOEVACtmY4wMzjBSiQNgNlt67jS3wLdHlo5eHTeGwPChZ02RvmqpySWNby6MKuTR59LIDfYIGZjL15TeoI4QDKJpF3Jutmm+yNQ/9pQzF4NbkjsaVJn5rkI08uJFpWd3l9Nd+n+viCqjCAGBnIKI2T7x9NCOiJAS5YBHqUznivBn6Tn1G2E2aIHKrp5UdX5mny+Dywr6ZnkEM/4dkG7+BfUeIyXYFixMbFx1R+ImXNCgRguhq2InzHfcSmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33Ch6Tw7WVzTPw0j1ybbPPRpflZ378Qn7DyX95V3gF8=;
 b=atY4WB7XZm3ExuBr76HZqg6JON7WzeAsxqNhvw51oMyQyuF6GYW3EX9FLh/tFtaIOFLFs3KmMu5gNQiqUxZT+fJPNxfohvtH0eepdocv6Fv56BR20IQDoWX4sY4K5Pc5XSge8JB4iBCD1lUkNRMiLtMEv/YrzS3V8QKseawIQ1b9F+83yTHdoZh/RMv+1fn2BIMh9InKhRADrf/gE9Q58IjUTy4llpp+5DHM6OTGGFuquE/HtvpQLHhXT0TuxOsXVV5DEKJ344n3SCXTjh5y5BKN+LYRfCvs88OHeSewh/YxiXnn/hhpWh7PrZcYRNNkWTtmFP1ArtzDi6/PqoRViA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33Ch6Tw7WVzTPw0j1ybbPPRpflZ378Qn7DyX95V3gF8=;
 b=Nigr6oeRXcvGzjp9vhzzksYLTMaOWWxngnHIeF1pYgN3gjR2Q/VhS+UNAR3YTpQJsI1/QwGS50ZAyLbnYnNhcAh6gtqa74UQ/c6TwsZX+Mvi7TQVm6FRRIW1xQNKL+1ZdynzvmiDbX2lvIzwut31KmAyJvnMOCA+IWruQ5uU3MA=
Received: from DM5PR20CA0024.namprd20.prod.outlook.com (2603:10b6:3:93::34) by
 BL0PR02MB6532.namprd02.prod.outlook.com (2603:10b6:208:1c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Wed, 1 Dec
 2021 15:40:59 +0000
Received: from DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::92) by DM5PR20CA0024.outlook.office365.com
 (2603:10b6:3:93::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT024.mail.protection.outlook.com (10.13.5.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:47 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:47 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRix-0002FY-1n; Wed, 01 Dec 2021 07:40:47 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 11/11] docs/devel: Add documentation for the DMA control
 interface
Date: Wed, 1 Dec 2021 15:40:23 +0000
Message-ID: <20211201154023.13931-12-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2e4e008-cac8-4c4c-fa4a-08d9b4e0f913
X-MS-TrafficTypeDiagnostic: BL0PR02MB6532:
X-Microsoft-Antispam-PRVS: <BL0PR02MB6532EEF12EBD9A7A947971B4AD689@BL0PR02MB6532.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1cG7bmURFtjO3ZVxbrh4J1B93TxJF+PB6kqz+nlLHxxjmS4N0xF8OWbsGAcKOWWgopZtb+1FelW28vlG5E/fqzOOJbIbfJqMJwe+uUCoRwgr5PPSAnr3dFLBhyJLztBpW2zfKlzH8RpqR6K6ZXF99zh6ttcBizIWHHi1zwxrGxhWs5NsAlZZ5M3N/4Z1J92S2tvSLj25OPL5CcQ7rqtV89hJrLdy/9ZypT7FAlGX1UyUfFCHpx4u4NP4hE92X0cf1oiOvk3c7CFmlZPeVy5vE01duAqgh7TEoqosDDL0zCV+j2dqUMeiBqJ3dhej5MEl8EYb6JZ6HLUob/zX10hRFhQer4+GO/xZhXd8tdKdcODogocSSZ6QWZXENCoLcJBs/9iWZZYAa7tdMTaqAHM4sJ5SRZP9X3CFEOKDsJvBIr0NA1IerejIz1ooTRLyvgpHFAJbB63uVLs74lZbzXOfVelyt55x7VgVyiQnZAej7YgVLmQNSP8mmIeIytpM2cHy0cZnKgAJ4I5BRPocHM4jcWZEyEoiXRFcb0HOLapC00H3Ztm4RyHmojp+QycHnddpELqAdDH2AqaN5i0kNOSpUVVD3p+s2RkeFbvaclk64L+dRR9Fr4VXl8/IcVVnATqsCPe4Rw0X0h+pDSuoUFdyaGFF/3Nk+jmv+td77+84WQt0JtZjXbkvhBuGZJk1mG5fWyfvIN+l36zDJjnUCSu/eAqQrNz0t78DJPi3Qb8pSUA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(9786002)(2906002)(36756003)(186003)(26005)(54906003)(5660300002)(1076003)(356005)(83380400001)(70586007)(70206006)(6666004)(47076005)(316002)(82310400004)(7696005)(4326008)(7636003)(2616005)(36860700001)(44832011)(336012)(508600001)(8676002)(8936002)(426003)(6916009)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:59.3208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e4e008-cac8-4c4c-fa4a-08d9b4e0f913
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6532
Received-SPF: pass client-ip=40.107.243.42; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 docs/devel/dma-ctrl-if.rst | 320 +++++++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst       |   1 +
 3 files changed, 322 insertions(+)
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
index 0000000000..480e2a7d3a
--- /dev/null
+++ b/docs/devel/dma-ctrl-if.rst
@@ -0,0 +1,320 @@
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
+(for example could writing a specific bit in a register propagate down to
+a transfer start signal on the DMA control interface). At the same time
+the status, result and interrupts for the transfer might still be intended
+to be read and catched through the DMA engine's register API (and
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
+Figure 1. A peripheral controlling it's embedded DMA engine through a
+custom DMA control interface
+
+Above scenario can be modelled in QEMU by implementing this DMA control
+interface in the DMA engine model. This will allow a peripheral embedding
+the DMA engine to initiate DMA transfers through the engine using the
+interface. At the same time the status, result and interrupts for the
+transfer can be read and catched through the DMA engine's register API and
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
+Figure 2. Xilinx Versal's OSPI controls and initiates transfers on it's
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
+         * read: Start a read transfer on the DMA implementing the DMA control
+         * interface
+         *
+         * @dma_ctrl: the DMA implementing this interface
+         * @addr: the address to read
+         * @len: the amount of bytes to read at 'addr'
+         * @notify: the structure containg a callback to call and opaque pointer
+         * to pass the callback when the transfer has been completed
+         * @start_dma: true for starting the DMA transfer and false for just
+         * refilling and proceding an already started transfer
+         */
+        void (*read)(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
+                     DmaCtrlIfNotify *notify, bool start_dma);
+    } DmaCtrlIfClass;
+
+
+DmaCtrlIfNotify
+---------------
+
+The ``DmaCtrlIfNotify`` contains a callback function that is called when a
+transfer has been completed. It also contains an opaque pointer that is
+passed in to the function as an argument.
+
+.. code-block:: c
+
+    typedef struct DmaCtrlIfNotify {
+        void *opaque;
+        dmactrlif_notify_fn cb;
+    } DmaCtrlIfNotify;
+
+dma_ctrl_if_read_with_notify
+----------------------------
+
+The ``dma_ctrl_if_read_with_notify`` function is used from a model
+embedding the DMA engine for starting DMA read transfers.
+
+.. code-block:: c
+
+    /*
+     * Start a read transfer on a DMA implementing the DMA control interface.
+     * The DMA will notify the caller that 'len' bytes have been read at 'addr'
+     * through the callback in the DmaCtrlIfNotify structure. For allowing refilling
+     * an already started transfer the DMA notifies the caller before considering
+     * the transfer done (e.g. before setting done flags, generating IRQs and
+     * modifying other relevant internal device state).
+     *
+     * @dma_ctrl: the DMA implementing this interface
+     * @addr: the address to read
+     * @len: the amount of bytes to read at 'addr'
+     * @notify: the structure containing a callback to call and opaque pointer
+     * to pass the callback when the transfer has been completed
+     * @start_dma: true for starting the DMA transfer and false for just
+     * refilling and proceding an already started transfer
+     */
+    void dma_ctrl_if_read_with_notify(DmaCtrlIf *dma, hwaddr addr, uint32_t len,
+                                      DmaCtrlIfNotify *notify, bool start_dma);
+
+Example implementation of the DMA control interface
+---------------------------------------------------
+
+The example code below showing an implementation of the DMA control
+interface is taken from the Xilinx CSU DMA model.
+
+The DMA control interface related code in
+``include/hw/dma/xlnx_csu_dma.h`` is found below. The header includes
+``include/hw/dma/dma-ctrl-if.h`` and makes it possible to keep track of a
+notifier function with a corresponding opaque. The notifier is called when
+the transfer has been completed (with the opaque passed in as argument).
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
+    typedef struct XlnxCSUDMA {
+    .
+    .
+    .
+        dmactrlif_notify_fn dmactrlif_notify;
+        void *dmactrlif_opaque;
+    .
+    .
+    .
+    } XlnxCSUDMA;
+    .
+    .
+    .
+
+The DMA control interface related code inside ``hw/dma/xlnx_csu_dma.c`` is
+shown below. A DMA control interface read function gets installed in the
+class init function through which DMA read transfers can be started. The
+DMA control interface notifier is called once a transfer has been
+completed (with the opaque passed in as argument) but before any DMA
+status has been updated (for allowing refilling the transfer).
+
+.. code-block:: c
+
+    .
+    .
+    .
+    static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
+    {
+    .
+    .
+    .
+        /* Notify dma-ctrl-if clients when the transfer has been completed */
+        if (size == 0 && s->dmactrlif_notify) {
+            s->dmactrlif_notify(s->dmactrlif_opaque);
+        }
+
+        if (size == 0) {
+            xlnx_csu_dma_done(s);
+        }
+
+        return size;
+    }
+    .
+    .
+    .
+    static void xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
+                                              uint32_t len, DmaCtrlIfNotify *notify,
+                                              bool start_dma)
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
+    typedef struct XlnxVersalOspi {
+    .
+    .
+    .
+        DmaCtrlIf *dma_src;
+    .
+    .
+    .
+    } XlnxVersalOspi;
+    .
+    .
+    .
+
+The DMA control interface related code inside
+``hw/ssi/xlnx-versal-ospi.c`` can be seen below. OSPI DMA read transfers
+are performed and executed through the DMA control interface read function
+(and with the CSU source DMA). The OSPI controller is also able to refill
+the transfer as required through the notifier (which is called when the
+transfer has been completed).
+
+.. code-block:: c
+
+    static void ospi_dma_read(XlnxVersalOspi *s, bool start_dma)
+    {
+    .
+    .
+    .
+        DmaCtrlIfNotify notify = { .cb = ospi_notify,
+                                   .opaque = (void *)s };
+    .
+    .
+    .
+            dma_ctrl_if_read_with_notify(s->dma_src, 0, dma_len,
+                                         &notify, start_dma);
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


