Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B644A6C4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:21:42 +0100 (CET)
Received: from localhost ([::1]:51446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKVp-0007cF-Vq
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:21:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3l-0004UH-FU; Tue, 09 Nov 2021 00:52:44 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=50211
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3j-0006gz-16; Tue, 09 Nov 2021 00:52:40 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp1250z4xdq; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=la4jD0mygrsjfKVP/LV8XfnLpo0mWqDcG5myMILlX44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B0KQNn1bGvj4N3uJjiwIwXmL78DwPQ6PKBv+DSVPWN74vlsoQZby6xMwA1Z4esyCI
 BmMJNVm65LuGDLep+nLRg7pJhRXmoG0j70hCVGYKcmA+XTBYocB/H2Tv5NnJhKic2W
 NvugKQXH9JffLBNIRFjCenofUD1/0ApeXX4XA4AI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 15/54] host-utils: Introduce mulu128
Date: Tue,  9 Nov 2021 16:51:25 +1100
Message-Id: <20211109055204.230765-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211029192417.400707-6-luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/qemu/host-utils.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index a3a7ced78d..ca979dc6cc 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -590,6 +590,42 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
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
+    return uadd64_overflow(ahi, blo, phigh) || bhi != 0;
+#endif
+}
+
 /**
  * uadd64_carry - addition with carry-in and carry-out
  * @x, @y: addends
-- 
2.33.1


