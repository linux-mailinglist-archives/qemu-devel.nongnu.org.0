Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7F390659
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:13:32 +0200 (CEST)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZgR-00072m-5J
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc7-0004q2-Ek
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:05:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYc2-0004xq-Vf
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y14so30536227wrm.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+bOfLpvouOuV/Y1Sf+QxghmvIsc8jusvRm3A0lB5dUk=;
 b=odTGxwXbftZkvMNMSe0GjdSThCW8untd2PL6VVGaGYkmiQt/FDTRBMPYtWqnmhl1JJ
 Og67+AxqvbE0cb0kdJ+SEX5p4K5Q8Jao9D/9nOocVIymtT1aOln5/ibUu/H2yVUUeoIf
 L3QJLxJ0A544F4z41/U9zgtWkD29EGT9M+ShVlYuU1Mc+trJWFIqVAHMCBPB44mh5CJe
 rK5cYqJHILF7YaracdXHMEa5LkxKW0nnyrDqdFiWiNfc/7gp2MRbe/ghOkiTQknBKRI2
 9QAmD5b9ZrNBWcUddLvvr7Dt+fIoccA9JURGGoqUaV6HZ0k13MoGqZ+7wjnAs9fj0gWZ
 0IWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bOfLpvouOuV/Y1Sf+QxghmvIsc8jusvRm3A0lB5dUk=;
 b=NBr2w1wMrq+YIlqUAcKNXho0VStJjA7zW8BgJcAsBOWcxRmN723RJPGJw3Ss0gCtJf
 I5yXC6yFNs5pylIvEUP95pWq0uW1id7saT+hs7qsCpk5FXkIDrCqqn8ZWImLQOhrFwub
 brI1GlCC4zpk16Xj5uO49yCwZ0Qhzor+UZutWv1Apo3do1j+a/Z/AhfijrCBXzbn5vyb
 Asq7GQkdCRUVBxk4r2eoUIUWos7iNcT3zCbQAG/qkX0c+RmIUtwy7Wacy0/LqB1kmwNQ
 PovVkIgyAr0V8vslaZwcz2F829WHyt0CF6ADcTRp3N3UyyAuMWIz5fnQ0nim5AVSB+AS
 8eBA==
X-Gm-Message-State: AOAM53045iTWhxzjVSaHozUgnFGiQQyF3Cj4jtYU/V0SQ9roQdSatLpF
 g5oPMU1Pl5/SZGjtsFMFWcIDvhJJxullP4yH
X-Google-Smtp-Source: ABdhPJx5eoMvTX/wLNA9xgdLD9AsF3I/dm3N/+t2b1auPc43WhRVukZRQe2UmicwHFpgKVbxgQ/TkA==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr26993128wrw.208.1621955093526; 
 Tue, 25 May 2021 08:04:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 087/114] target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}
Date: Tue, 25 May 2021 16:02:57 +0100
Message-Id: <20210525150324.32370-88-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We're about to add more variations on this theme.
Accept the inner loop for the _h variants, rather
than keep it unrolled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-66-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_helper.c | 160 ++++++++--------------------------------
 1 file changed, 29 insertions(+), 131 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index cddf095c74a..1c4266a9c09 100644
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
2.20.1


