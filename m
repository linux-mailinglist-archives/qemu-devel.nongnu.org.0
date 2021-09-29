Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7341C1A7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:33:23 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVxo-0005pI-Aj
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVth-000297-GN
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:07 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVte-0005tp-SS
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:05 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MOz8O-1mAg9Z0ulQ-00PQdT; Wed, 29
 Sep 2021 11:28:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] nubus: add support for slot IRQs
Date: Wed, 29 Sep 2021 11:28:41 +0200
Message-Id: <20210929092843.2686234-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4Kl6eUsDr6mpSmMOfN9LcXb1a3u5HpkiO75U7rNwxNWBgj0pkVB
 hp0tsvI2eattxWS7GhQ/i4kfium9Eus+ZNQbI/RQB+Iw/78qrBq2Dhpg9p+fBYS5jg9qfGf
 vMTNyrZvv1GADoWnaChwDpSsUxUK79VFdD0edcJee5YkVBG9xxnKgOZpPoZScoMzD2zHBoj
 jYd+jZ8VRtB+qFLR+zPCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ee64jy5aEog=:5Z6gBXhLeJj7rop/0LHQUa
 JOAE3T9WyhPFqPk7slPd1xyBdg7u0mGIubTHSfSktHtDjnqfL2TLpJ1cIQFvoeJ3NpcovhsjD
 vrWgnJPx2dQ013Km5VwyjTFMaVNDSlLKbZ/iivJDODZcusgkcJfTT5aUEdr5RgJ1GN+5lyXOh
 xoS3FcPMm0Wt/JlsRrQ5cmCOw4sMUK4UgaMpSoynhuvsV4wXdJpMf8Xn6cV90C5N7T1gL2WDg
 t9b2a+Mbev10ryYON5BMr0EzFwonA+xKro1kyPFfaw9/Wop+gBVnVu+FDBqneMdRc4pVQQWMN
 z6x0F4a+cEtBsRL7u4WSsp6eJ6ppMSAbVvk6/mv4GxZyrxkOgRIVM2RAO/6QQ0sAukNro7m0i
 EalqmWEGt/OuCtyruCdS1KOngIkFT4n/AWRFaaK8hJTQWn/pYaC1ur9H7ctXLwNjD78R+5t9h
 Zl3dujkz/qFOttv1sVJwJEMgU6X1Cu9E+/wJ2xos31t1El0yGTh0SbjA5DYzA/Sfv+Ni2BqUE
 D9IUsVPI2zf9AJFb9u43JN9CM534Ah/n0jNhcPhlZjvucB9L7NRGLFfh6Z3s9WKC+tvfA5CsX
 /swle0imr1L7zhtVuy0iXhPKn2Tbr4m6EtjloGK8wFL+CEAlG2Atj+IVBpQInmrrETFqjCHP0
 McVSnTK289JL00SHAPgnd0FFec4xnNRIwfnL6HpiIIIrZt9CtjeAkdwT45Y6ZiY/aDuWLg0k1
 wDwNPkW/suTmasw1ROyJFw6Qn0eA8ON7qjqMmg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Each Nubus slot has an IRQ line that can be used to request service from the
CPU. Connect the IRQs to the Nubus bridge so that they can be wired up using qdev
gpios accordingly, and introduce a new nubus_set_irq() function that can be used
by Nubus devices to control the slot IRQ.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210924073808.1041-19-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/nubus/nubus.h | 6 ++++++
 hw/nubus/nubus-bridge.c  | 2 ++
 hw/nubus/nubus-device.c  | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 63c69a7586fc..b3b4d2eadb4b 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -26,6 +26,8 @@
 #define NUBUS_LAST_SLOT       0xf
 #define NUBUS_SLOT_NB         (NUBUS_LAST_SLOT - NUBUS_FIRST_SLOT + 1)
 
+#define NUBUS_IRQS            16
+
 #define TYPE_NUBUS_DEVICE "nubus-device"
 OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
 
@@ -45,6 +47,8 @@ struct NubusBus {
     MemoryRegion slot_io;
 
     uint16_t slot_available_mask;
+
+    qemu_irq irqs[NUBUS_IRQS];
 };
 
 #define NUBUS_DECL_ROM_MAX_SIZE    (128 * KiB)
@@ -60,6 +64,8 @@ struct NubusDevice {
     MemoryRegion decl_rom;
 };
 
+void nubus_set_irq(NubusDevice *nd, int level);
+
 struct NubusBridge {
     SysBusDevice parent_obj;
 
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 7b51722f66ec..c517a8a7047b 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -19,6 +19,8 @@ static void nubus_bridge_init(Object *obj)
     NubusBus *bus = &s->bus;
 
     qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
+
+    qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
 }
 
 static Property nubus_bridge_properties[] = {
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 280f40e88a30..0f1852f671eb 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -10,12 +10,20 @@
 
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
+#include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 
 
+void nubus_set_irq(NubusDevice *nd, int level)
+{
+    NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(DEVICE(nd)));
+
+    qemu_set_irq(nubus->irqs[nd->slot], level);
+}
+
 static void nubus_device_realize(DeviceState *dev, Error **errp)
 {
     NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
-- 
2.31.1


