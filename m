Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7881329D0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:17:58 +0100 (CET)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqcG-00039E-AN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqRk-0001oo-6i
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:07:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqRi-0003tc-TB
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:07:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35251
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqRi-0003tR-PD
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Wm5JXV26MNfLSJnGEn56duOnvwT7wbzw95nAqK6jGg=;
 b=YexHKWocuut+2Lp9mvmLLxBQZZMjITVwR8k45GLhlvcY2crDb6eNGB7SNWkVRndl6nHX17
 d7KymNs3LVCl8sM04kCOsAcfTGyHVfApIaX1RS0yUN1BdeRyDojYlVw7ch/hgW/ABVsUaU
 d9OyylZ5u9Lc2IJGn2dIV42jKEByODk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-xlnsNtazPd6M9PqONbbDow-1; Tue, 07 Jan 2020 10:07:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CB61800D4E;
 Tue,  7 Jan 2020 15:07:00 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0B105C1B0;
 Tue,  7 Jan 2020 15:06:53 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/37] serial: replace serial_exit_core() with unrealize
Date: Tue,  7 Jan 2020 19:04:16 +0400
Message-Id: <20200107150442.1727958-12-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: xlnsNtazPd6M9PqONbbDow-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

Instead of calling serial_exit_core() directly, use the QDev unrealize
callback.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/char/serial.h   | 1 -
 hw/char/serial-pci-multi.c | 2 +-
 hw/char/serial-pci.c       | 2 +-
 hw/char/serial.c           | 5 ++++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 571aab97c8..548944b06a 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -83,7 +83,6 @@ typedef struct SerialState {
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
=20
-void serial_exit_core(SerialState *s);
 void serial_set_frequency(SerialState *s, uint32_t frequency);
=20
 #define TYPE_SERIAL "serial"
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 0e1fdb75d2..e343a1235c 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -56,7 +56,7 @@ static void multi_serial_pci_exit(PCIDevice *dev)
=20
     for (i =3D 0; i < pci->ports; i++) {
         s =3D pci->state + i;
-        serial_exit_core(s);
+        object_property_set_bool(OBJECT(s), false, "realized", NULL);
         memory_region_del_subregion(&pci->iobar, &s->io);
         g_free(pci->name[i]);
     }
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 4b6a217365..b6a73c65a9 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -68,7 +68,7 @@ static void serial_pci_exit(PCIDevice *dev)
     PCISerialState *pci =3D DO_UPCAST(PCISerialState, dev, dev);
     SerialState *s =3D &pci->state;
=20
-    serial_exit_core(s);
+    object_property_set_bool(OBJECT(s), false, "realized", NULL);
     qemu_free_irq(s->irq);
 }
=20
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 8328cc62c3..ec388f3876 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -950,8 +950,10 @@ static void serial_realize(DeviceState *dev, Error **e=
rrp)
     serial_reset(s);
 }
=20
-void serial_exit_core(SerialState *s)
+static void serial_unrealize(DeviceState *dev, Error **errp)
 {
+    SerialState *s =3D SERIAL(dev);
+
     qemu_chr_fe_deinit(&s->chr, false);
=20
     timer_del(s->modem_status_poll);
@@ -1014,6 +1016,7 @@ static void serial_class_init(ObjectClass *klass, voi=
d* data)
     /* internal device for serialio/serialmm, not user-creatable */
     dc->user_creatable =3D false;
     dc->realize =3D serial_realize;
+    dc->unrealize =3D serial_unrealize;
     dc->vmsd =3D &vmstate_serial;
     dc->props =3D serial_properties;
 }
--=20
2.25.0.rc1.20.g2443f3f80d


