Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830426D92D9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 11:34:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLzG-0001sw-HL; Thu, 06 Apr 2023 05:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzE-0001pP-9M
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:56 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzC-0006wt-Gz
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:56 -0400
Received: by mail-wr1-f49.google.com with SMTP id d17so38829130wrb.11
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680773573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyvHnZWQqjinfmImaCOd17h/79BkphoPAR4fNNfJA2k=;
 b=41b7bMcEETMu3GuwHqVbjjPm8gBwVUumZ2csgFvsYrXmy1ny3k6BNaHSm3oU5jMteC
 h+gxFLw5fB6/qdbgpysKNH6I+vTlQCGhrrHMTJRMXaDuo+zHzyS4qIGLyDzYj5CBDecK
 jCTdkpv44XcMvKUDGMS5v2MZ8pLEHVhLOT4S3UopbcYuMgwatRIbnnkbW7JYAi5qxZGO
 NlTWyW1E0ldOlz1v74sXHRsYTruLFLevbfXlWbf2iaP3E7CFdaJBqfJ7B0NVITI5xeMi
 RS/g4kp2J3cc3bxaiTNKRxdh5R7iJ2EHnn7cu2DICteo1c/J6lgjAE4qCjQirt/Azz8I
 u+Fw==
X-Gm-Message-State: AAQBX9ePHC0xTd/FTqcERCGDqrn23M0rBuLfsjt8zbVtZZDfWb9qgQty
 SRF/H759bdQD/7pNzSnG1vCUyspKAJQiUyHs
X-Google-Smtp-Source: AKy350ZODwAZXJnXZUs552WM/ANTLWbyy7VExkYvlTbN+08ppN4P/wub3J0rLqFi+bPknrnbolcBtA==
X-Received: by 2002:a5d:67cf:0:b0:2e6:3804:5be with SMTP id
 n15-20020a5d67cf000000b002e6380405bemr6059722wrw.59.1680773572901; 
 Thu, 06 Apr 2023 02:32:52 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a05600c4ec600b003edc4788fa0sm4914832wmq.2.2023.04.06.02.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:32:52 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 3/4] serial-mcb: Add serial via MEN chameleon bus
Date: Thu,  6 Apr 2023 11:31:56 +0200
Message-Id: <20230406093157.104145-4-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406093157.104145-1-jth@kernel.org>
References: <20230406093157.104145-1-jth@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.49; envelope-from=morbidrsa@gmail.com;
 helo=mail-wr1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 0000000000..7ca8a248ac
--- /dev/null
+++ b/hw/char/serial-mcb.c
@@ -0,0 +1,115 @@
+/*
+ * QEMU MEN 16z125 UART over MCB emulation
+ *
+ * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
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


