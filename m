Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8A5AD349
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:58:13 +0200 (CEST)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBg4-0002m4-UV
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVBMt-0004gM-NV; Mon, 05 Sep 2022 08:38:23 -0400
Received: from [200.168.210.66] (port=8387 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVBMs-0005xB-1Z; Mon, 05 Sep 2022 08:38:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 5 Sep 2022 09:38:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2120A8001D1;
 Mon,  5 Sep 2022 09:38:04 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH 3/3] target/ppc: Merge fsqrt and fsqrts helpers
Date: Mon,  5 Sep 2022 09:37:46 -0300
Message-Id: <20220905123746.54659-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Sep 2022 12:38:04.0581 (UTC)
 FILETIME=[57F0C550:01D8C124]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

These two helpers are almost identical, differing only by the softfloat
operation it calls. Merge them into one using a macro.
Also, take this opportunity to capitalize the helper name as we moved
the instruction to decodetree in a previous patch.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c            | 35 +++++++++++-------------------
 target/ppc/helper.h                |  4 ++--
 target/ppc/translate/fp-impl.c.inc |  4 ++--
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 0f045b70f8..32995179b5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -830,30 +830,21 @@ static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
     }
 }
 
-/* fsqrt - fsqrt. */
-float64 helper_fsqrt(CPUPPCState *env, float64 arg)
-{
-    float64 ret = float64_sqrt(arg, &env->fp_status);
-    int flags = get_float_exception_flags(&env->fp_status);
-
-    if (unlikely(flags & float_flag_invalid)) {
-        float_invalid_op_sqrt(env, flags, 1, GETPC());
-    }
-
-    return ret;
+#define FPU_FSQRT(name, op)                                                   \
+float64 helper_##name(CPUPPCState *env, float64 arg)                          \
+{                                                                             \
+    float64 ret = op(arg, &env->fp_status);                                   \
+    int flags = get_float_exception_flags(&env->fp_status);                   \
+                                                                              \
+    if (unlikely(flags & float_flag_invalid)) {                               \
+        float_invalid_op_sqrt(env, flags, 1, GETPC());                        \
+    }                                                                         \
+                                                                              \
+    return ret;                                                               \
 }
 
-/* fsqrts - fsqrts. */
-float64 helper_fsqrts(CPUPPCState *env, float64 arg)
-{
-    float64 ret = float64r32_sqrt(arg, &env->fp_status);
-    int flags = get_float_exception_flags(&env->fp_status);
-
-    if (unlikely(flags & float_flag_invalid)) {
-        float_invalid_op_sqrt(env, flags, 1, GETPC());
-    }
-    return ret;
-}
+FPU_FSQRT(FSQRT, float64_sqrt)
+FPU_FSQRT(FSQRTS, float64r32_sqrt)
 
 /* fre - fre. */
 float64 helper_fre(CPUPPCState *env, float64 arg)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 159b352f6e..68610896b8 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -116,8 +116,8 @@ DEF_HELPER_4(fmadds, i64, env, i64, i64, i64)
 DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
-DEF_HELPER_2(fsqrt, f64, env, f64)
-DEF_HELPER_2(fsqrts, f64, env, f64)
+DEF_HELPER_2(FSQRT, f64, env, f64)
+DEF_HELPER_2(FSQRTS, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 7a90c0e350..8d5cf0f982 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -280,8 +280,8 @@ static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
     return true;
 }
 
-TRANS(FSQRT, do_helper_fsqrt, gen_helper_fsqrt);
-TRANS(FSQRTS, do_helper_fsqrt, gen_helper_fsqrts);
+TRANS(FSQRT, do_helper_fsqrt, gen_helper_FSQRT);
+TRANS(FSQRTS, do_helper_fsqrt, gen_helper_FSQRTS);
 
 /***                     Floating-Point multiply-and-add                   ***/
 /* fmadd - fmadds */
-- 
2.25.1


