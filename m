Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189525853F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 03:45:01 +0200 (CEST)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCvM4-00027E-I7
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 21:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvHx-0004Ru-IY; Mon, 31 Aug 2020 21:40:45 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvHv-0005XV-9l; Mon, 31 Aug 2020 21:40:45 -0400
Received: by mail-pj1-x1044.google.com with SMTP id o16so877014pjr.2;
 Mon, 31 Aug 2020 18:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WT5WFwffkEHlQ4n2tCtBx5gPoLvgfcj7uh9M96XbE44=;
 b=CmTC4U6Pi/awR25Nq779Xy01Px+P0BinbQkoJdhSYnvNeKJwvXoc8VlITwixLuJglu
 XI/oF9sAqMl8vasFOJ+yWzhC/X+hc8Uuc6ct5eui3Sr4kpXm/T+TELN9MN7P5lNh6Irl
 9cA+PgIlwTLvp1XrohxtlRsk/i4WYSPwY3s2DKloOPx3TQedqpyRKtUCG+aK7GU+J2o/
 xBohK2q10Z3vxCoe9QybnnPMiMv3IC5ual5ns8DfjggkA8WrcdabscmVGAeviGn5wviv
 uJuBuezEwY04e6/QedmBF/s6KKNkVDQJqU878SWGkbUDI+GCELhwbLn9M8BqekiyVxKr
 9jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WT5WFwffkEHlQ4n2tCtBx5gPoLvgfcj7uh9M96XbE44=;
 b=OtaIIrScuJQcQBlUlryTyaKJDgKQPeHn3Ea7ZQfPjqGJmPLYHy9Xcc6ngHmRzM3ANw
 FWbPsN1nGxRB8NETsuUFA8eyIsIc6Je8Vso83CQRHY4BW6u0V3APlq5S/tw6nk6CbcEy
 IxHeAApZwNQADliU/SP2Vhyqs9Ndee3BmUPaWxvuvZ2mG3wfSMYytDz2AxvIeGk7wFrj
 E3YEbezm+9e6AKrmovIG8AlEEY7ffjlPuUVeO4oiK3iGbuwfScD4yJOw74KPRYW4vAZl
 BlMfpUOowyl2dfZu9FDRV7WFaYcPDRbJdfPpZstQ9Bt0mvaSCm/bnvbXvqXyxMAR1MGk
 OMsQ==
X-Gm-Message-State: AOAM530JvWGoVOJMQYurVW49YOzMwjBL58qcok7FsOe5urbO5TpUN5PL
 fAedjP0JFva8SfgiHw/f1BI=
X-Google-Smtp-Source: ABdhPJxYxFjouOZTQS9mryBkMN6v0fMJcVG4r2yPGUIhxruI4d02+75q9CuUPNkeMoEeHGDUTlZJXQ==
X-Received: by 2002:a17:90a:ab02:: with SMTP id
 m2mr2037161pjq.42.1598924441432; 
 Mon, 31 Aug 2020 18:40:41 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id l13sm8887520pgq.33.2020.08.31.18.40.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 18:40:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 05/16] hw/char: Add Microchip PolarFire SoC MMUART emulation
Date: Tue,  1 Sep 2020 09:39:00 +0800
Message-Id: <1598924352-89526-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Microchip PolarFire SoC MMUART is ns16550 compatible, with some
additional registers. Create a simple MMUART model built on top
of the existing ns16550 model.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- change to update hw/char/meson.build
- add impl.min_access_size and impl.max_access_size as part of
  MemoryRegionOps and remove the allignment check

 include/hw/char/mchp_pfsoc_mmuart.h | 61 ++++++++++++++++++++++++++
 hw/char/mchp_pfsoc_mmuart.c         | 86 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                         |  2 +
 hw/char/Kconfig                     |  3 ++
 hw/char/meson.build                 |  1 +
 5 files changed, 153 insertions(+)
 create mode 100644 include/hw/char/mchp_pfsoc_mmuart.h
 create mode 100644 hw/char/mchp_pfsoc_mmuart.c

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
new file mode 100644
index 0000000..f619902
--- /dev/null
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -0,0 +1,61 @@
+/*
+ * Microchip PolarFire SoC MMUART emulation
+ *
+ * Copyright (c) 2020 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_MCHP_PFSOC_MMUART_H
+#define HW_MCHP_PFSOC_MMUART_H
+
+#include "hw/char/serial.h"
+
+#define MCHP_PFSOC_MMUART_REG_SIZE  52
+
+typedef struct MchpPfSoCMMUartState {
+    MemoryRegion iomem;
+    hwaddr base;
+    qemu_irq irq;
+
+    SerialMM *serial;
+
+    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
+} MchpPfSoCMMUartState;
+
+/**
+ * mchp_pfsoc_mmuart_create - Create a Microchip PolarFire SoC MMUART
+ *
+ * This is a helper routine for board to create a MMUART device that is
+ * compatible with Microchip PolarFire SoC.
+ *
+ * @sysmem: system memory region to map
+ * @base: base address of the MMUART registers
+ * @irq: IRQ number of the MMUART device
+ * @chr: character device to associate to
+ *
+ * @return: a pointer to the device specific control structure
+ */
+MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
+    hwaddr base, qemu_irq irq, Chardev *chr);
+
+#endif /* HW_MCHP_PFSOC_MMUART_H */
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
new file mode 100644
index 0000000..8a002b0
--- /dev/null
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -0,0 +1,86 @@
+/*
+ * Microchip PolarFire SoC MMUART emulation
+ *
+ * Copyright (c) 2020 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "chardev/char.h"
+#include "exec/address-spaces.h"
+#include "hw/char/mchp_pfsoc_mmuart.h"
+
+static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
+{
+    MchpPfSoCMMUartState *s = opaque;
+
+    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    return s->reg[addr / sizeof(uint32_t)];
+}
+
+static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
+                                    uint64_t value, unsigned size)
+{
+    MchpPfSoCMMUartState *s = opaque;
+    uint32_t val32 = (uint32_t)value;
+
+    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%" HWADDR_PRIx
+                      " v=0x%x\n", __func__, addr, val32);
+        return;
+    }
+
+    s->reg[addr / sizeof(uint32_t)] = val32;
+}
+
+static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
+    .read = mchp_pfsoc_mmuart_read,
+    .write = mchp_pfsoc_mmuart_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
+    hwaddr base, qemu_irq irq, Chardev *chr)
+{
+    MchpPfSoCMMUartState *s;
+
+    s = g_new0(MchpPfSoCMMUartState, 1);
+
+    memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
+                          "mchp.pfsoc.mmuart", 0x1000);
+
+    s->base = base;
+    s->irq = irq;
+
+    s->serial = serial_mm_init(sysmem, base, 2, irq, 399193, chr,
+                               DEVICE_LITTLE_ENDIAN);
+
+    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
+
+    return s;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 5359b39..4002d51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1320,7 +1320,9 @@ M: Bin Meng <bin.meng@windriver.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: hw/riscv/microchip_pfsoc.c
+F: hw/char/mchp_pfsoc_mmuart.c
 F: include/hw/riscv/microchip_pfsoc.h
+F: include/hw/char/mchp_pfsoc_mmuart.h
 
 RX Machines
 -----------
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index b7e0e4d..1d64555 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -52,3 +52,6 @@ config RENESAS_SCI
 
 config AVR_USART
     bool
+
+config MCHP_PFSOC_MMUART
+    bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index e888215..ae27932 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
 softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
+softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
-- 
2.7.4


