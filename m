Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689265DD4E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 20:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD9sM-0003lj-MV; Wed, 04 Jan 2023 14:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pD9sI-0003lE-QG; Wed, 04 Jan 2023 14:56:35 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pD9sG-0002I3-UQ; Wed, 04 Jan 2023 14:56:34 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u28so45291172edd.10;
 Wed, 04 Jan 2023 11:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o1cNgh+oEb7j4+VtR9v/7Wy8rtubQctBMEJVkqzQFWs=;
 b=lEF6DV0Xh2gKRvQUk0dFT+fJyZb6JSXNNDmX5FT3I3vqptd/J/YOSSWDrbeKjI4okH
 yF+5lG8tS9GSKL/VPXOB11kMU7oQQoAWIMNg9BFbmtf/xEl5X2Be7AvjRjkg8hr1t76a
 5q2pIf66txu6Ox6DHag67/8bQ65+sy70KW7hdCbQ+rs5n0/+F2adN7+zR7r0MNQPFQoO
 qRVNUc+5l/A35P3DqpoISLiNlAQTlWcH9eLhex0hSRSXB1xkeFlaPI36UdFoTLqZemBV
 11Wj9bKg9bngni8LHs53cdGbrdVOPsnoqkL6U+oXwlRZmGZBeKJRSNf8SM5908+L7gpc
 Pl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o1cNgh+oEb7j4+VtR9v/7Wy8rtubQctBMEJVkqzQFWs=;
 b=T0//i9+spS4agFJOS0IbHpO5al3NEAIF+UBFue4Ufbn0O1MX0V3wEHhW4XIlQWHxO1
 gn9Towkh2GZ8qLDHKfWw3z8O05Wc2n5KzFyap9BNiZI+Lp6fyWjmF0BbFT5fiqftHMud
 zUf5ktNKXW5GJvRMccnjUa9VdUp9UqzgxY11BTusSQbPpJV01Mhb0DoHsd+Lx150NODL
 dUweiW6snHsnI4FnUkzxjGjlWwk8lzGpE6K6jtQlBrYbh+qFU12T/Y7N3/glChKoI+y+
 rTfGenNBvX8N9nqx4eiHtd7YrPRsLmMaAl4SpZglTmfcJ4pszKvyFwy8/7bK/5CPAKDx
 m1bA==
X-Gm-Message-State: AFqh2kqGLGFkZf7HqdCIrApJ2ACnU6EA2GhFaaEpxIorWO9rBg55XU18
 yBCmobOvzNPl2LrZbsvRy3U=
X-Google-Smtp-Source: AMrXdXtLd7joQUx4B7jofmHLazU2cOI7ktRQjHvxG6sHBGcwao88df3E9uVda+YQlfiOG7ugFHvLrQ==
X-Received: by 2002:a05:6402:12d4:b0:45c:835c:c6d3 with SMTP id
 k20-20020a05640212d400b0045c835cc6d3mr40691369edx.4.1672862191020; 
 Wed, 04 Jan 2023 11:56:31 -0800 (PST)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 o17-20020aa7dd51000000b00484cd57920asm12000089edw.11.2023.01.04.11.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 11:56:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: shentey@gmail.com
Cc: ani@anisinha.ca, aurelien@aurel32.net, eduardo@habkost.net,
 f4bug@amsat.org, hpoussin@reactos.org, imammedo@redhat.com,
 jiaxun.yang@flygoat.com, jsnow@redhat.com, kraxel@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, pbonzini@redhat.com,
 philmd@linaro.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH] hw/core: Introduce proxy-pic
Date: Wed,  4 Jan 2023 20:53:51 +0100
Message-Id: <20230104195351.3418-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-13-shentey@gmail.com>
References: <20221221170003.2929-13-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Having a proxy PIC allows for ISA PICs to be created and wired up in
southbridges. This is especially useful for PIIX3 for two reasons:
First, the southbridge doesn't need to care about the virtualization
technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
attached) and out-IRQs (which will trigger the IRQs of the respective
virtualization technology) are separated. Second, since the in-IRQs are
populated with fully initialized qemu_irq's, they can already be wired
up inside PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-15-shentey@gmail.com>
---
Changes since v4:
* Change license to GPL-2.0-or-later and use SPDX-License-Identifier
* Fix typo in commit message
---
 include/hw/core/proxy-pic.h | 38 ++++++++++++++++++++++++++
 hw/core/proxy-pic.c         | 54 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  2 ++
 hw/core/Kconfig             |  3 +++
 hw/core/meson.build         |  1 +
 5 files changed, 98 insertions(+)
 create mode 100644 include/hw/core/proxy-pic.h
 create mode 100644 hw/core/proxy-pic.c

