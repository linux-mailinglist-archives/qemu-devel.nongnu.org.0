Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C7433E079
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:27:32 +0100 (CET)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHDv-0003kc-Oq
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2h-0005bp-2J
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2X-0003VT-SI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZXSIHp0JmDXWhRC+N/MuL0H43fnG/VNZgno+EIqtas=;
 b=QqlglqyezFOc6EVoJf00OY/qLdaJz9XKIeD7Xs6gddq6lTKBlGmqVoVZEUdZQhJcz8vWlq
 umac5LjlfzDX2TS4a891EReLPbv9V1u8OKUEwYEuIVgX/a1/CMbcLYM2Nqo1Fw8r0argdo
 oDHFsZRSy+X6w5nK8ySdrz+f9IK059A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-xBmg3mr_NeCZYtC5VjdJcw-1; Tue, 16 Mar 2021 17:15:43 -0400
X-MC-Unique: xBmg3mr_NeCZYtC5VjdJcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCB97100C61B;
 Tue, 16 Mar 2021 21:15:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9261378D;
 Tue, 16 Mar 2021 21:15:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] memory: add a sparse memory device for fuzzing
Date: Tue, 16 Mar 2021 17:15:24 -0400
Message-Id: <20210316211531.1649909-10-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

For testing, it can be useful to simulate an enormous amount of memory
(e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
When something writes a nonzero value to a sparse-mem address, we
allocate a block of memory. For now, since the only user of this device
is the fuzzer, we do not track and free zeroed blocks. The device has a
very low priority (so it can be mapped beneath actual RAM, and virtual
device MMIO regions).

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                 |   1 +
 hw/mem/meson.build          |   1 +
 hw/mem/sparse-mem.c         | 151 ++++++++++++++++++++++++++++++++++++
 include/hw/mem/sparse-mem.h |  19 +++++
 4 files changed, 172 insertions(+)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0bd720a3d6..2a925e76ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2636,6 +2636,7 @@ S: Maintained
 F: tests/qtest/fuzz/
 F: tests/qtest/fuzz-*test.c
 F: scripts/oss-fuzz/
+F: hw/mem/sparse-mem.c
 F: docs/devel/fuzzing.rst
 
 Register API
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 0d22f2b572..ef79e04678 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,5 +1,6 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
+mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
 mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
new file mode 100644
index 0000000000..a13ac74dd9
--- /dev/null
+++ b/hw/mem/sparse-mem.c
@@ -0,0 +1,151 @@
+/*
+ * A sparse memory device. Useful for fuzzing
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/address-spaces.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/units.h"
+#include "sysemu/qtest.h"
+#include "hw/mem/sparse-mem.h"
+
+#define SPARSE_MEM(obj) OBJECT_CHECK(SparseMemState, (obj), TYPE_SPARSE_MEM)
+#define SPARSE_BLOCK_SIZE 0x1000
+
+typedef struct SparseMemState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+    uint64_t baseaddr;
+    uint64_t length;
+    uint64_t size_used;
+    uint64_t maxsize;
+    GHashTable *mapped;
+} SparseMemState;
+
+typedef struct sparse_mem_block {
+    uint8_t data[SPARSE_BLOCK_SIZE];
+} sparse_mem_block;
+
+static uint64_t sparse_mem_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SparseMemState *s = opaque;
+    uint64_t ret = 0;
+    size_t pfn = addr / SPARSE_BLOCK_SIZE;
+    size_t offset = addr % SPARSE_BLOCK_SIZE;
+    sparse_mem_block *block;
+
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (block) {
+        assert(offset + size <= sizeof(block->data));
+        memcpy(&ret, block->data + offset, size);
+    }
+    return ret;
+}
+
+static void sparse_mem_write(void *opaque, hwaddr addr, uint64_t v,
+                             unsigned int size)
+{
+    SparseMemState *s = opaque;
+    size_t pfn = addr / SPARSE_BLOCK_SIZE;
+    size_t offset = addr % SPARSE_BLOCK_SIZE;
+    sparse_mem_block *block;
+
+    if (!g_hash_table_lookup(s->mapped, (void *)pfn) &&
+        s->size_used + SPARSE_BLOCK_SIZE < s->maxsize && v) {
+        g_hash_table_insert(s->mapped, (void *)pfn,
+                            g_new0(sparse_mem_block, 1));
+        s->size_used += sizeof(block->data);
+    }
+    block = g_hash_table_lookup(s->mapped, (void *)pfn);
+    if (!block) {
+        return;
+    }
+
+    assert(offset + size <= sizeof(block->data));
+
+    memcpy(block->data + offset, &v, size);
+
+}
+
+static const MemoryRegionOps sparse_mem_ops = {
+    .read = sparse_mem_read,
+    .write = sparse_mem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+            .min_access_size = 1,
+            .max_access_size = 8,
+            .unaligned = false,
+        },
+};
+
+static Property sparse_mem_properties[] = {
+    /* The base address of the memory */
+    DEFINE_PROP_UINT64("baseaddr", SparseMemState, baseaddr, 0x0),
+    /* The length of the sparse memory region */
+    DEFINE_PROP_UINT64("length", SparseMemState, length, UINT64_MAX),
+    /* Max amount of actual memory that can be used to back the sparse memory */
+    DEFINE_PROP_UINT64("maxsize", SparseMemState, maxsize, 10 * MiB),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_SPARSE_MEM);
+    qdev_prop_set_uint64(dev, "baseaddr", addr);
+    qdev_prop_set_uint64(dev, "length", length);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(dev), 0, addr, -10000);
+    return &SPARSE_MEM(dev)->mmio;
+}
+
+static void sparse_mem_realize(DeviceState *dev, Error **errp)
+{
+    SparseMemState *s = SPARSE_MEM(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    if (!qtest_enabled()) {
+        error_setg(errp, "sparse_mem device should only be used "
+                         "for testing with QTest");
+        return;
+    }
+
+    assert(s->baseaddr + s->length > s->baseaddr);
+
+    s->mapped = g_hash_table_new(NULL, NULL);
+    memory_region_init_io(&s->mmio, OBJECT(s), &sparse_mem_ops, s,
+                          "sparse-mem", s->length);
+    sysbus_init_mmio(sbd, &s->mmio);
+}
+
+static void sparse_mem_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, sparse_mem_properties);
+
+    dc->desc = "Sparse Memory Device";
+    dc->realize = sparse_mem_realize;
+}
+
+static const TypeInfo sparse_mem_types[] = {
+    {
+        .name = TYPE_SPARSE_MEM,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(SparseMemState),
+        .class_init = sparse_mem_class_init,
+    },
+};
+DEFINE_TYPES(sparse_mem_types);
diff --git a/include/hw/mem/sparse-mem.h b/include/hw/mem/sparse-mem.h
new file mode 100644
index 0000000000..f9863b154b
--- /dev/null
+++ b/include/hw/mem/sparse-mem.h
@@ -0,0 +1,19 @@
+/*
+ * A sparse memory device. Useful for fuzzing
+ *
+ * Copyright Red Hat Inc., 2021
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef SPARSE_MEM_H
+#define SPARSE_MEM_H
+#define TYPE_SPARSE_MEM "sparse-mem"
+
+MemoryRegion *sparse_mem_init(uint64_t addr, uint64_t length);
+
+#endif
-- 
2.26.2



