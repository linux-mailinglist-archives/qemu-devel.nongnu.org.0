Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0007943D975
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:45:54 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvQQ-0000Aj-05
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMJ-0004Ua-7s
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:39 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMG-000344-1i
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:38 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r2so4895758pgl.10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=581JqmpWQBdHSj0pgpxnhrMT8eBaZ+DSAsdPqLGFN8s=;
 b=H9oJp1BXJ1Oy0+QxRnlMQl42WMLs8AAMSEvZ8SWnl8nfZ2nN5svn9OVS7x64mqCx0Q
 WuylbNgc7vdE98VEs4zRUUOj4FF/fkHhv/eoddv85R9JZ2ucO6kyzYB174uBlD5VAE9d
 gzh8tXKPd6b6QVA+/3V2kxPqF2AESLYP9F0GPHdXgBiKaQvbUIvjWZOESri571gs5OQ9
 L8u8ccNP9YW5eP5RypX0f5pKW/g6BFK0cBC8p+35pnv0/J/iItwNL6LgFRCkfDRwROcG
 vlR1NGwOi2c9fR2EF2nHn0kNlpsh4KqCYGlSGm02lNmXEBpaXgZkSY7mZLUiGxqFXIqs
 +yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=581JqmpWQBdHSj0pgpxnhrMT8eBaZ+DSAsdPqLGFN8s=;
 b=sD3yvPaKTGa5qdgWt8lVPlsRsy97Sp+/BvLaaqRxH9s+bU8VMbHNCoXtwC/lx6ZTBQ
 PVuS8WA0AEj0q73mHzyM2wQiHYnwUSvZlCs+3K8X2Bi/3Q0DCWq/yW2D9sae8+2hV5rJ
 yD/Ii32ZlOvQgG1WnI7CPHIemwFHFdWXHhbFeyOHp0YT8Bt+ZvLWQYQxXZml2GWi64zq
 DgTE2hR0XP9g8QM4nDFkB6uxz4E0zZ4qsUXHnuCfuDsSI54kTudAkFOUe3+VqjVItXo6
 fRoJIVWaaVztU50oosj3NWHEv5Q9IUn8euti7kN0EeUvLUepzCA13MbeoZQDHoPXelJ2
 Bvyw==
X-Gm-Message-State: AOAM533v9Yefd2/s9bHXVOrv0AV1gTfMcS2fxqUF6Nu+voIE88li2wEN
 Jwo8uQE0cbzJnEUP9mJHcRxhz0CGNixUww==
X-Google-Smtp-Source: ABdhPJxB4md1j0Eejj4tvU+sMkvwiroCKHJoLYr+LW0+OgqaDOmAIl4sKsQlojcB86K8a0shMAqmOA==
X-Received: by 2002:a63:7a53:: with SMTP id j19mr1158554pgn.275.1635388894346; 
 Wed, 27 Oct 2021 19:41:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/56] host-utils: move udiv_qrnnd() to host-utils
Date: Wed, 27 Oct 2021 19:40:38 -0700
Message-Id: <20211028024131.1492790-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Move udiv_qrnnd() from include/fpu/softfloat-macros.h to host-utils,
so it can be reused by divu128().

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211025191154.350831-3-luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h | 82 ----------------------------------
 include/qemu/host-utils.h      | 81 +++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 82 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index 81c3fe8256..f35cdbfa63 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -8,7 +8,6 @@
  * so some portions are provided under:
  *  the SoftFloat-2a license
  *  the BSD license
- *  GPL-v2-or-later
  *
  * Any future contributions to this file after December 1st 2014 will be
  * taken to be licensed under the Softfloat-2a license unless specifically
@@ -75,10 +74,6 @@ this code that are retained.
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Portions of this work are licensed under the terms of the GNU GPL,
- * version 2 or later. See the COPYING file in the top-level directory.
- */
-
 #ifndef FPU_SOFTFLOAT_MACROS_H
 #define FPU_SOFTFLOAT_MACROS_H
 
@@ -585,83 +580,6 @@ static inline uint64_t estimateDiv128To64(uint64_t a0, uint64_t a1, uint64_t b)
 
 }
 
