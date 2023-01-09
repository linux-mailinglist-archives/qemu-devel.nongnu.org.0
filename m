Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF0E662868
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:24:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEskd-0001es-Ae; Mon, 09 Jan 2023 09:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskb-0001e4-6y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:45 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskZ-0006T8-Aq
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6857897wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKcKRZWMYZ518k8vvIHwR+oXnEWBYEx606aR+Fxgswo=;
 b=iyXgNVNMV9yy1qppPecBlR5t9gHB6ya4fXUxu/1mCjTTv/vh71qhUp8eX5FbLB2eyx
 dJOsVto2ylsU0H8PnbpTY6wyXTb+JAid+32ekzeLuW1Vhd5wA+EPavLlGLGF4HUSTM6U
 toKnHzNCthivWSHd6wZwgxBHwOiuKBb46qZ4N4vXJNg99HQXtQw+YUqckYZvQvItZuu4
 XiKHwJgxX50n5vozPF9fL+8DWd4Tz8vVcW3nmmNA8LI//H3Up+FGGxPJVxETZuJ6G7aZ
 BP4GWMnxadC8awdCks/ip04chdlEuXzWd5PMCilpxbZ84Fz43dsz7j6in20YFntj7fuq
 lHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKcKRZWMYZ518k8vvIHwR+oXnEWBYEx606aR+Fxgswo=;
 b=uu8aMFg2bethwbVJjPBOaGJKixKoP2IfIiLgEV1s6ANykhGJwQ/JjhGlS+NOFsKj6L
 zkvGFLShJXWDqLIJkm+RIwGka7T8uCOR+YgS3C2AbLzTueOXzzDaIwphxX77dhIlbcy7
 JbjXQU0d/F9gd+c+DcntywlEMVc8HkLiR+qW8wbaNLDsEzCkSrKZzkEhSGxm5hH5nTDj
 8cjyvdaOK8jG+tkKVOQbydv/tajzCBcaocrLUAAAQ31EV5wfhlqn4sfHd3+4Qv+UA8NB
 69msuaMRCGjYAIhhSHSNut3QBJn87SGhRNS8Gna1KWphdyp81Hfz7TY3B6B4oiOQcV5/
 Rcow==
X-Gm-Message-State: AFqh2koyg7iUVUd3+hP1XyaLDuB0syFKU/MiG4lLGPp2dKtGJx5wCosj
 H44jf4cDCo6Hll1SvDtwmvaJGYGJsDjLQWzH
X-Google-Smtp-Source: AMrXdXtcydxuVTqKGM1WvG+wcLcVoc245POXyGidIX3kH+8cheZQt7+7Y5Kpg7FqSFbqaTyI6lsnbA==
X-Received: by 2002:a05:600c:4e09:b0:3d4:5741:af9b with SMTP id
 b9-20020a05600c4e0900b003d45741af9bmr50151639wmq.0.1673273018544; 
 Mon, 09 Jan 2023 06:03:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b003d9d23ab449sm11965679wms.29.2023.01.09.06.03.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 06/14] hw/intc/omap_intc: Use CamelCase for TYPE_OMAP_INTC
 type name
Date: Mon,  9 Jan 2023 15:02:58 +0100
Message-Id: <20230109140306.23161-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Following docs/devel/style.rst guidelines, rename
omap_intr_handler_s -> OMAPIntcState. This also remove a
use of 'struct' in the DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/omap_intc.c   | 38 +++++++++++++++++++-------------------
 include/hw/arm/omap.h |  9 ++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 9f6a71ce30..647bf324a8 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -38,7 +38,7 @@ struct omap_intr_handler_bank_s {
     unsigned char priority[32];
 };
 
