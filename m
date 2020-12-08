Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF12D3261
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:51:24 +0100 (CET)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi55-00065M-KV
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhX0-0005L3-OG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:12 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:33197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kmhWt-0007wB-Th
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:16:10 -0500
Received: by mail-wr1-x441.google.com with SMTP id r14so1531568wrn.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UemC5541VEYHf/BEklXFjK6XVs4Wljvyr7YjA/NgPRE=;
 b=oDin9NQ5bjhtkP71wlYo3TFHoeVgTLvAwVdz70K03gZxR3k8aHx9mDe/+1QSzRlczp
 U/UA1phAYfVYHcIEr5LahsDE9gmCqLbG0Xu08NQkcvnAzNXFtkasNoFcpgTQ9L+v02Kv
 3q9k56BDRKQygYVuUR5cGmHSU1k7rYoSkLTWj0zweEXc31+oUvJDT9NdxoV7Xk9EYTBP
 gPP48sSbwSh140aYlCwKy7ZoG2rJ7XGiY1IuoJ99asCmAgboqrkmvOvQ6yokf9nJMsEb
 9wSnJG51sm/HyA91i3U+NpBwswqS7KbuAyLFtQ4FVt4grYHBK41j69F/qYWIBVXbqNAE
 WztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UemC5541VEYHf/BEklXFjK6XVs4Wljvyr7YjA/NgPRE=;
 b=aMhAzMxHZEiJDHoaVyr6qnCTMDE4XRa2zjrdfVfh0mjGG0gikJIsvZBzdkR3oRSyQ7
 +8kvXenk2pz0iGiMQr+V/kb4WioaS3oSq6XMpEQcrh9XJVz3pcnfEJXtsj27nn0MJPGv
 enVsMSgnGkPHWYisBOaCvlvjIIyeNln02sFuSrelNZP0K1W4vkIVdD0t7HqsaotGoZBO
 hW6W3HkSNNqAsbkZpB0dZHhRjsInBD0BFuqm1T8+wALrNUFLCZi/vl7rNzr+T8BC5Nxp
 ojFaX607BrxdMpQwYQjxeHTNbSX6+BQkFIvUeQ1T4VCB6J8pCpWCpeuYbR++USVM3kOO
 Egow==
X-Gm-Message-State: AOAM5339pWVcMsLhbRin5teA6V3qLVGH7jOxfrjUNRWekno/CUDBRt+I
 RGqWf4kU2vaPpQCUwdqQPRGCZwEgGBuiEg==
X-Google-Smtp-Source: ABdhPJx0uGvjUh28BqCCwbaK/jSrZnfNTq+MJVUAX2bGweZQ+dXXOd49beXG+OKQdqIYs3XUFnM3qQ==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr25757550wrq.411.1607451360086; 
 Tue, 08 Dec 2020 10:16:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u12sm4978873wmu.28.2020.12.08.10.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:15:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] clock: Remove clock_get_ns()
Date: Tue,  8 Dec 2020 18:15:53 +0000
Message-Id: <20201208181554.435-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208181554.435-1-peter.maydell@linaro.org>
References: <20201208181554.435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Remove the now-unused clock_get_ns() API and the CLOCK_PERIOD_TO_NS()
macro that only it was using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/clocks.rst | 17 +++++++++++++----
 include/hw/clock.h    |  6 ------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index aebeedbb95e..9a93d1361b4 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -238,8 +238,17 @@ object during device instance init. For example:
 Fetching clock frequency/period
 -------------------------------
 
-To get the current state of a clock, use the functions ``clock_get()``,
-``clock_get_ns()`` or ``clock_get_hz()``.
+To get the current state of a clock, use the functions ``clock_get()``
+or ``clock_get_hz()``.
+
+``clock_get()`` returns the period of the clock in its fully precise
+internal representation, as an unsigned 64-bit integer in units of
+2^-32 nanoseconds. (For many purposes ``clock_ticks_to_ns()`` will
+be more convenient; see the section below on expiry deadlines.)
+
+``clock_get_hz()`` returns the frequency of the clock, rounded to the
+next lowest integer. This implies some inaccuracy due to the rounding,
+so be cautious about using it in calculations.
 
 It is also possible to register a callback on clock frequency changes.
 Here is an example:
@@ -254,8 +263,8 @@ Here is an example:
          */
 
         /* do something with the new period */
-        fprintf(stdout, "device new period is %" PRIu64 "ns\n",
-                        clock_get_ns(dev->my_clk_input));
+        fprintf(stdout, "device new period is %" PRIu64 "* 2^-32 ns\n",
+                        clock_get(dev->my_clk_input));
     }
 
 Calculating expiry deadlines
diff --git a/include/hw/clock.h b/include/hw/clock.h
index a9425d9fb14..9c0b1eb4c3f 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -39,7 +39,6 @@ typedef void ClockCallback(void *opaque);
  * macro helpers to convert to hertz / nanosecond
  */
 #define CLOCK_PERIOD_FROM_NS(ns) ((ns) * (CLOCK_PERIOD_1SEC / 1000000000llu))
-#define CLOCK_PERIOD_TO_NS(per) ((per) / (CLOCK_PERIOD_1SEC / 1000000000llu))
 #define CLOCK_PERIOD_FROM_HZ(hz) (((hz) != 0) ? CLOCK_PERIOD_1SEC / (hz) : 0u)
 #define CLOCK_PERIOD_TO_HZ(per) (((per) != 0) ? CLOCK_PERIOD_1SEC / (per) : 0u)
 
@@ -214,11 +213,6 @@ static inline unsigned clock_get_hz(Clock *clk)
     return CLOCK_PERIOD_TO_HZ(clock_get(clk));
 }
 
-static inline unsigned clock_get_ns(Clock *clk)
-{
-    return CLOCK_PERIOD_TO_NS(clock_get(clk));
-}
-
 /**
  * clock_ticks_to_ns:
  * @clk: the clock to query
-- 
2.20.1


