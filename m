Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E7E2256
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 20:11:00 +0200 (CEST)
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNL63-0006uh-1S
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 14:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWs-0005BV-4L
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKWp-0002Co-O0
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54264
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWp-0002C8-D4
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 13:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRcevYlv0dVgCjvswi8iWE9SF8YIZpxrJoGckyI6E5E=;
 b=PNmXoEOv2acHPPYJChDUDzFf1WAE6UXZfZwj73lVd3oLLaKHSYV53SLs4BYpK6sGtCL2Fd
 MZK7Pxp5zEq2OO/h9wC2hmOGmnFq9k7d5lAvbordtq4TsvXzx3l7df4A0DX3EI86u5cwaR
 iy8ZkwDP2naKPeLlbYn2g0KHc5qpNqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-y_YU16iLOl23DKjRYuNApg-1; Wed, 23 Oct 2019 13:34:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F06C5E9;
 Wed, 23 Oct 2019 17:34:29 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D8035DC18;
 Wed, 23 Oct 2019 17:34:28 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/33] lance: replace PROP_PTR with PROP_LINK
Date: Wed, 23 Oct 2019 19:31:42 +0200
Message-Id: <20191023173154.30051-22-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: y_YU16iLOl23DKjRYuNApg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
@@ -346,7 +346,7 @@ static void sparc32_ledma_device_realize(DeviceState *d=
ev, Error **errp)
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
@@ -153,8 +154,6 @@ static void lance_class_init(ObjectClass *klass, void *=
data)
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
@@ -231,7 +231,7 @@ static void pci_pcnet_realize(PCIDevice *pci_dev, Error=
 **errp)
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


