Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640B2E8E45
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:05:59 +0100 (CET)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAZa-00024l-3W
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAM5-0003kg-8s
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAM2-00068e-BG
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y17so29462909wrr.10
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdHQJwCqOdYJyKNmtS/fZyUmMRQdfAB5wRMdzdWKipA=;
 b=HwYHJYDTTT9fz3lggP7dIYTMzsuwzpdQPoIhTRpZt8Odep4aqgeq1M1vCcSGk6BMxN
 wjpPuYtsgM4u8gSYof+X0cYw045wEGSesiyNvidjKXS1kRLgKCOQXpnVtQUEulVs3d9U
 yS+FuOoPFm5QtsSTH6m3sKw1ic5mNmv+ngB/d5tPgVctJIEIGubmHvKeuHDkWbPVm4xG
 MPIVV+E3jZZ/eVjoO+BzDzMo++p+yWgZo8sDEHtQeUpjq8MQrkhQ1hEArvje38I7v3uO
 3m3XB27y4gjsgMJcTGmxXI3DYxXwqqpsTvoAkj+NRkIHDJKkmGdeuAl0FluyrlFXNgO5
 a5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IdHQJwCqOdYJyKNmtS/fZyUmMRQdfAB5wRMdzdWKipA=;
 b=rU3e55NGqYdP7U1ipc/3ARpkIzmXZ9HJ21ksK/pCY4d4ogTFuuk6D+mnsCRXKed6kl
 dKzwnIShP/5Bym414frFenXe5bXwFB+soolS+kg6FxkFVyoO8oRkze5JQbH8uRSkyg4T
 UASKAmpxl/N/wNLXFVjZ+F50L+NXTvtXbON7WbzNhzdmiJHIVzNO1ZYtggoqZZCe+NI2
 eBzFGJq41cphe3YJufYa0sCX3CNDZpjr9gO/u/kYkc4TqFWxCZNCWpj1PYG9QrzGZKJb
 nHFi05jxccO9zNxo7JPOatXookAnuZYxTvEvr1XLkaHIpkw0SwLRo/7z3Im3JuzrmUon
 vhrA==
X-Gm-Message-State: AOAM530/5HYSPENcUPvD0Br2nJnriTNd8u9M6LmPGmZnZplUonUfA6kT
 hFNCaEnEL28eKiQ0HCBFlJ2Fk9yZPFE=
X-Google-Smtp-Source: ABdhPJy2/sxQWC+xPi4mr8rRCS85dS9tT/eZzjgYUqI5H2zLe8Uge0RuVlVV21/Ktg5AeHIvhFCewg==
X-Received: by 2002:adf:c387:: with SMTP id p7mr76731410wrf.95.1609707115943; 
 Sun, 03 Jan 2021 12:51:55 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id b200sm30290701wmb.10.2021.01.03.12.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/35] clock: Introduce clock_ticks_to_ns()
Date: Sun,  3 Jan 2021 21:50:05 +0100
Message-Id: <20210103205021.2837760-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215150929.30311-2-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.26.2


