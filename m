Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF060E2239
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 19:59:48 +0200 (CEST)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNKvD-0006j2-44
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 13:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWG-0004ZL-Qd
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWE-0001yi-Ji
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54035
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWC-0001xl-PU
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRite+vl5jz2FF+8XoR6bPNhYMKeLGlosqF+gjrYS7s=;
 b=VY8FvmcCjphRLyxhvo2FxX+5Uj7kxmjWaZOMIBRPXM7l118yVygJvdA9JPwXvXJHLAQ9vu
 Er1uVFBCd/QRNCWPPCFvAnJnYvcgVyrVuSh4xXhB8dq69dIEVMlRGzkmLmN94igmbTp1Zj
 07iHcUX1KLHCky4gYIs4IdF6rL8cZy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-hQxgoaiWMu2fUIbUkdakJA-1; Wed, 23 Oct 2019 13:33:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55885800D5B;
 Wed, 23 Oct 2019 17:33:46 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E9ED60BE1;
 Wed, 23 Oct 2019 17:33:43 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/33] serial: replace serial_exit_core() with unrealize
Date: Wed, 23 Oct 2019 19:31:33 +0200
Message-Id: <20191023173154.30051-13-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: hQxgoaiWMu2fUIbUkdakJA-1
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

Instead of calling serial_exit_core() directly, use the QDev unrealize
callback.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial-pci-multi.c | 2 +-
 hw/char/serial-pci.c       | 2 +-
 hw/char/serial.c           | 5 ++++-
 include/hw/char/serial.h   | 1 -
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 60c1c948b8..a3200555aa 100644
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
index 35a8552674..54bdd98325 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -69,7 +69,7 @@ static void serial_pci_exit(PCIDevice *dev)
     PCISerialState *pci =3D DO_UPCAST(PCISerialState, dev, dev);
     SerialState *s =3D &pci->state;
=20
-    serial_exit_core(s);
+    object_property_set_bool(OBJECT(s), false, "realized", NULL);
     qemu_free_irq(s->irq);
 }
=20
diff --git a/hw/char/serial.c b/hw/char/serial.c
index bf34d9594e..667570e310 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -951,8 +951,10 @@ static void serial_realize(DeviceState *dev, Error **e=
rrp)
     qdev_set_legacy_instance_id(dev, s->instance_id, 2);
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
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D serial_realize;
+    dc->unrealize =3D serial_unrealize;
     dc->vmsd =3D &vmstate_serial;
     dc->props =3D serial_properties;
 }
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index b445df5951..7cc6304f1d 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -84,7 +84,6 @@ typedef struct SerialState {
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
=20
-void serial_exit_core(SerialState *s);
 void serial_set_frequency(SerialState *s, uint32_t frequency);
=20
 #define TYPE_SERIAL "serial"
--=20
2.23.0.606.g08da6496b6


