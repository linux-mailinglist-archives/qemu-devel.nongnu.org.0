Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E11E08E7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 18:34:04 +0200 (CEST)
Received: from localhost ([::1]:35764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMx6h-0001FD-4h
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 12:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMww5-00079f-9m
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:23:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMww4-0007Lz-6Q
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:23:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29747
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMww2-0007LG-89
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8VliOfXNriDMO2dKLePabRm6Hq+1WtEx9pktGTynxQ=;
 b=WreBdHm8TmwfYsl/qVs8MVWmYzX0E+SupgWFp30SGADt7FeE5BpFO8MjjIGj9JbmTkyU/N
 OEK977RyAdJd/Zf9cvcKmJtSEDeCi0j2UruDK5A4EtDS31FJMYnPX2vAexRpIT/JOz1ibE
 zNZSqKyJHIu4OCGIedtGIzce0gK5884=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-tDR0K_S9MieNkKv5EgLOsw-1; Tue, 22 Oct 2019 12:22:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA6F3107AD31;
 Tue, 22 Oct 2019 16:22:55 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEA6119C4F;
 Tue, 22 Oct 2019 16:22:49 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/28] serial: convert irq to qdev gpio properties
Date: Tue, 22 Oct 2019 18:21:17 +0200
Message-Id: <20191022162137.27161-9-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: tDR0K_S9MieNkKv5EgLOsw-1
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

Use qdev facility for IRQ handling.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 18ca79ccf3..7bc7c4370b 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -987,7 +987,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     DeviceState *dev =3D DEVICE(object_new(TYPE_SERIAL));
     SerialState *s =3D SERIAL(dev);
=20
-    s->irq =3D irq;
+    qdev_connect_gpio_out_named(dev, "serial-irq", 0, irq);
     s->baudbase =3D baudbase;
     qdev_prop_set_chr(dev, "chardev", chr);
     serial_realize_core(s, &error_fatal);
@@ -1014,10 +1014,18 @@ static void serial_class_init(ObjectClass *klass, v=
oid* data)
     dc->props =3D serial_properties;
 }
=20
+static void serial_instance_init(Object *o)
+{
+    SerialState *s =3D SERIAL(o);
+
+    qdev_init_gpio_out_named(DEVICE(o), &s->irq, "serial-irq", 1);
+}
+
 static const TypeInfo serial_info =3D {
     .name =3D TYPE_SERIAL,
     .parent =3D TYPE_DEVICE,
     .instance_size =3D sizeof(SerialState),
+    .instance_init =3D serial_instance_init,
     .class_init =3D serial_class_init,
 };
=20
@@ -1070,7 +1078,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     SerialMMState *m =3D SERIAL_MM(dev);
     SerialState *s =3D SERIAL(dev);
=20
-    s->irq =3D irq;
+    qdev_connect_gpio_out_named(dev, "serial-irq", 0, irq);
     s->baudbase =3D baudbase;
     qdev_prop_set_chr(dev, "chardev", chr);
     qdev_prop_set_uint8(dev, "regshift", regshift);
--=20
2.23.0.606.g08da6496b6


