Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B402FF424
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:19:50 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fUi-0004h6-S9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI4-0002DO-Gf
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHz-0005oJ-2b
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id d16so2144772wro.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0rKrl7iJBderO7McLU9xdXqR32edl/U7+oETLREFgpc=;
 b=o5xVGYj6fJqYPGJqArDxdJUlPmUJ6v3eebK0MQPMjvr5Mq1HJ/phxgK3X11dcErZDc
 nIklC5LhCi7P8IeWH8JoxCJz1dJ0r0e+tT3YA3zkr15HbUKNyVwc33WvI+D73cFEvLH5
 4+SdU2CFDMCTtw0FMGw+hqqSdUvzkiGR6TzOr5RnSQQ2h8YyChyFM0K1I9/okg+88jn4
 tPo9v+u14kTXVc0Ur31wPHr/6UQmhkSqyJPWy0Hs3+0unVr/xPgeMAaODONR6Rpb9u33
 5I0t14ZtLGyO9ca+rOEfi/lTzMh09F3csoxmoTgFnrbW31iKRvwFWrcUewAxOUvmOu8A
 xVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rKrl7iJBderO7McLU9xdXqR32edl/U7+oETLREFgpc=;
 b=K4U4weRa8ah2ACzbSRR2c9s1YxLltMNUFCmSihzhocy0rIk9qeOwXwg+jxEnu8wd/q
 NJ79FiwNEYjDfBJ8+7R5ACKl94/VAcifYmXGnFFSmW8eLn4ABnM9IJjvhdvVyd97oX8Y
 12arZSAcQXaCwd+aQnvGy9g1U1prOeyinHy/V4VjfG/eS7t3kIPc6IBPI5GkBSrNupb5
 dWQevftTwqiUxnq58rp6ZQQFtKjOyuvl8hk2/f/UIjWa9XeJj3spsvOQzjz+tDf9vtmh
 ho2ToPnWG+hSqRNr4wVAhC0lApT1BDvLhVGS0uc/WA2Cj5YGebUGXkBBQ41wVqCy8BX2
 ANXg==
X-Gm-Message-State: AOAM530oMCCmbMGl/rOjymi5+sNLa94J3Zm7Ky2fZBJ0teUxvZzpmMKZ
 Fl13gzR0DdQnhGRxAnPileo1Ymj/SAK13g==
X-Google-Smtp-Source: ABdhPJxlG6Vd9vpqtzsXEBmbnSaJS/I58lwnGyTXDabkF47dh2Y4VWcC3veHQHWGJyDv1wz39H0PMA==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr872864wrt.324.1611255993206; 
 Thu, 21 Jan 2021 11:06:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/25] hw/timer/cmsdk-apb-dualtimer: Add Clock input
Date: Thu, 21 Jan 2021 19:06:05 +0000
Message-Id: <20210121190622.22000-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the first step in converting the CMSDK_APB_DUALTIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the pclk-frq
property to using the Clock once all the users of this device have
been converted to wire up the Clock.

We take the opportunity to correct the name of the clock input to
match the hardware -- the dual timer names the clock which drives the
timers TIMCLK.  (It does also have a 'pclk' input, which is used only
for the register and APB bus logic; on the SSE-200 these clocks are
both connected together.)

This is a migration compatibility break for machines mps2-an385,
mps2-an386, mps2-an500, mps2-an511, mps2-an505, mps2-an521, musca-a,
musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/cmsdk-apb-dualtimer.h | 3 +++
 hw/timer/cmsdk-apb-dualtimer.c         | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 08d9e6fa3d5..3adbb01dd34 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -17,6 +17,7 @@
  *
  * QEMU interface:
  *  + QOM property "pclk-frq": frequency at which the timer is clocked
+ *  + Clock input "TIMCLK": clock (for both timers)
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: combined timer interrupt TIMINTC
  *  + sysbus IRO 1: timer block 1 interrupt TIMINT1
@@ -28,6 +29,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_DUALTIMER "cmsdk-apb-dualtimer"
@@ -62,6 +64,7 @@ struct CMSDKAPBDualTimer {
     MemoryRegion iomem;
     qemu_irq timerintc;
     uint32_t pclk_frq;
+    Clock *timclk;
 
     CMSDKAPBDualTimerModule timermod[CMSDK_APB_DUALTIMER_NUM_MODULES];
     uint32_t timeritcr;
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index f6534241b94..781b496037b 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "migration/vmstate.h"
 
@@ -445,6 +446,7 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
         sysbus_init_irq(sbd, &s->timermod[i].timerint);
     }
+    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK", NULL, NULL);
 }
 
 static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
@@ -485,9 +487,10 @@ static const VMStateDescription cmsdk_dualtimermod_vmstate = {
 
 static const VMStateDescription cmsdk_apb_dualtimer_vmstate = {
     .name = "cmsdk-apb-dualtimer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(timclk, CMSDKAPBDualTimer),
         VMSTATE_STRUCT_ARRAY(timermod, CMSDKAPBDualTimer,
                              CMSDK_APB_DUALTIMER_NUM_MODULES,
                              1, cmsdk_dualtimermod_vmstate,
-- 
2.20.1


