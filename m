Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0B6D92D0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 11:34:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLzF-0001sf-UZ; Thu, 06 Apr 2023 05:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzD-0001p0-VU
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:55 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzB-0006ta-JJ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:55 -0400
Received: by mail-wm1-f53.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3256503wmo.0
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680773572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtqN4i7iYBF4ad7A4i/7Of5yvzpJT21pGaJ42I+9ycM=;
 b=LVEjQpcooN6f94l193OI2E60CbbiGQrjypoRMpfTsg3YYJGyYKiMyVLgF8efl+0VsC
 BXTqAFQI2SnEr1ynNRylEJhh65hXJraULQV4cu8kSdH3gtC5JIC053rysrtIW7K6oika
 x4Mhi0elIVoh9OUcJOaYkJGuz+Qf1VDvBl6W+i7leVjvG+50xTgkbhS8sEeAs4nyiXlz
 vgeYkDiHCDJ8LZvBOUbSET5+FMGeOm7nhwvGT6ll2hSuoby/DiyfQoBOudAO0BzOZoQN
 t+J1h0s6gGRhonPXqs/8gu/rR4z4QgCtZFl7yCBWSFOCespHsvevXdlJcVeyWY9nHzK/
 6KTw==
X-Gm-Message-State: AAQBX9eNaB5+lm9NznslsgZ34xXamd9LPsgKpRf3x2ikEslLXwY4Xk8/
 96RIO/7eK9n7ouE0pfxhAKXWfya+bsjjVRWn
X-Google-Smtp-Source: AKy350aQLNDA6SwhYak90CNFPldRfk/bF4/vlZ3CeAqmvH78fXt1QeiW95e6m12r8qfWlUyX0whYzQ==
X-Received: by 2002:a1c:6a04:0:b0:3ee:da1:1346 with SMTP id
 f4-20020a1c6a04000000b003ee0da11346mr6954984wmc.36.1680773572070; 
 Thu, 06 Apr 2023 02:32:52 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a05600c4ec600b003edc4788fa0sm4914832wmq.2.2023.04.06.02.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:32:51 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH v2 2/4] Add MEN Chameleon Bus via PCI carrier
Date: Thu,  6 Apr 2023 11:31:55 +0200
Message-Id: <20230406093157.104145-3-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406093157.104145-1-jth@kernel.org>
References: <20230406093157.104145-1-jth@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.53; envelope-from=morbidrsa@gmail.com;
 helo=mail-wm1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add PCI based MEN Chameleon Bus carrier emulation.

Signed-off-by: Johannes Thumshirn <jth@kernel.org>
---
 hw/mcb/Kconfig      |   6 +
 hw/mcb/mcb-pci.c    | 297 ++++++++++++++++++++++++++++++++++++++++++++
 hw/mcb/meson.build  |   1 +
 hw/mcb/trace-events |   3 +
 hw/mcb/trace.h      |   1 +
 meson.build         |   1 +
 6 files changed, 309 insertions(+)
 create mode 100644 hw/mcb/mcb-pci.c
 create mode 100644 hw/mcb/trace-events
 create mode 100644 hw/mcb/trace.h

diff --git a/hw/mcb/Kconfig b/hw/mcb/Kconfig
index 36a7a583a8..7deb96c2fe 100644
--- a/hw/mcb/Kconfig
+++ b/hw/mcb/Kconfig
@@ -1,2 +1,8 @@
 config MCB
     bool
