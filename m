Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6993FD884
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:14:45 +0200 (CEST)
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOCa-0001On-AX
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNca-0007DA-3M
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcS-0005yd-Jn
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q11so3716082wrr.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jf3SvTXtr+76cdXYcw41T1oM3y829AbGpi+8zN1P7Tg=;
 b=tjvHHT307ckqVNFSb8p8SBTBJy3mdAy62oL03DppLHQ2mEYjAY1GdQwV/afx+oCPdh
 /i+EUNs8B8tStHtbLOGaVxz8wPcd1GRiXtufWfGa8fFKFCM/l+G4CTSEGcF84Imi5eJK
 CrArnNnnPHTh5l8IpvqVQqUj6V8VatqAuzWv+6YPHB5gbzGgbQd+f13vHds6PFyGKAPD
 so1QJUaJ9ADU+Dd+F6vcSav9t5dRcbKe/Fg2Rn6KcHDCvPT42xdXFnsQ+sgxMCMahTvt
 fRnyr8X4Xd9Fhu7bMMRx4Sj0Hq85u4uqPhJ6MEvWqc94VZVAQu3Zehq2tuPVoR1u5Wt0
 55Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jf3SvTXtr+76cdXYcw41T1oM3y829AbGpi+8zN1P7Tg=;
 b=tQAtGdLpux6wpfwdFsc+eFaIJdYRNxMRic5eJeJnloQj9kan1ABDHXWDYxYNKWpybT
 Mmjqnjj4E479GLYyBtlP0PMeDT9A4Mi4IRzLUkMXwU3zNiQJq+27adL7N0/lctAWMUmT
 gbkPoceif/84N4fGmAzn4JlQYIR0Cn5ua67L6XEZG76RbuAnC9EOpvolIjBlC6liZHQI
 oK52bUfqLdALhVYwOkm5PIYsmVYvnxTyLhe06djy3OayZ/ygCtBI5k0iGsr3dnjCBQib
 UReBnR1Pwgi/ePSFjudGvzMVOqg1NR4kPxpxOEZkR1qWyYksQfcri7KNETPKJ9xrTs/G
 9f2A==
X-Gm-Message-State: AOAM531iFfUUGw2Di2fVIUHETjIjdNicrHcroDytVWpcgxfF3/nwuzgH
 XYP8C62n/8YG4YGy3ehsfWPQshA9hbII0g==
X-Google-Smtp-Source: ABdhPJxEtlNqcSqhGd51WyD/BLZdOtthRPUpPO/mH7ViSLbhu9r3dlfzgfpz1CdcSCimds8VHduoqQ==
X-Received: by 2002:adf:816f:: with SMTP id 102mr36520723wrm.368.1630492643184; 
 Wed, 01 Sep 2021 03:37:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/51] hw/arm/nrf51: Wire up sysclk
Date: Wed,  1 Sep 2021 11:36:43 +0100
Message-Id: <20210901103653.13435-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Wire up the sysclk input to the armv7m object.

Strictly this SoC should not have a systick device at all, but our
armv7m container object doesn't currently support disabling the
systick device.  For the moment, add a TODO comment, but note that
this is why we aren't wiring up a refclk (no need for one).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Message-id: 20210812093356.1946-16-peter.maydell@linaro.org
---
 include/hw/arm/nrf51_soc.h |  2 ++
 hw/arm/nrf51_soc.c         | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index f8a6725b775..e52a56e75e0 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -17,6 +17,7 @@
 #include "hw/gpio/nrf51_gpio.h"
 #include "hw/nvram/nrf51_nvm.h"
 #include "hw/timer/nrf51_timer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_NRF51_SOC "nrf51-soc"
@@ -50,6 +51,7 @@ struct NRF51State {
 
     MemoryRegion container;
 
+    Clock *sysclk;
 };
 
 #endif
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 9407c2f268b..e3e849a32b1 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -12,6 +12,7 @@
 #include "qapi/error.h"
 #include "hw/arm/boot.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
 #include "qemu/log.h"
 
@@ -66,6 +67,23 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    /*
+     * HCLK on this SoC is fixed, so we set up sysclk ourselves and
+     * the board shouldn't connect it.
+     */
+    if (clock_has_source(s->sysclk)) {
+        error_setg(errp, "sysclk clock must not be wired up by the board code");
+        return;
+    }
+    /* This clock doesn't need migration because it is fixed-frequency */
+    clock_set_hz(s->sysclk, HCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&s->cpu), "cpuclk", s->sysclk);
+    /*
+     * This SoC has no systick device, so don't connect refclk.
+     * TODO: model the lack of systick (currently the armv7m object
+     * will always provide one).
+     */
+
     system_clock_scale = NANOSECONDS_PER_SECOND / HCLK_FRQ;
 
     object_property_set_link(OBJECT(&s->cpu), "memory", OBJECT(&s->container),
@@ -191,6 +209,8 @@ static void nrf51_soc_init(Object *obj)
                                 TYPE_NRF51_TIMER);
 
     }
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
 }
 
 static Property nrf51_soc_properties[] = {
-- 
2.20.1


