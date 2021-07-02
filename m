Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA23BA0EA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:07:37 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzItM-0005B1-Hz
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm7-0007cS-Jn
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm3-0007fC-AM
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id r3so6635255wmq.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UQPi/kUp+uvcW0U/4IEHWBFHwSt442+bKNNaejrY1JA=;
 b=qhwi38u3kF8PAc2ahkAFJB8e10w2GHECZZO3vrpxGpmqcRIGDGtV49bcnzP6Cp5WY9
 n38azQX4zd5mDHRCci3EKNiV24Gi9jhNDf6LugRsdBh5DyHpvGSa6VKWxih9YB+LX9Pd
 /BxoOJUsBQPboOxjrKJRUAeTb9p8ialijUg7aQr5eD/3vZUstXfPra3YSfUldaj4Hkeg
 JXNkNyiPzo1/kcxhDMN9iceRGz54pRDiREZi6rZggSGhjsM/4Q73n0q7jWX8r1svXvL6
 cC0OwVy+j7eYrN+sBTyA6wSlbjR8f9atCJgx/Xl+TkGUB0XW16fR9/D9m1wlwxZmOynR
 pcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UQPi/kUp+uvcW0U/4IEHWBFHwSt442+bKNNaejrY1JA=;
 b=n62+sdVBg1NcB8esgqw20TDlDYtTSSvieSez2nCFx8T2p5G9QUBSFiUMqszlSv90z+
 blMWdGcdDuuo/EIQ+zfZ5+xaOrGqU/DxFZZecX8wXhdvrhH6fefKqJkzNIxDuNAFWeOz
 h0dE+4uLjdm640d3t0bdhlKdZ+fuJxjF386fzuas46Qy/91uGkVBbEsNG0rZ3IAEWcBO
 b+AYmWsJm0EysOjsDurnA0nFenKHvQnLTKWbYed+GYwwH8u4OA+Xfz2yrRazTKOEeFOX
 GNRvxFeVbU4Zh9kpZdyN74hv41yuc75uAFS6/fEq8y8JaQ9Rqcds4TIxB66xJMAVnGDd
 J4bA==
X-Gm-Message-State: AOAM531FwoMLsbTLBYROL2CkjxxvTkfCPwaFIo/6ILdturKzgcJ4rW8C
 gInPQuqfarry/YBT9aHoDbK5zMmZUCXDIzHS
X-Google-Smtp-Source: ABdhPJwaExxHujyLhRLozI7jOLR5NqyMCDGJEIOmCosW0QKuiDQnt0War2i6Q+Hj73OvpS1rxjTXyw==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr5251436wma.121.1625230801845; 
 Fri, 02 Jul 2021 06:00:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
Date: Fri,  2 Jul 2021 13:59:38 +0100
Message-Id: <20210702125954.13247-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The initial implementation of the MVE VRMLALDAVH and VRMLSLDAVH
insns had some bugs:
 * the 32x32 multiply of elements was being done as 32x32->32,
   not 32x32->64
 * we were incorrectly maintaining the accumulator in its full
   72-bit form across all 4 beats of the insn; in the pseudocode
   it is squashed back into the 64 bits of the RdaHi:RdaLo
   registers after each beat

In particular, fixing the second of these allows us to recast
the implementation to avoid 128-bit arithmetic entirely.

Since the element size here is always 4, we can also drop the
parameterization of ESIZE to make the code a little more readable.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-3-peter.maydell@linaro.org
---
 target/arm/mve_helper.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 05552ce7eee..85a552fe070 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/int128.h"
 #include "cpu.h"
 #include "internals.h"
 #include "vec_internal.h"
@@ -1100,40 +1099,45 @@ DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
 DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
 
 /*
- * Rounding multiply add long dual accumulate high: we must keep
- * a 72-bit internal accumulator value and return the top 64 bits.
+ * Rounding multiply add long dual accumulate high. In the pseudocode
+ * this is implemented with a 72-bit internal accumulator value of which
+ * the top 64 bits are returned. We optimize this to avoid having to
+ * use 128-bit arithmetic -- we can do this because the 74-bit accumulator
+ * is squashed back into 64-bits after each beat.
  */
-#define DO_LDAVH(OP, ESIZE, TYPE, XCHG, EVENACC, ODDACC, TO128)         \
+#define DO_LDAVH(OP, TYPE, LTYPE, XCHG, SUB)                            \
     uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
                                     void *vm, uint64_t a)               \
     {                                                                   \
         uint16_t mask = mve_element_mask(env);                          \
         unsigned e;                                                     \
         TYPE *n = vn, *m = vm;                                          \
-        Int128 acc = int128_lshift(TO128(a), 8);                        \
-        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
             if (mask & 1) {                                             \
+                LTYPE mul;                                              \
                 if (e & 1) {                                            \
-                    acc = ODDACC(acc, TO128(n[H##ESIZE(e - 1 * XCHG)] * \
-                                            m[H##ESIZE(e)]));           \
+                    mul = (LTYPE)n[H4(e - 1 * XCHG)] * m[H4(e)];        \
+                    if (SUB) {                                          \
+                        mul = -mul;                                     \
+                    }                                                   \
                 } else {                                                \
-                    acc = EVENACC(acc, TO128(n[H##ESIZE(e + 1 * XCHG)] * \
-                                             m[H##ESIZE(e)]));          \
+                    mul = (LTYPE)n[H4(e + 1 * XCHG)] * m[H4(e)];        \
                 }                                                       \
-                acc = int128_add(acc, int128_make64(1 << 7));           \
+                mul = (mul >> 8) + ((mul >> 7) & 1);                    \
+                a += mul;                                               \
             }                                                           \
         }                                                               \
         mve_advance_vpt(env);                                           \
-        return int128_getlo(int128_rshift(acc, 8));                     \
+        return a;                                                       \
     }
 
-DO_LDAVH(vrmlaldavhsw, 4, int32_t, false, int128_add, int128_add, int128_makes64)
-DO_LDAVH(vrmlaldavhxsw, 4, int32_t, true, int128_add, int128_add, int128_makes64)
+DO_LDAVH(vrmlaldavhsw, int32_t, int64_t, false, false)
+DO_LDAVH(vrmlaldavhxsw, int32_t, int64_t, true, false)
 
-DO_LDAVH(vrmlaldavhuw, 4, uint32_t, false, int128_add, int128_add, int128_make64)
+DO_LDAVH(vrmlaldavhuw, uint32_t, uint64_t, false, false)
 
-DO_LDAVH(vrmlsldavhsw, 4, int32_t, false, int128_add, int128_sub, int128_makes64)
-DO_LDAVH(vrmlsldavhxsw, 4, int32_t, true, int128_add, int128_sub, int128_makes64)
+DO_LDAVH(vrmlsldavhsw, int32_t, int64_t, false, true)
+DO_LDAVH(vrmlsldavhxsw, int32_t, int64_t, true, true)
 
 /* Vector add across vector */
 #define DO_VADDV(OP, ESIZE, TYPE)                               \
-- 
2.20.1


