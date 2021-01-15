Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567812F8559
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:26:19 +0100 (CET)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Uji-0007Sm-CE
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ugj-0005tZ-Rn
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:23:14 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:44582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Ugf-0002pG-R7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:23:13 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJE4m1005624;
 Fri, 15 Jan 2021 19:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=VvTQWNNM0D82OKc7ifHo4F3sPEa0rkWYpetIWeJKDZc=;
 b=x3olTLFTbl6qxpM2cL7dhfif2FEadht6izyHHu1pS7rlwWTf6MWhePYbFAE1rulTIOk6
 VRkG1RJBY0kC7A4SXoglv4+VcrOICTWvOfE/BfPAl1/5IQKs7v/RLNWF2+s3IU4w57j/
 hzsR5pRJ5Gabwjq1NHSjtSQL18CM56VWN1pwc+hc5gHjqY94Pta6cnHJLwkE6lfBdOq6
 VQmKej+FXNjLERhwPI9tUdHVx4xqV4J8x9nwRIazzqaXCKrFkboyuYUkmiM5Pqy2S/Hz
 ib6ShSwCVb42EgDacqHP2vSunQIMY83uKOplxshi9fnzVvol1G9UHvYj+7bQpMIAspZP 0A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 360kd06dvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:23:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJKcAk107665;
 Fri, 15 Jan 2021 19:21:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 360kf3qe8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:07 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10FJL6Wb011547;
 Fri, 15 Jan 2021 19:21:06 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 11:21:06 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
Date: Fri, 15 Jan 2021 20:34:04 +0200
Message-Id: <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150116
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add PCI interface support for PVPANIC device. Create a new file pvpanic-pci.c
where the PCI specific routines reside and update the build system with the new
files and config structure.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
---
 docs/specs/pci-ids.txt    |  1 +
 hw/misc/Kconfig           |  6 +++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-pci.c     | 94 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 include/hw/pci/pci.h      |  1 +
 6 files changed, 104 insertions(+)
 create mode 100644 hw/misc/pvpanic-pci.c

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index abbdbca..5e407a6 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -64,6 +64,7 @@ PCI devices (other than virtio):
 1b36:000d  PCI xhci usb host adapter
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
+1b36:0011  PCI PVPanic device (-device pvpanic-pci)
 
 All these devices are documented in docs/specs.
 
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 23bc978..19c216f 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -124,6 +124,12 @@ config IOTKIT_SYSINFO
 config PVPANIC_COMMON
     bool
 
+config PVPANIC_PCI
+    bool
+    default y if PCI_DEVICES
+    depends on PCI
+    select PVPANIC_COMMON
+
 config PVPANIC_ISA
     bool
     depends on ISA_BUS
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 8c828ad..f686019 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -99,6 +99,7 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
 softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
new file mode 100644
index 0000000..d629639
--- /dev/null
+++ b/hw/misc/pvpanic-pci.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU simulated PCI pvpanic device.
+ *
+ * Copyright (C) 2020 Oracle
+ *
+ * Authors:
+ *     Mihai Carabas <mihai.carabas@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "sysemu/runstate.h"
+
+#include "hw/nvram/fw_cfg.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "hw/misc/pvpanic.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
+
+/*
+ * PVPanicPCIState for PCI device
+ */
+typedef struct PVPanicPCIState {
+    PCIDevice dev;
+    PVPanicState pvpanic;
+} PVPanicPCIState;
+
+static const VMStateDescription vmstate_pvpanic_pci = {
+    .name = "pvpanic-pci",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(dev, PVPanicPCIState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
+{
+    PVPanicPCIState *s = PVPANIC_PCI_DEVICE(dev);
+    PVPanicState *ps = &s->pvpanic;
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 2);
+
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &ps->mr);
+}
+
+static Property pvpanic_pci_properties[] = {
+    DEFINE_PROP_UINT8("events", PVPanicPCIState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pvpanic_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pc = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, pvpanic_pci_properties);
+
+    pc->realize = pvpanic_pci_realizefn;
+    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
+    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
+    pc->revision = 1;
+    pc->class_id = PCI_CLASS_SYSTEM_OTHER;
+    dc->vmsd = &vmstate_pvpanic_pci;
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_pci_info = {
+    .name          = TYPE_PVPANIC_PCI_DEVICE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PVPanicPCIState),
+    .class_init    = pvpanic_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void pvpanic_register_types(void)
+{
+    type_register_static(&pvpanic_pci_info);
+}
+
+type_init(pvpanic_register_types);
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index abc9dde..ca3c5bb 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -18,6 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
+#define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c9..66db084 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -107,6 +107,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
+#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
1.8.3.1


