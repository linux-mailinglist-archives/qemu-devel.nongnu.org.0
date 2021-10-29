Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D343F631
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:35:59 +0200 (CEST)
Received: from localhost ([::1]:46018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJcU-0006RC-7u
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaD-0003YB-Fn
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaA-0007sf-JB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:37 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t11so5980662plq.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gpScl65wVWh40rtgvF//HQkNAyWxKHoUtY2gI/pE7T4=;
 b=ixqajzpwLDgdLCneDCprSZu/daw37xLbwN4asO0+FW3lLdZO3aSJBE9VsJiUO7N9ly
 tpuC4LYj7Env9YQXe85Cujo1eRe6udGCg3gNAv/WEIZ3Esk8ADUhwHzDpwfN70xHP56R
 9Ya3Lr1MP3vFxobC4/b1bVzkp94PL0bddVss1UF31np8GkJtR4dqM1FZPRLDNh+r1Fzx
 jqxwAOFrkunovf3MFudzv5FMy/r8MMn4JITUC5NMC7bpzwZhRY4VZJiq8YaETiiGWRel
 r7CApQ3v2sCIlOdrbvezdkNXslnlXdZ/qpXCzjI5q1/ZOsjP/v/ebe1RwsvRCJQTP6cj
 2arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gpScl65wVWh40rtgvF//HQkNAyWxKHoUtY2gI/pE7T4=;
 b=3OJ7VUXb4nsVN49FkkU7zGoqjw6jOev/hVKHLaM3LgGfiW57zdvFPq0Y0hcMI8AWc6
 cI6nhURqtIHT8ABhueB+h+aynwKAkm/4ZEWnxXZwIIUrOt7UEreUBo4H15/xPxrWgRPw
 v69xSTcfRkKsMmG2JB/LMQvcY+CfNHaLljRBNbBbFeIbaoXSqU2wzLplQCugDoh/gfnU
 akRSPrWGL2flxOJGDNOGaL7xR5MvWmgdzWjp0hbRtY1cHdlGs8m/oPDgGiTccJVMGwZC
 Di14ielvU8RsVsRULn8hOfP8ovtOlvZ22OjcWBCcJW8J4YMMBztmaPb8CCVRFPeEX75W
 9Odg==
X-Gm-Message-State: AOAM531wLGPLEFrQgLcw63mi61Ppl0Tx3CaEwI1McLs23iyroUSJFHtg
 lMmqE2J68+lxJyD3O+QtijQtPmsPLfSrtQ==
X-Google-Smtp-Source: ABdhPJyRsThevbjxMLFKUUWm8zGlSbDlUjEWSXnqBfDKHO0DJh9+gRynVXzJZj1QhzIsbLzDnSkVzw==
X-Received: by 2002:a17:90a:644d:: with SMTP id
 y13mr9147137pjm.10.1635482012791; 
 Thu, 28 Oct 2021 21:33:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/60] host-utils: move checks out of divu128/divs128
Date: Thu, 28 Oct 2021 21:32:31 -0700
Message-Id: <20211029043329.1518029-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

In preparation for changing the divu128/divs128 implementations
to allow for quotients larger than 64 bits, move the div-by-zero
and overflow checks to the callers.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211025191154.350831-2-luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/clock.h        |  5 +++--
 include/qemu/host-utils.h | 34 ++++++++++++---------------------
 target/ppc/int_helper.c   | 14 +++++++++-----
 util/host-utils.c         | 40 ++++++++++++++++++---------------------
 4 files changed, 42 insertions(+), 51 deletions(-)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index 11f67fb970..7443e6c4ab 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -324,8 +324,9 @@ static inline uint64_t clock_ns_to_ticks(const Clock *clk, uint64_t ns)
         return 0;
     }
     /*
-     * Ignore divu128() return value as we've caught div-by-zero and don't
-     * need different behaviour for overflow.
+     * BUG: when CONFIG_INT128 is not defined, the current implementation of
+     * divu128 does not return a valid truncated quotient, so the result will
+     * be wrong.
      */
     divu128(&lo, &hi, clk->period);
     return lo;
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index ca9f3f021b..e82e6239af 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -52,36 +52,26 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     return (__int128_t)a * b / c;
 }
 
-static inline int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+static inline void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
 {
-    if (divisor == 0) {
-        return 1;
-    } else {
-        __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
-        __uint128_t result = dividend / divisor;
-        *plow = result;
-        *phigh = dividend % divisor;
-        return result > UINT64_MAX;
-    }
+    __uint128_t dividend = ((__uint128_t)*phigh << 64) | *plow;
+    __uint128_t result = dividend / divisor;
+    *plow = result;
+    *phigh = dividend % divisor;
 }
 
