Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBBB4BC160
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 21:48:02 +0100 (CET)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLAAb-0000w9-8y
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 15:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLA6C-0005Oq-HD; Fri, 18 Feb 2022 15:43:28 -0500
Received: from [2a00:1450:4864:20::431] (port=34698
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLA6A-00008k-FY; Fri, 18 Feb 2022 15:43:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id d3so782684wrf.1;
 Fri, 18 Feb 2022 12:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nI8fiJnJPfXkbcFCNvmnr8H9yi33vNAvkx4Pewc/TT4=;
 b=dAEBfls4ex/E9EHV5iSJLY0Rc/3knpnLD6RWEqkCT0G7Eps0pvhgNNCOa7bOVJklBs
 j5oUs07SgcODkEoT54MlbB0BNGCuaFRyUyhoA4X66mO5IiB/4F8ajPdHAUdEIGdaGSxd
 ZX81M3rox2rw+KXrXHtKw7OvMrIUxFd7HUXKmiS4SJf6eReY1f23/KVhVeWCfNZbKxEq
 RXrWVIXYLplTjaewOQZsCJsgRgqaqfabBxyBlB6nU0GZUSwuEB6nd6nIaIqg+ufEQ5gQ
 6IuLGjxkzRzNqWXsBi8AH2NAiOmtGTWqegkQwc1tIUtfYPVtu0mNJfUfiiXnAONNB90b
 hMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nI8fiJnJPfXkbcFCNvmnr8H9yi33vNAvkx4Pewc/TT4=;
 b=78AEB/WzCz5jtGpRka7viBNlOiB52Zp79HFVaKoqcqoAzxqmwg80dfOZacxdyF5Xil
 1rzjJENDQrEhVqktUbuodE7I7M2+MPtqZ7LMEOPRxgfgG3/iDkGIx6wg3gQEhljhbeh0
 cOVrnE7Ki6E1BtU8Yq0ir/8G2mCUab86nR8Ib7T7G4mC8KAslQ+2iPWfwPHewpd9/N1X
 Gp6N2z+psHFnx91NYVLYIUDmyYhbOykapRMzLtj2Ltxnzv0BUC7pxPPE9vNNSsKsjfrn
 hRBWX/0rUm+r7OPdKQOCK8wxJFnVBrLj8HEHpqEZxO8SpH7dK1PFCH4FLeKe/9E/GNmQ
 mfgw==
X-Gm-Message-State: AOAM531KX39AFoQWkkm4sqqBwRA4y+uc0oBdIQE5yRQ6xUfGAu5lEgb/
 NdwHoAKtRBBgUrASpR5vlLb2zZjhpvE=
X-Google-Smtp-Source: ABdhPJw6pc1oW5rzsiyYfDaH4nquszDsT28cv4TAIa6H0CpGXcYV5tKPNSqkD/V+02iQdH6kcLVDxw==
X-Received: by 2002:adf:9783:0:b0:1e0:8842:af03 with SMTP id
 s3-20020adf9783000000b001e08842af03mr7155642wrb.506.1645217001875; 
 Fri, 18 Feb 2022 12:43:21 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm377432wmq.44.2022.02.18.12.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 12:43:21 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/ide: add ich6 ide controller device emulation
Date: Fri, 18 Feb 2022 22:41:55 +0200
Message-Id: <20220218204155.236611-3-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218204155.236611-1-liavalb@gmail.com>
References: <20220218204155.236611-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, Liav Albani <liavalb@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This type of IDE controller has support for relocating the IO ports and
doesn't use IRQ 14 and 15 but one allocated PCI IRQ for the controller.

There's no x86 chipset in QEMU that will try to attach this device by
default. It is considered a legacy-free device in the aspect of PCI bus
resource management as the guest OS can relocate the IO ports as it sees
fit to its needs. However, this is still a legacy device that belongs to
chipsets from late 2000s.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/i386/Kconfig          |   2 +
 hw/ide/Kconfig           |   5 +
 hw/ide/ich6.c            | 204 +++++++++++++++++++++++++++++++++++++++
 hw/ide/meson.build       |   1 +
 include/hw/ide/pci.h     |   1 +
 include/hw/pci/pci_ids.h |   1 +
 6 files changed, 214 insertions(+)
 create mode 100644 hw/ide/ich6.c

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..a18de2d962 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -75,6 +75,7 @@ config I440FX
     select PCI_I440FX
     select PIIX3
     select IDE_PIIX
+    select IDE_ICH6
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
@@ -101,6 +102,7 @@ config Q35
     select PCI_EXPRESS_Q35
     select LPC_ICH9
     select AHCI_ICH9
+    select IDE_ICH6
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index dd85fa3619..63304325a5 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -38,6 +38,11 @@ config IDE_VIA
     select IDE_PCI
     select IDE_QDEV
 
+config IDE_ICH6
+    bool
+    select IDE_PCI
+    select IDE_QDEV
+
 config MICRODRIVE
     bool
     select IDE_QDEV
diff --git a/hw/ide/ich6.c b/hw/ide/ich6.c
new file mode 100644
index 0000000000..8f46d3fce2
--- /dev/null
+++ b/hw/ide/ich6.c
@@ -0,0 +1,204 @@
+/*
+ * QEMU IDE Emulation: PCI ICH6/ICH7 IDE support.
+ *
+ * Copyright (c) 2022 Liav Albani
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
+#include "hw/pci/pci.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/dma.h"
+
+#include "hw/ide/pci.h"
+#include "hw/ide/bmdma.h"
+#include "trace.h"
+
+static const MemoryRegionOps ich6_bmdma_ops = {
+    .read = intel_ide_bmdma_read,
+    .write = intel_ide_bmdma_write,
+};
+
+static void bmdma_setup_bar(PCIIDEState *d)
+{
+    int i;
+
+    memory_region_init(&d->bmdma_bar, OBJECT(d), "ich6-bmdma-container", 16);
+    for (i = 0; i < 2; i++) {
+        BMDMAState *bm = &d->bmdma[i];
+
+        memory_region_init_io(&bm->extra_io, OBJECT(d), &ich6_bmdma_ops, bm,
+                              "ich6-bmdma", 4);
+        memory_region_add_subregion(&d->bmdma_bar, i * 8, &bm->extra_io);
+        memory_region_init_io(&bm->addr_ioport, OBJECT(d),
+                              &bmdma_addr_ioport_ops, bm, "bmdma", 4);
+        memory_region_add_subregion(&d->bmdma_bar, i * 8 + 4, &bm->addr_ioport);
+    }
+}
+
+static void ich6_pci_config_write(PCIDevice *d, uint32_t addr, uint32_t val,
+                                    int l)
+{
+    uint32_t i;
+
+    pci_default_write_config(d, addr, val, l);
+
+    for (i = addr; i < addr + l; i++) {
+        switch (i) {
+        case 0x40:
+            pci_default_write_config(d, i, 0x8000, 2);
+            continue;
+        case 0x42:
+            pci_default_write_config(d, i, 0x8000, 2);
+            continue;
+        }
+    }
+}
+
+static void ich6_ide_reset(DeviceState *dev)
+{
+    PCIIDEState *d = PCI_IDE(dev);
+    PCIDevice *pd = PCI_DEVICE(d);
+    uint8_t *pci_conf = pd->config;
+    int i;
+
+    for (i = 0; i < 2; i++) {
+        ide_bus_reset(&d->bus[i]);
+    }
+
+    /* TODO: this is the default. do not override. */
+    pci_conf[PCI_COMMAND] = 0x00;
+    /* TODO: this is the default. do not override. */
+    pci_conf[PCI_COMMAND + 1] = 0x00;
+    /* TODO: use pci_set_word */
+    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
+    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
+    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
+}
+
+static int pci_ich6_init_ports(PCIIDEState *d)
+{
+    int i;
+
+    for (i = 0; i < 2; i++) {
+        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
+        ide_init2(&d->bus[i], d->native_irq);
+
+        bmdma_init(&d->bus[i], &d->bmdma[i], d);
+        d->bmdma[i].bus = &d->bus[i];
+        ide_register_restart_cb(&d->bus[i]);
+    }
+
+    return 0;
+}
+
+static void pci_ich6_ide_realize(PCIDevice *dev, Error **errp)
+{
+    PCIIDEState *d = PCI_IDE(dev);
+    uint8_t *pci_conf = dev->config;
+    int rc;
+
+    pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
+
+    /* PCI native mode-only controller, supports bus mastering */
+    pci_conf[PCI_CLASS_PROG] = 0x85;
+
+    bmdma_setup_bar(d);
+    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+
+    d->native_irq = pci_allocate_irq(&d->parent_obj);
+    /* Address Map Register - Non Combined Mode, MAP.USCC = 0 */
+    pci_conf[0x90]   = 0;
+
+    /* IDE Decode enabled by default */
+    pci_set_long(pci_conf + 0x40, 0x80008000);
+
+    /* IDE Timing control - Disable UDMA controls */
+    pci_set_long(pci_conf + 0x48, 0x00000000);
+
+    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
+
+    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_ops,
+                          &d->bus[0], "ich6-ide0-data", 8);
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0]);
+
+    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_ops,
+                          &d->bus[0], "ich6-ide0-cmd", 4);
+    pci_register_bar(dev, 1, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[0]);
+
+    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le_ops,
+                          &d->bus[1], "ich6-ide1-data", 8);
+    pci_register_bar(dev, 2, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[1]);
+
+    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_ops,
+                          &d->bus[1], "ich6-ide1-cmd", 4);
+    pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
+
+    rc = pci_ich6_init_ports(d);
+    if (rc) {
+        error_setg_errno(errp, -rc, "Failed to realize %s",
+                         object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void pci_ich6_ide_exitfn(PCIDevice *dev)
+{
+    PCIIDEState *d = PCI_IDE(dev);
+    unsigned i;
+
+    for (i = 0; i < 2; ++i) {
+        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
+        memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
+    }
+}
+
+static void ich6_ide_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    dc->reset = ich6_ide_reset;
+    k->realize = pci_ich6_ide_realize;
+    k->exit = pci_ich6_ide_exitfn;
+    k->vendor_id = PCI_VENDOR_ID_INTEL;
+    k->device_id = PCI_DEVICE_ID_INTEL_82801GB;
+    k->class_id = PCI_CLASS_STORAGE_IDE;
+    k->config_read = pci_default_read_config;
+    k->config_write = ich6_pci_config_write;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    dc->hotpluggable = false;
+}
+
+static const TypeInfo ich6_ide_info = {
+    .name          = "ich6-ide",
+    .parent        = TYPE_PCI_IDE,
+    .class_init    = ich6_ide_class_init,
+};
+
+static void ich6_ide_register_types(void)
+{
+    type_register_static(&ich6_ide_info);
+}
+
+type_init(ich6_ide_register_types)
diff --git a/hw/ide/meson.build b/hw/ide/meson.build
index 38f9ae7178..6899e082db 100644
--- a/hw/ide/meson.build
+++ b/hw/ide/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_AHCI', if_true: files('ahci.c'))
 softmmu_ss.add(when: 'CONFIG_AHCI_ICH9', if_true: files('ich.c'))
+softmmu_ss.add(when: 'CONFIG_IDE_ICH6', if_true: files('ich6.c', 'bmdma.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('ahci-allwinner.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_CMD646', if_true: files('cmd646.c'))
 softmmu_ss.add(when: 'CONFIG_IDE_CORE', if_true: files('core.c', 'atapi.c'))
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..d8bf08e728 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -53,6 +53,7 @@ struct PCIIDEState {
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
+    qemu_irq native_irq; /* used only for ich6-ide */
 };
 
 static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d46..cf8767977c 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -244,6 +244,7 @@
 #define PCI_DEVICE_ID_INTEL_82371AB      0x7111
 #define PCI_DEVICE_ID_INTEL_82371AB_2    0x7112
 #define PCI_DEVICE_ID_INTEL_82371AB_3    0x7113
+#define PCI_DEVICE_ID_INTEL_82801GB      0x27c0
 
 #define PCI_DEVICE_ID_INTEL_ICH9_0       0x2910
 #define PCI_DEVICE_ID_INTEL_ICH9_1       0x2917
-- 
2.35.1


