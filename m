Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A861222D7F0
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 15:55:03 +0200 (CEST)
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzKdi-0005ba-4x
	for lists+qemu-devel@lfdr.de; Sat, 25 Jul 2020 09:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1jzJhf-0003d1-Q5
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 08:55:03 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39502 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1jzJhd-0006tf-SR
 for qemu-devel@nongnu.org; Sat, 25 Jul 2020 08:55:03 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E0F37ED71C1FABDD0635;
 Sat, 25 Jul 2020 20:54:49 +0800 (CST)
Received: from localhost (10.174.149.56) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 20:54:44 +0800
From: Hogan Wang <hogan.wang@huawei.com>
To: <marcel.apfelbaum@gmail.com>, <dgilbert@redhat.com>, <jusual@redhat.com>, 
 <mst@redhat.com>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] hw/pci-host: save/restore pci host config register for
 old ones
Date: Sat, 25 Jul 2020 20:54:37 +0800
Message-ID: <20200725125437.2825-2-hogan.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725125437.2825-1-hogan.wang@huawei.com>
References: <20200725125437.2825-1-hogan.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.56]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=hogan.wang@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/25 08:54:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jul 2020 09:54:04 -0400
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
Cc: wangxinxin.wang@huawei.com, weidong.huang@huawei.com, hogan.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i440fx and q35 machines integrate i440FX or MCH PCI device by default.
Refer to i440FX and ICH9-LPC spcifications, there are some reserved
configuration registers can used to save/restore PCIHostState.config_reg.
It's nasty but friendly to old ones.

Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
---
 hw/pci-host/i440fx.c | 31 +++++++++++++++++++++++++++++++
 hw/pci-host/q35.c    | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index c662903dbb..9e2cfdb052 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -65,6 +65,14 @@ typedef struct I440FXState {
  */
 #define I440FX_COREBOOT_RAM_SIZE 0x57
 
+/* Older I440FX machines (5.0 and older) not support i440FX-pcihost state
+ * migration, use some reserved INTEL 82441 configuration registers to
+ * save/restore i440FX-pcihost config register. Refer to [INTEL 440FX PCISET
+ * 82441FX PCI AND MEMORY CONTROLLER (PMC) AND 82442FX DATA BUS ACCELERATOR
+ * (DBX) Table 1. PMC Configuration Space]
+ */
+#define I440FX_PCI_HOST_CONFIG_REG 0x94
+
 static void i440fx_update_memory_mappings(PCII440FXState *d)
 {
     int i;
@@ -99,8 +107,30 @@ static void i440fx_write_config(PCIDevice *dev,
 static int i440fx_post_load(void *opaque, int version_id)
 {
     PCII440FXState *d = opaque;
+    uint8_t *config;
+    I440FXState *s = OBJECT_CHECK(I440FXState,
+                                  object_resolve_path("/machine/i440fx", NULL),
+                                  TYPE_PCI_HOST_BRIDGE);
 
     i440fx_update_memory_mappings(d);
+
+    if (!s->migration_enabled) {
+        config = &d->parent_obj.config[I440FX_PCI_HOST_CONFIG_REG];
+        s->parent_obj.config_reg = pci_get_long(config);
+    }
+    return 0;
+}
+
+static int i440fx_pre_save(void *opaque)
+{
+    PCIDevice *d = opaque;
+    I440FXState *s = OBJECT_CHECK(I440FXState,
+                                  object_resolve_path("/machine/i440fx", NULL),
+                                  TYPE_PCI_HOST_BRIDGE);
+    if (!s->migration_enabled) {
+        pci_set_long(&d->config[I440FX_PCI_HOST_CONFIG_REG],
+                     s->parent_obj.config_reg);
+    }
     return 0;
 }
 
@@ -108,6 +138,7 @@ static const VMStateDescription vmstate_i440fx = {
     .name = "I440FX",
     .version_id = 3,
     .minimum_version_id = 3,
+    .pre_save = i440fx_pre_save,
     .post_load = i440fx_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PCII440FXState),
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index bb41665da4..67e08dedc5 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -43,6 +43,15 @@
 
 #define Q35_PCI_HOST_HOLE64_SIZE_DEFAULT (1ULL << 35)
 
+/* Older Q35 machines (5.0 and older) not support q35-pcihost state
+ * migration, use some reserved INTEL MCH configuration registers to
+ * save/restore q35-pcihost config register. Refer to [Intel 3 Series
+ * Chipset Family Datasheet Table 5-1. DRAM Controller Register Address
+ * Map (D0:F0)]
+ */
+#define Q35_PCI_HOST_CONFIG_REG 0x70
+
+
 static void q35_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
@@ -532,7 +541,34 @@ static void mch_update(MCHPCIState *mch)
 static int mch_post_load(void *opaque, int version_id)
 {
     MCHPCIState *mch = opaque;
+    uint8_t *config;
+    Q35PCIHost *s = OBJECT_CHECK(Q35PCIHost,
+                                 object_resolve_path("/machine/q35", NULL),
+                                 TYPE_PCI_HOST_BRIDGE);
+    PCIHostState *pci = PCI_HOST_BRIDGE(s);
+
     mch_update(mch);
+    if (!s->migration_enabled) {
+        config = &mch->parent_obj.config[Q35_PCI_HOST_CONFIG_REG];
+        pci->config_reg = pci_get_long(config);
+    }
+
+    return 0;
+}
+
+static int mch_pre_save(void *opaque)
+{
+    MCHPCIState *mch = opaque;
+    uint8_t *config;
+    Q35PCIHost *s = OBJECT_CHECK(Q35PCIHost,
+                                 object_resolve_path("/machine/q35", NULL),
+                                 TYPE_PCI_HOST_BRIDGE);
+    PCIHostState *pci = PCI_HOST_BRIDGE(s);
+
+    if (!s->migration_enabled) {
+        config = &mch->parent_obj.config[Q35_PCI_HOST_CONFIG_REG];
+        pci_set_long(config, pci->config_reg);
+    }
     return 0;
 }
 
@@ -540,6 +576,7 @@ static const VMStateDescription vmstate_mch = {
     .name = "mch",
     .version_id = 1,
     .minimum_version_id = 1,
+    .pre_save = mch_pre_save,
     .post_load = mch_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, MCHPCIState),
-- 
2.27.0



