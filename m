Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF10308813
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:09:19 +0100 (CET)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ReQ-0008AC-1M
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWA-0004ds-9F
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVx-00070I-JT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 6so8390213wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JxNtuIVt7+VefAfJnlEhCbGDns5pnZHg5md1Cqm/Tes=;
 b=hPp7S5YfSwRmMImtoPC/mUxlIoLMq0JhiAgBSy8XHS3Wzqa3GXs9s1xWmq9EpZUoB+
 yarXScA/2/JmzVVNoSI/YSt8TVxenoc7C5OJPmqYDLxElje7QQhmzJA6FAUgU/JuDbn6
 G/HwLZPuH7fXsvLudhuKZBZK3Yix0MP+Fuqq38hBRH/FstTFw3l8LAnc2K6KmrgQo8rC
 k1W6VOoPSbeDWWMf5aCyIoZgtu6IpKGHQsBrDLDJUUUHPFfDOMI6gtRhHZOXh384W3+7
 MYwJckT/NQ1rD3Gi87n6R6pDaDwRY+TrSNVkIHFpk82znAr4kmy2s/A1A37M/+4+k6Rn
 su+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JxNtuIVt7+VefAfJnlEhCbGDns5pnZHg5md1Cqm/Tes=;
 b=KIrXG+q6lDEK84pjKd9eCZBOxmQ06nCqUqMRcexhCS+kLLAReopYj4/5FtDoImIb5k
 C6VHjEZyIm4ppK3hYAPFMbT0iO+qHgFvShpLk5Z/XXs8n0G0tyBhU3gzRyIuYmGchrdI
 cRikoAhqP53TDLJ4ca+4dYQkfevTKbhbrBuViLFeNGDdL6IZFuJrtjOVrP8F5aJbu4UW
 eRNkcxFlGMhmZ//9Egg8jmi+5mJEY7bes2JvmSuHuIs6uZKgJBetkRl64HJWLUV8GRBR
 ToKAGnFSZFXS7Aec6TqmI3LYNVy7YrOXCRUoge7YlWxhen5haRxC9xQmVeu3hVIHgSwZ
 xZAQ==
X-Gm-Message-State: AOAM532u2IrjxEY5LB3e+KdRE37B5ITZqWds+wRT01l0ZI3mY4Y500ob
 Y1/88TdFg/93EDDMVFQkzyXxKOhczRpvbQ==
X-Google-Smtp-Source: ABdhPJw0zRIsZxDoJ7w82hw/lI7mVNYW+xGz96fsjKPeM9UOx8CJcThrCsPeoOgc5xtw2ai3VmGB9A==
X-Received: by 2002:adf:9d48:: with SMTP id o8mr3917987wre.408.1611918031335; 
 Fri, 29 Jan 2021 03:00:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/46] hw/misc/pvpanic: split-out generic and bus dependent code
Date: Fri, 29 Jan 2021 10:59:44 +0000
Message-Id: <20210129110012.8660-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mihai Carabas <mihai.carabas@oracle.com>

To ease the PCI device addition in next patches, split the code as follows:
- generic code (read/write/setup) is being kept in pvpanic.c
- ISA dependent code moved to pvpanic-isa.c

Also, rename:
- ISA_PVPANIC_DEVICE -> PVPANIC_ISA_DEVICE.
- TYPE_PVPANIC -> TYPE_PVPANIC_ISA.
- MemoryRegion io -> mr.
- pvpanic_ioport_* in pvpanic_*.

Update the build system with the new files and config structure.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/pvpanic.h | 23 +++++++++-
 hw/misc/pvpanic-isa.c     | 94 +++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c         | 85 +++--------------------------------
 hw/i386/Kconfig           |  2 +-
 hw/misc/Kconfig           |  6 ++-
 hw/misc/meson.build       |  3 +-
 tests/qtest/meson.build   |  2 +-
 7 files changed, 130 insertions(+), 85 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c

diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index ae0c8188cef..abc9dde34b3 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -17,13 +17,32 @@
 
 #include "qom/object.h"
 
