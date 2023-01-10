Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF01664A35
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHkr-0004M4-Uf; Tue, 10 Jan 2023 11:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkF-00047N-Gs
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHk8-0006BH-IJ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g10so9277617wmo.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/0g35X8RCbLApBOikwSe17fRgsPoVyHjk1OgD/s9Ok=;
 b=N91myAJfqWQri07k8RCSFabtqm4dA4eQU/JF9nrZvoS/GV6C97NTxWU9P8a8VJ6yXZ
 kJV/YYpbljU0w6pZQ6np2ebjR88GjULZkNo9VRgAwjIdaQNdE48dHmW2tSjob4OB6y/K
 r5gMWZx8anhdUDenPWn9SW7hMquIL2Y9ooQdQiU47Vfmaqvn7kCqmyLby9XG7/GOjihy
 qwF06ZV22IYC58pkmv/2Wu+lEIfuzfMgQSXGei82Bfow6BstBA9H6atO48IeuDEUJA9X
 t+NpZwFxhqhb0BPiB/JsEZzx+E2ivD8JAEx5jfFh2g0VveajulrP7hJHqJdETZw9FPtM
 zUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/0g35X8RCbLApBOikwSe17fRgsPoVyHjk1OgD/s9Ok=;
 b=SLBhlY2iWx8wkp2HBwOy3JgnH0HxJuhiym7DYJRuNtkTtKbg6UK2VwX2fLRJ5lCEF6
 EI36WRxKWAH6yR3TurJVgO1e/3b6XQyJKrI7A0TUYKyCh76N+88JbgX/db7DFaMKOlCr
 WparCqibGgeANmdLuzZVSK6gF8FNDcuaC8ZSClZAWrdTfGzjR9yN4RGGvktLM4vjeG9E
 vHRkSDedS53JzwmAmjcCD6xJhoLlou43iIwzEfYFUQ6Uo0C9ZFgeNmudJ1hB3vQTvNN8
 zFZK7QDjKUcWYRg1MK/VGZkY4y+yLZKQejp8VStQztT8tUiESPzynyetk7u9geQxcFtN
 rYcQ==
X-Gm-Message-State: AFqh2koqQ4iZqu2TiK0zeiO7Pdwrm1KzBzkfQHv621V6xmFL4six46Ku
 J+0zeIfbpVPk6bzlb+5UGb07Vwd8AWqm2NJp
X-Google-Smtp-Source: AMrXdXs8Deq+tTL79P7JUnQrUG7AyALXUMxVsedPrR0Pgr/46TDd+mNOq5S/YkKI7fUxgMLTM65oew==
X-Received: by 2002:a05:600c:22cc:b0:3d1:bd81:b1b1 with SMTP id
 12-20020a05600c22cc00b003d1bd81b1b1mr49056544wmg.18.1673369094362; 
 Tue, 10 Jan 2023 08:44:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm17668064wmq.42.2023.01.10.08.44.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:54 -0800 (PST)
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
Subject: [PATCH 08/18] hw/arm: Move units to softmmu[] by replacing "{target
 -> hw}/arm/cpu.h"
Date: Tue, 10 Jan 2023 17:43:56 +0100
Message-Id: <20230110164406.94366-9-philmd@linaro.org>
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

The following units only require the definitions exposed
by "hw/arm/cpu.", not "target/arm/cpu.h":

 - highbank.c
 - integratorcp.c
 - mainstone.c
 - musicpal.c
 - palm.c
 - spitz.c
 - strongarm.c

Once the "target/arm/cpu.h" replaced, we can move the units
from meson's arm_ss[] to softmmu_ss[] to build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/highbank.c     |  2 +-
 hw/arm/integratorcp.c |  2 +-
 hw/arm/mainstone.c    |  2 +-
 hw/arm/meson.build    | 14 +++++++-------
 hw/arm/musicpal.c     |  2 +-
 hw/arm/palm.c         |  2 +-
 hw/arm/spitz.c        |  2 +-
 hw/arm/strongarm.c    |  2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f12aacea6b..5aaf2876e9 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -23,6 +23,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/cpu.h"
 #include "hw/loader.h"
 #include "net/net.h"
 #include "sysemu/runstate.h"
@@ -35,7 +36,6 @@
 #include "hw/cpu/a15mpcore.h"
 #include "qemu/log.h"
 #include "qom/object.h"
-#include "cpu.h"
 
 #define SMP_BOOT_ADDR           0x100
 #define SMP_BOOT_REG            0x40
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index b109ece3ae..457db610dc 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/boards.h"
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 68329c4617..cb8ee05d0d 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -15,6 +15,7 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "hw/arm/cpu.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/boot.h"
 #include "net/net.h"
@@ -23,7 +24,6 @@
 #include "hw/block/flash.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 
 /* Device addresses */
 #define MST_FPGA_PHYS	0x08000000
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 7c71798661..f742107847 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -4,17 +4,11 @@ arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
-arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
-arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
-arm_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
 arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
-arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
-arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
-arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
@@ -29,7 +23,6 @@ arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
 arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
 arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
-arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
@@ -58,10 +51,17 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 softmmu_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
+softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
+softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
+softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
+softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
+softmmu_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 softmmu_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 softmmu_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 73e2b7e4ce..07cd80bc13 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 68e11dd1ec..6d637d7079 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -29,7 +29,7 @@
 #include "hw/input/tsc2xxx.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
-#include "cpu.h"
+#include "hw/arm/cpu.h"
 #include "qemu/cutils.h"
 #include "qom/object.h"
 
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index f732fe0acf..4628b60792 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -33,7 +33,7 @@
 #include "hw/adc/max111x.h"
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 enum spitz_model_e { spitz, akita, borzoi, terrier };
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 39b8f01ac4..025bd38dc7 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -28,7 +28,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
-- 
2.38.1


