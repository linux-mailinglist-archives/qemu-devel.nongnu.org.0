Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBA31A55C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:29:33 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe8C-0001ei-JJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVb-0001uz-Hj
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:39 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVT-0007qS-HM
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:39 -0500
Received: by mail-pl1-x631.google.com with SMTP id g20so332978plo.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=33PuANLFLZBScZnb9Hs9Trfm1Tvhd5OuXkKzdpb7J3o=;
 b=MRaZru/gnVeP0yh991zSqCuHrSY4PDzKRFbgu2CbzDAE2hT3c1cHnlWGd+pjkRojiQ
 bqrz2gzqoD7cShYRtOidiAtvBwQAYBmxZSjmxRihnx3S4ox/vBKqylPVJ6RNoQBf/VE2
 x5ArSjJCRH0mpB2OMejWf0g3zWWWJvER6j4zCH2ok1fS76PZvTxAHfjIzJCcX/vwlu6M
 VVf3h0GBxQhYN68m6d9Qn1QCwIzcuO/deSnflVIBcGLRPEi5d5UXxtQA4DmGV/nlZ2Mm
 nfFGqhba4UHpb39JMi0tfvOQIfHkx7PAwwkuxBuz+8p0Oc8D20EX7Y2rTgblnh8ROPBe
 8Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=33PuANLFLZBScZnb9Hs9Trfm1Tvhd5OuXkKzdpb7J3o=;
 b=DhzypTby9nsgeCTuUpJdg/mzwCrDFfcf0dtoqpWx+jWaD1lGhbcKfSTxIkjGfBYzzY
 Zlju5NbPeeta4VPya5ZNzs2wSusSFBKt2q8NnV0C+QrkN9DQHKQ0lx6I/bQw2XBpQNqv
 moZWTfyijO1Mvlatse3BgjwEptRmFAx68Y5h2aNnOs02Gu3DQxwreWvrWef0iCCvrITN
 k61uGMvWqLI8bWfgvDU/ORkU6FZyocwpq9xVCvHvorddk3mwIIButiaUGnku+yjRNdR3
 Qv/9MhumFIe9tLedTjSLUIyskowFbuiCG88rRcn+r+bgefvSwwMi88Kgkfgw4Yx2ATcp
 sQ0A==
X-Gm-Message-State: AOAM53202Bqwf7iZORQaLcJS9VJQnG9a6l2WIRLmyNT0F6W5dbxxjsu2
 5MfjxCSvFsPom4LI5UNP4oYJPsQtHeM0eA==
X-Google-Smtp-Source: ABdhPJwpQVhxjLPKPluF6YYkBzTSLuYuPrxLwG/1ZNJWq3BpkQbpYijqiA82P8MoPGpFQMkZM3gysw==
X-Received: by 2002:a17:90a:2f21:: with SMTP id
 s30mr3839164pjd.5.1613155767288; 
 Fri, 12 Feb 2021 10:49:27 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 19/31] linux-user: Handle tags in lock_user/unlock_user
Date: Fri, 12 Feb 2021 10:48:50 -0800
Message-Id: <20210212184902.1251044-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Resolve the untagged address once, using thread_cpu.
Tidy the DEBUG_REMAP code using glib routines.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/uaccess.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 76af6a92b1..c696913016 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -6,36 +6,37 @@
 
 void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
 {
+    void *host_addr;
+
+    guest_addr = cpu_untagged_addr(thread_cpu, guest_addr);
     if (!access_ok_untagged(type, guest_addr, len)) {
         return NULL;
     }
+    host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
-    {
-        void *addr;
-        addr = g_malloc(len);
-        if (copy) {
-            memcpy(addr, g2h(guest_addr), len);
-        } else {
-            memset(addr, 0, len);
-        }
-        return addr;
+    if (copy) {
+        host_addr = g_memdup(host_addr, len);
+    } else {
+        host_addr = g_malloc0(len);
     }
-#else
-    return g2h_untagged(guest_addr);
 #endif
+    return host_addr;
 }
 
 #ifdef DEBUG_REMAP
 void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
 {
+    void *host_ptr_conv;
+
     if (!host_ptr) {
         return;
     }
-    if (host_ptr == g2h_untagged(guest_addr)) {
+    host_ptr_conv = g2h(thread_cpu, guest_addr);
+    if (host_ptr == host_ptr_conv) {
         return;
     }
     if (len != 0) {
-        memcpy(g2h_untagged(guest_addr), host_ptr, len);
+        memcpy(host_ptr_conv, host_ptr, len);
     }
     g_free(host_ptr);
 }
-- 
2.25.1