-#define TYPE_PVPANIC "pvpanic"
+#define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
+/* The bit of supported pv event, TODO: include uapi header and remove this */
+#define PVPANIC_F_PANICKED      0
+#define PVPANIC_F_CRASHLOADED   1
+
+/* The pv event value */
+#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
+#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
+
+/*
+ * PVPanicState for any device type
+ */
+typedef struct PVPanicState PVPanicState;
+struct PVPanicState {
+    MemoryRegion mr;
+    uint8_t events;
+};
+
+void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size);
+
 static inline uint16_t pvpanic_port(void)
 {
-    Object *o = object_resolve_path_type("", TYPE_PVPANIC, NULL);
+    Object *o = object_resolve_path_type("", TYPE_PVPANIC_ISA_DEVICE, NULL);
     if (!o) {
         return 0;
     }
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
new file mode 100644
index 00000000000..27113abd6cf
--- /dev/null
+++ b/hw/misc/pvpanic-isa.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU simulated pvpanic device.
+ *
+ * Copyright Fujitsu, Corp. 2013
+ *
+ * Authors:
+ *     Wen Congyang <wency@cn.fujitsu.com>
+ *     Hu Tao <hutao@cn.fujitsu.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "sysemu/runstate.h"
+
+#include "hw/nvram/fw_cfg.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/pvpanic.h"
+#include "qom/object.h"
+#include "hw/isa/isa.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PVPanicISAState, PVPANIC_ISA_DEVICE)
+
+/*
+ * PVPanicISAState for ISA device and
+ * use ioport.
+ */
+struct PVPanicISAState {
+    ISADevice parent_obj;
+
+    uint16_t ioport;
+    PVPanicState pvpanic;
+};
+
+static void pvpanic_isa_initfn(Object *obj)
+{
+    PVPanicISAState *s = PVPANIC_ISA_DEVICE(obj);
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), 1);
+}
+
+static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
+{
+    ISADevice *d = ISA_DEVICE(dev);
+    PVPanicISAState *s = PVPANIC_ISA_DEVICE(dev);
+    PVPanicState *ps = &s->pvpanic;
+    FWCfgState *fw_cfg = fw_cfg_find();
+    uint16_t *pvpanic_port;
+
+    if (!fw_cfg) {
+        return;
+    }
+
+    pvpanic_port = g_malloc(sizeof(*pvpanic_port));
+    *pvpanic_port = cpu_to_le16(s->ioport);
+    fw_cfg_add_file(fw_cfg, "etc/pvpanic-port", pvpanic_port,
+                    sizeof(*pvpanic_port));
+
+    isa_register_ioport(d, &ps->mr, s->ioport);
+}
+
+static Property pvpanic_isa_properties[] = {
+    DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicISAState, ioport, 0x505),
+    DEFINE_PROP_UINT8("events", PVPanicISAState, pvpanic.events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = pvpanic_isa_realizefn;
+    device_class_set_props(dc, pvpanic_isa_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static TypeInfo pvpanic_isa_info = {
+    .name          = TYPE_PVPANIC_ISA_DEVICE,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(PVPanicISAState),
+    .instance_init = pvpanic_isa_initfn,
+    .class_init    = pvpanic_isa_class_init,
+};
+
+static void pvpanic_register_types(void)
+{
+    type_register_static(&pvpanic_isa_info);
+}
+
+type_init(pvpanic_register_types)
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 35d6797831d..e2cb4a5d28a 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -22,18 +22,6 @@
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
 
-/* The bit of supported pv event, TODO: include uapi header and remove this */
-#define PVPANIC_F_PANICKED      0
-#define PVPANIC_F_CRASHLOADED   1
-
-/* The pv event value */
-#define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
-#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
-
-typedef struct PVPanicState PVPanicState;
-DECLARE_INSTANCE_CHECKER(PVPanicState, ISA_PVPANIC_DEVICE,
-                         TYPE_PVPANIC)
-
 static void handle_event(int event)
 {
     static bool logged;
@@ -54,90 +42,29 @@ static void handle_event(int event)
     }
 }
 
-#include "hw/isa/isa.h"
-
-struct PVPanicState {
-    ISADevice parent_obj;
-
-    MemoryRegion io;
-    uint16_t ioport;
-    uint8_t events;
-};
-
 /* return supported events on read */
-static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
+static uint64_t pvpanic_read(void *opaque, hwaddr addr, unsigned size)
 {
     PVPanicState *pvp = opaque;
     return pvp->events;
 }
 
-static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
+static void pvpanic_write(void *opaque, hwaddr addr, uint64_t val,
                                  unsigned size)
 {
     handle_event(val);
 }
 
 static const MemoryRegionOps pvpanic_ops = {
-    .read = pvpanic_ioport_read,
-    .write = pvpanic_ioport_write,
+    .read = pvpanic_read,
+    .write = pvpanic_write,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
     },
 };
 
