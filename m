Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563D410F97
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:43:30 +0200 (CEST)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD1V-0004DI-K8
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCzE-0001VX-8c
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:41:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCzC-0004UI-MY
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:41:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id v127so1652079wme.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+jhWDFKdh/csNwM2kZoLEHXPRdPcvqhfnrisZ5O72k=;
 b=jjAqyE1bnqavT8fGY43/AqqOp1oe3hgE6Wi8cu8Q7mwXhouLbhHNdrkXk0FiQrDT8h
 uxrdY3hlqrx2GGFGlHSMCrWDcBe2VRXgbt0q4u59p+sTFY+BFTbdoAhId9BGJWikd54s
 1qE1CfObEx4mn+W2dwwtAIiUGmpn2RFV/D1YleE+P085xOzHgiQq0HlTY/zvTTrmBsbb
 QgngEkj/FRUX2pabWtgqbIxHH8SmJHFICGNdE7P2ovyVJtLgthQh9lLJ0tmJnFPUelNb
 UVyNKR+dIvlsChG4s5HBhDl4Pn4Hsi18/kg+25GJnNkB9kx6lS4r+tn9mYUnbFfmEMIq
 YUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a+jhWDFKdh/csNwM2kZoLEHXPRdPcvqhfnrisZ5O72k=;
 b=T8wi4UOhv6S3ctHHDir6vZ9o/2PiveGZGotF7YnnELE5Qd9CA9PWEXIpoJ113+a4ef
 E9t6OKcoC1M8Qa86mMmE35aXbdcKpR50wmMV6dbZP97gPmBBZaolQ1uUNb/dJVkzHwj1
 PX0/6rg9xrvtaGzoGMxLc64/ACDxQFG2JMDJbROU33A4/wP3oPl0ZurVDkQFixWu5Npm
 zWftkXlRHwQ9H3ZP5/QXUH1UsPM3p6Qn0ruvu3SmTR9rTc6iD8JwdvQbdrtaRRtkOVcm
 DTHU/YlCYxfPuElxTGxzJWX9dcbB2pP/zhd4MPcWcQZI+UuE8tuCjYWx7tt6OKusVgRl
 6mmw==
X-Gm-Message-State: AOAM532m6ogVBca7P98Qbew+zrrpZmj0W9IVlDAEti0+iWEaMa9Pjk44
 7PNHT8yZRdqI/atEWNa6I0TnnJqSTPg=
X-Google-Smtp-Source: ABdhPJwKFR2Csp5IdXpN4GXoD70PVvCjn7pX4zzJE6EuL/y4hzH1PDO3Dcyqp9QBKvCdE7kO2i9fQg==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr22431646wmj.70.1632120064949; 
 Sun, 19 Sep 2021 23:41:04 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r25sm15138771wra.76.2021.09.19.23.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:41:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/input/lasips2: QOM'ify the Lasi PS/2
Date: Mon, 20 Sep 2021 08:40:48 +0200
Message-Id: <20210920064048.2729397-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920064048.2729397-1-f4bug@amsat.org>
References: <20210920064048.2729397-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/input/lasips2.h | 17 +++++++++++++----
 hw/hppa/lasi.c             | 10 +++++++++-
 hw/input/lasips2.c         | 38 ++++++++++++++++++++++++++++----------
 3 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index c88f1700162..834b6d867d9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -7,11 +7,11 @@
 #ifndef HW_INPUT_LASIPS2_H
 #define HW_INPUT_LASIPS2_H
 
-#include "exec/hwaddr.h"
+#include "hw/sysbus.h"
 
 #define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-struct LASIPS2State;
 typedef struct LASIPS2Port {
     struct LASIPS2State *parent;
     MemoryRegion reg;
@@ -23,12 +23,21 @@ typedef struct LASIPS2Port {
     bool irq;
 } LASIPS2Port;
 
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0 is the keyboard port interface
+ *  + sysbus MMIO region 1 is the mouse port interface
+ *  + sysbus IRQ 0 is the interrupt line shared between
+ *    keyboard and mouse ports
+ */
 typedef struct LASIPS2State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
 } LASIPS2State;
 
-void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
-
 #endif /* HW_INPUT_LASIPS2_H */
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 88c3791eb68..91414748b70 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -297,6 +297,7 @@ static int lasi_get_irq(unsigned long hpa)
 DeviceState *lasi_init(MemoryRegion *address_space)
 {
     DeviceState *dev;
+    SysBusDevice *sbd;
     LasiState *s;
 
     dev = qdev_new(TYPE_LASI_CHIP);
@@ -340,7 +341,14 @@ DeviceState *lasi_init(MemoryRegion *address_space)
     /* PS/2 Keyboard/Mouse */
     qemu_irq ps2kbd_irq = qemu_allocate_irq(lasi_set_irq, s,
             lasi_get_irq(LASI_PS2KBD_HPA));
-    lasips2_init(address_space, LASI_PS2KBD_HPA,  ps2kbd_irq);
+
+    sbd = SYS_BUS_DEVICE(qdev_new(TYPE_LASIPS2));
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    memory_region_add_subregion(address_space, LASI_PS2KBD_HPA,
+                                sysbus_mmio_get_region(sbd, 0));
+    memory_region_add_subregion(address_space, LASI_PS2MOU_HPA,
+                                sysbus_mmio_get_region(sbd, 1));
+    sysbus_connect_irq(sbd, 0, ps2kbd_irq);
 
     return dev;
 }
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0f8362f17bc..46cd32316da 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -243,28 +243,46 @@ static void ps2dev_update_irq(void *opaque, int level)
     lasips2_update_irq(port->parent);
 }
 
-void lasips2_init(MemoryRegion *address_space,
-                  hwaddr base, qemu_irq irq)
+static void lasips2_init(Object *obj)
 {
-    LASIPS2State *s;
+    LASIPS2State *s = LASIPS2(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    s = g_malloc0(sizeof(LASIPS2State));
-
-    s->irq = irq;
+    sysbus_init_irq(sbd, &s->irq);
     s->mouse.id = 1;
     s->kbd.parent = s;
     s->mouse.parent = s;
 
-    vmstate_register(NULL, base, &vmstate_lasips2, s);
-
     s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
 
     memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
-    memory_region_add_subregion(address_space, base, &s->kbd.reg);
+    sysbus_init_mmio(sbd, &s->kbd.reg);
 
     memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
                           "lasips2-mouse", 0x100);
-    memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
+    sysbus_init_mmio(sbd, &s->mouse.reg);
 }
+
+static void lasips2_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->vmsd = &vmstate_lasips2;
+}
+
+static const TypeInfo lasips2_info = {
+    .name          = TYPE_LASIPS2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LASIPS2State),
+    .instance_init = lasips2_init,
+    .class_init    = lasips2_class_init,
+};
+
+static void lasips2_register_types(void)
+{
+    type_register_static(&lasips2_info);
+}
+
+type_init(lasips2_register_types)
-- 
2.31.1


