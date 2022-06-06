Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A993B53F2C5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:51:19 +0200 (CEST)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMVC-0007Xf-RS
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwV-0001l4-EJ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:33 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwS-0003wa-MX
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:27 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so13936270pfb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9ulAhbcJcFSSfIJLZJh5EzFDSMbnBZs8hCyh/1nrsQ=;
 b=MHYqfVc1ogIn1IKx3w08EmzF+sdjvc+aITcZIIXTCblfoQQYi9Nrjx35/aUhiY/SWJ
 sVsfzSX9ymhkkcMnCV7UUsFKmhBxOOtmLlp2IM36ZQQlj0W/ze0cR/DbhI2Qq+XE8D0f
 fYT1C2j97TG+Hcglx6zKaflRbIlU4cAv+MPFzTDWcpgaMA7SOs1S7wihe2M1ps0NimM+
 UStaid1/foHa2Sh48P1L1FRevmcssSfXZpdrdBOOIWSIym86fYV1A15oDJafGjlB8SHY
 78rWcDa7HcpbxzrNhw2n5gzlsmTc3g1rhMXLchCyZiYntdi8LNJoFxAs1VvUH8idd2pp
 h8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9ulAhbcJcFSSfIJLZJh5EzFDSMbnBZs8hCyh/1nrsQ=;
 b=HOG2x51U270SQAqgrSqKA9L4CdFFwI13QDs8h0xtoKVqfXVO42NwKzklAekz0B30fE
 E6AWfwcmlQckeeKtmLMr4wbzP8+ymbBuW57BA6kLzLTIKppshKi1S2J5HvIuOxk7hXh8
 efs8QAfvflqZv9eafk2yBzLlsfugZGEIboR7/7xHzXdTKcF26fcVGQFysw8fruPaFyOy
 Qf/qbYCCdQwAJu6ab2KLblRZVx+TrG0fE2rzUX/1ZaS5CO7qh0bVHOUfr88qAumNIm78
 /VIkwP8to/G/yU26tq9yO/lH+yUHkpa6pzmsNuZYeZLHbqWEHYT5avACGAnVJQB2wmNq
 x9bg==
X-Gm-Message-State: AOAM533XkfU3cXO3Po3RO42vyY8wgyWN75yJCJBzVkHFQsQ7g29oP+lF
 3rtt8w6T+/vtZ/RFlM26QjeyzajTAJ4cBA==
X-Google-Smtp-Source: ABdhPJzHJ49CqcnBRKPqmLmSn/J/jYGGWTlDWpMZ7YvAEETdjULCiNH28sSVqv2+R2SaPJDfJZPisQ==
X-Received: by 2002:a65:6912:0:b0:3fc:907b:e05 with SMTP id
 s18-20020a656912000000b003fc907b0e05mr22676855pgq.414.1654557323258; 
 Mon, 06 Jun 2022 16:15:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 33/43] hw/intc: Add LoongArch ls7a msi interrupt controller
 support(PCH-MSI)
Date: Mon,  6 Jun 2022 16:14:40 -0700
Message-Id: <20220606231450.448443-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

This patch realize PCH-MSI interrupt controller.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-34-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/loongarch_pch_msi.h | 20 ++++++++
 include/hw/pci-host/ls7a.h          |  3 ++
 hw/intc/loongarch_pch_msi.c         | 73 +++++++++++++++++++++++++++++
 hw/intc/Kconfig                     |  5 ++
 hw/intc/meson.build                 |  1 +
 hw/intc/trace-events                |  3 ++
 hw/loongarch/Kconfig                |  1 +
 7 files changed, 106 insertions(+)
 create mode 100644 include/hw/intc/loongarch_pch_msi.h
 create mode 100644 hw/intc/loongarch_pch_msi.c

diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
new file mode 100644
index 0000000000..f668bfca7a
--- /dev/null
+++ b/include/hw/intc/loongarch_pch_msi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch 7A1000 I/O interrupt controller definitions
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
+OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
+
+/* Msi irq start start from 64 to 255 */
+#define PCH_MSI_IRQ_START   64
+#define PCH_MSI_IRQ_END     255
+#define PCH_MSI_IRQ_NUM     192
+
+struct LoongArchPCHMSI {
+    SysBusDevice parent_obj;
+    qemu_irq pch_msi_irq[PCH_MSI_IRQ_NUM];
+    MemoryRegion msi_mmio;
+};
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index bf80e99ce1..089d3e5438 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -15,6 +15,9 @@
 #include "qemu/range.h"
 #include "qom/object.h"
 
