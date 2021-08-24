Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593213F60B2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:41:08 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXbu-00039M-Nb
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIXPi-0007Vc-81; Tue, 24 Aug 2021 10:28:30 -0400
Received: from [201.28.113.2] (port=1602 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIXPg-0007tk-RP; Tue, 24 Aug 2021 10:28:30 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 24 Aug 2021 11:28:09 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1329B8010FC;
 Tue, 24 Aug 2021 11:28:09 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 10/19] host-utils: Introduce mulu128
Date: Tue, 24 Aug 2021 11:27:21 -0300
Message-Id: <20210824142730.102421-11-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824142730.102421-1-luis.pires@eldorado.org.br>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Aug 2021 14:28:09.0277 (UTC)
 FILETIME=[42E9A6D0:01D798F4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 include/qemu/host-utils.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 8e8cab9a3e..2e3b5ad989 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -588,6 +588,44 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 #endif
 }
 
+/*
+ * Unsigned 128x64 multiplication.
+ * Returns true if the result got truncated to 128 bits.
+ * Otherwise, returns false and the multiplication result via plow and phigh.
+ */
+static inline bool mulu128(uint64_t *plow, uint64_t *phigh, uint64_t factor)
+{
+#if defined(CONFIG_INT128) && \
+    (__has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5)
+    bool res;
+    __uint128_t r;
+    __uint128_t f = ((__uint128_t)*phigh << 64) | *plow;
+    res = __builtin_mul_overflow(f, factor, &r);
+
+    *plow = r;
+    *phigh = r >> 64;
+
+    return res;
+#else
+    uint64_t dhi = *phigh;
+    uint64_t dlo = *plow;
+    uint64_t ahi;
+    uint64_t blo, bhi;
+
+    if (dhi == 0) {
+        mulu64(plow, phigh, dlo, factor);
+        return false;
+    }
+
+    mulu64(plow, &ahi, dlo, factor);
+    mulu64(&blo, &bhi, dhi, factor);
+
+    *phigh = ahi + blo;
+
+    return (bhi > 0) || (*phigh < ahi);
+#endif
+}
+
 /**
  * uadd64_carry - addition with carry-in and carry-out
  * @x, @y: addends
-- 
2.25.1


