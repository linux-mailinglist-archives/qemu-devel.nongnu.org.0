Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC6309DDC
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 17:48:14 +0100 (CET)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6FtV-00026T-IO
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 11:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpo-0008KI-4g; Sun, 31 Jan 2021 11:44:24 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpm-0001Vp-Et; Sun, 31 Jan 2021 11:44:23 -0500
Received: by mail-wr1-x436.google.com with SMTP id d16so13985392wro.11;
 Sun, 31 Jan 2021 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ti3pGdZyEpwOiFw7/yoi3CPSUbET3rJXN1FI6GYYqTs=;
 b=WJZAC5oI/+0J1i4hjINE/PpdCPxgSq7PhS84z14HABHVkvXxR3dyxfxgnhG9k1VCic
 JOXkt/OvHylX/FFFtyd0WuN8m2gH+o0oaaqYP+TsUAXmujpFrnRf9V7KMKf2I7GE+tHD
 b5v3QIuxJEGs3lGQq7J1Vio0QlDrLgbr3foiv8c3KRrrZtJS80I22PhO6Qp1fJ3UmmQx
 fJEn4LithI/Mgz5y7kjyVQmvgaYk8yuCBOI2WjcjjLBpMryHfONwBK2auaZG1l3XkvtM
 7sKPUJIYiRwuMkE+jGwI8cTwamVxs6EGugcyKEMgHb++Lz4l7VTxW50VCyd8MvLVZfqh
 MGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ti3pGdZyEpwOiFw7/yoi3CPSUbET3rJXN1FI6GYYqTs=;
 b=dj5IEltChSfF6bIB4vBwKEttYs5S1hRqXlldd/dhI1+99QB3fQK7EB21fAGlfk6W9Q
 wv2NocfbjOtqHXvWUxIzJqXSmuZlZ2vfAxtMmtvNuHLIJe5hSfnJAiZSjO7lVw5kTuX/
 dIolVtUfqPe5tFUB8rPLaEC1ppkPj1SYYah/5YiClaZPvsMWqSLGafKr/HJRpFXmTBSM
 0YU1DolTIJgPQFrQYdTWsos1auqWcR/4WFiiZC1WS1YZ0w3wGR7NsaeRH7p6a1hYdgcg
 JUUcLdm4ltvUV5dPPIwt/9wddMmbddrIURP3bUkJPFylHKhhh9H3x/FdqkPy7o93VzrJ
 sYfg==
X-Gm-Message-State: AOAM532EWBUBR7FFKdRskIirog4W7lI8ySi3AYWGAYBsMwVevKNmsnJ/
 QL8b6yoHNjCg+RSarYcdTqV/6sZpBzM=
X-Google-Smtp-Source: ABdhPJyiPKUqMKiYoPKOERdZKupUQY1NbrLiW0EKYwuuOeb8WmWIw8PZQzp6KCcCGrvM0TsBOD28YQ==
X-Received: by 2002:a05:6000:104:: with SMTP id
 o4mr14080822wrx.419.1612111460654; 
 Sun, 31 Jan 2021 08:44:20 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m184sm19779832wmf.12.2021.01.31.08.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/arm: Restrict ARMv7 A-profile cpus to TCG accel
Date: Sun, 31 Jan 2021 17:44:03 +0100
Message-Id: <20210131164406.349825-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131164406.349825-1-f4bug@amsat.org>
References: <20210131164406.349825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

The following machines are no more built when TCG is disabled:

  - cubieboard           cubietech cubieboard (Cortex-A8)
  - mcimx6ul-evk         Freescale i.MX6UL Evaluation Kit (Cortex A7)
  - mcimx7d-sabre        Freescale i.MX7 DUAL SABRE (Cortex A7)
  - npcm750-evb          Nuvoton NPCM750 Evaluation Board (Cortex A9)
  - nuri                 Samsung NURI board (Exynos4210)
  - orangepi-pc          Orange Pi PC (Cortex-A7)
  - quanta-gsj           Quanta GSJ (Cortex A9)
  - realview-pb-a8       ARM RealView Platform Baseboard for Cortex-A8
  - realview-pbx-a9      ARM RealView Platform Baseboard Explore for Cortex-A9
  - sabrelite            Freescale i.MX6 Quad SABRE Lite Board (Cortex A9)
  - smdkc210             Samsung SMDKC210 board (Exynos4210)
  - vexpress-a15         ARM Versatile Express for Cortex-A15
  - vexpress-a9          ARM Versatile Express for Cortex-A9
  - xilinx-zynq-a9       Xilinx Zynq Platform Baseboard for Cortex-A9

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 10 ----------
 hw/arm/Kconfig                          | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 7d55c156bab..1ffa3dbe4bf 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -3,13 +3,3 @@
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
-CONFIG_CUBIEBOARD=y
-CONFIG_EXYNOS4=y
-CONFIG_REALVIEW=y
-CONFIG_VEXPRESS=y
-CONFIG_ZYNQ=y
-CONFIG_NPCM7XX=y
-CONFIG_SABRELITE=y
-CONFIG_FSL_IMX7=y
-CONFIG_FSL_IMX6UL=y
-CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 043710be3df..263f22a80c1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -39,6 +39,7 @@ config CHEETAH
 
 config CUBIEBOARD
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10
 
 config DIGIC
@@ -50,6 +51,7 @@ config DIGIC
 
 config EXYNOS4
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select I2C
     select LAN9118
@@ -198,6 +200,7 @@ config Z2
 
 config REALVIEW
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply PCI_TESTDEV
     select SMC91C111
@@ -241,6 +244,7 @@ config SBSA_REF
 
 config SABRELITE
     bool
+    default y if TCG && ARM
     select FSL_IMX6
     select SSI_M25P80
 
@@ -292,6 +296,7 @@ config VERSATILE
 
 config VEXPRESS
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select A15MPCORE
     select ARM_MPTIMER
@@ -307,6 +312,7 @@ config VEXPRESS
 
 config ZYNQ
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select CADENCE # UART
     select PFLASH_CFI02
@@ -331,6 +337,7 @@ config ALLWINNER_A10
 
 config ALLWINNER_H3
     bool
+    default y if TCG && ARM
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select SERIAL
@@ -395,6 +402,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select ARM_GIC
     select PL310  # cache controller
@@ -424,6 +432,7 @@ config FSL_IMX31
 
 config FSL_IMX6
     bool
+    default y if TCG && ARM
     select A9MPCORE
     select IMX
     select IMX_FEC
@@ -467,6 +476,7 @@ config MPS2
 
 config FSL_IMX7
     bool
+    default y if TCG && ARM
     imply PCI_DEVICES
     imply TEST_DEVICES
     select A15MPCORE
@@ -484,6 +494,7 @@ config ARM_SMMUV3
 
 config FSL_IMX6UL
     bool
+    default y if TCG && ARM
     select A15MPCORE
     select IMX
     select IMX_FEC
-- 
2.26.2


