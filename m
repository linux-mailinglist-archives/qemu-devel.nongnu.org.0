Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4268308835
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:23:29 +0100 (CET)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rs8-0000fX-My
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWJ-00050r-Ty
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:55 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWA-00076w-Rb
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a1so8416629wrq.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LCpT729Mo0phwrHmAvYq3gK+eaezJmdIk0vAwi0ZpHM=;
 b=KsXSPRZ1ws/4SjflUFgkc9xYeV0HH9GdwYZzs2OEEB/3cuA1ANg9yweOdyrS92WBaL
 GWdDbpD+K0Ww7HFRKER1a5keIF9JFxijG7B6RrIsajKBgZ512UYSPoNCvrNNjsOJFpik
 U2mTug+5oDDEGQJmKPzx8aUF5LsoDkFIp2IOFQTTxQmbVxd/RKR4I6i5SdaUHvVAzb+T
 PmQ+VHGZ9gjRng6SSFlxSbWk+uoeN5BGt1n0siQoFm0haUSfo2aM/7YyiHpNIKF3N3le
 IrV9w2IsIcpXYSZLifQAsUiouFdTEDsr6DlAPnB3YsVPYbSVtBa1J/hlVrBiqs9qnKwh
 RRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LCpT729Mo0phwrHmAvYq3gK+eaezJmdIk0vAwi0ZpHM=;
 b=YhhvVZnV5kNFe78p/twn3hbUr4l8anz2iASsdcNKITsV1BFplhiqsHZCih4P/mu6se
 Gd3ZJlYqrWvFB5BtypbzrT4nXE9rwRWWG+b5kcvk445/z9bskFVzykThqXtzK3keKFKh
 DLibBZtjVe93jT6+kA4XocOf4Fh2ZSrqzBVeh/C8oC6IsRBHF1hVrLnPFFbNFGwvBgkM
 CpsV4+oR3US56/CrUVsSyjh4Cg5ycdmtHpulylmNZTlABa47Tj6r5uQUmopZM+D9L5QD
 ZA0CuLqFu52lTUColpQqr2aG11Ilq/C5WAAyjt4OXiB6kkXppGxG227/uZJLrshOOLCm
 D25Q==
X-Gm-Message-State: AOAM533dgpcjrA2p+jqR0GHoRWbXyyBw9LxD/HVX3OuA5BP/rl2k7xxO
 a6ocP7FOsrxd1RZMU2xjnuC8pKDv4z3nmg==
X-Google-Smtp-Source: ABdhPJxN24VGyvBVEkIsxdd7XkxuiO1jYPu5F+c2MgMWc+Qj4b/rpcUFdEu4BKcbQvz6lcdcUYHOiA==
X-Received: by 2002:adf:df0a:: with SMTP id y10mr3900718wrl.214.1611918045480; 
 Fri, 29 Jan 2021 03:00:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/46] hw/arm/mps2: Create and connect SYSCLK Clock
Date: Fri, 29 Jan 2021 11:00:00 +0000
Message-Id: <20210129110012.8660-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Create a fixed-frequency Clock object to be the SYSCLK, and wire it
up to the devices that require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-14-peter.maydell@linaro.org
Message-id: 20210121190622.22000-14-peter.maydell@linaro.org
---
 hw/arm/mps2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index f762d1b46af..cd1c215f941 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -46,6 +46,7 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 typedef enum MPS2FPGAType {
@@ -84,6 +85,7 @@ struct MPS2MachineState {
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
     CMSDKAPBTimer timer[2];
+    Clock *sysclk;
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -140,6 +142,10 @@ static void mps2_common_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
+    /* This clock doesn't need migration because it is fixed-frequency */
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -341,6 +347,7 @@ static void mps2_common_init(MachineState *machine)
                                 TYPE_CMSDK_APB_TIMER);
         sbd = SYS_BUS_DEVICE(&mms->timer[i]);
         qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
+        qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
         sysbus_realize_and_unref(sbd, &error_fatal);
         sysbus_mmio_map(sbd, 0, base);
         sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
@@ -349,6 +356,7 @@ static void mps2_common_init(MachineState *machine)
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
     qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
                        qdev_get_gpio_in(armv7m, 10));
@@ -356,6 +364,7 @@ static void mps2_common_init(MachineState *machine)
     object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
     qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
                        qdev_get_gpio_in_named(armv7m, "NMI", 0));
-- 
2.20.1


