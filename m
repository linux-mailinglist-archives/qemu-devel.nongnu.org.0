Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F1127C06
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 14:54:04 +0100 (CET)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIjC-0005H7-Uy
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 08:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIeQ-0005wc-Aw
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIeO-0004kZ-O0
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34024
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIeN-0004e3-Fr
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssRYgZVk3HAHaa17z+VNAnV4jkpIBVdChd5cAW8AlF0=;
 b=WrIJQFBsYhNMjzxLx79MQzA+/Jd1NYcZ5wzKxkQAqiSziNbxoMq3GhS0N8qKLsru0fChxh
 YH1iTmcf6PwQU7jZYitvY+n6YwK5Vnc7IBM4Xo7A53g5/lF36xKuAw6WyRoqvcf7v5Q0C6
 3l5aK7pUBjQx0/aGJlQ5jIZu3Yuuswc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-lizQjrtgOuOZwodTuigSyQ-1; Fri, 20 Dec 2019 08:48:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CCC8805725;
 Fri, 20 Dec 2019 13:48:08 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C942426FC8;
 Fri, 20 Dec 2019 13:48:02 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/37] serial-mm: add "regshift" property
Date: Fri, 20 Dec 2019 17:45:37 +0400
Message-Id: <20191220134601.571905-14-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: lizQjrtgOuOZwodTuigSyQ-1
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And a property and rename "it_shift" field to "regshift", as it seems
to be more popular (and I don't know what "it" stands for).

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c         | 22 +++++++++++++++++-----
 include/hw/char/serial.h |  4 ++--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 905b84c25f..f60fc98efc 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -1033,7 +1033,7 @@ static uint64_t serial_mm_read(void *opaque, hwaddr a=
ddr,
                                unsigned size)
 {
     SerialMM *s =3D SERIAL_MM(opaque);
-    return serial_ioport_read(&s->serial, addr >> s->it_shift, 1);
+    return serial_ioport_read(&s->serial, addr >> s->regshift, 1);
 }
=20
 static void serial_mm_write(void *opaque, hwaddr addr,
@@ -1041,7 +1041,7 @@ static void serial_mm_write(void *opaque, hwaddr addr=
,
 {
     SerialMM *s =3D SERIAL_MM(opaque);
     value &=3D 255;
-    serial_ioport_write(&s->serial, addr >> s->it_shift, value, 1);
+    serial_ioport_write(&s->serial, addr >> s->regshift, value, 1);
 }
=20
 static void serial_mm_realize(DeviceState *dev, Error **errp)
@@ -1081,14 +1081,14 @@ static const MemoryRegionOps serial_mm_ops[3] =3D {
 };
=20
 SerialMM *serial_mm_init(MemoryRegion *address_space,
-                            hwaddr base, int it_shift,
+                            hwaddr base, int regshift,
                             qemu_irq irq, int baudbase,
                             Chardev *chr, enum device_endian end)
 {
     SerialMM *smm =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
     SerialState *s =3D &smm->serial;
=20
-    smm->it_shift =3D it_shift;
+    qdev_prop_set_uint8(DEVICE(smm), "regshift", regshift);
     s->irq =3D irq;
     qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
     qdev_prop_set_chr(DEVICE(s), "chardev", chr);
@@ -1097,7 +1097,7 @@ SerialMM *serial_mm_init(MemoryRegion *address_space,
     qdev_init_nofail(DEVICE(smm));
=20
     memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], smm,
-                          "serial", 8 << it_shift);
+                          "serial", 8 << regshift);
     memory_region_add_subregion(address_space, base, &s->io);
=20
     return smm;
@@ -1111,10 +1111,21 @@ static void serial_mm_instance_init(Object *o)
                             TYPE_SERIAL, &error_abort, NULL);
 }
=20
+static Property serial_mm_properties[] =3D {
+    /*
+     * Set the spacing between adjacent memory-mapped UART registers.
+     * Each register will be at (1 << regshift) bytes after the
+     * previous one.
+     */
+    DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void serial_mm_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(oc);
=20
+    dc->props =3D serial_mm_properties;
     dc->realize =3D serial_mm_realize;
 }
=20
@@ -1124,6 +1135,7 @@ static const TypeInfo serial_mm_info =3D {
     .class_init =3D serial_mm_class_init,
     .instance_init =3D serial_mm_instance_init,
     .instance_size =3D sizeof(SerialMM),
+    .class_init =3D serial_mm_class_init,
 };
=20
 static void serial_register_types(void)
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 730165347c..eaeda62698 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -84,7 +84,7 @@ typedef struct SerialMM {
=20
     SerialState serial;
=20
-    int it_shift;
+    uint8_t regshift;
 } SerialMM;
=20
 extern const VMStateDescription vmstate_serial;
@@ -101,7 +101,7 @@ void serial_set_frequency(SerialState *s, uint32_t freq=
uency);
 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
                          Chardev *chr, MemoryRegion *system_io);
 SerialMM *serial_mm_init(MemoryRegion *address_space,
-                         hwaddr base, int it_shift,
+                         hwaddr base, int regshift,
                          qemu_irq irq, int baudbase,
                          Chardev *chr, enum device_endian end);
=20
--=20
2.24.0.308.g228f53135a


