Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA08215E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 18:10:53 +0200 (CEST)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hufZU-000599-8y
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 12:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58505)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPi-0000d9-6T
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPg-0002wd-87
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:00:46 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37449)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPg-0002w9-0c; Mon, 05 Aug 2019 12:00:44 -0400
Received: by mail-pg1-x543.google.com with SMTP id d1so7152278pgp.4;
 Mon, 05 Aug 2019 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=LXiUaj0rKNY+QE8v0jzf1Ot10uVD5oH+gvpbKkbiZso=;
 b=bwiLiozb+mQYv1KY7A/EuyBveZFWNOvUEwl3EmAEYFylQhdZ8akVYdP4G4Bku3XXT9
 MN8NiMb9muXAow96cAsgAuzWgBOzrl+iHuf+lEK1n4oJ/I5hJVkjFTNIViDIKxKM56Kd
 W+naZLaqTFF0wkRYMKiqThJ1sTNbMCjURIOr/+PTQf0GGr+f8NlZywG3ROxC5FxhJEqa
 bIV9MHegGS8kxOOjkxruIi/O2pZ07t1Z48oMikAjxq/QdS4LuPhREm+PjlWUn0abzeTI
 /KtLYfUtmcaJR5YYllcQ8CrbxixWwjxyWnPDeFJ1k4pRWS7NMsj4CKPXZasH3adrNDjf
 XfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=LXiUaj0rKNY+QE8v0jzf1Ot10uVD5oH+gvpbKkbiZso=;
 b=orzsQLualGYsp3WGd2Ye/+/XsEmxw9w3WkZGrcYndf/yqWX6OCk29+MvxQ0KmSdL6t
 ktzDMGXy4zBxu5x3cZjqsIAl9Bu+vYXj9+cAH4QoSguA9fa6cAbvDETuzEVghWMD5ZxE
 7MuoDWhzz2wgdVkFIB0tMrXxNRb0e80/Pe1LVgiIrrUg9T50Ed9A63nRkVgfqOhgWdTR
 EzrrNSIFAdMXw8kn42m8RjeDuKBPONxc06OhDHVQGVOO1NfZ2Xrm+Ho0f8gOwY6nfCtv
 tRHUdqFp3PxAgNJi0eGJ1t0Le9Mfvl5WPiYcs96z5v3tkzNSkxvfc7hYy1rB0khd+lLX
 lZWA==
X-Gm-Message-State: APjAAAVTau1J/cPkO+jtYb6DCYBtBEzOzcqVZLjPkCxgkba8GmoViHHi
 df57TyO5RtxtGIIJu6FfFUc=
X-Google-Smtp-Source: APXvYqz+Snvo3aVCyaLAAi69xeyRkqcPg9Y1p+40nyyCYN7cB+BxH2M6GyYfwDYFjwHbzr5opST3Kg==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr139994810pgv.323.1565020843084; 
 Mon, 05 Aug 2019 09:00:43 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:09 -0700
Message-Id: <1565020823-24223-15-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 14/28] riscv: sifive: Implement PRCI model for
 FU540
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

This adds a simple PRCI model for FU540 (sifive_u). It has different
register layout from the existing PRCI model for FE310 (sifive_e).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/Makefile.objs           |   1 +
 hw/riscv/sifive_u_prci.c         | 163 +++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u_prci.h |  90 +++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 hw/riscv/sifive_u_prci.c
 create mode 100644 include/hw/riscv/sifive_u_prci.h

diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
index c859697..b95bbd5 100644
--- a/hw/riscv/Makefile.objs
+++ b/hw/riscv/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_SIFIVE) += sifive_gpio.o
 obj-$(CONFIG_SIFIVE) += sifive_plic.o
 obj-$(CONFIG_SIFIVE) += sifive_test.o
 obj-$(CONFIG_SIFIVE_U) += sifive_u.o
+obj-$(CONFIG_SIFIVE_U) += sifive_u_prci.o
 obj-$(CONFIG_SIFIVE) += sifive_uart.o
 obj-$(CONFIG_SPIKE) += spike.o
 obj-$(CONFIG_RISCV_VIRT) += virt.o
