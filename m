Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172D9DC986
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 17:50:23 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLUWD-0006CV-Ch
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 11:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOf-0008Ij-Qc
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOe-0006DI-JM
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:42:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUOb-0006AN-WB; Fri, 18 Oct 2019 11:42:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0832281F19;
 Fri, 18 Oct 2019 15:42:29 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E33658BE;
 Fri, 18 Oct 2019 15:42:28 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/14] vmmouse: replace PROP_PTR with PROP_LINK
Date: Fri, 18 Oct 2019 17:42:00 +0200
Message-Id: <20191018154212.13458-3-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 18 Oct 2019 15:42:29 +0000 (UTC)
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While at it, use the expected type.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/i386/pc.c             | 6 +++---
 hw/i386/vmmouse.c        | 8 +++-----
 hw/input/pckbd.c         | 8 +++-----
 include/hw/input/i8042.h | 4 +++-
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4b1904237e..ada1ea8802 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1861,9 +1861,9 @@ static void pc_superio_init(ISABus *isa_bus, bool c=
reate_fdctrl, bool no_vmport)
         vmmouse =3D NULL;
     }
     if (vmmouse) {
-        DeviceState *dev =3D DEVICE(vmmouse);
-        qdev_prop_set_ptr(dev, "ps2_mouse", i8042);
-        qdev_init_nofail(dev);
+        object_property_set_link(OBJECT(vmmouse), OBJECT(i8042),
+                                 "i8042", &error_abort);
+        qdev_init_nofail(DEVICE(vmmouse));
     }
     port92 =3D isa_create_simple(isa_bus, "port92");
=20
diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index 41ad91ad53..c0c329f817 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -66,7 +66,7 @@ typedef struct VMMouseState
     uint16_t status;
     uint8_t absolute;
     QEMUPutMouseEntry *entry;
-    void *ps2_mouse;
+    ISAKBDState *i8042;
 } VMMouseState;
=20
 static uint32_t vmmouse_get_status(VMMouseState *s)
@@ -105,7 +105,7 @@ static void vmmouse_mouse_event(void *opaque, int x, =
int y, int dz, int buttons_
=20
     /* need to still generate PS2 events to notify driver to
        read from queue */
-    i8042_isa_mouse_fake_event(s->ps2_mouse);
+    i8042_isa_mouse_fake_event(s->i8042);
 }
=20
 static void vmmouse_remove_handler(VMMouseState *s)
@@ -275,7 +275,7 @@ static void vmmouse_realizefn(DeviceState *dev, Error=
 **errp)
 }
=20
 static Property vmmouse_properties[] =3D {
-    DEFINE_PROP_PTR("ps2_mouse", VMMouseState, ps2_mouse),
+    DEFINE_PROP_LINK("i8042", VMMouseState, i8042, TYPE_I8042, ISAKBDSta=
te *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -287,8 +287,6 @@ static void vmmouse_class_initfn(ObjectClass *klass, =
void *data)
     dc->reset =3D vmmouse_reset;
     dc->vmsd =3D &vmstate_vmmouse;
     dc->props =3D vmmouse_properties;
-    /* Reason: pointer property "ps2_mouse" */
-    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo vmmouse_info =3D {
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f0acfd86f7..9b641021c9 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -483,17 +483,15 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse=
_irq,
=20
 #define I8042(obj) OBJECT_CHECK(ISAKBDState, (obj), TYPE_I8042)
=20
-typedef struct ISAKBDState {
+struct ISAKBDState {
     ISADevice parent_obj;
=20
     KBDState kbd;
     MemoryRegion io[2];
-} ISAKBDState;
+};
=20
-void i8042_isa_mouse_fake_event(void *opaque)
+void i8042_isa_mouse_fake_event(ISAKBDState *isa)
 {
-    ISADevice *dev =3D opaque;
-    ISAKBDState *isa =3D I8042(dev);
     KBDState *s =3D &isa->kbd;
=20
     ps2_mouse_fake_event(s->mouse);
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 246e6f3335..8eaebf50ce 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -14,10 +14,12 @@
=20
 #define I8042_A20_LINE "a20"
=20
+typedef struct ISAKBDState ISAKBDState;
+
 void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask);
-void i8042_isa_mouse_fake_event(void *opaque);
+void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
=20
 #endif /* HW_INPUT_I8042_H */
--=20
2.23.0.606.g08da6496b6


