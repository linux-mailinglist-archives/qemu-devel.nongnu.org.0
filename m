Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E7308818
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:11:59 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rh0-0003Cn-V3
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW4-0004QJ-9B
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVl-0006t8-TV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id i9so6831037wmq.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y8CbVorX8oRoSIK6UA9YF8aMcueMF25dEqRylmS49Oo=;
 b=W5DX/GeMPN/Q+bZmmLiyX49kvzbetnBH1sFexGudUNYnaXnzJm1/7J0Kf+7ecRENG4
 0sTKEjtyucxP2ltFCG4yJMFhG87zc7SnvaJylHkMs/HNY5WaOp3xXCog6sMqEL77SsB8
 DBmSwLvWTfrzWH1nZ7nk9PwqfLAwYYnMnZKvzY+KTtl77VZj1S6EtunkcTBqEnrONldf
 pZOLDqaSZZSI8YjE6vNhdvYlwsgeI9eZY7xl2+30br+3ye5DVKG4t2Tx1TUOFBlin2Sa
 CuNV6JC5zzO5SRA2ngK9HfVig8n+5HdsfgIboV5hnW0Jhi6/lbVKLkpjRLBZLSCws+QK
 YPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8CbVorX8oRoSIK6UA9YF8aMcueMF25dEqRylmS49Oo=;
 b=H3y7SYTD7AZT1y9dNnOQOXnwkCB+Jzt5IM4+NxTKOScZ4XBixsskviDErEURcaJEYQ
 aFORbn44ItMqeXY/bU35FRaoEDt/LQcL4veJIBYbihGki4hQxe5NXib6QNTifvvnriIX
 tSxtFSW3KpWFej6ouoPh+ehfExjlePnma+UmQg9FYcW+vz2NOmu5n8mCR15tKtkUu0y/
 43LJU+p3ABg7drh1c55n0N8bGn22Fv5EDPbgaQkwBoi/5TC0ziyj/iMrNdXzAlAMzW98
 k4YkmEf/NnV5fKTJu25fEnltWWbMknwrYiyoOZNjnV8xrxWrGU4enlzFMouMKsCyDEl6
 uR0A==
X-Gm-Message-State: AOAM530DmxPQDt6HYGgYKKgf+HV2zsq4krrHZlA5AguGSw5WqstCvK+5
 yXszANHqgUEFu+IP27a29LZe1ici12dddg==
X-Google-Smtp-Source: ABdhPJzjwAifZboCCMrs8b+renZjEp6OU1OnuH1u0CgmQ3apSsZqy7hME4SQrj8Js526K5KGTQdTTg==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr3283887wml.110.1611918018736; 
 Fri, 29 Jan 2021 03:00:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/46] hw: gpio: implement gpio-pwr driver for qemu
 reset/poweroff
Date: Fri, 29 Jan 2021 10:59:30 +0000
Message-Id: <20210129110012.8660-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Uvarov <maxim.uvarov@linaro.org>

Implement gpio-pwr driver to allow reboot and poweroff machine.
This is simple driver with just 2 gpios lines. Current use case
is to reboot and poweroff virt machine in secure mode. Secure
pl066 gpio chip is needed for that.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/gpio_pwr.c  | 70 +++++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/Kconfig     |  3 ++
 hw/gpio/meson.build |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
new file mode 100644
index 00000000000..7714fa0dc4d
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
+    if (level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+static void gpio_pwr_shutdown(void *opaque, int n, int level)
+{
+    if (level) {
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
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index b6fdaa2586d..f0e7405f6e6 100644
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
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 5c0a7d7b95a..79568f00ce3 100644
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
2.20.1


