Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5737631FBA4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:06:22 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7ML-00083p-9h
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73c-0002Sq-BH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73F-0003XR-UT
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r21so8867241wrr.9
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ly8Hfh+bGC0RsxpfK2YgK2rysdFpN5/sB98Zuud8DvM=;
 b=EBOBvwNYl9RDoN0eLLZIQwfwff01g9M+Fl2I06FHAXg/caIfsw9oLu9liS6oVAj4A6
 Jl5IVAnd9SGf+/PhmWxzYlr5JRYGLnNkycwumuSSUsUiLAvffq2cyeZ2sg3AmWgyBABi
 Mx5qnvKMDpUqlJlirYCal8QqRfYsifUNe+tRe4hb2qtohPHfSf9OPJBhIvPsKxX2cUaL
 m6W3iq3EboYBFQHg82865XqM+eh4kEerwZh9iDskElel9xFrws4gGYxz1NXZIbffKnr7
 6EWvdq0jkEYMfxxOqQKfvPSuDPIyq5omDUy8Es6vsKB3V59SbUev4wGQa4SCZ6rLGL9v
 Sdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ly8Hfh+bGC0RsxpfK2YgK2rysdFpN5/sB98Zuud8DvM=;
 b=LI3SG1vrqCBY1JghgXQIOhZRF/djSrbNvBfnaWd6xPy74AorN/SPU4pFaZP+0FdiuS
 hGl4RRaWRE8trciVKIbpfG18xVhnsHkx+HXdv6vbjQd70TOj14jgsCbt8d9up0AtTw5k
 TQt+grCqLeMszcpoXm6GVTDgnXjJ0dxCrO4Md/A9bHu14rTahqiR4TzatpUhIIBQZmwr
 RlgwRIjREJgcn7H0vJVUdZ8FmrD7DEMsnVxhn6S55MbaLz8qg/BVU3O3lwim2+/yhjvG
 tiR4OMMF52yfU/pW+c754prE2Zn24HKsaD5rHW2/NlqJeT63mrrWL5BUAH5rdQYf19Xy
 0WnA==
X-Gm-Message-State: AOAM531RXrWjUV+nzHcutACrLgfPhnMimFfQS7IMJhi1u9rk5/wRyXGZ
 qFaf3Ph7v6vXJggDSP4OEakqljIAFBmZYg==
X-Google-Smtp-Source: ABdhPJy5x4UPKbgTJg9UTk/oiOn5Eq4h2eaK54yjwbiZJbOdP3cm9txAjc6rM5FSVsI3iTeO1XbbJg==
X-Received: by 2002:a5d:698d:: with SMTP id g13mr9674333wru.30.1613745995560; 
 Fri, 19 Feb 2021 06:46:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/44] hw/misc/sse-cpu-pwrctrl: Implement SSE-300
 CPU<N>_PWRCTRL register block
Date: Fri, 19 Feb 2021 14:45:53 +0000
Message-Id: <20210219144617.4782-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The SSE-300 has a new register block CPU<N>_PWRCTRL.  There is one
instance of this per CPU in the system (so just one for the SSE-300),
and as well as the usual CIDR/PIDR ID registers it has just one
register, CPUPWRCFG.  This register allows the guest to configure
behaviour of the system in power-down and deep-sleep states.  Since
QEMU does not model those, we make the register a dummy
reads-as-written implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/armsse-cpu-pwrctrl.h |  40 +++++++
 hw/misc/armsse-cpu-pwrctrl.c         | 149 +++++++++++++++++++++++++++
 MAINTAINERS                          |   2 +
 hw/arm/Kconfig                       |   1 +
 hw/misc/Kconfig                      |   3 +
 hw/misc/meson.build                  |   1 +
 hw/misc/trace-events                 |   4 +
 7 files changed, 200 insertions(+)
 create mode 100644 include/hw/misc/armsse-cpu-pwrctrl.h
 create mode 100644 hw/misc/armsse-cpu-pwrctrl.c

