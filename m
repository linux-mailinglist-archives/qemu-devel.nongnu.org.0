Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43754CED0C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 19:07:32 +0100 (CET)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQvI4-0007VR-0e
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 13:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQv9G-00022V-10
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 12:58:26 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQv9D-0004GH-A5
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 12:58:25 -0500
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KBTn957mlz67Nc7;
 Mon,  7 Mar 2022 01:57:01 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Sun, 6 Mar 2022 18:58:20 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 17:58:19 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v7 33/46] cxl/cxl-host: Add memops for CFMWS region.
Date: Sun, 6 Mar 2022 17:41:24 +0000
Message-ID: <20220306174137.5707-34-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

From: Jonathan Cameron <jonathan.cameron@huawei.com>

These memops perform interleave decoding, walking down the
CXL topology from CFMWS described host interleave
decoder via CXL host bridge HDM decoders, through the CXL
root ports and finally call CXL type 3 specific read and write
functions.

Note that, whilst functional the current implementation does
not support:
* switches
* multiple HDM decoders at a given level.
* unaligned accesses across the interleave boundaries

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/cxl/cxl-host-stubs.c |   2 +
 hw/cxl/cxl-host.c       | 128 ++++++++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl.h    |   2 +
 3 files changed, 132 insertions(+)

diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index d24282ec1c..fcb7aded1f 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -12,3 +12,5 @@ void cxl_fixed_memory_window_options_set(MachineState *ms,
                                          Error **errp) {};
 
 void cxl_fixed_memory_window_link_targets(Error **errp) {};
+
+const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index f25713236d..a1eafa89bb 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -15,6 +15,10 @@
 
 #include "qapi/qapi-visit-machine.h"
 #include "hw/cxl/cxl.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
 
 void cxl_fixed_memory_window_options_set(MachineState *ms,
                                          CXLFixedMemoryWindowOptions *object,
@@ -92,3 +96,127 @@ void cxl_fixed_memory_window_link_targets(Error **errp)
         }
     }
 }
+
+/* TODO: support, multiple hdm decoders */
+static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
+                                uint8_t *target)
+{
+    uint32_t ctrl;
+    uint32_t ig_enc;
+    uint32_t iw_enc;
+    uint32_t target_reg;
+    uint32_t target_idx;
+
+    ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
+    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
+        return false;
+    }
+
+    ig_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
+    iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
+    target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
+
+    if (target_idx > 4) {
+        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
+        target_reg >>= target_idx * 8;
+    } else {
+        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
+        target_reg >>= (target_idx - 4) * 8;
+    }
+    *target = target_reg & 0xff;
+
+    return true;
+}
+
+static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
+{
+    CXLComponentState *hb_cstate;
+    PCIHostState *hb;
+    int rb_index;
+    uint32_t *cache_mem;
+    uint8_t target;
+    bool target_found;
+    PCIDevice *rp, *d;
+
+    /* Address is relative to memory region. Convert to HPA */
+    addr += fw->base;
+
+    rb_index = (addr / cxl_decode_ig(fw->enc_int_gran)) % fw->num_targets;
+    hb = PCI_HOST_BRIDGE(fw->target_hbs[rb_index]->cxl.cxl_host_bridge);
+    if (!hb || !hb->bus || !pci_bus_is_cxl(hb->bus)) {
+        return NULL;
+    }
+
+    hb_cstate = cxl_get_hb_cstate(hb);
+    if (!hb_cstate) {
+        return NULL;
+    }
+
+    cache_mem = hb_cstate->crb.cache_mem_registers;
+
+    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+    if (!target_found) {
+        return NULL;
+    }
+
+    rp = pcie_find_port_by_pn(hb->bus, target);
+    if (!rp) {
+        return NULL;
+    }
+
+    d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
+
+    if (!d || !object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3_DEV)) {
+        return NULL;
+    }
+
+    return d;
+}
+
+static MemTxResult cxl_read_cfmws(void *opaque, hwaddr addr, uint64_t *data,
+                                  unsigned size, MemTxAttrs attrs)
+{
+    CXLFixedWindow *fw = opaque;
+    PCIDevice *d;
+
+    d = cxl_cfmws_find_device(fw, addr);
+    if (d == NULL) {
+        *data = 0;
+        /* Reads to invalid address return poison */
+        return MEMTX_ERROR;
+    }
+
+    return cxl_type3_read(d, addr + fw->base, data, size, attrs);
+}
+
+static MemTxResult cxl_write_cfmws(void *opaque, hwaddr addr,
+                                   uint64_t data, unsigned size,
+                                   MemTxAttrs attrs)
+{
+    CXLFixedWindow *fw = opaque;
+    PCIDevice *d;
+
+    d = cxl_cfmws_find_device(fw, addr);
+    if (d == NULL) {
+        /* Writes to invalid address are silent */
+        return MEMTX_OK;
+    }
+
+    return cxl_type3_write(d, addr + fw->base, data, size, attrs);
+}
+
+const MemoryRegionOps cfmws_ops = {
+    .read_with_attrs = cxl_read_cfmws,
+    .write_with_attrs = cxl_write_cfmws,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
+};
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 5abc307ef4..14194acead 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -45,4 +45,6 @@ void cxl_fixed_memory_window_options_set(MachineState *ms,
                                          Error **errp);
 void cxl_fixed_memory_window_link_targets(Error **errp);
 
+extern const MemoryRegionOps cfmws_ops;
+
 #endif
-- 
2.32.0