-static inline int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+static inline void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
 {
-    if (divisor == 0) {
-        return 1;
-    } else {
-        __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
-        __int128_t result = dividend / divisor;
-        *plow = result;
-        *phigh = dividend % divisor;
-        return result != *plow;
-    }
+    __int128_t dividend = ((__int128_t)*phigh << 64) | (uint64_t)*plow;
+    __int128_t result = dividend / divisor;
+    *plow = result;
+    *phigh = dividend % divisor;
 }
 #else
 void muls64(uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b);
 void mulu64(uint64_t *plow, uint64_t *phigh, uint64_t a, uint64_t b);
-int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
-int divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
+void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor);
+void divs128(int64_t *plow, int64_t *phigh, int64_t divisor);
 
 static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index f5dac3aa87..510faf24cf 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -104,10 +104,11 @@ uint64_t helper_divdeu(CPUPPCState *env, uint64_t ra, uint64_t rb, uint32_t oe)
     uint64_t rt = 0;
     int overflow = 0;
 
-    overflow = divu128(&rt, &ra, rb);
-
-    if (unlikely(overflow)) {
+    if (unlikely(rb == 0 || ra >= rb)) {
+        overflow = 1;
         rt = 0; /* Undefined */
+    } else {
+        divu128(&rt, &ra, rb);
     }
 
     if (oe) {
@@ -122,10 +123,13 @@ uint64_t helper_divde(CPUPPCState *env, uint64_t rau, uint64_t rbu, uint32_t oe)
     int64_t rt = 0;
     int64_t ra = (int64_t)rau;
     int64_t rb = (int64_t)rbu;
-    int overflow = divs128(&rt, &ra, rb);
+    int overflow = 0;
 
-    if (unlikely(overflow)) {
+    if (unlikely(rb == 0 || uabs64(ra) >= uabs64(rb))) {
+        overflow = 1;
         rt = 0; /* Undefined */
+    } else {
+        divs128(&rt, &ra, rb);
     }
 
     if (oe) {
diff --git a/util/host-utils.c b/util/host-utils.c
index a789a11b46..701a371843 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -86,24 +86,23 @@ void muls64 (uint64_t *plow, uint64_t *phigh, int64_t a, int64_t b)
     *phigh = rh;
 }
 
-/* Unsigned 128x64 division.  Returns 1 if overflow (divide by zero or */
-/* quotient exceeds 64 bits).  Otherwise returns quotient via plow and */
-/* remainder via phigh. */
-int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
+/*
+ * Unsigned 128-by-64 division. Returns quotient via plow and
+ * remainder via phigh.
+ * The result must fit in 64 bits (plow) - otherwise, the result
+ * is undefined.
+ * This function will cause a division by zero if passed a zero divisor.
+ */
+void divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
 {
     uint64_t dhi = *phigh;
     uint64_t dlo = *plow;
     unsigned i;
     uint64_t carry = 0;
 
-    if (divisor == 0) {
-        return 1;
-    } else if (dhi == 0) {
+    if (divisor == 0 || dhi == 0) {
         *plow  = dlo / divisor;
         *phigh = dlo % divisor;
-        return 0;
-    } else if (dhi >= divisor) {
-        return 1;
     } else {
 
         for (i = 0; i < 64; i++) {
@@ -120,15 +119,20 @@ int divu128(uint64_t *plow, uint64_t *phigh, uint64_t divisor)
 
         *plow = dlo;
         *phigh = dhi;
-        return 0;
     }
 }
 
-int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
+/*
+ * Signed 128-by-64 division. Returns quotient via plow and
+ * remainder via phigh.
+ * The result must fit in 64 bits (plow) - otherwise, the result
+ * is undefined.
+ * This function will cause a division by zero if passed a zero divisor.
+ */
+void divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
 {
     int sgn_dvdnd = *phigh < 0;
     int sgn_divsr = divisor < 0;
-    int overflow = 0;
 
     if (sgn_dvdnd) {
         *plow = ~(*plow);
@@ -145,19 +149,11 @@ int divs128(int64_t *plow, int64_t *phigh, int64_t divisor)
         divisor = 0 - divisor;
     }
 
-    overflow = divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
+    divu128((uint64_t *)plow, (uint64_t *)phigh, (uint64_t)divisor);
 
     if (sgn_dvdnd  ^ sgn_divsr) {
         *plow = 0 - *plow;
     }
-
-    if (!overflow) {
-        if ((*plow < 0) ^ (sgn_dvdnd ^ sgn_divsr)) {
-            overflow = 1;
-        }
-    }
-
-    return overflow;
 }
 #endif
 
-- 
2.25.1


