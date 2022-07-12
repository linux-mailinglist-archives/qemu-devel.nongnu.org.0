Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF601571627
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:51:51 +0200 (CEST)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCYY-0006n6-P7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCK2-00063f-Bm
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCJz-0000dG-Ve
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8s7BnlQQLyedYCxq8eB0w4/jEtYMX51BNhdeSiILOA=;
 b=U+DQ22ZIE8byOqVesvYDnaAsDGDqJ0fXWCgY9b14gNLCgkODQ5sRD8Lmm8dML9wlX3Facj
 vqG/PNgqoOrsUSj+Kz8YyDR1dEsmEbof+zyYMrd5IZjJaSQBNDw+bePe1LKKaxtdknRLEq
 Yu4UrHcuNOUmiVDw04Vl5f+5AGaqxfA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-g3-sj1W0PGKImnLZj1Zp9A-1; Tue, 12 Jul 2022 05:36:39 -0400
X-MC-Unique: g3-sj1W0PGKImnLZj1Zp9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9386B8117B0;
 Tue, 12 Jul 2022 09:36:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B63131121314;
 Tue, 12 Jul 2022 09:36:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 09/15] util: move 256-by-128 division helpers to int128
Date: Tue, 12 Jul 2022 13:35:22 +0400
Message-Id: <20220712093528.4144184-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Break a cyclic dependency between int128 and host-utils.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/host-utils.h |   3 -
 include/qemu/int128.h     |   3 +
 util/host-utils.c         | 180 --------------------------------------
 util/int128.c             | 180 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+), 183 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 29f3a9987880..fa228a4a86e2 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -32,7 +32,6 @@
 
 #include "qemu/compiler.h"
 #include "qemu/bswap.h"
-#include "qemu/int128.h"
 
 #ifdef CONFIG_INT128
 static inline void mulu64(uint64_t *plow, uint64_t *phigh,
@@ -785,6 +784,4 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
 #endif
 }
 
-Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
-Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
 #endif
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index d2b76ca6acdc..823c61edb0fd 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -472,4 +472,7 @@ static inline void bswap128s(Int128 *s)
 #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
 #define INT128_MIN int128_make128(0, INT64_MIN)
 
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor);
+
 #endif /* INT128_H */
diff --git a/util/host-utils.c b/util/host-utils.c
index fb91bcba823d..96d5dc0bed25 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -266,183 +266,3 @@ void ulshift(uint64_t *plow, uint64_t *phigh, int32_t shift, bool *overflow)
         *plow = *plow << shift;
     }
 }
