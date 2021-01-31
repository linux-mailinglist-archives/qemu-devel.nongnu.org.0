Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD4309BC2
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:59:16 +0100 (CET)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BNq-0008Iy-UL
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFe-00028x-Fz; Sun, 31 Jan 2021 06:50:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFc-0005Qw-Q4; Sun, 31 Jan 2021 06:50:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id c4so10793773wru.9;
 Sun, 31 Jan 2021 03:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fh28JukriQ8n71FXrOcLQmLKpZgUpaavJogE1lG2lKE=;
 b=V9jvv1aL3pv839Xy1/0k6WXm66MH9MuJ++7EvsG8qCa8S/wu6yqaRlsHWM/6QNB9nq
 otF67bI38HB/w9Q6MYBXxVOV5UBCfzchBKzB7qzo23tC+CtVSDEiuDhSZgH2dTnQIoYd
 6joAcsNUIBk61d62T+9j0tEWV0NdSA6ytJkUxnBG0i3S908YNLWEon8evQ47X9B2sLl4
 nYV4yaQ2owvFrejRRcFu4R05XEV7WMKV9GrqyrPq04KqW0pgCUzJ6KMZIWHx1H0HXq9X
 d3lwh952RSMVU6+mG+0RM+tLEOoLrQ673P9FK4aAUMuTDxUGUjXBbhRSvwjSbsfKJ1+J
 eQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fh28JukriQ8n71FXrOcLQmLKpZgUpaavJogE1lG2lKE=;
 b=t1pHnxDdeHwVmCCaPR2yg4XDbCRrKsOqi7VOyIhHSOxjf4Ipg8is8uhVzpiLLKuKNk
 EL9UuHG2ENXmmOb7gPPHKV34tP1n83Q1TExkSHup2Ab9R4Fp4A2PnEWcvZ67T/7k1HI3
 7oTNX8L5E9Lzjw+dbt7T/0fxR5tLc29Q+/TWc2s+R6+oienzaPYzSprL3sz+tQibxJbv
 L/iGghl4k4lqW8j2z7L+AD70/XlDRsw7X/6sUqfyJgqW3agOT0qTTR0GacDLeWDUGlvK
 o44sfPFof0YfoWiy8CuU/y3v9W9QgxKZTZP1dmdnh4nnb5zL1/KsB8FgHWeutuznvTBL
 NB/A==
X-Gm-Message-State: AOAM531V9mhLexS1QYz+uBqDJZyDk/9ihPHUCfbFllNoI4QfyGJI0Yvv
 XZEgbMimp2sD0lE+7+xvtxResPlQWZE=
X-Google-Smtp-Source: ABdhPJzPZYCyk9Lid3tGRWhj4ZiT3g9tiJCZJewZhjiHAEXNm3DGC368mGAO4xLutOTTbFfAQmbXoQ==
X-Received: by 2002:adf:f303:: with SMTP id i3mr13248696wro.60.1612093842413; 
 Sun, 31 Jan 2021 03:50:42 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id c18sm27536097wmk.0.2021.01.31.03.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:50:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Sun, 31 Jan 2021 12:50:14 +0100
Message-Id: <20210131115022.242570-4-f4bug@amsat.org>
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

Only enable the following ARMv4 CPUs when TCG is available:

  - StrongARM (SA1100/1110)
  - OMAP1510 (TI925T)

The following machines are no more built when TCG is disabled:

  - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
  - sx1                  Siemens SX1 (OMAP310) V2
  - sx1-v1               Siemens SX1 (OMAP310) V1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/arm-softmmu.mak | 2 --
 hw/arm/Kconfig                          | 4 ++++
 target/arm/Kconfig                      | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0824e9be795..6ae964c14fd 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
 CONFIG_FSL_IMX31=y
 CONFIG_MUSICPAL=y
 CONFIG_MUSCA=y
-CONFIG_CHEETAH=y
-CONFIG_SX1=y
 CONFIG_NSERIES=y
 CONFIG_STELLARIS=y
 CONFIG_REALVIEW=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f3ecb73a3d8..f2957b33bee 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,8 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    default y if TCG && ARM
+    select ARM_V4
     select OMAP
     select TSC210X
 
@@ -249,6 +251,8 @@ config COLLIE
 
 config SX1
     bool
+    default y if TCG && ARM
+    select ARM_V4
     select OMAP
 
 config VERSATILE
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index ae89d05c7e5..811e1e81652 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -6,6 +6,10 @@ config AARCH64
     bool
     select ARM
 
+config ARM_V4
+    bool
+    depends on TCG && ARM
+
 config ARM_V7M
     bool
     select PTIMER
-- 
2.26.2


