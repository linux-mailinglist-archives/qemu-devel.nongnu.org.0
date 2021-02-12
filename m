Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851031A536
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:19:06 +0100 (CET)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdy5-0001ju-5m
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVa-0001rr-6M
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:38 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVV-0007rX-HN
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:36 -0500
Received: by mail-pg1-x529.google.com with SMTP id z68so270827pgz.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6BEpequXM+1RtdDCCQs/VCcQkfY8dHZtljwHQUWFfvU=;
 b=HYUrqoy5OcyexQZ5qRj29T448YjzI9m7LzOdZ8gtgOH1g4KpiyPPpS9A270W7Wo1zH
 rcgcb9ed50UlkFM/dJdf4e+ua8RsdKYcMBsecidbocP7hQpIIQKVUy2z0lzNy7xC9zeu
 XWW4jUHw/QQccVOpyNVpEZ4O4nHLrBJAG6ZTb2kX6jZ8cucj27SniOkeuuy8/YcUhXCt
 2H/DBM682E5rqeFoGb9skiaDJ/Wmm6PWzr+i/FiFExKYW3z6KOkHx5iyrQURWxHlbeSs
 67ka14OG7JYu49yvApA5uByf2xzgFliyNX4OTQ3peoXgGpmbcQyz1K3GuOsX1GsbKtVQ
 KyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BEpequXM+1RtdDCCQs/VCcQkfY8dHZtljwHQUWFfvU=;
 b=Yiavf5C5gLfgqk+MGWuZGba41b1Nem5JR1mC0aW3egRaIGtiPufrU3VylHxCPMZSic
 yK0gFPoe2v4fP/UQnPjjk6PvqXgxinFhLRxpNG+cFBpc74wNwmt+c7aYGW47ziE+Ylch
 xlma99ks1PRFgj3gaBaHtXdMmQcyC7BA2r3ICskWq66Ky6pr/yry8sFlFAqRaEgyUClI
 17pWbtQddF2IprEUEBdpubOB58YdugDSeZVk0zLnAmAZI5LhSSConxKibqjVFw0A2xGf
 egqr4Rw/Z6z9mVNq3GCWGCLuk0MBoy7KvCvjh8WKd/MjE9qVekvrNZKwTMe7jnW7onKT
 +uzQ==
X-Gm-Message-State: AOAM533h+5cu5xxHZZab13cZGYmjurqML1wWP7zDwUG1Q4GdIj6moKvF
 HyRXyBKVl3E+YkUViJz57BtW3nRj/D9bMw==
X-Google-Smtp-Source: ABdhPJxbBF99sc4JcQGYnR69q7Swy2M0P72xD0YNyD+2EqmE1c5I7weVm68ihCIvjLcDpIvgDQFmSw==
X-Received: by 2002:a63:ee55:: with SMTP id n21mr4416423pgk.372.1613155772319; 
 Fri, 12 Feb 2021 10:49:32 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/31] target/arm: Use the proper TBI settings for
 linux-user
Date: Fri, 12 Feb 2021 10:48:53 -0800
Message-Id: <20210212184902.1251044-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org
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
index b251fe4450..112bbb14f0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1425,9 +1425,9 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
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
index 5cf6c056c5..70cfcbc918 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -205,14 +205,10 @@ static void arm_cpu_reset(DeviceState *dev)
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


