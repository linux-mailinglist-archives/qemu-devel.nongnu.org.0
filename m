Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E658AC53
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:21:53 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyD1-0004Lx-Mw
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJy7A-00081w-Jn; Fri, 05 Aug 2022 10:15:49 -0400
Received: from [200.168.210.66] (port=13350 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJy78-0004vg-IQ; Fri, 05 Aug 2022 10:15:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 5 Aug 2022 11:15:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 78168800358;
 Fri,  5 Aug 2022 11:15:23 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/2] target/ppc: Bugfix FP when OE/UE are set
Date: Fri,  5 Aug 2022 11:15:22 -0300
Message-Id: <20220805141522.412864-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Aug 2022 14:15:23.0704 (UTC)
 FILETIME=[CD85FB80:01D8A8D5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

When an overflow exception occurs and OE is set the intermediate result
should be adjusted (by subtracting from the exponent) to avoid rounding
to inf. The same applies to an underflow exceptionion and UE (but adding
to the exponent). To do this set the fp_status.rebias_overflow when OE
is set and fp_status.rebias_underflow when UE is set as the FPU will
recalculate in case of a overflow/underflow if the according rebias* is
set.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/cpu.c        | 2 ++
 target/ppc/fpu_helper.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 401b6f9e63..0ebac04bc4 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -120,6 +120,8 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
         val |= FP_FEX;
     }
     env->fpscr = val;
+    env->fp_status.rebias_overflow  = (FP_OE & env->fpscr) ? true : false;
+    env->fp_status.rebias_underflow = (FP_UE & env->fpscr) ? true : false;
     if (tcg_enabled()) {
         fpscr_set_rounding_mode(env);
     }
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 134804628b..c17575de5d 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -344,7 +344,6 @@ static inline int float_overflow_excp(CPUPPCState *env)
 
     bool overflow_enabled = !!(env->fpscr & FP_OE);
     if (overflow_enabled) {
-        /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
@@ -363,7 +362,6 @@ static inline void float_underflow_excp(CPUPPCState *env)
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
     if (env->fpscr & FP_UE) {
-        /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
-- 
2.31.1


