Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B23F8A04
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:23:07 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGHZ-00027l-QE
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGBR-0006MM-94; Thu, 26 Aug 2021 10:16:45 -0400
Received: from [201.28.113.2] (port=2975 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGBP-0003xy-Qz; Thu, 26 Aug 2021 10:16:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 26 Aug 2021 11:15:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 74510800930;
 Thu, 26 Aug 2021 11:15:24 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 1/2] include/qemu/int128.h: define struct Int128 according
 to the host endianness
Date: Thu, 26 Aug 2021 11:14:45 -0300
Message-Id: <20210826141446.2488609-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
References: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Aug 2021 14:15:24.0833 (UTC)
 FILETIME=[D0184110:01D79A84]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


