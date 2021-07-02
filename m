Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A625F3B9F41
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:48:15 +0200 (CEST)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGiU-0000bG-In
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb2-0004j7-8B
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGax-0006dT-A2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id a8so218443wrp.5
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHxj/xUOSn5B7Ujk/a1aY2KoAO5Tcc5/XFJvO0oLWf4=;
 b=pKfNGLE80XJP6BdmjqJu83DHv/hT0/LRl/xezT6oIy5lof2rbz2iCvfGumKzWaudet
 TGA8SIWrvJ3MmRrk3u4FsrhDE7Qef2jJcSeVyUKQY45c2o5jk4OZ7wcxMLkPPNKfXQot
 bTz6G2h0Xbw55PQuF3qQ9bOLOpD8s0xz/Y4cGjGlztfwddZINmDks8M4/B0TaRtI2Lwn
 Hst+POFYWA58yyyfF7s/GSzBaifKrIbiECU/l/zwN8ICik5NkQFrRqYBXrAYkO7/DNjB
 i7hA2d4YkU/ZygiUhCNOXb0i8f9WSaGjSpiSwpcS3+lB0e0yC+her/pMNf61snjm4JPd
 cDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHxj/xUOSn5B7Ujk/a1aY2KoAO5Tcc5/XFJvO0oLWf4=;
 b=En4c6CgLnqI7zmeRdJza0w91ZU2Zl62Wk6Xi+IgwdcmrqBZG9iW4zDFBbOy7LKJFwR
 PxK4oFFb9kFt7ZKWU4XI8Ci6LQyyjYQm69xsNMKe9bxRSvy8LHxjTFjctboD0xTcPZAN
 h7s4Atdo1JhfcGHts08BQWT45BJcqkmyQYT0KNNZPoJJP6V/+xhPy2cGWocBK1S14n9W
 vqeDF+M00HJCvMHZicwK87+lR5sYpGD07/00qt+/bj/Telij8UJ49EnxzcWO6/FpLxJJ
 RPwI5YcF/sMhv1DQQShy9hnlaB1wVW60x3TqJnVnNkCSZ3QVKkdB416ncXb14YBef2fx
 ddHw==
X-Gm-Message-State: AOAM530xSJ9cVwW+69r/4ZlctmEg0kB2CWpkg8H0NHxdYlpb/RKUFzzN
 kHgsEiqq5pWOIlqu/zrR/C0rSA==
X-Google-Smtp-Source: ABdhPJwZV5+ooyS1lmSsnhAjWtJ59nFkT66MB7YbRwjWPUo8mt801vbrTVwJub9IWMCkHQQo8SOK8A==
X-Received: by 2002:adf:eece:: with SMTP id a14mr5043230wrp.313.1625222426063; 
 Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/11] hw/gpio/pl061: Make pullup/pulldown of outputs
 configurable
Date: Fri,  2 Jul 2021 11:40:14 +0100
Message-Id: <20210702104018.19881-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PL061 GPIO does not itself include pullup or pulldown resistors
to set the value of a GPIO line treated as an output when it is
configured as an input (ie when the PL061 itself is not driving it).
In real hardware it is up to the board to add suitable pullups or
pulldowns.  Currently our implementation hardwires this to "outputs
pulled high", which is correct for some boards (eg the realview ones:
see figure 3-29 in the "RealView Platform Baseboard for ARM926EJ-S
User Guide" DUI0224I), but wrong for others.

In particular, the wiring in the 'virt' board and the gpio-pwr device
assumes that wires should be pulled low, because otherwise the
pull-to-high will trigger a shutdown or reset action.  (The only
reason this doesn't happen immediately on startup is due to another
bug in the PL061, where we don't assert the GPIOs to the correct
value on reset, but will do so as soon as the guest touches a
register and pl061_update() gets called.)

Add properties to the pl061 so the board can configure whether it
wants GPIO lines to have pullup, pulldown, or neither.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c | 51 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 44bed56fef0..bb496a19ade 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -13,12 +13,28 @@
  *  + unnamed GPIO inputs 0..7: inputs to connect to the emulated GPIO lines
  *  + unnamed GPIO outputs 0..7: the emulated GPIO lines, considered as
  *    outputs
+ *  + QOM property "pullups": an integer defining whether non-floating lines
+ *    configured as inputs should be pulled up to logical 1 (ie whether in
+ *    real hardware they have a pullup resistor on the line out of the PL061).
+ *    This should be an 8-bit value, where bit 0 is 1 if GPIO line 0 should
+ *    be pulled high, bit 1 configures line 1, and so on. The default is 0xff,
+ *    indicating that all GPIO lines are pulled up to logical 1.
+ *  + QOM property "pulldowns": an integer defining whether non-floating lines
+ *    configured as inputs should be pulled down to logical 0 (ie whether in
+ *    real hardware they have a pulldown resistor on the line out of the PL061).
+ *    This should be an 8-bit value, where bit 0 is 1 if GPIO line 0 should
+ *    be pulled low, bit 1 configures line 1, and so on. The default is 0x0.
+ *    It is an error to set a bit in both "pullups" and "pulldowns". If a bit
+ *    is 0 in both, then the line is considered to be floating, and it will
+ *    not have qemu_set_irq() called on it when it is configured as an input.
  */
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -62,6 +78,9 @@ struct PL061State {
     qemu_irq irq;
     qemu_irq out[N_GPIOS];
     const unsigned char *id;
+    /* Properties, for non-Luminary PL061 */
+    uint32_t pullups;
+    uint32_t pulldowns;
 };
 
 static const VMStateDescription vmstate_pl061 = {
@@ -109,8 +128,7 @@ static uint8_t pl061_floating(PL061State *s)
          */
         floating = ~(s->pur | s->pdr);
     } else {
-        /* Assume outputs are pulled high. FIXME: this is board dependent. */
-        floating = 0;
+        floating = ~(s->pullups | s->pulldowns);
     }
     return floating & ~s->dir;
 }
@@ -131,8 +149,7 @@ static uint8_t pl061_pullups(PL061State *s)
          */
         pullups = s->pur;
     } else {
-        /* Assume outputs are pulled high. FIXME: this is board dependent. */
-        pullups = 0xff;
+        pullups = s->pullups;
     }
     return pullups & ~s->dir;
 }
@@ -501,12 +518,38 @@ static void pl061_init(Object *obj)
     qdev_init_gpio_out(dev, s->out, N_GPIOS);
 }
 
+static void pl061_realize(DeviceState *dev, Error **errp)
+{
+    PL061State *s = PL061(dev);
+
+    if (s->pullups > 0xff) {
+        error_setg(errp, "pullups property must be between 0 and 0xff");
+        return;
+    }
+    if (s->pulldowns > 0xff) {
+        error_setg(errp, "pulldowns property must be between 0 and 0xff");
+        return;
+    }
+    if (s->pullups & s->pulldowns) {
+        error_setg(errp, "no bit may be set both in pullups and pulldowns");
+        return;
+    }
+}
+
+static Property pl061_props[] = {
+    DEFINE_PROP_UINT32("pullups", PL061State, pullups, 0xff),
+    DEFINE_PROP_UINT32("pulldowns", PL061State, pulldowns, 0x0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_pl061;
     dc->reset = &pl061_reset;
+    dc->realize = pl061_realize;
+    device_class_set_props(dc, pl061_props);
 }
 
 static const TypeInfo pl061_info = {
-- 
2.20.1


