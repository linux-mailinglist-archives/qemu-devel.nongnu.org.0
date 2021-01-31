Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337E309BBE
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:54:05 +0100 (CET)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BIq-00049j-Il
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFo-0002IZ-AA; Sun, 31 Jan 2021 06:50:56 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFm-0005T7-G2; Sun, 31 Jan 2021 06:50:56 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m13so13502681wro.12;
 Sun, 31 Jan 2021 03:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAQNkZyQmguYUbpG6RAooFLTF+LkPeMScVQdPuM6a40=;
 b=ixKvjc/EM+COzd/8zxx92XqGNuV3/KESCLzWaBkZIRcantYLmcmpylMmMK1AJx2jFE
 cuGm88zp9PC+wZ+KY57F2pigz8jKDIGbtvjWcoU8aEM/nGEg27OQm5dGfgVezOdw1Gd0
 1FkULN2tU2CmTtGU2cbXW4wpUoB9wJt3wC0xkiwOWN4HKbkf7ezFy/qfSmw5qWkNJafh
 L2NoH+RgS9jT/5Srq/FaVLqx5TFXZSmvu/NPvrbpb/stecX4jUwzkXAxNa8OGss5YV/s
 TVK2rJKTCYy448KHIZDG1ALx4Y0vk3f1zUClD6O1RYBuCUV4B33Liak3YWHgZxQ6JvxS
 +UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jAQNkZyQmguYUbpG6RAooFLTF+LkPeMScVQdPuM6a40=;
 b=J4v42ZEc+BHH1rvRri22wWekmROaE4eYvPdAros0HgyupT9i+9DUmbvj/VQSA4HAaz
 JdFsv/0TI4Ax/FATbfEdAAV9t2oPeSjIdEnc25CCS8IM10X7ZBWWNpFxfjmfzDSjWlsx
 YOnKyMSiCWvh09idJNycO7wnmrmFX1nN+EEQI0JyaciIwT4c8iiVDVlkAjHpjsmD/MMS
 Wwbeac0hdEiELV6CtU4yuRh+Q6XM+59MdI0KD+2fJ+6hx1PpwGBPPkkw52TvYoB5Lf1O
 eREWL3EwK61pSnc+7bkmfrE1cnNKxzcFI5T0iz3ll2S87M1lhRcE5coqn688WRbNJbqZ
 NGDg==
X-Gm-Message-State: AOAM533TtTMWz8sccSwEWANPWXYtSupA5kTeC+Y2Em4JK74tTbEuoJZ7
 zuT6X1Vm/WeSwZao4poOF8gK7eRykBU=
X-Google-Smtp-Source: ABdhPJxm51d3yxh6L+XBF7RlyMnDsyEgQnz37oiRF4PWsrAoOK263P8yLKKWDXW81l+tMCZwpYvWfw==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr13099821wry.398.1612093848309; 
 Sun, 31 Jan 2021 03:50:48 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id q19sm6049801wmj.23.2021.01.31.03.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:50:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/11] target/arm: Restrict ARMv5 cpus to TCG accel
Date: Sun, 31 Jan 2021 12:50:15 +0100
Message-Id: <20210131115022.242570-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

Only enable the following ARMv5 CPUs when TCG is available:

  - ARM926
  - ARM946
  - ARM1026
  - XScale (PXA250/255/260/261/262/270)

The following machines are no more built when TCG is disabled:

  - akita                Sharp SL-C1000 (Akita) PDA (PXA270)
  - ast2500-evb          Aspeed AST2500 EVB (ARM1176)
  - ast2600-evb          Aspeed AST2600 EVB (Cortex A7)
  - borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
  - canon-a1100          Canon PowerShot A1100 IS (ARM946)
  - collie               Sharp SL-5500 (Collie) PDA (SA-1110)
  - connex               Gumstix Connex (PXA255)
  - g220a-bmc            Bytedance G220A BMC (ARM1176)
  - imx25-pdk            ARM i.MX25 PDK board (ARM926)
  - integratorcp         ARM Integrator/CP (ARM926EJ-S)
  - mainstone            Mainstone II (PXA27x)
  - musicpal             Marvell 88w8618 / MusicPal (ARM926EJ-S)
  - palmetto-bmc         OpenPOWER Palmetto BMC (ARM926EJ-S)
  - realview-eb          ARM RealView Emulation Baseboard (ARM926EJ-S)
  - romulus-bmc          OpenPOWER Romulus BMC (ARM1176)
  - sonorapass-bmc       OCP SonoraPass BMC (ARM1176)
  - spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
  - supermicrox11-bmc    Supermicro X11 BMC (ARM926EJ-S)
  - swift-bmc            OpenPOWER Swift BMC (ARM1176)
  - tacoma-bmc           OpenPOWER Tacoma BMC (Cortex A7)
  - terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
  - tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
  - verdex               Gumstix Verdex (PXA270)
  - versatileab          ARM Versatile/AB (ARM926EJ-S)
  - versatilepb          ARM Versatile/PB (ARM926EJ-S)
  - witherspoon-bmc      OpenPOWER Witherspoon BMC (ARM1176)
  - z2                   Zipit Z2 (PXA27x)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 12 ------------
 hw/arm/realview.c                       |  5 ++++-
 tests/qtest/cdrom-test.c                |  6 +++++-
 hw/arm/Kconfig                          | 19 +++++++++++++++++++
 target/arm/Kconfig                      |  4 ++++
 5 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 6ae964c14fd..0aad35da0c4 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -10,33 +10,21 @@ CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
