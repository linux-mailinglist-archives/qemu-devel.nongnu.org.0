Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C8132A10
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:30:28 +0100 (CET)
Received: from localhost ([::1]:51470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqoM-0005ky-LO
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55317)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqRt-00024O-MU
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:07:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqRs-00040y-1C
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:07:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55074
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqRr-00040V-Qe
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7cGot02nRRi0ZPDjFe9KWGgNNA0vm+nIgmhLwmAjqk=;
 b=CgeE8h1lL9HcdnvbFVlik0EyJxXnWxQaIJNHrILGF5MqmjM1oDnPGcsqF4N3igpSKNYC/k
 4eQV/D48+CryWg3kDHAHFCp9aoME/Xkjy9ECArRMAqDSAxoHgeVoYh+Lk8mXxaUOHVOjmu
 qQhn8PPrdnWCquL+s+/RpS349l7L1pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-hP629AO3OJKZh0ERJEh0pw-1; Tue, 07 Jan 2020 10:07:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D5B2107ACC4;
 Tue,  7 Jan 2020 15:07:09 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C10185C1B0;
 Tue,  7 Jan 2020 15:07:06 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/37] serial: start making SerialMM a sysbus device
Date: Tue,  7 Jan 2020 19:04:17 +0400
Message-Id: <20200107150442.1727958-13-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: hP629AO3OJKZh0ERJEh0pw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Memory mapped serial device is in fact a sysbus device. The following
patches will make use of sysbus facilities for resource and
registration. In particular, "serial-mm: use sysbus facilities" will
move internal serial realization to serial_mm_realize callback to
follow qdev best practices.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/serial.h | 20 ++++++++---
 hw/char/omap_uart.c      |  2 +-
 hw/char/serial.c         | 72 ++++++++++++++++++++++++++++++----------
 hw/mips/boston.c         |  2 +-
 hw/mips/mips_malta.c     |  2 +-
 5 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 548944b06a..730165347c 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -57,7 +57,6 @@ typedef struct SerialState {
     qemu_irq irq;
     CharBackend chr;
     int last_break_enable;
-    int it_shift;
     uint32_t baudbase;
     uint32_t tsr_retry;
     guint watch_tag;
@@ -80,6 +79,14 @@ typedef struct SerialState {
     MemoryRegion io;
 } SerialState;
=20
+typedef struct SerialMM {
+    SysBusDevice parent;
+
+    SerialState serial;
+
+    int it_shift;
+} SerialMM;
+
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
=20
@@ -88,12 +95,15 @@ void serial_set_frequency(SerialState *s, uint32_t freq=
uency);
 #define TYPE_SERIAL "serial"
 #define SERIAL(s) OBJECT_CHECK(SerialState, (s), TYPE_SERIAL)
=20
+#define TYPE_SERIAL_MM "serial-mm"
+#define SERIAL_MM(s) OBJECT_CHECK(SerialMM, (s), TYPE_SERIAL_MM)
+
 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
                          Chardev *chr, MemoryRegion *system_io);
-SerialState *serial_mm_init(MemoryRegion *address_space,
-                            hwaddr base, int it_shift,
-                            qemu_irq irq, int baudbase,
-                            Chardev *chr, enum device_endian end);
+SerialMM *serial_mm_init(MemoryRegion *address_space,
+                         hwaddr base, int it_shift,
+                         qemu_irq irq, int baudbase,
+                         Chardev *chr, enum device_endian end);
=20
 /* serial-isa.c */
