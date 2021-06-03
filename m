Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B7399C7D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:25:09 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loif6-0000rS-GE
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicv-000678-0k; Thu, 03 Jun 2021 04:22:55 -0400
Received: from ozlabs.org ([203.11.71.1]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loics-0008Mr-5I; Thu, 03 Jun 2021 04:22:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l3TGpz9sX2; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=+veWRm3qciPKOMdhHBBZez0+/vh39rCngCu+l7WZZ2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fpvubgL5FhyN98jGHn37bjFhyIE72Nl516cWmFNNUDMh/JxsjRPvigjTgPW33pGqB
 dkHxR2ly2GrkGXqHqzlkPW75IBeqoq1zRaAIUi9xBuY6bm0Pu7h8CyN/QyAcYEetyl
 ERP6lWABg5fp7RG6RQKdKEnfBnm8yOH3fOkNU2xk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/42] target/ppc: reduce usage of fpscr_set_rounding_mode
Date: Thu,  3 Jun 2021 18:21:52 +1000
Message-Id: <20210603082231.601214-4-david@gibson.dropbear.id.au>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

It is preferable to store the current rounding mode and retore from that
than recalculating from fpscr, so we changed the behavior of do_fri and
VSX_ROUND to do it like that.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210521201759.85475-4-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


