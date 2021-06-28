Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A73B5F85
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:02:41 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrqS-0005cT-Hh
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmd-0002eN-Gl
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrma-00060d-E7
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:43 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j2so21423881wrs.12
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l1kvWKyRnGJlgdFG5EqrL8yOkLRenezeHxOCrluLjJ4=;
 b=jL6keDiKMUryRcvyaA0uK5dbOwbTIf76HTYobAGkVefMKNVWnOIBBVVdLZifNsdPTr
 bSD15W2P5e4b/F1mQSAIUpIqW1hrYEI3u1dIdtivQELf8JqXqO2OrJOsfR6mei/6V9XN
 BqQjcjT8QniOFzjwX5VlVd1hXm6zd6CDgvPN/eqnaPugG7y2NaaRUwTFLRViW6VSTrA+
 dSgA+0t8A1qizXOM0ez51IPb/ucaOtKILlVVvLeNptQAhcnnUD+fwNVPzIhEieQnaLl7
 Nsox6sGjqNfQSvrs7n/KK7LRe0Ws3WSkYL2CO4gSdlfLbpfatt3tmdHHW1xKlnDCJMy+
 Yx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1kvWKyRnGJlgdFG5EqrL8yOkLRenezeHxOCrluLjJ4=;
 b=BtJfGu3f1HAO/ao3rPDug76G9r6VOLzhyCmDAd+9Kv/x6rmDfOtpPuQWSjMHsLUSoD
 +8MYnPXoEFoGLP2dfsc2S7QJSlJAHqR2ZaySddPIEnRLxcIbRJUfJC6Y5fX+CnznGELl
 ea5h3817/6c4A7vpqMudmoc69iX9M//ZKybArzz/D9TyIyiKySEY62ilxYyvxFfNb+oX
 /oaYqJanCLgrotRvbRJPYD3hSi8nTGeebDiaSQ0Dn2GhsHb+kh8YQFmXVXz05+torENz
 jTmQE3WS9JWoFB2GQ0ca9lZPPqwo8TTUWWSkvgTRfifD29Yi8LHzdxUKtH5psqxBsPSs
 TF5g==
X-Gm-Message-State: AOAM532TDSEGNd1JfZf8hmChkjmCHubW/WdJVfJr6q6velSPxL6ni8yF
 iwT1Wja85kP+wK7HIFZtf+Ndvg==
X-Google-Smtp-Source: ABdhPJwz9yWnui1Veql75Zmi5bcRgzkaZWFFwcsdbH/iVwLtxZNz1ow0iKw37l3fj6FK4lJrWzsraA==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr26800969wry.175.1624888718932; 
 Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/18] target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
Date: Mon, 28 Jun 2021 14:58:19 +0100
Message-Id: <20210628135835.6690-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
---
Richard suggested this change in review of v1 of the original
MVE-slice-1 series, but at that time I was incorrectly reading the
pseudocode as requiring the 72-bit accumulation over all four beats.
Testing with a wider range of inputs showed I was wrong...
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


