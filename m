Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D3E08FC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 18:34:43 +0200 (CEST)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMx7J-00022L-Na
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwD-0007DF-N3
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwC-0007P7-HN
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:23:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23254
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwwC-0007Os-E1
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1rPskYU5vj4M1/465B4c77t8MStTF9x/Q9ixzfNsR0=;
 b=NSeVYsJ1tEg2iFCmEoIuMA4O/S5Rctwvpc3LAfX54je60pD1VUkFlT1EA9ocluMok4SGEl
 JvVj6SDanaYuAGQioj3QHYPLbOI5YJZbRq6wrgpW0R5zk2B527IxJR74pNcbBv+RRfVgY8
 jbjMMnnQQ9Typ0W0VOaM69p2WqVxH7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-4ztXjkN1PU-e-DFC0G_N_Q-1; Tue, 22 Oct 2019 12:23:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8FF4476;
 Tue, 22 Oct 2019 16:23:05 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A04E67C96;
 Tue, 22 Oct 2019 16:23:03 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/28] serial: add "base" property
Date: Tue, 22 Oct 2019 18:21:19 +0200
Message-Id: <20191022162137.27161-11-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 4ztXjkN1PU-e-DFC0G_N_Q-1
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

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial.c         | 3 +++
 include/hw/char/serial.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 0ae52ec60c..4748a2b023 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -990,6 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     qdev_connect_gpio_out_named(dev, "serial-irq", 0, irq);
     qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_prop_set_uint64(dev, "base", base);
     serial_realize_core(s, &error_fatal);
     qdev_set_legacy_instance_id(dev, base, 2);
     qdev_init_nofail(dev);
@@ -1003,6 +1004,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
 static Property serial_properties[] =3D {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
     DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
+    DEFINE_PROP_UINT64("base", SerialState, base, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -1083,6 +1085,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
     qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
     qdev_prop_set_uint8(dev, "regshift", regshift);
+    qdev_prop_set_uint64(dev, "base", base);
=20
     serial_realize_core(s, &error_fatal);
     qdev_set_legacy_instance_id(DEVICE(s), base, 2);
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index ecbd3f1b40..6e9c9768ed 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -77,6 +77,7 @@ typedef struct SerialState {
=20
     QEMUTimer *modem_status_poll;
     MemoryRegion io;
+    uint64_t base;
 } SerialState;
=20
 typedef struct SerialMMState {
--=20
2.23.0.606.g08da6496b6


