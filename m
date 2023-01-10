Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9A664A13
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHl5-0004gE-JP; Tue, 10 Jan 2023 11:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHl2-0004e2-1A
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHl0-0006TC-57
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:51 -0500
Received: by mail-wr1-x436.google.com with SMTP id e3so3216271wru.13
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBydh7B8hYLxHUy1ooqqzKsa7vKzeuojzCpUBa1Purc=;
 b=xsXTB0IF08/MO+3CseRttkpCsNVVcSxRSzu4td5RO8H6MZyVine2ioY4WowLOpzIs8
 GGf3/Ghud6upzcyRBITSig5QICfqF7PeYBsRHH5dFLFiiEsgqYt2FmQz3sB7V2xnlV06
 F5KuAdoIzimrBxH/pR60dR4RI6luYbwLjEVtj/Px9FXyAMduVhSttWO6wDSNm2SSwAQV
 CNLR7gLqitswepayEhyMf7oa/Ca04PcFGiXDx+ny6YPpxpCLc9FJu8q1dlx5verHlGAT
 SIXEaYGO+gb9xZSfYGELeAW/hxwoazQAxFLUqM3VwjEM89ObaWmtMkKn8VkJwk0jUvwg
 2B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBydh7B8hYLxHUy1ooqqzKsa7vKzeuojzCpUBa1Purc=;
 b=AWi1DImCSUzEFm/hbp7AJN954NTj57S6KZjLkHSQJTUppaAVaI2V+W9bEBQYzxeUxy
 iGY89pHZZz190+AqwJ6jn5XL8MNzbq0FOLsvyUPn1tSi15LSNAXPnAMJeM8cuWQbqJuS
 j8j08ipevixGl77eplveNdmyNqsL8isuP9ZZyBxW418N+kXEr5M38UI5d2DkF8A5SrSL
 IuFTv8/Svvvu4gm96j3+oxcgHpFvKcvHSTTp/5cClzmPCjAcngEcHhKloSbXxtETd8bw
 JLhXamPHFzyWerBqGoGgudnPKhHxMhGOeizWezTjKdpvRdvTtcg+gyEfL32pOS0Y0SeU
 hLvA==
X-Gm-Message-State: AFqh2kq9ueYjlI9hscd3WAbHWFGK5vML1YKi/mQCsKo3Go/XQR+i7mxR
 3rSWK9T+e+1Ypp8MNHMNNZO22KlUUZYt7I92
X-Google-Smtp-Source: AMrXdXvXRgn1kFIfW4g2RqxLe1FCZ1jLr20UXAN8+RiQUwl/DL0v+RuQT4cszAUSkyb2cPOHvt3cKQ==
X-Received: by 2002:adf:eb89:0:b0:24f:a289:b422 with SMTP id
 t9-20020adfeb89000000b0024fa289b422mr38744329wrn.16.1673369149211; 
 Tue, 10 Jan 2023 08:45:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adf9dcb000000b00268aae5fb5bsm11894429wre.3.2023.01.10.08.45.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 18/18] hw/arm/allwinner: Replace object_initialize(ARMCPU) by
 object_new()
Date: Tue, 10 Jan 2023 17:44:06 +0100
Message-Id: <20230110164406.94366-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Replace the ARMCPU field in both AwA10State / AwH3State by a
reference to an allocated ARMCPU. Instead of initializing the
field with object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - allwinner-a10.c
 - allwinner-h3.c
 - cubieboard.c
 - orangepi.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/allwinner-a10.c         | 10 +++++-----
 hw/arm/allwinner-h3.c          | 14 +++++++-------
 hw/arm/cubieboard.c            |  2 +-
 hw/arm/meson.build             |  4 ++--
 include/hw/arm/allwinner-a10.h |  4 ++--
 include/hw/arm/allwinner-h3.h  |  4 ++--
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 79082289ea..685673e7bd 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -39,8 +39,8 @@ static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
 
