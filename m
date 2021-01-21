Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D982FF436
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:20:48 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fVf-0005dj-6v
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIU-0002W7-3X
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:10 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI5-0005un-1C
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so2405099wmm.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+C2gTVos115dMvtdyIN+AXfuTec5f/EcGemGRxkJo4=;
 b=vadlG+WXak4otfF4yCJv1/Wzh3To5b4qBkBVhGiDSjUUjQPxo26gOMK5vZlnQx1+Lt
 ygQahyaanc9Lpp9w0bzOZlY72EhPksbX0QihXx56BkbSIr69F4lcu4spWMqzuvz56DT9
 dOEK44cS008YLgKf/yyToiZNtUw94biV3bhXiLmXjPrwKclFrWD1t2KDG5zuRVcEUzdP
 /w+J54TtldYuFV+eC0px/EzWGKLxAka/iSLL3uvbO0Dw7vozAxbc9SZoeaQXZkfTZxp0
 KCfzfd4fL9ZKo4r9SCl8w72KpDVqexQTLej5NbLlVzrm0miJ2eUpqmEb7xXSk83hsGI0
 jdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l+C2gTVos115dMvtdyIN+AXfuTec5f/EcGemGRxkJo4=;
 b=Iq8JQFOc6Z6k8OthwZ30x3RZ/sR0YI6bJ7VG8AmKTSDRpRDvCfPkFrukl6rFlr7HBq
 h/UksGj5Dniadks+jAS0Rds6CW/u8Y9LmOTTzf+hKBHCdvGVy3FYYlA5ZEb7ObnhSgPD
 saCjbYFz19FQ4btWnlvSa1VCU+GTirmYfJqW0PNy7YrvMzTDPD4KrUQNMH663lO4zId5
 sXACerijp+dElyleF7EzXeAgEfphBrwDXUxDk0N7iEQz0HZMDCU51AjfY775DNO05SlJ
 cNH9MW1CDoDVg86lY0RdYGgqL+w9LAkbBhTrcE+FRygH/rwmafj69swrETbaqzNPmpPg
 DBGQ==
X-Gm-Message-State: AOAM5324FZWYL82/hw24FdpjL9Vc2lr5TTMgL/BaxaPx1O7znYHkMTgZ
 mlXVWQkWYRn4v+oDCNyTUL81Yg==
X-Google-Smtp-Source: ABdhPJyK8BwPSgUR5vPlUddZ/7vtlYLLnQIYDqXqDtm8ylLI7NhNZcrjAxsukr+geINN9p4FR+wlcA==
X-Received: by 2002:a1c:9609:: with SMTP id y9mr703365wmd.75.1611256003595;
 Thu, 21 Jan 2021 11:06:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock input
Date: Thu, 21 Jan 2021 19:06:16 +0000
Message-Id: <20210121190622.22000-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Switch the CMSDK APB dualtimer device over to using its Clock input;
the pclk-frq property is now ignored.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


