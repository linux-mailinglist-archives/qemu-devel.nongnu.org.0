Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B55387156
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:37:09 +0200 (CEST)
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisPk-00041t-8d
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKe-0007P7-QY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:52 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKb-00075g-Nl
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:52 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFbBO-1lhG3B2ays-00H9AI; Tue, 18
 May 2021 07:31:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 29/59] linux-user/sparc: Add 64-bit support to fpu save/restore
Date: Tue, 18 May 2021 07:31:01 +0200
Message-Id: <20210518053131.87212-30-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kbm87H6GosaiRgNfHBPWWlsPUgW5jJAWAt8CM7dvKd8pnjCOOo3
 4fbBeyGomwdL0YfmPPDQRpu1i5UrKkY+5Frg0+PtHXfY2CZizY0XRrB9MidXjEamq3CZojr
 zb4HKD0+pFxCbNC3PSjB6dNlJHH72FnIL/mWmF5baWqzcRtUR61jFQ0Ry3BaE4OH/+smadM
 JQMBvK37/W46omGgx/Ocg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nppYtzIi45Y=:f8HQUzN/s2J0+LgxIg88ZA
 ctIibT7A7SintwICXViQb7QjD4ckUtrmmgN9uoJnhPUS1Oz0zVB34pFl+7WAcsjgthiMUCc4O
 KafOLDDyLru7RqUzTD7BVH4MPDewP+TTAExMEPgGBOVlO28jNn11gS6G1EKoUxUSGGUfMDdkw
 EYcKTJpeVupvqFVSuvDb3VDYp1Ott4dEhI7WSN79HjCzJJa4d4Wvc0cw3ajcy3P1EnhKUT43f
 F90kXdbfUkmVzyiX4mXYZd5fp1afUqJLomQ0+6QsBKXGoQNELG5gf/XiN3QS4q8SH9CVPUOpy
 a70mpudWDA3cUF+AhARdL5CPcFV5U83eMbot9kX8CD+old1N+jXFkIUF+B/W1WPq1v+6fzCfZ
 9MtbTy0ug078g+zY+7+s4Y5eD5Mhe4DST5xZ8Hd7/i7VCvF+ZTivjf0L8gT6hiI/TzmkmZoKL
 ZJthaabq0taY3Pd9isIXYyhPo+EZsgZsBYBpSJRzNNsdnccJVLr19ZkCO4stSJ99nhKDqIDPl
 Pjq/bN+6rEs1Udsf+TiZBs=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The shape of the kernel's __siginfo_fpu_t is dependent on
the cpu type, not the abi.  Which is weird, but there ya go.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-23-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0ff57af43d1e..41a8b33bac3c 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -44,6 +44,12 @@ struct target_stackf {
 };
 
 struct target_siginfo_fpu {
+#ifdef TARGET_SPARC64
+    uint64_t si_double_regs[32];
+    uint64_t si_fsr;
+    uint64_t si_gsr;
+    uint64_t si_fprs;
+#else
     /* It is more convenient for qemu to move doubles, not singles. */
     uint64_t si_double_regs[16];
     uint32_t si_fsr;
@@ -52,6 +58,7 @@ struct target_siginfo_fpu {
         uint32_t insn_addr;
         uint32_t insn;
     } si_fpqueue [16];
+#endif
 };
 
 struct target_signal_frame {
@@ -167,21 +174,50 @@ static void save_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 {
     int i;
 
+#ifdef TARGET_SPARC64
+    for (i = 0; i < 32; ++i) {
+        __put_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+    }
+    __put_user(env->fsr, &fpu->si_fsr);
+    __put_user(env->gsr, &fpu->si_gsr);
+    __put_user(env->fprs, &fpu->si_fprs);
+#else
     for (i = 0; i < 16; ++i) {
         __put_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
     }
     __put_user(env->fsr, &fpu->si_fsr);
     __put_user(0, &fpu->si_fpqdepth);
+#endif
 }
 
 static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 {
     int i;
 
+#ifdef TARGET_SPARC64
+    uint64_t fprs;
+    __get_user(fprs, &fpu->si_fprs);
+
+    /* In case the user mucks about with FPRS, restore as directed. */
+    if (fprs & FPRS_DL) {
+        for (i = 0; i < 16; ++i) {
+            __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+        }
+    }
+    if (fprs & FPRS_DU) {
+        for (i = 16; i < 32; ++i) {
+            __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+        }
+    }
+    __get_user(env->fsr, &fpu->si_fsr);
+    __get_user(env->gsr, &fpu->si_gsr);
+    env->fprs |= fprs;
+#else
     for (i = 0; i < 16; ++i) {
         __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
     }
     __get_user(env->fsr, &fpu->si_fsr);
+#endif
 }
 
 void setup_frame(int sig, struct target_sigaction *ka,
-- 
2.31.1


