Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53BD51FDA6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:11:24 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3AZ-0001DY-QR
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1no2qO-0003zw-Jr; Mon, 09 May 2022 08:50:33 -0400
Received: from [187.72.171.209] (port=40533 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1no2qM-0002Fj-Vy; Mon, 09 May 2022 08:50:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 9 May 2022 09:49:19 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3B9E7800C32;
 Mon,  9 May 2022 09:49:19 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH 2/2] target/ppc: Fix FPSCR.FI changing in float_overflow_excp()
Date: Mon,  9 May 2022 09:48:36 -0300
Message-Id: <20220509124836.27819-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509124836.27819-1-victor.colombo@eldorado.org.br>
References: <20220509124836.27819-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 May 2022 12:49:19.0911 (UTC)
 FILETIME=[334FB370:01D863A3]
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

Fix this by passing an argument to float_overflow_excp() indicating
if the FI should be set.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 773c80e12d..ee1259ede1 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -329,7 +329,7 @@ static inline void float_zero_divide_excp(CPUPPCState *env, uintptr_t raddr)
     }
 }
 
-static inline void float_overflow_excp(CPUPPCState *env)
+static inline void float_overflow_excp(CPUPPCState *env, bool set_fi)
 {
     CPUState *cs = env_cpu(env);
 
@@ -345,7 +345,9 @@ static inline void float_overflow_excp(CPUPPCState *env)
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
     } else {
         env->fpscr |= FP_XX;
-        env->fpscr |= FP_FI;
+        if (set_fi) {
+            env->fpscr |= FP_FI;
+        }
     }
 }
 
@@ -471,7 +473,7 @@ static void do_float_check_status(CPUPPCState *env, bool change_fi,
     int status = get_float_exception_flags(&env->fp_status);
 
     if (status & float_flag_overflow) {
-        float_overflow_excp(env);
+        float_overflow_excp(env, change_fi);
     } else if (status & float_flag_underflow) {
         float_underflow_excp(env);
     }
-- 
2.25.1


