Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A0CB244
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 01:23:41 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGARg-000464-HD
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 19:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGAAE-0001An-E2
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGAA9-0006G9-0K
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:05:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGA9z-0006AH-1J; Thu, 03 Oct 2019 19:05:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 573F510C092B;
 Thu,  3 Oct 2019 23:05:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D47F010013A7;
 Thu,  3 Oct 2019 23:05:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/14] hw: Move M48T59 device from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri,  4 Oct 2019 01:03:54 +0200
Message-Id: <20191003230404.19384-5-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 03 Oct 2019 23:05:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The M48T59 is a Real Time Clock, not a timer.
Move it under the hw/rtc/ subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: delete include/hw/timer/m48t59.h (dgibson)
---
 MAINTAINERS                         |  4 +-
 hw/ppc/ppc405_boards.c              |  2 +-
 hw/ppc/prep.c                       |  2 +-
 hw/rtc/Kconfig                      |  3 ++
 hw/rtc/Makefile.objs                |  4 ++
 hw/{timer =3D> rtc}/m48t59-internal.h |  0
 hw/{timer =3D> rtc}/m48t59-isa.c      |  4 +-
 hw/{timer =3D> rtc}/m48t59.c          |  2 +-
 hw/sparc/sun4m.c                    |  2 +-
 hw/sparc64/sun4u.c                  |  2 +-
 hw/timer/Kconfig                    |  3 --
 hw/timer/Makefile.objs              |  4 --
 include/hw/rtc/m48t59.h             | 57 +++++++++++++++++++++++++++++
 include/hw/timer/m48t59.h           | 32 ----------------
 14 files changed, 73 insertions(+), 48 deletions(-)
 rename hw/{timer =3D> rtc}/m48t59-internal.h (100%)
 rename hw/{timer =3D> rtc}/m48t59-isa.c (98%)
 rename hw/{timer =3D> rtc}/m48t59.c (99%)
 create mode 100644 include/hw/rtc/m48t59.h
 delete mode 100644 include/hw/timer/m48t59.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e3255cdbf2..5d85424a33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1064,9 +1064,9 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.c
 F: hw/dma/i82374.c
-F: hw/timer/m48t59-isa.c
+F: hw/rtc/m48t59-isa.c
 F: include/hw/isa/pc87312.h
-F: include/hw/timer/m48t59.h
+F: include/hw/rtc/m48t59.h
 F: pc-bios/ppc_rom.bin
=20
 sPAPR
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 388cae0b43..1f721feed6 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -29,7 +29,7 @@
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
 #include "ppc405.h"
-#include "hw/timer/m48t59.h"
+#include "hw/rtc/m48t59.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 3a51536e1a..862345c2ac 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -25,7 +25,7 @@
=20
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/timer/m48t59.h"
+#include "hw/rtc/m48t59.h"
 #include "hw/char/serial.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index 7ffd702268..159c233517 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -1,3 +1,6 @@
+config M48T59
+    bool
+
 config PL031
     bool
=20
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 3cac0d5a63..c87f81405e 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -1,2 +1,6 @@
+common-obj-$(CONFIG_M48T59) +=3D m48t59.o
+ifeq ($(CONFIG_ISA_BUS),y)
+common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
+endif
 common-obj-$(CONFIG_PL031) +=3D pl031.o
 obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
