Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CD1449EC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:38:09 +0100 (CET)
Received: from localhost ([::1]:35350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu5uC-0006JX-F1
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu5pP-0000mY-J8
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:33:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu5pN-0001lt-BJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:33:11 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41340)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu5pN-0001lS-30
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:33:09 -0500
Received: by mail-pf1-x443.google.com with SMTP id w62so2532257pfw.8
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=be3xSv992Mgvk2T05Czd+wCaqG8Gr/inskA4972jfLI=;
 b=etAEZkyzCyq0smxqs2obMsCUKoWXkev0xoQAh2Kp49p/UgEfIajiQ+/kmLzXCmGLwg
 XZxlprCZfKuS5PF6Wc9nYfyUinGcbs891ASRb33LwaZUzlXiZFHqOrxse9ojpUHC3ntL
 xIvzq39T6+1bXKTOPHmdvrFkMPwUs86EJqGFU+FxGMGnaW2c+CqJn3xk5R09Xe+2frJV
 GC5salLj20rmWFdR3obN1FPRHjhXnii9OHfBgdoKzzEOnHnPqOyJqs3zv8pVDudRgDAo
 hs4L7orMZXarfUOA0fpOw6j9AZTUyzH4ppQdaAsfv9pZ7OLIoo5aux2RmXzg4CW6vdfH
 27EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=be3xSv992Mgvk2T05Czd+wCaqG8Gr/inskA4972jfLI=;
 b=fVuo3XqZFKxXk8c2lkrQaafRturdKT1xq0ecmhGzS4t8+/LV94EZvHTNszFYm8YtZI
 PYaf39GIS+02kZ33hfSTmecJlO/R/1qsN2YOXDC88WNGYTeYLVjhf3FL/zEBzyJybFrI
 VVpENjjSzf71L4uqfLvHdiWWArxnEPuwU8s4Yr+k08q6esgQHDKg2zuItNtpKdeQg4HU
 Ku9gtJb0p4Eo+1Db2GP+j7u8MjX+s47sG+fNu26+MqoRRSesgHEHdMsXW3pJvdCiJBTS
 1hoPPqK/7BxsS78bMVHpzzbIYydyAx1FO5v3y19JVzpw/Kqt1wYvwXj3dvMgwYVuPbb6
 LamQ==
X-Gm-Message-State: APjAAAV+1XsQ7MvnBmfvVj+3sm/2K6PknNao+sEHlKO4ZJeYMx23cvk2
 7lcCc/eDYWH9WdZBHY6KzzfpaRd+Ltw=
X-Google-Smtp-Source: APXvYqzdMkYY7qO+sFFa1mq7QgyetpldJ3WNl+ndkJjD9M11iPlawHWP21itVhspm3Um41wts5Mj0Q==
X-Received: by 2002:a62:2e41:: with SMTP id u62mr544752pfu.248.1579660387645; 
 Tue, 21 Jan 2020 18:33:07 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id t1sm42935209pgq.23.2020.01.21.18.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:33:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] hppa: add emulation of LASI PS2 controllers
Date: Tue, 21 Jan 2020 16:32:49 -1000
Message-Id: <20200122023256.27556-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122023256.27556-1-richard.henderson@linaro.org>
References: <20200122023256.27556-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sven Schnelle <svens@stackframe.org>

Signed-off-by: Sven Schnelle <svens@stackframe.org>
Message-Id: <20191220211512.3289-5-svens@stackframe.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/input/lasips2.h |  16 ++
 include/hw/input/ps2.h     |   1 +
 hw/hppa/lasi.c             |  10 +-
 hw/input/lasips2.c         | 289 +++++++++++++++++++++++++++++++++++++
 hw/input/ps2.c             |   5 +
 hw/hppa/Kconfig            |   1 +
 hw/input/Kconfig           |   3 +
 hw/input/Makefile.objs     |   1 +
 hw/input/trace-events      |   5 +
 9 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/input/lasips2.h
 create mode 100644 hw/input/lasips2.c

diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
new file mode 100644
index 0000000000..0cd7b59064
--- /dev/null
+++ b/include/hw/input/lasips2.h
@@ -0,0 +1,16 @@
+/*
+ * QEMU LASI PS/2 emulation
+ *
+ * Copyright (c) 2019 Sven Schnelle
+ *
+ */
+#ifndef HW_INPUT_LASIPS2_H
+#define HW_INPUT_LASIPS2_H
+
+#include "exec/hwaddr.h"
+
+#define TYPE_LASIPS2 "lasips2"
+
+void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
+
+#endif /* HW_INPUT_LASIPS2_H */
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index b60455d4f6..35d983897a 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -47,5 +47,6 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3);
 void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4);
 void ps2_keyboard_set_translation(void *opaque, int mode);
 void ps2_mouse_fake_event(void *opaque);
+int ps2_queue_empty(PS2State *s);
 
 #endif /* HW_PS2_H */
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 51752589f3..d8d03f95c0 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -22,6 +22,7 @@
 #include "hw/net/lasi_82596.h"
 #include "hw/char/parallel.h"
 #include "hw/char/serial.h"
+#include "hw/input/lasips2.h"
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 
@@ -324,6 +325,7 @@ DeviceState *lasi_init(MemoryRegion *address_space)
                      lpt_irq, parallel_hds[0]);
 
     /* Real time clock (RTC), it's only one 32-bit counter @9000 */
+
     s->rtc = time(NULL);
     s->rtc_ref = 0;
 
@@ -333,8 +335,14 @@ DeviceState *lasi_init(MemoryRegion *address_space)
                 lasi_get_irq(LASI_UART_HPA));
         serial_mm_init(address_space, LASI_UART_HPA + 0x800, 0,
                 serial_irq, 8000000 / 16,
-                serial_hd(1), DEVICE_NATIVE_ENDIAN);
+                serial_hd(0), DEVICE_NATIVE_ENDIAN);
     }
