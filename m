Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EAD307513
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:46:10 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55kX-0005Iy-CJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gd-0001SG-Dj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:07 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gX-00069C-AD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id y187so4304740wmd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zzVeUuHknztplC3v0ZMbhPlrZqaBQlkBJqvUyi+S9Nc=;
 b=e4+1aXrcpgs/7tq11fvtF0qHPKXtxuWZqIG+XTkZBwQEIFsWlFr2TNW6QgO9xCDXai
 xCRHG5M2g+4rKkk7R5aC4CMrNdmGpakSWBxGmZkJtUiYb+ulH9fTDh+90dCuHOepgYJQ
 WU17zPb9650ehmZeiHDVqWKM8BWiNQgQAZ9aGWTx20XXYkwEOC+emOTdVkpwEkeyHn63
 K9Nz2FYlWSDvdGYkBA00rps6VyLnSqizoOtmVIgkMUFT1/9b5jCRdGfEisy1UWDIBPLo
 JZW1VWql7f2lTN7XSxDhJ047oNyYguH//2svox3C14eGfIZstrD+I5BZj0sNnNHI3bHn
 svEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zzVeUuHknztplC3v0ZMbhPlrZqaBQlkBJqvUyi+S9Nc=;
 b=JcIvaTZdZSWaEM6ao2lq2kbj2LqbgMspWrvnIRvO4lCBma2b6JRhTuwt1sGXCXcyf4
 kKUmCdpkbqSzYcqzZjzYVJiFIXPA7Q9YO28h0IK5vRdd5quIptjhRkhisiOHvvCCnGCH
 bf9gL1BS9dQNK1UfJEtOaESbmYBQl9lPii4520oZK+/divRjURmJhLN7vsDXlws/YnEZ
 iDRyUcHVc+mSMg6DMkDjuoXcvonn3eVMYHbUGIpf4QAqarIaoWhdy0FBLE2QZYwj1YPe
 cus2Uk/SFTSmNa99KYNOKXAS2GsY4DUt7zNHgNQMwXGcFbjd94ee8dHkDGGIPZWD2B+q
 vM0Q==
X-Gm-Message-State: AOAM533V/PsqUuFVBv998F2bmeaLqjLmysyUL0WPNcUm3fBGfXeHRiby
 Td2yVEmNN6nf7lzh0Yf+mlcUFw==
X-Google-Smtp-Source: ABdhPJwNOtY47otdbGuJq5mXVe795Cc60m244Cs0xEyNnXlrFCwm+dDRMzA/UNLTe9Gzj2CIerz3Jw==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr8349999wma.103.1611834119976; 
 Thu, 28 Jan 2021 03:41:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/25] hw/arm/mps2: Inline CMSDK_APB_TIMER creation
Date: Thu, 28 Jan 2021 11:41:32 +0000
Message-Id: <20210128114145.20536-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old-style convenience function cmsdk_apb_timer_create() for
creating CMSDK_APB_TIMER objects is used in only two places in
mps2.c.  Most of the rest of the code in that file uses the new
"initialize in place" coding style.

We want to connect up a Clock object which should be done between the
object creation and realization; rather than adding a Clock* argument
to the convenience function, convert the timer creation code in
mps2.c to the same style as is used already for the watchdog,
dualtimer and other devices, and delete the now-unused convenience
function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-13-peter.maydell@linaro.org
---
 include/hw/timer/cmsdk-apb-timer.h | 21 ---------------------
 hw/arm/mps2.c                      | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index fc2aa97acac..54f7ec8c502 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -45,25 +45,4 @@ struct CMSDKAPBTimer {
     uint32_t intstatus;
 };
 
-/**
- * cmsdk_apb_timer_create - convenience function to create TYPE_CMSDK_APB_TIMER
- * @addr: location in system memory to map registers
- * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating baud rate)
- */
-static inline DeviceState *cmsdk_apb_timer_create(hwaddr addr,
-                                                 qemu_irq timerint,
-                                                 uint32_t pclk_frq)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_CMSDK_APB_TIMER);
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, timerint);
-    return dev;
-}
-
 #endif
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 9a8b23c64ce..f762d1b46af 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -83,6 +83,7 @@ struct MPS2MachineState {
     /* CMSDK APB subsystem */
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
+    CMSDKAPBTimer timer[2];
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -330,8 +331,21 @@ static void mps2_common_init(MachineState *machine)
     }
 
     /* CMSDK APB subsystem */
-    cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
-    cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
+    for (i = 0; i < ARRAY_SIZE(mms->timer); i++) {
+        g_autofree char *name = g_strdup_printf("timer%d", i);
+        hwaddr base = 0x40000000 + i * 0x1000;
+        int irqno = 8 + i;
+        SysBusDevice *sbd;
+
+        object_initialize_child(OBJECT(mms), name, &mms->timer[i],
+                                TYPE_CMSDK_APB_TIMER);
+        sbd = SYS_BUS_DEVICE(&mms->timer[i]);
+        qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
+        sysbus_realize_and_unref(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, base);
+        sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
+    }
+
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
     qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
-- 
2.20.1