-static void pvpanic_isa_initfn(Object *obj)
+void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size)
 {
-    PVPanicState *s = ISA_PVPANIC_DEVICE(obj);
-
-    memory_region_init_io(&s->io, OBJECT(s), &pvpanic_ops, s, "pvpanic", 1);
+    memory_region_init_io(&s->mr, OBJECT(dev), &pvpanic_ops, s, "pvpanic", size);
 }
-
-static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
-{
-    ISADevice *d = ISA_DEVICE(dev);
-    PVPanicState *s = ISA_PVPANIC_DEVICE(dev);
-    FWCfgState *fw_cfg = fw_cfg_find();
-    uint16_t *pvpanic_port;
-
-    if (!fw_cfg) {
-        return;
-    }
-
-    pvpanic_port = g_malloc(sizeof(*pvpanic_port));
-    *pvpanic_port = cpu_to_le16(s->ioport);
-    fw_cfg_add_file(fw_cfg, "etc/pvpanic-port", pvpanic_port,
-                    sizeof(*pvpanic_port));
-
-    isa_register_ioport(d, &s->io, s->ioport);
-}
-
-static Property pvpanic_isa_properties[] = {
-    DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicState, ioport, 0x505),
-    DEFINE_PROP_UINT8("events", PVPanicState, events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = pvpanic_isa_realizefn;
-    device_class_set_props(dc, pvpanic_isa_properties);
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-}
-
-static TypeInfo pvpanic_isa_info = {
-    .name          = TYPE_PVPANIC,
-    .parent        = TYPE_ISA_DEVICE,
-    .instance_size = sizeof(PVPanicState),
-    .instance_init = pvpanic_isa_initfn,
-    .class_init    = pvpanic_isa_class_init,
-};
-
-static void pvpanic_register_types(void)
-{
-    type_register_static(&pvpanic_isa_info);
-}
-
-type_init(pvpanic_register_types)
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index eea059ffef5..7f91f30877f 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -14,7 +14,7 @@ config PC
     imply ISA_DEBUG
     imply PARALLEL
     imply PCI_DEVICES
-    imply PVPANIC
+    imply PVPANIC_ISA
     imply QXL
     imply SEV
     imply SGA
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cf18ac08e66..23bc9786cf4 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -121,9 +121,13 @@ config IOTKIT_SYSCTL
 config IOTKIT_SYSINFO
     bool
 
-config PVPANIC
+config PVPANIC_COMMON
+    bool
+
+config PVPANIC_ISA
     bool
     depends on ISA_BUS
+    select PVPANIC_COMMON
 
 config AUX
     bool
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 607cd38a210..edaaec2a3ee 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -13,6 +13,7 @@ softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
 # ARM devices
 softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
@@ -98,7 +99,7 @@ softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c')
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
-softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 16d04625b8b..0e85343b96b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -33,7 +33,7 @@ qtests_i386 = \
   (config_host.has_key('CONFIG_LINUX') and                                                  \
    config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
-  (config_all_devices.has_key('CONFIG_PVPANIC') ? ['pvpanic-test'] : []) +                  \
+  (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
-- 
2.20.1


