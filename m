Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83938F7FC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:15:47 +0200 (CEST)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMbi-0005zH-Cx
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYT-0000pO-7E
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:21 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-000460-8d
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:20 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i5so21439354pgm.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSJhIg/oEj78OAJlzsUKkaERruGiMdx8U7Tjdyc3i70=;
 b=UpeH7HGx3DEoqpbxxdl1btOB4yS91c6cBOZqmH9T67vPVoRYtEG2lk0stVvr4eHB4R
 A3RUnM8VcuCwo0Y4M+C0aBSr7cvIWWjPBiPsyCYHjexbcFmoNJvKC0tJAkIVAxAxGKk7
 Mh6jTMflxELLGyMjqr4GqWso3tJTIpABwhvbVRRmXXD9FkiQY/GPJP7ZVpt3l+BWKo2l
 3/Prs35f38DYZlFWHKliSxB+FKtXNmOWDb6zKTR9aJGIiH4N3L5UHPtGSFYau8IZDher
 jUSkLQa4GbIopGRbhPx63BgAIDrRiqd39J8O9ntisURDsnwhmVYbH7SYJixgOdd2gTcU
 /dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSJhIg/oEj78OAJlzsUKkaERruGiMdx8U7Tjdyc3i70=;
 b=WpCc/GJNq9MFaqRZHy3vZuCHrclC+CjZL6JYwsQk30YwoHZMX5O7O1R00HrxfT/I9r
 2IpfKe/tvdf7f5WWMFTdLaXj7bn3LPcuQnceMZWfa58THsiYwQtrkT+4DLlZCIdw7I9t
 aDmuR0CNuhPmVRV2Aj8QKe6CjGhd3VY36uCJB2fXFlqhwDywR0rFcrCnuc6ahVhEdrw/
 J1tewg6AEURLUl82p+oiJWLwOmfL2sJ+fLU0ux2zL8/i1Ubd2bCl2N0MlhwUe+kJolWL
 LKIp61ZWReTAvFOBWsdWbmtoKqMtH9DUVO/74MLZcgBODrzP875X4wsqMwh7LY0xVb/M
 M5/Q==
X-Gm-Message-State: AOAM532gZAaU49/4Ky6EukhJSvnf8J3yBi5VQLKFcgHm0V3Tb9xuaHNn
 mIA2wQMzk/XNDanX2vT46Vkj9Coj54juQg==
X-Google-Smtp-Source: ABdhPJwz8Q1tz2CWh8KBmfj/csEz1MEWcsiN2bzrXQh3ice4lRZKDKX0YbzbrJUXHQDmhy+CPp0c2Q==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr16266249pgb.178.1621904859504; 
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 65/92] target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}
Date: Mon, 24 May 2021 18:03:31 -0700
Message-Id: <20210525010358.152808-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to add more variations on this theme.
Accept the inner loop for the _h variants, rather
than keep it unrolled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_helper.c | 160 ++++++++--------------------------------
 1 file changed, 29 insertions(+), 131 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index cddf095c74..1c4266a9c0 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -569,139 +569,37 @@ DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
 DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
 DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
