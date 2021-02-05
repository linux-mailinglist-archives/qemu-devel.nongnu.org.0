Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE0310F0B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:47:58 +0100 (CET)
Received: from localhost ([::1]:45906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85D2-0000ob-K3
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Te-0006n2-CY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:02 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-000434-NB
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:02 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c127so6433785wmf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/oJeRnXgSDJEHEJaO9pMCaTGB+0Qu174IkpqLDjGWdU=;
 b=xiGUezDfHv/GkXr/7aj9xhQDpJePHBEJ2RVtDtSlql8BEoHkWSJco2n2iDcTLnFQJw
 D8Poap30475CmjufapHWwxh+PbZ0AMDwfp5CusUj8aP9PW/Rc7EDzdSzDbUmA8qat7a8
 pJJxTPGl/imoyfeVbhVMi/XJ0Gagw5g2djlU7/De9aJ7TOAtG274ajG4ATXDxa79vOJm
 /6A2gUtDQ15IYSxraZ4Fy9Kv3RBwuT6t+BiSBb72ugPQQFefnXNvK1oC68/Dw3tj2UKj
 XqDtfycn0Abs1epZJu0DghI3jyKqnzUqIWAZZn+F6kVAlPyuysx8m7Pd7rf6UEwOAQd0
 R8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/oJeRnXgSDJEHEJaO9pMCaTGB+0Qu174IkpqLDjGWdU=;
 b=WZqfGNXNs4JRx+Jaeub5wroRF9XisjCT8o72UCLjwEv6Mpp7JZhzFev6aznYrviNwU
 lM13fK0PN8GThN1hImxy3VAha3RDsYbcaD0tZGDhMq6/qvXZGq+4Y+twgH8UvT2WUCzu
 ogGNH0L/WJK2V1dmXO5KXvGsobIllcF7cWIze7yGMyZ3ft6vVLnq0YrdE6cVS64xqrvf
 iI18spMiBfWzZUIA9NMfI9cXvHQLMFYV0mwEAlyFg/9mRcE+1H16XR9uLf2kdb2tC1tM
 CPg5Hsw57C5eSUEgcjDROQk99A0iBsSs7rqfBiLzlClL4zMiacbKKnT70ZeoWrA0RT/o
 V02w==
X-Gm-Message-State: AOAM531r34p7Rad72QDb1HiqFInwCdlY2J9tJUEMpTn426jJ4Fi8r+4I
 SN1tVE3ef3/iv9VAM7C9ab224Q==
X-Google-Smtp-Source: ABdhPJwmKLRTjNiQy8X1axUpaeddKNdzJXWIUh1QBqOKhv9DDpUmJExESI+/M8xLJDknR9EoF64H8A==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr4404462wmq.31.1612544426722; 
 Fri, 05 Feb 2021 09:00:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
Date: Fri,  5 Feb 2021 17:00:01 +0000
Message-Id: <20210205170019.25319-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MPS3 boards have an extra SWITCH register in the FPGAIO block which
reports the value of some switches.  Implement this, governed by a
property the board code can use to specify whether whether it exists.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/mps2-fpgaio.h |  1 +
 hw/misc/mps2-fpgaio.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index bfe73134e78..83c6e18a4ee 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -38,6 +38,7 @@ struct MPS2FPGAIO {
     MemoryRegion iomem;
     LEDState *led[MPS2FPGAIO_MAX_LEDS];
     uint32_t num_leds;
+    bool have_switches;
 
     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index b28a1be22cc..b54657a4f07 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -35,6 +35,7 @@ REG32(CLK100HZ, 0x14)
 REG32(COUNTER, 0x18)
 REG32(PRESCALE, 0x1c)
 REG32(PSCNTR, 0x20)
+REG32(SWITCH, 0x28)
 REG32(MISC, 0x4c)
 
 static uint32_t counter_from_tickoff(int64_t now, int64_t tick_offset, int frq)
@@ -156,7 +157,15 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
         resync_counter(s);
         r = s->pscntr;
         break;
+    case A_SWITCH:
+        if (!s->have_switches) {
+            goto bad_offset;
+        }
+        /* User-togglable board switches. We don't model that, so report 0. */
+        r = 0;
+        break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 FPGAIO read: bad offset %x\n", (int) offset);
         r = 0;
@@ -318,6 +327,7 @@ static Property mps2_fpgaio_properties[] = {
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
     /* Number of LEDs controlled by LED0 register */
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
+    DEFINE_PROP_BOOL("have-switches", MPS2FPGAIO, have_switches, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1


