Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98332B9D60
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:09:52 +0100 (CET)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs7j-0000kF-Ma
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvD-0000rC-Hy
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:55 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruz-0004DP-9A
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:55 -0500
Received: by mail-wm1-x344.google.com with SMTP id x13so1671506wmj.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v15Qy4cmfx4WYV2eDBerGMLhauNtxeDDRpl5ncA8vg0=;
 b=AmN8XAie1TKtvsdLRfjQ/dFCvWAJHMslGdiIQ/DWeD+q/5w78IypkBWjWW2nxld5iJ
 JOfR0SQ6UPpTyAJy8fa3SEJwe7Iz96+SxMVlyRWcDJrwiO98WiT8vxiaER9ekoiQAq8p
 Pbp8hfVAcM7oBIJY2VDIkQHnoQokjUuYHwDkK+svsnx15aSPyi5yKi0J3x/m8uLAgC7K
 P6Z1ZI/82SI0TnjpEigRhIZD88bwZXlyOPgXdIgVbPjGTsVtwGIUbnulq3EMs9Caj37S
 3ABuwFz2fPF0df6tQRkkHmwtaiJHIyTfK98D1EgHOzOOkSBk6PjyBCqOE59Z8cg/xNo/
 Vlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v15Qy4cmfx4WYV2eDBerGMLhauNtxeDDRpl5ncA8vg0=;
 b=gLoWM41cQX0bloY6X57xE/kKI+UXWKXZDR+qXoDkOjBHSHn66K57yNqsoZl1/y8i89
 ihtpi2H/1Kf79i7WgmjT5xAcQ5m1MpVg2qqXw1DJrZ7qPKTpYjW/vs2vXud12V10OQlT
 Wpup+pbqoOnZNR5gtArnHFMYkI3JiUg+95fa/qoOoSjkeZntOyUtjxg5gYf7rtRAJbPZ
 y4sGKiDc8evh+SZmEuoThouY6eP8EfUlFjIkRGGFwE8uBX3JEcyTu9T4RVMNsxiHdOkX
 SgZ0Z5hY8ELn5LMKcLO9gRaYpLdiXTw1EaP8Vp/vgI5AlaQEkPzEtRVOGoeorNVtihSB
 Jzkg==
X-Gm-Message-State: AOAM530J2M5GymZbRv5TXHkbRYI42jJf6E9zw5qBQOpuZ+k7P+ndwk7W
 jHP4cC/AiHY1NvZBsRETIE9DWQ==
X-Google-Smtp-Source: ABdhPJyWOQsVdQ2wYaDhvxFhI4Rw+D5OuWvwt6d7+eJAaoll51Kf8PZYr4apt4ZKz26IkKT5819JZA==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr6599129wma.101.1605822999633; 
 Thu, 19 Nov 2020 13:56:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/28] target/arm: In v8.1M,
 don't set HFSR.FORCED on vector table fetch failures
Date: Thu, 19 Nov 2020 21:56:06 +0000
Message-Id: <20201119215617.29887-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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

In v8.1M, vector table fetch failures don't set HFSR.FORCED (see rule
R_LLRP).  (In previous versions of the architecture this was either
required or IMPDEF.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 721b4b4896e..9cdc8a64c29 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -722,11 +722,15 @@ load_fail:
      * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
      * secure); otherwise it targets the same security state as the
      * underlying exception.
+     * In v8.1M HardFaults from vector table fetch fails don't set FORCED.
      */
     if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
         exc_secure = true;
     }
-    env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
+    env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK;
+    if (!arm_feature(env, ARM_FEATURE_V8_1M)) {
+        env->v7m.hfsr |= R_V7M_HFSR_FORCED_MASK;
+    }
     armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_secure);
     return false;
 }
-- 
2.20.1


