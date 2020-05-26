Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185CA1DC5B6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 05:38:49 +0200 (CEST)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbc2h-0002ZC-V1
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 23:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jbc1W-0001K7-VC
 for qemu-devel@nongnu.org; Wed, 20 May 2020 23:37:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3697 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miaoyubo@huawei.com>)
 id 1jbc1V-0001rs-TN
 for qemu-devel@nongnu.org; Wed, 20 May 2020 23:37:34 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 09189C829217D90F350A;
 Thu, 21 May 2020 11:37:29 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 21 May 2020 11:37:15 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <lersek@redhat.com>
Subject: [PATCH v8 2/8] fw_cfg: Write the extra roots into the fw_cfg
Date: Thu, 21 May 2020 11:36:25 +0800
Message-ID: <20200521033631.1605-3-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
In-Reply-To: <20200521033631.1605-1-miaoyubo@huawei.com>
References: <20200521033631.1605-1-miaoyubo@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=miaoyubo@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 23:37:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, miaoyubo@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Write the extra roots into the fw_cfg, therefore the uefi could
get the extra roots. Only if the uefi knows there are extra roots,
the config space of devices behind the root could be obtained.

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
---
 hw/arm/virt.c              |  8 ++++++++
 hw/i386/pc.c               | 18 ++----------------
 hw/nvram/fw_cfg.c          | 20 ++++++++++++++++++++
 include/hw/nvram/fw_cfg.h  |  2 ++
 include/hw/pci/pcie_host.h |  4 ++++
 5 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c41d5f9778..f64ff42ab5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -78,6 +78,8 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pcie_host.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1457,6 +1459,10 @@ void virt_machine_done(Notifier *notifier, void *data)
     ARMCPU *cpu = ARM_CPU(first_cpu);
     struct arm_boot_info *info = &vms->bootinfo;
     AddressSpace *as = arm_boot_address_space(cpu, info);
+    PCIHostState *s = PCI_GET_PCIE_HOST_STATE;
+
+    PCIBus *bus = s->bus;
+    FWCfgState *fw_cfg = vms->fw_cfg;
 
     /*
      * If the user provided a dtb, we assume the dynamic sysbus nodes
@@ -1475,6 +1481,8 @@ void virt_machine_done(Notifier *notifier, void *data)
         exit(1);
     }
 
+    fw_cfg_write_extra_pci_roots(bus, fw_cfg);
+
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2128f3d6fe..94b1d3df14 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -842,26 +842,12 @@ void pc_machine_done(Notifier *notifier, void *data)
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
     PCIBus *bus = pcms->bus;
+    FWCfgState *fw_cfg = x86ms->fw_cfg;
 
     /* set the number of CPUs */
     rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
-    if (bus) {
-        int extra_hosts = 0;
-
-        QLIST_FOREACH(bus, &bus->child, sibling) {
-            /* look for expander root buses */
-            if (pci_bus_is_root(bus)) {
-                extra_hosts++;
-            }
-        }
-        if (extra_hosts && x86ms->fw_cfg) {
-            uint64_t *val = g_malloc(sizeof(*val));
-            *val = cpu_to_le64(extra_hosts);
-            fw_cfg_add_file(x86ms->fw_cfg,
-                    "etc/extra-pci-roots", val, sizeof(*val));
-        }
-    }
+    fw_cfg_write_extra_pci_roots(bus, fw_cfg);
 
     acpi_setup();
     if (x86ms->fw_cfg) {
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 8dd50c2c72..824cfcf054 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -40,6 +40,7 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/pci/pci_bus.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -742,6 +743,25 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
     return ptr;
 }
 
+void fw_cfg_write_extra_pci_roots(PCIBus *bus, FWCfgState *s)
+{
+    if (bus) {
+        int extra_hosts = 0;
+        QLIST_FOREACH(bus, &bus->child, sibling) {
+            /* look for expander root buses */
+            if (pci_bus_is_root(bus)) {
+                extra_hosts++;
+            }
+        }
+        if (extra_hosts && s) {
+            uint64_t *val = g_malloc(sizeof(*val));
+            *val = cpu_to_le64(extra_hosts);
+            fw_cfg_add_file(s,
+                   "etc/extra-pci-roots", val, sizeof(*val));
+        }
+    }
+}
+
 void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len)
 {
     trace_fw_cfg_add_bytes(key, trace_key_name(key), len);
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 25d9307018..eb86ee5ae6 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -79,6 +79,8 @@ struct FWCfgMemState {
     MemoryRegionOps wide_data_ops;
 };
 
+void fw_cfg_write_extra_pci_roots(PCIBus *bus, FWCfgState *s);
+
 /**
  * fw_cfg_add_bytes:
  * @s: fw_cfg device being modified
diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index 3f7b9886d1..c93f2d7011 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -27,6 +27,10 @@
 #define TYPE_PCIE_HOST_BRIDGE "pcie-host-bridge"
 #define PCIE_HOST_BRIDGE(obj) \
     OBJECT_CHECK(PCIExpressHost, (obj), TYPE_PCIE_HOST_BRIDGE)
+#define PCI_GET_PCIE_HOST_STATE \
+    OBJECT_CHECK(PCIHostState, \
+                 object_resolve_path_type("", "pcie-host-bridge", NULL), \
+                 TYPE_PCIE_HOST_BRIDGE)
 
 #define PCIE_HOST_MCFG_BASE "MCFG"
 #define PCIE_HOST_MCFG_SIZE "mcfg_size"
-- 
2.19.1



