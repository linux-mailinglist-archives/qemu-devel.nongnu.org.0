Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F42C4A2C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 22:39:50 +0100 (CET)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki2Vx-0004KM-IY
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 16:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2St-0002Gd-HY; Wed, 25 Nov 2020 16:36:39 -0500
Received: from home.keithp.com ([63.227.221.253]:36946 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1ki2Sp-0001BV-CX; Wed, 25 Nov 2020 16:36:39 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 547CD3F2E28F;
 Wed, 25 Nov 2020 13:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340192; bh=AFbLQR6RWzoVFFYqQ1dFFvDajaGN0na/ckFbaz80Lac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WCrSzS9qRIXQPZcmQAXf3LP2dBHW0rWVc8K7LWJdfqBAs/dV222rMn4JYDkgoAC0K
 UEnqOiCricwuG8pqPTF+cg/GH4U3fJLW8osLTx7Wdd7s2IRfom4ODRdJzM5cJpatC7
 Vyy//Wmz3xE01MjfYIwnLAmsSRjrE+ERVCdxYRMnO2qnAxdGuVvsEoJ9qT9cT2V7+k
 tkW6r/Nb/PjxGTkuL8Xp9vXuIRkLbwOT3bAzdNjGkvnEmnMhTbt5ggDwf/AzlxQ8cO
 7S3I5kTHQSArGR4yvCIgL/uwrDxlO5Qb75+EPgQEvLNiTGDOJfZ8NF9yxA8yn5OUg/
 UeL/C3lR0cELg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EmjlyenEMZAv; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id AB6E33F2E289;
 Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1606340191; bh=AFbLQR6RWzoVFFYqQ1dFFvDajaGN0na/ckFbaz80Lac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qhRDK/euNVBriu8en1H1ua1P2dCIAejONlaH6voI9I1yCtaMPyd45LW2IKtScgIBw
 SgPmHXiX2UhaX/lGTOvbqhDnuzK8Z6WTclbJE0bNZT2OT5Z1EeXmNwcv98zO3lFcD0
 6PxIO5ITMFORaUpF6CxiFhEnfvwgl4Fq2P7d8gel2Ps+houM2y2jXItdu12pm4KJkP
 HGyK8f9LMfgjFhe/iUSoxaZWDdWNdMkdrvuqHqtX7X3b1+CRwLFoIW8hBuUPh6ITxQ
 0akx6FqFkQJY/DX++MrDrKPClAMCj+wAidjtfIxS/cwsng2Fz8OjIPTe2APdYu3MyN
 z4G1aAqr8DH0A==
Received: by keithp.com (Postfix, from userid 1000)
 id 927C815821C2; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/8] semihosting: Change common-semi API to be
 architecture-independent
Date: Wed, 25 Nov 2020 13:36:11 -0800
Message-Id: <20201125213617.2496935-3-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Keith Packard <keithp@keithp.com>
From: Keith Packard via <qemu-devel@nongnu.org>

The public API is now defined in
hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
instead of CPUARMState *. All internal functions have been renamed
common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
there are no functional changes in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/semihosting/common-semi.c  | 16 ++++++++++------
 hw/semihosting/common-semi.h  | 36 +++++++++++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c |  3 ++-
 linux-user/arm/cpu_loop.c     |  3 ++-
 target/arm/cpu.h              |  8 --------
 target/arm/helper.c           |  5 +++--
 target/arm/m_helper.c         |  7 ++++++-
 7 files changed, 59 insertions(+), 19 deletions(-)
 create mode 100644 hw/semihosting/common-semi.h

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index c892e0e674..cafbe579c7 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -1,10 +1,14 @@
 /*
- *  Arm "Angel" semihosting syscalls
+ *  Semihosting support for systems modeled on the Arm "Angel"
+ *  semihosting syscalls design.
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
  *  Written by Paul Brook.
  *
+ *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
@@ -372,12 +376,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
      * do anything with its return value, because it is not necessarily
      * the result of the syscall, but could just be the old value of X0.
      * The only thing safe to do with this is that the callers of
-     * do_arm_semihosting() will write it straight back into X0.
+     * do_common_semihosting() will write it straight back into X0.
      * (In linux-user mode, the callback will have happened before
      * gdb_do_syscallv() returns.)
      *
      * We should tidy this up so neither this function nor
-     * do_arm_semihosting() return a value, so the mistake of
+     * do_common_semihosting() return a value, so the mistake of
      * doing something with the return value is not possible to make.
      */
 
@@ -674,10 +678,10 @@ static const GuestFDFunctions guestfd_fns[] = {
  * leave the register unchanged. We use 0xdeadbeef as the return value
  * when there isn't a defined return value for the call.
  */
-target_ulong do_arm_semihosting(CPUARMState *env)
+target_ulong do_common_semihosting(CPUState *cs)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = env_cpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
     char * s;
diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
new file mode 100644
index 0000000000..bc53e92c79
--- /dev/null
+++ b/hw/semihosting/common-semi.h
@@ -0,0 +1,36 @@
+/*
+ *  Semihosting support for systems modeled on the Arm "Angel"
+ *  semihosting syscalls design.
+ *
+ *  Copyright (c) 2005, 2007 CodeSourcery.
+ *  Copyright (c) 2019 Linaro
+ *  Written by Paul Brook.
+ *
+ *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ *  ARM Semihosting is documented in:
+ *     Semihosting for AArch32 and AArch64 Release 2.0
+ *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *
+ */
+
+#ifndef COMMON_SEMI_H
+#define COMMON_SEMI_H
+
+target_ulong do_common_semihosting(CPUState *cs);
+
+#endif /* COMMON_SEMI_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index bbe9fefca8..42b9c15f53 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -129,7 +130,7 @@ void cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-            env->xregs[0] = do_arm_semihosting(env);
+            env->xregs[0] = do_common_semihosting(cs);
             env->pc += 4;
             break;
         case EXCP_YIELD:
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 3d272b56ef..cadfb7fa43 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -421,7 +422,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SEMIHOST:
-            env->regs[0] = do_arm_semihosting(env);
+            env->regs[0] = do_common_semihosting(cs);
             env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..55f3b7d3e1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1068,14 +1068,6 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
 static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
-#if !defined(CONFIG_TCG)
-static inline target_ulong do_arm_semihosting(CPUARMState *env)
-{
-    g_assert_not_reached();
-}
-#else
-target_ulong do_arm_semihosting(CPUARMState *env);
-#endif
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c049..a5e94f1e33 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
@@ -9879,13 +9880,13 @@ static void handle_semihosting(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%" PRIx64 "\n",
                       env->xregs[0]);
-        env->xregs[0] = do_arm_semihosting(env);
+        env->xregs[0] = do_common_semihosting(cs);
         env->pc += 4;
     } else {
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
+        env->regs[0] = do_common_semihosting(cs);
         env->regs[15] += env->thumb ? 2 : 4;
     }
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index aad01ea012..610ca032a7 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -31,6 +31,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
@@ -2188,7 +2189,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
+#ifdef CONFIG_TCG
+        env->regs[0] = do_common_semihosting(cs);
+#else
+        g_assert_not_reached();
+#endif
         env->regs[15] += env->thumb ? 2 : 4;
         return;
     case EXCP_BKPT:
-- 
2.29.2


