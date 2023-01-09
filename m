Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69756662869
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEskS-0001Yq-7O; Mon, 09 Jan 2023 09:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskP-0001Xw-Cz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:33 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskM-0006R5-MU
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:33 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bn26so8289396wrb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EffXhNSRUGOU0srNkRxQZt0hvLak4UD63gjuSTSSMgQ=;
 b=Ehr3gtxN0uzv/+8Nne6IYdTv2H0LQ5//9I48FoSexbuVkXlPgmp71/L7C0WIG8Y8DH
 PVqmpHiVywdS0HJCgC49cOJnyna18RVJKoQW9MC/vd8ELMwDWoAOHhiwc5gALIW1MQwQ
 D1MCTFlFJlyHJo16LynbrrAus3hRYoYLCmJsgkujaLf5TU6+u1n1PGfRVUs3X65WLCxQ
 nzwu8n41WC6+rWe+bg/VOy6P1orkY4B+E4fjsz8AeiGzqSGa7/X1qo0tJ5S4oIJJBn6X
 IsX7evA0B1U4vN1RpDv5c1ooEOzZwDHIB/3KAhPnzqzXrH/eXJHHtu+80llfOg0b++uQ
 Sp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EffXhNSRUGOU0srNkRxQZt0hvLak4UD63gjuSTSSMgQ=;
 b=MG17E+IILI5X9Py5yHLrgpYee/K+SDcOFHW8fzAMKcpndrG5VHuV/caWPxne0i4hn+
 KH7pKlx96TfdXCBeZTbatjN0TXFmviKigI/cqt9wewJzfik//ilTqrb2ILbRdl94DNqr
 o8PCzIKL5Ji9nViu/XDCWo626eKiH2uSHCmzBgJV86jUh9CdCcHBsvwzregrc0RXsB/l
 dQ/+5CBp1DtMYt1qKATotUJhLtc6IGsLtrxLGeMQniXLgznCuyReJzseWCotCnqnG44C
 YsnVvrrt/C58ii5/Wip1NoLBRPNm+FJsuLQih8d0vCzPgxFe4D6sgX9AtIBautwIvxNa
 cHGA==
X-Gm-Message-State: AFqh2krAYAprbVn8v5GpQOxLrgyYIKoSi8HDgjvPdpYoxWe1LOXX8u4q
 Akk+H2pv1hjWe109qBP4qRMdAelxkmqmKcU6
X-Google-Smtp-Source: AMrXdXvVCyshJxS2JX/1Fz6BenjQzHi9fgMT199pmSJbin9GYb2fLGaYw7nDDaBjAQExQYCB1AgC2A==
X-Received: by 2002:a5d:6145:0:b0:2bb:6b92:d4cc with SMTP id
 y5-20020a5d6145000000b002bb6b92d4ccmr5386600wrt.53.1673273008808; 
 Mon, 09 Jan 2023 06:03:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b0027cb20605e3sm8529416wrk.105.2023.01.09.06.03.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 04/14] hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP1_GPIO
 type name
Date: Mon,  9 Jan 2023 15:02:56 +0100
Message-Id: <20230109140306.23161-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Following docs/devel/style.rst guidelines, rename omap_gpif_s ->
Omap1GpioState. This also remove a use of 'struct' in the
DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/omap_gpio.c   | 16 ++++++++--------
 include/hw/arm/omap.h |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index b3cb3499bd..23502315ea 100644
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
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index ff6a173f8a..29d2ed7e3b 100644
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
-- 
2.38.1


