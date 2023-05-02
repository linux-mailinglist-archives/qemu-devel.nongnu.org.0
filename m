Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582A6F43BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:24:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovI-00048G-P6; Tue, 02 May 2023 08:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oX-UF
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouU-000393-Rp
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso22096455e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029706; x=1685621706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lbCoxHkZJgXadxgcfFOmrDpUKtdigz9sk1EfcqotHyA=;
 b=NEFWCIp/tSTxMG5+ejBtfTPXy8+t7xwPnFXhIHI8Ogd85J9HaaGOdgDzhMJI1heXbv
 5pgHHSjnKTV9+y/edBK+15sMqp+o/n9OoFoyOVpHUefBxHDjyVAleur+5r6mFL7NRPRe
 LWH8o3SKO9xMPbPJeWQgJLeq7uXk2loJO0TwTjKiqo55whJ0O9ST3A4dDFmcSp2MK/fW
 NXcPg/zFw/DgDXBSrgkMwxn8Bd3e8vWVzgaGlJfMVzqqj04Ex1VV1XYel4os6NgjdZ3C
 CRTMff8IN47XNqgLaFgvOFNJjOSFNEaAeJVQKB/qci95+e04GR4bDvJUovbBDt9DTuhc
 kk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029706; x=1685621706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbCoxHkZJgXadxgcfFOmrDpUKtdigz9sk1EfcqotHyA=;
 b=QnybLD+pD5HRRgOwSvo3xBQES2o9Rm7ObKNCVNjvwpF13Nu52vkmh60txDh5SI1Pgp
 ceBO0gXT8HdMBhVeqQ11AiW+i45tfF+epZDR7tX9VrUTUTaaOmYGu5NmaBIi0wjTNNOZ
 Y+VLRViGzOVjmqHaRZDTdJ2icdYSLumlsR8a8oGC1RHOTLVXU8c3c5jTJ06nENC/HYpn
 tniXjWGZNI6TgWFaWHWrg900Ic/kDfUF9SlEZSDtcBVkcRrAoDmURVvjh6JxSVLsUMWF
 ++9ay4kzmpTVVZtvsG6ZOEATttkjPfMdWI1kR4mpz8S7F60ZjT1TWQ68KHkXHDh1dcIX
 oqwA==
X-Gm-Message-State: AC+VfDwByxq2tj7q7UyJNBqClN3rOD2/Dy2VZmu/n5flvQa2Bu4lsx6V
 1cAeBcBk/61sKtbYEkj8ThlhMZOqbhl6CuBoBBk=
X-Google-Smtp-Source: ACHHUZ5dWuO55xH/1biz8LmxBhZP71Ipd/owaJz2d+IGOhscNS8TaKi+7iIbyRD6g3Y2dvWf9KmSzw==
X-Received: by 2002:a1c:4b06:0:b0:3f0:3d47:2cc5 with SMTP id
 y6-20020a1c4b06000000b003f03d472cc5mr12497861wma.10.1683029706317; 
 Tue, 02 May 2023 05:15:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/35] arm/Kconfig: Do not build TCG-only boards on a KVM-only
 build
Date: Tue,  2 May 2023 13:14:35 +0100
Message-Id: <20230502121459.2422303-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
statements in Kconfig. That way they won't be selected when
CONFIG_TCG=n.

I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
keep the two default.mak files not empty and keep aarch64-default.mak
including arm-default.mak. That way we don't surprise anyone that's
used to altering these files.

With this change we can start building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230426180013.14814-12-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configs/devices/aarch64-softmmu/default.mak |  4 --
 configs/devices/arm-softmmu/default.mak     | 37 ------------------
 hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
 3 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da11..70e05a197dc 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -2,7 +2,3 @@
 
 # We support all the 32 bit boards so need all their config
 include ../arm-softmmu/default.mak
-
-CONFIG_XLNX_ZYNQMP_ARM=y
-CONFIG_XLNX_VERSAL=y
-CONFIG_SBSA_REF=y
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index cb3e5aea657..647fbce88d3 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -4,40 +4,3 @@
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
-CONFIG_CUBIEBOARD=y
-CONFIG_EXYNOS4=y
-CONFIG_HIGHBANK=y
-CONFIG_INTEGRATOR=y
-CONFIG_FSL_IMX31=y
-CONFIG_MUSICPAL=y
-CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
-CONFIG_NSERIES=y
-CONFIG_STELLARIS=y
-CONFIG_STM32VLDISCOVERY=y
-CONFIG_REALVIEW=y
-CONFIG_VERSATILE=y
-CONFIG_VEXPRESS=y
-CONFIG_ZYNQ=y
-CONFIG_MAINSTONE=y
-CONFIG_GUMSTIX=y
-CONFIG_SPITZ=y
-CONFIG_TOSA=y
-CONFIG_Z2=y
-CONFIG_NPCM7XX=y
-CONFIG_COLLIE=y
-CONFIG_ASPEED_SOC=y
-CONFIG_NETDUINO2=y
-CONFIG_NETDUINOPLUS2=y
-CONFIG_OLIMEX_STM32_H405=y
-CONFIG_MPS2=y
-CONFIG_RASPI=y
-CONFIG_DIGIC=y
-CONFIG_SABRELITE=y
-CONFIG_EMCRAFT_SF2=y
-CONFIG_MICROBIT=y
-CONFIG_FSL_IMX25=y
-CONFIG_FSL_IMX7=y
-CONFIG_FSL_IMX6UL=y
-CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 87c1a29c912..2d7c4579559 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -35,20 +35,24 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG && ARM
     select OMAP
     select TSC210X
 
 config CUBIEBOARD
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10
 
 config DIGIC
     bool
