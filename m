Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D953B8CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:10:33 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjeq-00018p-71
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTT-0000Yf-EZ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTR-0001Dy-OX
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:47 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mk0BK-1nTyDx0Jgm-00kMAq; Thu, 02
 Jun 2022 13:58:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 04/19] target/m68k: Switch over exception type in
 m68k_interrupt_all
Date: Thu,  2 Jun 2022 13:58:22 +0200
Message-Id: <20220602115837.2013918-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3yy/6cRXLahJTt3MX413aSaYxSs4uxAnqC7280jofzISyv8LfxY
 JkJzon5lj5U7e21UtFV6Iv7NsQcJcQZBDOZcMCA0NRWaxZOeTyz4bpUOZw4zXPIn5KVmlXu
 vEmlj8TOa5HbGyEyOZZITK+zcJm8XqEK4o2JUBCJVb9Ek4NzjIOsr2lwS20anu14NNGWtKl
 vSzDfccZw+JPQGlhYtpcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tnIFgJhjMcw=:enrsHJTck8WR1NsvOqhQDV
 AL8QzDXCpPiWPZQhAYWLR70bjBXKfogyMRt6+KUqAYhI9JS+4lp45BLhe7ybLFU3FMOp057Xk
 pCr2xK1SHmYOQXvUYe0Uxkxf7j7a4rzF8iXACpPSrK0svtDiWOXVMW6Dt/Q99EQunGNurGCVz
 AqC8XyMT1KU6KzYRuRrv6lPCG/wbO/OrDLZtWZvL09p31OUTyN3ndUIOePvY7w9f13AMuNWqb
 /swPXCzndP+PrX3gwLUQp8lMfJbFI0d+GqzEgtka87Ga1WM3wfPzlyoKduCq+sMTk7VKVK1cR
 2iJku8ETamL5L1K0t3SCJ8h/ZuXrgloemd93fKWCSJsOJAZV5ISTJUmWKOCoc9rE0BC7hDYBn
 drtyaTEPtGIUaTqK6mvIK0NkDWqwiN3zQkk5cVfybO1Sd96xNN1kh5qfVxHNPWCbheuGFd57U
 pPgqcG8UmNJNKqJOTtytHda2Aw7UC4qrv+zNtCNHn+Q+m1A0d76tJHFpH67sdjaVTX4SLAIPg
 w6ntxmIEez2bbDLY7aB5+CdFjPI1P492JD+c4lHKfmsP/zIahFUuCkO51eok8gN7prh6B35ST
 o47DI91Y4vygzRoRHxz58KPJx9/nra7xwSu55GaLMemI3rCqf1/LavsqQOrpYK1CnqVx/T8zh
 aqHW8HllYYAi4JP49hWYTtTqHqpju4JS1V4Gj7BvgwQJ4AjdBFBLYlSfXnO/D0/3gcMnvkMwE
 9ZgFPojmwi8xYzmSFhldDlrnyNcpEgkp9XAypA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Replace an if ladder with a switch for clarity.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/op_helper.c | 49 +++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d30f988ae089..2b94a6ec84de 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -333,7 +333,8 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         sp &= ~1;
     }
 
-    if (cs->exception_index == EXCP_ACCESS) {
+    switch (cs->exception_index) {
+    case EXCP_ACCESS:
         if (env->mmu.fault) {
             cpu_abort(cs, "DOUBLE MMU FAULT\n");
         }
@@ -391,29 +392,39 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
                      "ssw:  %08x ea:   %08x sfc:  %d    dfc: %d\n",
                      env->mmu.ssw, env->mmu.ar, env->sfc, env->dfc);
         }
-    } else if (cs->exception_index == EXCP_ADDRESS) {
+        break;
+
+    case EXCP_ADDRESS:
         do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
-    } else if (cs->exception_index == EXCP_ILLEGAL ||
-               cs->exception_index == EXCP_DIV0 ||
-               cs->exception_index == EXCP_CHK ||
-               cs->exception_index == EXCP_TRAPCC ||
-               cs->exception_index == EXCP_TRACE) {
+        break;
+
+    case EXCP_ILLEGAL:
+    case EXCP_DIV0:
+    case EXCP_CHK:
+    case EXCP_TRAPCC:
+    case EXCP_TRACE:
         /* FIXME: addr is not only env->pc */
         do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
-    } else if (is_hw && oldsr & SR_M &&
-               cs->exception_index >= EXCP_SPURIOUS &&
-               cs->exception_index <= EXCP_INT_LEVEL_7) {
-        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
-        oldsr = sr;
-        env->aregs[7] = sp;
-        cpu_m68k_set_sr(env, sr &= ~SR_M);
-        sp = env->aregs[7];
-        if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
-            sp &= ~1;
+        break;
+
+    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
+        if (is_hw && oldsr & SR_M) {
+            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+            oldsr = sr;
+            env->aregs[7] = sp;
+            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            sp = env->aregs[7];
+            if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
+                sp &= ~1;
+            }
+            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
+            break;
         }
-        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
-    } else {
+        /* fall through */
+
+    default:
         do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
+        break;
     }
 
     env->aregs[7] = sp;
-- 
2.36.1


