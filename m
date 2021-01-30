Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D6309165
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:58:05 +0100 (CET)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fWW-0004MC-2k
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRb-00078W-6d; Fri, 29 Jan 2021 20:52:59 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRZ-00008K-Mv; Fri, 29 Jan 2021 20:52:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m2so8154700wmm.1;
 Fri, 29 Jan 2021 17:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7FgMXEaeMqaVd+Y46GoSMFA7B1XefkRzbvqiN7p+wqE=;
 b=VxuQC/tgKHUMfQfr97MNiO38xSrcPNb3RCXXTu7K7defWmZ2lWCUz5+Kh6V8X7mpHw
 0J6VIbGesbLnIehvEqvJErp2aWJ4F9jmu0YuZ4mrhMFxU02SGvL9g1WbC0P0SuKVnxso
 /LPUPNIt4+waPa/XVjsYNRFNNYvVbFcz0fFJT5utW+ufusAk27lPQl1XxPqmQiiAd3pp
 qe/SQwRSLVYzQxU7AOIOiiOlk/8lF5orJ/TrtQhmsYHqAy1bmaYpH25ys4vl4Okyaj2T
 NZugbFH3h2ssWB+VpMEIt5tbGX3Imu86QimIhkHSRsdQGvfOz69XHVauBKz9wAiCgt85
 VVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7FgMXEaeMqaVd+Y46GoSMFA7B1XefkRzbvqiN7p+wqE=;
 b=F5twm6br1eWYz7uSRUEACSxn6D1JM0Xcucx8bavh14WvFbGNhkZzjLeY0JnLXfSBTb
 YKzI18cK2vwfv8LBLinwX1DAwKlyEy3l6EVq98+fEGMjgru3sIlo3c0I8clvKK+qASI1
 5cNX8FS+WUT4nn7BwuRLRyCH6jKi+OR0asKrQbelesyvpF3jagpe6ezRvX+GgQnd9VP8
 2/nZAYdRFPyBj3XDvb9Cm8esBu+nQiMM5FX5uFOrVZqhqtpS3AnJc2stA+LbjDVTuk0m
 0U5Y7VOwbO07j+d9aKkQ3Hg8UTAa1HI7YvVojFX4kYoge1FfWRPbVAuyVXyQ3js2McBf
 /WYQ==
X-Gm-Message-State: AOAM530QiYWZsJQB/CZjcobYCEQNaQ4Kb84iPlZLszihO0u5m2vDDb2l
 P3qle/96jok3UIQz1fYgZEsrsfOSKc4=
X-Google-Smtp-Source: ABdhPJxAsrG1xJpOA8SfzNM1/ozsjXKBF7jjRMH5K7BqGyRUpbGN9MIHDfPmoi4udW3y5o7qEUABGw==
X-Received: by 2002:a1c:7c03:: with SMTP id x3mr5942123wmc.103.1611971575878; 
 Fri, 29 Jan 2021 17:52:55 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g12sm11835695wmh.14.2021.01.29.17.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:52:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/11] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Sat, 30 Jan 2021 02:52:21 +0100
Message-Id: <20210130015227.4071332-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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

Only enable the following ARMv6 CPUs when TCG is available:

  - ARM1136
  - ARM1176
  - ARM11MPCore
  - Cortex-M0

The following machines are no more built when TCG is disabled:

  - kzm                  ARM KZM Emulation Baseboard (ARM1136)
  - microbit             BBC micro:bit (Cortex-M0)
  - n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
  - n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
  - realview-eb-mpcore   ARM RealView Emulation Baseboard (ARM11MPCore)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak |  2 --
 hw/arm/realview.c                       |  2 +-
 hw/arm/Kconfig                          | 11 +++++++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 5b25fafc9ab..ee80bf15150 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -10,9 +10,7 @@ CONFIG_ARM_VIRT=y
 CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
-CONFIG_FSL_IMX31=y
 CONFIG_MUSCA=y
-CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
 CONFIG_VEXPRESS=y
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index cd37b501287..57a37608e39 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -463,8 +463,8 @@ static void realview_machine_init(void)
 {
     if (tcg_enabled()) {
         type_register_static(&realview_eb_type);
+        type_register_static(&realview_eb_mpcore_type);
     }
-    type_register_static(&realview_eb_mpcore_type);
     type_register_static(&realview_pb_a8_type);
     type_register_static(&realview_pbx_a9_type);
 }
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bdb8c63af7b..daab7081994 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,11 @@ config ARM_V5
     bool
     depends on TCG
 
+config ARM_V6
+    bool
+    depends on TCG
+    select ARM_COMPATIBLE_SEMIHOSTING
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -131,6 +136,8 @@ config NETDUINOPLUS2
 
 config NSERIES
     bool
+    default y if TCG
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -411,6 +418,8 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -488,11 +497,13 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG
     select NRF51_SOC
 
 config NRF51_SOC
     bool
     select I2C
+    select ARM_V6
     select ARM_V7M
     select UNIMP
 
-- 
2.26.2