diff --git a/include/hw/core/proxy-pic.h b/include/hw/core/proxy-pic.h
new file mode 100644
index 0000000000..32bc7936bd
--- /dev/null
+++ b/include/hw/core/proxy-pic.h
@@ -0,0 +1,38 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Proxy interrupt controller device.
+ *
+ * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
+ */
+
+#ifndef HW_PROXY_PIC_H
+#define HW_PROXY_PIC_H
+
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+#include "hw/irq.h"
+
+#define TYPE_PROXY_PIC "proxy-pic"
+OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
+
+#define MAX_PROXY_PIC_LINES 16
+
+/**
+ * This is a simple device which has 16 pairs of GPIO input and output lines.
+ * Any change on an input line is forwarded to the respective output.
+ *
+ * QEMU interface:
+ *  + 16 unnamed GPIO inputs: the input lines
+ *  + 16 unnamed GPIO outputs: the output lines
+ */
+struct ProxyPICState {
+    /*< private >*/
+    struct DeviceState parent_obj;
+    /*< public >*/
+
+    qemu_irq in_irqs[MAX_PROXY_PIC_LINES];
+    qemu_irq out_irqs[MAX_PROXY_PIC_LINES];
+};
+
+#endif /* HW_PROXY_PIC_H */
diff --git a/hw/core/proxy-pic.c b/hw/core/proxy-pic.c
new file mode 100644
index 0000000000..40fd70b9e2
--- /dev/null
+++ b/hw/core/proxy-pic.c
@@ -0,0 +1,54 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Proxy interrupt controller device.
+ *
+ * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/core/proxy-pic.h"
+
+static void proxy_pic_set_irq(void *opaque, int irq, int level)
+{
+    ProxyPICState *s = opaque;
+
+    qemu_set_irq(s->out_irqs[irq], level);
+}
+
+static void proxy_pic_realize(DeviceState *dev, Error **errp)
+{
+    ProxyPICState *s = PROXY_PIC(dev);
+
+    qdev_init_gpio_in(DEVICE(s), proxy_pic_set_irq, MAX_PROXY_PIC_LINES);
+    qdev_init_gpio_out(DEVICE(s), s->out_irqs, MAX_PROXY_PIC_LINES);
+
+    for (int i = 0; i < MAX_PROXY_PIC_LINES; ++i) {
+        s->in_irqs[i] = qdev_get_gpio_in(DEVICE(s), i);
+    }
+}
+
+static void proxy_pic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    /* No state to reset or migrate */
+    dc->realize = proxy_pic_realize;
+
+    /* Reason: Needs to be wired up to work */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo proxy_pic_info = {
+    .name          = TYPE_PROXY_PIC,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(ProxyPICState),
+    .class_init = proxy_pic_class_init,
+};
+
+static void split_irq_register_types(void)
+{
+    type_register_static(&proxy_pic_info);
+}
+
+type_init(split_irq_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a40d4d865..295a76bfbd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1674,6 +1674,7 @@ S: Supported
 F: hw/char/debugcon.c
 F: hw/char/parallel*
 F: hw/char/serial*
+F: hw/core/proxy-pic.c
 F: hw/dma/i8257*
 F: hw/i2c/pm_smbus.c
 F: hw/input/pckbd.c
@@ -1690,6 +1691,7 @@ F: hw/watchdog/wdt_ib700.c
 F: hw/watchdog/wdt_i6300esb.c
 F: include/hw/display/vga.h
 F: include/hw/char/parallel.h
+F: include/hw/core/proxy-pic.h
 F: include/hw/dma/i8257.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/input/i8042.h
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index 9397503656..a7224f4ca0 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -22,6 +22,9 @@ config OR_IRQ
 config PLATFORM_BUS
     bool
 
+config PROXY_PIC
+    bool
+
 config REGISTER
     bool
 
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 7a4d02b6c0..e86aef6ec3 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -30,6 +30,7 @@ softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.
 softmmu_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
 softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
 softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
+softmmu_ss.add(when: 'CONFIG_PROXY_PIC', if_true: files('proxy-pic.c'))
 softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
 softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
-- 
2.39.0


