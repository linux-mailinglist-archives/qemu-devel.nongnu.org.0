Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA68E248E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 22:27:28 +0200 (CEST)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNNE7-00030i-Aa
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 16:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVa-0003mY-RK
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKVW-0001hq-Lq
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:33:16 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33192
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKVV-0001h9-1t
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571851991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zajraj59pME0gi/ZjzC9D6McCl95VtlZ5ILronSxHvI=;
 b=dx6k6NSeeGomvqfM4qJWJzWRSnGpnUzDpl19KhEqYGMojPIQyozM3KXPtD/rc2WWz5B0Jy
 kb6KUOuBE/ApjsRM/tXq3dp/Lt0eRj5tse+h7+DXmd3HH8DX6SrAYKOiSSb4rUYsPQXJVe
 EexQyL1lxjpBfAqZpg+Wj0AUFL5vFFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-G8HF0DDTP1Oxa9UguFp5YA-1; Wed, 23 Oct 2019 13:33:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A99801E70;
 Wed, 23 Oct 2019 17:33:04 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD65D600CC;
 Wed, 23 Oct 2019 17:33:01 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/33] serial-pci-multi: factor out
 multi_serial_get_nr_ports
Date: Wed, 23 Oct 2019 19:31:26 +0200
Message-Id: <20191023173154.30051-6-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: G8HF0DDTP1Oxa9UguFp5YA-1
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

Reused in following patch.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/char/serial-pci-multi.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 5f13b5663b..6fa1cc6225 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -77,24 +77,26 @@ static void multi_serial_irq_mux(void *opaque, int n, i=
nt level)
     pci_set_irq(&pci->dev, pending);
 }
=20
+static int multi_serial_get_nr_ports(PCIDeviceClass *pc)
+{
+    switch (pc->device_id) {
+    case 0x0003:
+        return 2;
+    case 0x0004:
+        return 4;
+    }
+
+    g_assert_not_reached();
+}
+
+
 static void multi_serial_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCIDeviceClass *pc =3D PCI_DEVICE_GET_CLASS(dev);
     PCIMultiSerialState *pci =3D DO_UPCAST(PCIMultiSerialState, dev, dev);
     SerialState *s;
     Error *err =3D NULL;
-    int i, nr_ports =3D 0;
-
-    switch (pc->device_id) {
-    case 0x0003:
-        nr_ports =3D 2;
-        break;
-    case 0x0004:
-        nr_ports =3D 4;
-        break;
-    }
-    assert(nr_ports > 0);
-    assert(nr_ports <=3D PCI_SERIAL_MAX_PORTS);
+    int i, nr_ports =3D multi_serial_get_nr_ports(pc);
=20
     pci->dev.config[PCI_CLASS_PROG] =3D pci->prog_if;
     pci->dev.config[PCI_INTERRUPT_PIN] =3D 0x01;
--=20
2.23.0.606.g08da6496b6


