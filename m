Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E232AD572
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:39:36 +0100 (CET)
Received: from localhost ([::1]:50458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRzr-00010e-La
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgZ-0002Fr-2a
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:39 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgW-0006rO-En
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:38 -0500
Received: by mail-wr1-x444.google.com with SMTP id 33so12235448wrl.7
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BghcIqXYvmJfNsOh/qv6Ssbfk8n2rpw36DfEAPLLbyY=;
 b=IH0VJj7QPz7I+u5lyZL9D0zd4cTwqaJOYlrzkUSDeS4HqqwyBE7lESSOt+zrbTvfQ9
 QF3KQGMZroy896+6DkvmBFA+QTW8x/Kc7VvmJ2jtXvaCZasqv/gW4i+ig7ab5PcJHAQk
 Lp6a5A3rgRvp+WrwO06iyVaixcikAbBaWP/pmb0CALKpFaJUTwcOY+nqJktIcHN7s1hn
 yw53pp4awSqLPKRh6lYvMG92xZQAleS2fAh7rpnYPQjxiUcNBoMLBBH+SUa6Dvsv69yO
 s2c2P96t8kkne5xLmDhypP3WiblI3oYZrgCqPx1ITpfAw8deWcRTiVYOOlsNZGiC/+oX
 KJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BghcIqXYvmJfNsOh/qv6Ssbfk8n2rpw36DfEAPLLbyY=;
 b=cr5Btg9jFT2hN8ZwFwZPoYv7ugoRjOBR5nTro1JVo19zn2WCkNyTI+27lsP2qSvXx0
 cVGaBPks9LhbKWI57a5E9PLixryVTWtdzJM8TkUjOyDOBW+3WSkD4E9uP1HZ8fVQyEH4
 cg9eSRcpZvbRmV0G+5XvLhkSy88JMElQNDHljdgggIndzpJKDtsxu1z+/mLEnSgkzFel
 6YM8HKbvl4JmsECIL5u6l1nO1NuIOM/md3oA9UyplTe1u9RgT7JbzojjKCt2y5glBEIu
 2T80AIuGd2pGUOgz3y8g2Ax1kxK3DHyZFP5eZZvrs9T1T/FE9tQUR+uaRiVRVfq6Zioa
 sJzQ==
X-Gm-Message-State: AOAM533nHz50XVa4ruL3oRIigl+a17s1FOFfmvNK2udOd+9+M81Nx4V+
 0mH/FgII8deVXMIyMtDL3M1Z6ePAnqk7vg==
X-Google-Smtp-Source: ABdhPJyh/4HWuc+DuuWxMnQ5cVrljUkGYpBlR5CUccryGRMlHwKi3JQOemDURVC36mqWjV9EZRisww==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr23094240wrp.276.1605007174903; 
 Tue, 10 Nov 2020 03:19:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] hw/arm/musicpal: Only use qdev_get_gpio_in() when
 necessary
Date: Tue, 10 Nov 2020 11:19:14 +0000
Message-Id: <20201110111917.29539-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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

We don't need to fill the full pic[] array if we only use
few of the interrupt lines. Directly call qdev_get_gpio_in()
when necessary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201107193403.436146-6-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index ebc3ec24ef7..458b1cbeb76 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1587,8 +1587,8 @@ static struct arm_boot_info musicpal_binfo = {
 static void musicpal_init(MachineState *machine)
 {
     ARMCPU *cpu;
-    qemu_irq pic[32];
     DeviceState *dev;
+    DeviceState *pic;
     DeviceState *uart_orgate;
     DeviceState *i2c_dev;
     DeviceState *lcd_dev;
@@ -1619,20 +1619,20 @@ static void musicpal_init(MachineState *machine)
                            &error_fatal);
     memory_region_add_subregion(address_space_mem, MP_SRAM_BASE, sram);
 
-    dev = sysbus_create_simple(TYPE_MV88W8618_PIC, MP_PIC_BASE,
+    pic = sysbus_create_simple(TYPE_MV88W8618_PIC, MP_PIC_BASE,
                                qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
-    for (i = 0; i < 32; i++) {
-        pic[i] = qdev_get_gpio_in(dev, i);
-    }
-    sysbus_create_varargs(TYPE_MV88W8618_PIT, MP_PIT_BASE, pic[MP_TIMER1_IRQ],
-                          pic[MP_TIMER2_IRQ], pic[MP_TIMER3_IRQ],
-                          pic[MP_TIMER4_IRQ], NULL);
+    sysbus_create_varargs(TYPE_MV88W8618_PIT, MP_PIT_BASE,
+                          qdev_get_gpio_in(pic, MP_TIMER1_IRQ),
+                          qdev_get_gpio_in(pic, MP_TIMER2_IRQ),
+                          qdev_get_gpio_in(pic, MP_TIMER3_IRQ),
+                          qdev_get_gpio_in(pic, MP_TIMER4_IRQ), NULL);
 
     /* Logically OR both UART IRQs together */
     uart_orgate = DEVICE(object_new(TYPE_OR_IRQ));
     object_property_set_int(OBJECT(uart_orgate), "num-lines", 2, &error_fatal);
     qdev_realize_and_unref(uart_orgate, NULL, &error_fatal);
-    qdev_connect_gpio_out(DEVICE(uart_orgate), 0, pic[MP_UART_SHARED_IRQ]);
+    qdev_connect_gpio_out(DEVICE(uart_orgate), 0,
+                          qdev_get_gpio_in(pic, MP_UART_SHARED_IRQ));
 
     serial_mm_init(address_space_mem, MP_UART1_BASE, 2,
                    qdev_get_gpio_in(uart_orgate, 0),
@@ -1674,14 +1674,15 @@ static void musicpal_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, MP_ETH_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[MP_ETH_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
+                       qdev_get_gpio_in(pic, MP_ETH_IRQ));
 
     sysbus_create_simple("mv88w8618_wlan", MP_WLAN_BASE, NULL);
 
     sysbus_create_simple(TYPE_MUSICPAL_MISC, MP_MISC_BASE, NULL);
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
-                               pic[MP_GPIO_IRQ]);
+                               qdev_get_gpio_in(pic, MP_GPIO_IRQ));
     i2c_dev = sysbus_create_simple("gpio_i2c", -1, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
@@ -1713,7 +1714,7 @@ static void musicpal_init(MachineState *machine)
                              NULL);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
-    sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(pic, MP_AUDIO_IRQ));
 
     musicpal_binfo.ram_size = MP_RAM_DEFAULT_SIZE;
     arm_load_kernel(cpu, machine, &musicpal_binfo);
-- 
2.20.1


