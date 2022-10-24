Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE660BE7E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:25:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on6oS-0000Qt-Mg; Mon, 24 Oct 2022 19:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oP-0008WE-MI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on6oO-0000FL-4H
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:24:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so4926102pjc.3
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZKPPwqUM3u9rEDoyh08pEPXNUD2eKrireqQWX4VXiQY=;
 b=a2sE8Y6sh/8LHZaXz/+TmN4Kozz2XmqhrJ7pCN3CvcRRk6VgKNC2k+Se5jkudwjTUk
 16YCYvzZGAWyBGDLvelgmsZOj/m2A7bOY2YloCZyc0o98gIBFWcP8DhM/StxToHOC+EB
 7Tycn5ZlUV/qE2hrVc5gmmjCWEqbzkP1YNh20SbbLqX+Xj5V+gOehi07X57UnRDAWiyO
 UBccLnQ3Q6++enxVh2cVKlwbo70ZDcCRCRAyqOeBvwOeBjN9fx1l4vTbNMwCuQQGJ/aL
 hvcPTAuUbA6AS6+rhbr5ZChEXp6n9p1goXNY5KXFa9HAt69zFLxDPKphrUxMJdcvPAjp
 xIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKPPwqUM3u9rEDoyh08pEPXNUD2eKrireqQWX4VXiQY=;
 b=bkYrYt9Q0kLPYsZu4cRJ1W909Fj2vAAI8jlnUkDCNl3WlRIFUajdhiFwt82XbrM7/v
 tooVFNVTTkmPgHmxKmcmx3FhADqk5DeF2K6MruIrfISjdLpw3fymEHN66qxuWF13a/rG
 lF27KSByeVXbg9/EDehvsM8yxP50vPEzXhyQx4F9Yyn12jXxUEFf+KaJLVG8HRTMNeYu
 to5X+/FSrcNexG4Sfx73W+zEDhJNPMuwfNJyP9co8CKCCNzRbev1tAxGUeD1JAVkKfGD
 QyUW/sQH4/jpnlWvoVxMhPgmPe9HFSKd0a/mHwFbiAyb/UideslKlqEy8vVa/cpM3FEs
 CpSg==
X-Gm-Message-State: ACrzQf0vrB0qcgtYYUNMc7KLGLMqwjbhwkrZrPNc3+ja8VlrrolQ5Zj4
 0fKweWvCkzKnPDEjhaz7hHZAAqZU6/MIfg==
X-Google-Smtp-Source: AMsMyM5cuLO+GCCvJtbyebxYlj61AmyezxuUKEMyvKazZiHWjTbzY4rg7NC3jtk+XSr2afBxahCXOg==
X-Received: by 2002:a17:902:eccd:b0:186:5d25:ec5a with SMTP id
 a13-20020a170902eccd00b001865d25ec5amr27747326plh.93.1666653890059; 
 Mon, 24 Oct 2022 16:24:50 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b0056bfa2cf517sm324788pfh.3.2022.10.24.16.24.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] include/qemu/atomic128: Avoid
 __sync_val_compare_and_swap_16
Date: Tue, 25 Oct 2022 09:24:35 +1000
Message-Id: <20221024232435.3334600-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024232435.3334600-1-richard.henderson@linaro.org>
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Merge the CONFIG_ATOMIC128 and CONFIG_CMPXCHG128 cases
with respect to atomic16_cmpxchg and use
__atomic_compare_exchange_nomic (via qatomic_cmpxchg)
instead of the "legacy" __sync_val_compare_and_swap_16.

Update the meson has_cmpxchg128 test to match.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic128.h | 8 +-------
 meson.build              | 3 ++-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index adb9a1a260..ec45754515 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -41,18 +41,12 @@
  * Therefore, special case each platform.
  */
 
-#if defined(CONFIG_ATOMIC128)
+#if defined(CONFIG_ATOMIC128) || defined(CONFIG_CMPXCHG128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
     return qatomic_cmpxchg__nocheck(ptr, cmp, new);
 }
 # define HAVE_CMPXCHG128 1
-#elif defined(CONFIG_CMPXCHG128)
-static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
-{
-    return __sync_val_compare_and_swap_16(ptr, cmp, new);
-}
-# define HAVE_CMPXCHG128 1
 #elif defined(__aarch64__)
 /* Through gcc 8, aarch64 has no support for 128-bit at all.  */
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
diff --git a/meson.build b/meson.build
index 1ec3f72edc..d8c4e76e7b 100644
--- a/meson.build
+++ b/meson.build
@@ -2224,7 +2224,8 @@ if has_int128
       int main(void)
       {
         unsigned __int128 x = 0, y = 0;
-        __sync_val_compare_and_swap_16(&x, y, x);
+        __atomic_compare_exchange_n(&x, &y, x, 0,
+            __ATOMIC_RELAXED, __ATOMIC_RELAXED);
         return 0;
       }
     ''')
-- 
2.34.1


