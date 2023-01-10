Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADC6648D9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHl1-0004bm-Kj; Tue, 10 Jan 2023 11:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkv-0004a8-UP
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkr-0006Qr-Ih
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ay40so9278568wmb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBfsDWznx6tTCpJqF4G0yaUMUab40XH3oUrTJlLuOAc=;
 b=Q1Hf8PcnDurO/pGRztswZA4ojK+XIGZ+kZ0mpmEl4K/NeCjqTsuSccaJPMM++ci3p4
 P9JOJ+zZM45adzqNUCulSZt1Lpk/baJ6p3XMsgbT1D8GL2ZXZI5tiWZb98y0PW9WGbDe
 rm4MgKMH4CBqzN7r/MHn+BeaBTf04QQOxlcr/gRitbsNHA2VrHs7z0QZdvKXA3ICGSaS
 /yyrYV7UsA6vNxim+NuIx818bKg1c6Pi3V0EaZ1yXD3tzwChUBmkjtfP66PN++mBjFRE
 fh1BL9bv1yLHZKTSXSArBL8HcW7/DHuOfsf6k4Dvavu89NrRTJU+UrZVz79P1TGJ56bC
 z23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBfsDWznx6tTCpJqF4G0yaUMUab40XH3oUrTJlLuOAc=;
 b=xljvlL8tyHgG7cgNl+hQb2Kav913FAdtTcBLZ1hocwaRN/VOyJ6j/FZAWId7dlEJcS
 mAzRHJTwaasI7YWXSBz1kh2dhFaqJ1WgYNmhchf65kiKusK9r7CUpc14ArmGs9JaZjID
 jrbI+iVbS02S6n02PaK/Bsy3o7oCfXOJwP/RiCJQJp0ekBQd7iuV82nh1Oax/rj0Aagx
 xSwsU9bJjscfNjsUJTz+BXcow7p5NsOZR/HKK9aE5jdBKsdINGkCxbUbvQYtMq/RRA4z
 uXpKz09Vh4pFmHHgISOPYLazJtyU3hT5ew8E+oWzVcipLR1ZGoaxEoQsVU7xaJIorUs0
 bHSQ==
X-Gm-Message-State: AFqh2kreyGHsi/F5XJNjfQRU3V04Y9A7arrtn84KJS9Hf1bjW534RyjP
 IqzN4tft+F7mN1lT38DnYJ79S3M6jNCoXhb5
X-Google-Smtp-Source: AMrXdXvDHwRvAqIH9Pj4ZVntUfLbrZ99eoOz8BgIOBBcdQnI1KBBDc0tqwuJfimooMoJm7oBWUEpDw==
X-Received: by 2002:a05:600c:46c7:b0:3d9:ee3d:2f54 with SMTP id
 q7-20020a05600c46c700b003d9ee3d2f54mr6894261wmo.13.1673369132823; 
 Tue, 10 Jan 2023 08:45:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm26965063wmq.18.2023.01.10.08.45.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:32 -0800 (PST)
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
Subject: [PATCH 15/18] hw/arm/fsl-imx31: Replace object_initialize(ARMCPU) by
 object_new()
Date: Tue, 10 Jan 2023 17:44:03 +0100
Message-Id: <20230110164406.94366-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Replace the ARMCPU field in FslIMX25State by a reference to
an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx31.c
 - kzm.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx31.c         | 9 +++++----
 hw/arm/kzm.c               | 2 +-
 hw/arm/meson.build         | 2 +-
 include/hw/arm/fsl-imx31.h | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index def27bb913..26c6bb67f0 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -32,7 +32,8 @@ static void fsl_imx31_init(Object *obj)
     FslIMX31State *s = FSL_IMX31(obj);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm1136"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("arm1136")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     object_initialize_child(obj, "avic", &s->avic, TYPE_IMX_AVIC);
 
@@ -65,7 +66,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     uint16_t i;
     Error *err = NULL;
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
@@ -74,9 +75,9 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->avic), 0, FSL_IMX31_AVIC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
         return;
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index b1b281c9ac..8c6cdb06f5 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -126,7 +126,7 @@ static void kzm_init(MachineState *machine)
     kzm_binfo.ram_size = machine->ram_size;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu, machine, &kzm_binfo);
+        arm_load_kernel(s->soc.cpu, machine, &kzm_binfo);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index ccda1f5149..b244db5962 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -20,7 +20,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orange
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
@@ -41,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index c116a73e0b..c117136901 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -27,7 +27,7 @@
 #include "hw/gpio/imx_gpio.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX31 "fsl-imx31"
@@ -43,7 +43,7 @@ struct FslIMX31State {
     DeviceState parent_obj;
 
     /*< public >*/
-    ARMCPU         cpu;
+    ARMCPU         *cpu;
     IMXAVICState   avic;
     IMX31CCMState  ccm;
     IMXSerialState uart[FSL_IMX31_NUM_UARTS];
-- 
2.38.1


