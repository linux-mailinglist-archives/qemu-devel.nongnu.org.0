Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6353B9F3C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:46:37 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGgu-0005dP-3v
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb3-0004ml-SM
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGay-0006fN-TT
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v5so11903087wrt.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L7U6W9EH1FihHhwpCAtDoJvA3yxH/uDVM+98Ig5Lyfk=;
 b=bq6gKAWvABTAkpFGvttT1LTiw5mJ/W3RUwScC7njlKR7MOunXjk7tA3RF4zpXJ5uee
 VaXWXnFdfoYIaPy9Kc7n2sd1dFQKTpQ0k6MJoDdA3ZHXn1WVDODeNIMnc5EYNHwbjfwS
 HwL0Ak6Sgi9VgjFDgKSZdkOiem21+Xh/APQ8wYuFovV6KpMvrlbUJITWwbAdfKuzcS6e
 sfEL8aitjaEccxFciZKtelQeP1x9ez7vfBHw7YigBLlORsPOvFkQkQT/niahDGiENRSa
 F8RP8tp/y5mj/oGwNUV+aEWNv4hGXTkD2FfRSrsVgJ96v/3EYMResgxo/gtYRt5MDoPA
 azKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L7U6W9EH1FihHhwpCAtDoJvA3yxH/uDVM+98Ig5Lyfk=;
 b=s4o4HtDg9/OKIOtTZaFwsahF7meDpoPdeRAsKNFF5tU0GRQrZBZdtEj8nplgibaveO
 51MnRx3g6VMOACI+I8VIhBwdrK3VK+xht8lspqSI9fAH5bJGYCtwoOTFxEKHVfMvnBR8
 QxkRvRP6RVV6WuXawZt4ldd0ROfh+6CCpDWEglHILFbLGtVvJXgSGqqKp3T006V4wZAm
 BN/XC1LsY5j1vJlLJ8VAbqNHiJ6TeyBXF1NBG3FXEsg0lKvcmz/ygmfM/+MxnMxqQYAw
 bFCu2HnCrKsCMYcoU7hxEvlDbjUkDvOg2LcVFFeoJzj7Jbtz6+UlQguNnnQj1G0vHjFh
 YyYQ==
X-Gm-Message-State: AOAM531wGoZ0HsLyNs9Dv8xkir9Fp9duKkU1obtyu9uwy7LA85mYV7z0
 ZGilH7x4+0GxSh680y/rGfVZ4A==
X-Google-Smtp-Source: ABdhPJw1blM4SP3fVase9l72kNe2+Q1redCThuzDvc4KfCzHhy3LR1fT3GgyBv7clYaBoZv58bifdg==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr5126206wrc.390.1625222427679; 
 Fri, 02 Jul 2021 03:40:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/11] hw/gpio/pl061: Convert to 3-phase reset and assert GPIO
 lines correctly on reset
Date: Fri,  2 Jul 2021 11:40:16 +0100
Message-Id: <20210702104018.19881-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The PL061 comes out of reset with all its lines configured as input,
which means they might need to be pulled to 0 or 1 depending on the
'pullups' and 'pulldowns' properties.  Currently we do not assert
these lines on reset; they will only be set whenever the guest first
touches a register that triggers a call to pl061_update().

Convert the device to three-phase reset so we have a place where we
can safely call qemu_set_irq() to set the floating lines to their
correct values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c      | 29 +++++++++++++++++++++++++----
 hw/gpio/trace-events |  1 +
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index bb496a19ade..8d12b2d6b97 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -448,13 +448,14 @@ static void pl061_write(void *opaque, hwaddr offset,
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
@@ -476,6 +477,24 @@ static void pl061_reset(DeviceState *dev)
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
@@ -545,11 +564,13 @@ static Property pl061_props[] = {
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


