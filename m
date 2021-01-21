Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422602FF473
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:30:06 +0100 (CET)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fef-0006mJ-5H
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIN-0002Om-Eg
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:03 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005pU-0e
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c127so2435204wmf.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71fXmSxG4SGO/lxGONnTuENMy4+MVUOt7YwIy8LfeBo=;
 b=gye4933kAc2ne7YO71GYHXD59s2FPYqiDoWpqU3dzr5tETDWrm5S+CVr75TOFVOsJC
 rLHf1+fV/40Fbh35e3dI2rQH51mk9grziKBKVaZmPQgnwvXbw2HDPek9KadtEEVpcZwL
 vfyJGzQCABdjOiX+gc96aM/7bNuYR4a2SyNaibKB/YDeThJiMrKvbeZQKls9vN/H5EiZ
 4UyTxSHdiHL8sXnlQEO8zkEtiYQGkpBmg47muvvervCcaykQYfFpV737Bg06UXlHKeMC
 1xP08o24dZKDu466+vQXsZylv+i1ktZrDsfomuiAj2SkYunsV29yIjo9OMVCvc0SqUaW
 tZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71fXmSxG4SGO/lxGONnTuENMy4+MVUOt7YwIy8LfeBo=;
 b=TPc2htyiIvynHkh2SqPmIy8zA7uIwsQ5fFtPBntiILBP1Wey2MkFQ1arVuX+M9+Y3q
 eCjphkjzL2iyfWgLr4UxfS1MS0uAvB4pBFYG07RZv5G2TgleAmiSG0wdXEQCcFPzMb6v
 VwwttDKKg6Hp7JvwEOqP14VcDbc1ek6WDySmS9pYduK29kk7Cu0QYAYcidWa9mquPr1w
 IEUFJAuwnVeW16V4wDAsS8Jajw5rDRR4QXf1NW4Y++usPDl6VdTKp/y+Dvf0jFdjQ/UK
 iBhkHkaBEJuzz+RJvxRkPxV0MeI6IEy2G7eMPH73q8Jr+DkSgiTJ8Ar6yhz8VdCMtZIo
 2FBA==
X-Gm-Message-State: AOAM533p+9gsSMwLu7ju8pek3OnfBwpgC2U58YgRPdOAeX3sUqLqUpyJ
 5qsQaiogSYya2XAC8DX0+YJCeA==
X-Google-Smtp-Source: ABdhPJy+thCtVML5VkorJnHUJKfiDdXDawra/TmHMbijyF2wxAA2i/ZKzkNZVABKeaAT3meBtCEWUg==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr690186wmd.145.1611255996983; 
 Thu, 21 Jan 2021 11:06:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/25] hw/arm/mps2: Inline CMSDK_APB_TIMER creation
Date: Thu, 21 Jan 2021 19:06:09 +0000
Message-Id: <20210121190622.22000-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
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