+#define LS7A_PCI_MEM_BASE        0x40000000UL
+#define LS7A_PCI_MEM_SIZE        0x40000000UL
+
 #define LS7A_PCH_REG_BASE       0x10000000UL
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
 #define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
diff --git a/hw/intc/loongarch_pch_msi.c b/hw/intc/loongarch_pch_msi.c
new file mode 100644
index 0000000000..74bcdbdb48
--- /dev/null
+++ b/hw/intc/loongarch_pch_msi.c
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU Loongson 7A1000 msi interrupt controller.
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/intc/loongarch_pch_msi.h"
+#include "hw/intc/loongarch_pch_pic.h"
+#include "hw/pci/msi.h"
+#include "hw/misc/unimp.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+static uint64_t loongarch_msi_mem_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void loongarch_msi_mem_write(void *opaque, hwaddr addr,
+                                    uint64_t val, unsigned size)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
+    int irq_num = val & 0xff;
+
+    trace_loongarch_msi_set_irq(irq_num);
+    assert(irq_num < PCH_MSI_IRQ_NUM);
+    qemu_set_irq(s->pch_msi_irq[irq_num], 1);
+}
+
+static const MemoryRegionOps loongarch_pch_msi_ops = {
+    .read  = loongarch_msi_mem_read,
+    .write = loongarch_msi_mem_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void pch_msi_irq_handler(void *opaque, int irq, int level)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(opaque);
+
+    qemu_set_irq(s->pch_msi_irq[irq], level);
+}
+
+static void loongarch_pch_msi_init(Object *obj)
+{
+    LoongArchPCHMSI *s = LOONGARCH_PCH_MSI(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->msi_mmio, obj, &loongarch_pch_msi_ops,
+                          s, TYPE_LOONGARCH_PCH_MSI, 0x8);
+    sysbus_init_mmio(sbd, &s->msi_mmio);
+    msi_nonbroken = true;
+
+    qdev_init_gpio_out(DEVICE(obj), s->pch_msi_irq, PCH_MSI_IRQ_NUM);
+    qdev_init_gpio_in(DEVICE(obj), pch_msi_irq_handler, PCH_MSI_IRQ_NUM);
+}
+
+static const TypeInfo loongarch_pch_msi_info = {
+    .name          = TYPE_LOONGARCH_PCH_MSI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LoongArchPCHMSI),
+    .instance_init = loongarch_pch_msi_init,
+};
+
+static void loongarch_pch_msi_register_types(void)
+{
+    type_register_static(&loongarch_pch_msi_info);
+}
+
+type_init(loongarch_pch_msi_register_types)
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 362980ca8c..58f550b865 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -94,3 +94,8 @@ config LOONGARCH_IPI
 config LOONGARCH_PCH_PIC
     bool
     select UNIMP
+
+config LOONGARCH_PCH_MSI
+    select MSI_NONBROKEN
+    bool
+    select UNIMP
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 03f13f1c49..1d407c046d 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -65,3 +65,4 @@ specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
+specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 4cdbc01a07..63c9851923 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -300,3 +300,6 @@ loongarch_pch_pic_high_readw(unsigned size, uint64_t addr, uint64_t val) "size:
 loongarch_pch_pic_high_writew(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%" PRIx64
 loongarch_pch_pic_readb(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%" PRIx64
 loongarch_pch_pic_writeb(unsigned size, uint64_t addr, uint64_t val) "size: %u addr: 0x%"PRIx64 "val: 0x%" PRIx64
+
+# loongarch_pch_msi.c
+loongarch_msi_set_irq(int irq_num) "set msi irq %d"
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 2df45f7e8f..d814fc6103 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -4,3 +4,4 @@ config LOONGARCH_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
+    select LOONGARCH_PCH_MSI
-- 
2.34.1


