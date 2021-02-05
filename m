Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FF310F30
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:56:07 +0100 (CET)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85Kw-0001Gk-PQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Te-0006n5-Dg
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-00042R-Or
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id m13so8407841wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vPha70CdlIz8Ft1BgdKuRx55ClhohOzaXUUXYhoxm5M=;
 b=g/8Lv/PCmVVItNdnAT1VaNzH6B+1ScitB/EWkMXo76JuspwX8JbLRsHlLlLee0nDvW
 EWrJJV7170rDPEvm6/JvvOJBv0R5dHiecIISaq3C2j3KWh17zKwfN3NdhUeJ3+45Khl/
 0PUmeCACBhuD54Axrp3YkMofMjoHhcl7FGs8tpxROV9vCM1rNuBr7uW/nhAA03wxZ+pr
 ETdjw0M7A1WllSLuIK+X+MyFkaOGuWko4akScpG6ZOlP3wwxQoi6DKEdIAamjTCsqFs6
 mPskzGVRO6jR/oCWmQ0Pd9st2x1d40Id4RF4M0Pr+4s2BKDDdmu/OjRI5hZVMUHrl1Ax
 t0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPha70CdlIz8Ft1BgdKuRx55ClhohOzaXUUXYhoxm5M=;
 b=dTO623Z/WI78uXIFs3uJlAUbp+RxFzE8qbwhIGRGX2wAe+jukPdMiOUjUnftodjGJr
 L2Dh5JSIptzR7gNwFgfOC70mww7VjNWxCTkj6kwAWb7Mdw4oW0tGWVnGg4GXbrCos8S4
 CHNa9Gdr7WRnr+yFGBCYOmvlf0Jw6UuOk21K4+L3Vzcntl6sPh5U4r5fZPm1UYqta+En
 HbNpVMBSUSgSjoPyTLHW6er5lKqbCGq/NrAgqZj2PV0cKzvgj1XWLv8SvxVO30Kpbzfm
 In1QsLFzk8JXZATuj1QhJiPHEig6t3NEkhV3Mgj3nMvyy8tLjKqJ96AMrGvJSBY2fcpK
 oniw==
X-Gm-Message-State: AOAM531GkXtgErGRv/R/rCWX37HRc9XQGPRkN6tj1PlhjUZ/6mPXAA//
 3nx3pEK09Y+LgktV3beq3mWvzEPWCfD+bQ==
X-Google-Smtp-Source: ABdhPJwq74pQs3PSxuyoQe+TpvHr/b5JJ6jNvIXFdf6Gyhejr/WqQWr6I7iQVUAL0A0s2EfKV8xeBg==
X-Received: by 2002:a5d:6712:: with SMTP id o18mr5862736wru.375.1612544425859; 
 Fri, 05 Feb 2021 09:00:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/24] hw/misc/mps2-fpgaio: Make number of LEDs configurable
 by board
Date: Fri,  5 Feb 2021 17:00:00 +0000
Message-Id: <20210205170019.25319-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


