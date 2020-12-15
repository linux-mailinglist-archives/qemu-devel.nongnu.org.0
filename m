Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEC62DAFD4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:12:33 +0100 (CET)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpC08-0008AL-MT
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxJ-0005Io-6S
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxG-0000kf-QS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id q75so18816990wme.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IGI78ySIqdwEDouakruXPezW0i6YbGzlKC8KIhhFa68=;
 b=lmFEZTxa+CGVUHKWJ77errqhhZyO9Cum19x/XWXsKq/O/+7DHdKdHiw+MV3E92Dinp
 2Mv4QBztfX7xGVPkRsFyXT4uQlwLsGzWqg/TGtUv1pBfeVHIvZfo9jfj+wlM7ycSCHDf
 C67Sa0YKM3ug0Cw7d2yM/G3YQ2iBqtICStUlMcrcuOkIoLp9Ih27I2uNdqFkrY6Amxq1
 /smUskKyyLpCGIrGnRL8rlI4xiPRMsWZitn2zbZbzFysdteXwViH2ilUcqWK2SfLYsUG
 4g/Gw1zmDhNAcy5YMZaIJ27L+rYo4DIGmd+2QgEROLRAjXE7j5QF6UlmBebHIiW8jc54
 iOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IGI78ySIqdwEDouakruXPezW0i6YbGzlKC8KIhhFa68=;
 b=F3/T/qdwE1NlAMR9dwNkz7kPea5FlXkiilrL/deBI4E1VRLEYBQWLCLPOcNx1fFPq7
 H96dJoBe1Tpx06JOjUc1Rja7b0pqqFeYQM5H+DAecdHzS+0coVt82Yyp8OsDSmuMsVNs
 KreOOujq8xaBNbFTvlf0JprCLi9Cxf1FTpqzVuTvi/zqIUZHutaRrqynnk5gbNaG9FDC
 zL7mINj+mykmaRvFQk46CnRZqTGySEdIoys2mGhpQDLFwtkAXyRVoWo6fOSDhs6RNQaP
 xSaw3OjSlc/Bml0SdxIao/xGnjfbVDneA1sjqkPdf/B4paw/e0s7ITLtD9sSxdr0l+wa
 Gy1Q==
X-Gm-Message-State: AOAM5305FvkEHesRhFMwaxvhBILGi5Ho4mJl6/IxT2dQW0llAEI9eevN
 zuYb6pHkzGkFvXYK4ldQ7fUSlYu+gfwKvg==
X-Google-Smtp-Source: ABdhPJwHWQv2EXwQrLdTDml+6/zmvhQ85RDnf/hyd+ICynrrvq5KjyczTrFJMF3bornBLOZIe6YaIw==
X-Received: by 2002:a05:600c:258:: with SMTP id
 24mr33996982wmj.16.1608044972839; 
 Tue, 15 Dec 2020 07:09:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l1sm36930593wmi.15.2020.12.15.07.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:09:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] clock: Introduce clock_ticks_to_ns()
Date: Tue, 15 Dec 2020 15:09:26 +0000
Message-Id: <20201215150929.30311-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215150929.30311-1-peter.maydell@linaro.org>
References: <20201215150929.30311-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <luc.michel@greensocs.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The clock_get_ns() API claims to return the period of a clock in
nanoseconds. Unfortunately since it returns an integer and a
clock's period is represented in units of 2^-32 nanoseconds,
the result is often an approximation, and calculating a clock
expiry deadline by multiplying clock_get_ns() by a number-of-ticks
is unacceptably inaccurate.

Introduce a new API clock_ticks_to_ns() which returns the number
of nanoseconds it takes the clock to make a given number of ticks.
This function can do the complete calculation internally and
will thus give a more accurate result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The 64x64->128 multiply is a bit painful for 32-bit and I
guess in theory since we know we only want bits [95:32]
of the result we could special-case it, but TBH I don't
think 32-bit hosts merit much optimization effort these days.

