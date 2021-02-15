Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A898231B874
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:56:55 +0100 (CET)
Received: from localhost ([::1]:47318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcUo-0005JV-No
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQF-0006tY-HE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:11 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQD-0003s9-Qz
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:11 -0500
Received: by mail-wm1-x32b.google.com with SMTP id l17so5974435wmq.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shTSJl6L/H8wb4siiGCFXvHoXe+zewsk4Ogg6uSOUOc=;
 b=eMzzFH4FkG4AD266JpfsaeErVXuABv5yB6R/i9kl9N7IbbIqe1N8DJFsRiV/6vz9t8
 /csPJEP6Hk0uP8BjfUHZQ3xob7NStxMum6j7G+V0mqBJt7LLEyeh5/a9J67o5d2ioi41
 Vh304pPZqir5NyW2MEBaBUzUu7M6JCfW08YLeHzBN8jCsj/LTWJ4+IIGGxLMJlTGCxEv
 hjuDlJLMSnZZ/pH4Or5WqxN7TZSOaode99kTC51R50uGi+eK50nqJh1YDQj4NYt0joze
 Vdq3fFf2x8OvT2UxcVEfXxefhFacf7cJIRaWSeP1edPkP7iB9kUgK8PpeGt8crGLsqU8
 PIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shTSJl6L/H8wb4siiGCFXvHoXe+zewsk4Ogg6uSOUOc=;
 b=Dha1kp5tO1OUEzMOePg07zt6LtsrXtKz7XYBQHUUkeu9iMDQm5l3BU/K0Gqi5bjswr
 mbixwegajCXOp+51N6MksV3clcE5y+vrTACfhWuvdxNVQO1YoXe3EMo/+3ow3AwbZpSB
 WOklF4NXTAtZeTH0XmhVpajQPReEOfzMSo7yJHvSg/jpU5v/qFzL8Dw+1BFw1drjF1xe
 jqC3Ml6rZcDnIbW2avvcWfCwx2d/TDZvxn6oFgKbk84TBV3m9XmiDNDGcNHgmjCYUvti
 TDVIlkaMNxmJaOaGTWV2cPLNu+VKztiwXRN8X8w0sWXfn9ZBIGkibuouvDGadFwCspw4
 4eZQ==
X-Gm-Message-State: AOAM530aNACZ2GNK4UbdEtxf2W7TxX5POb43XFUB454CfSW7PVG90zO/
 zX6W8Vomcm5SgnDhfrMGoa6cfA==
X-Google-Smtp-Source: ABdhPJwVXjEuDU+18UbsXTHezjzXQHsuL9AHaS3SwmBMOhqm1u0LKPV3Dk4mHXcVH6KdyaOIsZLyQQ==
X-Received: by 2002:a1c:2ed4:: with SMTP id u203mr14278234wmu.45.1613389928504; 
 Mon, 15 Feb 2021 03:52:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] hw/misc/mps2-fpgaio: Make number of LEDs
 configurable by board
Date: Mon, 15 Feb 2021 11:51:19 +0000
Message-Id: <20210215115138.20465-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
FPGAIO device is similar on both sets of boards, but the LED0
register has correspondingly more bits that have an effect.  Add a
device property for number of LEDs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 6af0e8f837a..b28a1be22cc 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -177,9 +177,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset) {
     case A_LED0:
-        s->led0 = value & 0x3;
-        led_set_state(s->led[0], value & 0x01);
-        led_set_state(s->led[1], value & 0x02);
+        if (s->num_leds != 0) {
+            int i;
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
+    int i;
 
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


