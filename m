Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E113BE094
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 16:53:08 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD8fC-0004tr-Gq
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 10:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8N1-00041K-KZ
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8Mz-0001BC-TT
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:19 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:58388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8Mz-00019V-KL
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:17 -0400
Received: from player786.ha.ovh.net (unknown [10.109.160.46])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 4FE4F1AE1BA
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:34:13 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id D0991A4D3EE7;
 Wed, 25 Sep 2019 14:34:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/23] watchdog/aspeed: Introduce an object class per SoC
Date: Wed, 25 Sep 2019 16:32:35 +0200
Message-Id: <20190925143248.10000-11-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8855484242728946449
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.63.121
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

It cleanups the current models for the Aspeed AST2400 and AST2500 SoCs
and prepares ground for future SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/watchdog/wdt_aspeed.h |  18 ++++-
 hw/arm/aspeed_soc.c              |   9 ++-
 hw/watchdog/wdt_aspeed.c         | 122 ++++++++++++++++---------------
 3 files changed, 86 insertions(+), 63 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index 8c5691ce2047..796342764e2e 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -16,6 +16,8 @@
 #define TYPE_ASPEED_WDT "aspeed.wdt"
 #define ASPEED_WDT(obj) \
     OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
+#define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
+#define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
=20
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
=20
@@ -30,8 +32,20 @@ typedef struct AspeedWDTState {
=20
     AspeedSCUState *scu;
     uint32_t pclk_freq;
-    uint32_t silicon_rev;
-    uint32_t ext_pulse_width_mask;
 } AspeedWDTState;
=20
+#define ASPEED_WDT_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedWDTClass, (klass), TYPE_ASPEED_WDT)
+#define ASPEED_WDT_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedWDTClass, (obj), TYPE_ASPEED_WDT)
+
+typedef struct AspeedWDTClass {
+    SysBusDeviceClass parent_class;
+
+    uint32_t offset;
+    uint32_t ext_pulse_width_mask;
+    uint32_t reset_ctrl_reg;
+    void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
+}  AspeedWDTClass;
+
 #endif /* WDT_ASPEED_H */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index aaf18d3e42f1..5c5fcb810944 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -214,10 +214,9 @@ static void aspeed_soc_init(Object *obj)
                               "max-ram-size", &error_abort);
=20
     for (i =3D 0; i < sc->info->wdts_num; i++) {
+        snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         sysbus_init_child_obj(obj, "wdt[*]", OBJECT(&s->wdt[i]),
-                              sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
-        qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
-                                    sc->info->silicon_rev);
+                              sizeof(s->wdt[i]), typename);
         object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
                                        OBJECT(&s->scu), &error_abort);
     }
@@ -384,13 +383,15 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* Watch dog */
     for (i =3D 0; i < sc->info->wdts_num; i++) {
+        AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->info->memmap[ASPEED_WDT] + i * 0x20);
+                        sc->info->memmap[ASPEED_WDT] + i * awc->offset);
     }
=20
     /* Net */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index f710036535da..fc0e6c486a70 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -54,21 +54,6 @@ static bool aspeed_wdt_is_enabled(const AspeedWDTState=
 *s)
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
 }
=20
-static bool is_ast2500(const AspeedWDTState *s)
-{
-    switch (s->silicon_rev) {
-    case AST2500_A0_SILICON_REV:
-    case AST2500_A1_SILICON_REV:
-        return true;
-    case AST2400_A0_SILICON_REV:
-    case AST2400_A1_SILICON_REV:
-    default:
-        break;
-    }
-
-    return false;
-}
-
 static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned si=
