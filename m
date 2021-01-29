Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395ED308844
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:29:52 +0100 (CET)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RyJ-0001E4-9O
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWN-00058Q-8j
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWG-000793-50
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:58 -0500
Received: by mail-wm1-x334.google.com with SMTP id c127so6805307wmf.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fpGogSc9aL2sME+0A8VE5mo8u7gQQt71nHO/RA4JCro=;
 b=OjTC12AN6aCjWuIdtFNz9doEDsgnhj4L6GRXUSzZZ7fN6kbUGz78IRpMt99THC5q9T
 t8oD2QHB9KnS/r9Vr3pluxZbSKyQmRVrkmmhV+q6/bP8K6QGDJ4uEv3xwRnsU+Q4EHUp
 oGY+V+ZHKILONA4El+2tm6gcqOFJ8X/7c6iaetLFk+KII6ii0GduEU3dIESr531g5eBm
 Wos6mt1euVPjxcTL0gHv8GJ4hkjQQzrjX+kw/ZHcaGPeaNnCQNiPAkVFduZWMiILtA03
 FwAvZa+arTvcMFYd95xjkX/ZJNAhptDUHaI8/MRs0OGaugYmzxLpMndMuf3E5njb7aGO
 iMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fpGogSc9aL2sME+0A8VE5mo8u7gQQt71nHO/RA4JCro=;
 b=tsj4VLTKh51JyDXnLfFXn39dJDuLpX7r5lGGRdl5gY6RN8AKsV5qmqkyUk9eM8QWhd
 zjfKU6WFY0rfeT5iWU8I7ETkuZdpQGOfSaYIck+q6juox+Np+eUePNnNHeYxOjaV4bhE
 av8sQN4sEtvKEctGavH62H3utUODPPp0yUsVVrmJdWoBYSlyIX42iEPmFCE/qHaF18EW
 MH/Y2+ujePINDEMH4KFAohWzCACOTGmjDSMS3Vg+sT7taFv6T0JPF83XfwRXUWxmQ2xB
 i+KXVf9rbB2HeDKy1wcZHgGoRck7csZugBmuanyHDwAGnxtHz3/7mRM+5D/f3r+eLCmd
 h6OQ==
X-Gm-Message-State: AOAM532zS4TlJvv+cFUyVCL7y1OdzxpqDhPl+kTJEcidm1TX8HWrokX5
 f08bCUmsbVlYw2CNL11sTDI/DsvmQJ8fmw==
X-Google-Smtp-Source: ABdhPJys8QNNxB6THYo+u6ffEt4Lg/hY/Rr0Tes+AwVpV09lrmtj+fRYD59xoQHDxloPjatPbqcLfw==
X-Received: by 2002:a7b:c854:: with SMTP id c20mr3178628wml.127.1611918050633; 
 Fri, 29 Jan 2021 03:00:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/46] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock input
Date: Fri, 29 Jan 2021 11:00:06 +0000
Message-Id: <20210129110012.8660-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Switch the CMSDK APB dualtimer device over to using its Clock input;
the pclk-frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-20-peter.maydell@linaro.org
Message-id: 20210121190622.22000-20-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index 781b496037b..828127b366f 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -106,6 +106,22 @@ static void cmsdk_apb_dualtimer_update(CMSDKAPBDualTimer *s)
     qemu_set_irq(s->timerintc, timintc);
 }
 
+static int cmsdk_dualtimermod_divisor(CMSDKAPBDualTimerModule *m)
+{
+    /* Return the divisor set by the current CONTROL.PRESCALE value */
+    switch (FIELD_EX32(m->control, CONTROL, PRESCALE)) {
+    case 0:
+        return 1;
+    case 1:
+        return 16;
+    case 2:
+    case 3: /* UNDEFINED, we treat like 2 (and complained when it was set) */
+        return 256;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
                                              uint32_t newctrl)
 {
@@ -146,7 +162,7 @@ static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
         default:
             g_assert_not_reached();
         }
-        ptimer_set_freq(m->timer, m->parent->pclk_frq / divisor);
+        ptimer_set_period_from_clock(m->timer, m->parent->timclk, divisor);
     }
 
     if (changed & R_CONTROL_MODE_MASK) {
@@ -414,7 +430,8 @@ static void cmsdk_dualtimermod_reset(CMSDKAPBDualTimerModule *m)
      * limit must both be set to 0xffff, so we wrap at 16 bits.
      */
     ptimer_set_limit(m->timer, 0xffff, 1);
-    ptimer_set_freq(m->timer, m->parent->pclk_frq);
+    ptimer_set_period_from_clock(m->timer, m->parent->timclk,
+                                 cmsdk_dualtimermod_divisor(m));
     ptimer_transaction_commit(m->timer);
 }
 
@@ -432,6 +449,20 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)
     s->timeritop = 0;
 }
 
+static void cmsdk_apb_dualtimer_clk_update(void *opaque)
+{
+    CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(opaque);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
+        CMSDKAPBDualTimerModule *m = &s->timermod[i];
+        ptimer_transaction_begin(m->timer);
+        ptimer_set_period_from_clock(m->timer, m->parent->timclk,
+                                     cmsdk_dualtimermod_divisor(m));
+        ptimer_transaction_commit(m->timer);
+    }
+}
+
 static void cmsdk_apb_dualtimer_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -446,7 +477,8 @@ static void cmsdk_apb_dualtimer_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
         sysbus_init_irq(sbd, &s->timermod[i].timerint);
     }
-    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK", NULL, NULL);
+    s->timclk = qdev_init_clock_in(DEVICE(s), "TIMCLK",
+                                   cmsdk_apb_dualtimer_clk_update, s);
 }
 
 static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
@@ -454,8 +486,8 @@ static void cmsdk_apb_dualtimer_realize(DeviceState *dev, Error **errp)
     CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(dev);
     int i;
 
-    if (s->pclk_frq == 0) {
-        error_setg(errp, "CMSDK APB timer: pclk-frq property must be set");
+    if (!clock_has_source(s->timclk)) {
+        error_setg(errp, "CMSDK APB dualtimer: TIMCLK clock must be connected");
         return;
     }
 
-- 
2.20.1


