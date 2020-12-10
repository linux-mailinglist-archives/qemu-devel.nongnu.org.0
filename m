Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916522D5A11
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:12:46 +0100 (CET)
Received: from localhost ([::1]:35636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKoP-0000y8-Ij
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR8-0001gD-RL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:42 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR0-00078q-BF
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:42 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m5so5154036wrx.9
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z717ki7dYMmiKcMEWYBMDmmyMdFhoLlq4Y+YjRsXmOI=;
 b=PyAC70+11+DXDVN0hrYa1h8+gRZ9DGiWRfLqhKqcr1OoyXnL8sA27U+a08j7pa73GO
 Uloe+h13QJgzFMRLPeVjPPViQkYA2HRfizfvvGzjKPAMF2VKtwmyMJKjjooSiSoT4ujV
 ZavniwHf1nxKQ6j6oiNK5Lz/vW+QBDzqRNue9KzPvR5hoxU4QBBs4g2c717eiRWu6DBQ
 v5KQP6Tcd01tuknvnXckZaqWugqC41AOaNbpkX0C02Ezz3tCQTDAK/VCBm/mKdQ1b1by
 NUUaZENrcHDcVNVSZm1RraNY+zHM9oq0DuJu3XPZpLnEKUj+YUHh5+tJ5KJ9uSBo+fTv
 Ir7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z717ki7dYMmiKcMEWYBMDmmyMdFhoLlq4Y+YjRsXmOI=;
 b=q3z/9yfT7Q4H0Nf/OVnaa+OIIdwShip+tK0qXV6Kzl+KoB6yRtfB4eBVXVJ+CmGx1F
 boa23tif1Rvte/rJClRAUyOsiLMiVstMfe+CFSkKfNYpfca/MP9dvF/iJcurpacEDPYk
 Z4F4GeSLjqVsu6BTAulqeopofcUlg1YgHQWq93852y/k5W3e6AHA8TGUc37OmoozxPQn
 bCc4Gp3Y+L2TqaHfymrfeDA/DS7AQbS3F3+SI04ZKTV8003LQ7WuEKSGMB5+Q/MOB+We
 YdJNYXYgSIlR421a7/udTX39tcFrziLYgN1B1/QVXd1jnQh7oTsvsvsgB/DupETtiagU
 j5hA==
X-Gm-Message-State: AOAM5311K1XXsTP2HDkL48hN2HByhhuWhCnSBaZ6Z8AynMcniyg6TY5e
 7s4udzbt15/3L+CGsrSOT9LHISYug/oQmA==
X-Google-Smtp-Source: ABdhPJyonpJk+4S0+TWXrZIqO9iY+rQfz+gm+Z8XU+o6Bvt4+4Ye5Gj4UC44iyLusQBR3XMOgxqrjg==
X-Received: by 2002:adf:aad3:: with SMTP id i19mr7638540wrc.119.1607600911732; 
 Thu, 10 Dec 2020 03:48:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/36] target/arm: Implement new v8.1M NOCP check for exception
 return
Date: Thu, 10 Dec 2020 11:47:49 +0000
Message-Id: <20201210114756.16501-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

In v8.1M a new exception return check is added which may cause a NOCP
UsageFault (see rule R_XLTP): before we clear s0..s15 and the FPSCR
we must check whether access to CP10 from the Security state of the
returning exception is disabled; if it is then we must take a fault.

(Note that for our implementation CPPWR is always RAZ/WI and so can
never cause CP10 accesses to fail.)

The other v8.1M change to this register-clearing code is that if MVE
is implemented VPR must also be cleared, so add a TODO comment to
that effect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-20-peter.maydell@linaro.org
---
 target/arm/m_helper.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 9cdc8a64c29..0bdd3cc10e9 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1515,7 +1515,27 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             v7m_exception_taken(cpu, excret, true, false);
             return;
         } else {
-            /* Clear s0..s15 and FPSCR */
+            if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+                /* v8.1M adds this NOCP check */
+                bool nsacr_pass = exc_secure ||
+                    extract32(env->v7m.nsacr, 10, 1);
+                bool cpacr_pass = v7m_cpacr_pass(env, exc_secure, true);
+                if (!nsacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, true);
+                    env->v7m.cfsr[M_REG_S] |= R_V7M_CFSR_NOCP_MASK;
+                    qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                        "stackframe: NSACR prevents clearing FPU registers\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                } else if (!cpacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                            exc_secure);
+                    env->v7m.cfsr[exc_secure] |= R_V7M_CFSR_NOCP_MASK;
+                    qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                        "stackframe: CPACR prevents clearing FPU registers\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                }
+            }
+            /* Clear s0..s15 and FPSCR; TODO also VPR when MVE is implemented */
             int i;
 
             for (i = 0; i < 16; i += 2) {
-- 
2.20.1


