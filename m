Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58893F9509
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:23:57 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWDU-0002F6-MF
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0S-0001S6-BH; Fri, 27 Aug 2021 03:10:28 -0400
Received: from ozlabs.org ([203.11.71.1]:46179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0Q-0007Vq-BH; Fri, 27 Aug 2021 03:10:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ5KnZz9sX2; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=bUh5/q/VVnQa7Kk2hGPDSzdTWw52OKrXjW7L7R48MVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kkrXfjhMXPBUT5x0CpG8864lAGVPYMoePOScLnQ9976oYl1KQYyNBut1jPyqsas8P
 JF4+2AUcBo+VMfcK1n8+Wklw+YBYoWnagTY9Jvki2OyEJ06Zlca8Jjl6H6tdUG8Ymd
 kRUP65AYKNYGhCqkdfIo3HC4cmKz5M0sA5LzfK5s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/18] include/qemu/int128.h: define struct Int128 according to
 the host endianness
Date: Fri, 27 Aug 2021 17:09:43 +1000
Message-Id: <20210827070946.219970-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210826141446.2488609-2-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/qemu/int128.h | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 64500385e3..17436d851d 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -162,24 +162,37 @@ static inline Int128 bswap128(Int128 a)
 
 typedef struct Int128 Int128;
 
+/*
+ * We guarantee that the in-memory byte representation of an
+ * Int128 is that of a host-endian-order 128-bit integer
+ * (whether using this struct or the __int128_t version of the type).
+ * Some code using this type relies on this (eg when copying it into
+ * guest memory or a gdb protocol buffer, or by using Int128 in
+ * a union with other integer types).
+ */
 struct Int128 {
+#ifdef HOST_WORDS_BIGENDIAN
+    int64_t hi;
+    uint64_t lo;
+#else
     uint64_t lo;
     int64_t hi;
+#endif
 };
 
 static inline Int128 int128_make64(uint64_t a)
 {
-    return (Int128) { a, 0 };
+    return (Int128) { .lo = a, .hi = 0 };
 }
 
 static inline Int128 int128_makes64(int64_t a)
 {
-    return (Int128) { a, a >> 63 };
+    return (Int128) { .lo = a, .hi = a >> 63 };
 }
 
 static inline Int128 int128_make128(uint64_t lo, uint64_t hi)
 {
-    return (Int128) { lo, hi };
+    return (Int128) { .lo = lo, .hi = hi };
 }
 
 static inline uint64_t int128_get64(Int128 a)
@@ -210,22 +223,22 @@ static inline Int128 int128_one(void)
 
 static inline Int128 int128_2_64(void)
 {
-    return (Int128) { 0, 1 };
+    return int128_make128(0, 1);
 }
 
 static inline Int128 int128_exts64(int64_t a)
 {
-    return (Int128) { .lo = a, .hi = (a < 0) ? -1 : 0 };
+    return int128_make128(a, (a < 0) ? -1 : 0);
 }
 
 static inline Int128 int128_and(Int128 a, Int128 b)
 {
-    return (Int128) { a.lo & b.lo, a.hi & b.hi };
+    return int128_make128(a.lo & b.lo, a.hi & b.hi);
 }
 
 static inline Int128 int128_or(Int128 a, Int128 b)
 {
-    return (Int128) { a.lo | b.lo, a.hi | b.hi };
+    return int128_make128(a.lo | b.lo, a.hi | b.hi);
 }
 
 static inline Int128 int128_rshift(Int128 a, int n)
-- 
2.31.1


