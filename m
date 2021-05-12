Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6229F37D3D5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:25:54 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguUT-0007OP-Dy
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu3u-0000GJ-35; Wed, 12 May 2021 14:58:26 -0400
Received: from [201.28.113.2] (port=47887 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu3r-0000ms-La; Wed, 12 May 2021 14:58:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id CADB58000C2;
 Wed, 12 May 2021 15:56:04 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 18/31] target/ppc: Introduce macros to check isa extensions
Date: Wed, 12 May 2021 15:54:28 -0300
Message-Id: <20210512185441.3619828-19-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:05.0141 (UTC)
 FILETIME=[75E9D450:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These will be used by the decodetree trans_* functions
to early-exit when the instruction set is not enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index cd4b34aa91..153c61e8ec 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7753,6 +7753,32 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
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
2.25.1