-    object_initialize_child(obj, "cpu", &s->cpu,
-                            ARM_CPU_TYPE_NAME("cortex-a8"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a8")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     object_initialize_child(obj, "intc", &s->intc, TYPE_AW_A10_PIC);
 
@@ -71,7 +71,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     AwA10State *s = AW_A10(dev);
     SysBusDevice *sysbusdev;
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
@@ -81,9 +81,9 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbusdev = SYS_BUS_DEVICE(&s->intc);
     sysbus_mmio_map(sysbusdev, 0, AW_A10_PIC_REG_BASE);
     sysbus_connect_irq(sysbusdev, 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(sysbusdev, 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
     qdev_pass_gpios(DEVICE(&s->intc), dev, NULL);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 308ed15552..1409101b3a 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -192,8 +192,8 @@ static void allwinner_h3_init(Object *obj)
     s->memmap = allwinner_h3_memmap;
 
     for (int i = 0; i < AW_H3_NUM_CPUS; i++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpus[i],
-                                ARM_CPU_TYPE_NAME("cortex-a7"));
+        s->cpus[i] = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a7")));
+        object_property_add_child(obj, "cpu[*]", OBJECT(s->cpus[i]));
     }
 
     object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
@@ -239,15 +239,15 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
          * Disable secondary CPUs. Guest EL3 firmware will start
          * them via CPU reset control registers.
          */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
+        qdev_prop_set_bit(DEVICE(s->cpus[i]), "start-powered-off",
                           i > 0);
 
         /* All exception levels required */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el2", true);
+        qdev_prop_set_bit(DEVICE(s->cpus[i]), "has_el3", true);
+        qdev_prop_set_bit(DEVICE(s->cpus[i]), "has_el2", true);
 
         /* Mark realized */
-        qdev_realize(DEVICE(&s->cpus[i]), NULL, &error_fatal);
+        qdev_realize(DEVICE(s->cpus[i]), NULL, &error_fatal);
     }
 
     /* Generic Interrupt Controller */
@@ -270,7 +270,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < AW_H3_NUM_CPUS; i++) {
-        DeviceState *cpudev = DEVICE(&s->cpus[i]);
+        DeviceState *cpudev = DEVICE(s->cpus[i]);
         int ppibase = AW_H3_GIC_NUM_SPI + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
         /*
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7..fcb366d4ac 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -96,7 +96,7 @@ static void cubieboard_init(MachineState *machine)
     /* TODO create and connect IDE devices for ide_drive_get() */
 
     cubieboard_binfo.ram_size = machine->ram_size;
-    arm_load_kernel(&a10->cpu, machine, &cubieboard_binfo);
+    arm_load_kernel(a10->cpu, machine, &cubieboard_binfo);
 }
 
 static void cubieboard_machine_init(MachineClass *mc)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index a7ee21e32f..06c9f1c86b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -14,8 +14,6 @@ arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
 arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
 arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
@@ -27,6 +25,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index f9240ffa64..3a3ccc390f 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,8 +13,8 @@
 #include "hw/usb/hcd-ohci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
+#include "hw/arm/cpu.h"
 
-#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 
@@ -30,7 +30,7 @@ struct AwA10State {
     DeviceState parent_obj;
     /*< public >*/
 
-    ARMCPU cpu;
+    ARMCPU *cpu;
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 63025fb27c..5e8be4392e 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -47,7 +47,7 @@
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "hw/rtc/allwinner-rtc.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
 /**
@@ -121,7 +121,7 @@ struct AwH3State {
     DeviceState parent_obj;
     /*< public >*/
 
-    ARMCPU cpus[AW_H3_NUM_CPUS];
+    ARMCPU *cpus[AW_H3_NUM_CPUS];
     const hwaddr *memmap;
     AwA10PITState timer;
     AwH3ClockCtlState ccu;
-- 
2.38.1


