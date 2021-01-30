Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75B30916D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 03:02:20 +0100 (CET)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fad-0000jw-67
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 21:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRW-0006vo-JF; Fri, 29 Jan 2021 20:52:54 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRU-000065-On; Fri, 29 Jan 2021 20:52:54 -0500
Received: by mail-wr1-x436.google.com with SMTP id c12so10628072wrc.7;
 Fri, 29 Jan 2021 17:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIZXZm6d3zsn85EInNhmu0X2HUAdFADt4XuIzrFLo50=;
 b=JK8OynKD3b/XAd5IOwUaUSZL3h4xFiIGScxh9ajv5/hQv6fFGA3IGW1/DMnBKeMEQR
 V3Z7hOTVfKN2RLjfn4xgBUhXwjsLFgcrhcbIDR6RRYnAQMbIE9Gz5RCA+F1/TMWz9cOZ
 Bwv00xaAhqk7mModnA5Lr6pCL3wGAAp126InW50Cd6hGDw/HEENn2Ja7C5ZTrj+jcLSI
 XTaaejU/NLcaGoCMIASY8BEf1xCRMqDHecP5kpRE7Zp17pL/Fqg0glrRaOUtPbIeKTmT
 NbY3B3Q9Xqy+/KmZdi0fxeVK2x9/V/vK39DNKtK2hKk7ke3Hdy3d+Q/MJ3HipcXuDAG0
 Q4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AIZXZm6d3zsn85EInNhmu0X2HUAdFADt4XuIzrFLo50=;
 b=K8OuxNI47r+U4ddnn2/WBHFdPn9clgEun6foek3ahz3IKFpPHDBz86WWQAW9sleNVC
 XR9Q2zgEHQPmvsJe0P3S3+ML55u+/wTmRVgApboMYorIWW0e2F2lpWiS/HAunhijJit3
 JJ49AjbBmKX94IMb/PEA1ppZcGZjbq0OaHUA2258KR6ct8sRCsbj46Hdqp2wrAxkD1ik
 xTJ8Fhn59CP/seveklt6ttZyw7Xlf+iUJlX+OjZ6eTXAtmKCxHiyiqgUZiMzvFJi7v5G
 qySrBFC3U6m/+cMQcnWK8dvtxEefbWLTDNQ85yxkz08hf9Wsf5GFZe6o3G0gjZL7Ij1N
 XfIw==
X-Gm-Message-State: AOAM532q8/LoYLBc/n5pt07GoWQVJI+o7lymtRMt9AmWrjNlNbVlw8VM
 ZAkxOxqgC1J9alBUQS1pbbCZbQy+SME=
X-Google-Smtp-Source: ABdhPJyG3IfNKn92dIJ/BqxY8b6yA8upkz3X+oX15/dbRXoTtTOXkskldv0xqkOnW90v7URAiwFqRw==
X-Received: by 2002:a5d:40c5:: with SMTP id b5mr7441592wrq.121.1611971570862; 
 Fri, 29 Jan 2021 17:52:50 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u6sm15859725wro.75.2021.01.29.17.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:52:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/11] target/arm: Restrict ARMv5 cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:20 +0100
Message-Id: <20210130015227.4071332-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires a cpu based on (at least) the ARMv7 architecture.

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
  - canon-a1100          Canon PowerShot A1100 IS
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
 hw/arm/Kconfig                          | 23 +++++++++++++++++++++++
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 8a53e637d23..5b25fafc9ab 100644
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
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 0831159d158..cd37b501287 100644
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
+    if (tcg_enabled()) {
+        type_register_static(&realview_eb_type);
+    }
     type_register_static(&realview_eb_mpcore_type);
     type_register_static(&realview_pb_a8_type);
     type_register_static(&realview_pbx_a9_type);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7126d82f6ce..bdb8c63af7b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -2,6 +2,10 @@ config ARM_V4
     bool
     depends on TCG
 
+config ARM_V5
+    bool
+    depends on TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -46,6 +50,8 @@ config CUBIEBOARD
 
 config DIGIC
     bool
+    default y if TCG
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
 
@@ -76,6 +82,8 @@ config HIGHBANK
 
 config INTEGRATOR
     bool
+    default y if TCG
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -88,6 +96,7 @@ config INTEGRATOR
 
 config MAINSTONE
     bool
+    default y if TCG
     select PXA2XX
     select PFLASH_CFI01
     select SMC91C111
@@ -102,6 +111,8 @@ config MUSCA
 
 config MUSICPAL
     bool
+    default y if TCG
+    select ARM_V5
     select OR_IRQ
     select BITBANG_I2C
     select MARVELL_88W8618
@@ -142,6 +153,7 @@ config OMAP
 
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -151,12 +163,14 @@ config PXA2XX
 
 config GUMSTIX
     bool
+    default y if TCG
     select PFLASH_CFI01
     select SMC91C111
     select PXA2XX
 
 config TOSA
     bool
+    default y if TCG
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
@@ -164,6 +178,7 @@ config TOSA
 
 config SPITZ
     bool
+    default y if TCG
     select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
@@ -176,6 +191,7 @@ config SPITZ
 
 config Z2
     bool
+    default y if TCG
     select PFLASH_CFI01
     select WM8750
     select PL011 # UART
@@ -249,6 +265,7 @@ config STRONGARM
 
 config COLLIE
     bool
+    default y if TCG
     select PFLASH_CFI01
     select ZAURUS  # scoop
     select STRONGARM
@@ -261,6 +278,8 @@ config SX1
 
 config VERSATILE
     bool
+    default y if TCG
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -382,6 +401,8 @@ config NPCM7XX
 
 config FSL_IMX25
     bool
+    default y if TCG
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -408,6 +429,8 @@ config FSL_IMX6
 
 config ASPEED_SOC
     bool
+    default y if TCG
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
-- 
2.26.2


