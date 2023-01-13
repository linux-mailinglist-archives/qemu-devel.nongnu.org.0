Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75965669ACE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:44:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKj3-0007MW-DI; Fri, 13 Jan 2023 09:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKiw-0007DM-0R; Fri, 13 Jan 2023 09:08:03 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKis-0002tB-5W; Fri, 13 Jan 2023 09:08:01 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 904C36069B;
 Fri, 13 Jan 2023 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673618875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eo80WvwpSpGkoKAycNySu1m8cyx1tHfNz4apPXAreDk=;
 b=aX3/ODBsKvp5lOjaaBPd4BBeVl9acyoCnywICgT6EsGFktQwa3WjaRIPB5FQxlysKpVVo+
 UiWB1LGTlMYd+9u/k+McTRYElFRJ6qsH0c3nk+t7iowJiOJE3wYoAkvMJBEavFIoKh/RW7
 qpBbhYcbPG5Au+qb9Fy2y6lEI/2piwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673618875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eo80WvwpSpGkoKAycNySu1m8cyx1tHfNz4apPXAreDk=;
 b=eNCQ7HNXYXf8Liip2eiB9vayy4KWDFl2USoCmkCYQHwS0TnYlAlNbuCR0f/kmdAcWW2d40
 49LxD7gnMhlZNJDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 013FD1358A;
 Fri, 13 Jan 2023 14:07:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJMEL7hlwWP8DQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v3 28/28] arm/Kconfig: Do not build TCG-only boards on a
 KVM-only build
Date: Fri, 13 Jan 2023 11:04:19 -0300
Message-Id: <20230113140419.4013-29-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
statements in Kconfig. That way they won't be selected when
CONFIG_TCG=n.

I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
keep the two default.mak files not empty and keep aarch64-default.mak
including arm-default.mak. That way we don't surprise anyone that's
used to altering these files.

With this change we can start building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
sbsa-ref has an explicit check to avoid running with KVM
xlnx-versal-virt has avocado tests tagged with tcg
---
 configs/devices/aarch64-softmmu/default.mak |  4 ---
 configs/devices/arm-softmmu/default.mak     | 36 -------------------
 hw/arm/Kconfig                              | 39 +++++++++++++++++++++
 3 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
index cf43ac8da1..70e05a197d 100644
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
index 24fb5f0366..647fbce88d 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -4,39 +4,3 @@
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
index e6f984fea8..05b11f53dc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,20 +34,24 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG && (ARM || AARCH64)
     select OMAP
     select TSC210X
 
 config CUBIEBOARD
     bool
+    default y if TCG && (ARM || AARCH64)
     select ALLWINNER_A10
 
 config DIGIC
     bool
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
     select PFLASH_CFI02
 
 config EXYNOS4
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select A9MPCORE
     select I2C
@@ -60,6 +64,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -74,6 +79,7 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG && (ARM || AARCH64)
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -86,12 +92,14 @@ config INTEGRATOR
 
 config MAINSTONE
     bool
+    default y if TCG && (ARM || AARCH64)
     select PXA2XX
     select PFLASH_CFI01
     select SMC91C111
 
 config MUSCA
     bool
+    default y if TCG && (ARM || AARCH64)
     select ARMSSE
     select PL011
     select PL031
@@ -103,6 +111,7 @@ config MARVELL_88W8618
 
 config MUSICPAL
     bool
+    default y if TCG && (ARM || AARCH64)
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -113,14 +122,17 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    default y if TCG && (ARM || AARCH64)
     select STM32F205_SOC
 
 config NETDUINOPLUS2
     bool
+    default y if TCG && (ARM || AARCH64)
     select STM32F405_SOC
 
 config NSERIES
     bool
+    default y if TCG && (ARM || AARCH64)
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -153,12 +165,14 @@ config PXA2XX
 
 config GUMSTIX
     bool
+    default y if TCG && (ARM || AARCH64)
     select PFLASH_CFI01
     select SMC91C111
     select PXA2XX
 
 config TOSA
     bool
+    default y if TCG && (ARM || AARCH64)
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
@@ -166,6 +180,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG && (ARM || AARCH64)
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -178,6 +193,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG && (ARM || AARCH64)
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -185,6 +201,7 @@ config Z2
 
 config REALVIEW
     bool
+    default y if TCG && (ARM || AARCH64)
     imply PCI_DEVICES
     imply PCI_TESTDEV
     imply I2C_DEVICES
@@ -213,6 +230,7 @@ config REALVIEW
 
 config SBSA_REF
     bool
+    default y if TCG && AARCH64
     imply PCI_DEVICES
     select AHCI
     select ARM_SMMUV3
@@ -228,11 +246,13 @@ config SBSA_REF
 
 config SABRELITE
     bool
+    default y if TCG && (ARM || AARCH64)
     select FSL_IMX6
     select SSI_M25P80
 
 config STELLARIS
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
@@ -250,6 +270,7 @@ config STELLARIS
 
 config STM32VLDISCOVERY
     bool
+    default y if TCG && (ARM || AARCH64)
     select STM32F100_SOC
 
 config STRONGARM
@@ -258,16 +279,19 @@ config STRONGARM
 
 config COLLIE
     bool
+    default y if TCG && (ARM || AARCH64)
     select PFLASH_CFI01
     select ZAURUS  # scoop
     select STRONGARM
 
 config SX1
     bool
+    default y if TCG && (ARM || AARCH64)
     select OMAP
 
 config VERSATILE
     bool
+    default y if TCG && (ARM || AARCH64)
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -279,6 +303,7 @@ config VERSATILE
 
 config VEXPRESS
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select A15MPCORE
     select ARM_MPTIMER
@@ -294,6 +319,7 @@ config VEXPRESS
 
 config ZYNQ
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
@@ -324,6 +350,7 @@ config ALLWINNER_A10
 
 config ALLWINNER_H3
     bool
+    default y if TCG && (ARM || AARCH64)
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select SERIAL
@@ -336,6 +363,7 @@ config ALLWINNER_H3
 
 config RASPI
     bool
+    default y if TCG && (ARM || AARCH64)
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
@@ -366,6 +394,7 @@ config STM32F405_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    default y if TCG && AARCH64
     select AHCI
     select ARM_GIC
     select CADENCE
@@ -382,6 +411,7 @@ config XLNX_ZYNQMP_ARM
 
 config XLNX_VERSAL
     bool
+    default y if TCG && AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
@@ -395,6 +425,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    default y if TCG && (ARM || AARCH64)
     select A9MPCORE
     select ADM1272
     select ARM_GIC
@@ -411,6 +442,7 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select IMX
     select IMX_FEC
@@ -420,6 +452,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select SERIAL
     select IMX
@@ -440,6 +473,7 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG && (ARM || AARCH64)
     select DS1338
     select FTGMAC100
     select I2C
@@ -460,6 +494,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select ARMSSE
     select LAN9118
@@ -475,6 +510,7 @@ config MPS2
 
 config FSL_IMX7
     bool
+    default y if TCG && (ARM || AARCH64)
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply I2C_DEVICES
@@ -493,6 +529,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    default y if TCG && (ARM || AARCH64)
     imply I2C_DEVICES
     select A15MPCORE
     select IMX
@@ -504,6 +541,7 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG && (ARM || AARCH64)
     select NRF51_SOC
 
 config NRF51_SOC
@@ -515,6 +553,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG && (ARM || AARCH64)
     select MSF2
     select SSI_M25P80
 
-- 
2.35.3


