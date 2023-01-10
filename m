Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933166478C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHkw-0004ZZ-6Z; Tue, 10 Jan 2023 11:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkY-0004FR-FT
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:22 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkV-0006TC-FO
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id e3so3214544wru.13
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3l0Ynfg0AmbqqJf0HR+g3W0vw/8lhngqGaDSaJXNM0=;
 b=qAHQ6YqDzVjo6VtREvLTuK2lE4b/rDxmTZFAYzRJWGjZYTFRPhlmDtijmGvdWAR3lu
 zmRJkbiBE8CLjnsL86+gcVzA89BS5jLqowasItgajTLo8fgMOQHYodAEzddZhY+2hEDq
 m36H0aPSPMSJw9BXCLRMFMsTMfVSuCc2o4G1uKTL1rIKobUxXg1wNzyu2XHC0P69ip+h
 2B+Dgt0lMWG+G87bCsHdBQdf+E4qDTjKGDi2HQJzZIRPsLzeCSjw04dauAECwDNyBekk
 yEsGpVWNamUoBgRZHJbgZqpOrBcm5ywXC7N6KzS6pMgzGtDQ8Qcuoxww1BK+Il3W5rc0
 y31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3l0Ynfg0AmbqqJf0HR+g3W0vw/8lhngqGaDSaJXNM0=;
 b=WVgk2Xm9UlQpUEcSC282oDRBcpfqDOYoEDweFFtsMUKx8QT1VaQ2Hb8VKi/G9G06xN
 iSbCsLr2yoFgvUWgC+snhzYgRdChshqXvcguByViWAWtvHr3etrypTe9Csi7C1oZaqx4
 Sv+ueki9MzCw44qH8ci3+JURD1DPAUZwg0Oo1XPW9qNBwoBdfpONox2VLsU85l/ew+gl
 dt0UPg5RlXanlTUnUVZmsKtsUMafm5SP9wmH3pXVfOGb2mr23zzoXVnGYfKZ5MUyRnhN
 pkJQWAa+fd9U+IlzlX0YuXhUGzWcZd1MskAQjFu9rTcQ1f++M/+/ednbraARwRi4tewZ
 Jx4g==
X-Gm-Message-State: AFqh2ko25p27B+02U6wKXY2Xo2ZUPevOSfDBPaYYVgR9BYK1z/2wrvAL
 pyPcuIscHKYpk2n8BQ7Qtd5/xU1bUrvcq2Gb
X-Google-Smtp-Source: AMrXdXuWjJh1Th++nXBH4Taufu66ecbLbhvMfVIIvnbFPN7z73mF6+B79oWF/yP4uiTD6zIUn465GQ==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id
 bv20-20020a0560001f1400b002425a34fb7bmr44629557wrb.70.1673369116060; 
 Tue, 10 Jan 2023 08:45:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e35-20020a5d5963000000b00276d8c2332fsm13010729wri.108.2023.01.10.08.45.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:15 -0800 (PST)
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
Subject: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by
 object_new(ARMCPU)
Date: Tue, 10 Jan 2023 17:44:00 +0100
Message-Id: <20230110164406.94366-13-philmd@linaro.org>
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

Replace the ARMCPU field in DigicState by a reference to
an allocated ARMCPU. Instead of initializing the field
with object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move digic.c from arm_ss[] to the more generic softmmu_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic.c         | 7 ++++---
 hw/arm/meson.build     | 7 ++-----
 include/hw/arm/digic.h | 4 ++--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 6df5547977..fe24b91db6 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -36,7 +36,8 @@ static void digic_init(Object *obj)
     DigicState *s = DIGIC(obj);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("arm946")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
         g_autofree char *name = g_strdup_printf("timer[%d]", i);
@@ -52,12 +53,12 @@ static void digic_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd;
     int i;
 
-    if (!object_property_set_bool(OBJECT(&s->cpu), "reset-hivecs", true,
+    if (!object_property_set_bool(OBJECT(s->cpu), "reset-hivecs", true,
                                   errp)) {
         return;
     }
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index f7e1d4add6..0c7554b763 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -2,10 +2,6 @@ arm_ss = ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
-arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
-arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
-arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
@@ -18,7 +14,6 @@ arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
 arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
-arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
 arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
@@ -42,6 +37,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 softmmu_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
+softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
+softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index 646802806e..1bfd6788c9 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -18,7 +18,7 @@
 #ifndef HW_ARM_DIGIC_H
 #define HW_ARM_DIGIC_H
 
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/timer/digic-timer.h"
 #include "hw/char/digic-uart.h"
 #include "qom/object.h"
@@ -34,7 +34,7 @@ struct DigicState {
     DeviceState parent_obj;
     /*< public >*/
 
-    ARMCPU cpu;
+    ARMCPU *cpu;
 
     DigicTimerState timer[DIGIC4_NB_TIMERS];
     DigicUartState uart;
-- 
2.38.1


