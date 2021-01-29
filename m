Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDA308834
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:22:55 +0100 (CET)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rra-0007kp-6A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWG-0004s2-Ao
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW6-00074w-UK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id a1so8416369wrq.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jcbJyC0r8hp/H80y/scajTOtlzDT5KI7DBhK3LWW4jU=;
 b=OVXDvOs8haaudEjUUIaWslruHxMeR36mV8jrk2b+kaBfnFFHWu5me6lOyJXHwRmpUO
 nHabmqDFuKORAQOdrSCjP5coWJnKhrBKfHoO4vnRldnINi5YVgWEOqr18TNuHOcXSsKY
 r+IaS5a8W8dgEtAyj22uRLkX+UgzLqwPLfPPaT5h+haM4sMM+lGJhgcw89vsAgLjs6qO
 o+dgbbKVjmxbFeaAHqJz+WV64jA0HgCMHPZ0qgsHwPHlDYXq9RPa9vsr8OL307tzFPvl
 2C2DQyWPDxhCIqKCdAfRXTzQFK0AermnV28tTPzkxOJaHZxb9KDGTgXKZ3apTmVGBM8k
 HH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcbJyC0r8hp/H80y/scajTOtlzDT5KI7DBhK3LWW4jU=;
 b=Ufmjb+QqJJcVyEODMfzubVV/HB/6wSgcaqhY3uAhjNsqi7RHwoVwlNxpdOGk+amW+S
 GT78wOMGL7jLIrUPs18doLKweOU0US6tH8Ji32rj/isFruncWw8Bx9sV50QhEJ94RWys
 oFxFPtnPKGOofA5dbdpgFnxkuATZscvvuhheK8SLUJJjQ+2bWF6A1aXC0D7ALzbuLhqC
 ouTv3xrawszi4DgOAbHMCTRw8twtYnUIXZcWnggMLu4D+rTocm7YOOlicaP3fy2I3Gjx
 9Wmz2F6CVoeNQABjWebDHNIen6/gmPfogX/ucidawiY85ZvnuFGoeP3J8gjXWRWy8Ys1
 vt3A==
X-Gm-Message-State: AOAM531ULquIcsgQX59OXAxz5W9VPGAKL+/rlgviW096XM8I9WjQyGQ8
 95RS3hE+42EVOx0WYD8ryBZaXc5GE+PWhg==
X-Google-Smtp-Source: ABdhPJwb1aXusUw5e8AR5bWjBrzLFDM3G0tQ9AMvyxkuCzv2+Wqr0B6GEGMWO0QoakPTGo2FwUeNww==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr3884076wrn.99.1611918041334; 
 Fri, 29 Jan 2021 03:00:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/46] hw/timer/cmsdk-apb-dualtimer: Add Clock input
Date: Fri, 29 Jan 2021 10:59:55 +0000
Message-Id: <20210129110012.8660-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-9-peter.maydell@linaro.org
Message-id: 20210121190622.22000-9-peter.maydell@linaro.org
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


