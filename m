Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363D338F95
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:14:05 +0100 (CET)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiYG-0007Fg-JZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDA-00033S-Mh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:17 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCw-000210-Ki
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id l19so3852012wmh.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GwOmEemmUdwGYflw2qwwmpf+T5+ccI6AHjbI3MF2seE=;
 b=FnS1t3n/IQjaIuM+quV1OeHjoraqSlTj6uafQ59DfgGSwsPgmoZy/E4gliI89Rkttq
 GIEvtJ9oM1yn/abrlXOczR0PiDrPt0s1USneg18ckJewCKCUuUX5+FRr4Zz11riWKSDF
 VdmxlmsMaCjl0QTD059mzildqdwOz6L4EV9LjFTqD/WxgGC1Dosb0wqTr3hxyNt4P9zc
 Aue8A9EUrMg8h3ebKuvZcXYoThAxp7Di8eaeW695zaWvJQjY6zIVO0+eGvoFLLuwGxWl
 1Z9O2smm6u7VNv1JHCipDfBityCsEsj2+mIVjdEvUQAH/P0UwneqGNUvida2vCgVfOo6
 xjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwOmEemmUdwGYflw2qwwmpf+T5+ccI6AHjbI3MF2seE=;
 b=MRLlILqH82/GzN+J/0QjJsRvnNrMXEDNJo6hgamwJzoWn99NJxte1KAwfsdk3svwB+
 sPFji3O/2X9Pm3tPyUeSwNYqkR9bQBXygk9KI4LHO1jj8hkvRIix7QWT+tM5fAbIv37R
 v92kpfMJJvWb2ESL4+HcLrwLeGMS4fW+NWG3qHOPQbYyUPiHogpH2zhpNv22OO4+yFSi
 QYh0PCaMAW2AhDXpMVAyZ7syOe6Ioj3a8H1Enm0Qrzhb/dsPE5J7PB2HyNCBwQO4BShK
 xFTaYnr5hOJpHcKFSPPRYdyR3flzlF5LgHbWch2kq43hS9YJP1oHyxnkLAaqQF/bQsz5
 ichg==
X-Gm-Message-State: AOAM533l0bQB03MsBXWSL90KPNzIKxE72cziSIHDyB7cCOeoGsVMn8lD
 THY7tTJDToWThyY+276FL00WJgfaTL3ZkWfQ
X-Google-Smtp-Source: ABdhPJxRm6/Xtv0OXmGEngnab8IXdu1qrR09bSXjl10+Qhqo+AMt646wYkj5WIwdbJzsVv8rXi1kRA==
X-Received: by 2002:a1c:b48a:: with SMTP id
 d132mr12850948wmf.108.1615557120363; 
 Fri, 12 Mar 2021 05:52:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/39] hw/misc: Add GPIOs for duty in NPCM7xx PWM
Date: Fri, 12 Mar 2021 13:51:27 +0000
Message-Id: <20210312135140.1099-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Hao Wu <wuhaotsh@google.com>

This patch adds GPIOs in NPCM7xx PWM module for its duty values.
The purpose of this is to connect it to the MFT module to provide
an input for measuring a PWM fan's RPM. Each PWM module has
NPCM7XX_PWM_PER_MODULE of GPIOs, each one corresponds to
one PWM instance and can connect to multiple fan instances in MFT.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210311180855.149764-2-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/npcm7xx_pwm.h | 4 +++-
 hw/misc/npcm7xx_pwm.c         | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index 5a689d3f669..7ad632a93a1 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -77,6 +77,7 @@ typedef struct NPCM7xxPWM {
  * @iomem: Memory region through which registers are accessed.
  * @clock: The PWM clock.
  * @pwm: The PWM channels owned by this module.
+ * @duty_gpio_out: The duty cycle of each PWM channels as a output GPIO.
  * @ppr: The prescaler register.
  * @csr: The clock selector register.
  * @pcr: The control register.
@@ -89,7 +90,8 @@ struct NPCM7xxPWMState {
     MemoryRegion iomem;
 
     Clock       *clock;
-    NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];
+    NPCM7xxPWM  pwm[NPCM7XX_PWM_PER_MODULE];
+    qemu_irq    duty_gpio_out[NPCM7XX_PWM_PER_MODULE];
 
     uint32_t    ppr;
     uint32_t    csr;
diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
index ce192bb2741..2be5bd25c6c 100644
--- a/hw/misc/npcm7xx_pwm.c
+++ b/hw/misc/npcm7xx_pwm.c
@@ -139,6 +139,7 @@ static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)
         trace_npcm7xx_pwm_update_duty(DEVICE(p->module)->canonical_path,
                                       p->index, p->duty, duty);
         p->duty = duty;
+        qemu_set_irq(p->module->duty_gpio_out[p->index], p->duty);
     }
 }
 
@@ -483,6 +484,7 @@ static void npcm7xx_pwm_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
 
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->pwm) != NPCM7XX_PWM_PER_MODULE);
     for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
         NPCM7xxPWM *p = &s->pwm[i];
         p->module = s;
@@ -501,6 +503,8 @@ static void npcm7xx_pwm_init(Object *obj)
         object_property_add_uint32_ptr(obj, "duty[*]",
                 &s->pwm[i].duty, OBJ_PROP_FLAG_READ);
     }
+    qdev_init_gpio_out_named(DEVICE(s), s->duty_gpio_out,
+                             "duty-gpio-out", NPCM7XX_PWM_PER_MODULE);
 }
 
 static const VMStateDescription vmstate_npcm7xx_pwm = {
-- 
2.20.1


