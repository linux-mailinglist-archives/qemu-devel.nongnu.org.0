Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6061200
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 17:50:13 +0200 (CEST)
Received: from localhost ([::1]:60222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjmx2-0008Fz-8f
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 11:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57727)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <th.huth@gmail.com>) id 1hjmqN-0004WC-Uh
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1hjmqM-0003hM-9r
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1hjmqM-0003gc-3K
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id g17so2556973wrr.5
 for <qemu-devel@nongnu.org>; Sat, 06 Jul 2019 08:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyhszNH+eqbMw7xBJ2QewHLtohzmLu222EM9n9LDf/Q=;
 b=fk3iWPjzFQV6j5BbY8oJsHwHycK51AtmmQfSoJtKhmUz9B5M+VIii0iQkDVOWvxLgc
 EpQmrcRSVYHKc7Rjy9lz0G9WXuFwRjcXyooYFa+BpSvozPZHGl7TODJpN37/6zsY9G7a
 GMi42lKEg6IFTjPy7rgitPi55mZo5PgjjyRTX2C4XS3HDuY2HtA/KrmLIQ+LpVPYhfIJ
 icPfc70Q2tD5gg5t99qrBCU0pddLTjrGDPpUkwRUPbww3kBac0lDCPrbZBmjXEMQ0ei7
 /Uu/XHZYLcnKJxrLf+a8a1iWcGOKiVlUXpLK7EvTXyKgGpM42X1TYCGt6wdItKL+1o8p
 vtKA==
X-Gm-Message-State: APjAAAXe8k+XLBYX32Ihw9un8NbQkmhR5OdgVMVnL0toO8SJrL6eMfZl
 dxHTVhoGQl7kuRodJEfcJ/z4WvKU
X-Google-Smtp-Source: APXvYqwS0GJ51oIOdfr9ojUqPZxC0SCXWL2ZB3/+KJfsCKB/lBGEjQH0NDvJRcJcE9IQYRiL2uGZbg==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr9117926wrr.252.1562427796796; 
 Sat, 06 Jul 2019 08:43:16 -0700 (PDT)
Received: from thl530.multi.box (pD9E83551.dip0.t-ipconnect.de.
 [217.232.53.81])
 by smtp.gmail.com with ESMTPSA id h6sm12393850wre.82.2019.07.06.08.43.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 08:43:16 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Date: Sat,  6 Jul 2019 17:43:05 +0200
Message-Id: <20190706154308.7280-2-huth@tuxfamily.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706154308.7280-1-huth@tuxfamily.org>
References: <20190706154308.7280-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: [Qemu-devel] [PATCH v3 1/4] m68k: Add NeXTcube framebuffer device
 emulation
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NeXTcube uses a linear framebuffer with 4 greyscale colors and
a fixed resolution of 1120 * 832.
This code has been taken from Bryce Lanham's GSoC 2011 NeXT branch at

 https://github.com/blanham/qemu-NeXT/blob/next-cube/hw/next-fb.c

and altered to fit the latest interface of the current QEMU (e.g.
the device has been "qdev"-ified etc.).

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 default-configs/m68k-softmmu.mak |   1 +
 hw/display/Makefile.objs         |   1 +
 hw/display/next-fb.c             | 145 +++++++++++++++++++++++++++++++
 hw/m68k/Kconfig                  |   4 +
 include/hw/m68k/next-cube.h      |   7 ++
 5 files changed, 158 insertions(+)
 create mode 100644 hw/display/next-fb.c
 create mode 100644 include/hw/m68k/next-cube.h

diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
index 4049a8f2ba..d67ab8b96d 100644
--- a/default-configs/m68k-softmmu.mak
+++ b/default-configs/m68k-softmmu.mak
@@ -6,3 +6,4 @@ CONFIG_SEMIHOSTING=y
 #
 CONFIG_AN5206=y
 CONFIG_MCF5208=y
+CONFIG_NEXTCUBE=y
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index a64998fc7b..8d1c71026d 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -38,6 +38,7 @@ obj-$(CONFIG_RASPI) += bcm2835_fb.o
 obj-$(CONFIG_SM501) += sm501.o
 obj-$(CONFIG_TCX) += tcx.o
 obj-$(CONFIG_CG3) += cg3.o
