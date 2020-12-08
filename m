Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5972D3254
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:46:18 +0100 (CET)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi07-0001kw-WF
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:46:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWw-0005Il-6s
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:06 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWq-0007vz-B7
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c198so2804592wmd.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KouZ87yfLRxQM56hfbfm+nYHd9ItiwueK6AEwYEaOMc=;
 b=kc9Hqp/NhJhBbEDZKfwWn+V9FLMNI7zR/FD6Xnj2HUyF9l7MVQjaBa9lebNEtIX7ga
 whPB5Rt63EHvDxNTVvl31qalqWtE3sZaBSTw5hB8H7jlEuVasAT1jvatA8ykgUFBO0IV
 EWHsRutGNtE+HTJJ+2nY0HOoJs/meQyJJAWBbHNe4tOb/h/xVbZkIhLCS15oR2K8mhJo
 JlFSMqC6AWLMsPG9lmfOYdACSSyZ5B+580pVC9On20bX/Iz8b91jQmoY0My8PdgBZvJs
 3anxM2ot/xDuAzm/GYeYjZ9HdG8LS52RfnET6XaZUCfu01pW6jkSWo57hLKUQbtqeJTi
 qGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KouZ87yfLRxQM56hfbfm+nYHd9ItiwueK6AEwYEaOMc=;
 b=McXrFKacJ7pl0GyKInB+FGyj3QoVy5ycGdIEWrX1LASldLAhO+bEF8xW84SIEINmMN
 zdKzKB5t4s/gSqM/+LeIb1u2C6+GHnf1R0bBFTsbytI4ziBMP5hjcWa58fNdkCqpqSXd
 tjpao382ilcO0X+baMCtO2yQoS/26kT8xIgl5uebEKM6dx0L0K3p/Tv0FkfbS4vIHu6i
 CR/K3pZG/mPwTYPZvoB+r4L5cHJZSNjVIJC52IyS8Q0b1fB03jsh0GgGQSx9QjHWRtj8
 OXVid8KrGE10lFI0QLFJHC0wNEmSv5FQNPCH1vELejXn1WjqhcA+gKe4/BNwDcihgIRS
 z7fA==
X-Gm-Message-State: AOAM530af9m618R9zqvUAnudlxTS6Jr1DAtXrO5GXt2fsXD25yJqsVZs
 pylIjv4JtIhcn4rEP9n7U0SNr/ldPzw84A==
X-Google-Smtp-Source: ABdhPJwPpgLnK/wJqOkLEUj4RaghOH8VdRoVJ3szf0qt/85U1J2HM3DZDIrKSs7LgF8OZzuG23bZfg==
X-Received: by 2002:a05:600c:40ca:: with SMTP id
 m10mr4990249wmh.54.1607451357780; 
 Tue, 08 Dec 2020 10:15:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u12sm4978873wmu.28.2020.12.08.10.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:15:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
Date: Tue,  8 Dec 2020 18:15:51 +0000
Message-Id: <20201208181554.435-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208181554.435-1-peter.maydell@linaro.org>
References: <20201208181554.435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
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
---
 docs/devel/clocks.rst | 15 +++++++++++++++
 include/hw/clock.h    | 29 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index e5da28e2111..aebeedbb95e 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -258,6 +258,21 @@ Here is an example:
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
 Changing a clock period
 -----------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 81bcf3e505a..a9425d9fb14 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -16,6 +16,7 @@
 
 #include "qom/object.h"
 #include "qemu/queue.h"
+#include "qemu/host-utils.h"
 
 #define TYPE_CLOCK "clock"
 OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
@@ -218,6 +219,34 @@ static inline unsigned clock_get_ns(Clock *clk)
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
+    return ns_low >> 32 | ns_high << 32;
+}
+
 /**
  * clock_is_enabled:
  * @clk: a clock
-- 
2.20.1


