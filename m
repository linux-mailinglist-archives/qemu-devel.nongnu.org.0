Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCDA6DCA35
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 19:50:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plvef-00025h-4n; Mon, 10 Apr 2023 13:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plveY-00022K-CI
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:50:06 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plveW-0002FY-GN
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:50:06 -0400
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-504a37baf98so773259a12.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 10:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681149002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FE6Q2IcdC4/dlJSljQioDP6Jf5qnL+b5tpnHVTBSVH0=;
 b=gtsAAQvOAsU5AtTUySVLcTtwkx/pfJ51JEmd065Y+rjxqTXamPRk7H0qSUMkcMlHxF
 0LsCGIckC15VNoaUGO47qvdTYtwSW5E2nC9vGH45IcoAtQhu2kliY3Dc9GHZ2XB8GLos
 rR3JdWY7CrfKJWed6gQqfdPQWQgeVu/l3ELeWomq17xepme7OQvhUiwkKARb+bNAwZD5
 RR7XJxAA+rq74TNCQ1WOldpBGMap/tI/ndexNwYs03DXbTnVvOnEKFGL51FDwzLdXS/D
 bXxQzHCFCOTt2fo7WTrb4qRLuLhajG7oetpcTaHB2iJO7dKX1JHuhj3phlPFwVzUlpdy
 d05A==
X-Gm-Message-State: AAQBX9dGugpUjzQ0dbrL2EzGYHt1q+Wn1rdUx9M7FWh1kQa/PBwQnFH+
 OnieYVBON5ba1OXdhIrP/SclPhNZH7AAbpdu
X-Google-Smtp-Source: AKy350apXbUKNiim/ghCp/M+r57HCrL7GY+VQtZIhLEutJt1BTQOTrPQ1RTHmzzXfqc+QIyg6JTmLg==
X-Received: by 2002:a05:6402:344f:b0:504:8173:6240 with SMTP id
 l15-20020a056402344f00b0050481736240mr5688408edc.37.1681149002108; 
 Mon, 10 Apr 2023 10:50:02 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a509353000000b005002daeb27asm5129282eda.37.2023.04.10.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:50:01 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/4] serial-mcb: Add serial via MEN chameleon bus
Date: Mon, 10 Apr 2023 19:49:09 +0200
Message-Id: <20230410174910.4806-4-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410174910.4806-1-jth@kernel.org>
References: <20230410174910.4806-1-jth@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.48; envelope-from=morbidrsa@gmail.com;
 helo=mail-ed1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add MEN z125 UART over MEN Chameleon Bus emulation.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Johannes Thumshirn <jth@kernel.org>
---
 hw/char/Kconfig      |   6 +++
 hw/char/meson.build  |   1 +
 hw/char/serial-mcb.c | 115 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/char/serial-mcb.c

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 6b6cf2fc1d..9e8ebf1d3d 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -71,3 +71,9 @@ config GOLDFISH_TTY
 
 config SHAKTI_UART
     bool
+
+config SERIAL_MCB
+    bool
+    default y if MCB
+    depends on MCB
+    select SERIAL
diff --git a/hw/char/meson.build b/hw/char/meson.build
index e02c60dd54..d5893a142d 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -20,6 +20,7 @@ softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
 softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
+softmmu_ss.add(when: 'CONFIG_SERIAL_MCB', if_true: files('serial-mcb.c'))
 
 softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
 softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_uart.c'))
diff --git a/hw/char/serial-mcb.c b/hw/char/serial-mcb.c
new file mode 100644
index 0000000000..09f8fec11e
--- /dev/null
+++ b/hw/char/serial-mcb.c
@@ -0,0 +1,115 @@
+/*
+ * QEMU MEN 16z125 UART over MCB emulation
+ *
+ * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+#include "hw/char/serial.h"
+#include "hw/mcb/mcb.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+
+struct MCBSerialState {
+    MCBDevice dev;
+    SerialState state;
+};
+
+#define TYPE_MCB_SERIAL "mcb-serial"
+OBJECT_DECLARE_SIMPLE_TYPE(MCBSerialState, MCB_SERIAL)
+
+static void serial_mcb_realize(DeviceState *dev, Error **errp)
+{
+    MCBDevice *mdev = MCB_DEVICE(dev);
+    MCBSerialState *mss = DO_UPCAST(MCBSerialState, dev, mdev);
+    MCBus *bus = MCB_BUS(qdev_get_parent_bus(DEVICE(dev)));
+    SerialState *s = &mss->state;
+
+    mdev->gdd = mcb_new_chameleon_descriptor(bus, 125, mdev->rev,
+                                             mdev->var, 0x10);
+    if (!mdev->gdd) {
+        return;
+    }
+
+    s->baudbase = 115200;
+    if (!qdev_realize(DEVICE(s), NULL, errp)) {
+        return;
+    }
+
+    s->irq = mcb_allocate_irq(&mss->dev);
+    memory_region_init_io(&s->io, OBJECT(mss), &serial_io_ops, s, "serial", 8);
+    memory_region_add_subregion(&bus->mmio_region, mdev->gdd->offset, &s->io);
+}
+
+static void serial_mcb_unrealize(DeviceState *dev)
+{
+    MCBDevice *mdev = MCB_DEVICE(dev);
+    MCBSerialState *mss = DO_UPCAST(MCBSerialState, dev, mdev);
+    SerialState *s = &mss->state;
+
+    qdev_unrealize(DEVICE(s));
+    qemu_free_irq(s->irq);
+    g_free(&mdev->gdd);
+}
+
+static const VMStateDescription vmstate_mcb_serial = {
+    .name = "mcb-serial",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_MCB_DEVICE(dev, MCBSerialState),
+        VMSTATE_STRUCT(state, MCBSerialState, 0, vmstate_serial, SerialState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property serial_mcb_properties[] = {
+    DEFINE_PROP_UINT8("rev", MCBSerialState, dev.rev, 0),
+    DEFINE_PROP_UINT8("var", MCBSerialState, dev.var, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void serial_mcb_class_initfn(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    MCBDeviceClass *mc = MCB_DEVICE_CLASS(klass);
+
+    mc->realize = serial_mcb_realize;
+    mc->unrealize = serial_mcb_unrealize;
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    dc->desc = "MEN 16z125 UART over MCB";
+    dc->vmsd = &vmstate_mcb_serial;
+    device_class_set_props(dc, serial_mcb_properties);
+}
+
+static void serial_mcb_init(Object *o)
+{
+    MCBSerialState *mss = MCB_SERIAL(o);
+
+    object_initialize_child(o, "serial", &mss->state, TYPE_SERIAL);
+
+    qdev_alias_all_properties(DEVICE(&mss->state), o);
+}
+
+static const TypeInfo serial_mcb_info = {
+    .name = "mcb-serial",
+    .parent = TYPE_MCB_DEVICE,
+    .instance_size = sizeof(MCBSerialState),
+    .instance_init = serial_mcb_init,
+    .class_init = serial_mcb_class_initfn,
+};
+
+static void serial_mcb_register_types(void)
+{
+    type_register_static(&serial_mcb_info);
+}
+
+type_init(serial_mcb_register_types);
-- 
2.39.2


