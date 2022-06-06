Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C453F2C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:47:45 +0200 (CEST)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMRk-0002tu-Nm
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwV-0001kH-9h
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwR-00040J-K6
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:26 -0400
Received: by mail-pf1-x429.google.com with SMTP id g205so13912659pfb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q0iiWIYcd4d+LLgfgSUITI0UHLxRLgTv0x4ZCF0gJD8=;
 b=knpLX0CdovNTzApd1nHgirkqkpiXXXspdIzAX9ausyJSh2+RW5CMqubiKSU9zxwC8Y
 +YJPp81H/PPhqFenmpXptjTDMCSFFRLItJMdcmWllCVOb9+7REL5sVV20cQXadeTignp
 ka/7+4yNarH9Jy/zxp5120ROIKr3vYkqTshegrvYsM4t6uCDBuvrZw65+SW/zbLSrItt
 tjESFWwj39i3pvTZxIPy7GDb9eBMO29OW+lw/CsX5DS4VinIUpveGK1WaTsiKNRIr2u+
 QDbPUYPsJd8N1e8nMvZSNQR12H4P/SSrvk4F7/HppeZU6Ks2O+BnDDhzr9SuLH0N8nvK
 BHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0iiWIYcd4d+LLgfgSUITI0UHLxRLgTv0x4ZCF0gJD8=;
 b=gxpGIC1+LDvN0xiqPzvsi91oYqAFu1gukmGuW/Izhf1KKiJ+KEDh4dhqNnYjUOL+CP
 E1O+eJpWOC3kPs6gdXpIdnCCa/bjRelUnbWpkpLdKXxmlpQOn1tleVmqd7WVwf8Cdltg
 Tlwx7R/bNHVPq5pkO1fxh0J5kC7m4OugU/9MZ/EIIOaXN0UZpIgilXDfbZ9UYaEpvdh/
 tbv1Cw2NUVkxPscDSxBHHk+GmV7EHbpuTmElwvwVoA9Bv29kDoYGQEK0jOQSkDVdDzR2
 UWZPX5Jx3/h1zFuS/5fK6Em9UgSxOeipGEighdG0ydH9J0rAnB1jy2VL88ZUBngITrJG
 7I0g==
X-Gm-Message-State: AOAM5335/1yAsEyT3tf/TrKkEmWRwHWEc66BjBvhNSJeGmeyPFV162GN
 xLNBABBZmwkLYRff3qZvfLhKtbCcIB8UDw==
X-Google-Smtp-Source: ABdhPJww+BmGJUtvw7vkdY4KA0l8WV/EN/4e8YISO/mkNvsR5BkMTeVTDbXQoMQLqhf6PGgywRy+VA==
X-Received: by 2002:a63:1f50:0:b0:3fd:cbe1:ffcf with SMTP id
 q16-20020a631f50000000b003fdcbe1ffcfmr5801044pgm.235.1654557321056; 
 Mon, 06 Jun 2022 16:15:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 31/43] hw/loongarch: Add LoongArch ipi interrupt support(IPI)
Date: Mon,  6 Jun 2022 16:14:38 -0700
Message-Id: <20220606231450.448443-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This patch realize the IPI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-32-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/loongarch_ipi.h |  52 +++++++
 include/hw/loongarch/virt.h     |   2 +
 hw/intc/loongarch_ipi.c         | 242 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   2 +
 hw/intc/Kconfig                 |   3 +
 hw/intc/meson.build             |   1 +
 hw/intc/trace-events            |   4 +
 hw/loongarch/Kconfig            |   1 +
 8 files changed, 307 insertions(+)
 create mode 100644 include/hw/intc/loongarch_ipi.h
 create mode 100644 hw/intc/loongarch_ipi.c

diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
new file mode 100644
index 0000000000..996ed7ea93
--- /dev/null
+++ b/include/hw/intc/loongarch_ipi.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch ipi interrupt header files
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_LOONGARCH_IPI_H
+#define HW_LOONGARCH_IPI_H
+
+#include "hw/sysbus.h"
+
+/* Mainy used by iocsr read and write */
+#define SMP_IPI_MAILBOX      0x1000ULL
+#define CORE_STATUS_OFF       0x0
+#define CORE_EN_OFF           0x4
+#define CORE_SET_OFF          0x8
+#define CORE_CLEAR_OFF        0xc
+#define CORE_BUF_20           0x20
+#define CORE_BUF_28           0x28
+#define CORE_BUF_30           0x30
+#define CORE_BUF_38           0x38
+#define IOCSR_IPI_SEND        0x40
+#define IOCSR_MAIL_SEND       0x48
+#define IOCSR_ANY_SEND        0x158
+
+/* IPI system memory address */
+#define IPI_SYSTEM_MEM        0x1fe01000
+
+#define MAX_IPI_CORE_NUM      4
+#define MAX_IPI_MBX_NUM       4
+
+#define TYPE_LOONGARCH_IPI "loongarch_ipi"
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchIPI, LOONGARCH_IPI)
+
+typedef struct IPICore {
+    uint32_t status;
+    uint32_t en;
+    uint32_t set;
+    uint32_t clear;
+    /* 64bit buf divide into 2 32bit buf */
+    uint32_t buf[MAX_IPI_MBX_NUM * 2];
+    qemu_irq irq;
+} IPICore;
+
+struct LoongArchIPI {
+    SysBusDevice parent_obj;
+    MemoryRegion ipi_iocsr_mem[MAX_IPI_CORE_NUM];
+    MemoryRegion ipi_system_mem[MAX_IPI_CORE_NUM];
+};
+
+#endif
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 4a4bb3f51f..09a816191c 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -11,6 +11,7 @@
 #include "target/loongarch/cpu.h"
 #include "hw/boards.h"
 #include "qemu/queue.h"
+#include "hw/intc/loongarch_ipi.h"
 
 #define LOONGARCH_MAX_VCPUS     4
 