=20
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index 13e4f43c4c..e8da933378 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -27,7 +27,7 @@
 struct omap_uart_s {
     MemoryRegion iomem;
     hwaddr base;
-    SerialState *serial; /* TODO */
+    SerialMM *serial; /* TODO */
     struct omap_target_agent_s *ta;
     omap_clk fclk;
     qemu_irq irq;
diff --git a/hw/char/serial.c b/hw/char/serial.c
index ec388f3876..824390817c 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1032,16 +1032,28 @@ static const TypeInfo serial_info =3D {
 static uint64_t serial_mm_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    SerialState *s =3D opaque;
-    return serial_ioport_read(s, addr >> s->it_shift, 1);
+    SerialMM *s =3D SERIAL_MM(opaque);
+    return serial_ioport_read(&s->serial, addr >> s->it_shift, 1);
 }
=20
 static void serial_mm_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    SerialState *s =3D opaque;
+    SerialMM *s =3D SERIAL_MM(opaque);
     value &=3D 255;
-    serial_ioport_write(s, addr >> s->it_shift, value, 1);
+    serial_ioport_write(&s->serial, addr >> s->it_shift, value, 1);
+}
+
+static void serial_mm_realize(DeviceState *dev, Error **errp)
+{
+    SerialMM *s =3D SERIAL_MM(dev);
+    Error *local_err =3D NULL;
+
+    object_property_set_bool(OBJECT(&s->serial), true, "realized", &local_=
err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 }
=20
 static const MemoryRegionOps serial_mm_ops[3] =3D {
@@ -1068,30 +1080,56 @@ static const MemoryRegionOps serial_mm_ops[3] =3D {
     },
 };
=20
-SerialState *serial_mm_init(MemoryRegion *address_space,
-                            hwaddr base, int it_shift,
-                            qemu_irq irq, int baudbase,
-                            Chardev *chr, enum device_endian end)
+SerialMM *serial_mm_init(MemoryRegion *address_space,
+                         hwaddr base, int it_shift,
+                         qemu_irq irq, int baudbase,
+                         Chardev *chr, enum device_endian end)
 {
-    DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
-    SerialState *s =3D SERIAL(dev);
+    SerialMM *smm =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
+    SerialState *s =3D &smm->serial;
=20
-    s->it_shift =3D it_shift;
+    smm->it_shift =3D it_shift;
     s->irq =3D irq;
-    qdev_prop_set_uint32(dev, "baudbase", baudbase);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    qdev_set_legacy_instance_id(dev, base, 2);
-    qdev_init_nofail(dev);
+    qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
+    qdev_prop_set_chr(DEVICE(s), "chardev", chr);
+    qdev_set_legacy_instance_id(DEVICE(s), base, 2);
=20
-    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], s,
+    qdev_init_nofail(DEVICE(smm));
+
+    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], smm,
                           "serial", 8 << it_shift);
     memory_region_add_subregion(address_space, base, &s->io);
-    return s;
+
+    return smm;
+}
+
+static void serial_mm_instance_init(Object *o)
+{
+    SerialMM *smm =3D SERIAL_MM(o);
+
+    object_initialize_child(o, "serial", &smm->serial, sizeof(smm->serial)=
,
+                            TYPE_SERIAL, &error_abort, NULL);
 }
=20
+static void serial_mm_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+
+    dc->realize =3D serial_mm_realize;
+}
+
+static const TypeInfo serial_mm_info =3D {
+    .name =3D TYPE_SERIAL_MM,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .class_init =3D serial_mm_class_init,
+    .instance_init =3D serial_mm_instance_init,
+    .instance_size =3D sizeof(SerialMM),
+};
+
 static void serial_register_types(void)
 {
     type_register_static(&serial_info);
+    type_register_static(&serial_mm_info);
 }
=20
 type_init(serial_register_types)
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index ca7d813a52..23fdd5ec6a 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -50,7 +50,7 @@ typedef struct {
=20
     MachineState *mach;
     MIPSCPSState cps;
-    SerialState *uart;
+    SerialMM *uart;
=20
     CharBackend lcd_display;
     char lcd_content[8];
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 783cd99848..ea92e5e27d 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -83,7 +83,7 @@ typedef struct {
     uint32_t i2csel;
     CharBackend display;
     char display_text[9];
-    SerialState *uart;
+    SerialMM *uart;
     bool display_inited;
 } MaltaFPGAState;
=20
--=20
2.25.0.rc1.20.g2443f3f80d