+
+    /* PS/2 Keyboard/Mouse */
+    qemu_irq ps2kbd_irq = qemu_allocate_irq(lasi_set_irq, s,
+            lasi_get_irq(LASI_PS2KBD_HPA));
+    lasips2_init(address_space, LASI_PS2KBD_HPA,  ps2kbd_irq);
+
     return dev;
 }
 
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
new file mode 100644
index 0000000000..1943671d1e
--- /dev/null
+++ b/hw/input/lasips2.c
@@ -0,0 +1,289 @@
+/*
+ * QEMU HP Lasi PS/2 interface emulation
+ *
+ * Copyright (c) 2019 Sven Schnelle
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
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/qdev-properties.h"
+#include "hw/hw.h"
+#include "hw/input/ps2.h"
+#include "hw/input/lasips2.h"
+#include "hw/sysbus.h"
+#include "exec/hwaddr.h"
+#include "sysemu/sysemu.h"
+#include "trace.h"
+#include "exec/address-spaces.h"
+#include "migration/vmstate.h"
+#include "hw/irq.h"
+struct LASIPS2State;
+typedef struct LASIPS2Port {
+    struct LASIPS2State *parent;
+    MemoryRegion reg;
+    void *dev;
+    uint8_t id;
+    uint8_t control;
+    uint8_t buf;
+    bool loopback_rbne;
+    bool irq;
+} LASIPS2Port;
+
+typedef struct LASIPS2State {
+    LASIPS2Port kbd;
+    LASIPS2Port mouse;
+    qemu_irq irq;
+} LASIPS2State;
+
+static const VMStateDescription vmstate_lasips2 = {
+    .name = "lasips2",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(kbd.control, LASIPS2State),
+        VMSTATE_UINT8(kbd.id, LASIPS2State),
+        VMSTATE_BOOL(kbd.irq, LASIPS2State),
+        VMSTATE_UINT8(mouse.control, LASIPS2State),
+        VMSTATE_UINT8(mouse.id, LASIPS2State),
+        VMSTATE_BOOL(mouse.irq, LASIPS2State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+typedef enum {
+    REG_PS2_ID = 0,
+    REG_PS2_RCVDATA = 4,
+    REG_PS2_CONTROL = 8,
+    REG_PS2_STATUS = 12,
+} lasips2_read_reg_t;
+
+typedef enum {
+    REG_PS2_RESET = 0,
+    REG_PS2_XMTDATA = 4,
+} lasips2_write_reg_t;
+
+typedef enum {
+    LASIPS2_CONTROL_ENABLE = 0x01,
+    LASIPS2_CONTROL_LOOPBACK = 0x02,
+    LASIPS2_CONTROL_DIAG = 0x20,
+    LASIPS2_CONTROL_DATDIR = 0x40,
+    LASIPS2_CONTROL_CLKDIR = 0x80,
+} lasips2_control_reg_t;
+
+typedef enum {
+    LASIPS2_STATUS_RBNE = 0x01,
+    LASIPS2_STATUS_TBNE = 0x02,
+    LASIPS2_STATUS_TERR = 0x04,
+    LASIPS2_STATUS_PERR = 0x08,
+    LASIPS2_STATUS_CMPINTR = 0x10,
+    LASIPS2_STATUS_DATSHD = 0x40,
+    LASIPS2_STATUS_CLKSHD = 0x80,
+} lasips2_status_reg_t;
+
+static const char *artist_read_reg_name(uint64_t addr)
+{
+    switch (addr & 0xc) {
+    case REG_PS2_ID:
+        return " PS2_ID";
+
+    case REG_PS2_RCVDATA:
+        return " PS2_RCVDATA";
+
+    case REG_PS2_CONTROL:
+        return " PS2_CONTROL";
+
+    case REG_PS2_STATUS:
+        return " PS2_STATUS";
+
+    default:
+        return "";
+    }
+    return "";
+}
+
+static const char *artist_write_reg_name(uint64_t addr)
+{
+    switch (addr & 0x0c) {
+    case REG_PS2_RESET:
+        return " PS2_RESET";
+
+    case REG_PS2_XMTDATA:
+        return " PS2_XMTDATA";
+
+    case REG_PS2_CONTROL:
+        return " PS2_CONTROL";
+
+    default:
+        return "";
+    }
+    return "";
+}
+
+static void lasips2_update_irq(LASIPS2State *s)
+{
+    trace_lasips2_intr(s->kbd.irq | s->mouse.irq);
+    qemu_set_irq(s->irq, s->kbd.irq | s->mouse.irq);
+}
+
+static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
+        unsigned size)
+{
+    LASIPS2Port *port = opaque;
+
+    trace_lasips2_reg_write(size, port->id, addr,
+        artist_write_reg_name(addr), val);
+
+    switch (addr & 0xc) {
+    case REG_PS2_CONTROL:
+        port->control = val;
+        break;
+
+    case REG_PS2_XMTDATA:
+        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
+            port->buf = val;
+            port->irq = true;
+            port->loopback_rbne = true;
+            lasips2_update_irq(port->parent);
+            break;
+        }
+
+        if (port->id) {
+            ps2_write_mouse(port->dev, val);
+        } else {
+            ps2_write_keyboard(port->dev, val);
+        }
+        break;
+
+    case REG_PS2_RESET:
+        break;
+
+    default:
+        qemu_log("%s: unknown register 0x%02lx\n", __func__, addr);
+        break;
+    }
+}
+
+static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
+{
+    LASIPS2Port *port = opaque;
+    uint64_t ret = 0;
+
+    switch (addr & 0xc) {
+    case REG_PS2_ID:
+        ret = port->id;
+        break;
+
+    case REG_PS2_RCVDATA:
+        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
+            port->irq = false;
+            port->loopback_rbne = false;
+            lasips2_update_irq(port->parent);
+            ret = port->buf;
+            break;
+        }
+
+        ret = ps2_read_data(port->dev);
+        break;
+
+    case REG_PS2_CONTROL:
+        ret = port->control;
+        break;
+
+    case REG_PS2_STATUS:
+
+        ret = LASIPS2_STATUS_DATSHD | LASIPS2_STATUS_CLKSHD;
+
+        if (port->control & LASIPS2_CONTROL_DIAG) {
+            if (!(port->control & LASIPS2_CONTROL_DATDIR)) {
+                ret &= ~LASIPS2_STATUS_DATSHD;
+            }
+
+            if (!(port->control & LASIPS2_CONTROL_CLKDIR)) {
+                ret &= ~LASIPS2_STATUS_CLKSHD;
+            }
+        }
+
+        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
+            if (port->loopback_rbne) {
+                ret |= LASIPS2_STATUS_RBNE;
+            }
+        } else {
+            if (!ps2_queue_empty(port->dev)) {
+                ret |= LASIPS2_STATUS_RBNE;
+            }
+        }
+
+        if (port->parent->kbd.irq || port->parent->mouse.irq) {
+            ret |= LASIPS2_STATUS_CMPINTR;
+        }
+        break;
+
+    default:
+        qemu_log("%s: unknown register 0x%02lx\n", __func__, addr);
+        break;
+    }
+    trace_lasips2_reg_read(size, port->id, addr,
+        artist_read_reg_name(addr), ret);
+
+    return ret;
+}
+
+static const MemoryRegionOps lasips2_reg_ops = {
+    .read = lasips2_reg_read,
+    .write = lasips2_reg_write,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void ps2dev_update_irq(void *opaque, int level)
+{
+    LASIPS2Port *port = opaque;
+    port->irq = level;
+    lasips2_update_irq(port->parent);
+}
+
+void lasips2_init(MemoryRegion *address_space,
+                  hwaddr base, qemu_irq irq)
+{
+    LASIPS2State *s;
+
+    s = g_malloc0(sizeof(LASIPS2State));
+
+    s->irq = irq;
+    s->mouse.id = 1;
+    s->kbd.parent = s;
+    s->mouse.parent = s;
+
+    vmstate_register(NULL, base, &vmstate_lasips2, s);
+
+    s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
+    s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
+
+    memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
+                          "lasips2-kbd", 0x100);
+    memory_region_add_subregion(address_space, base, &s->kbd.reg);
+
+    memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
+                          "lasips2-mouse", 0x100);
+    memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
+}
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 0b671b6339..f8746d2f52 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -192,6 +192,11 @@ static void ps2_reset_queue(PS2State *s)
     q->count = 0;
 }
 
+int ps2_queue_empty(PS2State *s)
+{
+    return s->queue.count == 0;
+}
+
 void ps2_queue_noirq(PS2State *s, int b)
 {
     PS2Queue *q = &s->queue;
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 2a7b38d6d6..7f9be7f25c 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -11,3 +11,4 @@ config DINO
     select MC146818RTC
     select LSI_SCSI_PCI
     select LASI_82596
+    select LASIPS2
diff --git a/hw/input/Kconfig b/hw/input/Kconfig
index 287f08887b..25c77a1b87 100644
--- a/hw/input/Kconfig
+++ b/hw/input/Kconfig
@@ -41,3 +41,6 @@ config VHOST_USER_INPUT
 
 config TSC210X
     bool
+
+config LASIPS2
+    select PS2
diff --git a/hw/input/Makefile.objs b/hw/input/Makefile.objs
index a1bc502ed0..f98f635685 100644
--- a/hw/input/Makefile.objs
+++ b/hw/input/Makefile.objs
@@ -15,3 +15,4 @@ common-obj-$(CONFIG_VHOST_USER_INPUT) += vhost-user-input.o
 obj-$(CONFIG_MILKYMIST) += milkymist-softusb.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_keypad.o
 obj-$(CONFIG_TSC210X) += tsc210x.o
+obj-$(CONFIG_LASIPS2) += lasips2.o
diff --git a/hw/input/trace-events b/hw/input/trace-events
index cf072fa2f8..a2888fd10c 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -53,3 +53,8 @@ tsc2005_sense(const char *state) "touchscreen sense %s"
 
 # virtio-input.c
 virtio_input_queue_full(void) "queue full"
+
+# lasips2.c
+lasips2_reg_read(unsigned int size, int id, uint64_t addr, const char *name, uint64_t val) "%u %d addr 0x%"PRIx64 "%s -> 0x%"PRIx64
+lasips2_reg_write(unsigned int size, int id, uint64_t addr, const char *name, uint64_t val) "%u %d addr 0x%"PRIx64 "%s <- 0x%"PRIx64
+lasips2_intr(unsigned int val) "%d"
-- 
2.20.1