-void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
-    intptr_t index = simd_data(desc);
-    int32_t *d = vd, *a = va;
-    int8_t *n = vn;
-    int8_t *m_indexed = (int8_t *)vm + H4(index) * 4;
-
-    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
-     * Otherwise opr_sz is a multiple of 16.
-     */
-    segend = MIN(4, opr_sz_4);
-    i = 0;
-    do {
-        int8_t m0 = m_indexed[i * 4 + 0];
-        int8_t m1 = m_indexed[i * 4 + 1];
-        int8_t m2 = m_indexed[i * 4 + 2];
-        int8_t m3 = m_indexed[i * 4 + 3];
-
-        do {
-            d[i] = (a[i] +
-                    n[i * 4 + 0] * m0 +
-                    n[i * 4 + 1] * m1 +
-                    n[i * 4 + 2] * m2 +
-                    n[i * 4 + 3] * m3);
-        } while (++i < segend);
-        segend = i + 4;
-    } while (i < opr_sz_4);
-
-    clear_tail(d, opr_sz, simd_maxsz(desc));
+#define DO_DOT_IDX(NAME, TYPED, TYPEN, TYPEM, HD) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);                            \
+    intptr_t opr_sz_n = opr_sz / sizeof(TYPED);                           \
+    intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);                  \
+    intptr_t index = simd_data(desc);                                     \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m_indexed = (TYPEM *)vm + HD(index) * 4;                       \
+    do {                                                                  \
+        TYPED m0 = m_indexed[i * 4 + 0];                                  \
+        TYPED m1 = m_indexed[i * 4 + 1];                                  \
+        TYPED m2 = m_indexed[i * 4 + 2];                                  \
+        TYPED m3 = m_indexed[i * 4 + 3];                                  \
+        do {                                                              \
+            d[i] = (a[i] +                                                \
+                    n[i * 4 + 0] * m0 +                                   \
+                    n[i * 4 + 1] * m1 +                                   \
+                    n[i * 4 + 2] * m2 +                                   \
+                    n[i * 4 + 3] * m3);                                   \
+        } while (++i < segend);                                           \
+        segend = i + 4;                                                   \
+    } while (i < opr_sz_n);                                               \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
-    intptr_t index = simd_data(desc);
-    uint32_t *d = vd, *a = va;
-    uint8_t *n = vn;
-    uint8_t *m_indexed = (uint8_t *)vm + H4(index) * 4;
-
-    /* Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
-     * Otherwise opr_sz is a multiple of 16.
-     */
-    segend = MIN(4, opr_sz_4);
-    i = 0;
-    do {
-        uint8_t m0 = m_indexed[i * 4 + 0];
-        uint8_t m1 = m_indexed[i * 4 + 1];
-        uint8_t m2 = m_indexed[i * 4 + 2];
-        uint8_t m3 = m_indexed[i * 4 + 3];
-
-        do {
-            d[i] = (a[i] +
-                    n[i * 4 + 0] * m0 +
-                    n[i * 4 + 1] * m1 +
-                    n[i * 4 + 2] * m2 +
-                    n[i * 4 + 3] * m3);
-        } while (++i < segend);
-        segend = i + 4;
-    } while (i < opr_sz_4);
-
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
-    intptr_t index = simd_data(desc);
-    int64_t *d = vd, *a = va;
-    int16_t *n = vn;
-    int16_t *m_indexed = (int16_t *)vm + index * 4;
-
-    /* This is supported by SVE only, so opr_sz is always a multiple of 16.
-     * Process the entire segment all at once, writing back the results
-     * only after we've consumed all of the inputs.
-     */
-    for (i = 0; i < opr_sz_8; i += 2) {
-        int64_t d0, d1;
-
-        d0  = a[i + 0];
-        d0 += n[i * 4 + 0] * (int64_t)m_indexed[i * 4 + 0];
-        d0 += n[i * 4 + 1] * (int64_t)m_indexed[i * 4 + 1];
-        d0 += n[i * 4 + 2] * (int64_t)m_indexed[i * 4 + 2];
-        d0 += n[i * 4 + 3] * (int64_t)m_indexed[i * 4 + 3];
-
-        d1  = a[i + 1];
-        d1 += n[i * 4 + 4] * (int64_t)m_indexed[i * 4 + 0];
-        d1 += n[i * 4 + 5] * (int64_t)m_indexed[i * 4 + 1];
-        d1 += n[i * 4 + 6] * (int64_t)m_indexed[i * 4 + 2];
-        d1 += n[i * 4 + 7] * (int64_t)m_indexed[i * 4 + 3];
-
-        d[i + 0] = d0;
-        d[i + 1] = d1;
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_udot_idx_h)(void *vd, void *vn, void *vm,
-                             void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc), opr_sz_8 = opr_sz / 8;
-    intptr_t index = simd_data(desc);
-    uint64_t *d = vd, *a = va;
-    uint16_t *n = vn;
-    uint16_t *m_indexed = (uint16_t *)vm + index * 4;
-
-    /* This is supported by SVE only, so opr_sz is always a multiple of 16.
-     * Process the entire segment all at once, writing back the results
-     * only after we've consumed all of the inputs.
-     */
-    for (i = 0; i < opr_sz_8; i += 2) {
-        uint64_t d0, d1;
-
-        d0  = a[i + 0];
-        d0 += n[i * 4 + 0] * (uint64_t)m_indexed[i * 4 + 0];
-        d0 += n[i * 4 + 1] * (uint64_t)m_indexed[i * 4 + 1];
-        d0 += n[i * 4 + 2] * (uint64_t)m_indexed[i * 4 + 2];
-        d0 += n[i * 4 + 3] * (uint64_t)m_indexed[i * 4 + 3];
-
-        d1  = a[i + 1];
-        d1 += n[i * 4 + 4] * (uint64_t)m_indexed[i * 4 + 0];
-        d1 += n[i * 4 + 5] * (uint64_t)m_indexed[i * 4 + 1];
-        d1 += n[i * 4 + 6] * (uint64_t)m_indexed[i * 4 + 2];
-        d1 += n[i * 4 + 7] * (uint64_t)m_indexed[i * 4 + 3];
-
-        d[i + 0] = d0;
-        d[i + 1] = d1;
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
+DO_DOT_IDX(gvec_sdot_idx_b, int32_t, int8_t, int8_t, H4)
+DO_DOT_IDX(gvec_udot_idx_b, uint32_t, uint8_t, uint8_t, H4)
+DO_DOT_IDX(gvec_sdot_idx_h, int64_t, int16_t, int16_t, )
+DO_DOT_IDX(gvec_udot_idx_h, uint64_t, uint16_t, uint16_t, )
 
 void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
                          void *vfpst, uint32_t desc)
-- 
2.25.1


