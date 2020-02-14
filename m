Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E415DD5E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 16:58:38 +0100 (CET)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2dMT-0006tt-73
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 10:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j2dLk-0006CX-H8
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:57:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j2dLi-0007bY-OC
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:57:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:17083)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j2dLi-0007Zt-1a; Fri, 14 Feb 2020 10:57:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2AA6A7461AE;
 Fri, 14 Feb 2020 16:57:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0896B745953; Fri, 14 Feb 2020 16:57:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 14 Feb 2020 00:57:34 +0100
Subject: [PATCH v2] target/ppc: Fix typo in comments
To: qemu-devel@nongnu.org
Message-Id: <20200214155748.0896B745953@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Deferred" was misspelled as "differed" in some comments, correct this
typo,

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: Found one more where even the typo was misspelled

target/ppc/fpu_helper.c            | 4 ++--
 target/ppc/translate/fp-impl.inc.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index dc383242f7..ae43b08eb5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -293,7 +293,7 @@ static void float_invalid_op_vxvc(CPUPPCState *env, bool set_fpcc,
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_VXVC;
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
-        /* Exception is differed */
+        /* Exception is deferred */
     }
 }
 
@@ -644,7 +644,7 @@ static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
 
     if (cs->exception_index == POWERPC_EXCP_PROGRAM &&
         (env->error_code & POWERPC_EXCP_FP)) {
-        /* Differred floating-point exception after target FPR update */
+        /* Deferred floating-point exception after target FPR update */
         if (fp_exceptions_enabled(env)) {
             raise_exception_err_ra(env, cs->exception_index,
                                    env->error_code, raddr);
diff --git a/target/ppc/translate/fp-impl.inc.c b/target/ppc/translate/fp-impl.inc.c
index d8e27bf4d5..9f7868ee28 100644
--- a/target/ppc/translate/fp-impl.inc.c
+++ b/target/ppc/translate/fp-impl.inc.c
@@ -781,7 +781,7 @@ static void gen_mtfsb1(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
 }
 
@@ -817,7 +817,7 @@ static void gen_mtfsf(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
     tcg_temp_free_i64(t1);
 }
@@ -850,7 +850,7 @@ static void gen_mtfsfi(DisasContext *ctx)
         tcg_gen_trunc_tl_i32(cpu_crf[1], cpu_fpscr);
         tcg_gen_shri_i32(cpu_crf[1], cpu_crf[1], FPSCR_OX);
     }
-    /* We can raise a differed exception */
+    /* We can raise a deferred exception */
     gen_helper_float_check_status(cpu_env);
 }
 
-- 
2.21.1


