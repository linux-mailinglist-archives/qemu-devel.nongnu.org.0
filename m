Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D454496A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:45:07 +0200 (CEST)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFez-0003rU-K4
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7i-0001n7-Rz
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7h-0006Ag-7h
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id m26so20034092wrb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4FBoJtD8BnTfjL+tOQoIkqKssw+9QYDFG8qS913t+NY=;
 b=xKIotShL64D8PEfdIrqMlXsxd5HmVnVtykYliXYfUptdaBS5C2G+PJcnwQT3o4HdnA
 TOLKDotN64G8hWxzR+6zCYOcMDzDZF4hSqgDO3F3+yAP4KmWfmDlsuJ4/I9uoJEKV3hs
 OfvhY+1ntTTHd8J0WB0ewXowOnBtNL2XupBc0MZtGesLUZIjTvbR6f/fq8WT6n0cA1Wx
 U72jhl/nv6eZbrzooxp4SMpIX7A3ICIjUahCTDlycPJEqoBLeA7Fc9diAJ3OunYPaWtJ
 IAmDIZdK/JGvyLqX2cp6QqbGSj5kg05DW8I9YguJodcnt4wXRJVNfaNAhAJtJ6U0jluJ
 jcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FBoJtD8BnTfjL+tOQoIkqKssw+9QYDFG8qS913t+NY=;
 b=Zq9KgKP6VC3eR7Y2PyrgtQHSwcrNiCQU80685YqYvq46dk1Kjmdc/AaOGZTn1K6C8u
 rupHY5lzMWlUR4+sNGh2dI1pjTsnYCdUQnNJc2UUa949s+BAFQ5wysOtwXGOpOG1p7K4
 PIaOoAewVCynaD6rKse/PwLVl9D3/k56rfrMQVeWiW7WautTeAEGjpP3Alnz6ufEp2u/
 PH+Nw5onCu97RUWA9fXVyjZrviAhOSeJV3uZrg3uQhOuj1ae0RqiOaSi8FdrWL8fOQiM
 SGAkeg1rcRSNw4W4bWUinst5MziVMmkeEOPrINHow0ywm3b/4ys7vXakD2TrDrzv/d0N
 sY4A==
X-Gm-Message-State: AOAM5316xU6gvErNZ9AWE/5NeTn6aqi+0/xR7jZLFs9kd0ZJibsKkCMm
 FkcSVZ4gg3vL92FNVnI4K8PaDwEWvlNoZQ==
X-Google-Smtp-Source: ABdhPJwJ+hM+N1lNCI15EPNwgGwzJJ8VBN6lmIa9lfZ06W4B+awsA/NLbRRPTnIiyxKOEUpCD5QFwA==
X-Received: by 2002:adf:c64c:0:b0:20f:e8f0:be4c with SMTP id
 u12-20020adfc64c000000b0020fe8f0be4cmr37253756wrg.614.1654765594780; 
 Thu, 09 Jun 2022 02:06:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/55] target/arm: Move expand_pred_h to vec_internal.h
Date: Thu,  9 Jun 2022 10:05:34 +0100
Message-Id: <20220609090537.1971756-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Move the data to vec_helper.c and the inline to vec_internal.h.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-18-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_internal.h |  7 +++++++
 target/arm/sve_helper.c   | 29 -----------------------------
 target/arm/vec_helper.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index d1a1ea4a668..1d527fadac1 100644
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
index e865c125273..1654c0bbf9e 100644
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
index 17fb1583622..26c373e522f 100644
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
2.25.1


