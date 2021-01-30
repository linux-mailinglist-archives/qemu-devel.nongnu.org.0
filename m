Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A530916E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 03:03:18 +0100 (CET)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fbZ-00024Z-GQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 21:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRm-0007XQ-3C; Fri, 29 Jan 2021 20:53:10 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRk-0000BI-DA; Fri, 29 Jan 2021 20:53:09 -0500
Received: by mail-wr1-x435.google.com with SMTP id p15so10596827wrq.8;
 Fri, 29 Jan 2021 17:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pL3VFUfes4LLPpgaJDy8jU3gYau+sjFrKic4/sFvnNY=;
 b=QlPx5vk/bo8ydtxxW9jNTxI4BE08Ejo8IlC/WMnhi4Wbme1fYmhJgyU1Upki/92NmF
 WC2DbHcdeOoGbbqkX3uzvTl8MPRzbcKjiR9DkW3t+gelrCpi6lbR+YljJPOX4B/pNnJR
 jLROfdsvWr2JLoQ3ukaZTPfmPpHIQ2tX5RT3QafM9bvIGcGYCZ4JbSGyIOolFM9zj2wp
 8Lk2wKKiOifSwg1YsFs8CXFAh+ZPmwh7tkYJaYlPsNhSagHtmcD7TetDYtI5mpUQKEuJ
 UxtEsewFWr9ZiT2uXhIw/Szt607GBXaZ6aLcK0stqf2PdjzbROXSDKfZ0OHCM4ASM64Z
 ZiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pL3VFUfes4LLPpgaJDy8jU3gYau+sjFrKic4/sFvnNY=;
 b=T7tCExzc7iRBpgtgk84CC1LQYPFWK98tfOfZWgG7T/+z2fJPrh8dE0rnlbC3LhHpD6
 5UqXqrAM+GH1SekRi4j/sQ78YZYg4df+HMEvm/CFTt7riKnj4uvIalieip/xqbJO94Ju
 tslq5qovj4lu84uyk4GZXp4cmiMaH7Y9NRqXe6bzwxaJgpzKkvjuhBjIs1YWed35pi0O
 EJ9LWrFLneb/YhJtapJMZEUAh3JqbVtDCu/IdCCp8GTZxoXph4O9vvvkJZvTLIBvQvFf
 X7BKchmMbWTVPHsy2W7qDtCWNG7ycfe81EZjlqV1ctiOSeffV8bGOR28SgSKA49BoYw4
 Q6OQ==
X-Gm-Message-State: AOAM530q4mXLrTbq9pCZLA4RbuQVAXwUbwTRgPmw3MVcVJny+8X1Y0YU
 wc+weECV1/sFRIvtilfpxTcEY/q/h3M=
X-Google-Smtp-Source: ABdhPJwbM5w0TDBpvxYm44nUc4AYAH45EnulcrjfYKeG5PWB96HJ5mDacgEs5qWvrmDx0pRxmhlO2w==
X-Received: by 2002:adf:a31d:: with SMTP id c29mr7307582wrb.306.1611971586564; 
 Fri, 29 Jan 2021 17:53:06 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f13sm8277528wmf.1.2021.01.29.17.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:53:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/11] target/arm: Restrict ARMv7 M-profile cpus to TCG
 accel
Date: Sat, 30 Jan 2021 02:52:23 +0100
Message-Id: <20210130015227.4071332-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

A KVM-only build won't be able to run M-profile cpus.

Only enable the following ARMv7 M-Profile CPUs when TCG is available:

  - Cortex-M0
  - Cortex-M3
  - Cortex-M4
  - Cortex-M33

The following machines are no more built when TCG is disabled:

  - emcraft-sf2          SmartFusion2 SOM kit from Emcraft (M2S010)
  - highbank             Calxeda Highbank (ECX-1000)
  - lm3s6965evb          Stellaris LM3S6965EVB
  - lm3s811evb           Stellaris LM3S811EVB
  - midway               Calxeda Midway (ECX-2000)
  - mps2-an385           ARM MPS2 with AN385 FPGA image for Cortex-M3
  - mps2-an386           ARM MPS2 with AN386 FPGA image for Cortex-M4
  - mps2-an500           ARM MPS2 with AN500 FPGA image for Cortex-M7
  - mps2-an505           ARM MPS2 with AN505 FPGA image for Cortex-M33
  - mps2-an511           ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3
  - mps2-an521           ARM MPS2 with AN521 FPGA image for dual Cortex-M33
  - musca-a              ARM Musca-A board (dual Cortex-M33)
  - musca-b1             ARM Musca-B1 board (dual Cortex-M33)
  - netduino2            Netduino 2 Machine
  - netduinoplus2        Netduino Plus 2 Machine

We don't need to enforce CONFIG_ARM_V7M in default-configs anymore.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 11 -----------
 hw/arm/Kconfig                          | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index ee80bf15150..b72926b8fce 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,28 +1,17 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
 CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
-CONFIG_HIGHBANK=y
-CONFIG_MUSCA=y
-CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
 CONFIG_VEXPRESS=y
 CONFIG_ZYNQ=y
 CONFIG_NPCM7XX=y
-CONFIG_NETDUINO2=y
-CONFIG_NETDUINOPLUS2=y
-CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_SABRELITE=y
-CONFIG_EMCRAFT_SF2=y
-CONFIG_MICROBIT=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 320428bf97e..f56c05c00a8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -16,6 +16,12 @@ config ARM_V7R
     depends on TCG
     select ARM_COMPATIBLE_SEMIHOSTING
 
+config ARM_V7M
+    bool
+    depends on TCG
+    select ARM_COMPATIBLE_SEMIHOSTING
+    select PTIMER
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -78,6 +84,7 @@ config EXYNOS4
 
 config HIGHBANK
     bool
+    default y if TCG
     select A9MPCORE
     select A15MPCORE
     select AHCI
@@ -113,6 +120,7 @@ config MAINSTONE
 
 config MUSCA
     bool
+    default y if TCG
     select ARMSSE
     select PL011
     select PL031
@@ -133,10 +141,12 @@ config MUSICPAL
 
 config NETDUINO2
     bool
+    default y if TCG
     select STM32F205_SOC
 
 config NETDUINOPLUS2
     bool
+    default y if TCG
     select STM32F405_SOC
 
 config NSERIES
@@ -258,6 +268,7 @@ config SABRELITE
 
 config STELLARIS
     bool
+    default y if TCG
     select ARM_V7M
     select CMSDK_APB_WATCHDOG
     select I2C
@@ -331,10 +342,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
 
-config ARM_V7M
-    bool
-    select PTIMER
-
 config ALLWINNER_A10
     bool
     select AHCI
@@ -463,6 +470,7 @@ config ASPEED_SOC
 
 config MPS2
     bool
+    default y if TCG
     select ARMSSE
     select LAN9118
     select MPS2_FPGAIO
@@ -516,6 +524,7 @@ config NRF51_SOC
 
 config EMCRAFT_SF2
     bool
+    default y if TCG
     select MSF2
     select SSI_M25P80
 
-- 
2.26.2


