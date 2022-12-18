Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0864FF42
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 16:25:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6vVv-0005M6-56; Sun, 18 Dec 2022 10:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqp-0008Bp-Q4; Sun, 18 Dec 2022 02:12:47 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqn-0000le-6E; Sun, 18 Dec 2022 02:12:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70BFEB80B45;
 Sun, 18 Dec 2022 07:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38BAC433F2;
 Sun, 18 Dec 2022 07:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671347559;
 bh=yGe1sQrHHWksNESJwDTSM2bZGmCWGZPCXGrx3AJlxDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jaWt2JyEgbgFIbxtfHzRUgQ7OKhj0L4xhbEGI0u/yPGkAMYFpG5UB2Rjr9WCuGZ8L
 Xlg4GXexmfD3UYM3zT49mi2j+7J5OlyLz2xW6oWlwLx3Wh+gbBXmFdxfigXYVlHk/c
 IagCJGiinJy/w2vWez6GRiF7eOwjQlKbaOC9Me0Nctf/AxV5fd4rDEdGmt7UJu/Li8
 ZnBVV6sH+Qj/U6Y1fhUW8FYy15CzVj7xGrRFLKz6AfMoyWEXDgGEV0O//BEFICxRwd
 dbuwqbzs/eFraKyYyflz6m4tgrhSYCJVvNQ/4p8p4JBubmUFu2sYOeqs7dXDQIwh5U
 svxHYKtSXeebQ==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 2/2] hw/arm: Add Olimex H405
Date: Sun, 18 Dec 2022 09:12:29 +0200
Message-Id: <20221218071229.484944-3-balbi@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221218071229.484944-1-balbi@kernel.org>
References: <20221218071229.484944-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=balbi@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 18 Dec 2022 10:23:41 -0500
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

Olimex makes a series of low-cost STM32 boards. This commit introduces
the minimum setup to support SMT32-H405. See [1] for details

[1] https://www.olimex.com/Products/ARM/ST/STM32-H405/

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 MAINTAINERS                             |  6 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/olimex-stm32-h405.c              | 65 +++++++++++++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 hw/arm/olimex-stm32-h405.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bd433b65a55..e37846df0071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1026,6 +1026,12 @@ L: qemu-arm@nongnu.org
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
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 6985a25377a0..1b49a7830c7e 100644
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
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 17fcde8e1ccc..9143533ef792 100644
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
index 92f9f6e000ea..76d4d650e42e 100644
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
diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
new file mode 100644
index 000000000000..5171a66074bb
--- /dev/null
+++ b/hw/arm/olimex-stm32-h405.c
@@ -0,0 +1,65 @@
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
+}
+
+DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)
-- 
2.38.1


