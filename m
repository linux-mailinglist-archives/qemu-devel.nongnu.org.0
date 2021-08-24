Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B23F6A4D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 22:15:12 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIcpE-0002c3-1l
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 16:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mIcnK-0000yA-UU; Tue, 24 Aug 2021 16:13:14 -0400
Received: from [201.28.113.2] (port=17263 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mIcnJ-00064l-KH; Tue, 24 Aug 2021 16:13:14 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 24 Aug 2021 17:12:20 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 976048010FC;
 Tue, 24 Aug 2021 17:12:20 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/2] include/qemu/int128.h: define struct Int128 according to
 the host endianness
Date: Tue, 24 Aug 2021 17:11:04 -0300
Message-Id: <20210824201105.2303789-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Aug 2021 20:12:20.0973 (UTC)
 FILETIME=[584861D0:01D79924]
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 include/qemu/int128.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 64500385e3..e36c6e6db5 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -163,23 +163,28 @@ static inline Int128 bswap128(Int128 a)
 typedef struct Int128 Int128;
 
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
@@ -210,22 +215,22 @@ static inline Int128 int128_one(void)
 
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


