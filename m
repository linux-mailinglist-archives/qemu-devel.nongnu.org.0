Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A51669B2D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnI-0001UR-5d; Fri, 13 Jan 2023 09:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKml-00012v-RX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003p7-8s
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so14041865wma.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WJ1ThggjatfCXo15B2y0aj5bS7HJIrmU1S8g9Lpjo5s=;
 b=o9spxJVxdnIAuLjl0Slpol8qx1XwC2mnrmDZRPjnPMBJ/kiYuGs44dJIhTJVINMwso
 RzR++i+ueDbRJKlD1iU6yb7qynP+80PpAp9J1Q00rVqAB0VHoE8tUMIGL4FC2XYsn3qg
 GtmG1EtgpQwrVCz807MQtcs0tNTzdazwmejEiVQHG+w1Lv/1cYIFD9WqlXG0Hgek87h4
 HAEWhk6itD38g+ZJHH1zBgMBc045sYblW/1mPICc8iILkD1vt8su9Kq5MXHEcYRMfSMH
 rZqDZN8pBthl9clFCYm+M7KkNnw9tJJb1TGKFL3FpR0iyfo+e7z8M38CQFMUog1GPrGo
 +EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJ1ThggjatfCXo15B2y0aj5bS7HJIrmU1S8g9Lpjo5s=;
 b=ZJQBL+Y2oS8lAo7BLjCqjVZlpz8DpaUF7IVrBv2xMC2CWCEy/sTFQPFgr0GiE8KpFt
 pLKz/ewPgFJ/H+5NHWKtwZeBEmUFG5Nayqx2LADskB04PvzXv4qHwiG5VeoyYyLsKptu
 abYVJxEh4tKQ7+rWz1HaxW+00PLFSb+VYlAheX6GDEk4BQ30XRsoK0ALZQx/9I3kJ6Sy
 pSsvVtFAM1caSu7ZH9bo+73vj6lunIQo+EWs5mLRsS7Bkj93td7mKk3siLObRaqDs5nL
 25wtGHEIA0xIu+oLmxhiVvFNgUent2XqtDmC5TEtAs8N6A1cRGhd61gGEUXw/xQ+HwDL
 5e2g==
X-Gm-Message-State: AFqh2kor2BGx2YKYp4lEclhtbU0ZfZEI9WUqxvKxGTFLgkYCffOTLf21
 tG8pEVyBaxQQfLhYNmDYNUQjqq1PWPoOhKri
X-Google-Smtp-Source: AMrXdXtOvM+SyJUzqc2KB002BeV1Ep/7oahFFhZ74xJlMNtU9BiKKGNHuHU569JX7A/0YJqNXMcSFw==
X-Received: by 2002:a05:600c:35d6:b0:3da:17f5:57b9 with SMTP id
 r22-20020a05600c35d600b003da17f557b9mr4622479wmq.5.1673619112087; 
 Fri, 13 Jan 2023 06:11:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/38] hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO
 type name
Date: Fri, 13 Jan 2023 14:11:16 +0000
Message-Id: <20230113141126.535646-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
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
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Following docs/devel/style.rst guidelines, rename omap2_gpif_s ->
Omap2GpioState. This also remove a use of 'struct' in the
DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-6-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  9 ++++-----
 hw/gpio/omap_gpio.c   | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 29d2ed7e3be..9e30ba7ba24 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -108,16 +108,15 @@ DECLARE_INSTANCE_CHECKER(Omap1GpioState, OMAP1_GPIO,
                          TYPE_OMAP1_GPIO)
 
 #define TYPE_OMAP2_GPIO "omap2-gpio"
-DECLARE_INSTANCE_CHECKER(struct omap2_gpif_s, OMAP2_GPIO,
+typedef struct Omap2GpioState Omap2GpioState;
+DECLARE_INSTANCE_CHECKER(Omap2GpioState, OMAP2_GPIO,
                          TYPE_OMAP2_GPIO)
 
-typedef struct omap2_gpif_s omap2_gpif;
-
 /* TODO: clock framework (see above) */
 void omap_gpio_set_clk(Omap1GpioState *gpio, omap_clk clk);
 
-void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk);
-void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk);
+void omap2_gpio_set_iclk(Omap2GpioState *gpio, omap_clk clk);
+void omap2_gpio_set_fclk(Omap2GpioState *gpio, uint8_t i, omap_clk clk);
 
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 23502315ea5..a3341d70f16 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -210,7 +210,7 @@ struct omap2_gpio_s {
     uint8_t delay;
 };
 
-struct omap2_gpif_s {
+struct Omap2GpioState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -274,7 +274,7 @@ static inline void omap2_gpio_module_int(struct omap2_gpio_s *s, int line)
 
 static void omap2_gpio_set(void *opaque, int line, int level)
 {
-    struct omap2_gpif_s *p = opaque;
+    Omap2GpioState *p = opaque;
     struct omap2_gpio_s *s = &p->modules[line >> 5];
 
     line &= 31;
@@ -601,7 +601,7 @@ static void omap_gpif_reset(DeviceState *dev)
 
 static void omap2_gpif_reset(DeviceState *dev)
 {
-    struct omap2_gpif_s *s = OMAP2_GPIO(dev);
+    Omap2GpioState *s = OMAP2_GPIO(dev);
     int i;
 
     for (i = 0; i < s->modulecount; i++) {
@@ -613,7 +613,7 @@ static void omap2_gpif_reset(DeviceState *dev)
 
 static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr, unsigned size)
 {
-    struct omap2_gpif_s *s = opaque;
+    Omap2GpioState *s = opaque;
 
     switch (addr) {
     case 0x00:	/* IPGENERICOCPSPL_REVISION */
@@ -642,7 +642,7 @@ static uint64_t omap2_gpif_top_read(void *opaque, hwaddr addr, unsigned size)
 static void omap2_gpif_top_write(void *opaque, hwaddr addr,
                                  uint64_t value, unsigned size)
 {
-    struct omap2_gpif_s *s = opaque;
+    Omap2GpioState *s = opaque;
 
     switch (addr) {
     case 0x00:	/* IPGENERICOCPSPL_REVISION */
@@ -699,7 +699,7 @@ static void omap_gpio_realize(DeviceState *dev, Error **errp)
 
 static void omap2_gpio_realize(DeviceState *dev, Error **errp)
 {
-    struct omap2_gpif_s *s = OMAP2_GPIO(dev);
+    Omap2GpioState *s = OMAP2_GPIO(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
@@ -771,19 +771,19 @@ static const TypeInfo omap_gpio_info = {
     .class_init    = omap_gpio_class_init,
 };
 
-void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk)
+void omap2_gpio_set_iclk(Omap2GpioState *gpio, omap_clk clk)
 {
     gpio->iclk = clk;
 }
 
-void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk)
+void omap2_gpio_set_fclk(Omap2GpioState *gpio, uint8_t i, omap_clk clk)
 {
     assert(i <= 5);
     gpio->fclk[i] = clk;
 }
 
 static Property omap2_gpio_properties[] = {
-    DEFINE_PROP_INT32("mpu_model", struct omap2_gpif_s, mpu_model, 0),
+    DEFINE_PROP_INT32("mpu_model", Omap2GpioState, mpu_model, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -801,7 +801,7 @@ static void omap2_gpio_class_init(ObjectClass *klass, void *data)
 static const TypeInfo omap2_gpio_info = {
     .name          = TYPE_OMAP2_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct omap2_gpif_s),
+    .instance_size = sizeof(Omap2GpioState),
     .class_init    = omap2_gpio_class_init,
 };
 
-- 
2.34.1


