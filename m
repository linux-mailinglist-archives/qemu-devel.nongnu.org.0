Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449E5634C5
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:56:55 +0200 (CEST)
Received: from localhost ([::1]:58888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7H8g-0003WO-JY
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7Gp3-00039a-8C; Fri, 01 Jul 2022 09:36:37 -0400
Received: from [200.168.210.66] (port=50439 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o7Gp1-0006Vs-N3; Fri, 01 Jul 2022 09:36:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 1 Jul 2022 10:35:14 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3561F80023A;
 Fri,  1 Jul 2022 10:35:14 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Subject: [PATCH RESEND 02/11] target/ppc: add macros to check privilege level
Date: Fri,  1 Jul 2022 10:34:58 -0300
Message-Id: <20220701133507.740619-3-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
References: <20220701133507.740619-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Jul 2022 13:35:14.0613 (UTC)
 FILETIME=[65229E50:01D88D4F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.coutinho@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Equivalent to CHK_SV and CHK_HV, but can be used in decodetree methods.

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
---
 target/ppc/translate.c                     | 21 +++++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  7 ++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 920bb543cf..275cffb2a7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6575,6 +6575,27 @@ static int times_16(DisasContext *ctx, int x)
         }                                               \
     } while (0)
 
+#if !defined(CONFIG_USER_ONLY)
+#define REQUIRE_SV(CTX)             \
+    do {                            \
+        if (unlikely((CTX)->pr)) {  \
+            gen_priv_opc(CTX);      \
+            return true;            \
+        }                           \
+    } while (0)
+
+#define REQUIRE_HV(CTX)                         \
+    do {                                        \
+        if (unlikely((CTX)->pr || !(CTX)->hv))  \
+            gen_priv_opc(CTX);                  \
+            return true;                        \
+        }                                       \
+    } while (0)
+#else
+#define REQUIRE_SV(CTX) do { gen_priv_opc(CTX); return true; } while (0)
+#define REQUIRE_HV(CTX) do { gen_priv_opc(CTX); return true; } while (0)
+#endif
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 1aab32be03..77d449c3cd 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -79,11 +79,8 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
     REQUIRE_INSNS_FLAGS(ctx, 64BX);
 
     if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
-        if (ctx->pr) {
-            /* lq and stq were privileged prior to V. 2.07 */
-            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
-            return true;
-        }
+        /* lq and stq were privileged prior to V. 2.07 */
+        REQUIRE_SV(ctx);
 
         if (ctx->le_mode) {
             gen_align_no_le(ctx);
-- 
2.25.1


