Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F331FB6C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:53:51 +0100 (CET)
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7AE-0000Sl-U5
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73C-00020Q-OK
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD734-0003MF-Jx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:34 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so7861444wmh.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a11pg5cH1ykxEu6V8jLMW9ZxX3RV9/5IG0HAgyAT898=;
 b=bNDZxpGNQsX9JBhRw6fzBVnXo3cFurIa2B5ma421Md8RwMwQ0pMkZqCEc5cPQtAxEk
 PZ2N0LHEHw8/5vZUv6EjarjI4dY8fo1WrjE/RmpTk5p3CTY4u+EzfksFTnMbsxF/E8lz
 l5o9Zt0N+5GsT3p+2b+k7ScBhWq8moirp7mEJZAAIB4C6UTajw/y9Xgj1b3DZISIiNd1
 02iUzrEX2BUwDNLH3t46oYRaQJRQuUNaUQPklEaCFGhFZ0q3QnC53Jpk7+0v+fyuxyoB
 I/G3pR4g2nCLinZ2IxVmYrLlZftK5qH/RpMYxyQofdQyL1w6LW/2eiBAbMs6aU6y4e83
 rEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a11pg5cH1ykxEu6V8jLMW9ZxX3RV9/5IG0HAgyAT898=;
 b=gLqYAXOkxLq5lANduZ7uNq9orU2molk2ZYg7taSh8wP5TbijgaANl3YTbRGKYpMbpY
 Rw4Wdv5PZ+NVafL03xdVzf0yjEfscRPKEDXPmcUh2AelqQuVXr8W1FkYDM/cpcrEG3Sb
 2amV/2X4zLUDWZt3ku/q+rQKpKQFP0RSyoK4+DDx5IMIf38XfqxgKUHVay1urvugo3/M
 2vOejjUd+mXl1ntQvzYIZbj81aJfoofvO6bk03l2TmVAhuFOQ1KNgc9W2iG5nwqoPjzs
 4kPDVZuwzOYaVVwzJ8bHClMkS2V6F559q4AlMuSXzBq8j9GDJC+eSNoGYTS6y79vkd13
 DTig==
X-Gm-Message-State: AOAM533NoijMi8reh0eJta8BF902JWrOYn+1mH6fYbZEgfy+LZBzkNRb
 51+8keSDXv9G6Sxpx7n5kHY3cl97LbU3ng==
X-Google-Smtp-Source: ABdhPJzazil8Coabza58SvKcUBklDyCHd9xjgWWNJWsUWx0bQYn1QyPpf5ZoqhJOjjWWHROaGwUtuw==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr1315419wmi.88.1613745982798; 
 Fri, 19 Feb 2021 06:46:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/44] clock: Add clock_ns_to_ticks() function
Date: Fri, 19 Feb 2021 14:45:36 +0000
Message-Id: <20210219144617.4782-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
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

Add a clock_ns_to_ticks() function which does the opposite of
clock_ticks_to_ns(): given a duration in nanoseconds, it returns the
number of clock ticks that would happen in that time.  This is useful
for devices that have a free running counter register whose value can
be calculated when it is read.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


