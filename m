Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD6669B80
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:11:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnL-0001a4-Sf; Fri, 13 Jan 2023 09:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKn2-0001GA-D8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:17 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmm-0003f4-Db
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so18858298wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HmdzEgyrds4NnZWZ6I/XMHkwj8I5g3It69CazaZPIlk=;
 b=nBiJhr+o4D+Oz8dCDOwggv8GYVX85phJcrw+A17d7eJHCYWj+vSZ6JgYLQiQakU8QI
 qqkZjOezBzTx00zD1/N3Nnbj1/DbWeZN1c0+wwM0h/OnzwR/GCypbkelWoRjOVDBwN2S
 bv3eJgvQwEbHxFexZi2jREdM1KYTrRGQzilhsptEMkKp+Oqu9DQ7XIpBz1WXmT6QfFF+
 R8d6+RcDOlrAjPFPUIvv39qhD970jSDXOudJWe574JstnqY9GJpGnp6Vc71vNrVSEqNg
 gN+Nu2EXEa8KzNpVjQTCupVYQAZucv05254JpJ6PfZswbk/gTb/x4jFbdbjFbSRM872i
 VmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmdzEgyrds4NnZWZ6I/XMHkwj8I5g3It69CazaZPIlk=;
 b=3Pbf10MIXCkSJi6BI7PEFGC8bqsdCE+H6V45wfcLqulaeFLO0Qx29+bVFtfg5PJi48
 ZASaYbkfmjU6XvB/bNdsQV07mGQUynvkFLrh/UudsUW5o1xc3VPe011XOwMI/4bXBoLX
 skGoo9pll/UfFh3hFsJ3QEwBafh2SsaygMJ1bqQC1Rr4eDBrbBw+pDGbHPOQ22SXOuKf
 GvM62FMq9QxDC4yBeeZDa3LPF7wGnC4DByyy8wsZH5B1atOKAJkgxIa8ee225x701JlP
 OBC/uDEEUohorLT9hNC1/7uK8KLQNYEtMa4Gk/dpFweWdKzld4yoC72l781YVV9SfN77
 FMkg==
X-Gm-Message-State: AFqh2kr09V0ce7iNajZGW0EiLjYxE9GU+jbdQlao+Z7/cuMWzDKsR5Cw
 EyztZSYV/GFcbrs9CcwU6c9RUSVMRPdQF5JA
X-Google-Smtp-Source: AMrXdXuiu1CDPsjDo7rPfV7uBsDSuM/B7KzsyLFDKofhR0K5G7s9B1/mYi1sJPdA6hbLwi/QCPZ/wg==
X-Received: by 2002:a05:600c:54cb:b0:3cf:d0be:1231 with SMTP id
 iw11-20020a05600c54cb00b003cfd0be1231mr69556977wmb.13.1673619119679; 
 Fri, 13 Jan 2023 06:11:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/38] hw/timer/xilinx_timer: Use XpsTimerState instead of
 'struct timerblock'
Date: Fri, 13 Jan 2023 14:11:25 +0000
Message-Id: <20230113141126.535646-38-peter.maydell@linaro.org>
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

  hw/timer/xilinx_timer.c:65:1: error: declaration of anonymous struct must be a definition
  DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Message-id: 20230109140306.23161-15-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/xilinx_timer.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index c7f17cd6460..32a9df69e0b 100644
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
2.34.1


