Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA52DAFD3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:12:33 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpC08-0008Ak-BK
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxK-0005KC-W4
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:39 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:32968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpBxI-0000kw-VF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:09:38 -0500
Received: by mail-wm1-x341.google.com with SMTP id n16so98294wmc.0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSKE1KtRg1W0oTZN5C+68UidN1xnNarWeSnPqZ3lXqU=;
 b=eI52u3Xh752eohMFk8DYyQL6qDGig5gGrTUa/IhsRymE3ZCep3ZwmCE7JhsCPAO85v
 s3QThh3dASpctNqY9/XV6BjiWQixoykZ6YNV24ReuO4fcjgXkafMaOpRy2+4IS3Gt5tx
 lpREaxd9PmPeKOMYCu6xH8cNeAE2FNTESbjNt4BS6R94PVrWjZKaq6XggrLDjXUl3sCg
 O2waeUJj05vCiTwNfbsWkGrchaf+/HMZsOCGT23KiRj/RXXjEZhv5sfkseICxE7h/+D2
 K4bQ8dsT1nvVeFlB/3sOjG/TUti2eGyM1Zkzgpp59ktyVBsu1yKiNfDuw+lBXMCY6YTc
 LYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSKE1KtRg1W0oTZN5C+68UidN1xnNarWeSnPqZ3lXqU=;
 b=dGg44I3SwWEgTOAfIzLvBc8zS9crn75QIn1+SO5w43FH/DSOIYjOZzd5Cs/o6vTz4G
 J3j2AzoKEkbfFUmICeYOyDvZiuao/GNh0KvoxWrxc3AePclQN78xtCgofyVXAMjvRxy6
 fFK/6D1xHfZF0vaNl7GmVmlMgB24zZzP0YzzfEMwSlB7jG1PdsilGvt4cc7gfwK3dDHp
 7gayJhzAPMhi3CrJIWdRV7y1foPBUxKsMv9/bf3rB7kqOnN+shcOhCQ8kK/1ZwqDRcEV
 8ZCVjfov5PXPyZcmBTTpHMpP/2kI3Mb5mAjKaS445BhLrWH4Z6eY/xOFoFcGYZX9nxCk
 mHzw==
X-Gm-Message-State: AOAM532r9hKeon8pZdYtnb3kTxAoxnS0W8rUSjFhFc0Fk8TIZboif8JD
 nHNk1LOdcLzg0WuoIC5KOooY3GK4KCZAbA==
X-Google-Smtp-Source: ABdhPJxNFBdoUbhVO63HSwU4kpivSsRqVGeMaafh8/1itKxTvP8AZjsmgg5TIPiJxsx8fhJBXjPiKw==
X-Received: by 2002:a1c:63d4:: with SMTP id x203mr32264777wmb.28.1608044975299; 
 Tue, 15 Dec 2020 07:09:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l1sm36930593wmi.15.2020.12.15.07.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:09:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] clock: Remove clock_get_ns()
Date: Tue, 15 Dec 2020 15:09:28 +0000
Message-Id: <20201215150929.30311-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215150929.30311-1-peter.maydell@linaro.org>
References: <20201215150929.30311-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
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

Remove the now-unused clock_get_ns() API and the CLOCK_PERIOD_TO_NS()
macro that only it was using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
---
 docs/devel/clocks.rst | 17 +++++++++++++----
 include/hw/clock.h    |  6 ------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index c2e70e64db1..2d317ff32f2 100644
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
index b5fff6ded83..852c636961e 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -40,7 +40,6 @@ typedef void ClockCallback(void *opaque);
  * macro helpers to convert to hertz / nanosecond
  */
 #define CLOCK_PERIOD_FROM_NS(ns) ((ns) * (CLOCK_PERIOD_1SEC / 1000000000llu))
-#define CLOCK_PERIOD_TO_NS(per) ((per) / (CLOCK_PERIOD_1SEC / 1000000000llu))
 #define CLOCK_PERIOD_FROM_HZ(hz) (((hz) != 0) ? CLOCK_PERIOD_1SEC / (hz) : 0u)
 #define CLOCK_PERIOD_TO_HZ(per) (((per) != 0) ? CLOCK_PERIOD_1SEC / (per) : 0u)
 
@@ -215,11 +214,6 @@ static inline unsigned clock_get_hz(Clock *clk)
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