diff --git a/include/hw/misc/armsse-cpu-pwrctrl.h b/include/hw/misc/armsse-cpu-pwrctrl.h
new file mode 100644
index 00000000000..51d45ede7db
--- /dev/null
+++ b/include/hw/misc/armsse-cpu-pwrctrl.h
@@ -0,0 +1,40 @@
+/*
+ * ARM SSE CPU PWRCTRL register block
+ *
+ * Copyright (c) 2021 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "CPU<N>_PWRCTRL block" which is part of the
+ * Arm Corstone SSE-300 Example Subsystem and documented in
+ * https://developer.arm.com/documentation/101773/0000
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the register bank
+ */
+
+#ifndef HW_MISC_ARMSSE_CPU_PWRCTRL_H
+#define HW_MISC_ARMSSE_CPU_PWRCTRL_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_ARMSSE_CPU_PWRCTRL "armsse-cpu-pwrctrl"
+OBJECT_DECLARE_SIMPLE_TYPE(ARMSSECPUPwrCtrl, ARMSSE_CPU_PWRCTRL)
+
+struct ARMSSECPUPwrCtrl {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t cpupwrcfg;
+};
+
+#endif
diff --git a/hw/misc/armsse-cpu-pwrctrl.c b/hw/misc/armsse-cpu-pwrctrl.c
new file mode 100644
index 00000000000..42fc38879f2
--- /dev/null
+++ b/hw/misc/armsse-cpu-pwrctrl.c
@@ -0,0 +1,149 @@
+/*
+ * Arm SSE CPU PWRCTRL register block
+ *
+ * Copyright (c) 2021 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "CPU<N>_PWRCTRL block" which is part of the
+ * Arm Corstone SSE-300 Example Subsystem and documented in
+ * https://developer.arm.com/documentation/101773/0000
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/sysbus.h"
+#include "hw/registerfields.h"
+#include "hw/misc/armsse-cpu-pwrctrl.h"
+
+REG32(CPUPWRCFG, 0x0)
+REG32(PID4, 0xfd0)
+REG32(PID5, 0xfd4)
+REG32(PID6, 0xfd8)
+REG32(PID7, 0xfdc)
+REG32(PID0, 0xfe0)
+REG32(PID1, 0xfe4)
+REG32(PID2, 0xfe8)
+REG32(PID3, 0xfec)
+REG32(CID0, 0xff0)
+REG32(CID1, 0xff4)
+REG32(CID2, 0xff8)
+REG32(CID3, 0xffc)
+
+/* PID/CID values */
+static const int cpu_pwrctrl_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0x5a, 0xb8, 0x0b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
+static uint64_t pwrctrl_read(void *opaque, hwaddr offset, unsigned size)
+{
+    ARMSSECPUPwrCtrl *s = ARMSSE_CPU_PWRCTRL(opaque);
+    uint64_t r;
+
+    switch (offset) {
+    case A_CPUPWRCFG:
+        r = s->cpupwrcfg;
+        break;
+    case A_PID4 ... A_CID3:
+        r = cpu_pwrctrl_id[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE CPU_PWRCTRL read: bad offset %x\n", (int)offset);
+        r = 0;
+        break;
+    }
+    trace_armsse_cpu_pwrctrl_read(offset, r, size);
+    return r;
+}
+
+static void pwrctrl_write(void *opaque, hwaddr offset,
+                          uint64_t value, unsigned size)
+{
+    ARMSSECPUPwrCtrl *s = ARMSSE_CPU_PWRCTRL(opaque);
+
+    trace_armsse_cpu_pwrctrl_write(offset, value, size);
+
+    switch (offset) {
+    case A_CPUPWRCFG:
+        qemu_log_mask(LOG_UNIMP,
+                      "SSE CPU_PWRCTRL: CPUPWRCFG unimplemented\n");
+        s->cpupwrcfg = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE CPU_PWRCTRL write: bad offset 0x%x\n", (int)offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps pwrctrl_ops = {
+    .read = pwrctrl_read,
+    .write = pwrctrl_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static void pwrctrl_reset(DeviceState *dev)
+{
+    ARMSSECPUPwrCtrl *s = ARMSSE_CPU_PWRCTRL(dev);
+
+    s->cpupwrcfg = 0;
+}
+
+static const VMStateDescription pwrctrl_vmstate = {
+    .name = "armsse-cpu-pwrctrl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(cpupwrcfg, ARMSSECPUPwrCtrl),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void pwrctrl_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    ARMSSECPUPwrCtrl *s = ARMSSE_CPU_PWRCTRL(obj);
+
+    memory_region_init_io(&s->iomem, obj, &pwrctrl_ops,
+                          s, "armsse-cpu-pwrctrl", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void pwrctrl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = pwrctrl_reset;
+    dc->vmsd = &pwrctrl_vmstate;
+}
+
+static const TypeInfo pwrctrl_info = {
+    .name = TYPE_ARMSSE_CPU_PWRCTRL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ARMSSECPUPwrCtrl),
+    .instance_init = pwrctrl_init,
+    .class_init = pwrctrl_class_init,
+};
+
+static void pwrctrl_register_types(void)
+{
+    type_register_static(&pwrctrl_info);
+}
+
+type_init(pwrctrl_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index df0eddc7170..c2103b40b9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -738,6 +738,8 @@ F: hw/misc/iotkit-sysctl.c
 F: include/hw/misc/iotkit-sysctl.h
 F: hw/misc/iotkit-sysinfo.c
 F: include/hw/misc/iotkit-sysinfo.h
+F: hw/misc/armsse-cpu-pwrctrl.c
+F: include/hw/misc/armsse-cpu-pwrctrl.h
 F: hw/misc/armsse-cpuid.c
 F: include/hw/misc/armsse-cpuid.h
 F: hw/misc/armsse-mhu.c
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0492b212840..be9adf18594 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -504,6 +504,7 @@ config ARM11MPCORE
 config ARMSSE
     bool
     select ARM_V7M
+    select ARMSSE_CPU_PWRCTRL
     select ARMSSE_CPUID
     select ARMSSE_MHU
     select CMSDK_APB_TIMER
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 16b96e4dafb..5426b9b1a1a 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -8,6 +8,9 @@ config ARMSSE_CPUID
 config ARMSSE_MHU
     bool
 
+config ARMSSE_CPU_PWRCTRL
+    bool
+
 config MAX111X
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 629283957fc..e30a555db5c 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -96,6 +96,7 @@ softmmu_ss.add(when: 'CONFIG_TZ_MSC', if_true: files('tz-msc.c'))
 softmmu_ss.add(when: 'CONFIG_TZ_PPC', if_true: files('tz-ppc.c'))
 softmmu_ss.add(when: 'CONFIG_IOTKIT_SECCTL', if_true: files('iotkit-secctl.c'))
 softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c'))
+softmmu_ss.add(when: 'CONFIG_ARMSSE_CPU_PWRCTRL', if_true: files('armsse-cpu-pwrctrl.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index d626b9d7a7c..4b15db8ca48 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -186,6 +186,10 @@ iotkit_sysctl_read(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl
 iotkit_sysctl_write(uint64_t offset, uint64_t data, unsigned size) "IoTKit SysCtl write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 iotkit_sysctl_reset(void) "IoTKit SysCtl: reset"
 
+# armsse-cpu-pwrctrl.c
+armsse_cpu_pwrctrl_read(uint64_t offset, uint64_t data, unsigned size) "SSE-300 CPU_PWRCTRL read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+armsse_cpu_pwrctrl_write(uint64_t offset, uint64_t data, unsigned size) "SSE-300 CPU_PWRCTRL write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+
 # armsse-cpuid.c
 armsse_cpuid_read(uint64_t offset, uint64_t data, unsigned size) "SSE-200 CPU_IDENTITY read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 armsse_cpuid_write(uint64_t offset, uint64_t data, unsigned size) "SSE-200 CPU_IDENTITY write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.20.1


