Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B6B669AB5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:40:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnL-0001Zh-H0; Fri, 13 Jan 2023 09:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmo-000159-Mb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmi-0003dl-P0
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so14041838wma.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LxSkHZn6MbhceHe34cyd3tpq2bJIskFKLNFL7qC4I0w=;
 b=VHJdCBhMJmNqrVDoAVdpneyeI/Kh2SYQicGLQrNneJTnNWF1ar6Y0LgaqGCWd46AAZ
 95QYklDJEZNp2qto9duFCxey0mq+ubquZojP4SjyDLrwrdNsJuW4qLa5DcaRovzj1IOU
 Jy1ocNNeK14N3MGc6t6jZFoNju1clp+jRkpuk4P06inSFH3xzeG8pMbk3O3+/gkSaPAl
 Fmo4LfYENWn2Ujapit75gjbv0A/UDpBeyUlG6YBRIJSuAU/cpyfU10uUKaC/xCjQhcNW
 ygwytFVEv2Y5PqiFchGOaM5zn+sfHV3bRcIsjnYrtw3Z59B+bRvMjoZ06MI6mh0ctmbL
 1Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxSkHZn6MbhceHe34cyd3tpq2bJIskFKLNFL7qC4I0w=;
 b=E5o0JlphDBucQE9+KVUDeB11ZLQmt6Q8T7UHtaBCKrZQwjQrzUyfzVRcqeOAMDZBqS
 YALMNcrVwj2B29RfhyrHegIdXdWfpVhiU4wIeLEfPsgP1yXGhRe6cCjJGioUuoTsQrSs
 wKbE8gQ7HsHUeA+dn3n7tUtkic06K90bSeYqLPofTjYtscHVUWv5+cBNh2/O7EW2adQI
 WYc87U4Y79gDXfhBL0r3IScCeWgLSW7OZ8LVKogaR9+Gh2ekwkvq8GYNsS1DodvDGqlg
 SGJQgp+Jv9rX1K0Gnu1BWypC8pRLHJR6KANqjrPS9WXLxqTOxiLWnp81nn18nwJAa5v4
 zIdg==
X-Gm-Message-State: AFqh2kpLFXZ2pMcSk+pPSjUJehBlw+hqcqnx7jkDfiXH0yUeQDpp0GFR
 v8eIxnrPX3cLVhOSgy47PDln/jw1F7r9SmRv
X-Google-Smtp-Source: AMrXdXvs3iF1txbF8ADPnKU+SjwLjUZvD7YD6JxcHHOzpz1rHNZrYIkfTDHfrh/ZD1E2V3MVjJO0FA==
X-Received: by 2002:a05:600c:4f84:b0:3d9:f758:e280 with SMTP id
 n4-20020a05600c4f8400b003d9f758e280mr12742961wmq.24.1673619111192; 
 Fri, 13 Jan 2023 06:11:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/38] hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP1_GPIO
 type name
Date: Fri, 13 Jan 2023 14:11:15 +0000
Message-Id: <20230113141126.535646-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Following docs/devel/style.rst guidelines, rename omap_gpif_s ->
Omap1GpioState. This also remove a use of 'struct' in the
DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-5-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  6 +++---
 hw/gpio/omap_gpio.c   | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index ff6a173f8a6..29d2ed7e3be 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -103,18 +103,18 @@ void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
 
 /* omap_gpio.c */
 #define TYPE_OMAP1_GPIO "omap-gpio"
-DECLARE_INSTANCE_CHECKER(struct omap_gpif_s, OMAP1_GPIO,
+typedef struct Omap1GpioState Omap1GpioState;
+DECLARE_INSTANCE_CHECKER(Omap1GpioState, OMAP1_GPIO,
                          TYPE_OMAP1_GPIO)
 
 #define TYPE_OMAP2_GPIO "omap2-gpio"
 DECLARE_INSTANCE_CHECKER(struct omap2_gpif_s, OMAP2_GPIO,
                          TYPE_OMAP2_GPIO)
 
-typedef struct omap_gpif_s omap_gpif;
 typedef struct omap2_gpif_s omap2_gpif;
 
 /* TODO: clock framework (see above) */
-void omap_gpio_set_clk(omap_gpif *gpio, omap_clk clk);
+void omap_gpio_set_clk(Omap1GpioState *gpio, omap_clk clk);
 
 void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk);
 void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk);
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index b3cb3499bd1..23502315ea5 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -41,7 +41,7 @@ struct omap_gpio_s {
     uint16_t pins;
 };
 
-struct omap_gpif_s {
+struct Omap1GpioState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -53,7 +53,7 @@ struct omap_gpif_s {
 /* General-Purpose I/O of OMAP1 */
 static void omap_gpio_set(void *opaque, int line, int level)
 {
-    struct omap_gpif_s *p = opaque;
+    Omap1GpioState *p = opaque;
     struct omap_gpio_s *s = &p->omap1;
     uint16_t prev = s->inputs;
 
@@ -594,7 +594,7 @@ static const MemoryRegionOps omap2_gpio_module_ops = {
 
 static void omap_gpif_reset(DeviceState *dev)
 {
-    struct omap_gpif_s *s = OMAP1_GPIO(dev);
+    Omap1GpioState *s = OMAP1_GPIO(dev);
 
     omap_gpio_reset(&s->omap1);
 }
@@ -677,7 +677,7 @@ static const MemoryRegionOps omap2_gpif_top_ops = {
 static void omap_gpio_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    struct omap_gpif_s *s = OMAP1_GPIO(obj);
+    Omap1GpioState *s = OMAP1_GPIO(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     qdev_init_gpio_in(dev, omap_gpio_set, 16);
@@ -690,7 +690,7 @@ static void omap_gpio_init(Object *obj)
 
 static void omap_gpio_realize(DeviceState *dev, Error **errp)
 {
-    struct omap_gpif_s *s = OMAP1_GPIO(dev);
+    Omap1GpioState *s = OMAP1_GPIO(dev);
 
     if (!s->clk) {
         error_setg(errp, "omap-gpio: clk not connected");
@@ -742,13 +742,13 @@ static void omap2_gpio_realize(DeviceState *dev, Error **errp)
     }
 }
 
-void omap_gpio_set_clk(omap_gpif *gpio, omap_clk clk)
+void omap_gpio_set_clk(Omap1GpioState *gpio, omap_clk clk)
 {
     gpio->clk = clk;
 }
 
 static Property omap_gpio_properties[] = {
-    DEFINE_PROP_INT32("mpu_model", struct omap_gpif_s, mpu_model, 0),
+    DEFINE_PROP_INT32("mpu_model", Omap1GpioState, mpu_model, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -766,7 +766,7 @@ static void omap_gpio_class_init(ObjectClass *klass, void *data)
 static const TypeInfo omap_gpio_info = {
     .name          = TYPE_OMAP1_GPIO,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct omap_gpif_s),
+    .instance_size = sizeof(Omap1GpioState),
     .instance_init = omap_gpio_init,
     .class_init    = omap_gpio_class_init,
 };
-- 
2.34.1


