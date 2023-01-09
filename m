Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAADA66289C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:33:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEslR-0001zC-IP; Mon, 09 Jan 2023 09:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEslE-0001tE-0j
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:24 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEslA-0007Fv-MP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6859934wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrR1GDMObTllDPwJtD3Of+jW/9BkqqN5WyyEeN1uJKY=;
 b=iOZ+uxN5jCKG7I/DUWcF6QaCuPpV14kq9LNDH7pB/h2nPr8ZNwh5h9M9a2USyhvQiI
 q+nGXUiUKan1D7a/RatyCvAlAPp4zH8fuhUt3g9R1vVGC+cWCIIG363Ja6YFd9fzBzgJ
 xJJN3Ef5A6K45/R79amUCbOkD4wlWUrFd/tjz2+iLAkdxccpNsHWVjL1oWCH/b1WaYxH
 6ZCYlxq6bftJvSO8TV5fCnVMRczNcueSoZM+MauthPn5d7siI0Fe+grXiXf9bfrUEW9J
 wsXvi8NsTdpPyTrGOYhdp/HqBXtyD05EycNT6gX+lITCzXC4ejnLUSOhciazLYEbvqNo
 iKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrR1GDMObTllDPwJtD3Of+jW/9BkqqN5WyyEeN1uJKY=;
 b=Hz/Sq8OPQ4ZS/cSGOF09iHiFBHc36YWurGK38odrzhj0Ga2oPdcxeM8/9ikn1L/TZU
 QIcPZhtVCMdZHhllh/Wy74Ax2s2xY2WVqpHIY4oHW5Tdxm8Obs1egkhoUBMnn6191vfE
 xduqYkzJfyM9F0Z2nXWyjw3drTjNEA3UAfbnIhIBRDsEIcYoyiW/pqkd7/3nZcJGW/iF
 q+SFrVO6bNCyDtz2TiCHNGv0WXeI1AeTcz9JW58ATWxCjFnDHgMmsieLiFZpiuPsasRd
 tYqbNAZAss4lLpXdzuMLsMPedbXNu0ZPEro0nZAT7Uv6xBSDPQq1JrEP3qTnjAYjwr78
 dWdQ==
X-Gm-Message-State: AFqh2ko1tV8oLlm/6Qj/XJKc/mMTqgi2tJZg2XaEVvm2ktfRiMURPI3P
 WCTXcRC1C5iyfNgXQykzIQkYLHZ9qbPP5F4A
X-Google-Smtp-Source: AMrXdXuaDwPJrvoha9f5KjblbefxTgp5WRSb2sQ3b/JhocV1mkVdPBs9eMj6KzJmI9sF9f5vbEE0vw==
X-Received: by 2002:a05:600c:348b:b0:3d2:2a72:2577 with SMTP id
 a11-20020a05600c348b00b003d22a722577mr45551835wmq.27.1673273058111; 
 Mon, 09 Jan 2023 06:04:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c339300b003cff309807esm15064539wmp.23.2023.01.09.06.04.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 14/14] hw/timer/xilinx_timer: Use XpsTimerState instead of
 'struct timerblock'
Date: Mon,  9 Jan 2023 15:03:06 +0100
Message-Id: <20230109140306.23161-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

  hw/timer/xilinx_timer.c:65:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/xilinx_timer.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index c7f17cd646..32a9df69e0 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -62,10 +62,10 @@ struct xlx_timer
 };
 
 #define TYPE_XILINX_TIMER "xlnx.xps-timer"
-DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
-                         TYPE_XILINX_TIMER)
+typedef struct XpsTimerState XpsTimerState;
+DECLARE_INSTANCE_CHECKER(XpsTimerState, XILINX_TIMER, TYPE_XILINX_TIMER)
 
-struct timerblock
+struct XpsTimerState
 {
     SysBusDevice parent_obj;
 
@@ -76,7 +76,7 @@ struct timerblock
     struct xlx_timer *timers;
 };
 
-static inline unsigned int num_timers(struct timerblock *t)
+static inline unsigned int num_timers(XpsTimerState *t)
 {
     return 2 - t->one_timer_only;
 }
@@ -87,7 +87,7 @@ static inline unsigned int timer_from_addr(hwaddr addr)
     return addr >> 2;
 }
 
-static void timer_update_irq(struct timerblock *t)
+static void timer_update_irq(XpsTimerState *t)
 {
     unsigned int i, irq = 0;
     uint32_t csr;
@@ -104,7 +104,7 @@ static void timer_update_irq(struct timerblock *t)
 static uint64_t
 timer_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    struct timerblock *t = opaque;
+    XpsTimerState *t = opaque;
     struct xlx_timer *xt;
     uint32_t r = 0;
     unsigned int timer;
@@ -155,7 +155,7 @@ static void
 timer_write(void *opaque, hwaddr addr,
             uint64_t val64, unsigned int size)
 {
-    struct timerblock *t = opaque;
+    XpsTimerState *t = opaque;
     struct xlx_timer *xt;
     unsigned int timer;
     uint32_t value = val64;
@@ -202,7 +202,7 @@ static const MemoryRegionOps timer_ops = {
 static void timer_hit(void *opaque)
 {
     struct xlx_timer *xt = opaque;
-    struct timerblock *t = xt->parent;
+    XpsTimerState *t = xt->parent;
     D(fprintf(stderr, "%s %d\n", __func__, xt->nr));
     xt->regs[R_TCSR] |= TCSR_TINT;
 
@@ -213,7 +213,7 @@ static void timer_hit(void *opaque)
 
 static void xilinx_timer_realize(DeviceState *dev, Error **errp)
 {
-    struct timerblock *t = XILINX_TIMER(dev);
+    XpsTimerState *t = XILINX_TIMER(dev);
     unsigned int i;
 
     /* Init all the ptimers.  */
@@ -236,16 +236,15 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
 
 static void xilinx_timer_init(Object *obj)
 {
-    struct timerblock *t = XILINX_TIMER(obj);
+    XpsTimerState *t = XILINX_TIMER(obj);
 
     /* All timers share a single irq line.  */
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &t->irq);
 }
 
 static Property xilinx_timer_properties[] = {
-    DEFINE_PROP_UINT32("clock-frequency", struct timerblock, freq_hz,
-                                                                62 * 1000000),
-    DEFINE_PROP_UINT8("one-timer-only", struct timerblock, one_timer_only, 0),
+    DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
+    DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -260,7 +259,7 @@ static void xilinx_timer_class_init(ObjectClass *klass, void *data)
 static const TypeInfo xilinx_timer_info = {
     .name          = TYPE_XILINX_TIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct timerblock),
+    .instance_size = sizeof(XpsTimerState),
     .instance_init = xilinx_timer_init,
     .class_init    = xilinx_timer_class_init,
 };
-- 
2.38.1


