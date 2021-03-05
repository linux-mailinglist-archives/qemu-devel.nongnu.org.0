Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0032F257
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:21:01 +0100 (CET)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF4O-0005P2-PA
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3V-0007DV-CX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3B-0007fT-Iu
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id e23so2101678wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F8h1xcwVkEMGkrY+7ou3mKWoELl4gRqb2ciec49E1r4=;
 b=lKURv3DnMWpkn8Z22lVhkQYyQJCZDMBHNyam9TTEW/tyt+JHNsKczCCQIsXKN9mQXP
 WIqjFdDGQ6wmBudgfki/+v7CgazjGqgLi9I3z0Q+gwD8lzGDjEC0xyU3x0LGp47CPVj0
 MeMtWHsQZKkWcvf34hS01QcKyW4KhKGGV0XlnaVzo6kG/1YxWd8P5tWHUl90Pb0HWBj0
 q13B+PIJEOI7AnWtn2Qaz0L4RML4kKQeV684k62g3E7fhvAs9i0gMqV7kiRaBL1hi1mx
 eq2imRWO51Oe68i8AxcnlRhqfEWqefsXeXivk9ZTHhFPtgi4O/1bGom+WdBj/nGyl+o0
 OnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F8h1xcwVkEMGkrY+7ou3mKWoELl4gRqb2ciec49E1r4=;
 b=G70xraVc7VBzd0JsVeTVSCEFUAYdy6eXSYcHbhEYvwV/M2E47RI5mURD0otoIgKjZ6
 8B6TS9imhb80ojDWoLCkEPsHaDJ7TWu2WgkpmR7snQWPbDpfWxbzWLr4fFqBruLIpTz4
 cDEM+2HzP4roL/keaKRWJpPaBgt7TWhSS7atxfLa8F1BRn3y+K2WdsVNDkJX3c72hzT5
 s+JgYBu4PAq/dPRVdB46o6/zcV/K84jkAhlMphttlKvvP1fKb+FQQiCFZX+Se/LY/PDh
 RcEAOs6oFKtmt8pIFhT553KTxJTbQ1qFfIrAg0LIJpIGNrVKfK4SdTQfXchP6UOFGI6c
 JVMQ==
X-Gm-Message-State: AOAM531nGS16ecTmR3grMuTKyMFj+TYzAN1e5oKErC0SsafsQsNIBPCW
 PRnHwbiEPaKg2l/gWFmoiNsPfHr55Tm38g==
X-Google-Smtp-Source: ABdhPJzsW1z+l/HBOfZqFXgptNGuL0WZ84BJc/v82LXAPTvgTO0dHvIFiqz65boeF/h8Nxr8z4wc+Q==
X-Received: by 2002:a1c:6a12:: with SMTP id f18mr10107671wmc.31.1614964538570; 
 Fri, 05 Mar 2021 09:15:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/49] hw/misc/mps2-fpgaio: Make number of LEDs configurable by
 board
Date: Fri,  5 Mar 2021 17:14:56 +0000
Message-Id: <20210305171515.1038-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
FPGAIO device is similar on both sets of boards, but the LED0
register has correspondingly more bits that have an effect.  Add a
device property for number of LEDs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-6-peter.maydell@linaro.org
---
 include/hw/misc/mps2-fpgaio.h |  5 ++++-
 hw/misc/mps2-fpgaio.c         | 31 +++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index a010fdb2b6d..bfe73134e78 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -28,13 +28,16 @@
 #define TYPE_MPS2_FPGAIO "mps2-fpgaio"
 OBJECT_DECLARE_SIMPLE_TYPE(MPS2FPGAIO, MPS2_FPGAIO)
 
+#define MPS2FPGAIO_MAX_LEDS 32
+
 struct MPS2FPGAIO {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     MemoryRegion iomem;
-    LEDState *led[2];
+    LEDState *led[MPS2FPGAIO_MAX_LEDS];
+    uint32_t num_leds;
 
     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 6af0e8f837a..e74dec670f0 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -177,9 +177,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset) {
     case A_LED0:
-        s->led0 = value & 0x3;
-        led_set_state(s->led[0], value & 0x01);
-        led_set_state(s->led[1], value & 0x02);
+        if (s->num_leds != 0) {
+            uint32_t i;
+
+            s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
+            for (i = 0; i < s->num_leds; i++) {
+                led_set_state(s->led[i], value & (1 << i));
+            }
+        }
         break;
     case A_PRESCALE:
         resync_counter(s);
@@ -238,7 +243,7 @@ static void mps2_fpgaio_reset(DeviceState *dev)
     s->pscntr = 0;
     s->pscntr_sync_ticks = now;
 
-    for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
+    for (size_t i = 0; i < s->num_leds; i++) {
         device_cold_reset(DEVICE(s->led[i]));
     }
 }
@@ -256,11 +261,19 @@ static void mps2_fpgaio_init(Object *obj)
 static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
 {
     MPS2FPGAIO *s = MPS2_FPGAIO(dev);
+    uint32_t i;
 
-    s->led[0] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
-                                  LED_COLOR_GREEN, "USERLED0");
-    s->led[1] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
-                                  LED_COLOR_GREEN, "USERLED1");
+    if (s->num_leds > MPS2FPGAIO_MAX_LEDS) {
+        error_setg(errp, "num-leds cannot be greater than %d",
+                   MPS2FPGAIO_MAX_LEDS);
+        return;
+    }
+
+    for (i = 0; i < s->num_leds; i++) {
+        g_autofree char *ledname = g_strdup_printf("USERLED%d", i);
+        s->led[i] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
+                                      LED_COLOR_GREEN, ledname);
+    }
 }
 
 static bool mps2_fpgaio_counters_needed(void *opaque)
@@ -303,6 +316,8 @@ static const VMStateDescription mps2_fpgaio_vmstate = {
 static Property mps2_fpgaio_properties[] = {
     /* Frequency of the prescale counter */
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
+    /* Number of LEDs controlled by LED0 register */
+    DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


