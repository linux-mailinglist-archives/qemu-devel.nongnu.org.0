Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D1933152A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:48:18 +0100 (CET)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJzN-0006Ah-2f
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkT-0006M2-1l
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:53 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkQ-00070R-KS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so12314616wrx.9
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m72i3N4bhV3HJNg5ssW7cvnHIXQkIdx9ydwrNtFfVag=;
 b=GtLwA//2u8oYzkSH/e+zFuv6vH+BpLC0NpSbG15rW/LfQ5XS53ejVxp5Z9ejrrqARP
 1qLZMXb2RmuHL/R5AcZsOeA/bypCyk7P9wCYjXikCBf4fQWTVD6ssmR+dl4hGBopJ5OJ
 RP9p2iKQMQW+8VvEP3o4GsaMUsUyhjcSiTLuFIMn/SaZKSHd95/lGTMmFGqRowbclgls
 BwxEh1n8NEEqg2zBu23GeFMVeg7gjjI+Puuvo2gyMCxY/Qh+tG44r6P2ZB92dmNH22vC
 BAexHpAJLGFcHdr7xbXj5jSeXmsNFjaRLcsjNARZo1+4CqAySR3XQLpo1bPYDSViM+hY
 vAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m72i3N4bhV3HJNg5ssW7cvnHIXQkIdx9ydwrNtFfVag=;
 b=kBOYJiEV06KfM6YjQog0mH0jaaAdJ6BbGbWqQZtTerIw31l/kabymCQ19eD2X1tGqu
 mXBS592lbcZiKzWtUgjS7up/aTHvr3pUXSKehR9szBZ3al206laHGI8iGBZgLAm/VZuA
 n4foOiRIK+f1p1nRJ110py3TnI0XYdh/pmXIK+J7aLAdUs9nhDUqqwXTEfpJOFweMlDk
 KsdF0KnnP7aCqHzRuZLiLZfmpz5SeuJYDFgwcHHdT+qOzcz+jwJKHw5CUpGvF7G2J+Uz
 kmDvwe/CyYfsM8DoalaCXdrZBdx3PybbcQbY3XQy/kKNzcZxC6B/zcPVjVnpNw3qAqNg
 N2xw==
X-Gm-Message-State: AOAM533rOBlrxGNeEoGyEf6Nr/UOGA/e7C667DBPreMqlF0K67wAXfsy
 8Cg7ezg2ewkeuBvk9KbkyMSL/dFIWZMFPA==
X-Google-Smtp-Source: ABdhPJzgYexxFrRJ1sMT6rSqIlH7dl88SKM3CAumJHLuVoPLDKFlKX9Y/qiz1pSueqxYmKytYPmTcg==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr13401087wrt.294.1615224768989; 
 Mon, 08 Mar 2021 09:32:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/54] clock: Add clock_ns_to_ticks() function
Date: Mon,  8 Mar 2021 17:31:53 +0000
Message-Id: <20210308173244.20710-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Add a clock_ns_to_ticks() function which does the opposite of
clock_ticks_to_ns(): given a duration in nanoseconds, it returns the
number of clock ticks that would happen in that time.  This is useful
for devices that have a free running counter register whose value can
be calculated when it is read.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219144617.4782-4-peter.maydell@linaro.org
---
 docs/devel/clocks.rst | 12 ++++++++++++
 include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index f0391e76b4f..956bd147ea0 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -360,6 +360,18 @@ rather than simply passing it to a QEMUTimer function like
 ``timer_mod_ns()`` then you should be careful to avoid overflow
 in those calculations, of course.)
 
+Obtaining tick counts
+---------------------
+
+For calculations where you need to know the number of ticks in
+a given duration, use ``clock_ns_to_ticks()``. This function handles
+possible non-whole-number-of-nanoseconds periods and avoids
+potential rounding errors. It will return '0' if the clock is stopped
+(i.e. it has period zero). If the inputs imply a tick count that
+overflows a 64-bit value (a very long duration for a clock with a
+very short period) the output value is truncated, so effectively
+the 64-bit output wraps around.
+
 Changing a clock period
 -----------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 2ba44e14424..a7187eab95e 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -286,6 +286,47 @@ static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
     return ns_low >> 32 | ns_high << 32;
 }
 
+/**
+ * clock_ns_to_ticks:
+ * @clk: the clock to query
+ * @ns: duration in nanoseconds
+ *
+ * Returns the number of ticks this clock would make in the given
+ * number of nanoseconds. Because a clock can have a period which
+ * is not a whole number of nanoseconds, it is important to use this
+ * function rather than attempting to obtain a "period in nanoseconds"
+ * value and then dividing the duration by that value.
+ *
+ * If the clock is stopped (ie it has period zero), returns 0.
+ *
+ * For some inputs the result could overflow a 64-bit value (because
+ * the clock's period is short and the duration is long). In these
+ * cases we truncate the result to a 64-bit value. This is on the
+ * assumption that generally the result is going to be used to report
+ * a 32-bit or 64-bit guest register value, so wrapping either cannot
+ * happen or is the desired behaviour.
+ */
+static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
+{
+    /*
+     * ticks = duration_in_ns / period_in_ns
+     *       = ns / (period / 2^32)
+     *       = (ns * 2^32) / period
+     * The hi, lo inputs to divu128() are (ns << 32) as a 128 bit value.
+     */
+    uint64_t lo = ns << 32;
+    uint64_t hi = ns >> 32;
+    if (clk->period == 0) {
+        return 0;
+    }
+    /*
+     * Ignore divu128() return value as we've caught div-by-zero and don't
+     * need different behaviour for overflow.
+     */
+    divu128(&lo, &hi, clk->period);
+    return lo;
+}
+
 /**
  * clock_is_enabled:
  * @clk: a clock
-- 
2.20.1


