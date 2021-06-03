Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D1399D11
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:49:53 +0200 (CEST)
Received: from localhost ([::1]:56566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj33-0005qw-0B
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loida-0007g1-9J; Thu, 03 Jun 2021 04:23:36 -0400
Received: from ozlabs.org ([203.11.71.1]:39485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidV-0000Eh-P5; Thu, 03 Jun 2021 04:23:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5p2bHqz9t1C; Thu,  3 Jun 2021 18:22:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708558;
 bh=kDJVqG+bzWC1QonnW5Rpx3+CeFSgdJ1MeAx68uLsmBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CoABG7r3PM9s6NPMMr2PTA6ZJsqPIJBgCoMslb716IGwQH8VNJMdyv3//wYbZx3AX
 GaqiPqTGR5Of/2ddz1QRNTxoa+9l0uONfdz1dfRy5FGDf4KJlD3AgGHpXoXJ7QDvns
 CX0Rj4YT3rqsIB2OV9CYJGj64sS9rIaue3skcc94=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 28/42] target/ppc: Introduce macros to check isa extensions
Date: Thu,  3 Jun 2021 18:22:17 +1000
Message-Id: <20210603082231.601214-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These will be used by the decodetree trans_* functions
to early-exit when the instruction set is not enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-2-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e16a2721e2..11fd3342a0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7664,6 +7664,32 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
     tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
 }
 
+/*
+ * Helpers for trans_* functions to check for specific insns flags.
+ * Use token pasting to ensure that we use the proper flag with the
+ * proper variable.
+ */
+#define REQUIRE_INSNS_FLAGS(CTX, NAME) \
+    do {                                                \
+        if (((CTX)->insns_flags & PPC_##NAME) == 0) {   \
+            return false;                               \
+        }                                               \
+    } while (0)
+
+#define REQUIRE_INSNS_FLAGS2(CTX, NAME) \
+    do {                                                \
+        if (((CTX)->insns_flags2 & PPC2_##NAME) == 0) { \
+            return false;                               \
+        }                                               \
+    } while (0)
+
+/* Then special-case the check for 64-bit so that we elide code for ppc32. */
+#if TARGET_LONG_BITS == 32
+# define REQUIRE_64BIT(CTX)  return false
+#else
+# define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
+#endif
+
 #include "translate/fp-impl.c.inc"
 
 #include "translate/vmx-impl.c.inc"
-- 
2.31.1