diff --git a/hw/riscv/sifive_u_prci.c b/hw/riscv/sifive_u_prci.c
new file mode 100644
index 0000000..35e5962
--- /dev/null
+++ b/hw/riscv/sifive_u_prci.c
@@ -0,0 +1,163 @@
+/*
+ * QEMU SiFive U PRCI (Power, Reset, Clock, Interrupt)
+ *
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * Simple model of the PRCI to emulate register reads made by the SDK BSP
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qemu/module.h"
+#include "target/riscv/cpu.h"
+#include "hw/riscv/sifive_u_prci.h"
+
+static uint64_t sifive_prci_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SiFivePRCIState *s = opaque;
+
+    switch (addr) {
+    case SIFIVE_PRCI_HFXOSCCFG:
+        return s->hfxosccfg;
+    case SIFIVE_PRCI_COREPLLCFG0:
+        return s->corepllcfg0;
+    case SIFIVE_PRCI_DDRPLLCFG0:
+        return s->ddrpllcfg0;
+    case SIFIVE_PRCI_DDRPLLCFG1:
+        return s->ddrpllcfg1;
+    case SIFIVE_PRCI_GEMGXLPLLCFG0:
+        return s->gemgxlpllcfg0;
+    case SIFIVE_PRCI_GEMGXLPLLCFG1:
+        return s->gemgxlpllcfg1;
+    case SIFIVE_PRCI_CORECLKSEL:
+        return s->coreclksel;
+    case SIFIVE_PRCI_DEVICESRESET:
+        return s->devicesreset;
+    case SIFIVE_PRCI_CLKMUXSTATUS:
+        return s->clkmuxstatus;
+    }
+
+    hw_error("%s: read: addr=0x%x\n", __func__, (int)addr);
+    return 0;
+}
+
+static void sifive_prci_write(void *opaque, hwaddr addr,
+                              uint64_t val64, unsigned int size)
+{
+    SiFivePRCIState *s = opaque;
+
+    switch (addr) {
+    case SIFIVE_PRCI_HFXOSCCFG:
+        s->hfxosccfg = (uint32_t) val64;
+        /* OSC stays ready */
+        s->hfxosccfg |= SIFIVE_PRCI_HFXOSCCFG_RDY;
+        break;
+    case SIFIVE_PRCI_COREPLLCFG0:
+        s->corepllcfg0 = (uint32_t) val64;
+        /* internal feedback */
+        s->corepllcfg0 |= SIFIVE_PRCI_PLLCFG0_FSE;
+        /* PLL stays locked */
+        s->corepllcfg0 |= SIFIVE_PRCI_PLLCFG0_LOCK;
+        break;
+    case SIFIVE_PRCI_DDRPLLCFG0:
+        s->ddrpllcfg0 = (uint32_t) val64;
+        /* internal feedback */
+        s->ddrpllcfg0 |= SIFIVE_PRCI_PLLCFG0_FSE;
+        /* PLL stays locked */
+        s->ddrpllcfg0 |= SIFIVE_PRCI_PLLCFG0_LOCK;
+        break;
+    case SIFIVE_PRCI_DDRPLLCFG1:
+        s->ddrpllcfg1 = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_GEMGXLPLLCFG0:
+        s->gemgxlpllcfg0 = (uint32_t) val64;
+         /* internal feedback */
+        s->gemgxlpllcfg0 |= SIFIVE_PRCI_PLLCFG0_FSE;
+       /* PLL stays locked */
+        s->gemgxlpllcfg0 |= SIFIVE_PRCI_PLLCFG0_LOCK;
+        break;
+    case SIFIVE_PRCI_GEMGXLPLLCFG1:
+        s->gemgxlpllcfg1 = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_CORECLKSEL:
+        s->coreclksel = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_DEVICESRESET:
+        s->devicesreset = (uint32_t) val64;
+        break;
+    case SIFIVE_PRCI_CLKMUXSTATUS:
+        s->clkmuxstatus = (uint32_t) val64;
+        break;
+    default:
+        hw_error("%s: bad write: addr=0x%x v=0x%x\n",
+                 __func__, (int)addr, (int)val64);
+    }
+}
+
+static const MemoryRegionOps sifive_prci_ops = {
+    .read = sifive_prci_read,
+    .write = sifive_prci_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void sifive_prci_init(Object *obj)
+{
+    SiFivePRCIState *s = SIFIVE_U_PRCI(obj);
+
+    memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
+                          TYPE_SIFIVE_U_PRCI, SIFIVE_U_PRCI_REG_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    /* Initialize register to power-on-reset values */
+    s->hfxosccfg = (SIFIVE_PRCI_HFXOSCCFG_RDY | SIFIVE_PRCI_HFXOSCCFG_EN);
+    s->corepllcfg0 = (SIFIVE_PRCI_PLLCFG0_DIVR | SIFIVE_PRCI_PLLCFG0_DIVF |
+                      SIFIVE_PRCI_PLLCFG0_DIVQ | SIFIVE_PRCI_PLLCFG0_FSE |
+                      SIFIVE_PRCI_PLLCFG0_LOCK);
+    s->ddrpllcfg0 = (SIFIVE_PRCI_PLLCFG0_DIVR | SIFIVE_PRCI_PLLCFG0_DIVF |
+                     SIFIVE_PRCI_PLLCFG0_DIVQ | SIFIVE_PRCI_PLLCFG0_FSE |
+                     SIFIVE_PRCI_PLLCFG0_LOCK);
+    s->gemgxlpllcfg0 = (SIFIVE_PRCI_PLLCFG0_DIVR | SIFIVE_PRCI_PLLCFG0_DIVF |
+                        SIFIVE_PRCI_PLLCFG0_DIVQ | SIFIVE_PRCI_PLLCFG0_FSE |
+                        SIFIVE_PRCI_PLLCFG0_LOCK);
+    s->coreclksel = SIFIVE_PRCI_CORECLKSEL_HFCLK;
+}
+
+static const TypeInfo sifive_prci_info = {
+    .name          = TYPE_SIFIVE_U_PRCI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFivePRCIState),
+    .instance_init = sifive_prci_init,
+};
+
+static void sifive_prci_register_types(void)
+{
+    type_register_static(&sifive_prci_info);
+}
+
+type_init(sifive_prci_register_types)
+
+
+/* Create PRCI device */
+DeviceState *sifive_u_prci_create(hwaddr addr)
+{
+    DeviceState *dev = qdev_create(NULL, TYPE_SIFIVE_U_PRCI);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+    return dev;
+}
diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
new file mode 100644
index 0000000..f3a4656
--- /dev/null
+++ b/include/hw/riscv/sifive_u_prci.h
@@ -0,0 +1,90 @@
+/*
+ * QEMU SiFive U PRCI (Power, Reset, Clock, Interrupt) interface
+ *
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_SIFIVE_U_PRCI_H
+#define HW_SIFIVE_U_PRCI_H
+
+enum {
+    SIFIVE_PRCI_HFXOSCCFG       = 0x00,
+    SIFIVE_PRCI_COREPLLCFG0     = 0x04,
+    SIFIVE_PRCI_DDRPLLCFG0      = 0x0C,
+    SIFIVE_PRCI_DDRPLLCFG1      = 0x10,
+    SIFIVE_PRCI_GEMGXLPLLCFG0   = 0x1C,
+    SIFIVE_PRCI_GEMGXLPLLCFG1   = 0x20,
+    SIFIVE_PRCI_CORECLKSEL      = 0x24,
+    SIFIVE_PRCI_DEVICESRESET    = 0x28,
+    SIFIVE_PRCI_CLKMUXSTATUS    = 0x2C
+};
+
+/*
+ * Current FU540-C000 manual says ready bit is at bit 29, but
+ * freedom-u540-c000-bootloader codes (ux00prci.h) says it is at bit 31.
+ * We have to trust the actual codes that worked.
+ *
+ * see https://github.com/sifive/freedom-u540-c000-bootloader
+ */
+enum {
+    SIFIVE_PRCI_HFXOSCCFG_EN    = (1 << 30),
+    SIFIVE_PRCI_HFXOSCCFG_RDY   = (1 << 31),
+};
+
+/* xxxPLLCFG0 register bits */
+enum {
+    SIFIVE_PRCI_PLLCFG0_DIVR    = (1 << 0),
+    SIFIVE_PRCI_PLLCFG0_DIVF    = (31 << 6),
+    SIFIVE_PRCI_PLLCFG0_DIVQ    = (3 << 15),
+    SIFIVE_PRCI_PLLCFG0_FSE     = (1 << 25),
+    SIFIVE_PRCI_PLLCFG0_LOCK    = (1 << 31)
+};
+
+/* xxxPLLCFG1 register bits */
+enum {
+    SIFIVE_PRCI_PLLCFG1_CKE     = (1 << 24)
+};
+
+enum {
+    SIFIVE_PRCI_CORECLKSEL_HFCLK = (1 << 0)
+};
+
+#define SIFIVE_U_PRCI_REG_SIZE  0x1000
+
+#define TYPE_SIFIVE_U_PRCI      "riscv.sifive.u.prci"
+
+#define SIFIVE_U_PRCI(obj) \
+    OBJECT_CHECK(SiFivePRCIState, (obj), TYPE_SIFIVE_U_PRCI)
+
+typedef struct SiFivePRCIState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t hfxosccfg;
+    uint32_t corepllcfg0;
+    uint32_t ddrpllcfg0;
+    uint32_t ddrpllcfg1;
+    uint32_t gemgxlpllcfg0;
+    uint32_t gemgxlpllcfg1;
+    uint32_t coreclksel;
+    uint32_t devicesreset;
+    uint32_t clkmuxstatus;
+} SiFivePRCIState;
+
+DeviceState *sifive_u_prci_create(hwaddr addr);
+
+#endif /* HW_SIFIVE_U_PRCI_H */
-- 
2.7.4


