Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E3E2F3312
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:38:44 +0100 (CET)
Received: from localhost ([::1]:58264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKol-0003i6-OP
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhR-0006DO-5U
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:31:09 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:41262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhN-0004fb-EZ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:31:08 -0500
Received: by mail-lj1-x22a.google.com with SMTP id f11so3040140ljm.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aSVqArs50dH6ORORx7j1pebjzF5WWw6+PDwzFqwRDNc=;
 b=wZF6SMDINx4eBMO6VmJVJ9zM5so/EZ3L9fBSFIVF/BJK3NYQ+ReRtgjPnE4F9v9RrF
 t979uwv/EYt1Bt3+sN6pfIUAYLuNrAYgVJ6q8eSeAUQl05q0xZd3psGuesZS4rhUPVbo
 a3r4RDtJ1HUwVBcwvb+EZjxiNg9hO6CxThkJXGqyCQsYCUMt0fUZm+9A57BlGEX7qmqF
 XTNYjqYQJb8dsiSVnvYPDIMuYDnFJNEuN83iJAtH1nWGNQ8BRW5fmTItJGr6VvJmexQG
 wLkf7UJb7Y9S+mZumlW54hfLSP2Fi76tc3RRHJ0JYAzA6w6FU83U8Jy9uqcKxD2DyBVz
 emuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aSVqArs50dH6ORORx7j1pebjzF5WWw6+PDwzFqwRDNc=;
 b=lqnnWc4W+Du+Yp4fbx1yvd+GvSyRezvE5lVlepdrgg8howEGOgu1PD5PINq35kLuH9
 cJwxwCyvyBCgU2Lb0KeUbhgrWqa2DoAeM3zRmnruaps+cvh849XpZYF2pvdKbvQbFtH+
 b13Xe82G7/9nmjR2k/81yOo618vBOyovSdLoVdZBtrp+QHnV9mD1+B6zOry4G6F2FTBu
 7SLIk0M6Xca+6KW7r0+LDZoK9NNJgM0c8nngz8i1wXGzESxkZy48ieBEG8/w5f8bkHlV
 utJr8TEDl63EWmJ/cfFxXu9xjjmZrZF78naY3Vmr5oXRTF2JWoaV7Ihuk9x2zHs7p/dW
 ZzqQ==
X-Gm-Message-State: AOAM530PR+olnG8gb2NwEXNBLLv2wfmNh+pzya3VDEpuAZ3s0VcmcPaP
 /3iyeayx9TjSbUxdPzbiqC9RJw==
X-Google-Smtp-Source: ABdhPJxRrVtH6aGXJZS1Y3S91AXBODfwJgZcr9iEfsJkEe35us+n4hf77iIopuQ0CNQdt9Iufn+oTg==
X-Received: by 2002:a2e:2a83:: with SMTP id q125mr2169658ljq.436.1610461863000; 
 Tue, 12 Jan 2021 06:31:03 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c24sm365499ljn.116.2021.01.12.06.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:31:02 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv4 1/2] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Tue, 12 Jan 2021 17:30:57 +0300
Message-Id: <20210112143058.12159-2-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112143058.12159-1-maxim.uvarov@linaro.org>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement gpio-pwr driver to allow reboot and poweroff machine.
This is simple driver with just 2 gpios lines. Current use case
is to reboot and poweroff virt machine in secure mode. Secure
pl066 gpio chip is needed for that.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/gpio/Kconfig     |  3 ++
 hw/gpio/gpio_pwr.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index b6fdaa2586..f0e7405f6e 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -8,5 +8,8 @@ config PL061
 config GPIO_KEY
     bool
 
+config GPIO_PWR
+    bool
+
 config SIFIVE_GPIO
     bool
diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
new file mode 100644
index 0000000000..8ed8d5d24f
--- /dev/null
+++ b/hw/gpio/gpio_pwr.c
@@ -0,0 +1,70 @@
+/*
+ * GPIO qemu power controller
+ *
+ * Copyright (c) 2020 Linaro Limited
+ *
+ * Author: Maxim Uvarov <maxim.uvarov@linaro.org>
+ *
+ * Virtual gpio driver which can be used on top of pl061
+ * to reboot and shutdown qemu virtual machine. One of use
+ * case is gpio driver for secure world application (ARM
+ * Trusted Firmware.).
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+/*
+ * QEMU interface:
+ * two named input GPIO lines:
+ *   'reset' : when asserted, trigger system reset
+ *   'shutdown' : when asserted, trigger system shutdown
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "sysemu/runstate.h"
+
+#define TYPE_GPIOPWR "gpio-pwr"
+OBJECT_DECLARE_SIMPLE_TYPE(GPIO_PWR_State, GPIOPWR)
+
+struct GPIO_PWR_State {
+    SysBusDevice parent_obj;
+};
+
+static void gpio_pwr_reset(void *opaque, int n, int level)
+{
+    if (!level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+static void gpio_pwr_shutdown(void *opaque, int n, int level)
+{
+    if (!level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void gpio_pwr_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_init_gpio_in_named(dev, gpio_pwr_reset, "reset", 1);
+    qdev_init_gpio_in_named(dev, gpio_pwr_shutdown, "shutdown", 1);
+}
+
+static const TypeInfo gpio_pwr_info = {
+    .name          = TYPE_GPIOPWR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GPIO_PWR_State),
+    .instance_init = gpio_pwr_init,
+};
+
+static void gpio_pwr_register_types(void)
+{
+    type_register_static(&gpio_pwr_info);
+}
+
+type_init(gpio_pwr_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 5c0a7d7b95..79568f00ce 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(when: 'CONFIG_E500', if_true: files('mpc8xxx.c'))
 softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
 softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
 softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_gpio.c'))
-- 
2.17.1


