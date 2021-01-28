Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F3308198
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:58:36 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GFH-0004UI-Pz
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzf-0005l1-7H
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:27 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzP-0008AR-OA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:26 -0500
Received: by mail-pf1-x42b.google.com with SMTP id t29so4962225pfg.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgNyelKt2GngvKbsoMDpo4CJhyrMaW41bQD6ElDWNXc=;
 b=IySlJ/+gM72ylDP0saKIP+vk9AVwNxn1CW9eAahP6Co3EiWHHZwhDyHM6aJRuIkXL5
 8hE7YwhvnJrPXn+dcqgf1uM4qKQE/H/qMQj0DSi7XXw78TLH4KYkQnTKIMgoRFy4xnTC
 CLBcfyEnhSq2KrltiI9YXpmW+tDWvDgAtyjlcHMsmt7lGnu5drfBb7tWE9SjQmsS28io
 GjnO17yTW51DAkBkVpxH8Y/UdPE0SYgwlcbJRnkUNCLwg0K2sLlGeztIaa+iYMvTxAu7
 joPgdA1kAAfyXmvS31fURzoVK4moiWLpoUbWTkPMOojp35DVdlxSy//v6ijuHR/AJV4B
 vHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgNyelKt2GngvKbsoMDpo4CJhyrMaW41bQD6ElDWNXc=;
 b=H57QJvYnJYYA4e3C8hep4lzHds4Q8c8DUte55hy0QZd4cqKjPVUb3ktpcDj1BX2HqC
 R/hVy2pfKZoTxR3vDYVHqW4y7Wr0ijoofZNTmvHh1HxFfg7IMA3ZYZ82TfGMh2gL1DT6
 FGgr8OcZKUYRmthIldm5uL7PqMkuda9XtlXUCW1fFNNc72J7y0O3JiOokOwgU8jkZUgs
 j9Dj2w0EoinOc/38h0gh7iRxR7tDkMUOxhWBMFWeoZZMZeT3Cvg124TBDVc4g80dgmK2
 IxlKrPedUaoDEPdpphrcSRAnfvKxviFUtapDcU3aC9U+mV48dY1WILFB9WBIKj4zZHr1
 cEug==
X-Gm-Message-State: AOAM5303Ox5p3BNLd4S5rc5JWNY/k5+lhk480dFQX1t2g00vDInIZTNd
 GnWuX/FD76A7EXlt/ghbi/iqeNZclEsWEGQ2
X-Google-Smtp-Source: ABdhPJzKLL+UPLQSAH9mmrq836tG8OrwZV+818yELjwKHYFc3r3B00e4GhfSJlwL/mK1UucYpCPYJQ==
X-Received: by 2002:aa7:9d0c:0:b029:1bd:1e1f:8885 with SMTP id
 k12-20020aa79d0c0000b02901bd1e1f8885mr1469801pfp.48.1611873727910; 
 Thu, 28 Jan 2021 14:42:07 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/23] target/arm: Use the proper TBI settings for
 linux-user
Date: Thu, 28 Jan 2021 12:41:32 -1000
Message-Id: <20210128224141.638790-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


