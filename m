Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CF2D5A05
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:08:17 +0100 (CET)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKk4-0003q1-T4
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR7-0001dV-EG
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:41 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQy-00078S-9u
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id r7so5151908wrc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wcq0GxMvWfold5QlJFLGxctr0lktZC+ze3o2mZSSjxg=;
 b=CChfZH5igfwtHSgkUjERLSbo05XmIQWY3Uq20NgAH76VUWPTLDEvw8AmdKG5YI+VBG
 YHFcrOFWjw5WwBRVNgwBJJZEAbEsy5QhJy4iOyO7A88ULvKC4DrA6S6OaFp3WxIkgobW
 Ip1+PVzXBF/3RnCyO97qQHbMaKM4MLogkGwHthVkrcBEiBf5cU5xvwNfKDkOYe1OLDAV
 6y1AnfbIvTtfwaeQusoJ983a1MSD2kLtcmfAGZ7m0s0Rkt3HnTQAhXMUSxehJGSzjrHO
 P0gKpiIl4EiC3ZZ7+aC4mguz+ts1qISp388I8Lcnr7zHPNmlHMh3K+gXGIv5uqeGNBNX
 53Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wcq0GxMvWfold5QlJFLGxctr0lktZC+ze3o2mZSSjxg=;
 b=SMZpasgLJpjosVLbnWxqVJkeMJfOfWxim8I5D4ujpJorrvLEBXpQ9N4tRk4UoFG2Uk
 WU+7ke/EzK91/HmcEmkBcqnYGsxSOILd3F4K9qQkqDOijbX3GUGzbU6ehigK3nyYSHXS
 918ItcjVPfpGAqmHJieR3jgiIK4LQxRATLTYXLs5QPDKINNatMpz4Yo5no0QHpw+tWuW
 JEK4wzJu/GNY4Qyy6JkLRXHnDEbSKzXsE1kxc+i1QyTS1GMpp03F01GilzSToCqAje9p
 9bRks3YY5Uap7t/SL6JnAeng10tEXCV9qmdbGoJjn2sq0BPCxdulDcQU2r6B9r2VWFWR
 D/qQ==
X-Gm-Message-State: AOAM532lPqiouDShF7QNH76EfMcvHURtuU5C6j9OvypEqHhwvlAQKMP/
 WZ68QkCXqzlKhl8JuCvwaQT5Z+oqAO3ntg==
X-Google-Smtp-Source: ABdhPJxIEwM8mHMu3xqVunYPEB5Yv0W61ykcQ42iKBz5EemMalBKcz5kowQX7mG59BWpF8SBJRxA0w==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr5146229wru.206.1607600909546; 
 Thu, 10 Dec 2020 03:48:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/36] target/arm: In v8.1M,
 don't set HFSR.FORCED on vector table fetch failures
Date: Thu, 10 Dec 2020 11:47:47 +0000
Message-Id: <20201210114756.16501-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-18-peter.maydell@linaro.org
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


