Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D23EA242
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:44:30 +0200 (CEST)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7GH-0001eO-Mi
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76R-0005f7-Cx
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76N-0007wE-7Y
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso6629660wmj.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9TW5HgoQcdmb8WDggWO7uUKdFyUTLqM4EhcWbfGZhw=;
 b=adsc+FSfAP267D/IMPCTIeGQFSo8uUzkq7o0zeEYLxtc4vhw0eGVm5Lp4Pxj06anDz
 c4wsWOj/o7oO4yM/A0OZIUAugTvKEHBAG0jHpcD+nBWLEuxYeEXKduG4OkceAmjX+b/0
 Zb5wLobsFwFHxX0hSSYxxhvio+kVtLGYNXcKyACpnH9huTZ8Coz1ewfrz0gWS9nqbA5r
 CA6FF8lVzAVBKwHt7xfqc4K35ZI85C3a8RXp4Hdjb4OqpgbZmHwlqF5wOA8Y5VYeZQFU
 EpaE2dIW0tJyyL6eAgGBiwOaPwVynBS5n/f+FfddRW4KfO1fYu5y9zuiwAcUA7/WQgRp
 7E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9TW5HgoQcdmb8WDggWO7uUKdFyUTLqM4EhcWbfGZhw=;
 b=qldsnz/ukTShj6kHv95xNmOLqwb0Iy6XmO6txpXk3D61id/pZUD4dlIuedayaZw8BQ
 tVTPAEw26hi9sabLuFNyHfpbbA/2Hdh4jqQUDT6aRXe3DzCiN/aX9BUtziZFq5LuHUOT
 aK1dFAD3L1xdWxlp1nts2JPW9mXmAs8Hr0xWn8jmIV8n2iSzcqcmozEwolPG69PMkaOs
 /NE1UUeGEJ9X+tgbELx4CHC2dncleg2jygvb/Zm3tKuvt4RJ9dugECwHKHOq3CP6o2JD
 Uw9CRwlEgEjs7Mdppa4iOgA9K6eLM/ozYmobWeBgH9nRRL8kpFFgJUig4ZWpUtjYHX9t
 xs4Q==
X-Gm-Message-State: AOAM5317D1E9arglZPGNOnUIXAVnro5Iz8K/T4TrHZfUnnnngPO6rZiC
 7XQGyA7Mll4gu3uvwWan5JH8gA==
X-Google-Smtp-Source: ABdhPJxujy/am+RZl0mQcarjq+vdVU/TPvgIniRUNQNU1QbpTVRW06dI9vKYPuGfI3Ai2h9thfq1RQ==
X-Received: by 2002:a05:600c:246:: with SMTP id 6mr3000980wmj.36.1628760853197; 
 Thu, 12 Aug 2021 02:34:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 15/25] hw/arm/nrf51: Wire up sysclk
Date: Thu, 12 Aug 2021 10:33:46 +0100
Message-Id: <20210812093356.1946-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wire up the sysclk input to the armv7m object.

Strictly this SoC should not have a systick device at all, but our
armv7m container object doesn't currently support disabling the
systick device.  For the moment, add a TODO comment, but note that
this is why we aren't wiring up a refclk (no need for one).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


