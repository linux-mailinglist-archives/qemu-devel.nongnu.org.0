Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B826C23C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 13:44:27 +0200 (CEST)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIVrO-0002Jr-Ux
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 07:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kIVmF-0006Nr-B9
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:39:08 -0400
Received: from mail-dm6nam12on2069.outbound.protection.outlook.com
 ([40.107.243.69]:37345 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1kIVmC-0006pD-5F
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:39:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+wrPvRknNvL6nT+GDXwFw0YTlgNWF642ANdGTyxJXRLzxnzGRVh7p/EWPvetvJR7dDhIHfLcL+96BkpOBFYdrI+2mMR50N0N1aRfcHmMSq1bHlbCkCgE5pxWXmJwNwd+EtRFqZ3ZvuvsF93GdblRMzC+HlnWjVrpV7HNIEsy8nhhK8ipvVcTkfdCFlxB0Rdp/JQuCGR6AJH3TOpl7CW8cbxesX1Wu2KhziVT/hJKSyGSJufI0cZ9L+nXkf63IQhi/d5wFiveSn/jkPJP/JvpgJJxTbv0bELosFfauO4ZYtF7aDfv8NzWFbnmnzBlgo+lI0PpUcSJPicNA0ml8XTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqR/3x7/h/vE0Iove5QMCJbn2MqiD96QXWHQCbAlVRE=;
 b=VhnrwNh+p4J0i0wpZlqsY7TpBbIZVdIDH0yVbwiFy8RhBwPxBu0jVysnZcloHxqJZQUibuZiPbLMHfv6Y/ZiawiHslAJK/xauGMDDlVUjcwlowoyp0ZAJTk95T4hFBRnYLNzlITD+7E5n8fUaprM1XFt5uDTuZD2ONvG7ed+nExUTV2801Xye+j9MGY7hcg8trEojjFJkl6aSndk0IlCFEIgqzK/eiveVjnAZeAerNTXxEU1HIUk99JEER3MvQVGEnNjJjrg+nCnwBNJNhJZ++JJ/hXqmupdrRtLzgCt6GR+4sbZQVKxk+KC1QnPsS8OTXvn5A8i1mnGwIXUGmcVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqR/3x7/h/vE0Iove5QMCJbn2MqiD96QXWHQCbAlVRE=;
 b=Tkk9yB0iebX1fxF5JgwCrZJRCNAJCl+4DBVBw15QpZ1lwurkYtqAD8w6YjwV/rQY760dF6AiC+Rhs5ZlYEodWHzEjMFs2dIuaEw3f0Zwy8Jhozi1v8df2nr0wslFWG1P8IW0z0NVa4YJSPD1OQ1E4HzOel6eKfJtzjaX//syeJo=
Received: from SA0PR11CA0044.namprd11.prod.outlook.com (2603:10b6:806:d0::19)
 by DM6PR02MB5770.namprd02.prod.outlook.com (2603:10b6:5:17a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 11:39:01 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d0:cafe::3e) by SA0PR11CA0044.outlook.office365.com
 (2603:10b6:806:d0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Wed, 16 Sep 2020 11:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Wed, 16 Sep 2020 11:39:01
 +0000
Received: from [149.199.38.66] (port=45713 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kIVm2-0001bp-Ne; Wed, 16 Sep 2020 04:38:54 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1kIVm9-0007OM-8W; Wed, 16 Sep 2020 04:39:01 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08GBd0MR002845; 
 Wed, 16 Sep 2020 04:39:00 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1kIVm7-0007NW-Nc; Wed, 16 Sep 2020 04:39:00 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 36FA713C0573; Wed, 16 Sep 2020 17:12:43 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?=27Marc-Andr=C3=A9=20Lureau=27?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Francisco Eduardo Iglesias <figlesia@xilinx.com>
Subject: [PATCH v6 4/7] usb: hcd-xhci-sysbus: Attach xhci to sysbus device
Date: Wed, 16 Sep 2020 17:11:05 +0530
Message-Id: <1600256469-13130-5-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600256469-13130-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1600256469-13130-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4315abfe-2998-4966-73d7-08d85a351bb4
X-MS-TrafficTypeDiagnostic: DM6PR02MB5770:
X-Microsoft-Antispam-PRVS: <DM6PR02MB57700849EDF689662030D1E1CA210@DM6PR02MB5770.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9NyXheFttC2j4RgXgMP55cjaTtMmbmrmcTYXCMjtdDg0vDdeF1Oq5vgnwOLyJm/y4oE3xyMgx/M9xJdTq31PhX4cXcYwxVzBasvHNPTZG6qxU7e5gU4Lmj6tTwzIpr7X0yu/UAtwtraFjqQP6J31KUzoHnT6oZMWfNJ7E413jFFLea4GTF1jI8D0quIyid9f1qYcRvxdjeWmY02samarWGUCCNj7bwV8gaflif/4yw7milopDtviQMPOu3zcrWLwTf42u4j99AGV75gNB1LWpKuAtKMGyujpWZnFuGudvqxinyc+EDiobcs/A+ZsQVQJkAcO2CYWWjZqC4Qjf66pb7nwV6rXgyW/GW1wEECr4evu2P4L3uNuynhGJ38Ad6vVqI5tgtIFixDW0vbKxSJzcGi3lSohgzLTsPTEu5RbUCwg1DSet1ngp6FfbZPB2aU
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(396003)(39850400004)(136003)(346002)(376002)(46966005)(5660300002)(82310400003)(426003)(107886003)(478600001)(7416002)(6666004)(6266002)(83380400001)(70206006)(4326008)(2616005)(70586007)(336012)(81166007)(2906002)(110136005)(356005)(6636002)(47076004)(82740400003)(8676002)(36756003)(186003)(42186006)(316002)(8936002)(54906003)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 11:39:01.7362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4315abfe-2998-4966-73d7-08d85a351bb4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5770
Received-SPF: pass client-ip=40.107.243.69; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 07:39:02
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 qemu-devel@nongnu.org, Paul Zimmerman <pauldzim@gmail.com>,
 Sai Pavan Boddu <saipava@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?q?=27Philippe=20Mathieu-Daud=C3=A9=27?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use XHCI as sysbus device, add memory region property to get the
address space instance for dma read/write.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/usb/Kconfig           |  5 +++
 hw/usb/hcd-xhci-sysbus.c | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/usb/hcd-xhci-sysbus.h | 32 ++++++++++++++++
 hw/usb/hcd-xhci.h        |  1 +
 hw/usb/meson.build       |  1 +
 5 files changed, 138 insertions(+)
 create mode 100644 hw/usb/hcd-xhci-sysbus.c
 create mode 100644 hw/usb/hcd-xhci-sysbus.h

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index bab582f..4dd2ba9 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -48,6 +48,11 @@ config USB_XHCI_NEC
     depends on PCI
     select USB_XHCI
 
+config USB_XHCI_SYSBUS
+    bool
+    default y if USB_XHCI
+    select USB
+
 config USB_MUSB
     bool
     select USB
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
new file mode 100644
index 0000000..d5b4656
--- /dev/null
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -0,0 +1,99 @@
+/*
+ * USB xHCI controller for system-bus interface
+ * Based on hcd-echi-sysbus.c
+
+ * SPDX-FileCopyrightText: 2020 Xilinx
+ * SPDX-FileContributor: Author: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+#include "qapi/error.h"
+#include "hcd-xhci-sysbus.h"
+#include "hw/irq.h"
+
+static void xhci_sysbus_intr_raise(XHCIState *xhci, int n, bool level)
+{
+    XHCISysbusState *s = container_of(xhci, XHCISysbusState, xhci);
+
+    qemu_set_irq(s->irq[n], level);
+}
+
+void xhci_sysbus_reset(DeviceState *dev)
+{
+    XHCISysbusState *s = XHCI_SYSBUS(dev);
+
+    device_legacy_reset(DEVICE(&s->xhci));
+}
+
+static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
+{
+    XHCISysbusState *s = XHCI_SYSBUS(dev);
+    Error *err = NULL;
+
+    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    object_property_set_bool(OBJECT(&s->xhci), "realized", true, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    s->irq = g_new0(qemu_irq, s->xhci.numintrs);
+    qdev_init_gpio_out_named(dev, s->irq, SYSBUS_DEVICE_GPIO_IRQ,
+                             s->xhci.numintrs);
+    if (s->xhci.dma_mr) {
+        s->xhci.as =  g_malloc0(sizeof(AddressSpace));
+        address_space_init(s->xhci.as, s->xhci.dma_mr, NULL);
+    } else {
+        s->xhci.as = &address_space_memory;
+    }
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->xhci.mem);
+}
+
+static void xhci_sysbus_instance_init(Object *obj)
+{
+    XHCISysbusState *s = XHCI_SYSBUS(obj);
+
+    object_initialize_child(obj, "xhci-core", &s->xhci, TYPE_XHCI);
+    qdev_alias_all_properties(DEVICE(&s->xhci), obj);
+
+    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
+                             (Object **)&s->xhci.dma_mr,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG);
+    s->xhci.intr_update = NULL;
+    s->xhci.intr_raise = xhci_sysbus_intr_raise;
+}
+
+static Property xhci_sysbus_props[] = {
+    DEFINE_PROP_UINT32("intrs", XHCISysbusState, xhci.numintrs, MAXINTRS),
+    DEFINE_PROP_UINT32("slots", XHCISysbusState, xhci.numslots, MAXSLOTS),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xhci_sysbus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = xhci_sysbus_reset;
+    dc->realize = xhci_sysbus_realize;
+    device_class_set_props(dc, xhci_sysbus_props);
+}
+
+static const TypeInfo xhci_sysbus_info = {
+    .name          = TYPE_XHCI_SYSBUS,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XHCISysbusState),
+    .class_init    = xhci_sysbus_class_init,
+    .instance_init = xhci_sysbus_instance_init
+};
+
+static void xhci_sysbus_register_types(void)
+{
+    type_register_static(&xhci_sysbus_info);
+}
+
+type_init(xhci_sysbus_register_types);
diff --git a/hw/usb/hcd-xhci-sysbus.h b/hw/usb/hcd-xhci-sysbus.h
new file mode 100644
index 0000000..a308753
--- /dev/null
+++ b/hw/usb/hcd-xhci-sysbus.h
@@ -0,0 +1,32 @@
+/*
+ * USB xHCI controller for system-bus interface
+ *
+ * SPDX-FileCopyrightText: 2020 Xilinx
+ * SPDX-FileContributor: Author: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
+ * SPDX-sourceInfo: Based on hcd-echi-sysbus
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_USB_HCD_XHCI_SYSBUS_H
+#define HW_USB_HCD_XHCI_SYSBUS_H
+
+#include "hw/usb.h"
+#include "hcd-xhci.h"
+#include "hw/sysbus.h"
+
+#define TYPE_XHCI_SYSBUS "sysbus-xhci"
+#define XHCI_SYSBUS(obj) \
+    OBJECT_CHECK(XHCISysbusState, (obj), TYPE_XHCI_SYSBUS)
+
+
+typedef struct XHCISysbusState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+    XHCIState xhci;
+    qemu_irq *irq;
+} XHCISysbusState;
+
+void xhci_sysbus_reset(DeviceState *dev);
+#endif
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 525291b..4108a65 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -191,6 +191,7 @@ typedef struct XHCIState {
 
     USBBus bus;
     MemoryRegion mem;
+    MemoryRegion *dma_mr;
     AddressSpace *as;
     MemoryRegion mem_cap;
     MemoryRegion mem_oper;
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 90dc54f..934e4fa 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -22,6 +22,7 @@ softmmu_ss.add(when: 'CONFIG_USB_EHCI_PCI', if_true: files('hcd-ehci-pci.c'))
 softmmu_ss.add(when: 'CONFIG_USB_EHCI_SYSBUS', if_true: files('hcd-ehci.c', 'hcd-ehci-sysbus.c'))
 softmmu_ss.add(when: 'CONFIG_USB_XHCI', if_true: files('hcd-xhci.c'))
 softmmu_ss.add(when: 'CONFIG_USB_XHCI_PCI', if_true: files('hcd-xhci-pci.c'))
+softmmu_ss.add(when: 'CONFIG_USB_XHCI_SYSBUS', if_true: files('hcd-xhci-sysbus.c'))
 softmmu_ss.add(when: 'CONFIG_USB_XHCI_NEC', if_true: files('hcd-xhci-nec.c'))
 softmmu_ss.add(when: 'CONFIG_USB_MUSB', if_true: files('hcd-musb.c'))
 softmmu_ss.add(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2.c'))
-- 
2.7.4


