Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51FB5A992D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:41:24 +0200 (CEST)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkRf-0001Vx-Qj
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk6v-0007wE-Nt; Thu, 01 Sep 2022 09:20:06 -0400
Received: from [200.168.210.66] (port=59496 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oTk6u-0002b5-3s; Thu, 01 Sep 2022 09:19:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 1 Sep 2022 10:18:18 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4D665800476;
 Thu,  1 Sep 2022 10:18:18 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH 12/19] target/ppc: Clear fpstatus flags on VSX_CVT_FP_TO_INT2
Date: Thu,  1 Sep 2022 10:17:49 -0300
Message-Id: <20220901131756.26060-13-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Sep 2022 13:18:18.0744 (UTC)
 FILETIME=[4D3DCF80:01D8BE05]
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

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c6dc14d653..6f9a1a755e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2981,12 +2981,12 @@ VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
 #define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, sfi, rnan)                    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    int all_flags = env->fp_status.float_exception_flags, flags;             \
     ppc_vsr_t t = { };                                                       \
-    int i;                                                                   \
+    int i, flags;                                                            \
+                                                                             \
+    helper_reset_fpstatus(env);                                              \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
-        env->fp_status.float_exception_flags = 0;                            \
         t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i),          \
                                                        &env->fp_status);     \
         flags = env->fp_status.float_exception_flags;                        \
@@ -2995,11 +2995,9 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                               rnan, 0, GETPC());             \
         }                                                                    \
         t.VsrW(2 * i + 1) = t.VsrW(2 * i);                                   \
-        all_flags |= flags;                                                  \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    env->fp_status.float_exception_flags = all_flags;                        \
     do_float_check_status(env, sfi, GETPC());                                \
 }
 
-- 
2.25.1


