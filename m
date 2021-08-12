Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720D3EA228
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:38:00 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE79z-0006iT-Ay
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76K-0005DZ-8j
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76D-0007nj-B7
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r7so7425433wrs.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HH+JYD3ePJ2M8XF+0f5Esmo3hxwe5zPdaITYbd/Hd/Y=;
 b=Z7JlLoN4vr0J9S8R+x9+SQ5T342bZj9pHK9VEf6Wfdl+T7tCdMA7apQRW4D72jeRFO
 KWX7YkCaJs4fsT5uU+n+AUwVAmR6OLtgNev8BOSHhjTSiGy0zramgR1lDOeeVOMPC0Ar
 8BCFNLHG8B2meSAmZdYZyZowL5wCy38lnNR8+jKRm/slAjHoGNHeA+0U0pkTHyetm9jw
 /mhCe5OwT0y4dyeqgfZPcvc6+cFt+ZH4B/KWv4y7P9rfI6KECRwNZNgIMhQprMERCy7a
 v9sgNzjihsEE7g/E7gBvVOAHMIVy9fu23XaTKeHJJoCtQ0JQ8jmjQNHEMNdijlROEAPQ
 bXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HH+JYD3ePJ2M8XF+0f5Esmo3hxwe5zPdaITYbd/Hd/Y=;
 b=ClpbE5DXQr/PMv7hhVIVbHeSFHGb6OKjxwpcA4JxgPGMNUCtbLBkn/LcwtJgP5caaJ
 HPs3n1TMWZ5jxnp6Csws3brPpofmnSjrFdE6kAcljNM+ItA3zFS3aRsBoWMf/rf2qyYG
 FxbELm/8NynflYWanc6ZuQ4K9wjoUL578t8JvcnQte2eFUrSuyB/Cn8HNgaNUEXbqzVx
 1sQ9kn5MMZrLRvDntkloIWnU6kCvB9dCFm3X9wmO9wnUvFqyU5d9IJfZPosm8piP4RFH
 aXleRYURS0EraUZFOntoeQpk5goP3u5o3BAFpsDH/QtZ6XkaonUepuFuJVu7PjG9MtSE
 9zng==
X-Gm-Message-State: AOAM530nJIRnLBAgQGIjzik5oVF9PEkzVoL1hFaEmssEyeR8ND8h9R1F
 5bkduWVkM5UI9KOkLSXTo4AYlA==
X-Google-Smtp-Source: ABdhPJzaUyZZCFOzlQxt7StdEWDDvs/gsnM02q4kYCdyKX7dkr0dE7NgJqQ/64oLG97ss97+odS5xw==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr2877179wrx.399.1628760844033; 
 Thu, 12 Aug 2021 02:34:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/25] hw/timer/armv7m_systick: Add input clocks
Date: Thu, 12 Aug 2021 10:33:36 +0100
Message-Id: <20210812093356.1946-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The v7M systick timer can be programmed to run from either of
two clocks:
 * an "external reference clock" (when SYST_CSR.CLKSOURCE == 0)
 * the main CPU clock (when SYST_CSR.CLKSOURCE == 1)

Our implementation currently hardwires the external reference clock
to be 1MHz, and allows boards to set the main CPU clock frequency via
the global 'system_clock_scale'.  (Most boards set that to a constant
value; the Stellaris boards allow the guest to reprogram it via the
board-specific RCC registers).

As the first step in converting this to use the Clock infrastructure,
add input clocks to the systick device for the reference clock and
the CPU clock.  The device implementation ignores them; once we have
made all the users of the device correctly wire up the new Clocks we
will switch the implementation to use them and ignore the old
system_clock_scale.

This is a migration compat break for all M-profile boards, because of
the addition of the new clock objects to the vmstate struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/armv7m_systick.h |  7 +++++++
 hw/timer/armv7m_systick.c         | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 685fc5bc0d7..38adf8d274e 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -15,6 +15,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 
 #define TYPE_SYSTICK "armv7m_systick"
 
@@ -25,6 +26,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
  *  + sysbus MMIO region 0 is the register interface (covering
  *    the registers which are mapped at address 0xE000E010)
  *  + sysbus IRQ 0 is the interrupt line to the NVIC
+ *  + Clock input "refclk" is the external reference clock
+ *    (used when SYST_CSR.CLKSOURCE == 0)
+ *  + Clock input "cpuclk" is the main CPU clock
+ *    (used when SYST_CSR.CLKSOURCE == 1)
  */
 
 struct SysTickState {
@@ -38,6 +43,8 @@ struct SysTickState {
     ptimer_state *ptimer;
     MemoryRegion iomem;
     qemu_irq irq;
+    Clock *refclk;
+    Clock *cpuclk;
 };
 
 /*
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 2f192011eb0..e43f74114e8 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -14,6 +14,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -201,6 +202,9 @@ static void systick_instance_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick", 0xe0);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
+    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
 }
 
 static void systick_realize(DeviceState *dev, Error **errp)
@@ -215,9 +219,11 @@ static void systick_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_systick = {
     .name = "armv7m_systick",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(refclk, SysTickState),
+        VMSTATE_CLOCK(cpuclk, SysTickState),
         VMSTATE_UINT32(control, SysTickState),
         VMSTATE_INT64(tick, SysTickState),
         VMSTATE_PTIMER(ptimer, SysTickState),
-- 
2.20.1


