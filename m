Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CED5905DA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:28:21 +0200 (CEST)
Received: from localhost ([::1]:33932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBym-000699-VB
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0006q6-HQ
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnF-0000u6-Vf
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h13so22075109wrf.6
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=nkPgesIJ7tHWPAYMw0IGC2hbyuZcRqrKpcJIVrclGtI=;
 b=Qp1YDNqmw/vQSXL7KvulLGtEMi7O/ciUVbm5gTwIjEE4yH0ugw/VyyHh42KNGA6l1m
 AVUP7bp7mjSVDL8LdvwPdQRDuEsRNRzr2KcDddEZeKos6V49xbXBPKIwh76dfmcsd89H
 KUKy0vkmUuycTOfLiS7+pYC0Hoi73O9R6dW/Go5nA87Npq0wAAejYyezes3iTaLr8vhj
 a1/HeYXc+frzZMDJg7IGlgOcIniqh17IKSPSKILixDt68TKD5NspZlrcjnS2kY9HTdnj
 A7cBVmu1pC5S1prNTcQy4gxElXGMhKR2fU/rwfqf5YOdlhlf708cIUWtGrnHypIGUWnk
 uDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=nkPgesIJ7tHWPAYMw0IGC2hbyuZcRqrKpcJIVrclGtI=;
 b=dSk8M3pCF17W5KjRL1f8LKzaztACfmFnsC+EDk59djyMLyLJMXlOAVOMJGBkXXFd0R
 MKCEuZYvqCqF89omQHdY85SKGAe0d7/DU22b/+gLuZ0jnjJlcli+kQ1JnJFUN1+AnpZI
 2QveXDk3VI8ALw+R7yjhKN8UFgXDSKeJ+pn32WY+zPYvL6lzHhMJ8X5JACqNlq9DwMy/
 U4kUv6n2qrXlepULcnaDrm2xQZKRaSrP767hJ6nNJZO0ZeRW6eRnwzuKfGEqPnSiUb9y
 P1FkE5GND5NmmtJGzqOpy2VhXeBDg13fPbW6E+zSY5yDUZZon0+cgFeFLVaMYLVFE+Ha
 KFmg==
X-Gm-Message-State: ACgBeo0lz88VAVXjYk/+HgDbZBFs/WJ5iG7yYqgZOp2oMLO2jgebO5+x
 3OIMz5o3YoTmiKFap45WBCWqmpr1s+LfQw==
X-Google-Smtp-Source: AA6agR6dW5Si8i+KY6Md0lHNlyrB0uRyi3L7oZfc2ny9ek6L/Du4GMX2vW2Y+eMBWnzELYZpFPVbcA==
X-Received: by 2002:a5d:4907:0:b0:21f:bc42:989 with SMTP id
 x7-20020a5d4907000000b0021fbc420989mr7445wrq.375.1660238184570; 
 Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/10] target/arm: Ignore PMCR.D when PMCR.LC is set
Date: Thu, 11 Aug 2022 18:16:13 +0100
Message-Id: <20220811171619.1154755-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 target/arm/helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7a367371921..41def52cf7b 100644
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


