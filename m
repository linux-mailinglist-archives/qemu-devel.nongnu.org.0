Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D483B32F183
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:40:09 +0100 (CET)
Received: from localhost ([::1]:49140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEQq-0001FC-Tb
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp4-0003cd-Tq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:09 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:52744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIDp1-00014f-0f
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TOYERzPvVL+YCT26QNmOSSycH0Wyx+LkqUSEQzOPGIM=; b=SGFRirQEVdoiTitWUb+FVDrqik
 OzWcBq6129dt1GK5qvWny1yzZ8JjUZbAAmIUs2j8kXJ2Ayj6eUbiKyrT+OEy5e5ZZJsOh44H0eiCf
 AA1tXW/izurM04smhquL0Zg6h9bPGtljmv5dQdGSw8XhuonZ6TcoWYvcQNSEccPvrhvk=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] hw/tricore: Add testdevice for tests in tests/tcg/
Date: Fri,  5 Mar 2021 18:00:33 +0100
Message-Id: <20210305170045.869437-4-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.165117, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30601043, da=102572724,
 mc=533, sc=4, hc=529, sp=0, fso=30601043, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kbastian@mail.uni-paderborn.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this device is used to verify the correctness of regression tests by
allowing guests to write their exit status to this device. This is then
used by qemu to exit using the written status.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 hw/tricore/meson.build                  |  1 +
 hw/tricore/tricore_testboard.c          |  8 +++
 hw/tricore/tricore_testdevice.c         | 82 +++++++++++++++++++++++++
 include/hw/tricore/tricore_testdevice.h | 38 ++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 hw/tricore/tricore_testdevice.c
 create mode 100644 include/hw/tricore/tricore_testdevice.h

diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 579aa13c78..907a4c8c8f 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,4 +1,5 @@
 tricore_ss = ss.source_set()
 tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
 
 hw_arch += {'tricore': tricore_ss}
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 12ea1490fd..9791986a3e 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -28,6 +28,7 @@
 #include "exec/address-spaces.h"
 #include "elf.h"
 #include "hw/tricore/tricore.h"
+#include "hw/tricore/tricore_testdevice.h"
 #include "qemu/error-report.h"
 
 
@@ -57,6 +58,7 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
 {
     TriCoreCPU *cpu;
     CPUTriCoreState *env;
+    TriCoreTestDeviceState *test_dev;
 
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *ext_cram = g_new(MemoryRegion, 1);
@@ -88,6 +90,12 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
     memory_region_add_subregion(sysmem, 0xf0050000, pcp_data);
     memory_region_add_subregion(sysmem, 0xf0060000, pcp_text);
 
+    test_dev = g_new(TriCoreTestDeviceState, 1);
+    object_initialize(test_dev, sizeof(TriCoreTestDeviceState),
+                      TYPE_TRICORE_TESTDEVICE);
+    memory_region_add_subregion(sysmem, 0xf0000000, &test_dev->iomem);
+
+
     tricoretb_binfo.ram_size = machine->ram_size;
     tricoretb_binfo.kernel_filename = machine->kernel_filename;
 
diff --git a/hw/tricore/tricore_testdevice.c b/hw/tricore/tricore_testdevice.c
new file mode 100644
index 0000000000..a1563aa568
--- /dev/null
+++ b/hw/tricore/tricore_testdevice.c
@@ -0,0 +1,82 @@
+/*
+ *  Copyright (c) 2018-2021 Bastian Koppelmann Paderborn University
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "hw/tricore/tricore_testdevice.h"
+
+static void tricore_testdevice_write(void *opaque, hwaddr offset,
+                                      uint64_t value, unsigned size)
+{
+    exit(value);
+}
+
+static uint64_t tricore_testdevice_read(void *opaque, hwaddr offset,
+                                         unsigned size)
+{
+    return 0xdeadbeef;
+}
+
+static void tricore_testdevice_reset(DeviceState *dev)
+{
+}
+
+static const MemoryRegionOps tricore_testdevice_ops = {
+    .read = tricore_testdevice_read,
+    .write = tricore_testdevice_write,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void tricore_testdevice_init(Object *obj)
+{
+    TriCoreTestDeviceState *s = TRICORE_TESTDEVICE(obj);
+   /* map memory */
+    memory_region_init_io(&s->iomem, OBJECT(s), &tricore_testdevice_ops, s,
+                          "tricore_testdevice", 0x4);
+}
+
+static Property tricore_testdevice_properties[] = {
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void tricore_testdevice_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, tricore_testdevice_properties);
+    dc->reset = tricore_testdevice_reset;
+}
+
+static const TypeInfo tricore_testdevice_info = {
+    .name          = TYPE_TRICORE_TESTDEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(TriCoreTestDeviceState),
+    .instance_init = tricore_testdevice_init,
+    .class_init    = tricore_testdevice_class_init,
+};
+
+static void tricore_testdevice_register_types(void)
+{
+    type_register_static(&tricore_testdevice_info);
+}
+
+type_init(tricore_testdevice_register_types)
diff --git a/include/hw/tricore/tricore_testdevice.h b/include/hw/tricore/tricore_testdevice.h
new file mode 100644
index 0000000000..2c56c51bcb
--- /dev/null
+++ b/include/hw/tricore/tricore_testdevice.h
@@ -0,0 +1,38 @@
+/*
+ *  Copyright (c) 2018-2021  Bastian Koppelmann Paderborn University
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+
+#ifndef HW_TRICORE_TESTDEV_H
+#define HW_TRICORE_TESTDEV_H
+
+#include "hw/sysbus.h"
+#include "hw/hw.h"
+
+#define TYPE_TRICORE_TESTDEVICE "tricore_testdevice"
+#define TRICORE_TESTDEVICE(obj) \
+    OBJECT_CHECK(TriCoreTestDeviceState, (obj), TYPE_TRICORE_TESTDEVICE)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+} TriCoreTestDeviceState;
+
+#endif
-- 
2.30.1


