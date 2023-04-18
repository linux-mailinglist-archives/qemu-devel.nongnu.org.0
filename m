Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BA6E6B30
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 19:38:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1popGA-0002cU-Cj; Tue, 18 Apr 2023 13:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1popG9-0002by-Dy
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:36:53 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1popG7-0007HD-Dh
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:36:53 -0400
Received: by mail-ej1-f42.google.com with SMTP id vc20so20295737ejc.10
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 10:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681839410; x=1684431410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FE6Q2IcdC4/dlJSljQioDP6Jf5qnL+b5tpnHVTBSVH0=;
 b=AvwE9eRXRwuUQY2J/AOKs3xesdw360t1qnD+IYRxONZRLPOEaejRu3jUkUrXFXuWVS
 eE3kG9ci9xmXzfDo1Poe/RW6XlD6RqnLvd7oIdyL9Yj/14Iqpc39UQGudzRI7X/ssk5J
 D+AyIzkhEDbKmnOMORYsLsejOi/pkaLlatOXK5Ocd3I8YU07hQmgG8bLAYhj1eeGgSpx
 mWpdWCaAxYIsdFEQlTjRSwrHdN5BxdVV0bLl8XIx1/6AgdH+uRwhpTXTbD/BGBEB8MAS
 UxZxTVVRTJgE9yd+w645JU/QnAmQFdWOnXCgjfzirlkKX4PRFTwCSrGM/9bVbMyrmLl5
 rDGw==
X-Gm-Message-State: AAQBX9e+yfY2ZlHvfsL8gm4uUQBK0MJJ1aHzE2lrmtbuXGv6hG/fx8j6
 6FhU7osQh6X8587/bncglk47NBgTWD8F06xu
X-Google-Smtp-Source: AKy350ZFL6HJUXqNNTUG9obWAsPy40uSD2iZqEv047/bjyNeac1DsRZJVnF7gsfXDKR0Yjn3ZrHW3Q==
X-Received: by 2002:a17:906:6d15:b0:94a:a41b:558 with SMTP id
 m21-20020a1709066d1500b0094aa41b0558mr12821736ejr.54.1681839409818; 
 Tue, 18 Apr 2023 10:36:49 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 j23-20020a1709066c1700b0095342bfb701sm73738ejr.16.2023.04.18.10.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 10:36:49 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 3/4] serial-mcb: Add serial via MEN chameleon bus
Date: Tue, 18 Apr 2023 19:35:55 +0200
Message-Id: <20230418173556.177985-4-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418173556.177985-1-jth@kernel.org>
References: <20230418173556.177985-1-jth@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.42; envelope-from=morbidrsa@gmail.com;
 helo=mail-ej1-f42.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


