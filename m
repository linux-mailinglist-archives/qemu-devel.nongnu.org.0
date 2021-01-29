Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0F308815
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:09:49 +0100 (CET)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Reu-0000ym-58
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW9-0004aS-0N
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVx-00070N-JB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u14so6495144wml.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0TFLeVs+y/8fHPxjoJdC5/wiolow+hEp5ufBaJr3sfc=;
 b=MH5bfKmG3LvSf9iGnC8YpGTF693LD6gmLChV2/Mvn1xsZnpM62xES4MhNQw+ghDz7Y
 iCAfG+3glI9oJxbiRfyjaQaXQkaZpfR68kVBWxh+Da8lKA+jfutTI4tPjTLh34cMGSpU
 93xnXQTgH0Zn+ZsSa66ccglPaeSCNl7k6CWZIYSw5kMkH/Aw015cKa6vGJa30J0VxVaa
 8b82KJm99qH7pK3+qqfxS7HaoUYMLUCAFBt6A7GwtG2XBbpl8Lo4tREEqNIc5TPDqqLL
 lGewliWtgmNzxGv1Ai9quv6Sy3513g9rf+idQ0/T8uzgdAooLlBVf1E73YeiSlnKMaGK
 RgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TFLeVs+y/8fHPxjoJdC5/wiolow+hEp5ufBaJr3sfc=;
 b=I3LSU+sUy2a69D6+oh8P7Dk+DX27ikwj/7saHovVfOKFmxOi8EJiV0TdBB2HXtvwxg
 UE4sOBRu5ZSLi1CEQDLi/ci9db2ECRtKwIX0Oi+giniRUrFR6vKDtD8zf24ReLpYXHQF
 m7Xo0f1LkYRiMccIpTNT1krSwFDQbXq5ZBbLa7eNzrJ/B+GYFa5aLFNH0UAOtgAl0+B1
 4kqVjmYeO3cAR5S/TtN4UFec4I0Fc6EGyc+DP3wcaKsvsiaYVP6eld3faiIUhEPqiUg5
 ByQkr4XBvYTv4JrMAW5HPb0+4u4AFrgivhOWYOCmgxAshXtaoHxfPdYNaqgbGGGDMkFq
 wjFg==
X-Gm-Message-State: AOAM533my1CQVsIJQqKfA4RvR4QEEN464M3ZeIglH2EX6H2fXtQAJvOg
 iYt16IHzrxXnSsWGAuopahdvutATfqeXpg==
X-Google-Smtp-Source: ABdhPJxAFrZN6SteFd6MZX15oo6c/Q3G9fpTK/jgXN5BuDp/ubMrOY4456CILaUS6d7226I2otN1qQ==
X-Received: by 2002:a1c:e486:: with SMTP id b128mr3236126wmh.136.1611918032240; 
 Fri, 29 Jan 2021 03:00:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/46] hw/misc/pvpanic: add PCI interface support
Date: Fri, 29 Jan 2021 10:59:45 +0000
Message-Id: <20210129110012.8660-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mihai Carabas <mihai.carabas@oracle.com>

Add PCI interface support for PVPANIC device. Create a new file pvpanic-pci.c
where the PCI specific routines reside and update the build system with the new
files and config structure.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/pci-ids.txt    |  1 +
 include/hw/misc/pvpanic.h |  1 +
 include/hw/pci/pci.h      |  1 +
 hw/misc/pvpanic-pci.c     | 94 +++++++++++++++++++++++++++++++++++++++
 hw/misc/Kconfig           |  6 +++
 hw/misc/meson.build       |  1 +
 6 files changed, 104 insertions(+)
 create mode 100644 hw/misc/pvpanic-pci.c

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index abbdbca6be3..5e407a6f320 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -64,6 +64,7 @@ PCI devices (other than virtio):
 1b36:000d  PCI xhci usb host adapter
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
+1b36:0011  PCI PVPanic device (-device pvpanic-pci)
 
 All these devices are documented in docs/specs.
 
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index abc9dde34b3..ca3c5bb5330 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -18,6 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
+#define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c992d5..66db08462fd 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -107,6 +107,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_PCIE_BRIDGE 0x000e
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
+#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
new file mode 100644
index 00000000000..d629639d8f4
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
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 23bc9786cf4..19c216f3efb 100644
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
index edaaec2a3ee..629283957fc 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -100,6 +100,7 @@ softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
 softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
-- 
2.20.1


