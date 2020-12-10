Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7B2D59EC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:02:24 +0100 (CET)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKeN-0005ME-73
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR6-0001c5-FT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQw-00078M-Ax
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id i9so5163884wrc.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7GwpflhCK6BEL2dQQRRYORmq+XU3L/lXbqS48LePEFY=;
 b=wKbhhmppBJVEgdRX+LbA4IdSe1Gk3fgge345SnWABNAWWNCwa/2m5F/K8EQHYgQnhf
 MZ+aSB0tqvc7brja8BtwCj2GmSICAEZm3cWGYHuMOfXhgrDho0ndjPx6OQO5J5dI4E4r
 vgqQ6GkuRjAtcpaNdSGG8C4p91oPINMQ1QpvCI9xyKOFFr/BEiVRXXOwS7V4/2NNtGkI
 Yt2M0/36nxya7/Nl7Xhz8oKQQ3t0d3NcULfPmrtNfVmwkPhkhhg3pSH4Tdsi9OZ6FmLk
 mC6hJ7sMsovzkEdVaIEXNEYGah40o75nOjMRyqms5Bps5IJbGHoA+KiVaPbQA1VF69+h
 VIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GwpflhCK6BEL2dQQRRYORmq+XU3L/lXbqS48LePEFY=;
 b=HbT+y3rDrgzh//RDGOOxCHj125QN2KX8WFRpR9yMP0TRFT3HhZCmm96GRBKzGcWdeB
 korkGb+ztIEXRqCPd9jhBZRhoRphYvoju3i4JNFAJh2H8ctjNowyIdx1Vqpd85m9unIy
 /8EOoNO2rX5647vhd01YXtiF+GxIEkWmNE4MGWGvwm6BkBc2buu40Dm4GazIzH9qmRSv
 +mFuAfQ6yruE9g8QlLV8p7ZIWT9TXi0qJE9AK7t63h+iwwutIjlF7tGnx5ER6Xj9DMy4
 ZgUyyLTGYO4m3vbH2vct8W4k1HNnFfZEu5NFYF4X7ItmLcwHo6AnNijyUrpVAqb/JHco
 +N8w==
X-Gm-Message-State: AOAM531yEIURA+ImB/kdcfHHf91zWHJpwliAD1918UeShxPi8V9+DIsA
 DKwvYbylWbiF/wAcuY9jYTZ90pob18tOZA==
X-Google-Smtp-Source: ABdhPJx05Wm1xI60vWoBlt60l7w1KbtTcglD0ve5Q14OWrV0scGQXS4lO4ds3uK+1/qAE38wseXTlw==
X-Received: by 2002:adf:e44d:: with SMTP id t13mr7758771wrm.144.1607600908547; 
 Thu, 10 Dec 2020 03:48:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/36] target/arm: For v8.1M, always clear R0-R3, R12, APSR,
 EPSR on exception entry
Date: Thu, 10 Dec 2020 11:47:46 +0000
Message-Id: <20201210114756.16501-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

In v8.0M, on exception entry the registers R0-R3, R12, APSR and EPSR
are zeroed for an exception taken to Non-secure state; for an
exception taken to Secure state they become UNKNOWN, and we chose to
leave them at their previous values.

In v8.1M the behaviour is specified more tightly and these registers
are always zeroed regardless of the security state that the exception
targets (see rule R_KPZV).  Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-17-peter.maydell@linaro.org
---
 target/arm/m_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index aad01ea0127..721b4b4896e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -897,10 +897,12 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
          * Clear registers if necessary to prevent non-secure exception
          * code being able to see register values from secure code.
          * Where register values become architecturally UNKNOWN we leave
-         * them with their previous values.
+         * them with their previous values. v8.1M is tighter than v8.0M
+         * here and always zeroes the caller-saved registers regardless
+         * of the security state the exception is targeting.
          */
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            if (!targets_secure) {
+            if (!targets_secure || arm_feature(env, ARM_FEATURE_V8_1M)) {
                 /*
                  * Always clear the caller-saved registers (they have been
                  * pushed to the stack earlier in v7m_push_stack()).
@@ -909,10 +911,16 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
                  * v7m_push_callee_stack()).
                  */
                 int i;
+                /*
+                 * r4..r11 are callee-saves, zero only if background
+                 * state was Secure (EXCRET.S == 1) and exception
+                 * targets Non-secure state
+                 */
+                bool zero_callee_saves = !targets_secure &&
+                    (lr & R_V7M_EXCRET_S_MASK);
 
                 for (i = 0; i < 13; i++) {
-                    /* r4..r11 are callee-saves, zero only if EXCRET.S == 1 */
-                    if (i < 4 || i > 11 || (lr & R_V7M_EXCRET_S_MASK)) {
+                    if (i < 4 || i > 11 || zero_callee_saves) {
                         env->regs[i] = 0;
                     }
                 }
-- 
2.20.1


