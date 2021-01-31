Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831FC309BD2
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:05:02 +0100 (CET)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BTR-00044a-Go
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFp-0002Kc-Ii; Sun, 31 Jan 2021 06:50:58 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFn-0005Tw-VZ; Sun, 31 Jan 2021 06:50:57 -0500
Received: by mail-wr1-x434.google.com with SMTP id l12so13519334wry.2;
 Sun, 31 Jan 2021 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ELWTSu1rl/DhvuIH4cal4USbDecgDqC8O4/05ndhpXE=;
 b=atxpO5/Camn9p7jABxjl2WTPortxY8V1F0jxEhdR2VF0SBEfPL9LK5Vq47+Eod8YM4
 aSZuSFtkdwJyK3FzZaGake8jsnv3T1MqlWW+JvnWt/YTtBuI0fzJvdhdooOiQHAYpA8U
 UVFjEvV4zBNtllHFhkwQzhLAeGmiSs62p2SIMZjyQGGHFYpj8/nWFB0rzW5VU5sTmUgU
 qArFne3BXB4GxsdEsUtx2RothKht8yJaLcLGwCRcFLJ64xxggBPETOdIxL3w2xWx/eHW
 kp9nxOa9ngRX8eU7jbkiS5Yj9hDjtee2VaqEn0fy7cAe7jyw4/p9JLsxgkBb5WKz3a/P
 MdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ELWTSu1rl/DhvuIH4cal4USbDecgDqC8O4/05ndhpXE=;
 b=hmCeJJ5TXyLT9abBPQXh8S2DRDLspWJxkGjlTQTbaj/VkC8glDhF4aq2De2IF50sot
 TUSb/qjuMYH/OmIV1NkbO4bChocKAABlVi1IANDcgPpj9+HazLV83JgoTiqp5PmQYnQL
 FLwEZ6UN9v/DX3P9x/gPzXZeRri/3Xipl1QUDf8sF2EPp79Ky/jR8Eb29xA7o5l2jniP
 ROqeSFEzDcixoiWgRCW8p90O6/oQyRKCSWh5ZVUk4RrPKpkKS/D92W3ykSlleC4Qa6or
 N1iSz7xmhHT+8idfnCUWpQtKjOsuKIb9iSvgbWYWFmsAbHXDtNk0BTEfOAFyEZ/ZtFbW
 /3xw==
X-Gm-Message-State: AOAM530EZ3N+P80otBQyg+ImIlcRvVNBXUWLRLV3/i3gp/fuwpdbM/ut
 SPFZ6iE6fCWlGdMYLASxsHMtpxoLj0A=
X-Google-Smtp-Source: ABdhPJw052bc5n0sg8qrUOVnPuK+eGRq0Nn6pE/jzM3JbJxgQX3UIdClky2OLAwF4K5l6GeEHLBoOw==
X-Received: by 2002:adf:9427:: with SMTP id 36mr13393596wrq.271.1612093853746; 
 Sun, 31 Jan 2021 03:50:53 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id w4sm2862428wrt.69.2021.01.31.03.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:50:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/11] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Sun, 31 Jan 2021 12:50:16 +0100
Message-Id: <20210131115022.242570-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 default-configs/devices/arm-softmmu.mak | 2 --
 hw/arm/realview.c                       | 2 +-
 tests/qtest/cdrom-test.c                | 2 +-
 hw/arm/Kconfig                          | 6 ++++++
 target/arm/Kconfig                      | 4 ++++
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0aad35da0c4..175530595ce 100644
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
index 2dcf0a4c23e..0606d22da14 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -463,8 +463,8 @@ static void realview_machine_init(void)
 {
     if (tcg_builtin()) {
         type_register_static(&realview_eb_type);
+        type_register_static(&realview_eb_mpcore_type);
     }
-    type_register_static(&realview_eb_mpcore_type);
     type_register_static(&realview_pb_a8_type);
     type_register_static(&realview_pbx_a9_type);
 }
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 1f1bc26fa7a..cb0409c5a11 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -224,8 +224,8 @@ int main(int argc, char **argv)
         const char *armmachines[] = {
 #ifdef CONFIG_TCG
             "realview-eb",
-#endif /* CONFIG_TCG */
             "realview-eb-mpcore",
+#endif /* CONFIG_TCG */
             "realview-pb-a8",
             "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
             "vexpress-a9", "virt", NULL
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 560442bfc5c..6c4bce4d637 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -123,6 +123,8 @@ config NETDUINOPLUS2
 
 config NSERIES
     bool
+    default y if TCG && ARM
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -401,6 +403,8 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    default y if TCG && ARM
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -478,11 +482,13 @@ config FSL_IMX6UL
 
 config MICROBIT
     bool
+    default y if TCG && ARM
     select NRF51_SOC
 
 config NRF51_SOC
     bool
     select I2C
+    select ARM_V6
     select ARM_V7M
     select UNIMP
 
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 9b3635617dc..fbb7bba9018 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -14,6 +14,10 @@ config ARM_V5
     bool
     depends on TCG && ARM
 
+config ARM_V6
+    bool
+    depends on TCG && ARM
+
 config ARM_V7M
     bool
     select PTIMER
-- 
2.26.2


