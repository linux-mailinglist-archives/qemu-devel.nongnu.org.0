Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A39DC9AC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 17:50:40 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLUWU-0006ar-Ej
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 11:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOi-0008Ng-EV
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOh-0006Fl-Ch
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:42:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUOe-0006Cp-Go; Fri, 18 Oct 2019 11:42:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 96DAC51EE9;
 Fri, 18 Oct 2019 15:42:31 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E0A558B9;
 Fri, 18 Oct 2019 15:42:30 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/14] lance: replace PROP_PTR with PROP_LINK
Date: Fri, 18 Oct 2019 17:42:01 +0200
Message-Id: <20191018154212.13458-4-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 18 Oct 2019 15:42:31 +0000 (UTC)
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

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/dma/sparc32_dma.c | 2 +-
 hw/net/lance.c       | 5 ++---
 hw/net/pcnet-pci.c   | 2 +-
 hw/net/pcnet.h       | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 0e5bbcdc7f..3e4da0c47f 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -346,7 +346,7 @@ static void sparc32_ledma_device_realize(DeviceState =
*dev, Error **errp)
     d =3D qdev_create(NULL, TYPE_LANCE);
     object_property_add_child(OBJECT(dev), "lance", OBJECT(d), errp);
     qdev_set_nic_properties(d, nd);
-    qdev_prop_set_ptr(d, "dma", dev);
+    object_property_set_link(OBJECT(d), OBJECT(dev), "dma", errp);
     qdev_init_nofail(d);
 }
=20
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 6631e2a4e0..4d96299041 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -138,7 +138,8 @@ static void lance_instance_init(Object *obj)
 }
=20
 static Property lance_properties[] =3D {
-    DEFINE_PROP_PTR("dma", SysBusPCNetState, state.dma_opaque),
+    DEFINE_PROP_LINK("dma", SysBusPCNetState, state.dma_opaque,
+                     TYPE_DEVICE, DeviceState *),
     DEFINE_NIC_PROPERTIES(SysBusPCNetState, state.conf),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -153,8 +154,6 @@ static void lance_class_init(ObjectClass *klass, void=
 *data)
     dc->reset =3D lance_reset;
     dc->vmsd =3D &vmstate_lance;
     dc->props =3D lance_properties;
-    /* Reason: pointer property "dma" */
-    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo lance_info =3D {
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 4723c30c79..d067d21e2c 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -231,7 +231,7 @@ static void pci_pcnet_realize(PCIDevice *pci_dev, Err=
or **errp)
     s->irq =3D pci_allocate_irq(pci_dev);
     s->phys_mem_read =3D pci_physical_memory_read;
     s->phys_mem_write =3D pci_physical_memory_write;
-    s->dma_opaque =3D pci_dev;
+    s->dma_opaque =3D DEVICE(pci_dev);
=20
     pcnet_common_init(DEVICE(pci_dev), s, &net_pci_pcnet_info);
 }
diff --git a/hw/net/pcnet.h b/hw/net/pcnet.h
index 28d19a5c6f..f49b213c57 100644
--- a/hw/net/pcnet.h
+++ b/hw/net/pcnet.h
@@ -50,7 +50,7 @@ struct PCNetState_st {
                          uint8_t *buf, int len, int do_bswap);
     void (*phys_mem_write)(void *dma_opaque, hwaddr addr,
                           uint8_t *buf, int len, int do_bswap);
-    void *dma_opaque;
+    DeviceState *dma_opaque;
     int tx_busy;
     int looptest;
 };
--=20
2.23.0.606.g08da6496b6


