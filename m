Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E345E08DB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 18:29:16 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMx22-0005LH-WE
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 12:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwvj-0006mO-JS
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwvi-0007GI-Gc
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:22:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23701
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwvi-0007G0-Ch
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNSfGB2VMahfw2vWY6ffZf80Mf9JtP1HzLfUWy8LxMI=;
 b=HpMnZM9Ra79zW7Y2q3MqgICIpX611NTRwHAdHy/h2tN0QhA3bKlHJGRes9T/IdSQLSILYS
 Zd8PZ+kn15+TsqIxcuLB7QUCIV9wgVILVQebsidfuM9Bjm1X2FEN585KvOQFd6FlNeuobs
 Y1RjRMs9P6sX6f/PWvBgKUh5O3NnLsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-caVGRD2PPrCnqTVI1p6-dg-1; Tue, 22 Oct 2019 12:22:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DBFD1800D6A;
 Tue, 22 Oct 2019 16:22:34 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A6D260856;
 Tue, 22 Oct 2019 16:22:27 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/28] serial: add and set "chardev" property
Date: Tue, 22 Oct 2019 18:21:14 +0200
Message-Id: <20191022162137.27161-6-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: caVGRD2PPrCnqTVI1p6-dg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

This is more QOM-friendly, callers may set/get the property themself.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 143e39c1b1..b623c4e79f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -34,6 +34,7 @@
 #include "sysemu/runstate.h"
 #include "qemu/error-report.h"
 #include "trace.h"
+#include "hw/qdev-properties.h"
=20
 //#define DEBUG_SERIAL
=20
@@ -988,7 +989,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
=20
     s->irq =3D irq;
     s->baudbase =3D baudbase;
-    qemu_chr_fe_init(&s->chr, chr, &error_abort);
+    qdev_prop_set_chr(dev, "chardev", chr);
     serial_realize_core(s, &error_fatal);
     qdev_set_legacy_instance_id(dev, base, 2);
     qdev_init_nofail(dev);
@@ -999,12 +1000,18 @@ SerialState *serial_init(int base, qemu_irq irq, int=
 baudbase,
     return s;
 }
=20
+static Property serial_properties[] =3D {
+    DEFINE_PROP_CHR("chardev", SerialState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void serial_class_init(ObjectClass *klass, void* data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->user_creatable =3D false;
     dc->vmsd =3D &vmstate_serial;
+    dc->props =3D serial_properties;
 }
=20
 static const TypeInfo serial_info =3D {
@@ -1065,7 +1072,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     s->it_shift =3D it_shift;
     s->irq =3D irq;
     s->baudbase =3D baudbase;
-    qemu_chr_fe_init(&s->chr, chr, &error_abort);
+    qdev_prop_set_chr(dev, "chardev", chr);
=20
     serial_realize_core(s, &error_fatal);
     qdev_set_legacy_instance_id(DEVICE(s), base, 2);
--=20
2.23.0.606.g08da6496b6


