Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4838CF07
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 22:25:30 +0200 (CEST)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkBi5-0005kh-Dr
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 16:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBbR-00065W-Rv; Fri, 21 May 2021 16:18:37 -0400
Received: from [201.28.113.2] (port=1319 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lkBbP-0001Nf-UZ; Fri, 21 May 2021 16:18:37 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 21 May 2021 17:18:19 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 5663F8013E6;
 Fri, 21 May 2021 17:18:19 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/9] target/ppc: reduce usage of fpscr_set_rounding_mode
Date: Fri, 21 May 2021 17:17:53 -0300
Message-Id: <20210521201759.85475-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 May 2021 20:18:19.0479 (UTC)
 FILETIME=[70B9CE70:01D74E7E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is preferable to store the current rounding mode and retore from that
than recalculating from fpscr, so we changed the behavior of do_fri and
VSX_ROUND to do it like that.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 44315fca0b..a4a283df2b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -822,6 +822,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint64_t arg,
                               int rounding_mode)
 {
     CPU_DoubleU farg;
+    FloatRoundMode old_rounding_mode = get_float_rounding_mode(&env->fp_status);
 
     farg.ll = arg;
 
@@ -834,8 +835,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint64_t arg,
                       float_flag_inexact;
         set_float_rounding_mode(rounding_mode, &env->fp_status);
         farg.ll = float64_round_to_int(farg.d, &env->fp_status);
-        /* Restore rounding mode from FPSCR */
-        fpscr_set_rounding_mode(env);
+        set_float_rounding_mode(old_rounding_mode, &env->fp_status);
 
         /* fri* does not set FPSCR[XX] */
         if (!inexact) {
@@ -3136,8 +3136,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
 {                                                                      \
     ppc_vsr_t t = *xt;                                                 \
     int i;                                                             \
+    FloatRoundMode curr_rounding_mode;                                 \
                                                                        \
     if (rmode != FLOAT_ROUND_CURRENT) {                                \
+        curr_rounding_mode = get_float_rounding_mode(&env->fp_status); \
         set_float_rounding_mode(rmode, &env->fp_status);               \
     }                                                                  \
                                                                        \
@@ -3160,7 +3162,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
      * mode from FPSCR                                                 \
      */                                                                \
     if (rmode != FLOAT_ROUND_CURRENT) {                                \
-        fpscr_set_rounding_mode(env);                                  \
+        set_float_rounding_mode(curr_rounding_mode, &env->fp_status);  \
         env->fp_status.float_exception_flags &= ~float_flag_inexact;   \
     }                                                                  \
                                                                        \
-- 
2.17.1