+obj-$(CONFIG_NEXTCUBE) += next-fb.o
 
 obj-$(CONFIG_VGA) += vga.o
 
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
new file mode 100644
index 0000000000..916a002f61
--- /dev/null
+++ b/hw/display/next-fb.c
@@ -0,0 +1,145 @@
+/*
+ * NeXT Cube/Station Framebuffer Emulation
+ *
+ * Copyright (c) 2011 Bryce Lanham
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
+#include "qapi/error.h"
+#include "ui/console.h"
+#include "hw/hw.h"
+#include "hw/boards.h"
+#include "hw/loader.h"
+#include "hw/display/framebuffer.h"
+#include "ui/pixel_ops.h"
+#include "hw/m68k/next-cube.h"
+
+#define NEXTFB(obj) OBJECT_CHECK(NeXTFbState, (obj), TYPE_NEXTFB)
+
+struct NeXTFbState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion fb_mr;
+    MemoryRegionSection fbsection;
+    QemuConsole *con;
+
+    uint32_t pitch;
+    uint32_t cols;
+    uint32_t rows;
+    int invalidate;
+};
+typedef struct NeXTFbState NeXTFbState;
+
+static void nextfb_draw_line(void *opaque, uint8_t *d, const uint8_t *s,
+                             int width, int pitch)
+{
+    NeXTFbState *nfbstate = NEXTFB(opaque);
+    static const uint32_t pal[4] = {
+        0xFFFFFFFF, 0xFFAAAAAA, 0xFF555555, 0xFF000000
+    };
+    uint32_t *buf = (uint32_t *)d;
+    int i = 0;
+
+    for (i = 0; i < nfbstate->cols / 4; i++) {
+        int j = i * 4;
+        uint8_t src = s[i];
+        buf[j + 3] = pal[src & 0x3];
+        src >>= 2;
+        buf[j + 2] = pal[src & 0x3];
+        src >>= 2;
+        buf[j + 1] = pal[src & 0x3];
+        src >>= 2;
+        buf[j + 0] = pal[src & 0x3];
+    }
+}
+
+static void nextfb_update(void *opaque)
+{
+    NeXTFbState *s = NEXTFB(opaque);
+    int dest_width = 4;
+    int src_width;
+    int first = 0;
+    int last  = 0;
+    DisplaySurface *surface = qemu_console_surface(s->con);
+
+    src_width = s->cols / 4 + 8;
+    dest_width = s->cols * 4;
+
+    if (s->invalidate) {
+        framebuffer_update_memory_section(&s->fbsection, &s->fb_mr, 0,
+                                          s->cols, src_width);
+        s->invalidate = 0;
+    }
+
+    framebuffer_update_display(surface, &s->fbsection, s->cols, s->rows,
+                               src_width, dest_width, 0, 1, nextfb_draw_line,
+                               s, &first, &last);
+
+    dpy_gfx_update(s->con, 0, 0, s->cols, s->rows);
+}
+
+static void nextfb_invalidate(void *opaque)
+{
+    NeXTFbState *s = NEXTFB(opaque);
+    s->invalidate = 1;
+}
+
+static const GraphicHwOps nextfb_ops = {
+    .invalidate  = nextfb_invalidate,
+    .gfx_update  = nextfb_update,
+};
+
+static void nextfb_realize(DeviceState *dev, Error **errp)
+{
+    NeXTFbState *s = NEXTFB(dev);
+
+    memory_region_init_ram(&s->fb_mr, OBJECT(dev), "next-video", 0x1CB100,
+                           &error_fatal);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->fb_mr);
+
+    s->invalidate = 1;
+    s->cols = 1120;
+    s->rows = 832;
+
+    s->con = graphic_console_init(dev, 0, &nextfb_ops, s);
+    qemu_console_resize(s->con, s->cols, s->rows);
+}
+
+static void nextfb_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    dc->realize = nextfb_realize;
+}
+
+static const TypeInfo nextfb_info = {
+    .name          = TYPE_NEXTFB,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NeXTFbState),
+    .class_init    = nextfb_class_init,
+};
+
+static void nextfb_register_types(void)
+{
+    type_register_static(&nextfb_info);
+}
+
+type_init(nextfb_register_types)
diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
index 49ef0b3f6d..ec58a2eb06 100644
--- a/hw/m68k/Kconfig
+++ b/hw/m68k/Kconfig
@@ -7,3 +7,7 @@ config MCF5208
     bool
     select COLDFIRE
     select PTIMER
+
+config NEXTCUBE
+    bool
+    select FRAMEBUFFER
diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
new file mode 100644
index 0000000000..090c7c51aa
--- /dev/null
+++ b/include/hw/m68k/next-cube.h
@@ -0,0 +1,7 @@
+
+#ifndef NEXT_CUBE_H
+#define NEXT_CUBE_H
+
+#define TYPE_NEXTFB "next-fb"
+
+#endif /* NEXT_CUBE_H */
-- 
2.21.0


