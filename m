Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEAD32FB76
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:44:26 +0100 (CET)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ6P-0002AC-Ub
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzT-0000ef-5J
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzR-0008L3-Jk
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso1134935wma.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEOID6/SjEQa+nafaAE6r6SaX3JtENvz2cvvX61NoV4=;
 b=qYAxecm3tMNtYSed3tul9cezGZKGJoiOLloFZQzksgnPo2fOZ0fOEKVKwb1lSReAKx
 btkvvg9ZYOZXZFdodmo3jE1W66wwPInzju0mbkqmL0kNWKKIc/Q5J5Gdcw2Kzs490GLJ
 7v+epxuPRM7zPCPY0aE2h+1Y9dvQ0tKgKRQ2ePncZO+6+5rnJZWsUGHFy61vWbshgePU
 DSUZZ9JWv9soNhsGELJnS/x1mMhFAlSaTe/W+Y54YoXO07eBuZE6fGA0k05hK4basSub
 Bbm7tVJY4n1yJoA7sHbIAyrFy6YN9Q+Bppii+3DoBAeFEkP3jRrxjFWQ4iOL6ygtdfEz
 uJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uEOID6/SjEQa+nafaAE6r6SaX3JtENvz2cvvX61NoV4=;
 b=KhQS+zerAIQz5ImuX1yDHNP9h5g0/IssVa3Pa5A1P3nMBQ2sDQ/2jVNSHm6/Z3Rwcq
 ATbdJ2ql+jN3ihQkKZzJZMGuDDRiNe/mN75qJcWWH+Tf1+5V1uHsKnDlNXMQxqUsOtk5
 CX1aSOu5YZyAKfOusxUicuex9O1Shuyukq+BFdAtdk5nLwsjbdet/gH91J5UQPM96hdw
 o+s4HlO4V4VETGHyHQ80mOCo3tx9xnS6e2MZ+wybIw5Otyv7lIeaiUPnWx92mingQCrD
 4drDz7pXdiaedtMuC9IrAU/psXUvisJ4YCLjY4JUEDt3YyxnJo56ZBCGFaqKV5oR0Ah6
 TgjQ==
X-Gm-Message-State: AOAM532kQ9mlSiwYfWhQxrOvFclFdkn1cs6Z3W9hAQppqCeUwe7VW9Zu
 NkQaoGWEUdLgooVET1C4J0ZqPsIvxW8=
X-Google-Smtp-Source: ABdhPJxhM+4B66SdsP+hw7kWUDpL6seuAY3Fv8pCJ210A+iZOTo790zEeDrrDSfMsbpr8VFaccWbEQ==
X-Received: by 2002:a1c:b783:: with SMTP id
 h125mr14250831wmf.106.1615045032066; 
 Sat, 06 Mar 2021 07:37:12 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z7sm9539963wrt.70.2021.03.06.07.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] hw/timer: Introduce SH_TIMER Kconfig entry
Date: Sat,  6 Mar 2021 16:36:17 +0100
Message-Id: <20210306153621.2393879-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_TIMER selector for the SH4 timer control unit.

Add the missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-6-f4bug@amsat.org>
---
 MAINTAINERS          | 2 ++
 hw/sh4/Kconfig       | 2 +-
 hw/timer/Kconfig     | 4 ++++
 hw/timer/meson.build | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8405741e910..4a722c44b1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1400,6 +1400,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 Shix
@@ -1409,6 +1410,7 @@ S: Odd Fixes
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


