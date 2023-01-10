Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B43664727
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:18:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHjY-0003pQ-VP; Tue, 10 Jan 2023 11:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjX-0003ok-Bn
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjV-00067k-KC
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so7564958wma.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1UvOGw1kKWk2oCncOSRw+9G4LoKd5mu7gj6ezPK4v8=;
 b=KP7J3iaAZ3p0trPjScaTftxGfKhSe3lCN9IT9MhIY8TwBgmm0j3PkUVDpDYA83Az9C
 ZVMWvpyOxZ5JA+qZFXie+kpd6fdZAGLr9QBoG7oOwZculXwRIiidGh9dVLE8imGtpE1y
 c0ch2FBpHvUgS+RrHwg18uABHPD3jDbkz2Unve3EG+J+rpAB/dLThXazNSQYM/deX4sb
 IMvJpqhxkK3739pRbnj1vUk1GhPIHYeXcQsRmtb61gYUR9E5/DT88Zk7e50STVMpMClu
 DqgDUQSwn0BaMsYjsUPAoyylAN2861l9tl2cG3FliPIk5KRiCcNMcPkCvJniFXFcH7Nq
 +PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u1UvOGw1kKWk2oCncOSRw+9G4LoKd5mu7gj6ezPK4v8=;
 b=5daKJcGSLUSCSlNAX1/swl34ZV1A3seGnNanQ+hHEAtCFvzAZDu+KGNrJwpkjDGIZo
 b/gAhmp6DmAHfcAnSsQJ8xxbdTLzztP72R9CBxYyzcrRkEvgXtG1U3v9IxZGOc38M9hU
 LUXymVkZF8UvZMjd8PXxatM1ZhrtKDJRUHS9dcgAn+a/UkXN9NNjI5Uvxwp8xT2EC6jy
 GmPMijoU/424QnuOyj/qdSMeIjvyicG4ptRQ/eYh9v+Ak6uDzGZ2EUC3mZaYuHsQKS+o
 uHgLzcsbm4x5TBluKQ4XBpF8bsqCj9edeaDao1V2TDxDPuvy1mTY8VWqYPVdQeYnRvLO
 kbNg==
X-Gm-Message-State: AFqh2kqAqH9wa5QzHVHA5+Stf6Y6IKI8sKMx3kmkyVZFsFeZlfuI+VvJ
 jaAOEWTDgyb1JTkTm/rrf6WV13CEJV5qOyDw
X-Google-Smtp-Source: AMrXdXvlBoUOdr5EfS8TQt3sesEyVfOB/xKMY7//PfxQmHhSph4uj7MyrMBbC0klpR7YULE5lbpzRg==
X-Received: by 2002:a1c:7c14:0:b0:3d1:f74d:4f60 with SMTP id
 x20-20020a1c7c14000000b003d1f74d4f60mr53524556wmc.22.1673369055791; 
 Tue, 10 Jan 2023 08:44:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm17665984wmq.42.2023.01.10.08.44.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:15 -0800 (PST)
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
Subject: [PATCH 01/18] hw/arm: Move various units to softmmu_ss[]
Date: Tue, 10 Jan 2023 17:43:49 +0100
Message-Id: <20230110164406.94366-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

arm_ss[] units are built twice: once for 32-bit word size and
once for 64-bit. The following units don't require any word
size knowledge and can be moved to softmmu_ss[] (where they
are built once):

 - smmu-common.c
 - exynos4_boards.c
 - bcm2835_peripherals.c
 - tosa.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 92f9f6e000..4babaa8dfc 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
@@ -18,7 +17,6 @@ arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
-arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
@@ -38,7 +36,7 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
-arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
@@ -59,8 +57,13 @@ arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
 arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
+arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
+softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+
 hw_arch += {'arm': arm_ss}
-- 
2.38.1


