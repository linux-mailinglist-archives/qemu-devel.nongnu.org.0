Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6CA9EF06
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 17:34:45 +0200 (CEST)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2dUZ-0004z1-Vv
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 11:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwZ-0003c5-Ms
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwT-0003sX-Qg
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 10:59:35 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45050)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cwS-0003lg-Dl; Tue, 27 Aug 2019 10:59:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id i18so12832299pgl.11;
 Tue, 27 Aug 2019 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=yTrGOZqcn9Ur+DdirV1AaFOzOQBx22unwFJ7Yun/vxk=;
 b=AXi2X6VrjqqEomnw4rQZ/u5ux87CSq7E1P1o5mbLCDibgup3Var3uhfF9PM6abClvc
 cGvaO8wV9JlOmmwLOdD46jM9Bf2eOhCRzDQu1C+XXX4R/BCXuWV6ClDnbWSX6V0Fggxp
 xckbQNENW+HvqF6h3qOOTic46lKyR9mCvetJYoHXnGlz+Ft4m+FNWo2iG9g4PTAXwEpD
 jJ0SSr75yrP/2rsgNEZ0S7+5jwEHFU4rLcf1FB6OiHYXr80TIPlf+zyr4dAOEHDtjO6x
 avPiONI2ohEFlvrOhpgsUe9uCyBaRxGWgZWkGhHV+MVcPFyeDsKxHeG71DnbauumWBf8
 DYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=yTrGOZqcn9Ur+DdirV1AaFOzOQBx22unwFJ7Yun/vxk=;
 b=Eg1mbDKjq1vIEJ7KAVYnaLjZDG977eSXgX3ywKg5vo1ZImX2JT9/wRm6qwG7OfMcqL
 CAISTWM/aiTU4pYPXlKHhL12hnx2rSUqq9GRhvrXB0X+WoOrSgWNogZu3pT1Lkpg4IoF
 +rb6t5UAtG2cgtcpQ061DxmhLnE1+NW3s7Pbcx0dmbs7JLqLYPSAbSZJmLeLOGSpj6sE
 4KZbvv65jOVvGC3ABwOg0rKC4o6ZDCWPFR/nlad8T7xGCIlCX4MGFJOybn0wNWKJbPtw
 1yipeZLKgy6NyV5wzGwSi7w/uastKaXRWxQAWehpdNXsPqU/r1Jk0pbKgcZL/YOiT6nb
 XtaA==
X-Gm-Message-State: APjAAAWkuhSNDuIzuM2R8gE1Pw9Q0s9XCQ2MW2l3iZE9zzOo27IEWJ42
 0PM8iylKwOuaBKsJOWVoIa4=
X-Google-Smtp-Source: APXvYqx2AcqdWNL/DviMHAfJJlA4Bo4HKLsE4R63YstVKVG+rIHoKEtQRjXYupUTm9yZWQPdnGwV1g==
X-Received: by 2002:a63:2364:: with SMTP id u36mr20881926pgm.449.1566917955308; 
 Tue, 27 Aug 2019 07:59:15 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.59.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:59:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:35 -0700
Message-Id: <1566917919-25381-27-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v6 26/30] riscv: sifive: Implement a model for
 SiFive FU540 OTP
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

This implements a simple model for SiFive FU540 OTP (One-Time
Programmable) Memory interface, primarily for reading out the
stored serial number from the first 1 KiB of the 16 KiB OTP
memory reserved by SiFive for internal use.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v6: None
Changes in v5:
- change to use defines instead of enums
- change to use qemu_log_mask(LOG_GUEST_ERROR,...) in sifive_u_otp
- creating a 32-bit val variable and using that instead of casting
  everywhere in sifive_u_otp_write()
- move all register initialization to sifive_u_otp_reset() function
- drop sifive_u_otp_create()

Changes in v4:
- prefix all macros/variables/functions with SIFIVE_U/sifive_u
  in the sifive_u_otp driver

Changes in v3: None
Changes in v2: None

 hw/riscv/Makefile.objs          |   1 +
 hw/riscv/sifive_u_otp.c         | 190 ++++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u_otp.h |  80 +++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 hw/riscv/sifive_u_otp.c
 create mode 100644 include/hw/riscv/sifive_u_otp.h

diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
index b95bbd5..fc3c6dd 100644
--- a/hw/riscv/Makefile.objs
+++ b/hw/riscv/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_SIFIVE) += sifive_gpio.o
 obj-$(CONFIG_SIFIVE) += sifive_plic.o
 obj-$(CONFIG_SIFIVE) += sifive_test.o
 obj-$(CONFIG_SIFIVE_U) += sifive_u.o
+obj-$(CONFIG_SIFIVE_U) += sifive_u_otp.o
 obj-$(CONFIG_SIFIVE_U) += sifive_u_prci.o
 obj-$(CONFIG_SIFIVE) += sifive_uart.o
 obj-$(CONFIG_SPIKE) += spike.o
diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
new file mode 100644
index 0000000..7d65a85
--- /dev/null
+++ b/hw/riscv/sifive_u_otp.c
@@ -0,0 +1,190 @@
+/*
+ * QEMU SiFive U OTP (One-Time Programmable) Memory interface
+ *
+ * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
+ *
+ * Simple model of the OTP to emulate register reads made by the SDK BSP
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
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/riscv/sifive_u_otp.h"
+
+static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SiFiveUOTPState *s = opaque;
+
+    switch (addr) {
+    case SIFIVE_U_OTP_PA:
+        return s->pa;
+    case SIFIVE_U_OTP_PAIO:
+        return s->paio;
+    case SIFIVE_U_OTP_PAS:
+        return s->pas;
+    case SIFIVE_U_OTP_PCE:
+        return s->pce;
+    case SIFIVE_U_OTP_PCLK:
+        return s->pclk;
+    case SIFIVE_U_OTP_PDIN:
+        return s->pdin;
+    case SIFIVE_U_OTP_PDOUT:
+        if ((s->pce & SIFIVE_U_OTP_PCE_EN) &&
+            (s->pdstb & SIFIVE_U_OTP_PDSTB_EN) &&
+            (s->ptrim & SIFIVE_U_OTP_PTRIM_EN)) {
+            return s->fuse[s->pa & SIFIVE_U_OTP_PA_MASK];
+        } else {
+            return 0xff;
+        }
+    case SIFIVE_U_OTP_PDSTB:
+        return s->pdstb;
+    case SIFIVE_U_OTP_PPROG:
+        return s->pprog;
+    case SIFIVE_U_OTP_PTC:
+        return s->ptc;
+    case SIFIVE_U_OTP_PTM:
+        return s->ptm;
+    case SIFIVE_U_OTP_PTM_REP:
+        return s->ptm_rep;
+    case SIFIVE_U_OTP_PTR:
+        return s->ptr;
+    case SIFIVE_U_OTP_PTRIM:
+        return s->ptrim;
+    case SIFIVE_U_OTP_PWE:
+        return s->pwe;
+    }
+
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%x\n",
+                  __func__, (int)addr);
+    return 0;
+}
+
+static void sifive_u_otp_write(void *opaque, hwaddr addr,
+                               uint64_t val64, unsigned int size)
+{
+    SiFiveUOTPState *s = opaque;
+    uint32_t val32 = (uint32_t)val64;
+
+    switch (addr) {
+    case SIFIVE_U_OTP_PA:
+        s->pa = val32 & SIFIVE_U_OTP_PA_MASK;
+        break;
+    case SIFIVE_U_OTP_PAIO:
+        s->paio = val32;
+        break;
+    case SIFIVE_U_OTP_PAS:
+        s->pas = val32;
+        break;
+    case SIFIVE_U_OTP_PCE:
+        s->pce = val32;
+        break;
+    case SIFIVE_U_OTP_PCLK:
+        s->pclk = val32;
+        break;
+    case SIFIVE_U_OTP_PDIN:
+        s->pdin = val32;
+        break;
+    case SIFIVE_U_OTP_PDOUT:
+        /* read-only */
+        break;
+    case SIFIVE_U_OTP_PDSTB:
+        s->pdstb = val32;
+        break;
+    case SIFIVE_U_OTP_PPROG:
+        s->pprog = val32;
+        break;
+    case SIFIVE_U_OTP_PTC:
+        s->ptc = val32;
+        break;
+    case SIFIVE_U_OTP_PTM:
+        s->ptm = val32;
+        break;
+    case SIFIVE_U_OTP_PTM_REP:
+        s->ptm_rep = val32;
+        break;
+    case SIFIVE_U_OTP_PTR:
+        s->ptr = val32;
+        break;
+    case SIFIVE_U_OTP_PTRIM:
+        s->ptrim = val32;
+        break;
+    case SIFIVE_U_OTP_PWE:
+        s->pwe = val32;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x v=0x%x\n",
+                      __func__, (int)addr, (int)val64);
+    }
+}
+
+static const MemoryRegionOps sifive_u_otp_ops = {
+    .read = sifive_u_otp_read,
+    .write = sifive_u_otp_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static Property sifive_u_otp_properties[] = {
+    DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
+{
+    SiFiveUOTPState *s = SIFIVE_U_OTP(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_u_otp_ops, s,
+                          TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+}
+
+static void sifive_u_otp_reset(DeviceState *dev)
+{
+    SiFiveUOTPState *s = SIFIVE_U_OTP(dev);
+
+    /* Initialize all fuses' initial value to 0xFFs */
+    memset(s->fuse, 0xff, sizeof(s->fuse));
+
+    /* Make a valid content of serial number */
+    s->fuse[SIFIVE_U_OTP_SERIAL_ADDR] = s->serial;
+    s->fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] = ~(s->serial);
+}
+
+static void sifive_u_otp_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = sifive_u_otp_properties;
+    dc->realize = sifive_u_otp_realize;
+    dc->reset = sifive_u_otp_reset;
+}
+
+static const TypeInfo sifive_u_otp_info = {
+    .name          = TYPE_SIFIVE_U_OTP,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFiveUOTPState),
+    .class_init    = sifive_u_otp_class_init,
+};
+
+static void sifive_u_otp_register_types(void)
+{
+    type_register_static(&sifive_u_otp_info);
+}
+
+type_init(sifive_u_otp_register_types)
diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
new file mode 100644
index 0000000..6392975
--- /dev/null
+++ b/include/hw/riscv/sifive_u_otp.h
@@ -0,0 +1,80 @@
+/*
+ * QEMU SiFive U OTP (One-Time Programmable) Memory interface
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
+#ifndef HW_SIFIVE_U_OTP_H
+#define HW_SIFIVE_U_OTP_H
+
+#define SIFIVE_U_OTP_PA         0x00
+#define SIFIVE_U_OTP_PAIO       0x04
+#define SIFIVE_U_OTP_PAS        0x08
+#define SIFIVE_U_OTP_PCE        0x0C
+#define SIFIVE_U_OTP_PCLK       0x10
+#define SIFIVE_U_OTP_PDIN       0x14
+#define SIFIVE_U_OTP_PDOUT      0x18
+#define SIFIVE_U_OTP_PDSTB      0x1C
+#define SIFIVE_U_OTP_PPROG      0x20
+#define SIFIVE_U_OTP_PTC        0x24
+#define SIFIVE_U_OTP_PTM        0x28
+#define SIFIVE_U_OTP_PTM_REP    0x2C
+#define SIFIVE_U_OTP_PTR        0x30
+#define SIFIVE_U_OTP_PTRIM      0x34
+#define SIFIVE_U_OTP_PWE        0x38
+
+#define SIFIVE_U_OTP_PCE_EN     (1 << 0)
+
+#define SIFIVE_U_OTP_PDSTB_EN   (1 << 0)
+
+#define SIFIVE_U_OTP_PTRIM_EN   (1 << 0)
+
+#define SIFIVE_U_OTP_PA_MASK        0xfff
+#define SIFIVE_U_OTP_NUM_FUSES      0x1000
+#define SIFIVE_U_OTP_SERIAL_ADDR    0xfc
+
+#define SIFIVE_U_OTP_REG_SIZE       0x1000
+
+#define TYPE_SIFIVE_U_OTP           "riscv.sifive.u.otp"
+
+#define SIFIVE_U_OTP(obj) \
+    OBJECT_CHECK(SiFiveUOTPState, (obj), TYPE_SIFIVE_U_OTP)
+
+typedef struct SiFiveUOTPState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t pa;
+    uint32_t paio;
+    uint32_t pas;
+    uint32_t pce;
+    uint32_t pclk;
+    uint32_t pdin;
+    uint32_t pdstb;
+    uint32_t pprog;
+    uint32_t ptc;
+    uint32_t ptm;
+    uint32_t ptm_rep;
+    uint32_t ptr;
+    uint32_t ptrim;
+    uint32_t pwe;
+    uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
+    /* config */
+    uint32_t serial;
+} SiFiveUOTPState;
+
+#endif /* HW_SIFIVE_U_OTP_H */
-- 
2.7.4


