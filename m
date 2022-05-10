Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0405E5225D7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 22:49:05 +0200 (CEST)
Received: from localhost ([::1]:33096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noWn2-0005cr-4k
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 16:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1noWkl-00036A-N7; Tue, 10 May 2022 16:46:43 -0400
Received: from [187.72.171.209] (port=10866 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1noWkk-0006T6-4v; Tue, 10 May 2022 16:46:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 10 May 2022 17:46:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 269C5800C32;
 Tue, 10 May 2022 17:46:24 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH v2 2/3] target/ppc: Fix FPSCR.FI changing in
 float_overflow_excp()
Date: Tue, 10 May 2022 17:46:09 -0300
Message-Id: <20220510204610.100867-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 May 2022 20:46:24.0445 (UTC)
 FILETIME=[0346B6D0:01D864AF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

This patch fixes another not-so-clear situation in Power ISA
regarding the inexact bits in FPSCR. The ISA states that:

"""
When Overflow Exception is disabled (OE=0) and an
Overflow Exception occurs, the following actions are
taken:
...
2. Inexact Exception is set
XX <- 1
...
FI is set to 1
...
"""

However, when tested on a Power 9 hardware, some instructions that
trigger an OX don't set the FI bit:

xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> CLEARED
xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> CLEARED
(just a few examples. Other instructions are also affected)

The root cause for this seems to be that only instructions that list
the bit FI in the "Special Registers Altered" should modify it.

QEMU is, today, not working like the hardware:

xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> SET
xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> SET

(all tests assume FI is cleared beforehand)

Fix this by making float_overflow_excp() return float_flag_inexact
if it should update the inexact flags.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v2:
- remove the setting of FI from float_overflow_excp, making
  do_float_check_status() the only responsible for it.
- make float_overflow_excp() return float_flag_inexact if it should
  update the inexact flags.
---
 target/ppc/fpu_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f1ea4aa10e..88f9e756a5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -329,24 +329,25 @@ static inline void float_zero_divide_excp(CPUPPCState *env, uintptr_t raddr)
     }
 }
 
-static inline void float_overflow_excp(CPUPPCState *env)
+static inline int float_overflow_excp(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
 
     env->fpscr |= FP_OX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (env->fpscr & FP_OE) {
+
+    bool overflow_enabled = !!(env->fpscr & FP_OE);
+    if (overflow_enabled) {
         /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
         cs->exception_index = POWERPC_EXCP_PROGRAM;
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
-    } else {
-        env->fpscr |= FP_XX;
-        env->fpscr |= FP_FI;
     }
+
+    return overflow_enabled ? 0 : float_flag_inexact;
 }
 
 static inline void float_underflow_excp(CPUPPCState *env)
@@ -468,7 +469,7 @@ static void do_float_check_status(CPUPPCState *env, bool change_fi,
     int status = get_float_exception_flags(&env->fp_status);
 
     if (status & float_flag_overflow) {
-        float_overflow_excp(env);
+        status |= float_overflow_excp(env);
     } else if (status & float_flag_underflow) {
         float_underflow_excp(env);
     }
-- 
2.25.1


