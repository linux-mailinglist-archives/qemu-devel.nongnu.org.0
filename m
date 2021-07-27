Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4633D73D6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:56:31 +0200 (CEST)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KlC-00012p-Ik
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdA-0001of-8X
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd8-0004vd-8X
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h14so6693879wrx.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NHiMPvXEuzz+3gZNYeGUJg4yQo5E4dPUtk/o5Z9hxz8=;
 b=ljK0vz3VDTfLyhx9gTcwzXgIVnOzeF0AivMDhU9Vhl5spfhA1eHjgvFzcP7aVA7W4O
 JHzR4mdETgp/jdSqvhrWR7oRYToGTJ7FK306Xi2xVbvHNRhYzjC7vwbZI+lLzEa2+gZx
 8wN28ORGvxDjdKsc5LKnAt00XownHu2S8PEHL5Q+sdxcK/sxNEqbAFY+7cZB6wY3EEgI
 YqrG8pQa34DzJRpeystzOvJBCMhzafD7DNvCYxZkJKpTfP+pjuP6tnfxEI0OueD/IoO4
 psO8yPUSXGF3eGsLTgdtUSpm3wJajd9ui6FF/Ks8OyR6ntOSOCPtfQXauG3Q5iwQgAYE
 JA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHiMPvXEuzz+3gZNYeGUJg4yQo5E4dPUtk/o5Z9hxz8=;
 b=jDOwHfdjWcT3jZJLVJNnhoi2jqbRVrcc9oFuwimufPK0dVH1jGXrNgcuuI5eUR4dLk
 gE23UTS8660RGf2v9gDkErD5oJVirBGdq6q+SkF3wv8nIgX9TyWKh4vapGUB/NNcwe+0
 pNhuLCR7vk2vlZYW3kjJWbt0CIFkJoQjd0XQR7mlJFSI/VgS5YafoIZdPHF0clzdGjOV
 otbCLP7q1/nQY4Pa2By6Zv2s4OWvgvQHnWU5oJiKRALGeQ7zoRrCD4RKDQFYMd/Ph6Bl
 aQzeMXMX9Tae13uyfc0cmvC9U7yYaemSrMAo7wyWsmzNIn8xFUN6FwUluRj6x9z3+XHi
 fFGw==
X-Gm-Message-State: AOAM532FV8Bskov9zHy5BBfPYQ5O2T6WBgtYr8GguCTLyDjsxy1kvK62
 ieXfK2or+nERHU+knx3udNQ/eZiKw9p5gQ==
X-Google-Smtp-Source: ABdhPJz948EmRohTwA+By+E2SFgdkjAf+cWBLBxeuqqlXx/n6y+CqqI0AHA3wg16I1gZ9ydMIDwZaw==
X-Received: by 2002:a05:6000:10f:: with SMTP id
 o15mr23485756wrx.347.1627382888922; 
 Tue, 27 Jul 2021 03:48:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S
 exceptions from NS
Date: Tue, 27 Jul 2021 11:47:55 +0100
Message-Id: <20210727104801.29728-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

In Arm v8.1M the VECTPENDING field in the ICSR has new behaviour: if
the register is accessed NonSecure and the highest priority pending
enabled exception (that would be returned in the VECTPENDING field)
targets Secure, then the VECTPENDING field must read 1 rather than
the exception number of the pending exception. Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210723162146.5167-7-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c9149a3b221..1e7ddcb94cb 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -804,6 +804,16 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
     nvic_irq_update(s);
 }
 
+static bool vectpending_targets_secure(NVICState *s)
+{
+    /* Return true if s->vectpending targets Secure state */
+    if (s->vectpending_is_s_banked) {
+        return true;
+    }
+    return !exc_is_banked(s->vectpending) &&
+        exc_targets_secure(s, s->vectpending);
+}
+
 void armv7m_nvic_get_pending_irq_info(void *opaque,
                                       int *pirq, bool *ptargets_secure)
 {
@@ -813,12 +823,7 @@ void armv7m_nvic_get_pending_irq_info(void *opaque,
 
     assert(pending > ARMV7M_EXCP_RESET && pending < s->num_irq);
 
-    if (s->vectpending_is_s_banked) {
-        targets_secure = true;
-    } else {
-        targets_secure = !exc_is_banked(pending) &&
-            exc_targets_secure(s, pending);
-    }
+    targets_secure = vectpending_targets_secure(s);
 
     trace_nvic_get_pending_irq_info(pending, targets_secure);
 
@@ -1039,7 +1044,19 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         /* VECTACTIVE */
         val = cpu->env.v7m.exception;
         /* VECTPENDING */
-        val |= (s->vectpending & 0x1ff) << 12;
+        if (s->vectpending) {
+            /*
+             * From v8.1M VECTPENDING must read as 1 if accessed as
+             * NonSecure and the highest priority pending and enabled
+             * exception targets Secure.
+             */
+            int vp = s->vectpending;
+            if (!attrs.secure && arm_feature(&cpu->env, ARM_FEATURE_V8_1M) &&
+                vectpending_targets_secure(s)) {
+                vp = 1;
+            }
+            val |= (vp & 0x1ff) << 12;
+        }
         /* ISRPENDING - set if any external IRQ is pending */
         if (nvic_isrpending(s)) {
             val |= (1 << 22);
-- 
2.20.1