-struct omap_intr_handler_s {
+struct OMAPIntcState {
     SysBusDevice parent_obj;
 
     qemu_irq *pins;
@@ -60,7 +60,7 @@ struct omap_intr_handler_s {
     struct omap_intr_handler_bank_s bank[3];
 };
 
-static void omap_inth_sir_update(struct omap_intr_handler_s *s, int is_fiq)
+static void omap_inth_sir_update(OMAPIntcState *s, int is_fiq)
 {
     int i, j, sir_intr, p_intr, p;
     uint32_t level;
@@ -88,7 +88,7 @@ static void omap_inth_sir_update(struct omap_intr_handler_s *s, int is_fiq)
     s->sir_intr[is_fiq] = sir_intr;
 }
 
-static inline void omap_inth_update(struct omap_intr_handler_s *s, int is_fiq)
+static inline void omap_inth_update(OMAPIntcState *s, int is_fiq)
 {
     int i;
     uint32_t has_intr = 0;
@@ -109,7 +109,7 @@ static inline void omap_inth_update(struct omap_intr_handler_s *s, int is_fiq)
 
 static void omap_set_intr(void *opaque, int irq, int req)
 {
-    struct omap_intr_handler_s *ih = opaque;
+    OMAPIntcState *ih = opaque;
     uint32_t rise;
 
     struct omap_intr_handler_bank_s *bank = &ih->bank[irq >> 5];
@@ -136,7 +136,7 @@ static void omap_set_intr(void *opaque, int irq, int req)
 /* Simplified version with no edge detection */
 static void omap_set_intr_noedge(void *opaque, int irq, int req)
 {
-    struct omap_intr_handler_s *ih = opaque;
+    OMAPIntcState *ih = opaque;
     uint32_t rise;
 
     struct omap_intr_handler_bank_s *bank = &ih->bank[irq >> 5];
@@ -156,7 +156,7 @@ static void omap_set_intr_noedge(void *opaque, int irq, int req)
 static uint64_t omap_inth_read(void *opaque, hwaddr addr,
                                unsigned size)
 {
-    struct omap_intr_handler_s *s = opaque;
+    OMAPIntcState *s = opaque;
     int i, offset = addr;
     int bank_no = offset >> 8;
     int line_no;
@@ -234,7 +234,7 @@ static uint64_t omap_inth_read(void *opaque, hwaddr addr,
 static void omap_inth_write(void *opaque, hwaddr addr,
                             uint64_t value, unsigned size)
 {
-    struct omap_intr_handler_s *s = opaque;
+    OMAPIntcState *s = opaque;
     int i, offset = addr;
     int bank_no = offset >> 8;
     struct omap_intr_handler_bank_s *bank = &s->bank[bank_no];
@@ -336,7 +336,7 @@ static const MemoryRegionOps omap_inth_mem_ops = {
 
 static void omap_inth_reset(DeviceState *dev)
 {
-    struct omap_intr_handler_s *s = OMAP_INTC(dev);
+    OMAPIntcState *s = OMAP_INTC(dev);
     int i;
 
     for (i = 0; i < s->nbanks; ++i){
@@ -366,7 +366,7 @@ static void omap_inth_reset(DeviceState *dev)
 static void omap_intc_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    struct omap_intr_handler_s *s = OMAP_INTC(obj);
+    OMAPIntcState *s = OMAP_INTC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->nbanks = 1;
@@ -380,25 +380,25 @@ static void omap_intc_init(Object *obj)
 
 static void omap_intc_realize(DeviceState *dev, Error **errp)
 {
-    struct omap_intr_handler_s *s = OMAP_INTC(dev);
+    OMAPIntcState *s = OMAP_INTC(dev);
 
     if (!s->iclk) {
         error_setg(errp, "omap-intc: clk not connected");
     }
 }
 
-void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk)
+void omap_intc_set_iclk(OMAPIntcState *intc, omap_clk clk)
 {
     intc->iclk = clk;
 }
 
-void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk)
+void omap_intc_set_fclk(OMAPIntcState *intc, omap_clk clk)
 {
     intc->fclk = clk;
 }
 
 static Property omap_intc_properties[] = {
-    DEFINE_PROP_UINT32("size", struct omap_intr_handler_s, size, 0x100),
+    DEFINE_PROP_UINT32("size", OMAPIntcState, size, 0x100),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -423,7 +423,7 @@ static const TypeInfo omap_intc_info = {
 static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
                                 unsigned size)
 {
-    struct omap_intr_handler_s *s = opaque;
+    OMAPIntcState *s = opaque;
     int offset = addr;
     int bank_no, line_no;
     struct omap_intr_handler_bank_s *bank = NULL;
@@ -504,7 +504,7 @@ static uint64_t omap2_inth_read(void *opaque, hwaddr addr,
 static void omap2_inth_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
-    struct omap_intr_handler_s *s = opaque;
+    OMAPIntcState *s = opaque;
     int offset = addr;
     int bank_no, line_no;
     struct omap_intr_handler_bank_s *bank = NULL;
@@ -622,7 +622,7 @@ static const MemoryRegionOps omap2_inth_mem_ops = {
 static void omap2_intc_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-    struct omap_intr_handler_s *s = OMAP_INTC(obj);
+    OMAPIntcState *s = OMAP_INTC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->level_only = 1;
@@ -637,7 +637,7 @@ static void omap2_intc_init(Object *obj)
 
 static void omap2_intc_realize(DeviceState *dev, Error **errp)
 {
-    struct omap_intr_handler_s *s = OMAP_INTC(dev);
+    OMAPIntcState *s = OMAP_INTC(dev);
 
     if (!s->iclk) {
         error_setg(errp, "omap2-intc: iclk not connected");
@@ -650,7 +650,7 @@ static void omap2_intc_realize(DeviceState *dev, Error **errp)
 }
 
 static Property omap2_intc_properties[] = {
-    DEFINE_PROP_UINT8("revision", struct omap_intr_handler_s,
+    DEFINE_PROP_UINT8("revision", OMAPIntcState,
     revision, 0x21),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -676,7 +676,7 @@ static const TypeInfo omap2_intc_info = {
 static const TypeInfo omap_intc_type_info = {
     .name          = TYPE_OMAP_INTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(omap_intr_handler),
+    .instance_size = sizeof(OMAPIntcState),
     .abstract      = true,
 };
 
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 9e30ba7ba2..c275d9b681 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -70,9 +70,8 @@ void omap_clk_reparent(omap_clk clk, omap_clk parent);
 
 /* omap_intc.c */
 #define TYPE_OMAP_INTC "common-omap-intc"
-typedef struct omap_intr_handler_s omap_intr_handler;
-DECLARE_INSTANCE_CHECKER(omap_intr_handler, OMAP_INTC,
-                         TYPE_OMAP_INTC)
+typedef struct OMAPIntcState OMAPIntcState;
+DECLARE_INSTANCE_CHECKER(OMAPIntcState, OMAP_INTC, TYPE_OMAP_INTC)
 
 
 /*
@@ -89,8 +88,8 @@ DECLARE_INSTANCE_CHECKER(omap_intr_handler, OMAP_INTC,
  * (ie the struct omap_mpu_state_s*) to do the clockname to pointer
  * translation.)
  */
-void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
-void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
+void omap_intc_set_iclk(OMAPIntcState *intc, omap_clk clk);
+void omap_intc_set_fclk(OMAPIntcState *intc, omap_clk clk);
 
 /* omap_i2c.c */
 #define TYPE_OMAP_I2C "omap_i2c"
-- 
2.38.1