+    default y if TCG && ARM
     select PTIMER
     select PFLASH_CFI02
 
 config EXYNOS4
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select A9MPCORE
     select I2C
@@ -61,6 +65,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -75,6 +80,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG && ARM
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -87,12 +93,14 @@ config INTEGRATOR
 
 config MAINSTONE
     bool
+    default y if TCG && ARM
     select PXA2XX
     select PFLASH_CFI01
     select SMC91C111
 
 config MUSCA
     bool
+    default y if TCG && ARM
     select ARMSSE
     select PL011
     select PL031
@@ -104,6 +112,7 @@ config MARVELL_88W8618
 
 config MUSICPAL
     bool
+    default y if TCG && ARM
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -114,18 +123,22 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    default y if TCG && ARM
     select STM32F205_SOC
 
 config NETDUINOPLUS2
     bool
+    default y if TCG && ARM
     select STM32F405_SOC
 
 config OLIMEX_STM32_H405
     bool
+    default y if TCG && ARM
     select STM32F405_SOC
 
 config NSERIES
     bool
+    default y if TCG && ARM
     select OMAP
     select TMP105   # temperature sensor
     select BLIZZARD # LCD/TV controller
@@ -158,12 +171,14 @@ config PXA2XX
 
 config GUMSTIX
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select SMC91C111
     select PXA2XX
 
 config TOSA
     bool
+    default y if TCG && ARM
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
@@ -171,6 +186,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG && ARM
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -183,6 +199,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -190,6 +207,7 @@ config Z2
 
 config REALVIEW
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply PCI_TESTDEV
     imply I2C_DEVICES
@@ -218,6 +236,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    default y if TCG && AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -233,11 +252,13 @@ config SBSA_REF
 
 config SABRELITE
     bool
+    default y if TCG && ARM
     select FSL_IMX6
     select SSI_M25P80
 
 config STELLARIS
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
@@ -255,6 +276,7 @@ config STELLARIS
 
 config STM32VLDISCOVERY
     bool
+    default y if TCG && ARM
     select STM32F100_SOC
 
 config STRONGARM
@@ -263,16 +285,19 @@ config STRONGARM
 
 config COLLIE
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select ZAURUS  # scoop
     select STRONGARM
 
 config SX1
     bool
+    default y if TCG && ARM
     select OMAP
 
 config VERSATILE
     bool
+    default y if TCG && ARM
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -284,6 +309,7 @@ config VERSATILE
 
 config VEXPRESS
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select ARM_MPTIMER
@@ -299,6 +325,7 @@ config VEXPRESS
 
 config ZYNQ
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
@@ -315,7 +342,7 @@ config ZYNQ
 config ARM_V7M
     bool
     # currently v7M must be included in a TCG build due to translate.c
-    default y if TCG && (ARM || AARCH64)
+    default y if TCG && ARM
     select PTIMER
 
 config ALLWINNER_A10
@@ -334,6 +361,7 @@ config ALLWINNER_A10
 
 config ALLWINNER_H3
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select ALLWINNER_I2C
@@ -348,6 +376,7 @@ config ALLWINNER_H3
 
 config RASPI
     bool
+    default y if TCG && ARM
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
@@ -378,6 +407,7 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && AARCH64
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -395,6 +425,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    default y if TCG && AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
@@ -408,6 +439,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select ADM1272
     select ARM_GIC
@@ -424,6 +456,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select IMX
     select IMX_FEC
@@ -433,6 +466,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select SERIAL
     select IMX
@@ -453,6 +487,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG && ARM
     select DS1338
     select FTGMAC100
     select I2C
@@ -473,6 +508,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select ARMSSE
     select LAN9118
@@ -488,6 +524,7 @@ config MPS2
 
 config FSL_IMX7
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply I2C_DEVICES
@@ -506,6 +543,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    default y if TCG && ARM
     imply I2C_DEVICES
     select A15MPCORE
     select IMX
@@ -517,6 +555,7 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG && ARM
     select NRF51_SOC
 
 config NRF51_SOC
@@ -528,6 +567,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG && ARM
     select MSF2
     select SSI_M25P80
 
-- 
2.34.1


