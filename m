Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39E383C96
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:44:09 +0200 (CEST)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiDo-0003e1-Pi
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihla-0006Pz-U0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:58 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:34187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlM-0004RO-UG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:58 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MZCKd-1lwCJr3Zrd-00VBPr; Mon, 17
 May 2021 20:14:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 23/59] linux-user/sparc: Split out save_reg_win
Date: Mon, 17 May 2021 20:13:48 +0200
Message-Id: <20210517181424.8093-24-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/teubC/BxMMR9XwAm+O8TAizN8KfXAWMqW2Zy0fVuntw+ggTZeX
 9V3w5oE/cjhuUuD342oz8lgGtKFuYNKqri4i6jpf4lI2gfzz2G8d13kJOvZz+NFWB7V7NqB
 ESjpf8612ta73yJ/QbBZWSJdKzf8vhOH2rOhVBn+M3R7q3EnoIU7KqE7TGwGaYi8ppduMaO
 sEIfZc3l4BR+kLehfxfOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HsmHhJRLzRQ=:CGuDtYJ7SOyoWDnxE2cZtB
 MoZ/pVMUP1BPnYno58kTmJYNn8xiL5xEFDsDLoVuc8GG0NqR9xY9fhQKjhTfIkSbDDRjv20ij
 l2Yyokkqj3qDn1MzlZNYmmor6k5+9+meXSstz9HghA2/7/Vy47JD5adSCHk1yGyoxV3HdISYH
 bTPhG8CfkwRNofc5znMYf4TbXdUWLZiuPRrZAbq9mUlIIpqBH3eEkkJiT8k1inr1347EfwjIZ
 j/IZUwLZyxeeyKEPWZdaSbB+ROVGgp8C5JbOTWGcgv9rVnDfBWJ6fwocb+50EUoUjMcs+gsMB
 eB9vcClDi77oPAMOl510ogvSGlYwabyN7chZIBRDdoUxYoA6NLk3lIYLZLQ3WVmJpP69HWGMM
 WfOpy1RAyyfkzDnzzmz6DSIShWNyDj9q4dtYyyW8S/NL/+wq6CSiV0zPuQ5Qk5Da1T64F1TUc
 JqFxSU2/Mk4ewTv+xfueg7VKjd4mzUxou4kJOoQO71h1nkvDQFVSTpT5QAKxf2gwm/V1gyaTw
 7iRSHDXSAxIXwb0zPWk+BE=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-17-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0d9305818f8c..69fee5a76a8b 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -150,6 +150,18 @@ static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
     }
 }
 
+static void save_reg_win(struct target_reg_window *win, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[i + WREG_L0], &win->locals[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[i + WREG_I0], &win->ins[i]);
+    }
+}
+
 #define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
 
 void setup_frame(int sig, struct target_sigaction *ka,
@@ -183,12 +195,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i + 1], &sf->extramask[i]);
     }
 
-    for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_L0], &sf->ss.win.locals[i]);
-    }
-    for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
-    }
+    save_reg_win(&sf->ss.win, env);
 
     /* 3. signal handler back-trampoline and parameters */
     env->regwptr[WREG_SP] = sf_addr;
-- 
2.31.1


