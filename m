Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365F2D5A5E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:22:06 +0100 (CET)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKxR-00038h-E9
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKRD-0001mG-A7
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR3-00079l-Hn
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id e25so5001230wme.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wNSRJGyldygLkHXGOyWkQbluCZKj4TF1SYWL45tCAa8=;
 b=CWXB1MuOIxJTsPBYh3s27M6PZntp281ZydzRtKV73+ISQ+OjpxC4uAIe3HuXCPWB+V
 kCpLBoyky+8pH+FKm3exEuU05q2JcgxH0Y9jfNHe0+2RRZTV0B4mGlrZtX98XCO+11HE
 3TnsMRTGAHUi0paWT0g7Tu50rvrxwLxYvU3NSkIybvCFdD7t9vSVfkcZKMd9RLFZEnIe
 ztgTvcSMB9FGphYsUMeR693sSZH56z2HcTzkhaao86ee0Jrgybo9O/ki2dWoc0Oytt5E
 TJKvZP9ycdv1ZSmPBrcYGXeZXtd/3cfcV735vcbLHkDJzrpKyhF8qyAUNY1zS6cn/bhu
 LoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNSRJGyldygLkHXGOyWkQbluCZKj4TF1SYWL45tCAa8=;
 b=Q2Ln7Uwdt8/cooUU/zHLPnkIasD/LvDh0ghVRd7j7AlQyy4w1M/hYgqD6cBOfsmzRw
 taPqlM0Zz8bcSyyNrCUxxNm46EzLkNXGyoIfyUVJuT9/XNzM1eaEwzF15pahMLxWRmwz
 tzBHcr17KsMvslpD/eiT/4eGnThZSgYm26Sy3hL7gCM5dyp+oD8xumUAR9EJ+gjRQoha
 Tvy/q0LIjwxFAwVTuxTCGWasgA6t1LQu/8H6pqCgqZZGobJaKYcyqtdAGTAa+K4cFigr
 2RIRbnJDAjt05f0+2FJb31OArsT+zykkrer0byaHa1UzzTFTwVG5yj6mrfg6YJobe+jj
 6Wig==
X-Gm-Message-State: AOAM532d9v5wBZ4Tau70/4BH4TVrS86GjrtGcjZIj3PtoRjzxtcYvzLp
 ysX6GtGfUw0D1Q1kS3cULGJkmVpFHtkC+A==
X-Google-Smtp-Source: ABdhPJz9h0q4Ex13PqPjspoygjgXZ9iT/v/1kDvgvPQzC65zCHtpkovj2QXAK+KgDHcDJtG7XYbinQ==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr7694288wme.44.1607600915950;
 Thu, 10 Dec 2020 03:48:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/36] hw/intc/armv7m_nvic: Fix "return from inactive handler"
 check
Date: Thu, 10 Dec 2020 11:47:53 +0000
Message-Id: <20201210114756.16501-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

In commit 077d7449100d824a4 we added code to handle the v8M
requirement that returns from NMI or HardFault forcibly deactivate
those exceptions regardless of what interrupt the guest is trying to
deactivate.  Unfortunately this broke the handling of the "illegal
exception return because the returning exception number is not
active" check for those cases.  In the pseudocode this test is done
on the exception the guest asks to return from, but because our
implementation was doing this in armv7m_nvic_complete_irq() after the
new "deactivate NMI/HardFault regardless" code we ended up doing the
test on the VecInfo for that exception instead, which usually meant
failing to raise the illegal exception return fault.

In the case for "configurable exception targeting the opposite
security state" we detected the illegal-return case but went ahead
and deactivated the VecInfo anyway, which is wrong because that is
the VecInfo for the other security state.

Rearrange the code so that we first identify the illegal return
cases, then see if we really need to deactivate NMI or HardFault
instead, and finally do the deactivation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-25-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 59 +++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 6f94f88a795..cf233c05616 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -832,10 +832,40 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
 {
     NVICState *s = (NVICState *)opaque;
     VecInfo *vec = NULL;
-    int ret;
+    int ret = 0;
 
     assert(irq > ARMV7M_EXCP_RESET && irq < s->num_irq);
 
+    trace_nvic_complete_irq(irq, secure);
+
+    if (secure && exc_is_banked(irq)) {
+        vec = &s->sec_vectors[irq];
+    } else {
+        vec = &s->vectors[irq];
+    }
+
+    /*
+     * Identify illegal exception return cases. We can't immediately
+     * return at this point because we still need to deactivate
+     * (either this exception or NMI/HardFault) first.
+     */
+    if (!exc_is_banked(irq) && exc_targets_secure(s, irq) != secure) {
+        /*
+         * Return from a configurable exception targeting the opposite
+         * security state from the one we're trying to complete it for.
+         * Clear vec because it's not really the VecInfo for this
+         * (irq, secstate) so we mustn't deactivate it.
+         */
+        ret = -1;
+        vec = NULL;
+    } else if (!vec->active) {
+        /* Return from an inactive interrupt */
+        ret = -1;
+    } else {
+        /* Legal return, we will return the RETTOBASE bit value to the caller */
+        ret = nvic_rettobase(s);
+    }
+
     /*
      * For negative priorities, v8M will forcibly deactivate the appropriate
      * NMI or HardFault regardless of what interrupt we're being asked to
@@ -865,32 +895,7 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
     }
 
     if (!vec) {
-        if (secure && exc_is_banked(irq)) {
-            vec = &s->sec_vectors[irq];
-        } else {
-            vec = &s->vectors[irq];
-        }
-    }
-
-    trace_nvic_complete_irq(irq, secure);
-
-    if (!vec->active) {
-        /* Tell the caller this was an illegal exception return */
-        return -1;
-    }
-
-    /*
-     * If this is a configurable exception and it is currently
-     * targeting the opposite security state from the one we're trying
-     * to complete it for, this counts as an illegal exception return.
-     * We still need to deactivate whatever vector the logic above has
-     * selected, though, as it might not be the same as the one for the
-     * requested exception number.
-     */
-    if (!exc_is_banked(irq) && exc_targets_secure(s, irq) != secure) {
-        ret = -1;
-    } else {
-        ret = nvic_rettobase(s);
+        return ret;
     }
 
     vec->active = 0;
-- 
2.20.1


