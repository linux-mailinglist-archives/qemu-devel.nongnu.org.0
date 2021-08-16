Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4003EDDCB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:20:57 +0200 (CEST)
Received: from localhost ([::1]:40064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFiAK-0004T7-SG
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFi4z-0000Tx-2Y; Mon, 16 Aug 2021 15:15:25 -0400
Received: from [201.28.113.2] (port=32515 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFi4x-00046X-EO; Mon, 16 Aug 2021 15:15:24 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 16 Aug 2021 16:14:27 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 3F86B801091;
 Mon, 16 Aug 2021 16:14:27 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH for-6.2 1/2] include/qemu/int128.h: introduce bswap128s
Date: Mon, 16 Aug 2021 16:13:15 -0300
Message-Id: <20210816191316.1163622-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
References: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Aug 2021 19:14:27.0742 (UTC)
 FILETIME=[EEC563E0:01D792D2]
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Introduces bswap128s based on bswap128. Since bswap128 is defined using
int128_* methods available in either CONFIG_INT128 or !CONFIG_INT128
builds, place both outside of #ifdef CONFIG_INT128.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 include/qemu/int128.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 64500385e3..e0d385628c 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -153,11 +153,6 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
     *a -= b;
 }
 
-static inline Int128 bswap128(Int128 a)
-{
-    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
-}
-
 #else /* !CONFIG_INT128 */
 
 typedef struct Int128 Int128;
@@ -338,4 +333,15 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
 }
 
 #endif /* CONFIG_INT128 */
+
+static inline Int128 bswap128(Int128 a)
+{
+    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
+}
+
+static inline void bswap128s(Int128 *s)
+{
+    *s = bswap128(*s);
+}
+
 #endif /* INT128_H */
-- 
2.25.1