-/* From the GNU Multi Precision Library - longlong.h __udiv_qrnnd
- * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
- *
- * Licensed under the GPLv2/LGPLv3
- */
-static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
-                                  uint64_t n0, uint64_t d)
-{
-#if defined(__x86_64__)
-    uint64_t q;
-    asm("divq %4" : "=a"(q), "=d"(*r) : "0"(n0), "1"(n1), "rm"(d));
-    return q;
-#elif defined(__s390x__) && !defined(__clang__)
-    /* Need to use a TImode type to get an even register pair for DLGR.  */
-    unsigned __int128 n = (unsigned __int128)n1 << 64 | n0;
-    asm("dlgr %0, %1" : "+r"(n) : "r"(d));
-    *r = n >> 64;
-    return n;
-#elif defined(_ARCH_PPC64) && defined(_ARCH_PWR7)
-    /* From Power ISA 2.06, programming note for divdeu.  */
-    uint64_t q1, q2, Q, r1, r2, R;
-    asm("divdeu %0,%2,%4; divdu %1,%3,%4"
-        : "=&r"(q1), "=r"(q2)
-        : "r"(n1), "r"(n0), "r"(d));
-    r1 = -(q1 * d);         /* low part of (n1<<64) - (q1 * d) */
-    r2 = n0 - (q2 * d);
-    Q = q1 + q2;
-    R = r1 + r2;
-    if (R >= d || R < r2) { /* overflow implies R > d */
-        Q += 1;
-        R -= d;
-    }
-    *r = R;
-    return Q;
-#else
-    uint64_t d0, d1, q0, q1, r1, r0, m;
-
-    d0 = (uint32_t)d;
-    d1 = d >> 32;
-
-    r1 = n1 % d1;
-    q1 = n1 / d1;
-    m = q1 * d0;
-    r1 = (r1 << 32) | (n0 >> 32);
-    if (r1 < m) {
-        q1 -= 1;
-        r1 += d;
-        if (r1 >= d) {
-            if (r1 < m) {
-                q1 -= 1;
-                r1 += d;
-            }
-        }
-    }
-    r1 -= m;
-
-    r0 = r1 % d1;
-    q0 = r1 / d1;
-    m = q0 * d0;
-    r0 = (r0 << 32) | (uint32_t)n0;
-    if (r0 < m) {
-        q0 -= 1;
-        r0 += d;
-        if (r0 >= d) {
-            if (r0 < m) {
-                q0 -= 1;
-                r0 += d;
-            }
-        }
-    }
-    r0 -= m;
-
-    *r = r0;
-    return (q1 << 32) | q0;
-#endif
-}
-
 /*----------------------------------------------------------------------------
 | Returns an approximation to the square root of the 32-bit significand given
 | by `a'.  Considered as an integer, `a' must be at least 2^31.  If bit 0 of
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index e82e6239af..08a17e16e5 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -23,6 +23,10 @@
  * THE SOFTWARE.
  */
 
+/* Portions of this work are licensed under the terms of the GNU GPL,
+ * version 2 or later. See the COPYING file in the top-level directory.
+ */
+
 #ifndef HOST_UTILS_H
 #define HOST_UTILS_H
 
@@ -726,4 +730,81 @@ void urshift(uint64_t *plow, uint64_t *phigh, int32_t shift);
  */
 void ulshift(uint64_t *plow, uint64_t *phigh, int32_t shift, bool *overflow);
 
+/* From the GNU Multi Precision Library - longlong.h __udiv_qrnnd
+ * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
+ *
+ * Licensed under the GPLv2/LGPLv3
+ */
+static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
+                                  uint64_t n0, uint64_t d)
+{
+#if defined(__x86_64__)
+    uint64_t q;
+    asm("divq %4" : "=a"(q), "=d"(*r) : "0"(n0), "1"(n1), "rm"(d));
+    return q;
+#elif defined(__s390x__) && !defined(__clang__)
+    /* Need to use a TImode type to get an even register pair for DLGR.  */
+    unsigned __int128 n = (unsigned __int128)n1 << 64 | n0;
+    asm("dlgr %0, %1" : "+r"(n) : "r"(d));
+    *r = n >> 64;
+    return n;
+#elif defined(_ARCH_PPC64) && defined(_ARCH_PWR7)
+    /* From Power ISA 2.06, programming note for divdeu.  */
+    uint64_t q1, q2, Q, r1, r2, R;
+    asm("divdeu %0,%2,%4; divdu %1,%3,%4"
+        : "=&r"(q1), "=r"(q2)
+        : "r"(n1), "r"(n0), "r"(d));
+    r1 = -(q1 * d);         /* low part of (n1<<64) - (q1 * d) */
+    r2 = n0 - (q2 * d);
+    Q = q1 + q2;
+    R = r1 + r2;
+    if (R >= d || R < r2) { /* overflow implies R > d */
+        Q += 1;
+        R -= d;
+    }
+    *r = R;
+    return Q;
+#else
+    uint64_t d0, d1, q0, q1, r1, r0, m;
+
+    d0 = (uint32_t)d;
+    d1 = d >> 32;
+
+    r1 = n1 % d1;
+    q1 = n1 / d1;
+    m = q1 * d0;
+    r1 = (r1 << 32) | (n0 >> 32);
+    if (r1 < m) {
+        q1 -= 1;
+        r1 += d;
+        if (r1 >= d) {
+            if (r1 < m) {
+                q1 -= 1;
+                r1 += d;
+            }
+        }
+    }
+    r1 -= m;
+
+    r0 = r1 % d1;
+    q0 = r1 / d1;
+    m = q0 * d0;
+    r0 = (r0 << 32) | (uint32_t)n0;
+    if (r0 < m) {
+        q0 -= 1;
+        r0 += d;
+        if (r0 >= d) {
+            if (r0 < m) {
+                q0 -= 1;
+                r0 += d;
+            }
+        }
+    }
+    r0 -= m;
+
+    *r = r0;
+    return (q1 << 32) | q0;
+#endif
+}
+
 #endif
-- 
2.25.1


