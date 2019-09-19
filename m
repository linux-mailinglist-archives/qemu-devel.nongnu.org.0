Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F62B72E9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 07:56:42 +0200 (CEST)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iApQn-0006vI-0e
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 01:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApL2-0000mx-Na
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApL1-0007oE-5d
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:44 -0400
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:33207)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApL0-0007nL-TI
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:50:43 -0400
Received: from player788.ha.ovh.net (unknown [10.109.159.159])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3AC2B24EF42
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 07:50:41 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id C11BD9F17368;
 Thu, 19 Sep 2019 05:50:34 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:49:45 +0200
Message-Id: <20190919055002.6729-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1671116939522968337
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.121.55.239
Subject: [Qemu-devel] [PATCH 04/21] aspeed/timer: Introduce an object class
 per SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The most important changes will be on the register range 0x34 - 0x3C
memops. Introduce class read/write operations to handle the
differences between SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  15 +++++
 hw/arm/aspeed_soc.c             |   3 +-
 hw/timer/aspeed_timer.c         | 107 ++++++++++++++++++++++++++++----
 3 files changed, 113 insertions(+), 12 deletions(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index 1fb949e16710..a791fee276f4 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -28,6 +28,9 @@
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
 #define TYPE_ASPEED_TIMER "aspeed.timer"
+#define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
+#define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
+
 #define ASPEED_TIMER_NR_TIMERS 8
=20
 typedef struct AspeedTimer {
@@ -60,4 +63,16 @@ typedef struct AspeedTimerCtrlState {
     AspeedSCUState *scu;
 } AspeedTimerCtrlState;
=20
+#define ASPEED_TIMER_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedTimerClass, (klass), TYPE_ASPEED_TIMER)
+#define ASPEED_TIMER_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedTimerClass, (obj), TYPE_ASPEED_TIMER)
+
+typedef struct AspeedTimerClass {
+    SysBusDeviceClass parent_class;
+
+    uint64_t (*read)(AspeedTimerCtrlState *s, hwaddr offset);
+    void (*write)(AspeedTimerCtrlState *s, hwaddr offset, uint64_t value=
);
+} AspeedTimerClass;
+
 #endif /* ASPEED_TIMER_H */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c3821a562733..26e03486f9b7 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -182,8 +182,9 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
                           TYPE_ASPEED_RTC);
=20
+    snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
-                          sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
+                          sizeof(s->timerctrl), typename);
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
                                    OBJECT(&s->scu), &error_abort);
=20
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 2bda826882d9..c78bc1bd2d25 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -253,13 +253,8 @@ static uint64_t aspeed_timer_read(void *opaque, hwad=
dr offset, unsigned size)
     case 0x40 ... 0x8c: /* Timers 5 - 8 */
         value =3D aspeed_timer_get_value(&s->timers[(offset >> 4) - 1], =
reg);
         break;
-    /* Illegal */
-    case 0x38:
-    case 0x3C:
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
-                __func__, offset);
-        value =3D 0;
+        value =3D ASPEED_TIMER_GET_CLASS(s)->read(s, offset);
         break;
     }
     trace_aspeed_timer_read(offset, size, value);
@@ -453,12 +448,8 @@ static void aspeed_timer_write(void *opaque, hwaddr =
offset, uint64_t value,
     case 0x40 ... 0x8c:
         aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv=
);
         break;
-    /* Illegal */
-    case 0x38:
-    case 0x3C:
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
-                __func__, offset);
+        ASPEED_TIMER_GET_CLASS(s)->write(s, offset, value);
         break;
     }
 }
@@ -472,6 +463,64 @@ static const MemoryRegionOps aspeed_timer_ops =3D {
     .valid.unaligned =3D false,
 };
=20
+static uint64_t aspeed_2400_timer_read(AspeedTimerCtrlState *s, hwaddr o=
ffset)
+{
+    uint64_t value;
+
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        value =3D 0;
+        break;
+    }
+    return value;
+}
+
+static void aspeed_2400_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
+                                    uint64_t value)
+{
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        break;
+    }
+}
+
+static uint64_t aspeed_2500_timer_read(AspeedTimerCtrlState *s, hwaddr o=
ffset)
+{
+    uint64_t value;
+
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        value =3D 0;
+        break;
+    }
+    return value;
+}
+
+static void aspeed_2500_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
+                                    uint64_t value)
+{
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        break;
+    }
+}
+
 static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
 {
     AspeedTimer *t =3D &s->timers[id];
@@ -570,11 +619,47 @@ static const TypeInfo aspeed_timer_info =3D {
     .parent =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(AspeedTimerCtrlState),
     .class_init =3D timer_class_init,
+    .class_size =3D sizeof(AspeedTimerClass),
+    .abstract   =3D true,
+};
+
+static void aspeed_2400_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedTimerClass *awc =3D ASPEED_TIMER_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2400 Timer";
+    awc->read =3D aspeed_2400_timer_read;
+    awc->write =3D aspeed_2400_timer_write;
+}
+
+static const TypeInfo aspeed_2400_timer_info =3D {
+    .name =3D TYPE_ASPEED_2400_TIMER,
+    .parent =3D TYPE_ASPEED_TIMER,
+    .class_init =3D aspeed_2400_timer_class_init,
+};
+
+static void aspeed_2500_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedTimerClass *awc =3D ASPEED_TIMER_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2500 Timer";
+    awc->read =3D aspeed_2500_timer_read;
+    awc->write =3D aspeed_2500_timer_write;
+}
+
+static const TypeInfo aspeed_2500_timer_info =3D {
+    .name =3D TYPE_ASPEED_2500_TIMER,
+    .parent =3D TYPE_ASPEED_TIMER,
+    .class_init =3D aspeed_2500_timer_class_init,
 };
=20
 static void aspeed_timer_register_types(void)
 {
     type_register_static(&aspeed_timer_info);
+    type_register_static(&aspeed_2400_timer_info);
+    type_register_static(&aspeed_2500_timer_info);
 }
=20
 type_init(aspeed_timer_register_types)
--=20
2.21.0


