Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D112E8E4A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:08:14 +0100 (CET)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAbl-00057P-80
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMC-000449-I7
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMA-0006By-Ty
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:08 -0500
Received: by mail-wr1-x429.google.com with SMTP id m5so29428791wrx.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DdsNLET2BpxdZf8VQjwnKxo9S8h71JuQHMRBO6qs7tI=;
 b=rBSEI6xmzmEpa53fx2l9KF0RZUTeHaXoiSr1fzEnbG+9ZgJe3fOihKUjOjqA9OdJ5j
 +lAvPncHXgRryST94UdsBHD5f+10TgjJlP0mU+KPwQg8J3w8M+f19sym51AHhU+yla3A
 ZIad6XT26v5k+dtoqBth2UKRhjBCupZkhikCaTRbD6BV8caBiy9nXDWtQVTrAWqMahr3
 WH6YKZV/Puum4R5yo31Ezv7XShU+Lc/HCjMmonhok9SFIef91KzmQ5wF4Sqa1UJEDsf0
 BPYi4XxzUa4EpohXLrUhDRBdHnEgZCF3wZkH73Od0xrqKziLUsjrU7Q7E5aqu4oMQv7N
 ZE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DdsNLET2BpxdZf8VQjwnKxo9S8h71JuQHMRBO6qs7tI=;
 b=dfXisdwxDvXC/18Kgltqg4HBN6rXfimtliYqGGNDere9kPBG5FKV1eDYa1d9qdrN+c
 6yd8XHiSXYWQP4u2nCnJ6zsmXPfRMN3LDfbm2IB1QwmuTEw9fFWJcHe0yyjyVdh41GEQ
 M3+NAOJj2Kpv+aca+45HONNHUKFfbNj38XzwW3/nUnmmjxhfad9TVBV5fPdBQbKb+Bpj
 kOZrCc34+mGIO0S5EZNL3ICSvwZL2o/g0fM08RLJn2zRX9HKL9/ytFeKdT6TD/JmKNAU
 Pk7nsnQhucg1mD3Sorxmd7MNeR3xKl66o4gM7WnFwiw6xbYhbDNVP2GbjxF834/NuOdp
 NEdA==
X-Gm-Message-State: AOAM531cn9ocLGu7ii6BNwb3hwujKf74UtfkRagTamZ6GpHlI51NojLk
 O6bTa6S3ryzd0dwxpftbicCm86H3bEE=
X-Google-Smtp-Source: ABdhPJwBpYDrq9QOVlUU5Z8NuwmE3g2+SXAX1pjeER5y8ZboANiZ+YfjcSvtGB3LV4QjJKgJ6IAtEQ==
X-Received: by 2002:a5d:528a:: with SMTP id c10mr69994916wrv.117.1609707125359; 
 Sun, 03 Jan 2021 12:52:05 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id r1sm90035030wrl.95.2021.01.03.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/35] clock: Remove clock_get_ns()
Date: Sun,  3 Jan 2021 21:50:07 +0100
Message-Id: <20210103205021.2837760-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

Remove the now-unused clock_get_ns() API and the CLOCK_PERIOD_TO_NS()
macro that only it was using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215150929.30311-4-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.26.2


