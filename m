Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4A3C279D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:35:00 +0200 (CEST)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tSt-0003W3-GO
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t57-0001c2-WC
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4x-0000wr-Pp
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id a13so12819079wrf.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g5RTMo3cZi5CJpdjcBxAxRPO+ziLZygfzXi5BsAwtdU=;
 b=nYPSSlWm2EF0O1qqle987sSYtMkTDJNvV41p51RQI3NcJ7qgEtybkm84/QpWBac2r7
 dF29cakrs2va8pBE+LWTloMpJ1j9RIZx9QKyrgaw9t1rFF53Q8t0X3JqPUH6o3HMNhMZ
 Yg1qlcZ+4+4X+wtJMXnpx+fSDXV8ECaZQxl5tlo8fFKcUW9u0bbuP3Yr/8zlQidfrwbq
 HNyRndrM2pwIpZl+JiUObJNg6LfUKir2ZuiGAjfQBG7fOlVsRlLNuHzHybvGqw/J+dYJ
 X3EJstpajc179PCdZNkWb8mFEM1OGrBmJd4dE4OjXMAz5lgGnmh9FrBRiVpH0yQSgTyb
 fmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5RTMo3cZi5CJpdjcBxAxRPO+ziLZygfzXi5BsAwtdU=;
 b=Z3z2ImvD42WhPk2wLPa8XRniYq7FCPQsJXbA3TODffAF1idAnQgT4FQc+7MbtDN+cF
 9st2EfOMdzlukcmlrEQkxai/YLFyL/ByjxBJuh+QFBGGL5pQkF5kvJHmqcVXjuXz3oKi
 8vDgchRg9tlFBlfQKC75K2qtOtTY9wP+ig6X0msgLNKxy+htbIk2ujUrSGnfuLqzSwwW
 UUpEdF9HOpVUgvpaUHXtxRjrNURPNe/t3FK+uZY/2vIbnpBNHqLReNNnjzEW6UFoymEs
 taFFi9mECrgzg4GpnUs5yhaFy/zNthfRvABtECRvJald1+pT26oHk6FxYMQIYZq4ZqjB
 Bx+w==
X-Gm-Message-State: AOAM530D0hNUUNdiGwDG6JxdjSof+in5PK9gelYqO40WBJAKmOka5BZ/
 4iRmfrCC2//3yIi/SmytbNX4/XyRHjwA7qrF
X-Google-Smtp-Source: ABdhPJynDQS5nzVI8wekz3siPX2KEyMrNjTgYh7q+cVQ4euNDf89TqFyM19ITD0GdMlB6dOcZaHn9g==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr24440230wrp.254.1625847014466; 
 Fri, 09 Jul 2021 09:10:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] hw/gpio/pl061: Convert to 3-phase reset and assert GPIO
 lines correctly on reset
Date: Fri,  9 Jul 2021 17:09:59 +0100
Message-Id: <20210709161003.25874-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PL061 comes out of reset with all its lines configured as input,
which means they might need to be pulled to 0 or 1 depending on the
'pullups' and 'pulldowns' properties.  Currently we do not assert
these lines on reset; they will only be set whenever the guest first
touches a register that triggers a call to pl061_update().

Convert the device to three-phase reset so we have a place where we
can safely call qemu_set_irq() to set the floating lines to their
correct values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/gpio/pl061.c      | 29 +++++++++++++++++++++++++----
 hw/gpio/trace-events |  1 +
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 5ba398fcd42..4002ab51544 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -446,13 +446,14 @@ static void pl061_write(void *opaque, hwaddr offset,
     return;
 }
 
-static void pl061_reset(DeviceState *dev)
+static void pl061_enter_reset(Object *obj, ResetType type)
 {
-    PL061State *s = PL061(dev);
+    PL061State *s = PL061(obj);
+
+    trace_pl061_reset(DEVICE(s)->canonical_path);
 
     /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
     s->data = 0;
-    s->old_out_data = 0;
     s->old_in_data = 0;
     s->dir = 0;
     s->isense = 0;
@@ -474,6 +475,24 @@ static void pl061_reset(DeviceState *dev)
     s->amsel = 0;
 }
 
+static void pl061_hold_reset(Object *obj)
+{
+    PL061State *s = PL061(obj);
+    int i, level;
+    uint8_t floating = pl061_floating(s);
+    uint8_t pullups = pl061_pullups(s);
+
+    for (i = 0; i < N_GPIOS; i++) {
+        if (extract32(floating, i, 1)) {
+            continue;
+        }
+        level = extract32(pullups, i, 1);
+        trace_pl061_set_output(DEVICE(s)->canonical_path, i, level);
+        qemu_set_irq(s->out[i], level);
+    }
+    s->old_out_data = pullups;
+}
+
 static void pl061_set_irq(void * opaque, int irq, int level)
 {
     PL061State *s = (PL061State *)opaque;
@@ -543,11 +562,13 @@ static Property pl061_props[] = {
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->vmsd = &vmstate_pl061;
-    dc->reset = &pl061_reset;
     dc->realize = pl061_realize;
     device_class_set_props(dc, pl061_props);
+    rc->phases.enter = pl061_enter_reset;
+    rc->phases.hold = pl061_hold_reset;
 }
 
 static const TypeInfo pl061_info = {
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index eb5fb4701c6..1dab99c5604 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -20,6 +20,7 @@ pl061_input_change(const char *id, int gpio, int level) "%s input %d changed to
 pl061_update_istate(const char *id, uint32_t istate, uint32_t im, int level) "%s GPIORIS 0x%x GPIOIE 0x%x interrupt level %d"
 pl061_read(const char *id, uint64_t offset, uint64_t r) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
 pl061_write(const char *id, uint64_t offset, uint64_t value) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
+pl061_reset(const char *id) "%s reset"
 
 # sifive_gpio.c
 sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.20.1


