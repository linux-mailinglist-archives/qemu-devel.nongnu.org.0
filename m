Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F646132A27
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:39:36 +0100 (CET)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqxC-00055z-Hz
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqTq-00066s-Nv
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqTp-0005PK-Di
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55854
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqTp-0005Oa-A3
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWU06SAb2lQ4co3U/MTSi0noVCyj/2NfrdawA6tKgIk=;
 b=F+CKXFecLxCKhbBhOV/+d8FFj6usa18SxzIHdjQ/MtcDCN8RYONzsp/Aed6Ldw8NcRdQXH
 77UI3mSFHNgmxErlvwn1ASF3HU01dZ0bWr+rE1594U1zz9hMiFh/obuS9GYFHYIbejH4om
 kWUnAK5c4Qcfk4XwEC7xutJxy9vjits=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-FWLcTUPUNbeLdjWWG_KppQ-1; Tue, 07 Jan 2020 10:09:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585F3800D41;
 Tue,  7 Jan 2020 15:09:04 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F41CE7C82C;
 Tue,  7 Jan 2020 15:08:57 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/37] sm501: make SerialMM a child, export chardev property
Date: Tue,  7 Jan 2020 19:04:26 +0400
Message-Id: <20200107150442.1727958-22-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: FWLcTUPUNbeLdjWWG_KppQ-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Embed the SerialMM sybus device, and re-export its "chardev" property.
That way, we can get rid of PROP_PTR "chr-state" and better track
devices relationship.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501.c | 29 +++++++++++++++++++++--------
 hw/sh4/r2d.c       |  2 +-
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 79bd7bc2d1..66a1bfbe60 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1930,7 +1930,7 @@ typedef struct {
     SM501State state;
     uint32_t vram_size;
     uint32_t base;
-    void *chr_state;
+    SerialMM serial;
 } SM501SysBusState;
=20
 static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
@@ -1938,6 +1938,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Er=
ror **errp)
     SM501SysBusState *s =3D SYSBUS_SM501(dev);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     DeviceState *usb_dev;
+    MemoryRegion *mr;
=20
     sm501_init(&s->state, dev, s->vram_size);
     if (get_local_mem_size(&s->state) !=3D s->vram_size) {
@@ -1958,15 +1959,15 @@ static void sm501_realize_sysbus(DeviceState *dev, =
Error **errp)
     sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
=20
     /* bridge to serial emulation module */
-    serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
-                   NULL, /* TODO : chain irq to IRL */
-                   115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
+    qdev_init_nofail(DEVICE(&s->serial));
+    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial), 0);
+    memory_region_add_subregion(&s->state.mmio_region, SM501_UART0, mr);
+    /* TODO : chain irq to IRL */
 }
=20
 static Property sm501_sysbus_properties[] =3D {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
     DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
-    DEFINE_PROP_PTR("chr-state", SM501SysBusState, chr_state),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -1997,9 +1998,20 @@ static void sm501_sysbus_class_init(ObjectClass *kla=
ss, void *data)
     dc->props =3D sm501_sysbus_properties;
     dc->reset =3D sm501_reset_sysbus;
     dc->vmsd =3D &vmstate_sm501_sysbus;
-    /* Note: pointer property "chr-state" may remain null, thus
-     * no need for dc->user_creatable =3D false;
-     */
+}
+
+static void sm501_sysbus_init(Object *o)
+{
+    SM501SysBusState *sm501 =3D SYSBUS_SM501(o);
+    SerialMM *smm =3D &sm501->serial;
+
+    sysbus_init_child_obj(o, "serial", smm, sizeof(SerialMM), TYPE_SERIAL_=
MM);
+    qdev_set_legacy_instance_id(DEVICE(smm), SM501_UART0, 2);
+    qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
+    qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
+
+    object_property_add_alias(o, "chardev",
+                              OBJECT(smm), "chardev", &error_abort);
 }
=20
 static const TypeInfo sm501_sysbus_info =3D {
@@ -2007,6 +2019,7 @@ static const TypeInfo sm501_sysbus_info =3D {
     .parent        =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(SM501SysBusState),
     .class_init    =3D sm501_sysbus_class_init,
+    .instance_init =3D sm501_sysbus_init,
 };
=20
 #define TYPE_PCI_SM501 "sm501"
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index ee0840f380..72bb5285cc 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -272,7 +272,7 @@ static void r2d_init(MachineState *machine)
     busdev =3D SYS_BUS_DEVICE(dev);
     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
     qdev_prop_set_uint32(dev, "base", 0x10000000);
-    qdev_prop_set_ptr(dev, "chr-state", serial_hd(2));
+    qdev_prop_set_chr(dev, "chardev", serial_hd(2));
     qdev_init_nofail(dev);
     sysbus_mmio_map(busdev, 0, 0x10000000);
     sysbus_mmio_map(busdev, 1, 0x13e00000);
--=20
2.25.0.rc1.20.g2443f3f80d