@@ -21,6 +22,7 @@ struct LoongArchMachineState {
     /*< private >*/
     MachineState parent_obj;
 
+    IPICore ipi_core[MAX_IPI_CORE_NUM];
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
new file mode 100644
index 0000000000..66bee93675
--- /dev/null
+++ b/hw/intc/loongarch_ipi.c
@@ -0,0 +1,242 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch ipi interrupt support
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/intc/loongarch_ipi.h"
+#include "hw/irq.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "exec/address-spaces.h"
+#include "hw/loongarch/virt.h"
+#include "migration/vmstate.h"
+#include "target/loongarch/internals.h"
+#include "trace.h"
+
+static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
+{
+    IPICore *s = opaque;
+    uint64_t ret = 0;
+    int index = 0;
+
+    addr &= 0xff;
+    switch (addr) {
+    case CORE_STATUS_OFF:
+        ret = s->status;
+        break;
+    case CORE_EN_OFF:
+        ret = s->en;
+        break;
+    case CORE_SET_OFF:
+        ret = 0;
+        break;
+    case CORE_CLEAR_OFF:
+        ret = 0;
+        break;
+    case CORE_BUF_20 ... CORE_BUF_38 + 4:
+        index = (addr - CORE_BUF_20) >> 2;
+        ret = s->buf[index];
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "invalid read: %x", (uint32_t)addr);
+        break;
+    }
+
+    trace_loongarch_ipi_read(size, (uint64_t)addr, ret);
+    return ret;
+}
+
+static int get_ipi_data(target_ulong val)
+{
+    int i, mask, data;
+
+    data = val >> 32;
+    mask = (val >> 27) & 0xf;
+
+    for (i = 0; i < 4; i++) {
+        if ((mask >> i) & 1) {
+            data &= ~(0xff << (i * 8));
+        }
+    }
+    return data;
+}
+
+static void ipi_send(uint64_t val)
+{
+    int cpuid, data;
+    CPULoongArchState *env;
+
+    cpuid = (val >> 16) & 0x3ff;
+    /* IPI status vector */
+    data = 1 << (val & 0x1f);
+    qemu_mutex_lock_iothread();
+    CPUState *cs = qemu_get_cpu(cpuid);
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    env = &cpu->env;
+    loongarch_cpu_set_irq(cpu, IRQ_IPI, 1);
+    qemu_mutex_unlock_iothread();
+    address_space_stl(&env->address_space_iocsr, 0x1008,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+
+}
+
+static void mail_send(uint64_t val)
+{
+    int cpuid, data;
+    hwaddr addr;
+    CPULoongArchState *env;
+
+    cpuid = (val >> 16) & 0x3ff;
+    addr = 0x1020 + (val & 0x1c);
+    CPUState *cs = qemu_get_cpu(cpuid);
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    env = &cpu->env;
+    data = get_ipi_data(val);
+    address_space_stl(&env->address_space_iocsr, addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static void any_send(uint64_t val)
+{
+    int cpuid, data;
+    hwaddr addr;
+    CPULoongArchState *env;
+
+    cpuid = (val >> 16) & 0x3ff;
+    addr = val & 0xffff;
+    CPUState *cs = qemu_get_cpu(cpuid);
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    env = &cpu->env;
+    data = get_ipi_data(val);
+    address_space_stl(&env->address_space_iocsr, addr,
+                      data, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static void loongarch_ipi_writel(void *opaque, hwaddr addr, uint64_t val,
+                                 unsigned size)
+{
+    IPICore *s = opaque;
+    int index = 0;
+
+    addr &= 0xff;
+    trace_loongarch_ipi_write(size, (uint64_t)addr, val);
+    switch (addr) {
+    case CORE_STATUS_OFF:
+        qemu_log_mask(LOG_GUEST_ERROR, "can not be written");
+        break;
+    case CORE_EN_OFF:
+        s->en = val;
+        break;
+    case CORE_SET_OFF:
+        s->status |= val;
+        if (s->status != 0 && (s->status & s->en) != 0) {
+            qemu_irq_raise(s->irq);
+        }
+        break;
+    case CORE_CLEAR_OFF:
+        s->status &= ~val;
+        if (s->status == 0 && s->en != 0) {
+            qemu_irq_lower(s->irq);
+        }
+        break;
+    case CORE_BUF_20 ... CORE_BUF_38 + 4:
+        index = (addr - CORE_BUF_20) >> 2;
+        s->buf[index] = val;
+        break;
+    case IOCSR_IPI_SEND:
+        ipi_send(val);
+        break;
+    case IOCSR_MAIL_SEND:
+        mail_send(val);
+        break;
+    case IOCSR_ANY_SEND:
+        any_send(val);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "invalid write: %x", (uint32_t)addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps loongarch_ipi_ops = {
+    .read = loongarch_ipi_readl,
+    .write = loongarch_ipi_writel,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void loongarch_ipi_init(Object *obj)
+{
+    int cpu;
+    LoongArchMachineState *lams;
+    LoongArchIPI *s = LOONGARCH_IPI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    Object *machine = qdev_get_machine();
+    ObjectClass *mc = object_get_class(machine);
+    /* 'lams' should be initialized */
+    if (!strcmp(MACHINE_CLASS(mc)->name, "none")) {
+        return;
+    }
+    lams = LOONGARCH_MACHINE(machine);
+    for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
+        memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
+                            &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x100);
+        sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
+        qdev_init_gpio_out(DEVICE(obj), &lams->ipi_core[cpu].irq, 1);
+    }
+}
+
+static const VMStateDescription vmstate_ipi_core = {
+    .name = "ipi-single",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(status, IPICore),
+        VMSTATE_UINT32(en, IPICore),
+        VMSTATE_UINT32(set, IPICore),
+        VMSTATE_UINT32(clear, IPICore),
+        VMSTATE_UINT32_ARRAY(buf, IPICore, MAX_IPI_MBX_NUM * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_loongarch_ipi = {
+    .name = TYPE_LOONGARCH_IPI,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(ipi_core, LoongArchMachineState,
+                             MAX_IPI_CORE_NUM, 0,
+                             vmstate_ipi_core, IPICore),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void loongarch_ipi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_loongarch_ipi;
+}
+
+static const TypeInfo loongarch_ipi_info = {
+    .name          = TYPE_LOONGARCH_IPI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LoongArchIPI),
+    .instance_init = loongarch_ipi_init,
+    .class_init    = loongarch_ipi_class_init,
+};
+
+static void loongarch_ipi_register_types(void)
+{
+    type_register_static(&loongarch_ipi_info);
+}
+
+type_init(loongarch_ipi_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 0c54c03cef..271eb89e2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1133,6 +1133,8 @@ F: configs/targets/loongarch64-softmmu.mak
 F: configs/devices/loongarch64-softmmu/default.mak
 F: hw/loongarch/
 F: include/hw/loongarch/virt.h
+F: include/hw/intc/loongarch_*.h
+F: hw/intc/loongarch_*.c
 
 M68K Machines
 -------------
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index eded1b557e..1122c33cec 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -87,3 +87,6 @@ config M68K_IRQC
 
 config NIOS2_VIC
     bool
+
+config LOONGARCH_IPI
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 8b35139f82..57af7fb33f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -63,3 +63,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 5271590304..36774662af 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -287,3 +287,7 @@ sh_intc_register(const char *s, int id, unsigned short v, int c, int m) "%s %u -
 sh_intc_read(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " -> 0x%lx"
 sh_intc_write(unsigned size, uint64_t offset, unsigned long val) "size %u 0x%" PRIx64 " <- 0x%lx"
 sh_intc_set(int id, int enable) "setting interrupt group %d to %d"
+
+# loongarch_ipi.c
+loongarch_ipi_read(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
+loongarch_ipi_write(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%"PRIx64
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 13e8501897..f0dad3329a 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,3 +2,4 @@ config LOONGARCH_VIRT
     bool
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
+    select LOONGARCH_IPI
-- 
2.34.1


