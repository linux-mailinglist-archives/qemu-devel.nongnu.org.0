Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C6E227B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 20:28:15 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNLMk-0003aC-5q
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 14:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWp-0005As-Rt
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWo-0002Bh-Du
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59265
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWo-0002BZ-7M
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bwf4ikrdlBZFX6thQR+14nF8K385JSSSqeLqKBjP7UA=;
 b=HeOubypumi8DAITUZ9K1tiRd5ri3ZezDEPFyrvBJvz3rHiqeQ69baXbDryZNrLG0RNBRPO
 6VJVCBAx6BQla/OaN1TN0zhVPBPrB37m7PhrkYsY9poJkKywU9L/IDInH69FZsa/9//L6t
 ba+0wZZMwEmCssi9M5hojt2W9/MQHcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-v2d1_4hONFmywx0OjMeW5w-1; Wed, 23 Oct 2019 13:34:30 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8AD6801E70;
 Wed, 23 Oct 2019 17:34:27 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B1315DC18;
 Wed, 23 Oct 2019 17:34:26 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/33] vmmouse: replace PROP_PTR with PROP_LINK
Date: Wed, 23 Oct 2019 19:31:41 +0200
Message-Id: <20191023173154.30051-21-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: v2d1_4hONFmywx0OjMeW5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc.c             | 6 +++---
 hw/i386/vmmouse.c        | 8 +++-----
 hw/input/pckbd.c         | 8 +++-----
 include/hw/input/i8042.h | 4 +++-
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 00ee16ccab..021ec8c593 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1861,9 +1861,9 @@ static void pc_superio_init(ISABus *isa_bus, bool cre=
ate_fdctrl, bool no_vmport)
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
@@ -105,7 +105,7 @@ static void vmmouse_mouse_event(void *opaque, int x, in=
t y, int dz, int buttons_
=20
     /* need to still generate PS2 events to notify driver to
        read from queue */
-    i8042_isa_mouse_fake_event(s->ps2_mouse);
+    i8042_isa_mouse_fake_event(s->i8042);
 }
=20
 static void vmmouse_remove_handler(VMMouseState *s)
@@ -275,7 +275,7 @@ static void vmmouse_realizefn(DeviceState *dev, Error *=
*errp)
 }
=20
 static Property vmmouse_properties[] =3D {
-    DEFINE_PROP_PTR("ps2_mouse", VMMouseState, ps2_mouse),
+    DEFINE_PROP_LINK("i8042", VMMouseState, i8042, TYPE_I8042, ISAKBDState=
 *),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -287,8 +287,6 @@ static void vmmouse_class_initfn(ObjectClass *klass, vo=
id *data)
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
@@ -483,17 +483,15 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_i=
rq,
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


