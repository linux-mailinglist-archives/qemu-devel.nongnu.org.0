Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140FF4C0F00
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:19:20 +0100 (CET)
Received: from localhost ([::1]:60004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnnq-0005GD-RL
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnct-0001bb-QP
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:59 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnco-00023R-Qe
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:56 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1D90821EC6;
 Wed, 23 Feb 2022 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2+3Y2v7C83b2PzO7L9N3pbndvBj5nOp+P0TN2m3QKE=;
 b=yUTLM06+4zb3xiPgyxuFprLcboFIxbSz7MLzvd5qQ93tR0Y687ix+uk7DX7WMjMGWKgrDy
 RLl61bdIQFOY5tiNtKY8xIaP4+MRPZoZrHHC41YksjtJ39PBpAd6BEn4wiK1dmjmacvehf
 2XytH0xCuGBAv+6zveYUXXnFlLlGLcs=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 13/14] hw/mem/system-memory: add a memory sysbus device
Date: Wed, 23 Feb 2022 10:07:05 +0100
Message-Id: <20220223090706.4888-14-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device can be used to create a memory wrapped into a
sysbus device.
This device has one property 'readonly' which allows
to choose between a ram or a rom.

The purpose for this device is to be used with qapi command
device_add.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/mem/sysbus-memory.h | 28 ++++++++++++
 hw/mem/sysbus-memory.c         | 80 ++++++++++++++++++++++++++++++++++
 hw/mem/meson.build             |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 include/hw/mem/sysbus-memory.h
 create mode 100644 hw/mem/sysbus-memory.c

diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.h
new file mode 100644
index 0000000000..5c596f8b4f
--- /dev/null
+++ b/include/hw/mem/sysbus-memory.h
@@ -0,0 +1,28 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * SysBusDevice Memory
+ *
+ * Copyright (c) 2021 Greensocs
+ */
+
+#ifndef HW_SYSBUS_MEMORY_H
+#define HW_SYSBUS_MEMORY_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_SYSBUS_MEMORY "sysbus-memory"
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
+
+struct SysBusMemoryState {
+    /* <private> */
+    SysBusDevice parent_obj;
+    uint64_t size;
+    bool readonly;
+
+    /* <public> */
+    MemoryRegion mem;
+};
+
+#endif /* HW_SYSBUS_MEMORY_H */
diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
new file mode 100644
index 0000000000..f1ad7ba7ec
--- /dev/null
+++ b/hw/mem/sysbus-memory.c
@@ -0,0 +1,80 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * SysBusDevice Memory
+ *
+ * Copyright (c) 2021 Greensocs
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mem/sysbus-memory.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+static Property sysbus_memory_properties[] = {
+    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
+    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sysbus_memory_realize(DeviceState *dev, Error **errp)
+{
+    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
+    gchar *name;
+
+    if (!s->size) {
+        error_setg(errp, "'size' must be non-zero.");
+        return;
+    }
+
+    /*
+     * We impose having an id (which is unique) because we need to generate
+     * a unique name for the memory region.
+     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
+     * function if 2 system-memory devices are created with the same name
+     * for the memory region).
+     */
+    if (!dev->id) {
+        error_setg(errp, "system-memory device must have an id.");
+        return;
+    }
+    name = g_strdup_printf("%s.region", dev->id);
+
+    if (s->readonly) {
+        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
+    } else {
+        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
+    }
+
+    g_free(name);
+    if (*errp) {
+        return;
+    }
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
+}
+
+static void sysbus_memory_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->user_creatable = true;
+    dc->realize = sysbus_memory_realize;
+    device_class_set_props(dc, sysbus_memory_properties);
+}
+
+static const TypeInfo sysbus_memory_info = {
+    .name          = TYPE_SYSBUS_MEMORY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SysBusMemoryState),
+    .class_init    = sysbus_memory_class_init,
+};
+
+static void sysbus_memory_register_types(void)
+{
+    type_register_static(&sysbus_memory_info);
+}
+
+type_init(sysbus_memory_register_types)
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 82f86d117e..04c74e12f2 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
 softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
+
+softmmu_ss.add(files('sysbus-memory.c'))
-- 
2.35.1