diff --git a/hw/timer/m48t59-internal.h b/hw/rtc/m48t59-internal.h
similarity index 100%
rename from hw/timer/m48t59-internal.h
rename to hw/rtc/m48t59-internal.h
diff --git a/hw/timer/m48t59-isa.c b/hw/rtc/m48t59-isa.c
similarity index 98%
rename from hw/timer/m48t59-isa.c
rename to hw/rtc/m48t59-isa.c
index 5e5432abfd..7fde854c0f 100644
--- a/hw/timer/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -1,5 +1,5 @@
 /*
- * QEMU M48T59 and M48T08 NVRAM emulation (ISA bus interface
+ * QEMU M48T59 and M48T08 NVRAM emulation (ISA bus interface)
  *
  * Copyright (c) 2003-2005, 2007 Jocelyn Mayer
  * Copyright (c) 2013 Herv=C3=A9 Poussineau
@@ -26,7 +26,7 @@
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
-#include "hw/timer/m48t59.h"
+#include "hw/rtc/m48t59.h"
 #include "m48t59-internal.h"
 #include "qemu/module.h"
=20
diff --git a/hw/timer/m48t59.c b/hw/rtc/m48t59.c
similarity index 99%
rename from hw/timer/m48t59.c
rename to hw/rtc/m48t59.c
index a9fc2f981a..fc592b9fb1 100644
--- a/hw/timer/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -27,7 +27,7 @@
 #include "qemu-common.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
-#include "hw/timer/m48t59.h"
+#include "hw/rtc/m48t59.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 6c5a17a020..2aaa5bf1ae 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -31,7 +31,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "hw/sparc/sun4m_iommu.h"
-#include "hw/timer/m48t59.h"
+#include "hw/rtc/m48t59.h"
 #include "migration/vmstate.h"
 #include "hw/sparc/sparc32_dma.h"
 #include "hw/block/fdc.h"
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 1ded2a4c9a..955082773b 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -36,7 +36,7 @@
 #include "hw/pci-host/sabre.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
-#include "hw/timer/m48t59.h"
+#include "hw/rtc/m48t59.h"
 #include "migration/vmstate.h"
 #include "hw/input/i8042.h"
 #include "hw/block/fdc.h"
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index af415c8ef8..a57e9b59fc 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -24,9 +24,6 @@ config M41T80
     bool
     depends on I2C
=20
-config M48T59
-    bool
-
 config TWL92230
     bool
     depends on I2C
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index b0159189cf..fe2d1fbc40 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -7,10 +7,6 @@ common-obj-$(CONFIG_DS1338) +=3D ds1338.o
 common-obj-$(CONFIG_HPET) +=3D hpet.o
 common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
 common-obj-$(CONFIG_M41T80) +=3D m41t80.o
-common-obj-$(CONFIG_M48T59) +=3D m48t59.o
-ifeq ($(CONFIG_ISA_BUS),y)
-common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
-endif
 common-obj-$(CONFIG_PUV3) +=3D puv3_ost.o
 common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
 common-obj-$(CONFIG_XILINX) +=3D xilinx_timer.o
diff --git a/include/hw/rtc/m48t59.h b/include/hw/rtc/m48t59.h
new file mode 100644
index 0000000000..e7ea4e8761
--- /dev/null
+++ b/include/hw/rtc/m48t59.h
@@ -0,0 +1,57 @@
+/*
+ * QEMU M48T59 and M48T08 NVRAM emulation
+ *
+ * Copyright (c) 2003-2005, 2007 Jocelyn Mayer
+ * Copyright (c) 2013 Herv=C3=A9 Poussineau
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_RTC_M48T59_H
+#define HW_RTC_M48T59_H
+
+#include "exec/hwaddr.h"
+#include "qom/object.h"
+
+#define TYPE_NVRAM "nvram"
+
+#define NVRAM_CLASS(klass) \
+    OBJECT_CLASS_CHECK(NvramClass, (klass), TYPE_NVRAM)
+#define NVRAM_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(NvramClass, (obj), TYPE_NVRAM)
+#define NVRAM(obj) \
+    INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
+
+typedef struct Nvram Nvram;
+
+typedef struct NvramClass {
+    InterfaceClass parent;
+
+    uint32_t (*read)(Nvram *obj, uint32_t addr);
+    void (*write)(Nvram *obj, uint32_t addr, uint32_t val);
+    void (*toggle_lock)(Nvram *obj, int lock);
+} NvramClass;
+
+Nvram *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
+                       int base_year, int type);
+Nvram *m48t59_init(qemu_irq IRQ, hwaddr mem_base,
+                   uint32_t io_base, uint16_t size, int base_year,
+                   int type);
+
+#endif /* HW_M48T59_H */
diff --git a/include/hw/timer/m48t59.h b/include/hw/timer/m48t59.h
deleted file mode 100644
index f74854c026..0000000000
--- a/include/hw/timer/m48t59.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#ifndef HW_M48T59_H
-#define HW_M48T59_H
-
-#include "exec/hwaddr.h"
-#include "qom/object.h"
-
-#define TYPE_NVRAM "nvram"
-
-#define NVRAM_CLASS(klass) \
-    OBJECT_CLASS_CHECK(NvramClass, (klass), TYPE_NVRAM)
-#define NVRAM_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NvramClass, (obj), TYPE_NVRAM)
-#define NVRAM(obj) \
-    INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
-
-typedef struct Nvram Nvram;
-
-typedef struct NvramClass {
-    InterfaceClass parent;
-
-    uint32_t (*read)(Nvram *obj, uint32_t addr);
-    void (*write)(Nvram *obj, uint32_t addr, uint32_t val);
-    void (*toggle_lock)(Nvram *obj, int lock);
-} NvramClass;
-
-Nvram *m48t59_init_isa(ISABus *bus, uint32_t io_base, uint16_t size,
-                       int base_year, int type);
-Nvram *m48t59_init(qemu_irq IRQ, hwaddr mem_base,
-                   uint32_t io_base, uint16_t size, int base_year,
-                   int type);
-
-#endif /* HW_M48T59_H */
--=20
2.20.1


