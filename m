Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A2664C1B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHku-0004XX-Tf; Tue, 10 Jan 2023 11:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkg-0004M0-0i
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHke-0006Ru-7j
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bs20so12432883wrb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jw5bJZJ8xtvZB9vBJ7QEumcG+hXUdxVdMxAlu6Wbtrc=;
 b=Hl8jOjdbKH2R38BAeI6ASttWVsQavPQfsuy5IQUVlTFCjGlc4djljtxqV+iQAputSm
 F4LtNrZnQD1ipXn3bCj/BxdmuGjbLlv5LYy5wnjpTMyjAXFsKy+2Z7op0X7EmPvS7vEn
 UaTTtfCtIKWLNezAphhYiM8Sfxh0yV5/VasDlpRHQXtGIgarVjd3qOIJSQyRHQczYx51
 HHAAcIWRaY4vvlzA1mnfq6pAkqWZruwLWdJE2dwNQi/Innb9UlRwSsrINZvAsdgm3BLt
 ZwzcA1FgtZGYveocet5QsazphNSjtDVGYklJIPwZ8D4+eOEiIADTgcR+TaITaapmb0ur
 ZyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jw5bJZJ8xtvZB9vBJ7QEumcG+hXUdxVdMxAlu6Wbtrc=;
 b=qGMDFx87WajG740Hez5mJ/2PcJMFQk4sfyV3VuD7SV2D++cfEtFamNc2+adsrW0gEs
 hg9GLsVbyplRHyntRRgoFGkKkrZRDlmRfYkpeXWnuk2NUDbcBslixvy4i1Vz/aihZacP
 2Rjwyekq1W/e8Dp2pH8y1pCEpkVwNSP7X+Pq4PpdTBF3jxP7DxraOyQYL7oPt6CA/k8P
 G/GZOmzlsLJf1CnbOQMamm1h5pRzD1+5jucLhToI6GDZDv1v4Flp+2JAZhGP9yEWo+8J
 LnQSuO3fEGTfNtFUK9Fi770dKHudtSMDvJ2Pv6dkcKBIWtWLdCzx4M7mbHqME+APR6vA
 VF1w==
X-Gm-Message-State: AFqh2koD6bcLG9lJMIUj5wB2TGfWA188NoxidGiqyNvTPE+rpTt4oxj2
 VCKii8O6osCeAkYmgabJboZNfL0+dK3tn50V
X-Google-Smtp-Source: AMrXdXvTJgF900lEII2ecG1KpIa1Yy6xKTgj7RZHtvwbpI55WJY0Lc7o3cdsimloWFOhsnJdbrg4KQ==
X-Received: by 2002:a5d:5c12:0:b0:242:800:9a7f with SMTP id
 cc18-20020a5d5c12000000b0024208009a7fmr46571768wrb.65.1673369127328; 
 Tue, 10 Jan 2023 08:45:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adff611000000b00236488f62d6sm11447536wrp.79.2023.01.10.08.45.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:27 -0800 (PST)
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
Subject: [PATCH 14/18] hw/arm/fsl-imx25: Replace object_initialize(ARMCPU) by
 object_new()
Date: Tue, 10 Jan 2023 17:44:02 +0100
Message-Id: <20230110164406.94366-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Replace the ARMCPU field in FslIMX25State by a reference to
an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx25.c
 - imx25_pdk.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx25.c         | 9 +++++----
 hw/arm/imx25_pdk.c         | 2 +-
 hw/arm/meson.build         | 2 +-
 include/hw/arm/fsl-imx25.h | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 24c4374590..5213c1ac23 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -36,7 +36,8 @@ static void fsl_imx25_init(Object *obj)
     FslIMX25State *s = FSL_IMX25(obj);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm926"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("arm926")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     object_initialize_child(obj, "avic", &s->avic, TYPE_IMX_AVIC);
 
@@ -83,7 +84,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     uint8_t i;
     Error *err = NULL;
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
@@ -92,9 +93,9 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->avic), 0, FSL_IMX25_AVIC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
         return;
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index b4f7f4e8a7..26fc0ef5ae 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -136,7 +136,7 @@ static void imx25_pdk_init(MachineState *machine)
      * fail.
      */
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu, machine, &imx25_pdk_binfo);
+        arm_load_kernel(s->soc.cpu, machine, &imx25_pdk_binfo);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0c7554b763..ccda1f5149 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -20,7 +20,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orange
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
@@ -41,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
 softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 1b1086e945..9ad95073c2 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -31,7 +31,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX25 "fsl-imx25"
@@ -50,7 +50,7 @@ struct FslIMX25State {
     DeviceState parent_obj;
 
     /*< public >*/
-    ARMCPU         cpu;
+    ARMCPU         *cpu;
     IMXAVICState   avic;
     IMX25CCMState  ccm;
     IMXSerialState uart[FSL_IMX25_NUM_UARTS];
-- 
2.38.1


