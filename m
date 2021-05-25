Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6738F7BA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:52:40 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMFL-00029O-Q3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLY1-00088o-8S
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:53 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXp-00045q-8P
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:52 -0400
Received: by mail-pg1-x52d.google.com with SMTP id l70so21418261pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m90pIoUuj3x9BHKQq8AirzUHZnpMlycwnUIoFbbQwCI=;
 b=UPjcDohjJOJ+qTjT6e2kQCTqrDw0vBzi5VU7M1yF1/fyhGRPdxAVpT7rJy7IM+K+fd
 vKtQz35UFQG2+IseiVfUxJnreY4+xAErut7NzvrxqKGyg16p43VIF1dBdT0+21e0ZBQN
 3RxWGRxJHNS3J6Q9rbJESLkJ5Vot5uxW1/hGHkAgRHymUm0G6uVlXXmksbLiSjzNjgSa
 DyvrGxtW+3MQF1YNe81bLwQPvJAiNfRI7SmT7w/0kv2X2HFcHY46qAjizlaS2jsN9485
 k//c8pZH6SyIT0CYBs5K0NNJk1dh8pPCZB35oBJHmhS5DwbHlypVJKK+SMn/yXSyVvYb
 y7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m90pIoUuj3x9BHKQq8AirzUHZnpMlycwnUIoFbbQwCI=;
 b=kVx3C75Ap41fXL98Lu2Ml39+CugsRmawatiPSep1oYD1xmK/vuqvfdPXvIf8oXJKRU
 CnJoR+Fh/RQo9I+Q4reierE0p+qo6Sz3qANqmVe7q/xcmlhKrDI9zZ9Q40HlkewfRh70
 5fWODqmG3ARnFDL6CNlpDFGsNk6SR+7sviQYePXVeNvNNtLlv4HbhPp7EHp9OfvRDJne
 4ISOXdYehmE5hYcCr49Tmm54ynRnE7Es8NSW+SrtKIXgGz/NHzn+rsTCnmglKSXeMLKr
 NAWRHonfogOtx7hxAX0ovgwue6ONFrlmGHwPOVIyOhD9PpDsiLPsEx3HFjA+bEjaHWxY
 DhJw==
X-Gm-Message-State: AOAM533Q7L661lou8pDtuGH9wMqBTu+GtN1qw86EbPDYnH5ff8t5ebVC
 Bo5VntS1biDBnatqRtqBzAcvaVT0qDgN7Q==
X-Google-Smtp-Source: ABdhPJwnRPfu0ZDd7lV6wQHZGp1HhGSeLY9lXPjxNcW/zy5z+b/Ylsn6tJfwGv37uVe3OijSze5geQ==
X-Received: by 2002:a63:5218:: with SMTP id g24mr16111748pgb.309.1621904859006; 
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 64/92] target/arm: Macroize helper_gvec_{s,u}dot_{b,h}
Date: Mon, 24 May 2021 18:03:30 -0700
Message-Id: <20210525010358.152808-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to add more variations on this theme.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_helper.c | 82 ++++++++++-------------------------------
 1 file changed, 20 insertions(+), 62 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8b7269d8e1..cddf095c74 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -543,73 +543,31 @@ void HELPER(sve2_sqrdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
- * with respect to the ordering of data within the 64-bit lanes.
+ * with respect to the ordering of data within the quad-width lanes.
  * All elements are treated equally, no matter where they are.
  */
 
-void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    int32_t *d = vd, *a = va;
-    int8_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] = (a[i] +
-                n[i * 4 + 0] * m[i * 4 + 0] +
-                n[i * 4 + 1] * m[i * 4 + 1] +
-                n[i * 4 + 2] * m[i * 4 + 2] +
-                n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
+#define DO_DOT(NAME, TYPED, TYPEN, TYPEM) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m = vm;                                                        \
+    for (i = 0; i < opr_sz / sizeof(TYPED); ++i) {                        \
+        d[i] = (a[i] +                                                    \
+                (TYPED)n[i * 4 + 0] * m[i * 4 + 0] +                      \
+                (TYPED)n[i * 4 + 1] * m[i * 4 + 1] +                      \
+                (TYPED)n[i * 4 + 2] * m[i * 4 + 2] +                      \
+                (TYPED)n[i * 4 + 3] * m[i * 4 + 3]);                      \
+    }                                                                     \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd, *a = va;
-    uint8_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] = (a[i] +
-                n[i * 4 + 0] * m[i * 4 + 0] +
-                n[i * 4 + 1] * m[i * 4 + 1] +
-                n[i * 4 + 2] * m[i * 4 + 2] +
-                n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    int64_t *d = vd, *a = va;
-    int16_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] = (a[i] +
-                (int64_t)n[i * 4 + 0] * m[i * 4 + 0] +
-                (int64_t)n[i * 4 + 1] * m[i * 4 + 1] +
-                (int64_t)n[i * 4 + 2] * m[i * 4 + 2] +
-                (int64_t)n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd, *a = va;
-    uint16_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] = (a[i] +
-                (uint64_t)n[i * 4 + 0] * m[i * 4 + 0] +
-                (uint64_t)n[i * 4 + 1] * m[i * 4 + 1] +
-                (uint64_t)n[i * 4 + 2] * m[i * 4 + 2] +
-                (uint64_t)n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
+DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
+DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
+DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
 void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
-- 
2.25.1


