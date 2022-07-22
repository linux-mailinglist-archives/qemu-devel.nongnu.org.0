Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE957E760
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:27:57 +0200 (CEST)
Received: from localhost ([::1]:49426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyJY-0002sj-42
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDe-0002py-Cr
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:21:50 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDc-0003LB-GF
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:21:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f11so5346646plr.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7l6k0l7MFzy3G7hKFTbJ/Zq3iIt+cG4Kjc3pCe8iRZ0=;
 b=WT4fAwvYHp4XGty81WL8lRa2zXyC4Wpn1saVtqn387yWiZbQLG+8gcOr4jBXHGeqQL
 Qtg/pvuSfyIMmMjU922RDNAQZUXFJKI2rDEX/fZHIMf1TKpxYBZh55mGshOCIo/erI0V
 8biJSKEftYexVX8Qj474WHgF/DE/pGf7CphahjKHhbdKfpD0rgAqbuEYW+9jh3iwolwF
 M8Ge0QpgYiOftS2nXa/OPI0wbdOPJFPYlV0+FGudykaw22uVDWcpcP8xz082vCg2syIe
 zn6YxNk4Bi7aM63w2AbfjIU+HErs2vLHBMGIVT22H12Fl3mnbUhS/yGTLvoMxcOIfE77
 C0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7l6k0l7MFzy3G7hKFTbJ/Zq3iIt+cG4Kjc3pCe8iRZ0=;
 b=7wobxVT95Vm4FyQVA1k2FFrIrmZVSXjPeVNRJIAW0pSFkRBmpyKg5HFE26/pUObCUS
 lE7hoidGDjdNvZ4AlapP7ve/6OGRndbdQC0Af2aF1cS/yR9zvGb7fV5PFPfullYmJSq+
 HN2PSxaXWkRPezYYQgzmu7X7zTojAg3K58ta04jTCo+cS09cSH20wZfMvLoE4WCK0ojO
 ggojH8Llhd7/yoJ+24+JE3hAZC6GI2/LoiciC4pM1FRWcoIaoGf46u+6hVJ38GOInbmY
 cNDG4t7sK7nIY+Uc83s++BCEjiZmiz/7Y4tYh6k36oNe58rVYseCcMTfgOo07gkOIRCp
 Bn1g==
X-Gm-Message-State: AJIora+HjuZk0RjVgE+y9HsSon85BLeENZT+ql4kb5Ryg5fXv11XliDs
 L/YpxEjXEVZe7o9VNyx4iP++0k5P/4iuMA==
X-Google-Smtp-Source: AGRyM1vBq5g556xofebompGVvRMvWejUfKob4QpcRMWqmrrrwIrfxvJhn8dFq0TGN+bH7ijgf2hZhw==
X-Received: by 2002:a17:902:bb8a:b0:16d:190d:981d with SMTP id
 m10-20020a170902bb8a00b0016d190d981dmr989427pls.53.1658517706947; 
 Fri, 22 Jul 2022 12:21:46 -0700 (PDT)
Received: from localhost.localdomain ([76.132.29.156])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a17090a2ec500b001f246f2a423sm2006394pjs.17.2022.07.22.12.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 12:21:46 -0700 (PDT)
From: Richard Liu <richy.liu.2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: alxndr@bu.edu, bsd@redhat.com, darren.kenny@oracle.com,
 Richard Liu <richy.liu.2002@gmail.com>
Subject: [RFC 1/3] create skeleton snapshot device and add docs
Date: Fri, 22 Jul 2022 12:20:39 -0700
Message-Id: <20220722192041.93006-2-richy.liu.2002@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722192041.93006-1-richy.liu.2002@gmail.com>
References: <20220722192041.93006-1-richy.liu.2002@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richy.liu.2002@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Added a simple skeleton PCI device for snapshot/restores. Added
documentation about the snapshot/restore functionality.

Signed-off-by: Richard Liu <richy.liu.2002@gmail.com>
---
 docs/devel/snapshot.rst | 26 +++++++++++++
 hw/i386/Kconfig         |  1 +
 hw/misc/Kconfig         |  3 ++
 hw/misc/meson.build     |  1 +
 hw/misc/snapshot.c      | 86 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 117 insertions(+)
 create mode 100644 docs/devel/snapshot.rst
 create mode 100644 hw/misc/snapshot.c

diff --git a/docs/devel/snapshot.rst b/docs/devel/snapshot.rst
new file mode 100644
index 0000000000..a333de69b6
--- /dev/null
+++ b/docs/devel/snapshot.rst
@@ -0,0 +1,26 @@
+================
+Snapshot/restore
+================
+
+The ability to rapidly snapshot and restore guest VM state is a
+crucial component of fuzzing applications with QEMU. A special virtual
+device can be used by fuzzers to interface with snapshot/restores
+commands in QEMU. The virtual device should have the following
+commands supported that can be called by the guest:
+
+- snapshot: save a copy of the guest VM memory, registers, and virtual
+  device state
+- restore: restore the saved copy of guest VM state
+- coverage_location: given a location in guest memory, specifying
+  where the coverage data is to be passed to the fuzzer
+- input_location: specify where in the guest memory the fuzzing input
+  should be stored
+- done: indicates whether or not the run succeeded and that the
+  coverage data has been populated
+
+The first version of the virtual device will only accept snapshot and
+restore commands from the guest. Coverage data will be collected by
+code on the guest with source-based coverage tracking.
+
+Further expansions could include controlling the snapshot/restore from
+host and gathering code coverage information directly from TCG.
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..55656eddf5 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -46,6 +46,7 @@ config PC
     select ACPI_VMGENID
     select VIRTIO_PMEM_SUPPORTED
     select VIRTIO_MEM_SUPPORTED
+    select SNAPSHOT
 
 config PC_PCI
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c..fe84f812f2 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -174,4 +174,7 @@ config VIRT_CTRL
 config LASI
     bool
 
+config SNAPSHOT
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..ac8fcc5f0b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -10,6 +10,7 @@ softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
+softmmu_ss.add(when: 'CONFIG_SNAPSHOT', if_true: files('snapshot.c'))
 
 # ARM devices
 softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
diff --git a/hw/misc/snapshot.c b/hw/misc/snapshot.c
new file mode 100644
index 0000000000..2690b331fd
--- /dev/null
+++ b/hw/misc/snapshot.c
@@ -0,0 +1,86 @@
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/pci/pci.h"
+#include "hw/hw.h"
+#include "hw/boards.h"
+#include "exec/ramblock.h"
+#include "qom/object.h"
+#include "qemu/module.h"
+#include "qapi/visitor.h"
+#include "io/channel-buffer.h"
+#include "migration/savevm.h"
+
+#define TYPE_PCI_SNAPSHOT_DEVICE "snapshot"
+typedef struct SnapshotState SnapshotState;
+DECLARE_INSTANCE_CHECKER(SnapshotState, SNAPSHOT,
+                         TYPE_PCI_SNAPSHOT_DEVICE)
+
+struct SnapshotState {
+    PCIDevice pdev;
+    MemoryRegion mmio;
+};
+
+static uint64_t snapshot_mmio_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void snapshot_mmio_write(void *opaque, hwaddr addr, uint64_t val,
+                unsigned size)
+{
+}
+
+static const MemoryRegionOps snapshot_mmio_ops = {
+    .read = snapshot_mmio_read,
+    .write = snapshot_mmio_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+
+};
+
+static void pci_snapshot_realize(PCIDevice *pdev, Error **errp)
+{
+    SnapshotState *snapshot = SNAPSHOT(pdev);
+
+    memory_region_init_io(&snapshot->mmio, OBJECT(snapshot), &snapshot_mmio_ops, snapshot,
+                    "snapshot-mmio", 1 * MiB);
+    pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &snapshot->mmio);
+}
+
+static void snapshot_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
+
+    k->realize = pci_snapshot_realize;
+    k->vendor_id = PCI_VENDOR_ID_QEMU;
+    k->device_id = 0xf987;
+    k->revision = 0x10;
+    k->class_id = PCI_CLASS_OTHERS;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static void pci_snapshot_register_types(void)
+{
+    static InterfaceInfo interfaces[] = {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    };
+    static const TypeInfo snapshot_info = {
+        .name          = TYPE_PCI_SNAPSHOT_DEVICE,
+        .parent        = TYPE_PCI_DEVICE,
+        .instance_size = sizeof(SnapshotState),
+        .class_init    = snapshot_class_init,
+        .interfaces = interfaces,
+    };
+
+    type_register_static(&snapshot_info);
+}
+type_init(pci_snapshot_register_types)
-- 
2.35.1


