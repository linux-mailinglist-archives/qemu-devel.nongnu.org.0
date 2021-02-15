Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3725D31B736
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:35:23 +0100 (CET)
Received: from localhost ([::1]:33756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbDu-0006Z8-8s
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB6-0004Lm-PE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:28 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAz-0001i0-G8
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:28 -0500
Received: by mail-wr1-x432.google.com with SMTP id r21so8219134wrr.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Pn0+fUrgN1cOJcpBnEN8VL4IjMtADYNe+/RkpTUxHU=;
 b=r5trOF4xH7tJBTDZ4+nVU57V0qVY5k0jgPOn+V34UGgaOIWA1ec6z3k4c1Txa9HIIk
 Yb5s0ANl6Xolqt+A9f8kzTTI/lCVY5OXv9dvawjLxo92YY5LRDcAS3CWEQUygUg60pI1
 8PSOkg+bRUqO0T1fgl6N3WXnuRfUCqO3hm8s/l77HnplUkQOVdMIwwE7bwcnStb+oit4
 Vj+Uxb2XAQJfN2qp1XeEhc3G990pi8Gz3TnYS27jVg8S4wapUUosVlWF5LCMMt0bO3Qi
 QtuqO8nk7BbJ00tfmhjIu6rh96uDRiJvwK1eroklgU/ySE9U5UKCtK19HusMytBJ69FP
 E4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Pn0+fUrgN1cOJcpBnEN8VL4IjMtADYNe+/RkpTUxHU=;
 b=nj4QCKaSTu6Pi+8kSS7FB9sbinP5yutx+npgzFQplvOANhh4SjOlIQZJHVh+QIHdCa
 WEPUXXRNEvd6sj8JbTxNplV0QG34Xiv67IMeJbdW0VbOKw8zBkl1l/rcrJSghS4kPO0W
 E90xcMhIeM2irZJegsLKK12yotExdxBnFeIL+1jhN4SUVIqVWZ95JnXix018lekEmsZX
 DGvZu9z/M5NJszlNw/AVZZIozzQWn+fw2VVeuG9uGxdloLq8RTnoW1kmW7eVb7SDYMVi
 8cUNAlHmI1UAUsC5UK4NlEEzOfl3jqXw8BI9m/wHcnnkMjTH3FgQNtVm/ymSvZh9rSmz
 +Y9g==
X-Gm-Message-State: AOAM533z6E60+l7vtj09Q4Eg2vF2T837stDDgsjP1MYc2GAepCXeq62X
 TgmWtMRb7jCTwB2E475QHk3kAZAaEEiRxQ==
X-Google-Smtp-Source: ABdhPJzmhcWnFYLRSkUqIeo7H7hE4kJ5Efdn/KTEdPycbCM5GH3Wxfbn10dzr6zozOmVA41DuExnZg==
X-Received: by 2002:a5d:5705:: with SMTP id a5mr14769676wrv.333.1613385140064; 
 Mon, 15 Feb 2021 02:32:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/9] hw/display/tc6393xb: Expand out macros in template header
Date: Mon, 15 Feb 2021 10:32:09 +0000
Message-Id: <20210215103215.4944-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now the template header is included only for BITS==32, expand
out all the macros that depended on the BITS setting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/tc6393xb_template.h | 35 ++++------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/hw/display/tc6393xb_template.h b/hw/display/tc6393xb_template.h
index 78629c07f97..7789ffc4399 100644
--- a/hw/display/tc6393xb_template.h
+++ b/hw/display/tc6393xb_template.h
@@ -21,25 +21,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#if BITS == 8
-# define SET_PIXEL(addr, color)  (*(uint8_t *)addr = color)
-#elif BITS == 15 || BITS == 16
-# define SET_PIXEL(addr, color)  (*(uint16_t *)addr = color)
-#elif BITS == 24
-# define SET_PIXEL(addr, color)  \
-    do {                         \
-        addr[0] = color;         \
-        addr[1] = (color) >> 8;  \
-        addr[2] = (color) >> 16; \
-    } while (0)
-#elif BITS == 32
-# define SET_PIXEL(addr, color)  (*(uint32_t *)addr = color)
-#else
-# error unknown bit depth
-#endif
-
-
-static void glue(tc6393xb_draw_graphic, BITS)(TC6393xbState *s)
+static void tc6393xb_draw_graphic32(TC6393xbState *s)
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int i;
@@ -49,24 +31,15 @@ static void glue(tc6393xb_draw_graphic, BITS)(TC6393xbState *s)
     data_buffer = s->vram_ptr;
     data_display = surface_data(surface);
     for(i = 0; i < s->scr_height; i++) {
-#if (BITS == 16)
-        memcpy(data_display, data_buffer, s->scr_width * 2);
-        data_buffer += s->scr_width;
-        data_display += surface_stride(surface);
-#else
         int j;
-        for (j = 0; j < s->scr_width; j++, data_display += BITS / 8, data_buffer++) {
+        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
             uint16_t color = *data_buffer;
-            uint32_t dest_color = glue(rgb_to_pixel, BITS)(
+            uint32_t dest_color = rgb_to_pixel32(
                            ((color & 0xf800) * 0x108) >> 11,
                            ((color & 0x7e0) * 0x41) >> 9,
                            ((color & 0x1f) * 0x21) >> 2
                            );
-            SET_PIXEL(data_display, dest_color);
+            *(uint32_t *)data_display = dest_color;
         }
-#endif
     }
 }
-
-#undef BITS
-#undef SET_PIXEL
-- 
2.20.1


