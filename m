Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8186966286B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:25:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEska-0001ce-Ac; Mon, 09 Jan 2023 09:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskT-0001Zv-AF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:37 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskR-0006S0-JM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:37 -0500
Received: by mail-lj1-x229.google.com with SMTP id n5so8404417ljc.9
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmxG628TWZ0nrw6bA+Re1tjxcTyz6IlDL5hx2BveKgI=;
 b=zXJoS5bb9QdrB9PViEuE64yPBo4QFiUZvtjwHgNd3qvsoUCIgAySlRfJzAvdVnBll5
 4mRTSHEYHGLkKFSS2602pPE1iluJ594Cl0AsqDVvRlnIC/Wu87QS7o9c932AUmrMDAOp
 ABAXcpM2uLEJj6D93yr+pBO34CGTm/NpX2fLuPH4NMWjwf6GIHIulOd/V9IjmeYPb0ev
 pSKrUrNbgtHhTvxN+KOgtBrDqs/1Gt1UiZLQq+YorRCaozM4xuAJ3xFZpoX05v+m/ZI/
 /pqa+NkrT7uucGnBO48nh1ol8HoF5HmOMcXfeJPfRs/IylPlwY8iplGcBBh9P0RcHXq4
 mxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmxG628TWZ0nrw6bA+Re1tjxcTyz6IlDL5hx2BveKgI=;
 b=szt6drbqGASkwQICj4w2/3PrSmjYSKaqwq0ihsREyNYUpgSgxrRmf8FKxv47W2BiW1
 qU99GstzGNsSb/MkML3SbzWVySnExrVcjzN+HW+rewjmOBADxXWoMmyRC3BJGLmZQb6M
 Tr7tUbH4jgLFS4ymtX9SeX/DUP9o3V8Zx45NqzWuvqXI9U3STzpgj3tRKjw0Io/Kq1cm
 JYga0PwTRVhVu2Yg2W+GEE2e+StPKbbj7DXPvZeAWiJ1MXxqMXrcpdASGsB3JEspi1+T
 PfzLF5C3zL5tSLn5qE7ZZkEQOM0Fr0Aop+fgB3vEicMvK/YtakyxkCLNKjtFroKhR1xJ
 QUsQ==
X-Gm-Message-State: AFqh2krH4EcgZCI63iEeeKn9rvDLT75sfMLJIHMeN+W+u7oJFbipRV0J
 N0lsqrTMV9WY9K8ISmwKxhR4Zg0ER5b0qMdv
X-Google-Smtp-Source: AMrXdXu/zDpIv0WWnIqDVts28cEOioVkpF0azYvCtkPyQv6YY/R5/n64X19knwC+EMs8iRZfSZWdAQ==
X-Received: by 2002:a2e:b0da:0:b0:27f:dca1:8587 with SMTP id
 g26-20020a2eb0da000000b0027fdca18587mr9225729ljl.36.1673273013584; 
 Mon, 09 Jan 2023 06:03:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003c701c12a17sm15363599wmp.12.2023.01.09.06.03.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 05/14] hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO
 type name
Date: Mon,  9 Jan 2023 15:02:57 +0100
Message-Id: <20230109140306.23161-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
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

Following docs/devel/style.rst guidelines, rename omap2_gpif_s ->
Omap2GpioState. This also remove a use of 'struct' in the
DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/omap_gpio.c   | 20 ++++++++++----------
 include/hw/arm/omap.h |  9 ++++-----
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 23502315ea..a3341d70f1 100644
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
 
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 29d2ed7e3b..9e30ba7ba2 100644
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
-- 
2.38.1


