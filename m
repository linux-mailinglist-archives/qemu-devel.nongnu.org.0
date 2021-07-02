Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED43B9F47
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:48:41 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGiu-0001dK-3c
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb3-0004mn-VD
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGax-0006d9-84
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so8761235wms.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CnOCqrZmWUxfwjKjUalVZwOU/ZbiNiTaO6KmtADP/mk=;
 b=Bg5ipmEdn5wI/Damf0iQdqGhk40VGHkKnPgiZnflIo/pVz7CwVq9eEGs9CvdScXgz3
 My0PlJ0HHbIIR1sRg/Neran4WFC1D9++tqU1+RyGud4nshhJVLgchVJjHqrUVZI9dqpZ
 WgBBIaLCFiVu1b2juv5mNDinxbx6eu1cqWeqBtnwKaZ850eVwdrHqAM1qOYufiEMymBh
 ovchTKpEHcb4kiWIxQ+0ujHQu39a9JgzKKZIBAG0ZGAzb1RHpFLzamXXJbqFyirLDsqn
 BZLMyup+4g1zUSMyisbA0ysAmOU8tk/Yv5nFHkbZ6el4wi/ZnjDGkBnVuyiDwHhOR8wN
 fxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnOCqrZmWUxfwjKjUalVZwOU/ZbiNiTaO6KmtADP/mk=;
 b=NraJGfCq+4oEa9JDpxqtut1v8YyGbgAhQHTPhvx50OvlHQlE/NUtqlbwqGBREXX/NF
 8RdCLEANOFLLalBUZG/ZAgmFKjqOBxw6rwpHXmu8x0Wx1laI4NN910eeCAFq3kFRUXE2
 5nQKlxAbYnXewKpWbQIuBbh+cgIDwT8LSXraGpeqqWUzuYQsxnaQGfsuu2HwJeaxCQhs
 shkDs+VdMJM+lK85+WXZCohlGoCLq+bXQBz/4y8wbJikusdT3lkoh7bQ4HifTnmabkL3
 q8BKTBqv13UurwJBZxQCPZEfRR1HpWSPw93AlXoGs6XjuDcQRx/KEIsDde5EWgjkptqS
 2MAw==
X-Gm-Message-State: AOAM531y5bHH8EfVn0Yq4uIpzRWBW+Os+V4d2xExF/iQDBPJWWoYQLFF
 Vsgyk3BM5vJTe3qlKhptYKzzP/lglyYWtKqP
X-Google-Smtp-Source: ABdhPJzYhp2oVI3fW4t+ccM+An6/SkJc9UW7q495KvjuofzfRHCuQ5TObwxA1eQMPVMaqTi2I5svVA==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr15229146wmk.17.1625222425235; 
 Fri, 02 Jul 2021 03:40:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/11] hw/gpio/pl061: Honour Luminary PL061 PUR and PDR
 registers
Date: Fri,  2 Jul 2021 11:40:13 +0100
Message-Id: <20210702104018.19881-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The Luminary variant of the PL061 has registers GPIOPUR and GPIOPDR
which lets the guest configure whether the GPIO lines are pull-up,
pull-down, or truly floating. Instead of assuming all lines are pulled
high, honour the PUR and PDR registers.

For the plain PL061, continue to assume that lines have an external
pull-up resistor, as we did before.

The stellaris board actually relies on this behaviour -- the CD line
of the ssd0323 display device is connected to GPIO output C7, and it
is only because of a different bug which we're about to fix that we
weren't incorrectly driving this line high on reset and putting the
ssd0323 into data mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c      | 58 +++++++++++++++++++++++++++++++++++++++++---
 hw/gpio/trace-events |  2 +-
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 06a1b82a503..44bed56fef0 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -94,18 +94,68 @@ static const VMStateDescription vmstate_pl061 = {
     }
 };
 
+static uint8_t pl061_floating(PL061State *s)
+{
+    /*
+     * Return mask of bits which correspond to pins configured as inputs
+     * and which are floating (neither pulled up to 1 nor down to 0).
+     */
+    uint8_t floating;
+
+    if (s->id == pl061_id_luminary) {
+        /*
+         * If both PUR and PDR bits are clear, there is neither a pullup
+         * nor a pulldown in place, and the output truly floats.
+         */
+        floating = ~(s->pur | s->pdr);
+    } else {
+        /* Assume outputs are pulled high. FIXME: this is board dependent. */
+        floating = 0;
+    }
+    return floating & ~s->dir;
+}
+
+static uint8_t pl061_pullups(PL061State *s)
+{
+    /*
+     * Return mask of bits which correspond to pins configured as inputs
+     * and which are pulled up to 1.
+     */
+    uint8_t pullups;
+
+    if (s->id == pl061_id_luminary) {
+        /*
+         * The Luminary variant of the PL061 has an extra registers which
+         * the guest can use to configure whether lines should be pullup
+         * or pulldown.
+         */
+        pullups = s->pur;
+    } else {
+        /* Assume outputs are pulled high. FIXME: this is board dependent. */
+        pullups = 0xff;
+    }
+    return pullups & ~s->dir;
+}
+
 static void pl061_update(PL061State *s)
 {
     uint8_t changed;
     uint8_t mask;
     uint8_t out;
     int i;
+    uint8_t pullups = pl061_pullups(s);
+    uint8_t floating = pl061_floating(s);
 
-    trace_pl061_update(DEVICE(s)->canonical_path, s->dir, s->data);
+    trace_pl061_update(DEVICE(s)->canonical_path, s->dir, s->data,
+                       pullups, floating);
 
-    /* Outputs float high.  */
-    /* FIXME: This is board dependent.  */
-    out = (s->data & s->dir) | ~s->dir;
+    /*
+     * Pins configured as output are driven from the data register;
+     * otherwise if they're pulled up they're 1, and if they're floating
+     * then we give them the same value they had previously, so we don't
+     * report any change to the other end.
+     */
+    out = (s->data & s->dir) | pullups | (s->old_out_data & floating);
     changed = s->old_out_data ^ out;
     if (changed) {
         s->old_out_data = out;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 442be9406f5..eb5fb4701c6 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -14,7 +14,7 @@ nrf51_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 nrf51_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 
 # pl061.c
-pl061_update(const char *id, uint32_t dir, uint32_t data) "%s GPIODIR 0x%x GPIODATA 0x%x"
+pl061_update(const char *id, uint32_t dir, uint32_t data, uint32_t pullups, uint32_t floating) "%s GPIODIR 0x%x GPIODATA 0x%x pullups 0x%x floating 0x%x"
 pl061_set_output(const char *id, int gpio, int level) "%s setting output %d to %d"
 pl061_input_change(const char *id, int gpio, int level) "%s input %d changed to %d"
 pl061_update_istate(const char *id, uint32_t istate, uint32_t im, int level) "%s GPIORIS 0x%x GPIOIE 0x%x interrupt level %d"
-- 
2.20.1