-CONFIG_INTEGRATOR=y
 CONFIG_FSL_IMX31=y
-CONFIG_MUSICPAL=y
 CONFIG_MUSCA=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
-CONFIG_VERSATILE=y
 CONFIG_VEXPRESS=y
 CONFIG_ZYNQ=y
-CONFIG_MAINSTONE=y
-CONFIG_GUMSTIX=y
-CONFIG_SPITZ=y
-CONFIG_TOSA=y
-CONFIG_Z2=y
 CONFIG_NPCM7XX=y
-CONFIG_COLLIE=y
-CONFIG_ASPEED_SOC=y
 CONFIG_NETDUINO2=y
 CONFIG_NETDUINOPLUS2=y
 CONFIG_MPS2=y
 CONFIG_RASPI=y
-CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
 CONFIG_MICROBIT=y
-CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 0831159d158..2dcf0a4c23e 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -18,6 +18,7 @@
 #include "hw/pci/pci.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "exec/address-spaces.h"
@@ -460,7 +461,9 @@ static const TypeInfo realview_pbx_a9_type = {
 
 static void realview_machine_init(void)
 {
-    type_register_static(&realview_eb_type);
+    if (tcg_builtin()) {
+        type_register_static(&realview_eb_type);
+    }
     type_register_static(&realview_eb_mpcore_type);
     type_register_static(&realview_pb_a8_type);
     type_register_static(&realview_pbx_a9_type);
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 5af944a5fb7..1f1bc26fa7a 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -222,7 +222,11 @@ int main(int argc, char **argv)
         add_cdrom_param_tests(mips64machines);
     } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
         const char *armmachines[] = {
-            "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
+#ifdef CONFIG_TCG
+            "realview-eb",
+#endif /* CONFIG_TCG */
+            "realview-eb-mpcore",
+            "realview-pb-a8",
             "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
             "vexpress-a9", "virt", NULL
         };
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f2957b33bee..560442bfc5c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -42,6 +42,8 @@ config CUBIEBOARD
 
 config DIGIC
     bool
+    default y if TCG && ARM
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
 
@@ -72,6 +74,8 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG && ARM
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -84,6 +88,7 @@ config INTEGRATOR
 
 config MAINSTONE
     bool
+    default y if TCG && ARM
     select PXA2XX
     select PFLASH_CFI01
     select SMC91C111
@@ -98,6 +103,8 @@ config MUSCA
 
 config MUSICPAL
     bool
+    default y if TCG && ARM
+    select ARM_V5
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -138,6 +145,7 @@ config OMAP
 
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -147,12 +155,14 @@ config PXA2XX
 
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
@@ -160,6 +170,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG && ARM
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -172,6 +183,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -245,6 +257,7 @@ config STRONGARM
 
 config COLLIE
     bool
+    default y if TCG && ARM
     select PFLASH_CFI01
     select ZAURUS  # scoop
     select STRONGARM
@@ -257,6 +270,8 @@ config SX1
 
 config VERSATILE
     bool
+    default y if TCG && ARM
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -376,6 +391,8 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG && ARM
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -402,6 +419,8 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG && ARM
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 811e1e81652..9b3635617dc 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -10,6 +10,10 @@ config ARM_V4
     bool
     depends on TCG && ARM
 
+config ARM_V5
+    bool
+    depends on TCG && ARM
+
 config ARM_V7M
     bool
     select PTIMER
-- 
2.26.2


