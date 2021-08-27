Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1443F954A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:43:30 +0200 (CEST)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWWP-0000Y5-JK
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0A-00016D-Or; Fri, 27 Aug 2021 03:10:11 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52425 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW08-0007Ys-Ui; Fri, 27 Aug 2021 03:10:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ6fdLz9t0Z; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=NZRVmO4G1nbaVxDAJi4F5HRlMsuWxzLGETr8Xkvg9vI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OIykcU7w5UsDfYPNtRmbo/QcIvRt4db45VM7r2PFSebKZEKemiDCR4OKmqqQScM+2
 J7i9RLEcX9YENv+RxmlTgLkd3NXJst0e+0k18elGFXW9/grcdCJiyUQ/Mapoz5TZTI
 UtwsRXva3PnDdn06Kgch8KVpuKO0ap4g0S9ZtsZM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/18] include/qemu/int128.h: introduce bswap128s
Date: Fri, 27 Aug 2021 17:09:45 +1000
Message-Id: <20210827070946.219970-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Changes the current bswap128 implementation to use __builtin_bswap128
when available, adds a bswap128 implementation for !CONFIG_INT128
builds, and introduces bswap128s based on bswap128.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210826145656.2507213-2-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/qemu/int128.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 17436d851d..2ac0746426 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -1,9 +1,9 @@
 #ifndef INT128_H
 #define INT128_H
 
-#ifdef CONFIG_INT128
 #include "qemu/bswap.h"
 
+#ifdef CONFIG_INT128
 typedef __int128_t Int128;
 
 static inline Int128 int128_make64(uint64_t a)
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
@@ -350,5 +354,16 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
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
2.31.1


