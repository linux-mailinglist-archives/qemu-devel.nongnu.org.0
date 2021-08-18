Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C01F3F0276
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 13:14:30 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGJWf-0004ZN-8f
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 07:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mGJTM-0002Yz-Fj; Wed, 18 Aug 2021 07:11:07 -0400
Received: from [201.28.113.2] (port=29581 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mGJTK-0004VP-Ut; Wed, 18 Aug 2021 07:11:04 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 18 Aug 2021 08:10:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6BE968014D6;
 Wed, 18 Aug 2021 08:10:55 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 v2 1/2] include/qemu/int128.h: introduce bswap128s
Date: Wed, 18 Aug 2021 08:06:55 -0300
Message-Id: <20210818110656.1993090-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Aug 2021 11:10:55.0860 (UTC)
 FILETIME=[B72B0340:01D79421]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.825,
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, richard.henderson@linaro.org,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Changes the current bswap128 implementation to use __builtin_bswap128
when available, adds a bswap128 implementation for !CONFIG_INT128
builds, and introduces bswap128s based on bswap128.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 include/qemu/int128.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 64500385e3..8d6ee5203f 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -155,7 +155,11 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
 
 static inline Int128 bswap128(Int128 a)
 {
+#if __has_builtin(__builtin_bswap128)
+    return __builtin_bswap128(a);
+#else
     return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
+#endif
 }
 
 #else /* !CONFIG_INT128 */
@@ -337,5 +341,16 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
     *a = int128_sub(*a, b);
 }
 
+static inline Int128 bswap128(Int128 a)
+{
+    return int128_make128(bswap64(a.hi), bswap64(a.lo));
+}
+
 #endif /* CONFIG_INT128 */
+
+static inline void bswap128s(Int128 *s)
+{
+    *s = bswap128(*s);
+}
+
 #endif /* INT128_H */
-- 
2.25.1


