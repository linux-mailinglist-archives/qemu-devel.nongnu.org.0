Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14D321A09
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:19:12 +0100 (CET)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC3L-0005mr-K7
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC04-0003e8-35; Mon, 22 Feb 2021 09:15:50 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC01-0001LX-Jr; Mon, 22 Feb 2021 09:15:47 -0500
Received: by mail-ej1-x633.google.com with SMTP id r17so3246718ejy.13;
 Mon, 22 Feb 2021 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8NQxzvw/rLDcJlmgmZNjYJ+dqWkqgHbVTMWeNA+d6sI=;
 b=LV5fuJFbP0bzckaxjC0Y4PKvN3Z2pJmy5CUQCxrZbTyoAneTWb2X93H2GjYeHSYXek
 NXlCzh30aBHki9hI43X+nQ561ga7DXo54YVPFY612woox24E/smzfwdPRXpplx4uS5/G
 cuqwSxTEMnTBxudiuMnKSxhO7Vpr7LAfFT842qzQjPn6rbiDc7jCOVXLryT8Xh82Jpak
 Amm8EYjm0sIK3yV2YS+tbYo2Np8bRYx4k1SlgH1yCD9vTeuNkMFAtTPXFh2jyNXsGNEE
 n1sMrFeZPmqoHXPBD5zZ1qbX79MDEnBHaCwstC2fUY6FcJDJH10UhgiEiNJxcn5wibAK
 rXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8NQxzvw/rLDcJlmgmZNjYJ+dqWkqgHbVTMWeNA+d6sI=;
 b=VaiKGrMeDE90PrPAS7zqOPdfUJ+4FfjFzhwByi8hGFsQVINciE1Rh/lwJjfxs1LyK4
 xdCvfTDiwYpIkO7F9+GRWEY/JtTBnzLfLhrKY91PdXqJchGBwVw1KQ2+5B7+PtWe59bW
 IauPEPCLVaHAEKh1QrHDLPQlBtUhfNbGlG0G0/CcuGTl4LpGacq7AJLg4u+qrhWkHdu8
 Kyr5iKHIizTkX6pRBYZRkhiKauiPpNrm7lN84/WyBrywGvdhlfYRZNbYRJdWkjXT6UrE
 sgr/q8FA7s2rI12U5YJEUAsjLqHmsq8OSFZDcRiwn3M/7TdNnY4UFYhU0tms6b7C89RY
 o22A==
X-Gm-Message-State: AOAM5326sLu5HNRf2ejR+XB66UM2yOSgwdYII35MujmeUIGaDmbDF4UO
 +O9yajpG9TUHVGPwycMgoFJ1NvcEK6g=
X-Google-Smtp-Source: ABdhPJyFeeRMdSjLmSCuX2+pw2XUoR+EWcgA9uqO2//Sw1DC+CyIoBwp8FPTccGWALLyMECJ1H1tHw==
X-Received: by 2002:a17:906:43d7:: with SMTP id
 j23mr20924571ejn.519.1614003343694; 
 Mon, 22 Feb 2021 06:15:43 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w24sm11633219edu.2.2021.02.22.06.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/8] hw/timer: Introduce SH_TIMER Kconfig entry
Date: Mon, 22 Feb 2021 15:15:11 +0100
Message-Id: <20210222141514.2646278-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_TIMER selector for the SH4 timer control unit.

Add the missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS          | 2 ++
 hw/sh4/Kconfig       | 2 +-
 hw/timer/Kconfig     | 4 ++++
 hw/timer/meson.build | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b53a937714a..a03557f4f7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1391,6 +1391,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 Shix
@@ -1400,6 +1401,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 SPARC Machines
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 47240aa97b7..e569470a614 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -21,7 +21,7 @@ config SH7750
     bool
     select SH_INTC
     select SH_SCI
+    select SH_TIMER
 
 config SH4
     bool
-    select PTIMER
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 8749edfb6a5..18936ef55bf 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -36,6 +36,10 @@ config CMSDK_APB_DUALTIMER
     bool
     select PTIMER
 
+config SH_TIMER
+    bool
+    select PTIMER
+
 config RENESAS_TMR
     bool
 
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..26c2701fd78 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -30,7 +30,7 @@
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
-- 
2.26.2


