Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB52AD578
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:41:28 +0100 (CET)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcS1f-0003Ig-Qq
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgY-0002FK-Rl
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgW-0006rJ-2a
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id h62so2622214wme.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xXHPGPloU1tq9L5RfDiL3Hd1aT2d/fNx+Yg3ShJ4SUA=;
 b=dp8fjVkx6zDd+Roko2LytuBlwo9BO9VqNwDbX3lS0e2K1ODg8PvyRxJv3w7q6hTgqO
 Fe6jQYaGhGPlIpWHmkK3n/d+y4+jwddX9LB3fXLEjR/ntzgFiJ4EQPokZyuctryB5dqm
 vyDUoHgTNiYTXojSuNZJM/TedsAMNNndipKdL3hTXNpf2m7aoJJiGxGCWrrw7MhHzzQe
 wPgTx5eyhVg1FW1ntO2mTabSS81YUuk45ecv/4p/CLmF19rSz+SdSwi2NDzTVUaFD0Dl
 hg64cNDQRnEPwiu/kX9dB2gF3dvroUD10WbhoP3wgrt9MClJ9UanrDFGJdIFDAOpt/K9
 /FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXHPGPloU1tq9L5RfDiL3Hd1aT2d/fNx+Yg3ShJ4SUA=;
 b=JXZshTmd5rx73+rIgImtZbFfe88VijBd4E3Z6pt7S1opslM+ZBF65cVNk39xX6tgeE
 SPMAUeJKDIy6bADQkj6c6mb/SrlmGAZABrjGyvNMGdiu6J60yoarh5NL8wBkmxECi0u2
 rfxPgR83xSXwTGV6B7CnQzm+Mb5n2I+4vMeMfL0FtL5fQGfHC44St5nzXOx8b7TE4Ss2
 vS79TXUF0oYUK2neDK9NH/LHQvWIsdhoI0UmIOWd5OgBGFe45526QOjCEoKi/2w9EaI4
 glHTMSN11n9juy+6M2rvl4tUkOlDBzRsBR9XysV2yBN2mgnhd88e2YePaYcZdj3lrfyD
 7tIA==
X-Gm-Message-State: AOAM531aGjB56xzPIow0zFCE7nMTtPOmcXJqW4bYAVgtw70xBGr3RjPI
 StWWmz7BksL/kRZIKEIOVW600qdLuX0HTA==
X-Google-Smtp-Source: ABdhPJzCkULxBybrVy80hQfzZ+Oz8ftgBOAFp1CRGm6SIlMqNLJdmL4ZmAh/qRqgxwXorSihDnqg4w==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr3028935wmi.75.1605007174085;
 Tue, 10 Nov 2020 03:19:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] hw/arm/musicpal: Don't connect two qemu_irqs directly to
 the same input
Date: Tue, 10 Nov 2020 11:19:13 +0000
Message-Id: <20201110111917.29539-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The MusicPal board code connects both of the IRQ outputs of the UART
to the same INTC qemu_irq. Connecting two qemu_irqs outputs directly
to the same input is not valid as it produces subtly wrong behaviour
(for instance if both the IRQ lines are high, and then one goes
low, the INTC input will see this as a high-to-low transition
even though the second IRQ line should still be holding it high).

This kind of wiring needs an explicitly created OR gate; add one.

Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201107193403.436146-5-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 17 +++++++++++++----
 hw/arm/Kconfig    |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 5eb3f969fb4..ebc3ec24ef7 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -27,6 +27,7 @@
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
+#include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
@@ -77,8 +78,7 @@
 #define MP_TIMER4_IRQ           7
 #define MP_EHCI_IRQ             8
 #define MP_ETH_IRQ              9
-#define MP_UART1_IRQ            11
-#define MP_UART2_IRQ            11
+#define MP_UART_SHARED_IRQ      11
 #define MP_GPIO_IRQ             12
 #define MP_RTC_IRQ              28
 #define MP_AUDIO_IRQ            30
@@ -1589,6 +1589,7 @@ static void musicpal_init(MachineState *machine)
     ARMCPU *cpu;
     qemu_irq pic[32];
     DeviceState *dev;
+    DeviceState *uart_orgate;
     DeviceState *i2c_dev;
     DeviceState *lcd_dev;
     DeviceState *key_dev;
@@ -1627,9 +1628,17 @@ static void musicpal_init(MachineState *machine)
                           pic[MP_TIMER2_IRQ], pic[MP_TIMER3_IRQ],
                           pic[MP_TIMER4_IRQ], NULL);
 
-    serial_mm_init(address_space_mem, MP_UART1_BASE, 2, pic[MP_UART1_IRQ],
+    /* Logically OR both UART IRQs together */
+    uart_orgate = DEVICE(object_new(TYPE_OR_IRQ));
+    object_property_set_int(OBJECT(uart_orgate), "num-lines", 2, &error_fatal);
+    qdev_realize_and_unref(uart_orgate, NULL, &error_fatal);
+    qdev_connect_gpio_out(DEVICE(uart_orgate), 0, pic[MP_UART_SHARED_IRQ]);
+
+    serial_mm_init(address_space_mem, MP_UART1_BASE, 2,
+                   qdev_get_gpio_in(uart_orgate, 0),
                    1825000, serial_hd(0), DEVICE_NATIVE_ENDIAN);
-    serial_mm_init(address_space_mem, MP_UART2_BASE, 2, pic[MP_UART2_IRQ],
+    serial_mm_init(address_space_mem, MP_UART2_BASE, 2,
+                   qdev_get_gpio_in(uart_orgate, 1),
                    1825000, serial_hd(1), DEVICE_NATIVE_ENDIAN);
 
     /* Register flash */
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c9f60e82516..7d022eeefdb 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -93,6 +93,7 @@ config MUSCA
 
 config MUSICPAL
     bool
+    select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
     select PTIMER
-- 
2.20.1


