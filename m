Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CB1329AA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:11:29 +0100 (CET)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqW0-0007el-GW
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqRO-00013f-7E
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:06:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqRN-0003fd-1v
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:06:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57491
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqRM-0003fS-UU
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbd077mADMq3Qk1T2Bphiylzf67SiuodTtJ34Vp4XAc=;
 b=imE+V8tr2ghPuZFvmHEqVoghyLNYBTPbv0J7Za9hMSniIPK9F63eDuTkU0trtUiSQGjHS4
 B94SeAebGd8C6ErD+a8e12Wiasr9I+a2dacaCdJORftQwMug2KiIgNgGLus8SKXI/CkmwB
 Mz+S45RTl3xfnycZ8K1rdGY5s/CP/ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-E9DKOHozPRu_vUOmjmJFpg-1; Tue, 07 Jan 2020 10:06:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5E7477;
 Tue,  7 Jan 2020 15:06:36 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35E28858B9;
 Tue,  7 Jan 2020 15:06:29 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/37] serial: add "baudbase" property
Date: Tue,  7 Jan 2020 19:04:14 +0400
Message-Id: <20200107150442.1727958-10-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: E9DKOHozPRu_vUOmjmJFpg-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/serial.h   | 2 +-
 hw/char/serial-isa.c       | 1 -
 hw/char/serial-pci-multi.c | 1 -
 hw/char/serial-pci.c       | 1 -
 hw/char/serial.c           | 5 +++--
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 180cc7c24e..3dc618598e 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -58,7 +58,7 @@ typedef struct SerialState {
     CharBackend chr;
     int last_break_enable;
     int it_shift;
-    int baudbase;
+    uint32_t baudbase;
     uint32_t tsr_retry;
     guint watch_tag;
     uint32_t wakeup;
diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 9a5928b3ee..2a4c8de1bf 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -73,7 +73,6 @@ static void serial_isa_realizefn(DeviceState *dev, Error =
**errp)
     }
     index++;
=20
-    s->baudbase =3D 115200;
     isa_init_irq(isadev, &s->irq, isa->isairq);
     serial_realize_core(s, errp);
     qdev_set_legacy_instance_id(dev, isa->iobase, 3);
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index edfbfdca9e..4891f32230 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -106,7 +106,6 @@ static void multi_serial_pci_realize(PCIDevice *dev, Er=
ror **errp)
=20
     for (i =3D 0; i < nports; i++) {
         s =3D pci->state + i;
-        s->baudbase =3D 115200;
         serial_realize_core(s, &err);
         if (err !=3D NULL) {
             error_propagate(errp, err);
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index f99b6c19e0..db2c17aafd 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -49,7 +49,6 @@ static void serial_pci_realize(PCIDevice *dev, Error **er=
rp)
     SerialState *s =3D &pci->state;
     Error *err =3D NULL;
=20
-    s->baudbase =3D 115200;
     serial_realize_core(s, &err);
     if (err !=3D NULL) {
         error_propagate(errp, err);
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 1746dbc1c4..a4f0566865 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -988,7 +988,7 @@ SerialState *serial_init(int base, qemu_irq irq, int ba=
udbase,
     SerialState *s =3D SERIAL(dev);
=20
     s->irq =3D irq;
-    s->baudbase =3D baudbase;
+    qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
     serial_realize_core(s, &error_fatal);
     qdev_set_legacy_instance_id(dev, base, 2);
@@ -1002,6 +1002,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
=20
 static Property serial_properties[] =3D {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
+    DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -1072,7 +1073,7 @@ SerialState *serial_mm_init(MemoryRegion *address_spa=
ce,
=20
     s->it_shift =3D it_shift;
     s->irq =3D irq;
-    s->baudbase =3D baudbase;
+    qdev_prop_set_uint32(dev, "baudbase", baudbase);
     qdev_prop_set_chr(dev, "chardev", chr);
=20
     serial_realize_core(s, &error_fatal);
--=20
2.25.0.rc1.20.g2443f3f80d


