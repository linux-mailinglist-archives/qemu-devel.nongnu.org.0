Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07716534BC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:13:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Tx-0003TD-8H; Wed, 21 Dec 2022 12:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Ss-0002sJ-9I; Wed, 21 Dec 2022 12:01:13 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sl-0008Ei-Ai; Wed, 21 Dec 2022 12:01:06 -0500
Received: by mail-ed1-x52e.google.com with SMTP id m19so22837028edj.8;
 Wed, 21 Dec 2022 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MAKSrvO3LKRtyG+jUynx0q4yT1W++y5zeAzml4CYXA=;
 b=jpcxxE/NKamMpAY9VmcIZGsyJD0KzlVhwWXEINpsru96vbPSgsSMx0dFyTYT48dPga
 +xtL99ooPDfV71ocjTkubft/LB/zgLBhjC89LuiJVjeghBTmhPO1uNZXwXIApH9wXTpb
 HMiVhuOPSuvpUjBNv9TXysV8o/TdXqLIgaP8YyN0OqZ09qS1Uv+rWmEnxRblxkNxQ/JK
 bDc8+dPMNc/2WdY8gABu5YlVVXUQoj1pSmEj/B5eWfmg7zj9ychp1bBZ+MXfBlz4sVhC
 M4xa5PFbOmUpzFZ5hHJmFdjS00vXPYm3uST+eZXgXC2HkoF6s6pyCBed6CecWsrAwsI/
 z7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MAKSrvO3LKRtyG+jUynx0q4yT1W++y5zeAzml4CYXA=;
 b=gSLRsLFxbwNAs79YyWKFaoX/kcMXUCD9c/1Yl8FWiOIz+giiAvnzjyoTBm9yXSpLie
 BFpfUqALmRyPsr150tf6BeWWTo6xHOkjK2xMcYU9DbqJhR0mdLuyCuzJimX+fLVrUi5k
 H/ac8ObtbDjs4gH7edN6O17QtbZGKH+lxahcf0MrtQ1ICzcVIuc/+S+YNwjMuN3/GLed
 8SdyeRrKwB3mUlyK2ooap5cDRl++M0jE3Zg8ERiEOkHjbtSwf79YNr05Vy30vTCY6BtR
 k/ro2y3CiliRg4sZrETJF4h9QECIcLOCiHHHhwnIe0v4dTWvtYxn/Rq4R02qR8dvphXm
 Q5dw==
X-Gm-Message-State: AFqh2kpglPSuuZUZVU/k36SG56wTtQWa4TPZiLJvoMhLN1c/l/4nyo0O
 0eZK0gZvjUCSejdpUPnwHxmcV+pit/w=
X-Google-Smtp-Source: AMrXdXtI/EUcBYfbZFJkS5JxvaG4q9cQK2jliN9MFpLtRliHZ1/y58aPyF3YIspOErta/TqL5myNmg==
X-Received: by 2002:a05:6402:e09:b0:479:3ffb:9243 with SMTP id
 h9-20020a0564020e0900b004793ffb9243mr2113701edh.25.1671642060312; 
 Wed, 21 Dec 2022 09:01:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 12/30] hw/core: Introduce proxy-pic
Date: Wed, 21 Dec 2022 17:59:45 +0100
Message-Id: <20221221170003.2929-13-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
virtzalization technology) are separated. Second, since the in-IRQs are
populated with fully initialized qemu_irq's, they can already be wired
up inside PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-15-shentey@gmail.com>
---
 MAINTAINERS                 |  2 ++
 hw/core/Kconfig             |  3 ++
 hw/core/meson.build         |  1 +
 hw/core/proxy-pic.c         | 70 +++++++++++++++++++++++++++++++++++++
 include/hw/core/proxy-pic.h | 54 ++++++++++++++++++++++++++++
 5 files changed, 130 insertions(+)
 create mode 100644 hw/core/proxy-pic.c
 create mode 100644 include/hw/core/proxy-pic.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 716d5a24ad..f862bfc7d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1675,6 +1675,7 @@ S: Supported
 F: hw/char/debugcon.c
 F: hw/char/parallel*
 F: hw/char/serial*
+F: hw/core/proxy-pic.c
 F: hw/dma/i8257*
 F: hw/i2c/pm_smbus.c
 F: hw/input/pckbd.c
@@ -1691,6 +1692,7 @@ F: hw/watchdog/wdt_ib700.c
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
diff --git a/hw/core/proxy-pic.c b/hw/core/proxy-pic.c
new file mode 100644
index 0000000000..3251727d19
--- /dev/null
+++ b/hw/core/proxy-pic.c
@@ -0,0 +1,70 @@
+/*
+ * Proxy interrupt controller device.
+ *
+ * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
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
diff --git a/include/hw/core/proxy-pic.h b/include/hw/core/proxy-pic.h
new file mode 100644
index 0000000000..0eb40c478a
--- /dev/null
+++ b/include/hw/core/proxy-pic.h
@@ -0,0 +1,54 @@
+/*
+ * Proxy interrupt controller device.
+ *
+ * Copyright (c) 2022 Bernhard Beschow <shentey@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
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
-- 
2.39.0


