Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070EA2DE383
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:52:57 +0100 (CET)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGBk-0002Ma-2a
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kqFw5-0006U4-9Q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:36:49 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:33906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1kqFvn-0005MC-Nd
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:36:43 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIDU0Mw021838;
 Fri, 18 Dec 2020 13:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=+xjw5cYt2hq7bUe6MLGCNlNzPzId4a6GhuHZZBMtOoo=;
 b=xHV6DSV9WRMpmPgqHWdL/C6p+iwvff9qWAmvKi5bkspKWAF4sPdRRXmna0bGHKUnUb0V
 u5KaM/BDh8MP5YtzXO/K03zGyQAWAua9hsdxhcGb7dwabe8pPKJRPvzmCH4rJW3XUBSr
 cw2oVAcTI7wlmvcIW+n6sZho3UfaMvN16sUJWxf5Ta4EhUTlpXR+5FvzwXljZKXF1b9X
 0+ieBxa3n92sMCtAOUBekL51XtT9T7y/7kcXm/hSQmy8OdswPkz0MJsadSGixZH1Cfjs
 G694qb2N/LSP7+XGcvb84V8jQPP3ebdMWhD3WVNQ8vqBIWt82yb3SCQ7oLr+uuAWKIRN ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcbtgra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 13:36:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIDVLSw114958;
 Fri, 18 Dec 2020 13:36:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35g3rg70yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 13:36:24 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BIDaNst006154;
 Fri, 18 Dec 2020 13:36:23 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Dec 2020 05:36:23 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/misc/pvpanic: add PCI interface support
Date: Fri, 18 Dec 2020 14:53:15 +0200
Message-Id: <1608295996-8464-3-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
References: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180095
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 docs/specs/pci-ids.txt    |  2 ++
 hw/misc/Kconfig           |  6 ++++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-pci.c     | 87 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 include/hw/pci/pci.h      |  1 +
 6 files changed, 98 insertions(+)
 create mode 100644 hw/misc/pvpanic-pci.c

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index abbdbca..191681d 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -68,3 +68,5 @@ PCI devices (other than virtio):
 All these devices are documented in docs/specs.
 
 The 0100 device ID is used for the QXL video card device.
+
+The 0101 device ID is used for the PVPanic device.
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index b58e6fd..aca7ffb 100644
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
     default y
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
index 0000000..173909a
--- /dev/null
+++ b/hw/misc/pvpanic-pci.c
@@ -0,0 +1,87 @@
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
+#include "hw/misc/pvpanic.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+
+typedef struct PVPanicPCIState PVPanicPCIState;
+DECLARE_INSTANCE_CHECKER(PVPanicPCIState, PVPANIC_PCI_DEVICE,
+                         TYPE_PVPANIC_PCI)
+
+/*
+ * PVPanicPCIState for PCI device
+ */
+typedef struct PVPanicPCIState {
+    PCIDevice dev;
+    PVPanicState pvpanic;
+} PVPanicPCIState;
+
+/* pvpanic pci device*/
+
+static void pvpanic_pci_realizefn(PCIDevice *dev, Error **errp)
+{
+    PVPanicPCIState *s = DO_UPCAST(PVPanicPCIState, dev, dev);
+    PVPanicState *ps = &s->pvpanic;
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 2);
+
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &ps->mr);
+}
+
+static Property pvpanic_pci_properties[] = {
+    DEFINE_PROP_UINT8("events", PVPanicState, events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
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
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_pci_info = {
+    .name          = TYPE_PVPANIC_PCI,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PVPanicPCIState),
+    .class_init    = pvpanic_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
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
index 691cf61..de1d0a9 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -18,6 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_PVPANIC_ISA "pvpanic"
+#define TYPE_PVPANIC_PCI "pvpanic-pci"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c9..e9512ab 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -108,6 +108,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
+#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0101
 
 #define FMT_PCIBUS                      PRIx64
 
-- 
1.8.3.1


