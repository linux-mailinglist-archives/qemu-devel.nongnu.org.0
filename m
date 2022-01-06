Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3384486B8F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 22:03:39 +0100 (CET)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Zv8-00053H-J5
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 16:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5Zt4-0001qf-Cy; Thu, 06 Jan 2022 16:01:31 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5Zsy-0002e6-2z; Thu, 06 Jan 2022 16:01:27 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id B94EE403D4;
 Thu,  6 Jan 2022 22:01:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502881;
 bh=XTxRfm9BdVnBnFiI5R4eIb6uQB8aJTIRuXIDG4Uwcv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IiIJzsRdR+TARBbvLeoX2hkrEC6lc3qwlUnMfTMidlKZLW+cJ2YAz7dO+mq+SP95J
 n4sH9GF6BNIgVKrYuDHkg1NcFADHQcUR8EFUlH9OGQPdjeszW01W9NjOi4Jk6nPfyy
 HAHLM81dBEAtwSnHtIp0laOB8kWkfXD5YIK91Y30jeFyuUaknuIzWlIwBi+O93MOFt
 6M7AI3dW126GMm9PgRvbvq6KcLJ7WkgDYNxTGRG0qR36azjN1flryqi4UiU7p03W2u
 7/Pl3LNVvOMlRlgkGwFBQZvJ9MWj3tP5F8HpEz4fgeFyTCv45rCoLUhhHdZLdFPQ52
 nuDDR9j0CaJCA==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 9DBAB6005B;
 Thu,  6 Jan 2022 22:01:21 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 69CCC140080;
 Thu,  6 Jan 2022 22:01:21 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 03/18] qemu/int128: addition of div/rem 128-bit operations
Date: Thu,  6 Jan 2022 22:00:53 +0100
Message-Id: <20220106210108.138226-4-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org, f4bug@amsat.org,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org, alistair.francis@wdc.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Addition of div and rem on 128-bit integers, using the 128/64->128 divu and
64x64->128 mulu in host-utils.
These operations will be used within div/rem helpers in the 128-bit riscv
target.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/qemu/int128.h |  27 ++++++++
 util/int128.c         | 147 ++++++++++++++++++++++++++++++++++++++++++
 util/meson.build      |   1 +
 3 files changed, 175 insertions(+)
 create mode 100644 util/int128.c

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index b6d517aea4..2c4064256c 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -172,6 +172,26 @@ static inline Int128 bswap128(Int128 a)
 #endif
 }
 
+static inline Int128 int128_divu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a / (__uint128_t)b;
+}
+
+static inline Int128 int128_remu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a % (__uint128_t)b;
+}
+
+static inline Int128 int128_divs(Int128 a, Int128 b)
+{
+    return a / b;
+}
+
+static inline Int128 int128_rems(Int128 a, Int128 b)
+{
+    return a % b;
+}
+
 #else /* !CONFIG_INT128 */
 
 typedef struct Int128 Int128;
@@ -379,6 +399,11 @@ static inline Int128 bswap128(Int128 a)
     return int128_make128(bswap64(a.hi), bswap64(a.lo));
 }
 
+Int128 int128_divu(Int128, Int128);
+Int128 int128_remu(Int128, Int128);
+Int128 int128_divs(Int128, Int128);
+Int128 int128_rems(Int128, Int128);
+
 #endif /* CONFIG_INT128 */
 
 static inline void bswap128s(Int128 *s)
@@ -386,4 +411,6 @@ static inline void bswap128s(Int128 *s)
     *s = bswap128(*s);
 }
 
+#define UINT128_MAX int128_make128(~0LL, ~0LL)
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
new file mode 100644
index 0000000000..ed8f25fef1
--- /dev/null
+++ b/util/int128.c
@@ -0,0 +1,147 @@
+/*
+ * 128-bit division and remainder for compilers not supporting __int128
+ *
+ * Copyright (c) 2021 Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/int128.h"
+
+#ifndef CONFIG_INT128
+
+/*
+ * Division and remainder algorithms for 128-bit due to Stefan Kanthak,
+ * https://skanthak.homepage.t-online.de/integer.html#udivmodti4
+ * Preconditions:
+ *     - function should never be called with v equals to 0, it has to
+ *       be dealt with beforehand
+ *     - quotien pointer must be valid
+ */
+static Int128 divrem128(Int128 u, Int128 v, Int128 *q)
+{
+    Int128 qq;
+    uint64_t hi, lo, tmp;
+    int s = clz64(v.hi);
+
+    if (s == 64) {
+        /* we have uu÷0v => let's use divu128 */
+        hi = u.hi;
+        lo = u.lo;
+        tmp = divu128(&lo, &hi, v.lo);
+        *q = int128_make128(lo, hi);
+        return int128_make128(tmp, 0);
+    } else {
+        hi = int128_gethi(int128_lshift(v, s));
+
+        if (hi > u.hi) {
+            lo = u.lo;
+            tmp = u.hi;
+            divu128(&lo, &tmp, hi);
+            lo = int128_gethi(int128_lshift(int128_make128(lo, 0), s));
+        } else { /* prevent overflow */
+            lo = u.lo;
+            tmp = u.hi - hi;
+            divu128(&lo, &tmp, hi);
+            lo = int128_gethi(int128_lshift(int128_make128(lo, 1), s));
+        }
+
+        qq = int128_make64(lo);
+
+        tmp = lo * v.hi;
+        mulu64(&lo, &hi, lo, v.lo);
+        hi += tmp;
+
+        if (hi < tmp     /* quotient * divisor >= 2**128 > dividend */
+            || hi > u.hi /* quotient * divisor > dividend */
+            || (hi == u.hi && lo > u.lo)) {
+            qq.lo -= 1;
+            mulu64(&lo, &hi, qq.lo, v.lo);
+            hi += qq.lo * v.hi;
+        }
+
+        *q = qq;
+        u.hi -= hi + (u.lo < lo);
+        u.lo -= lo;
+        return u;
+    }
+}
+
+Int128 int128_divu(Int128 a, Int128 b)
+{
+    Int128 q;
+    divrem128(a, b, &q);
+    return q;
+}
+
+Int128 int128_remu(Int128 a, Int128 b)
+{
+    Int128 q;
+    return divrem128(a, b, &q);
+}
+
+Int128 int128_divs(Int128 a, Int128 b)
+{
+    Int128 q;
+    bool sgna = !int128_nonneg(a);
+    bool sgnb = !int128_nonneg(b);
+
+    if (sgna) {
+        a = int128_neg(a);
+    }
+
+    if (sgnb) {
+        b = int128_neg(b);
+    }
+
+    divrem128(a, b, &q);
+
+    if (sgna != sgnb) {
+        q = int128_neg(q);
+    }
+
+    return q;
+}
+
+Int128 int128_rems(Int128 a, Int128 b)
+{
+    Int128 q, r;
+    bool sgna = !int128_nonneg(a);
+    bool sgnb = !int128_nonneg(b);
+
+    if (sgna) {
+        a = int128_neg(a);
+    }
+
+    if (sgnb) {
+        b = int128_neg(b);
+    }
+
+    r = divrem128(a, b, &q);
+
+    if (sgna) {
+        r = int128_neg(r);
+    }
+
+    return r;
+}
+
+#endif
diff --git a/util/meson.build b/util/meson.build
index 05b593055a..e676b2f6c6 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -48,6 +48,7 @@ util_ss.add(files('transactions.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
+util_ss.add(files('int128.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
-- 
2.34.1


