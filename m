Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A131132A13
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:32:24 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqqE-0000dd-SP
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqUZ-0007V3-Lb
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:10:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqUY-00066W-6q
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24584
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqUY-000661-3B
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSdXE6aO3COPgwUN67tSzIWaJRCE/hrcXuhXBWHXzNQ=;
 b=AnR801WrXhzUQO1oTesTRMiZJ7S1NZ6K1mOZMAIxdOygWIqT6GmSUC67rkHQZGmVKAsgXB
 H2jBK6BYGKAsT0B3okvvNYQpRYRfKIRYcL99TjBRYVp4w5zThVn/FQSyfqoVRHIbfXvkmQ
 vG2lrxYvaxbkXBUnK2rtLVvIy1qVSiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-xtuOLDRcNkOQtzFNCZ1Sgg-1; Tue, 07 Jan 2020 10:09:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BD6910054E3;
 Tue,  7 Jan 2020 15:09:55 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87AB35D9E1;
 Tue,  7 Jan 2020 15:09:48 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/37] leon3: use qemu_irq framework instead of callback as
 property
Date: Tue,  7 Jan 2020 19:04:31 +0400
Message-Id: <20200107150442.1727958-27-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: xtuOLDRcNkOQtzFNCZ1Sgg-1
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"set_pin_in" property is used to define a callback mechanism where the
device says "call the callback function, passing it an opaque cookie
and a 32-bit value". We already have a generic mechanism for doing
that, which is the qemu_irq. So we should just use that.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 target/sparc/cpu.h    |  1 +
 hw/intc/grlib_irqmp.c | 35 ++++-------------------------------
 hw/sparc/leon3.c      | 13 +++++++++----
 3 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ae97c7d9f7..e70fec0133 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -541,6 +541,7 @@ struct CPUSPARCState {
 #endif
     sparc_def_t def;
=20
+    qemu_irq pil_irq;
     void *irq_manager;
     void (*qemu_irq_ack)(CPUSPARCState *env, void *irq_manager, int intno)=
;
=20
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index bc78e1a14f..794c643af2 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -25,6 +25,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "cpu.h"
=20
@@ -58,10 +59,8 @@ typedef struct IRQMP {
=20
     MemoryRegion iomem;
=20
-    void *set_pil_in;
-    void *set_pil_in_opaque;
-
     IRQMPState *state;
+    qemu_irq irq;
 } IRQMP;
=20
 struct IRQMPState {
@@ -82,7 +81,6 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
     uint32_t      pend   =3D 0;
     uint32_t      level0 =3D 0;
     uint32_t      level1 =3D 0;
-    set_pil_in_fn set_pil_in;
=20
     assert(state !=3D NULL);
     assert(state->parent !=3D NULL);
@@ -97,14 +95,8 @@ static void grlib_irqmp_check_irqs(IRQMPState *state)
     trace_grlib_irqmp_check_irqs(state->pending, state->force[0],
                                  state->mask[0], level1, level0);
=20
-    set_pil_in =3D (set_pil_in_fn)state->parent->set_pil_in;
-
     /* Trigger level1 interrupt first and level0 if there is no level1 */
-    if (level1 !=3D 0) {
-        set_pil_in(state->parent->set_pil_in_opaque, level1);
-    } else {
-        set_pil_in(state->parent->set_pil_in_opaque, level0);
-    }
+    qemu_set_irq(state->parent->irq, level1 ?: level0);
 }
=20
 static void grlib_irqmp_ack_mask(IRQMPState *state, uint32_t mask)
@@ -335,6 +327,7 @@ static void grlib_irqmp_init(Object *obj)
     IRQMP *irqmp =3D GRLIB_IRQMP(obj);
     SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
=20
+    qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1);
     memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
                           "irqmp", IRQMP_REG_SIZE);
=20
@@ -343,31 +336,11 @@ static void grlib_irqmp_init(Object *obj)
     sysbus_init_mmio(dev, &irqmp->iomem);
 }
=20
-static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
-{
-    IRQMP *irqmp =3D GRLIB_IRQMP(dev);
-
-        /* Check parameters */
-    if (irqmp->set_pil_in =3D=3D NULL) {
-        error_setg(errp, "set_pil_in cannot be NULL.");
-    }
-}
-
-static Property grlib_irqmp_properties[] =3D {
-    DEFINE_PROP_PTR("set_pil_in", IRQMP, set_pil_in),
-    DEFINE_PROP_PTR("set_pil_in_opaque", IRQMP, set_pil_in_opaque),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void grlib_irqmp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->reset =3D grlib_irqmp_reset;
-    dc->props =3D grlib_irqmp_properties;
-    /* Reason: pointer properties "set_pil_in", "set_pil_in_opaque" */
-    dc->user_creatable =3D false;
-    dc->realize =3D grlib_irqmp_realize;
 }
=20
 static const TypeInfo grlib_irqmp_info =3D {
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index c5f1b1ee72..cac987373e 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -143,9 +143,14 @@ void leon3_irq_ack(void *irq_manager, int intno)
     grlib_irqmp_ack((DeviceState *)irq_manager, intno);
 }
=20
-static void leon3_set_pil_in(void *opaque, uint32_t pil_in)
+/*
+ * This device assumes that the incoming 'level' value on the
+ * qemu_irq is the interrupt number, not just a simple 0/1 level.
+ */
+static void leon3_set_pil_in(void *opaque, int n, int level)
 {
-    CPUSPARCState *env =3D (CPUSPARCState *)opaque;
+    CPUSPARCState *env =3D opaque;
+    uint32_t pil_in =3D level;
     CPUState *cs;
=20
     assert(env !=3D NULL);
@@ -225,8 +230,8 @@ static void leon3_generic_hw_init(MachineState *machine=
)
=20
     /* Allocate IRQ manager */
     dev =3D qdev_create(NULL, TYPE_GRLIB_IRQMP);
-    qdev_prop_set_ptr(dev, "set_pil_in", leon3_set_pil_in);
-    qdev_prop_set_ptr(dev, "set_pil_in_opaque", env);
+    env->pil_irq =3D qemu_allocate_irq(leon3_set_pil_in, env, 0);
+    qdev_connect_gpio_out_named(dev, "grlib-irq", 0, env->pil_irq);
     qdev_init_nofail(dev);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, LEON3_IRQMP_OFFSET);
     env->irq_manager =3D dev;
--=20
2.25.0.rc1.20.g2443f3f80d