ze)
 {
     AspeedWDTState *s =3D ASPEED_WDT(opaque);
@@ -124,6 +109,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s =3D ASPEED_WDT(opaque);
+    AspeedWDTClass *awc =3D ASPEED_WDT_GET_CLASS(s);
     bool enable =3D data & WDT_CTRL_ENABLE;
=20
     offset >>=3D 2;
@@ -153,24 +139,13 @@ static void aspeed_wdt_write(void *opaque, hwaddr o=
ffset, uint64_t data,
         }
         break;
     case WDT_RESET_WIDTH:
-    {
-        uint32_t property =3D data & WDT_POLARITY_MASK;
-
-        if (property && is_ast2500(s)) {
-            if (property =3D=3D WDT_ACTIVE_HIGH_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_ACTIVE_HIG=
H;
-            } else if (property =3D=3D WDT_ACTIVE_LOW_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_ACTIVE_HI=
GH;
-            } else if (property =3D=3D WDT_PUSH_PULL_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_PUSH_PULL;
-            } else if (property =3D=3D WDT_OPEN_DRAIN_MAGIC) {
-                s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_PUSH_PULL=
;
-            }
+        if (awc->reset_pulse) {
+            awc->reset_pulse(s, data & WDT_POLARITY_MASK);
         }
-        s->regs[WDT_RESET_WIDTH] &=3D ~s->ext_pulse_width_mask;
-        s->regs[WDT_RESET_WIDTH] |=3D data & s->ext_pulse_width_mask;
+        s->regs[WDT_RESET_WIDTH] &=3D ~awc->ext_pulse_width_mask;
+        s->regs[WDT_RESET_WIDTH] |=3D data & awc->ext_pulse_width_mask;
         break;
-    }
+
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
         qemu_log_mask(LOG_UNIMP,
@@ -226,9 +201,10 @@ static void aspeed_wdt_reset(DeviceState *dev)
 static void aspeed_wdt_timer_expired(void *dev)
 {
     AspeedWDTState *s =3D ASPEED_WDT(dev);
+    uint32_t reset_ctrl_reg =3D ASPEED_WDT_GET_CLASS(s)->reset_ctrl_reg;
=20
     /* Do not reset on SDRAM controller reset */
-    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
+    if (s->scu->regs[reset_ctrl_reg] & SCU_RESET_SDRAM) {
         timer_del(s->timer);
         s->regs[WDT_CTRL] =3D 0;
         return;
@@ -256,25 +232,6 @@ static void aspeed_wdt_realize(DeviceState *dev, Err=
or **errp)
     }
     s->scu =3D ASPEED_SCU(obj);
=20
-    if (!is_supported_silicon_rev(s->silicon_rev)) {
-        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
-                s->silicon_rev);
-        return;
-    }
-
-    switch (s->silicon_rev) {
-    case AST2400_A0_SILICON_REV:
-    case AST2400_A1_SILICON_REV:
-        s->ext_pulse_width_mask =3D 0xff;
-        break;
-    case AST2500_A0_SILICON_REV:
-    case AST2500_A1_SILICON_REV:
-        s->ext_pulse_width_mask =3D 0xfffff;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expir=
ed, dev);
=20
     /* FIXME: This setting should be derived from the SCU hw strapping
@@ -287,20 +244,15 @@ static void aspeed_wdt_realize(DeviceState *dev, Er=
ror **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
=20
-static Property aspeed_wdt_properties[] =3D {
-    DEFINE_PROP_UINT32("silicon-rev", AspeedWDTState, silicon_rev, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->desc =3D "ASPEED Watchdog Controller";
     dc->realize =3D aspeed_wdt_realize;
     dc->reset =3D aspeed_wdt_reset;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->vmsd =3D &vmstate_aspeed_wdt;
-    dc->props =3D aspeed_wdt_properties;
 }
=20
 static const TypeInfo aspeed_wdt_info =3D {
@@ -308,12 +260,68 @@ static const TypeInfo aspeed_wdt_info =3D {
     .name  =3D TYPE_ASPEED_WDT,
     .instance_size  =3D sizeof(AspeedWDTState),
     .class_init =3D aspeed_wdt_class_init,
+    .class_size    =3D sizeof(AspeedWDTClass),
+    .abstract      =3D true,
+};
+
+static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedWDTClass *awc =3D ASPEED_WDT_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2400 Watchdog Controller";
+    awc->offset =3D 0x20;
+    awc->ext_pulse_width_mask =3D 0xff;
+    awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
+}
+
+static const TypeInfo aspeed_2400_wdt_info =3D {
+    .name =3D TYPE_ASPEED_2400_WDT,
+    .parent =3D TYPE_ASPEED_WDT,
+    .instance_size =3D sizeof(AspeedWDTState),
+    .class_init =3D aspeed_2400_wdt_class_init,
+};
+
+static void aspeed_2500_wdt_reset_pulse(AspeedWDTState *s, uint32_t prop=
erty)
+{
+    if (property) {
+        if (property =3D=3D WDT_ACTIVE_HIGH_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property =3D=3D WDT_ACTIVE_LOW_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+        } else if (property =3D=3D WDT_PUSH_PULL_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] |=3D WDT_RESET_WIDTH_PUSH_PULL;
+        } else if (property =3D=3D WDT_OPEN_DRAIN_MAGIC) {
+            s->regs[WDT_RESET_WIDTH] &=3D ~WDT_RESET_WIDTH_PUSH_PULL;
+        }
+    }
+}
+
+static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedWDTClass *awc =3D ASPEED_WDT_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2500 Watchdog Controller";
+    awc->offset =3D 0x20;
+    awc->ext_pulse_width_mask =3D 0xfffff;
+    awc->reset_ctrl_reg =3D SCU_RESET_CONTROL1;
+    awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
+}
+
+static const TypeInfo aspeed_2500_wdt_info =3D {
+    .name =3D TYPE_ASPEED_2500_WDT,
+    .parent =3D TYPE_ASPEED_WDT,
+    .instance_size =3D sizeof(AspeedWDTState),
+    .class_init =3D aspeed_2500_wdt_class_init,
 };
=20
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
     type_register_static(&aspeed_wdt_info);
+    type_register_static(&aspeed_2400_wdt_info);
+    type_register_static(&aspeed_2500_wdt_info);
 }
=20
 type_init(wdt_aspeed_register_types)
--=20
2.21.0


