Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5222B9D7F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:18:13 +0100 (CET)
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfsFo-00025W-EK
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvJ-00016A-Jg
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:01 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv6-0004Fm-SM
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:01 -0500
Received: by mail-wr1-x444.google.com with SMTP id o15so8013788wru.6
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qhzFhrjKvRUsyJDSYv8WmAYUo+hfPFVK5biMG9ZuE5U=;
 b=nRCltpfiNj8puXdNtUbVovJr2ZSkVIJKxwz1gIuU3ZLTadSYkjYvYVwfzryu8ltrOm
 d3aKVhhbGKrjP9WevHXOLpuyD1e9zGicapjq1Pf4Akz16QL4FBk7NZRSgUWpsphyU9ax
 iDqDRkjf/Hro1ZYHK78svN/WFr6u6u0NxolQvLKPFn8tkyHPLRwiU7Ejcv7zJUWqnpGo
 9ubtkDh7aEuItxACr2SqBisEoN8f5KVpdpN0GjCLKKMi+TYjI/wZJnYn88vRLh9+i12D
 V0XMwRedslP4NI1XR5OfzAqKgCnd7fhdsCm3aY04IDBLN2MFHDbzC+D9rA/YpyR+ahKw
 9dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhzFhrjKvRUsyJDSYv8WmAYUo+hfPFVK5biMG9ZuE5U=;
 b=UUpI0UUV5naoXdoHFcJkcq2Kc6vtKifDkxNdyeSkJkmBfvj4zVAqR58gImUN7df4Ac
 MOgY2qZ+rPRknTPwE/3OjOITgcMKDagj5/mquOQ0RTZxZ7uLeZWSbcMKmjI90nnwiy3x
 yvIogRuyDWNt2ddymAc6P+qH/hwN13CRvzo7xy+4zTFd3OJ9805I5VXAjVKOyCJN8rDS
 csrMFfW/wnV6WPeE1PNKWi+jHKUFN0af+eHV6M0eZuelo8EVXdcGegcnEHbhFJsRYKkT
 GxzwD7UHCQTqd0bq5vviM9Zs3LE0gYdep6Lpr6834TgQgQipPwBIiHqJllTnilttWQly
 ET8g==
X-Gm-Message-State: AOAM53060/MUy6rqHdsuk6LmMOZYyEPKqV8T7S49VBkiLLV2KkDFXOg5
 eO6R5I2B0ZtWAsedkFEWofjDczywQ9JsZg==
X-Google-Smtp-Source: ABdhPJzJK5llb6Bz14AVQJcW8CyMO84vyI3I+hK+/PrCw+2lDrWaXGJwUpxwg2bT+F1lVTsGPkd49Q==
X-Received: by 2002:adf:e950:: with SMTP id m16mr13516157wrn.0.1605823007281; 
 Thu, 19 Nov 2020 13:56:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 24/28] hw/intc/armv7m_nvic: Fix "return from inactive
 handler" check
Date: Thu, 19 Nov 2020 21:56:13 +0000
Message-Id: <20201119215617.29887-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
---
 hw/intc/armv7m_nvic.c | 59 +++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c901d20ae00..fa8aeca82ec 100644
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


