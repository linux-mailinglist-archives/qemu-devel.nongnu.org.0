Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE36647A3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHks-0004QU-P9; Tue, 10 Jan 2023 11:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkL-00048y-R9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkJ-0006Qu-Vg
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:09 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so7566800wma.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fiw9Fg+p/b/j5dB2Y7ot3w6ih2sYibESUE4ugSZG2HU=;
 b=lvZKso0OLD7UZt4Kw7hqdjQaaufZBzyBplHVmkt+ENOOdpiKkwLSjVIrZlRRUPTZF6
 bVX3qVsWXkf0WwVDDTpu/vmk0+Hij015K8suDYMuUNoX96QrUiUh91DCqrhW7gzG9k0f
 9XA2JkWzVt3m0tVD2Sd5jiw7/5F5536EoR7Q+lvIFfLMT82eJCOsFXI0fcBGNOsxkm2c
 1P77PtWvcml6hphMeTJ+P+prMGYBLwu64ayohuY8IMWqQ7CmGnVtjx5rPteoiyRXIz+N
 ze0b9gldvJBSBwZT2ejGnsJ5JZbvneywEOco7/e8TCh3LmawC+5n6Kzl1tUR1G/70dtx
 I7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fiw9Fg+p/b/j5dB2Y7ot3w6ih2sYibESUE4ugSZG2HU=;
 b=l6O6NSS+4wV3UyW9xm1y02zKNvppilsvsIbvZM/VqJdY2Xo7r9F952DxGyxNLzqpt7
 WX39aLZpmN3eDOFLlhOb3a6hGFdyHzemsMzXQ3N4lwufRXq6AzuVIiH9i+ldWvB9ZKcl
 UaMjzvPXzxudkdDujh/giygNOmgUkzPJwYhBbqdZerq7H9M/XczLFrM+qoZFsCqGVDli
 HaxltCWgTLGtRAKpKbk1mrHTihsl1kSD8UdMhTqrgPYS4bhVWUFFmb983RyZBq8fa4wt
 HoDow3gtWpE6J4EbnT+Cl0U3piZMVLZsQ3j8FsgZK4BJ0JpE99KmfL62BvePjh8Tpjfr
 hAyg==
X-Gm-Message-State: AFqh2kqzcCbPooyAq3AgzkbGAMkVqkfHHcPx/GuQiHsLLFAti/g14Nwj
 DrmfhN9BQW4UxcUouDiY6+no4MQA2T+5/Cbx
X-Google-Smtp-Source: AMrXdXv4D9QWe1vkSRV3vbBOYq0Xr/Hb+KwQ050qlpMvVl9ekaO9o+6aVPmoVHLS+R93ZzPoVNmCRA==
X-Received: by 2002:a05:600c:5006:b0:3d2:3eda:dd1 with SMTP id
 n6-20020a05600c500600b003d23eda0dd1mr50317185wmr.17.1673369105106; 
 Tue, 10 Jan 2023 08:45:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b003c21ba7d7d6sm16729392wmn.44.2023.01.10.08.45.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:04 -0800 (PST)
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
Subject: [PATCH 10/18] hw/arm: Move various armv7m-related units to
 softmmu_ss[]
Date: Tue, 10 Jan 2023 17:43:58 +0100
Message-Id: <20230110164406.94366-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

In the previous commit we remove the indirect dependency on
"target/arm/cpu.h" from all these ARMv7-M units:

 - armsse.c
 - msf2-som.c
 - microbit.c
 - mps2-tz.c
 - mps2.c
 - msf2-soc.c
 - musca.c
 - netduino2.c
 - netduinoplus2.c
 - nrf51_soc.c
 - stellaris.c
 - stm32f100_soc.c
 - stm32f205_soc.c
 - stm32f405_soc.c
 - stm32vldiscovery.c

We can now move them to meson's softmmu_ss[] source set to
buid them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/meson.build | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index f742107847..f7e1d4add6 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
@@ -11,8 +10,6 @@ arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
-arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
-arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
@@ -26,9 +23,6 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
-arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
-arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
-arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
@@ -40,27 +34,36 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
   'fby35.c'))
-arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
-arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
-arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
-arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
-arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 softmmu_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
+softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
 softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
+softmmu_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
+softmmu_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
+softmmu_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
+softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
+softmmu_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 softmmu_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
+softmmu_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
+softmmu_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
+softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
 softmmu_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
+softmmu_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
+softmmu_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 softmmu_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 softmmu_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
-- 
2.38.1


