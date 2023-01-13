Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF88669C31
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnT-0001lm-0v; Fri, 13 Jan 2023 09:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKn2-0001GF-KD
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKml-0003gt-H9
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so15355767wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=utsTHAzpxt6XqjZGkDcmnI+U+lAeKY8OK38bR4joovo=;
 b=AqD1YCg6Defks4F9lToXx9gpkF2ypiT269JRhjqlrJA5F8tautfY96tkf/BCFXkQwx
 MjsYCjubDk+DhJFVTkqF96TYeNjzSesSvlqUMdC20qfAKQ951WDlQi+iKv3mfQjeJTlJ
 kt8MgMRAn39u5DSxEC452vHT3GgLazxJVBplsmXGhdVMro1kmvsqGRYEPHmXOcNNsshq
 fay4fHSiBuyTVp7cFVscg5yoQLrGeFSvXAUSvnG22sErRdNuED6jDF+yb48lCGTz1z+b
 0N9+bhKO5dpogA46Q2+QfMeeVJZ4vGtNO7gxg2sty/iwhvC9akDVvr0Ff4gXpN8+xpKl
 DgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=utsTHAzpxt6XqjZGkDcmnI+U+lAeKY8OK38bR4joovo=;
 b=gL1Z5KNu+Yc0MKLo2eVlQB5hapmoQHKiimklGgfqfFHl+nCerOmAGF8h8RI5X5CsQf
 P/K6XKI00GFiQ22cqSRK5/IzUMZryZ04zvlL5GGSCjbVJ8LNCWfy5p+W/J3JTBOn96rh
 tLxkaQcC8V1lm9ap16Y61asrUW0JHBl4HLr/Ea/xa+OQ+zP3dMiVV4Qk/GhQyompuBCd
 2vS1UwWDtBrRtVapkmF77Oyh+YHw38TolfDK39xObaS2EzEvsIu55oI2uRrYYjQR560j
 WCWsgoqwzsMpKzolQ3qldXLj78SxG9rLikGGHEoXjTmRprHgNWopvDOaDjvWzjBfnyM9
 /2Qg==
X-Gm-Message-State: AFqh2koymtxif4uOqXPj0OMMvukcZjGEQHyvVcCkYpMkC38RPJGk62ir
 4TEwHON4W1W98D1w6vllGAR3U34KKVKhkHjz
X-Google-Smtp-Source: AMrXdXtnDwlZEcgIj9lfU1NYIcu7CwS8Q3hIS1nemq3/MIQ+nMxz9w+MjvZ6ADbjTWrcbCT2tSG38w==
X-Received: by 2002:a05:600c:5014:b0:3d3:446a:b46a with SMTP id
 n20-20020a05600c501400b003d3446ab46amr61469047wmr.38.1673619118773; 
 Fri, 13 Jan 2023 06:11:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/38] hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of
 'struct xlx_pic'
Date: Fri, 13 Jan 2023 14:11:24 +0000
Message-Id: <20230113141126.535646-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

This remove a use of 'struct' in the DECLARE_INSTANCE_CHECKER()
macro call, to avoid after a QOM refactor:

  hw/intc/xilinx_intc.c:45:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Message-id: 20230109140306.23161-14-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/xilinx_intc.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 4c4397b3d2c..6e5012e66eb 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -42,10 +42,10 @@
 #define R_MAX       8
 
 #define TYPE_XILINX_INTC "xlnx.xps-intc"
-DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
-                         TYPE_XILINX_INTC)
+typedef struct XpsIntc XpsIntc;
+DECLARE_INSTANCE_CHECKER(XpsIntc, XILINX_INTC, TYPE_XILINX_INTC)
 
-struct xlx_pic
+struct XpsIntc
 {
     SysBusDevice parent_obj;
 
@@ -62,7 +62,7 @@ struct xlx_pic
     uint32_t irq_pin_state;
 };
 
-static void update_irq(struct xlx_pic *p)
+static void update_irq(XpsIntc *p)
 {
     uint32_t i;
 
@@ -87,10 +87,9 @@ static void update_irq(struct xlx_pic *p)
     qemu_set_irq(p->parent_irq, (p->regs[R_MER] & 1) && p->regs[R_IPR]);
 }
 
-static uint64_t
-pic_read(void *opaque, hwaddr addr, unsigned int size)
+static uint64_t pic_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    struct xlx_pic *p = opaque;
+    XpsIntc *p = opaque;
     uint32_t r = 0;
 
     addr >>= 2;
@@ -106,11 +105,10 @@ pic_read(void *opaque, hwaddr addr, unsigned int size)
     return r;
 }
 
-static void
-pic_write(void *opaque, hwaddr addr,
-          uint64_t val64, unsigned int size)
+static void pic_write(void *opaque, hwaddr addr,
+                      uint64_t val64, unsigned int size)
 {
-    struct xlx_pic *p = opaque;
+    XpsIntc *p = opaque;
     uint32_t value = val64;
 
     addr >>= 2;
@@ -154,7 +152,7 @@ static const MemoryRegionOps pic_ops = {
 
 static void irq_handler(void *opaque, int irq, int level)
 {
-    struct xlx_pic *p = opaque;
+    XpsIntc *p = opaque;
 
     /* edge triggered interrupt */
     if (p->c_kind_of_intr & (1 << irq) && p->regs[R_MER] & 2) {
@@ -168,7 +166,7 @@ static void irq_handler(void *opaque, int irq, int level)
 
 static void xilinx_intc_init(Object *obj)
 {
-    struct xlx_pic *p = XILINX_INTC(obj);
+    XpsIntc *p = XILINX_INTC(obj);
 
     qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
@@ -179,7 +177,7 @@ static void xilinx_intc_init(Object *obj)
 }
 
 static Property xilinx_intc_properties[] = {
-    DEFINE_PROP_UINT32("kind-of-intr", struct xlx_pic, c_kind_of_intr, 0),
+    DEFINE_PROP_UINT32("kind-of-intr", XpsIntc, c_kind_of_intr, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -193,7 +191,7 @@ static void xilinx_intc_class_init(ObjectClass *klass, void *data)
 static const TypeInfo xilinx_intc_info = {
     .name          = TYPE_XILINX_INTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct xlx_pic),
+    .instance_size = sizeof(XpsIntc),
     .instance_init = xilinx_intc_init,
     .class_init    = xilinx_intc_class_init,
 };
-- 
2.34.1


