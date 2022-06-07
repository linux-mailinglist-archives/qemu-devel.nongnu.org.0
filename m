Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4E5416D6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:56:35 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygFe-0003iK-JC
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftK-0007mq-KB
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftE-0007Ib-EM
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id c18so8624792pgh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
 b=njsjEDYZIdYXaH4KHNwLvVJ4Z/KS7gL8bkgcQrrOlH6KoF9XNgc53hAELH0UbCPLPQ
 wHpXzzogvzyPvZ3S/E/LMNQYWgPV9xyQP0XB8/WWJoUmqMWiLjukp4neXdlqQHbJsmaB
 L6TArS7eGpa2pa2pebjebA+QgANpMEF958Or6OZ/U466ihJJ2vTuZ0o81cLXzB/HUr3N
 eGwcBT/dWXjU2faEX+WudyhnTtWzhmBHRRET5i2w5Nx/LlR5NJtEn+mGUHDi0j5LkX0I
 8+OfmEnL6jCajwaxJrkQkaKHKs4z4yrCAYFlgDdLaiL0dDTtHBHpwrLsSlHMmzaZEI/c
 WUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRGebQyqBWSguPRywmTvdJmhpPUXlvnLMmD10I0JmJc=;
 b=AMleJFXcI5njbZ3bSGBee9CF3nc2O+6oeqZ1OoHH0DrSJfzicsJ5/L5FEnJNkzu1XP
 R4T0w2urDzDi+SMZbcu7/9wzxQh3XEysPW2+0FFRJNqurCgZSeXR/fSdMRyChtL7Vhs8
 LG9pVyR1zLU3LDqjA9c9k2+mYs1FQctz5hSGZoK7Je5ITf7c7QIo5d+NadwjtculsB/9
 fmke5I+QJT/Dx/dEmL8Zzu1T6h1hXAqBfez/rVL9I4Max8WEMS/wp4xcROiYvVspZZuA
 77tvmmmX4eenmM25YL4Z23jc53o5cVIsEtLh/1LD9WrUoSQ/Wjwcqydtj+xSmyR1ktDn
 H8jg==
X-Gm-Message-State: AOAM533UoMdKUv36pXFTySIy0Jila5PCbCvfW+iTQc1uihnJoVD6kKfe
 /3YVabPj+T3X0QkwfUNdB2ULAlXqi0u/zw==
X-Google-Smtp-Source: ABdhPJwV/RRjhxz7f/PfiuWaeF4boljpvDZyfMHRmILesOBnYVS0A17U6N7Chltxn5Bfz0VR7wZ2CA==
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id
 e1-20020a636901000000b003f9caa5cffcmr27421380pgc.324.1654634003018; 
 Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 17/71] target/arm: Move expand_pred_h to vec_internal.h
Date: Tue,  7 Jun 2022 13:32:12 -0700
Message-Id: <20220607203306.657998-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the data to vec_helper.c and the inline to vec_internal.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h |  7 +++++++
 target/arm/sve_helper.c   | 29 -----------------------------
 target/arm/vec_helper.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index d1a1ea4a66..1d527fadac 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -59,6 +59,13 @@ static inline uint64_t expand_pred_b(uint8_t byte)
     return expand_pred_b_data[byte];
 }
 
+/* Similarly for half-word elements. */
+extern const uint64_t expand_pred_h_data[0x55 + 1];
+static inline uint64_t expand_pred_h(uint8_t byte)
+{
+    return expand_pred_h_data[byte & 0x55];
+}
+
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
     uint64_t *d = vd + opr_sz;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e865c12527..1654c0bbf9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -103,35 +103,6 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
-/* Similarly for half-word elements.
- *  for (i = 0; i < 256; ++i) {
- *      unsigned long m = 0;
- *      if (i & 0xaa) {
- *          continue;
- *      }
- *      for (j = 0; j < 8; j += 2) {
- *          if ((i >> j) & 1) {
- *              m |= 0xfffful << (j << 3);
- *          }
- *      }
- *      printf("[0x%x] = 0x%016lx,\n", i, m);
- *  }
- */
-static inline uint64_t expand_pred_h(uint8_t byte)
-{
-    static const uint64_t word[] = {
-        [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
-        [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
-        [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
-        [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
-        [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
-        [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
-        [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
-        [0x55] = 0xffffffffffffffff,
-    };
-    return word[byte & 0x55];
-}
-
 /* Similarly for single word elements.  */
 static inline uint64_t expand_pred_s(uint8_t byte)
 {
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 17fb158362..26c373e522 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -127,6 +127,32 @@ const uint64_t expand_pred_b_data[256] = {
     0xffffffffffffffff,
 };
 
+/*
+ * Similarly for half-word elements.
+ *  for (i = 0; i < 256; ++i) {
+ *      unsigned long m = 0;
+ *      if (i & 0xaa) {
+ *          continue;
+ *      }
+ *      for (j = 0; j < 8; j += 2) {
+ *          if ((i >> j) & 1) {
+ *              m |= 0xfffful << (j << 3);
+ *          }
+ *      }
+ *      printf("[0x%x] = 0x%016lx,\n", i, m);
+ *  }
+ */
+const uint64_t expand_pred_h_data[0x55 + 1] = {
+    [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
+    [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
+    [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
+    [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
+    [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
+    [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
+    [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
+    [0x55] = 0xffffffffffffffff,
+};
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
 int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
                      bool neg, bool round)
-- 
2.34.1


