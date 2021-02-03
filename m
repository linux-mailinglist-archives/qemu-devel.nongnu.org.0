Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6630E371
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:44:38 +0100 (CET)
Received: from localhost ([::1]:57810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O4r-0002fO-ET
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP2-0007g7-2g
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:24 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001nX-MP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:23 -0500
Received: by mail-pf1-x42e.google.com with SMTP id f63so400370pfa.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTkuzyqIbL72JEm6HgyCzOP+l6RLV374RyEwxbETzcY=;
 b=qNpcJNdx+241EHVCrO0IuqMchkMBMsj2pGp8l4+aKO0Dk48hHFWa39Bm8xkBE5Rwcx
 YHw8M8ZsU6gV/fsGN/NXOZWJuuvWTP9RL19kusgM+FpG+GqwjGGXMzgeSy2EzEyryyov
 BdNLWfZC6WaoM80FXXTERxHmmu6fJ5GncSGz/7sWIQiYYmpyEMRC+tUk0lqTHx8j5n56
 dXY3M4rmkMimNJOYJLe4mlNw7V7SgrwN+0LDd8TGg37qehVcQ2zkxXc2B5cZCyFP19GI
 n8PQwIDcGl3wTKBJNSTDhmYQN4WjUYjNUycdMxbHUGsbNRzSs+tb2xPFyYAoQ+s4ZEAS
 Xq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTkuzyqIbL72JEm6HgyCzOP+l6RLV374RyEwxbETzcY=;
 b=qHPX6UzIR3lDDnIqiCNZ9nPFsolku6NOPxTvGEAwyLkYeHQnxvMxX3w50Ql9chEI6s
 oNKJJvY9JghSVZGuLwBhmLjNKIluk5F9ij0/BDKRtuOiDezSGX3/KcCAt7eBs1V+ny01
 1RSQf7GssQHCgo8LyK0/rF0fKtzVBI8VtY4W0gcHQMukghpYxc9Z7lLX3gPPBmLNVtwG
 tijonj6WtqTkrvhby3oRFVYPEw0jjyLv+EB/AczVQHrwfYCAWIYqSAfmkHRXenc2oXFc
 Cywf6i2riBEJQCy3lJfy8+0tLhX7oYLVbmkjUcxZT7LT+DQZj07OGWG5RXWEpdk0rukd
 XePw==
X-Gm-Message-State: AOAM533WfVMAMQO0RucvgcDzjYmPiepDzZb5g3S6a0gi+Lmo0zSiDcG8
 3Mm9PPjovYmUZnIyCLKcMmOXTG6yCJwBGt6+
X-Google-Smtp-Source: ABdhPJzuyuN/7gFJUcnI9texKSV9KpwJHaxiA5BeTr0bOSjHQlbRh8nVxwCAdb2LstsulVykFY9ATA==
X-Received: by 2002:a62:cd86:0:b029:1c7:f5f6:787f with SMTP id
 o128-20020a62cd860000b02901c7f5f6787fmr4444566pfg.62.1612378859308; 
 Wed, 03 Feb 2021 11:00:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/31] target/arm: Use the proper TBI settings for
 linux-user
Date: Wed,  3 Feb 2021 09:00:01 -1000
Message-Id: <20210203190010.759771-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were fudging TBI1 enabled to speed up the generated code.
Now that we've improved the code generation, remove this.
Also, tidy the comment to reflect the current code.

The pauth test was testing a kernel address (-1) and making
incorrect assumptions about TBI1; stick to userland addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  4 ++--
 target/arm/cpu.c            | 10 +++-------
 tests/tcg/aarch64/pauth-2.c |  1 -
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 853fa88fd6..6efe0c303e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1413,9 +1413,9 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
  */
 static inline uint64_t useronly_clean_ptr(uint64_t ptr)
 {
-    /* TBI is known to be enabled. */
 #ifdef CONFIG_USER_ONLY
-    ptr = sextract64(ptr, 0, 56);
+    /* TBI0 is known to be enabled, while TBI1 is disabled. */
+    ptr &= sextract64(ptr, 0, 56);
 #endif
     return ptr;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141..db81a12418 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -200,14 +200,10 @@ static void arm_cpu_reset(DeviceState *dev)
             env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
         }
         /*
-         * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
-         * turning on both here will produce smaller code and otherwise
-         * make no difference to the user-level emulation.
-         *
-         * In sve_probe_page, we assume that this is set.
-         * Do not modify this without other changes.
+         * Enable TBI0 but not TBI1.
+         * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 9bba0beb63..978652ede3 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -53,7 +53,6 @@ void do_test(uint64_t value)
 int main()
 {
     do_test(0);
-    do_test(-1);
     do_test(0xda004acedeadbeefull);
     return 0;
 }
-- 
2.25.1


