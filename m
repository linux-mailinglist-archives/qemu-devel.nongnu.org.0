Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD70669B83
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:12:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnE-00019U-11; Fri, 13 Jan 2023 09:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmk-00012U-Hl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003pI-97
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id q8so3554798wmo.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3D9zRpW1XncySFFXDnMUdsKdKAAUfwzl78yy6shZZgY=;
 b=rhCRmtO6AACdw4Xy7MlGcRusMq8SQynpcR0Rx7JB7VrwQrp1Syb+KouBNY5mG2dUXE
 Cy8uHiQLxNqER23EjzglSKjPw3zfSDnuMOYl0AJcG+KaJ/tnuwDaXHqYCjzbzI8LN8/u
 VJ3saUkaI3qLX+tDgKiG/Ysv5rloarR3t2YJTg2OVCaT7tVhsJ8u2By2i2UDolOmHkXX
 MDF+XGzmr1+gGqIMU6O5z6phSssMFEFpBJYHr/797C7bogDcmMFcwskAjKMgdOw7Im20
 IVWrGBRTsLlBIxj0+VrPuYVvtcwPPGmfyCwalumzvaPs+Psoof3KBTpxITu8uMrm6Qk6
 gmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3D9zRpW1XncySFFXDnMUdsKdKAAUfwzl78yy6shZZgY=;
 b=EMQeYCNjAfYka+bU78Q5agieE54HsQBw6iyAFskzL/k9n6jL9zZh3SviTlMPKxXFpl
 GN8BdWAYnagwHFeKSBFgozAfGGmdorV6mii+M3uJTjsXvHPtNws1ps878AZL2oEo6w/R
 ZqXA545IcC6C8FyuBGAPUAbRIfGc84tnV7zUuPV0KK0OIxcfwGE/iUB9N6YMGasDDPGO
 xjiyDV/PVruTzBaar/y2yPvjhQF6jDFsPi9FfzcxwpEbxu/fPi43rInshBD+NOFnqBVO
 FJs/O/fMSzKt/0j0UKDsV8/M9ynqi4MhwqgR5qBsKZfP9NFUMxhMdJ/mXQNVx0pisIdY
 2pEg==
X-Gm-Message-State: AFqh2kpzV2f6LFkmmedw8ZWwm9YO6HAmgPWJuxVvwwsZT+88rxCdlcXq
 CTNNU4TnA+jnkpGJKCEtb6c24+62MURgNbAh
X-Google-Smtp-Source: AMrXdXtkSEQgcUUjNh7TBImTrVPPuqnuQVFaQMYb3zWQNX9uwdw7Vy9gWx56bL2jyVKJ+CqGM7seOQ==
X-Received: by 2002:a05:600c:4f41:b0:3d9:f806:2f89 with SMTP id
 m1-20020a05600c4f4100b003d9f8062f89mr11110984wmq.41.1673619112839; 
 Fri, 13 Jan 2023 06:11:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/38] hw/intc/omap_intc: Use CamelCase for TYPE_OMAP_INTC type
 name
Date: Fri, 13 Jan 2023 14:11:17 +0000
Message-Id: <20230113141126.535646-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Following docs/devel/style.rst guidelines, rename
omap_intr_handler_s -> OMAPIntcState. This also remove a
use of 'struct' in the DECLARE_INSTANCE_CHECKER() macro call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-7-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/omap.h |  9 ++++-----
 hw/intc/omap_intc.c   | 38 +++++++++++++++++++-------------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 9e30ba7ba24..c275d9b681c 100644
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
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 9f6a71ce305..647bf324a8e 100644
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
 
-- 
2.34.1