-
-/*
- * Unsigned 256-by-128 division.
- * Returns the remainder via r.
- * Returns lower 128 bit of quotient.
- * Needs a normalized divisor (most significant bit set to 1).
- *
- * Adapted from include/qemu/host-utils.h udiv_qrnnd,
- * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
- * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
- *
- * Licensed under the GPLv2/LGPLv3
- */
-static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
-{
-    Int128 d0, d1, q0, q1, r1, r0, m;
-    uint64_t mp0, mp1;
-
-    d0 = int128_make64(int128_getlo(d));
-    d1 = int128_make64(int128_gethi(d));
-
-    r1 = int128_remu(n1, d1);
-    q1 = int128_divu(n1, d1);
-    mp0 = int128_getlo(q1);
-    mp1 = int128_gethi(q1);
-    mulu128(&mp0, &mp1, int128_getlo(d0));
-    m = int128_make128(mp0, mp1);
-    r1 = int128_make128(int128_gethi(n0), int128_getlo(r1));
-    if (int128_ult(r1, m)) {
-        q1 = int128_sub(q1, int128_one());
-        r1 = int128_add(r1, d);
-        if (int128_uge(r1, d)) {
-            if (int128_ult(r1, m)) {
-                q1 = int128_sub(q1, int128_one());
-                r1 = int128_add(r1, d);
-            }
-        }
-    }
-    r1 = int128_sub(r1, m);
-
-    r0 = int128_remu(r1, d1);
-    q0 = int128_divu(r1, d1);
-    mp0 = int128_getlo(q0);
-    mp1 = int128_gethi(q0);
-    mulu128(&mp0, &mp1, int128_getlo(d0));
-    m = int128_make128(mp0, mp1);
-    r0 = int128_make128(int128_getlo(n0), int128_getlo(r0));
-    if (int128_ult(r0, m)) {
-        q0 = int128_sub(q0, int128_one());
-        r0 = int128_add(r0, d);
-        if (int128_uge(r0, d)) {
-            if (int128_ult(r0, m)) {
-                q0 = int128_sub(q0, int128_one());
-                r0 = int128_add(r0, d);
-            }
-        }
-    }
-    r0 = int128_sub(r0, m);
-
-    *r = r0;
-    return int128_or(int128_lshift(q1, 64), q0);
-}
-
-/*
- * Unsigned 256-by-128 division.
- * Returns the remainder.
- * Returns quotient via plow and phigh.
- * Also returns the remainder via the function return value.
- */
-Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
-{
-    Int128 dhi = *phigh;
-    Int128 dlo = *plow;
-    Int128 rem, dhighest;
-    int sh;
-
-    if (!int128_nz(divisor) || !int128_nz(dhi)) {
-        *plow  = int128_divu(dlo, divisor);
-        *phigh = int128_zero();
-        return int128_remu(dlo, divisor);
-    } else {
-        sh = clz128(divisor);
-
-        if (int128_ult(dhi, divisor)) {
-            if (sh != 0) {
-                /* normalize the divisor, shifting the dividend accordingly */
-                divisor = int128_lshift(divisor, sh);
-                dhi = int128_or(int128_lshift(dhi, sh),
-                                int128_urshift(dlo, (128 - sh)));
-                dlo = int128_lshift(dlo, sh);
-            }
-
-            *phigh = int128_zero();
-            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
-        } else {
-            if (sh != 0) {
-                /* normalize the divisor, shifting the dividend accordingly */
-                divisor = int128_lshift(divisor, sh);
-                dhighest = int128_rshift(dhi, (128 - sh));
-                dhi = int128_or(int128_lshift(dhi, sh),
-                                int128_urshift(dlo, (128 - sh)));
-                dlo = int128_lshift(dlo, sh);
-
-                *phigh = udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
-            } else {
-                /*
-                 * dhi >= divisor
-                 * Since the MSB of divisor is set (sh == 0),
-                 * (dhi - divisor) < divisor
-                 *
-                 * Thus, the high part of the quotient is 1, and we can
-                 * calculate the low part with a single call to udiv_qrnnd
-                 * after subtracting divisor from dhi
-                 */
-                dhi = int128_sub(dhi, divisor);
-                *phigh = int128_one();
-            }
-
-            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
-        }
-
-        /*
-         * since the dividend/divisor might have been normalized,
-         * the remainder might also have to be shifted back
-         */
-        rem = int128_urshift(rem, sh);
-        return rem;
-    }
-}
-
-/*
- * Signed 256-by-128 division.
- * Returns quotient via plow and phigh.
- * Also returns the remainder via the function return value.
- */
-Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
-{
-    bool neg_quotient = false, neg_remainder = false;
-    Int128 unsig_hi = *phigh, unsig_lo = *plow;
-    Int128 rem;
-
-    if (!int128_nonneg(*phigh)) {
-        neg_quotient = !neg_quotient;
-        neg_remainder = !neg_remainder;
-
-        if (!int128_nz(unsig_lo)) {
-            unsig_hi = int128_neg(unsig_hi);
-        } else {
-            unsig_hi = int128_not(unsig_hi);
-            unsig_lo = int128_neg(unsig_lo);
-        }
-    }
-
-    if (!int128_nonneg(divisor)) {
-        neg_quotient = !neg_quotient;
-
-        divisor = int128_neg(divisor);
-    }
-
-    rem = divu256(&unsig_lo, &unsig_hi, divisor);
-
-    if (neg_quotient) {
-        if (!int128_nz(unsig_lo)) {
-            *phigh = int128_neg(unsig_hi);
-            *plow = int128_zero();
-        } else {
-            *phigh = int128_not(unsig_hi);
-            *plow = int128_neg(unsig_lo);
-        }
-    } else {
-        *phigh = unsig_hi;
-        *plow = unsig_lo;
-    }
-
-    if (neg_remainder) {
-        return int128_neg(rem);
-    } else {
-        return rem;
-    }
-}
diff --git a/util/int128.c b/util/int128.c
index ed8f25fef161..482c63b6551e 100644
--- a/util/int128.c
+++ b/util/int128.c
@@ -145,3 +145,183 @@ Int128 int128_rems(Int128 a, Int128 b)
 }
 
 #endif
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder via r.
+ * Returns lower 128 bit of quotient.
+ * Needs a normalized divisor (most significant bit set to 1).
+ *
+ * Adapted from include/qemu/host-utils.h udiv_qrnnd,
+ * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
+ * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
+ *
+ * Licensed under the GPLv2/LGPLv3
+ */
+static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
+{
+    Int128 d0, d1, q0, q1, r1, r0, m;
+    uint64_t mp0, mp1;
+
+    d0 = int128_make64(int128_getlo(d));
+    d1 = int128_make64(int128_gethi(d));
+
+    r1 = int128_remu(n1, d1);
+    q1 = int128_divu(n1, d1);
+    mp0 = int128_getlo(q1);
+    mp1 = int128_gethi(q1);
+    mulu128(&mp0, &mp1, int128_getlo(d0));
+    m = int128_make128(mp0, mp1);
+    r1 = int128_make128(int128_gethi(n0), int128_getlo(r1));
+    if (int128_ult(r1, m)) {
+        q1 = int128_sub(q1, int128_one());
+        r1 = int128_add(r1, d);
+        if (int128_uge(r1, d)) {
+            if (int128_ult(r1, m)) {
+                q1 = int128_sub(q1, int128_one());
+                r1 = int128_add(r1, d);
+            }
+        }
+    }
+    r1 = int128_sub(r1, m);
+
+    r0 = int128_remu(r1, d1);
+    q0 = int128_divu(r1, d1);
+    mp0 = int128_getlo(q0);
+    mp1 = int128_gethi(q0);
+    mulu128(&mp0, &mp1, int128_getlo(d0));
+    m = int128_make128(mp0, mp1);
+    r0 = int128_make128(int128_getlo(n0), int128_getlo(r0));
+    if (int128_ult(r0, m)) {
+        q0 = int128_sub(q0, int128_one());
+        r0 = int128_add(r0, d);
+        if (int128_uge(r0, d)) {
+            if (int128_ult(r0, m)) {
+                q0 = int128_sub(q0, int128_one());
+                r0 = int128_add(r0, d);
+            }
+        }
+    }
+    r0 = int128_sub(r0, m);
+
+    *r = r0;
+    return int128_or(int128_lshift(q1, 64), q0);
+}
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    Int128 dhi = *phigh;
+    Int128 dlo = *plow;
+    Int128 rem, dhighest;
+    int sh;
+
+    if (!int128_nz(divisor) || !int128_nz(dhi)) {
+        *plow  = int128_divu(dlo, divisor);
+        *phigh = int128_zero();
+        return int128_remu(dlo, divisor);
+    } else {
+        sh = clz128(divisor);
+
+        if (int128_ult(dhi, divisor)) {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor = int128_lshift(divisor, sh);
+                dhi = int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo = int128_lshift(dlo, sh);
+            }
+
+            *phigh = int128_zero();
+            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
+        } else {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor = int128_lshift(divisor, sh);
+                dhighest = int128_rshift(dhi, (128 - sh));
+                dhi = int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo = int128_lshift(dlo, sh);
+
+                *phigh = udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
+            } else {
+                /*
+                 * dhi >= divisor
+                 * Since the MSB of divisor is set (sh == 0),
+                 * (dhi - divisor) < divisor
+                 *
+                 * Thus, the high part of the quotient is 1, and we can
+                 * calculate the low part with a single call to udiv_qrnnd
+                 * after subtracting divisor from dhi
+                 */
+                dhi = int128_sub(dhi, divisor);
+                *phigh = int128_one();
+            }
+
+            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
+        }
+
+        /*
+         * since the dividend/divisor might have been normalized,
+         * the remainder might also have to be shifted back
+         */
+        rem = int128_urshift(rem, sh);
+        return rem;
+    }
+}
+
+/*
+ * Signed 256-by-128 division.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divs256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    bool neg_quotient = false, neg_remainder = false;
+    Int128 unsig_hi = *phigh, unsig_lo = *plow;
+    Int128 rem;
+
+    if (!int128_nonneg(*phigh)) {
+        neg_quotient = !neg_quotient;
+        neg_remainder = !neg_remainder;
+
+        if (!int128_nz(unsig_lo)) {
+            unsig_hi = int128_neg(unsig_hi);
+        } else {
+            unsig_hi = int128_not(unsig_hi);
+            unsig_lo = int128_neg(unsig_lo);
+        }
+    }
+
+    if (!int128_nonneg(divisor)) {
+        neg_quotient = !neg_quotient;
+
+        divisor = int128_neg(divisor);
+    }
+
+    rem = divu256(&unsig_lo, &unsig_hi, divisor);
+
+    if (neg_quotient) {
+        if (!int128_nz(unsig_lo)) {
+            *phigh = int128_neg(unsig_hi);
+            *plow = int128_zero();
+        } else {
+            *phigh = int128_not(unsig_hi);
+            *plow = int128_neg(unsig_lo);
+        }
+    } else {
+        *phigh = unsig_hi;
+        *plow = unsig_lo;
+    }
+
+    if (neg_remainder) {
+        return int128_neg(rem);
+    } else {
+        return rem;
+    }
+}
-- 
2.37.0.rc0


