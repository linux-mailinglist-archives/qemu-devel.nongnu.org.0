Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223AC2F8558
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:26:19 +0100 (CET)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Uji-0007SA-6p
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Uer-0004pg-JD
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:21:17 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l0Uem-0001v5-II
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:21:17 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJEGY6005710;
 Fri, 15 Jan 2021 19:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=yV9i4s3hx1X02PHKWahiRTb+HVSWkUrLCT/cclR9gK0=;
 b=Phzc6tAlo5b1wBWjdwl82RzBTklPyDh4dD9Na3HR4z4lQ+iZJnLXy5T+Q9WE11U2jk9Y
 Qx58PIcuh4yDqdln59uT5UFMUUFYLDBt6QaGnpLsxMto7e9P1j0FRwLhi9Gl8t1znkd9
 2fJiSYQMFdf9hzgi9V7+itO/4RQd4wbwohYmOjlQVzFZJaw8TQOsTHOaXn1jDnvpgGCu
 6GZKC+Vm+jK1Y5ZhxU4N/02RDSTv7JQIRTuDFwa25z9vUR0eP4eYewpzrPD+oN9NZgi1
 ItaJlyhaEsvDD7HVvt6bv+jMrpRwtoSMsAkcE7P99Kt+AvjnmT9MjEWJ5/cRI1afV0xb BA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 360kd06dq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJKbCP107635;
 Fri, 15 Jan 2021 19:21:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 360kf3qe7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:21:07 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FJL5mK005866;
 Fri, 15 Jan 2021 19:21:06 GMT
Received: from mihai.localdomain (/10.153.73.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 11:21:05 -0800
From: Mihai Carabas <mihai.carabas@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/misc/pvpanic: split-out generic and bus dependent code
Date: Fri, 15 Jan 2021 20:34:03 +0200
Message-Id: <1610735646-13313-2-git-send-email-mihai.carabas@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150116
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=mihai.carabas@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>, peter.maydell@linaro.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/i386/Kconfig           |  2 +-
 hw/misc/Kconfig           |  6 ++-
 hw/misc/meson.build       |  3 +-
 hw/misc/pvpanic-isa.c     | 94 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/pvpanic.c         | 85 +++---------------------------------------
 include/hw/misc/pvpanic.h | 23 +++++++++++-
 tests/qtest/meson.build   |  2 +-
 7 files changed, 130 insertions(+), 85 deletions(-)
 create mode 100644 hw/misc/pvpanic-isa.c

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index eea059f..7f91f30 100644
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
index cf18ac0..23bc978 100644
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
index ce15ffc..8c828ad 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -13,6 +13,7 @@ softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
 # ARM devices
 softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
@@ -97,7 +98,7 @@ softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c')
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
-softmmu_ss.add(when: 'CONFIG_PVPANIC', if_true: files('pvpanic.c'))
+softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_scu.c', 'aspeed_sdmc.c', 'aspeed_xdma.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
new file mode 100644
index 0000000..27113ab
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
index 35d6797..e2cb4a5 100644
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
-{
-    PVPanicState *s = ISA_PVPANIC_DEVICE(obj);
-
-    memory_region_init_io(&s->io, OBJECT(s), &pvpanic_ops, s, "pvpanic", 1);
-}
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
+void pvpanic_setup_io(PVPanicState *s, DeviceState *dev, unsigned size)
 {
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = pvpanic_isa_realizefn;
-    device_class_set_props(dc, pvpanic_isa_properties);
-    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    memory_region_init_io(&s->mr, OBJECT(dev), &pvpanic_ops, s, "pvpanic", size);
 }
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
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index ae0c818..abc9dde 100644
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
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6a67c53..b050289 100644
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
1.8.3.1


