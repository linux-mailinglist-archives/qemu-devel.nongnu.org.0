Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A002C669BD6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:21:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmZ-0000sp-Oi; Fri, 13 Jan 2023 09:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmO-0000py-GM
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:37 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmL-0003du-1X
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso12369697wms.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oZXMhkSlmXqoV9sDK+w4eUOj9W1bzDySktwjVzGpPRM=;
 b=cnetN40p8k2qRyMG7EjqIpucDAsw+ZPJYeElgwK6X43nL1oVOdwRUcEtR2X+bktXVc
 tdHepFXTFzbrL/jpKPrnQQ7l21Nsadns+xb08KvdL5HNEvp6Is7RpUHYBtjA15cKnzGH
 WNDzUT+gYXRMnWKPSkFEglIsrWUrhWgxPh4RQXuEcnSnDZUx/FgapjOy+heIJjPEzvny
 br2+m+9teZywGuGPTN5L/Fml5ik3bI9nkWLpzKPaBaI34X0XlPj8DfhXNifliKxV7eG1
 HVpCc0s11C9j8HMF1czFhR9rkWFp+VNoF9SN4sSmFSLkkWk8RHSb5km3JCwaGuiSr/OG
 fH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZXMhkSlmXqoV9sDK+w4eUOj9W1bzDySktwjVzGpPRM=;
 b=ekC5RjJFc6J+1IFNMXDKLFkAIN2qDFRz9prz1wf5Uo0ZZyh++NztmNLiN3RTADLWic
 gzv5dZvwRgXvbd2YEaXFrBoMT4V4kcxNfePUO1XF3BJGKkEd8/h5xBvG+gpfXjIOMgrh
 8ZGZPt9x7xh+4A5/pNuzkO0hr0A92A/OpPEuXzdUOuUqWmX5J1F3Q3XkYm0r9NzeD2yo
 f3Qp4zXY2Yo1KMQG+xaEisIOQTo1M3ScVjmtkGMJfDLoOEgvvaZr99O7z2pVwml87+ES
 v1wslzuKK4TcUGq0TaD5PyJmTESjpnCuC5Jl3aniul8X23kUnrMImZOSnwCOI/0Z70tK
 FbtA==
X-Gm-Message-State: AFqh2kp3vBcPKU5QDQ802ASbti2qw3aF7cnfTo0Ea7NSQZ6j6A4t0E7S
 ZBCFuIKwndWsM1qISbI8EcIv3siWyEi6SBK7
X-Google-Smtp-Source: AMrXdXuvP2JPXpbP0qB3iCfwVe4gxaXJOz499dgj9ShznpId/R9HBAaPkdwJrESInvHIEIFsu44JxA==
X-Received: by 2002:a05:600c:4f07:b0:3da:1bb0:4d78 with SMTP id
 l7-20020a05600c4f0700b003da1bb04d78mr4304113wmq.14.1673619089866; 
 Fri, 13 Jan 2023 06:11:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/38] hw/arm: Add Olimex H405
Date: Fri, 13 Jan 2023 14:10:50 +0000
Message-Id: <20230113141126.535646-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Felipe Balbi <balbi@kernel.org>

Olimex makes a series of low-cost STM32 boards. This commit introduces
the minimum setup to support SMT32-H405. See [1] for details

[1] https://www.olimex.com/Products/ARM/ST/STM32-H405/

Signed-off-by: Felipe Balbi <balbi@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20221230145733.200496-3-balbi@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/stm32.rst               |  1 +
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
 MAINTAINERS                             |  6 +++
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 6 files changed, 82 insertions(+)
 create mode 100644 hw/arm/olimex-stm32-h405.c

diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
index 508b92cf862..d7265b763d4 100644
--- a/docs/system/arm/stm32.rst
+++ b/docs/system/arm/stm32.rst
@@ -20,6 +20,7 @@ The STM32F4 series is based on ARM Cortex-M4F core. This series is pin-to-pin
 compatible with STM32F2 series. The following machines are based on this chip :
 
 - ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
+- ``olimex-stm32-h405`` Olimex STM32 H405 board with STM32F405RGT6 microcontroller
 
 There are many other STM32 series that are currently not supported by QEMU.
 
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 6985a25377a..1b49a7830c7 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -30,6 +30,7 @@ CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
+CONFIG_OLIMEX_STM32_H405=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
new file mode 100644
index 00000000000..3aa61c91b75
--- /dev/null
+++ b/hw/arm/olimex-stm32-h405.c
@@ -0,0 +1,69 @@
+/*
+ * ST STM32VLDISCOVERY machine
+ * Olimex STM32-H405 machine
+ *
+ * Copyright (c) 2022 Felipe Balbi <balbi@kernel.org>
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
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
+#include "qemu/error-report.h"
+#include "hw/arm/stm32f405_soc.h"
+#include "hw/arm/boot.h"
+
+/* olimex-stm32-h405 implementation is derived from netduinoplus2 */
+
+/* Main SYSCLK frequency in Hz (168MHz) */
+#define SYSCLK_FRQ 168000000ULL
+
+static void olimex_stm32_h405_init(MachineState *machine)
+{
+    DeviceState *dev;
+    Clock *sysclk;
+
+    /* This clock doesn't need migration because it is fixed-frequency */
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
+    dev = qdev_new(TYPE_STM32F405_SOC);
+    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       0, FLASH_SIZE);
+}
+
+static void olimex_stm32_h405_machine_init(MachineClass *mc)
+{
+    mc->desc = "Olimex STM32-H405 (Cortex-M4)";
+    mc->init = olimex_stm32_h405_init;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+
+    /* SRAM pre-allocated as part of the SoC instantiation */
+    mc->default_ram_size = 0;
+}
+
+DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)
diff --git a/MAINTAINERS b/MAINTAINERS
index 5606e5dbd25..904b524896d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1036,6 +1036,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/netduinoplus2.c
 
+Olimex STM32 H405
+M: Felipe Balbi <balbi@kernel.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/olimex-stm32-h405.c
+
 SmartFusion2
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 17fcde8e1cc..9143533ef79 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -119,6 +119,10 @@ config NETDUINOPLUS2
     bool
     select STM32F405_SOC
 
+config OLIMEX_STM32_H405
+    bool
+    select STM32F405_SOC
+
 config NSERIES
     bool
     select OMAP
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 92f9f6e000e..76d4d650e42 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -12,6 +12,7 @@ arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
+arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
-- 
2.34.1


