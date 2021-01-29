Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC2308831
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:21:08 +0100 (CET)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rpr-0005YH-TA
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWI-0004yU-V4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWA-00076k-7t
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s7so5398593wru.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QQqVwaIr/CxKQqKVNqKGG0eEOO4Bc0bo6utCYxNydn0=;
 b=W2Szp1QYRj4StLAT2BW469KfdUQjvRHde19KuO6i9lTyDGm/ADC4kQ3Od+xFts8ze5
 SpaMMm2GzvbzZHyjDbi9x21NgWI9W4cbX8CM88hLbOZOub+Pm1SXeb5TyXphwUGdF0Kj
 IKbUmhXptN/zPwSR0YiVwwDcGIJqIS5w8eHVr775dXTULLUOZqDAxamXnsJmWtuF0gEe
 wn0sjgKiozCfAr0fLmHvGHNG4uOKRz5MUueTPI4t47FBqYMLoFTreFeBFR3qpX93cplv
 rWY2GjKWpGWPZX3eN7LMM0PEiCdWDuoe3g+hC2krDJ/yv7EQPzo8QcUCV+DDO2jSOPOA
 Ki6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQqVwaIr/CxKQqKVNqKGG0eEOO4Bc0bo6utCYxNydn0=;
 b=cH49mDISJnLBCwQEJ3QqhjiHtiSIiaUrErLPj7hR6/Dz1ZeuA4S9BHDWawAg6j8u3F
 WWRVflAWyAndfocCREENwfXxesJGgjABpWSpKw8Vty2EMlYD9GZtjZTxzsQa48LGV17s
 vkaP2ATUIRIWGkSe0a0KVjp+aT6ksRFjagorR1k9DyvDxhPpFrD2OSpvYFuDsPGBhJ7V
 l3r4/LjLUJtxGqSWkNl0M7f8GnBLWAI/9b7yWWr4etpSDEZ2b2fXlCUxTejTGoxEbipn
 TCEsgpHos1G+ulenjCk1U6c/Za5JFmn0g9baze1C7agMPh70a5L5KUzKz4cBV8hH23dp
 oAew==
X-Gm-Message-State: AOAM533rvTUxXGoLSdPgvsADJaXqN8aQPiHFdhLzYvNJ2iC4JnDoI47A
 6bAdsO0tF99hqhj7nGsHCxJbaD/KtL739Q==
X-Google-Smtp-Source: ABdhPJywniP52a7ZbsmBTy0e+JOxGk0yXTWFu5pF5SIsw1LmWq8ifg4lDqrQwh1Rz6HNWEfJTmbAmA==
X-Received: by 2002:adf:b1da:: with SMTP id r26mr4130970wra.198.1611918044739; 
 Fri, 29 Jan 2021 03:00:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/46] hw/arm/mps2: Inline CMSDK_APB_TIMER creation
Date: Fri, 29 Jan 2021 10:59:59 +0000
Message-Id: <20210129110012.8660-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-13-peter.maydell@linaro.org
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


