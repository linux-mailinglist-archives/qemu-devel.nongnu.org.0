Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E0387C61
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:23:59 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1Ze-0006uc-KN
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1JA-0004oj-TU; Tue, 18 May 2021 11:06:56 -0400
Received: from [201.28.113.2] (port=38818 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lj1J8-00087L-7e; Tue, 18 May 2021 11:06:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 18 May 2021 12:05:36 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 41214801362;
 Tue, 18 May 2021 12:05:36 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] target/ppc: reduce usage of fpscr_set_rounding_mode
Date: Tue, 18 May 2021 12:05:11 -0300
Message-Id: <20210518150515.57983-4-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 18 May 2021 15:05:36.0429 (UTC)
 FILETIME=[41D655D0:01D74BF7]
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
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is preferable to store the current rounding mode and restore from that
than recalculating from fpscr, so we changed the behavior of do_fri and
VSX_ROUND to do it like that.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 44315fca0b..4799d5f5e4 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -822,6 +822,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint64_t arg,
                               int rounding_mode)
 {
     CPU_DoubleU farg;
+    int old_rounding_mode = get_float_rounding_mode(&env->fp_status);
 
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
+    int curr_rounding_mode;                                            \
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


