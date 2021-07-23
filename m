Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D943D3D85
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:24:47 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xyg-0003s6-Ti
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvx-0000F3-Ao
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvu-0000nh-KZ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id n11so1137561wmd.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ka61wmIogbeS4FZRJa7FPEYoz1c9JdTmedELNF//a8M=;
 b=Rv47M0cPeysNEuw9bwXgXRnEZbbSso/VLRh3u8fwAs/ypEUJtHwex+yaZv29iycxif
 klJAWGaatDMJo8negcMnTYIy4Up2bT4wrVPF8jaiERMi5NgTNW7B0zoxwb6x/A+90nRJ
 l2IK+ZPmb7rhgpgbVorKGeoAjpjIU97tgoty+X0I+WXecJC5KXNSlSFKQJKfV8SCyT65
 /3uBEDRNZUVJeVaO2v7vcijemF2ud/Giu64+MNqG3eAtupSdAXLj1lKlzkqXPlnnA/R3
 1lhF86cZLROvYz+rXy5Myr6igY5E9nWzrrgV93ZE+PCZ0etPHjjZL5JLA3ucZndLbglt
 vyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ka61wmIogbeS4FZRJa7FPEYoz1c9JdTmedELNF//a8M=;
 b=POd7qdUboVUY6STs/Yug9YKS3opAxQMhlvCHS/xtb+BuQQpNN0dbh2rsRK1EnW0ye/
 v7phBLTXKiT8G0MIb3mbsBF1ocLT4yUJBLtIOJJN8/iJUDfXVLOBfM3j4PPcxQzlCU2j
 5G+LFObUrcKfs+Wbp3EGtHbGx7et7zNTMQthdgPv0tpVDB7WlQvH4zEmVB1jYL2ZBeoj
 YQd1zc+1EDdLjxtRVxo3doLc/sYW3+vAy1v3XGulWPb5Hr4Ogfena/54Gy0uFWJ8pUWl
 ABHmQK6JX4aT6Pb4MchLUBL0m8J5dh3hqt5DvUEnzukBkWqdnQwm8tYFTIPrDKt8Cbwj
 h3tA==
X-Gm-Message-State: AOAM533Cp3gGrUBEgy92uGVZdE0qV7b3083sOPqo6YcE0pg5k5ktZovX
 PsI+OLs2vMSwUcNaVNkgWIfBLRsi6Wqo/g==
X-Google-Smtp-Source: ABdhPJza8TWz2i9slPelU5OQYXwHCIXdLqxFY4ptTkygfdoSuXRzd08K35NASqUBOo1tAc5oWE3vhw==
X-Received: by 2002:a1c:494:: with SMTP id 142mr5400663wme.60.1627057313236;
 Fri, 23 Jul 2021 09:21:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 6/6] hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides
 S exceptions from NS
Date: Fri, 23 Jul 2021 17:21:46 +0100
Message-Id: <20210723162146.5167-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
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

In Arm v8.1M the VECTPENDING field in the ICSR has new behaviour: if
the register is accessed NonSecure and the highest priority pending
enabled exception (that would be returned in the VECTPENDING field)
targets Secure, then the VECTPENDING field must read 1 rather than
the exception number of the pending exception. Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