+
+config MCB_PCI
+    bool
+    default y if PCI_DEVICES
+    depends on PCI
+    select MCB
diff --git a/hw/mcb/mcb-pci.c b/hw/mcb/mcb-pci.c
new file mode 100644
index 0000000000..4194dcfec1
--- /dev/null
+++ b/hw/mcb/mcb-pci.c
@@ -0,0 +1,297 @@
+/*
+ * QEMU MEN Chameleon Bus emulation
+ *
+ * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/mcb/mcb.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+typedef struct {
+    uint8_t revision;
+    char model;
+    uint8_t minor;
+    uint8_t bus_type;
+    uint16_t magic;
+    uint16_t reserved;
+    /* This one has no '\0' at the end!!! */
+    char filename[12];
+} ChameleonFPGAHeader;
+#define CHAMELEON_BUS_TYPE_WISHBONE 0
+#define CHAMELEONV2_MAGIC 0xabce
+
+typedef struct {
+    PCIDevice dev;
+    MCBus bus;
+    MemoryRegion ctbl;
+    uint16_t status;
+    uint8_t int_set;
+    ChameleonFPGAHeader *header;
+
+    uint8_t minor;
+    uint8_t rev;
+    uint8_t model;
+} MPCIState;
+
+#define TYPE_MCB_PCI "mcb-pci"
+
+#define MPCI(obj)                                       \
+    OBJECT_CHECK(MPCIState, (obj), TYPE_MCB_PCI)
+
+#define CHAMELEON_TABLE_SIZE 0x200
+#define N_MODULES 32
+
+#define PCI_VENDOR_ID_MEN 0x1a88
+#define PCI_DEVICE_ID_MEN_MCBPCI 0x4d45
+
+static uint32_t read_header(MPCIState *s, hwaddr addr)
+{
+    uint32_t ret = 0;
+    ChameleonFPGAHeader *header = s->header;
+
+    switch (addr >> 2) {
+    case 0:
+        ret |= header->revision;
+        ret |= header->model << 8;
+        ret |= header->minor << 16;
+        ret |= header->bus_type << 24;
+        break;
+    case 1:
+        ret |= header->magic;
+        ret |= header->reserved << 16;
+        break;
+    case 2:
+        memcpy(&ret, header->filename, sizeof(uint32_t));
+        break;
+    case 3:
+        memcpy(&ret, header->filename + sizeof(uint32_t),
+               sizeof(uint32_t));
+        break;
+    case 4:
+        memcpy(&ret, header->filename + 2 * sizeof(uint32_t),
+               sizeof(uint32_t));
+    }
+
+    return ret;
+}
+
+static uint32_t read_gdd(MCBDevice *mdev, int reg)
+{
+    ChameleonDeviceDescriptor *gdd;
+    uint32_t ret = 0;
+
+    gdd = mdev->gdd;
+
+    switch (reg) {
+    case 0:
+        ret = gdd->reg1;
+        break;
+    case 1:
+        ret = gdd->reg2;
+        break;
+    case 2:
+        ret = gdd->offset;
+        break;
+    case 3:
+        ret = gdd->size;
+        break;
+    }
+
+    return ret;
+}
+
+static uint64_t mpci_chamtbl_read(void *opaque, hwaddr addr, unsigned size)
+{
+    MPCIState *s = opaque;
+    MCBus *bus = &s->bus;
+    MCBDevice *mdev;
+
+    trace_mpci_chamtbl_read(addr, size);
+
+    if (addr < sizeof(ChameleonFPGAHeader)) {
+        return le32_to_cpu(read_header(s, addr));
+    } else if (addr >= sizeof(ChameleonFPGAHeader) &&
+               addr < CHAMELEON_TABLE_SIZE) {
+        /* Handle read on chameleon table */
+        BusChild *kid;
+        DeviceState *qdev;
+        int slot;
+        int offset;
+        int i;
+
+        offset = addr - sizeof(ChameleonFPGAHeader);
+        slot = offset / sizeof(ChameleonDeviceDescriptor);
+
+        kid = QTAILQ_FIRST(&BUS(bus)->children);
+        for (i = 0; i < slot; i++) {
+            kid = QTAILQ_NEXT(kid, sibling);
+            if (!kid) { /* Last element */
+                return ~0U;
+            }
+        }
+        qdev = kid->child;
+        mdev = MCB_DEVICE(qdev);
+        offset -= slot * 16;
+
+        return le32_to_cpu(read_gdd(mdev, offset / 4));
+    }
+
+    return 0;
+}
+
+static void mpci_chamtbl_write(void *opaque, hwaddr addr, uint64_t val,
+                               unsigned size)
+{
+
+    if (addr < CHAMELEON_TABLE_SIZE) {
+        trace_mpci_chamtbl_write(addr, val);
+    }
+
+    return;
+}
+
+static const MemoryRegionOps mpci_chamtbl_ops = {
+    .read = mpci_chamtbl_read,
+    .write = mpci_chamtbl_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    },
+};
+
+static void mcb_pci_set_irq(void *opaque, int intno, int level)
+{
+    MCBDevice *mdev = opaque;
+    MCBus *bus = MCB_BUS(qdev_get_parent_bus(DEVICE(mdev)));
+    PCIDevice *pcidev = PCI_DEVICE(BUS(bus)->parent);
+    MPCIState *dev = MPCI(pcidev);
+
+    if (level) {
+        pci_set_irq(&dev->dev, !dev->int_set);
+        pci_set_irq(&dev->dev,  dev->int_set);
+    } else {
+        uint16_t level_status = dev->status;
+
+        if (level_status && !dev->int_set) {
+            pci_irq_assert(&dev->dev);
+            dev->int_set = 1;
+        } else if (!level_status && dev->int_set) {
+            pci_irq_deassert(&dev->dev);
+            dev->int_set = 0;
+        }
+    }
+}
+
+static void mcb_pci_write_config(PCIDevice *pci_dev, uint32_t address,
+                                 uint32_t val, int len)
+{
+    pci_default_write_config(pci_dev, address, val, len);
+}
+
+static void mcb_pci_realize(PCIDevice *pci_dev, Error **errp)
+{
+    MPCIState *s = MPCI(pci_dev);
+    uint8_t *pci_conf = s->dev.config;
+    ChameleonFPGAHeader *header;
+    MCBus *bus = &s->bus;
+
+    header = g_new0(ChameleonFPGAHeader, 1);
+
+    s->header = header;
+
+    header->revision = s->rev;
+    header->model = (char) s->model;
+    header->minor = s->minor;
+    header->bus_type = CHAMELEON_BUS_TYPE_WISHBONE;
+    header->magic = CHAMELEONV2_MAGIC;
+    memcpy(&header->filename, "QEMU MCB PCI", 12);
+
+    pci_dev->config_write = mcb_pci_write_config;
+    pci_set_byte(pci_conf + PCI_INTERRUPT_PIN, 0x01); /* Interrupt pin A */
+    pci_conf[PCI_COMMAND] = PCI_COMMAND_MEMORY;
+
+    mcb_bus_init(bus, sizeof(MCBus), DEVICE(pci_dev), N_MODULES,
+                 mcb_pci_set_irq);
+
+    memory_region_init(&bus->mmio_region, OBJECT(s), "mcb-pci.mmio",
+                       2048 * 1024);
+    memory_region_init_io(&s->ctbl, OBJECT(s), &mpci_chamtbl_ops,
+                          s, "mpci_chamtbl_ops", CHAMELEON_TABLE_SIZE);
+    memory_region_add_subregion(&bus->mmio_region, 0, &s->ctbl);
+    pci_register_bar(&s->dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                     &bus->mmio_region);
+
+}
+
+static void mcb_pci_unrealize(PCIDevice *pci_dev)
+{
+    MPCIState *s = MPCI(pci_dev);
+
+    g_free(s->header);
+    s->header = NULL;
+}
+
+static const VMStateDescription vmstate_mcb_pci = {
+    .name = "mcb-pci",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(dev, MPCIState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property mcb_pci_props[] = {
+    DEFINE_PROP_UINT8("revision", MPCIState, rev, 1),
+    DEFINE_PROP_UINT8("minor", MPCIState, minor, 0),
+    DEFINE_PROP_UINT8("model", MPCIState, model, 0x41),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void mcb_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = mcb_pci_realize;
+    k->exit = mcb_pci_unrealize;
+    k->vendor_id = PCI_VENDOR_ID_MEN;
+    k->device_id = PCI_DEVICE_ID_MEN_MCBPCI;
+    k->class_id = PCI_CLASS_BRIDGE_OTHER;
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "MEN Chameleon Bus over PCI";
+    dc->vmsd = &vmstate_mcb_pci;
+    device_class_set_props(dc, mcb_pci_props);
+}
+
+static const TypeInfo mcb_pci_info = {
+    .name = TYPE_MCB_PCI,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(MPCIState),
+    .class_init = mcb_pci_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { }
+    },
+};
+
+static void mcb_pci_register_types(void)
+{
+    type_register(&mcb_pci_info);
+}
+type_init(mcb_pci_register_types);
diff --git a/hw/mcb/meson.build b/hw/mcb/meson.build
index a385edc07c..4e1a0f0cdb 100644
--- a/hw/mcb/meson.build
+++ b/hw/mcb/meson.build
@@ -1 +1,2 @@
 softmmu_ss.add(when: 'CONFIG_MCB', if_true: files('mcb.c'))
+softmmu_ss.add(when: 'CONFIG_MCB_PCI', if_true: files('mcb-pci.c'))
diff --git a/hw/mcb/trace-events b/hw/mcb/trace-events
new file mode 100644
index 0000000000..e1adf9c8e3
--- /dev/null
+++ b/hw/mcb/trace-events
@@ -0,0 +1,3 @@
+# mcb-pci.c
+mpci_chamtbl_read(unsigned long addr, unsigned int size) "read from address 0x%lx size %d"
+mpci_chamtbl_write(unsigned long addr, uint64_t val) "invalid write to 0x%lx: 0x%" PRIx64
diff --git a/hw/mcb/trace.h b/hw/mcb/trace.h
new file mode 100644
index 0000000000..35653b3381
--- /dev/null
+++ b/hw/mcb/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_mcb.h"
diff --git a/meson.build b/meson.build
index 29f8644d6d..ff8305440b 100644
--- a/meson.build
+++ b/meson.build
@@ -2986,6 +2986,7 @@ if have_system
     'hw/input',
     'hw/intc',
     'hw/isa',
+    'hw/mcb',
     'hw/mem',
     'hw/mips',
     'hw/misc',
-- 
2.39.2