Changes in v2: saturate the result to INT64_MAX.
---
 docs/devel/clocks.rst | 29 +++++++++++++++++++++++++++++
 include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index e5da28e2111..c2e70e64db1 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -258,6 +258,35 @@ Here is an example:
                         clock_get_ns(dev->my_clk_input));
     }
 
+Calculating expiry deadlines
+----------------------------
+
+A commonly required operation for a clock is to calculate how long
+it will take for the clock to tick N times; this can then be used
+to set a timer expiry deadline. Use the function ``clock_ticks_to_ns()``,
+which takes an unsigned 64-bit count of ticks and returns the length
+of time in nanoseconds required for the clock to tick that many times.
+
+It is important not to try to calculate expiry deadlines using a
+shortcut like multiplying a "period of clock in nanoseconds" value
+by the tick count, because clocks can have periods which are not a
+whole number of nanoseconds, and the accumulated error in the
+multiplication can be significant.
+
+For a clock with a very long period and a large number of ticks,
+the result of this function could in theory be too large to fit in
+a 64-bit value. To avoid overflow in this case, ``clock_ticks_to_ns()``
+saturates the result to INT64_MAX (because this is the largest valid
+input to the QEMUTimer APIs). Since INT64_MAX nanoseconds is almost
+300 years, anything with an expiry later than that is in the "will
+never happen" category. Callers of ``clock_ticks_to_ns()`` should
+therefore generally not special-case the possibility of a saturated
+result but just allow the timer to be set to that far-future value.
+(If you are performing further calculations on the returned value
+rather than simply passing it to a QEMUTimer function like
+``timer_mod_ns()`` then you should be careful to avoid overflow
+in those calculations, of course.)
+
 Changing a clock period
 -----------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 81bcf3e505a..b5fff6ded83 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -16,6 +16,8 @@
 
 #include "qom/object.h"
 #include "qemu/queue.h"
+#include "qemu/host-utils.h"
+#include "qemu/bitops.h"
 
 #define TYPE_CLOCK "clock"
 OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
@@ -218,6 +220,45 @@ static inline unsigned clock_get_ns(Clock *clk)
     return CLOCK_PERIOD_TO_NS(clock_get(clk));
 }
 
+/**
+ * clock_ticks_to_ns:
+ * @clk: the clock to query
+ * @ticks: number of ticks
+ *
+ * Returns the length of time in nanoseconds for this clock
+ * to tick @ticks times. Because a clock can have a period
+ * which is not a whole number of nanoseconds, it is important
+ * to use this function when calculating things like timer
+ * expiry deadlines, rather than attempting to obtain a "period
+ * in nanoseconds" value and then multiplying that by a number
+ * of ticks.
+ *
+ * The result could in theory be too large to fit in a 64-bit
+ * value if the number of ticks and the clock period are both
+ * large; to avoid overflow the result will be saturated to INT64_MAX
+ * (because this is the largest valid input to the QEMUTimer APIs).
+ * Since INT64_MAX nanoseconds is almost 300 years, anything with
+ * an expiry later than that is in the "will never happen" category
+ * and callers can reasonably not special-case the saturated result.
+ */
+static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
+{
+    uint64_t ns_low, ns_high;
+
+    /*
+     * clk->period is the period in units of 2^-32 ns, so
+     * (clk->period * ticks) is the required length of time in those
+     * units, and we can convert to nanoseconds by multiplying by
+     * 2^32, which is the same as shifting the 128-bit multiplication
+     * result right by 32.
+     */
+    mulu64(&ns_low, &ns_high, clk->period, ticks);
+    if (ns_high & MAKE_64BIT_MASK(31, 33)) {
+        return INT64_MAX;
+    }
+    return ns_low >> 32 | ns_high << 32;
+}
+
 /**
  * clock_is_enabled:
  * @clk: a clock
-- 
2.20.1


