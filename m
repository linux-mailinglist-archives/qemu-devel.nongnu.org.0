Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7738716B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:48:03 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisaI-0004dG-51
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKX-0006zl-8u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:47683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKS-0006us-IO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:44 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mc0Er-1lCIvl1fOZ-00dV9a; Tue, 18
 May 2021 07:31:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/59] linux-user/sparc: Include TARGET_STACK_BIAS in
 get_sp_from_cpustate
Date: Tue, 18 May 2021 07:30:44 +0200
Message-Id: <20210518053131.87212-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5i6JqPuL/+DAcO2iyI5Pv5ldXfdukbb8nXjZG1RQljMFd+QqnXj
 C/6ylvmExsNTYJVYmaAGG/h0Xd2FuIKZrwLUMwe/gl2bjOE5j1EHmVamNhuWwj0YOsihoAr
 0HaBTCSLXWG+l0OsmqBMYvUiWhr1i2W45/+zdkHLQz00pyOhr3hJjNDUt6SS7kgFXFF2rbu
 ZXXoF6LOufwiFnCNzSReA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xy/tL6hw5/M=:k6PHLG2M8y83ry+ax8bCrw
 CFinO+4BjBKovrudbPnyiE6H28L3A0ILXmudlEo12NUiRv0BNFlnXxBH12/nF+PNmDkdacA/2
 XlDOD89R5CkMT1xgukSv+OqfRxga2dM4ZVbdwoq0tE4dhhiX8dazc8zp2hx03kPZKChMm4cpM
 1TkEs9fMGmPOwLx0S+7z5lhWO5TL9zqbaZLp05yQc4tWk345QWGJgsiTaOTaxXM3YcNA8jtSg
 j/OGgqg9zaDd9KbrN67h4LuDCYsy1Yf0mT/zhTXO0XgN6vKa628Lcd8lNPec0ys47w3ZTPVd7
 DVJYdosKGB2rS/pq4FxESXaKLfT3a7v/fDNQcushRNnWi9NqUUmuapLru5HHRNeqwTvJDIOKh
 g+r5WslS9BQWWahMAm9GiFQjrcAqMHzf1IpalhkQfdGo9278bQp33GVBz1AparbxIZ/sjxY9E
 mIGh0SKFt89It8shslvmJH6sl7493h06MnDnJxLeWk8/xuBYNsn96vIdFF1uKWmRL/goEQ0ei
 RlvFpLZ6u0stkhUnqxrf50=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Move TARGET_STACK_BIAS from signal.c.  Generic code cares about the
logical stack pointer, not the physical one that has a bias applied
for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c     | 2 --
 linux-user/sparc/target_cpu.h | 9 ++++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d27b7a3af79d..76579093a88c 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -394,8 +394,6 @@ struct target_reg_window {
     abi_ulong ins[8];
 };
 
-#define TARGET_STACK_BIAS 2047
-
 /* {set, get}context() needed for 64-bit SparcLinux userland. */
 void sparc64_set_context(CPUSPARCState *env)
 {
diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
index 1fa1011775a1..1f4bed50f476 100644
--- a/linux-user/sparc/target_cpu.h
+++ b/linux-user/sparc/target_cpu.h
@@ -20,6 +20,12 @@
 #ifndef SPARC_TARGET_CPU_H
 #define SPARC_TARGET_CPU_H
 
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+# define TARGET_STACK_BIAS 2047
+#else
+# define TARGET_STACK_BIAS 0
+#endif
+
 static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
                                         unsigned flags)
 {
@@ -40,6 +46,7 @@ static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
 #endif
         /* ??? The kernel appears to copy one stack frame to the new stack. */
         /* ??? The kernel force aligns the new stack. */
+        /* Userspace provides a biased stack pointer value. */
         env->regwptr[WREG_SP] = newsp;
     }
 
@@ -77,7 +84,7 @@ static inline void cpu_set_tls(CPUSPARCState *env, target_ulong newtls)
 
 static inline abi_ulong get_sp_from_cpustate(CPUSPARCState *state)
 {
-    return state->regwptr[WREG_SP];
+    return state->regwptr[WREG_SP] + TARGET_STACK_BIAS;
 }
 
 #endif
-- 
2.31.1


