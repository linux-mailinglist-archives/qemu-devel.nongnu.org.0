Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA32B89ED
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 02:58:48 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfZDj-0007T4-RK
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 20:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6I-0008Kv-7R
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kfZ6E-0003NE-0C
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 20:51:05 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cc2gr5slSzhc3w;
 Thu, 19 Nov 2020 09:50:32 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 19 Nov 2020
 09:50:37 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v10 2/9] fw_cfg: Refactor extra pci roots addition
Date: Thu, 19 Nov 2020 09:48:34 +0800
Message-ID: <20201119014841.7298-3-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119014841.7298-1-cenjiahui@huawei.com>
References: <20201119014841.7298-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=cenjiahui@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 20:50:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 Jiahui Cen <cenjiahui@huawei.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, miaoyubo@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract extra pci roots addition from pc machine, which could be used by
other machines.

In order to make uefi get the extra roots, it is necessary to write extra
roots into fw_cfg. And only if the uefi knows there are extra roots,
the config spaces of devices behind the root could be obtained.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
---
 hw/i386/pc.c              | 18 +--------------
 hw/nvram/fw_cfg.c         | 23 ++++++++++++++++++++
 include/hw/nvram/fw_cfg.h |  9 ++++++++
 3 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 17b514d1da..76a846ff9a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -777,27 +777,11 @@ void pc_machine_done(Notifier *notifier, void *data)
     PCMachineState *pcms = container_of(notifier,
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    PCIBus *bus = pcms->bus;
 
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
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
+    fw_cfg_add_extra_pci_roots(pcms->bus, x86ms->fw_cfg);
 
     acpi_setup();
     if (x86ms->fw_cfg) {
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 08539a1aab..282ba93e2e 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -40,6 +40,7 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/pci/pci_bus.h"
 
 #define FW_CFG_FILE_SLOTS_DFLT 0x20
 
@@ -1061,6 +1062,28 @@ bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
     return true;
 }
 
+void fw_cfg_add_extra_pci_roots(PCIBus *bus, FWCfgState *s)
+{
+    int extra_hosts = 0;
+
+    if (!bus) {
+        return;
+    }
+
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        /* look for expander root buses */
+        if (pci_bus_is_root(bus)) {
+            extra_hosts++;
+        }
+    }
+
+    if (extra_hosts && s) {
+        uint64_t *val = g_malloc(sizeof(*val));
+        *val = cpu_to_le64(extra_hosts);
+        fw_cfg_add_file(s, "etc/extra-pci-roots", val, sizeof(*val));
+    }
+}
+
 static void fw_cfg_machine_reset(void *opaque)
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 8a9f5738bf..0e7a8bc7af 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -308,6 +308,15 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename, void *data,
 bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
                                const char *gen_id, Error **errp);
 
+/**
+ * fw_cfg_add_extra_pci_roots:
+ * @bus: main pci root bus to be scanned from
+ * @s: fw_cfg device being modified
+ *
+ * Add a new fw_cfg item...
+ */
+void fw_cfg_add_extra_pci_roots(PCIBus *bus, FWCfgState *s);
+
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
                                 AddressSpace *dma_as);
 FWCfgState *fw_cfg_init_io(uint32_t iobase);
-- 
2.28.0


