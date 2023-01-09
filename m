Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9972662877
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:30:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEslS-0001zW-GV; Mon, 09 Jan 2023 09:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEslA-0001sB-Tf
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsl4-00075e-67
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ay40so6346304wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gvdf7MKgAqOkpgoECI87U6UIVZrGkUaGXJayKsJqzE=;
 b=xvoG6pZO1tl/N0GOiWKJDNz4VIn0BW/rIN6xl/jJwGwJPmX4hkRbbG1FojLhjg4ziQ
 WA0JWvl3Bcwp8gctRtDvitDN4B+WQVPGMTC+lgEqpVU/yn6CSJ/hUGf4qdES22U5UdNF
 Pgcuy+9VtHs5v5l2PooPedXvagnOXcBw8eyPPrtUmYCvBs6hdSY5XrjjeKrBUHnpPPhG
 A6Fzif7Xk64vwrjbq9WXgsLjPpcv/uwtEXhGMlVBAU8cv+OAQDJWUO3f/xvWDTEWYG0I
 grgVeMu6IZosom+gC0uDJ5N1RMulZku2SZNlBkfhrJEIoYnxwnbrFOJKxVHdHnaT+9FZ
 mDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2gvdf7MKgAqOkpgoECI87U6UIVZrGkUaGXJayKsJqzE=;
 b=SZ1d/bw6wK0PPqoKyEz+PPof940X2892dEJBk6T5iRQmOSynxalVg+/rK7hb+fVMJB
 2OLqb/20YC7tydjEGSpzwZzZNEzDDipHtjTmzdnfEwVecs9MXqbKGmyDXOgouAOOjI+3
 FtxlNnY66KAnDPd+UwR/UXl9c9tPcb1MyrQmed97HusD6Iolr6/eBDfR6LGgjE2/dLuL
 no/JoNL2dXXBS/Fvw2bRb569GNnLQ1G2fjSO6LwFtRCucTHmE9ZljL/JH0Tk3UtQFJBj
 xvElbq+7EnRokG52htCvrPqEbkAcqjvTtC+A6FSxCikGnGERBcmB0slZF6CeuJJM4Qrx
 t4DA==
X-Gm-Message-State: AFqh2koGR0oV5viu6If/ZP5dhPQMp2EB35FgxGcNL2/na87oHOhGtFm9
 J7pKupHPZrnaXKpeF2Iij/nDRKixOgQLlVHx
X-Google-Smtp-Source: AMrXdXvrDxn7UYpq+gUIs5Ez0UFHr8I9lCRb4bkBmc/xjPlYy8OIlGq0aIjOGC7cd+mHe5Tuj6sqJw==
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a424 with SMTP id
 hg26-20020a05600c539a00b003d9efe8a424mr2516127wmb.34.1673273053181; 
 Mon, 09 Jan 2023 06:04:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm18134541wmb.29.2023.01.09.06.04.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 13/14] hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of
 'struct xlx_pic'
Date: Mon,  9 Jan 2023 15:03:05 +0100
Message-Id: <20230109140306.23161-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

This remove a use of 'struct' in the DECLARE_INSTANCE_CHECKER()
macro call, to avoid after a QOM refactor:

  hw/intc/xilinx_intc.c:45:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct xlx_pic, XILINX_INTC,
                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/xilinx_intc.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 4c4397b3d2..6e5012e66e 100644
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
2.38.1


