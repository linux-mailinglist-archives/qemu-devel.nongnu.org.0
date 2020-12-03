Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431AC2CDEB2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:22:11 +0100 (CET)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuB8-00087r-7k
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku7y-0006OS-4S
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:18:54 -0500
Received: from mail-bn8nam12on2057.outbound.protection.outlook.com
 ([40.107.237.57]:12896 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kku7o-0008Lb-QF
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 14:18:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJut8+pUX/1euiXYdrR3JjQXiadYNiyzbh8g0V80B7h4qVC9ZGiM4FoYmeyUT+OpBWX6ljL9RXitR4uDgQPzd9D3rIwt+/MG7drrzL3sPdSCih/5faZqtPlDfMzd/3ZaXf4O8C5rZcoJz0gL9InzszzB/1orQuSOyvGgKRf/9HDX8ZjjAeon20YCeivCENOhso9KJV9lg/jBj8WhCSUhNXxAdy2IoVRrhDzb6KivdhJPTLFRNSGwfZeK4SeYdBsFKyQJVwswxTILJmeVdM3hqoWvNxbx662HzMIjhdDLm22gxfK3sNIrdL4OGRRQZ1bgB7SLaC155X/DsDHSULDhuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FT62i5fWPWG0ENPvmE1yIjJ/XGdRO9QSPbHhLOibUYE=;
 b=ATtQ5TMD7jJ4oDaSVjD5Hh5slTjRhUxdZ1y351Hf+QOaqc/nOHAZ9ciuIVtoi66SBd4ZEYKu2W+WyKswHney0Go1UtpNE2imdn95eHlzWSd9hDXjpB9aVHlY7Mx/c29ElryavCrbjWsJx0Ri3lFyFUA4WUzHviaQyDXjsia9hkhvE8IkI6+blGjqKDdpXs90QyHt5GmKgfF1j336CNEQF+KnAcKvJPWEx5rqyzqi1c+P3YDESn9ZF+hWSrShWykY+t9UKCKJJ6YiEq5VmzclDPB+NB0/bExUMPdJCKVwootAqgfkkV5i8xs9vdfNJvRoT6+5Jqnt3GfwpgOxtInoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FT62i5fWPWG0ENPvmE1yIjJ/XGdRO9QSPbHhLOibUYE=;
 b=WNhnCm1+krJP6Hi1xxJEjJwaR60RwaS9fwIR9znvTeIIAgw+pqkRwVjfg7mQ0dmW4sdPX7w0/B+4EAJnaUCABj8Xbl7Qhg29vy+UfuVqPMWiTfoXEK6MqI+we0OhBl7wqzyoIBEV9mN3sVNY9WtBFv1T0gBxCX8nlTZwRymHXbY=
Received: from DM6PR02CA0055.namprd02.prod.outlook.com (2603:10b6:5:177::32)
 by MW2PR02MB3836.namprd02.prod.outlook.com (2603:10b6:907:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 19:18:40 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::f) by DM6PR02CA0055.outlook.office365.com
 (2603:10b6:5:177::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend
 Transport; Thu, 3 Dec 2020 19:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Thu, 3 Dec 2020 19:18:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 3 Dec 2020 11:18:26 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 3 Dec 2020 11:18:26 -0800
Received: from [10.140.6.35] (port=54966 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kku7V-0002hw-Jg; Thu, 03 Dec 2020 11:18:26 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 6184113C02A0; Fri,  4 Dec 2020 00:52:54 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Edgar Iglesias <edgari@xilinx.com>, "Francisco
 Eduardo Iglesias" <figlesia@xilinx.com>, Alistair Francis
 <alistair.francis@wdc.com>, Eduardo Habkost <ehabkost@redhat.com>, Ying Fang
 <fangying1@huawei.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>, Paul Zimmerman
 <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>
Subject: [PATCH v15 3/4] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
Date: Fri, 4 Dec 2020 00:52:36 +0530
Message-ID: <1607023357-5096-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1607023357-5096-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af14f735-4887-49be-a6f2-08d897c03e2a
X-MS-TrafficTypeDiagnostic: MW2PR02MB3836:
X-Microsoft-Antispam-PRVS: <MW2PR02MB383624261C350A2552F6C9BBCAF20@MW2PR02MB3836.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 07JjWpZUrHos7rmnyVsG649ckCw2PVdqpKfSUJZWy5+TUU+HxigcTcioDQKhVVWrgCSLUeA9vdrbUBqTfgx3whY5wqb3CmEHd5ZgDfaHwjkmu1wb5a5r9rqPWOd52e0mx6GnBsdXmH8Z1YQd3vPH4+sqdRckmpew9LrIFESIlsHlp6nBTchosnPWuDPi1hDNlKaXHL0gCJxh5gw93KTWb5afREmPvSQDbTJTym/kWELFA77Of8zdkWFAMq2ZUe3gKCOQM8qGsVPL2/0iksC6/90YVmGaHbo2W5fdOM2d0bSMSE74/Q1qFEx4M23z1H2DYebpPx/fygvZPqS4slSGhYTGNwC3yfk5TFtwjFFwBN6JFeA+Zb+rEZUwBg4Cz2zlc9QQEK7FIAmxqNtRPh+1Q8JvYkBcsl6hql2WhjQKT2cpQuJCtKdKhonA3ZtlYliP
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(921005)(4326008)(26005)(19627235002)(336012)(6266002)(110136005)(2906002)(426003)(186003)(83380400001)(2616005)(36906005)(7416002)(316002)(5660300002)(70586007)(82310400003)(8936002)(42186006)(70206006)(8676002)(47076004)(7636003)(356005)(82740400003)(6666004)(36756003)(6636002)(478600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 19:18:40.4773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af14f735-4887-49be-a6f2-08d897c03e2a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3836
Received-SPF: pass client-ip=40.107.237.57; envelope-from=saipava@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This model is a top level integration wrapper for hcd-dwc3 and
versal-usb2-ctrl-regs modules, this is used by xilinx versal soc's and
future xilinx usb subsystems would also be part of it.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/usb/Kconfig                      |  5 ++
 hw/usb/meson.build                  |  1 +
 hw/usb/xlnx-usb-subsystem.c         | 94 +++++++++++++++++++++++++++++++++++++
 include/hw/usb/xlnx-usb-subsystem.h | 45 ++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 56da78a..40093d7 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -117,3 +117,8 @@ config USB_DWC3
     bool
     select USB_XHCI_SYSBUS
     select REGISTER
+
+config XLNX_USB_SUBSYS
+    bool
+    default y if XLNX_VERSAL
+    select USB_DWC3
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 433c27e..f46c6b6 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
+specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
 # emulated usb devices
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
new file mode 100644
index 0000000..5682573
--- /dev/null
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU model of the Xilinx usb subsystem
+ *
+ * Copyright (c) 2020 Xilinx Inc. Sai Pavan Boddu <sai.pava.boddu@xilinx.com>
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
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/usb/xlnx-usb-subsystem.h"
+
+static void versal_usb2_realize(DeviceState *dev, Error **errp)
+{
+    VersalUsb2 *s = VERSAL_USB2(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Error *err = NULL;
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->dwc3), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_realize(SYS_BUS_DEVICE(&s->usb2Ctrl), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_init_mmio(sbd, &s->dwc3_mr);
+    sysbus_init_mmio(sbd, &s->usb2Ctrl_mr);
+    qdev_pass_gpios(DEVICE(&s->dwc3.sysbus_xhci), dev, SYSBUS_DEVICE_GPIO_IRQ);
+}
+
+static void versal_usb2_init(Object *obj)
+{
+    VersalUsb2 *s = VERSAL_USB2(obj);
+
+    object_initialize_child(obj, "versal.dwc3", &s->dwc3,
+                            TYPE_USB_DWC3);
+    object_initialize_child(obj, "versal.usb2-ctrl", &s->usb2Ctrl,
+                            TYPE_XILINX_VERSAL_USB2_CTRL_REGS);
+    memory_region_init_alias(&s->dwc3_mr, obj, "versal.dwc3_alias",
+                             &s->dwc3.iomem, 0, DWC3_SIZE);
+    memory_region_init_alias(&s->usb2Ctrl_mr, obj, "versal.usb2Ctrl_alias",
+                             &s->usb2Ctrl.iomem, 0, USB2_REGS_R_MAX * 4);
+    qdev_alias_all_properties(DEVICE(&s->dwc3), obj);
+    qdev_alias_all_properties(DEVICE(&s->dwc3.sysbus_xhci), obj);
+    object_property_add_alias(obj, "dma", OBJECT(&s->dwc3.sysbus_xhci), "dma");
+}
+
+static void versal_usb2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = versal_usb2_realize;
+}
+
+static const TypeInfo versal_usb2_info = {
+    .name          = TYPE_XILINX_VERSAL_USB2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VersalUsb2),
+    .class_init    = versal_usb2_class_init,
+    .instance_init = versal_usb2_init,
+};
+
+static void versal_usb_types(void)
+{
+    type_register_static(&versal_usb2_info);
+}
+
+type_init(versal_usb_types)
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
new file mode 100644
index 0000000..739bef7
--- /dev/null
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -0,0 +1,45 @@
+/*
+ * QEMU model of the Xilinx usb subsystem
+ *
+ * Copyright (c) 2020 Xilinx Inc. Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
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
+#ifndef _XLNX_VERSAL_USB_SUBSYSTEM_H_
+#define _XLNX_VERSAL_USB_SUBSYSTEM_H_
+
+#include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
+#include "hw/usb/hcd-dwc3.h"
+
+#define TYPE_XILINX_VERSAL_USB2 "xlnx.versal-usb2"
+
+#define VERSAL_USB2(obj) \
+     OBJECT_CHECK(VersalUsb2, (obj), TYPE_XILINX_VERSAL_USB2)
+
+typedef struct VersalUsb2 {
+    SysBusDevice parent_obj;
+    MemoryRegion dwc3_mr;
+    MemoryRegion usb2Ctrl_mr;
+
+    VersalUsb2CtrlRegs usb2Ctrl;
+    USBDWC3 dwc3;
+} VersalUsb2;
+
+#endif
-- 
2.7.4


