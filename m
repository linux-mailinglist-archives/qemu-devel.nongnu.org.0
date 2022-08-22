Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8659C0AB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:35:13 +0200 (CEST)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7aC-0003DH-Sv
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PU-0005yb-NW
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PS-0001eY-51
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id n4so13189693wrp.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aFjhTAogUKZHPlT633nMjBBSLixPxUKktQV7BA0xzwY=;
 b=SZEbkUyO8ke8oO6QGqEB8mbtGeHhXYHlX1SlPwJZYpKl20hS48Wd7D/+bnMdP/wyq/
 ro52b0f0Nz+G/UdiUYK/29aM6ZDzcCOeyKSJhQ4hKo4bvSxI/rbJvxAGGJWl3MFA7qvA
 +8YJWUW5mSGRUyZom9VcUsBr+mvz9IWKIB+Cq274ysjRQIbQE+N7jPxLIUHU+SFPI23y
 pwm7n3x8XR4/LJo3ikPlEZ/tkZelw3OQz2q2g4FXdXzgTaMUu59d8wiSBcJXMMOgwXW6
 k6mcOdyFmWXb+Dy8rw0ng8uLEE2l3S5NMO0DnBYaVTepAKxaD1oiPpyRY+Hpu1ZY/f1r
 FxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aFjhTAogUKZHPlT633nMjBBSLixPxUKktQV7BA0xzwY=;
 b=CvzOXq01LTEYpiFCx68r18AM8nkM0MTlrIhW8ASSqyeqNQVOEOYutbNWnnvev1rnBg
 7c6vgYml+fkbvVr3Kl1JD5ysEbcdXvVpKzI65epy1+7Hwivr8BqULDGU6b0s0EgHyhiT
 nbqEOktwD6f/mdmPMAgHpJ/5K0dXERBmA57/Q4Em9QfBNuzMk68jDhHNHfkq0L7x/HTG
 o4ubV1QoLqXRcnmcL57Awek+mkhqXtagS6KOy7dJl08kCJ9ck8yWsM/vPoDrnX+EXKHj
 bGzigRYtMVZdBxac1d1CEmBu8m1P6dh5hKErHeqe+kuvqrUMIfXqxEI3O53NMFEXm8Vd
 jneg==
X-Gm-Message-State: ACgBeo360N2R91v5fOUuoY+p/dPmdBZMLL9Uz3lljbvtCq1v21X1PcWn
 fT4hChFHiAYw5Oclg02w8ezKFg==
X-Google-Smtp-Source: AA6agR51n+pWd9Jtp8SMbmp5JywGVBTcTwQvX+ilJsde/TL8pR6THFT1ZjPto/67ufRLAnI2GFpBqA==
X-Received: by 2002:a5d:59ad:0:b0:225:5b64:8c6a with SMTP id
 p13-20020a5d59ad000000b002255b648c6amr2091290wrr.558.1661174644731; 
 Mon, 22 Aug 2022 06:24:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/10] target/arm: Ignore PMCR.D when PMCR.LC is set
Date: Mon, 22 Aug 2022 14:23:52 +0100
Message-Id: <20220822132358.3524971-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The architecture requires that if PMCR.LC is set (for a 64-bit cycle
counter) then PMCR.D (which enables the clock divider so the counter
ticks every 64 cycles rather than every cycle) should be ignored.  We
were always honouring PMCR.D; fix the bug so we correctly ignore it
in this situation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 59e1280a9cd..f2bf1c52eb2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1172,6 +1172,17 @@ static void pmu_update_irq(CPUARMState *env)
             (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
 }
 
+static bool pmccntr_clockdiv_enabled(CPUARMState *env)
+{
+    /*
+     * Return true if the clock divider is enabled and the cycle counter
+     * is supposed to tick only once every 64 clock cycles. This is
+     * controlled by PMCR.D, but if PMCR.LC is set to enable the long
+     * (64-bit) cycle counter PMCR.D has no effect.
+     */
+    return (env->cp15.c9_pmcr & (PMCRD | PMCRLC)) == PMCRD;
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1184,8 +1195,7 @@ static void pmccntr_op_start(CPUARMState *env)
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             eff_cycles /= 64;
         }
 
@@ -1228,8 +1238,7 @@ static void pmccntr_op_finish(CPUARMState *env)
 #endif
 
         uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
-        if (env->cp15.c9_pmcr & PMCRD) {
-            /* Increment once every 64 processor clock cycles */
+        if (pmccntr_clockdiv_enabled(env)) {
             prev_cycles /= 64;
         }
         env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
-- 
2.25.1


