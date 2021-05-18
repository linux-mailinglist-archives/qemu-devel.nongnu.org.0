Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82772387164
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:44:04 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisWR-0007Tv-Jr
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKV-0006rH-98
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:43 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKQ-0006sZ-Lg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:42 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MS4ab-1lt1c319gZ-00TUiw; Tue, 18
 May 2021 07:31:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/59] linux-user: Split out target_restore_altstack
Date: Tue, 18 May 2021 07:30:40 +0200
Message-Id: <20210518053131.87212-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TyP3aaOU60R0iEsbpHWQwOBOwhTaHmDdeKiaPCaIRcpfJbf2gUj
 yfi1kX2KEgVQcSe25TNbPfBKLZEI19xb+vykmW4KlcSuzVSPtah138iMZ9PsY0SI+s0zjBZ
 Bj/pC4I8XNAp0VSvI/UrHwJUNdyQSKPYR+Z5XslbNiRnG8wQBm758WKWMDkOR0saivs43EQ
 +69YqfuIc2sUVi9DqOLkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QzHqGHPNqh4=:eU5UW7lC9JSaEkWbsW1Ryf
 pm/YI5uIYw42do2+MxIJuxDtEPtG1hSvtpRO9LCrhjldz3w4osDRWkhfCm1uWIY3q6o4iaoDp
 yI2sY7H9LOzo/w0l+V66qbBZdzfqe0VvEVQuPbdWMG0I72FHL58hmTGOABWj21T7sWbXusvM0
 jiW81GQMzh6d4LuyHz96ngaCiP8LOCwZUHSrFccqK0EuKIy/uDzWPIOThRFB+Dc6CGEEkrW0A
 lBedx7C08azbblqBw58BsauPdFAmSp4S72eDo4aGSGUdFXUsgpIWu47H5z2/DVtd3zYvijPPS
 UHHcLi+0YCfRNu9qf1zjSKO64QTR4HIqf4gBfvW2a5OjNSLOnlKdpBYDTcX4uimqPd9Hpg3o2
 Y7gHY26cGD6ghEmSFuq8un25nG5vU6Y9jZStHw0pBtxRCPPFZoS5fd/4CdPByXrsAv4VpGIIT
 6wimN9JLWCd6fRyEudi84bCwDUzOVeue8xgaducAr7giMTRX4f27K8iISSrq34Qfib6tsKL2Y
 8wjm83T1x1m+uY1Fl1sIFg=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

Create a function to match target_save_altstack.
Fix some style and unlock issues in do_sigaltstack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal-common.h |   1 +
 linux-user/signal.c        | 115 +++++++++++++++++++++----------------
 2 files changed, 66 insertions(+), 50 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 1df1068552fb..34b963af9abc 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -24,6 +24,7 @@ int on_sig_stack(unsigned long sp);
 int sas_ss_flags(unsigned long sp);
 abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka);
 void target_save_altstack(target_stack_t *uss, CPUArchState *env);
+abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp);
 
 static inline void target_sigemptyset(target_sigset_t *set)
 {
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7eecec46c407..9daa89eac5db 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -297,6 +297,50 @@ void target_save_altstack(target_stack_t *uss, CPUArchState *env)
     __put_user(ts->sigaltstack_used.ss_size, &uss->ss_size);
 }
 
+abi_long target_restore_altstack(target_stack_t *uss, abi_ulong sp)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    size_t minstacksize = TARGET_MINSIGSTKSZ;
+    target_stack_t ss;
+
+#if defined(TARGET_PPC64)
+    /* ELF V2 for PPC64 has a 4K minimum stack size for signal handlers */
+    struct image_info *image = ts->info;
+    if (get_ppc64_abi(image) > 1) {
+        minstacksize = 4096;
+    }
+#endif
+
+    __get_user(ss.ss_sp, &uss->ss_sp);
+    __get_user(ss.ss_size, &uss->ss_size);
+    __get_user(ss.ss_flags, &uss->ss_flags);
+
+    if (on_sig_stack(sp)) {
+        return -TARGET_EPERM;
+    }
+
+    switch (ss.ss_flags) {
+    default:
+        return -TARGET_EINVAL;
+
+    case TARGET_SS_DISABLE:
+        ss.ss_size = 0;
+        ss.ss_sp = 0;
+        break;
+
+    case TARGET_SS_ONSTACK:
+    case 0:
+        if (ss.ss_size < minstacksize) {
+            return -TARGET_ENOMEM;
+        }
+        break;
+    }
+
+    ts->sigaltstack_used.ss_sp = ss.ss_sp;
+    ts->sigaltstack_used.ss_size = ss.ss_size;
+    return 0;
+}
+
 /* siginfo conversion */
 
 static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
@@ -758,73 +802,44 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
 /* compare linux/kernel/signal.c:do_sigaltstack() */
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
 {
-    int ret;
-    struct target_sigaltstack oss;
-    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    target_stack_t oss, *uoss = NULL;
+    abi_long ret = -TARGET_EFAULT;
+
+    if (uoss_addr) {
+        TaskState *ts = (TaskState *)thread_cpu->opaque;
 
-    /* XXX: test errors */
-    if(uoss_addr)
-    {
+        /* Verify writability now, but do not alter user memory yet. */
+        if (!lock_user_struct(VERIFY_WRITE, uoss, uoss_addr, 0)) {
+            goto out;
+        }
         __put_user(ts->sigaltstack_used.ss_sp, &oss.ss_sp);
         __put_user(ts->sigaltstack_used.ss_size, &oss.ss_size);
         __put_user(sas_ss_flags(sp), &oss.ss_flags);
     }
 
-    if(uss_addr)
-    {
-        struct target_sigaltstack *uss;
-        struct target_sigaltstack ss;
-        size_t minstacksize = TARGET_MINSIGSTKSZ;
+    if (uss_addr) {
+        target_stack_t *uss;
 
-#if defined(TARGET_PPC64)
-        /* ELF V2 for PPC64 has a 4K minimum stack size for signal handlers */
-        struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
-        if (get_ppc64_abi(image) > 1) {
-            minstacksize = 4096;
-        }
-#endif
-
-        ret = -TARGET_EFAULT;
         if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
             goto out;
         }
-        __get_user(ss.ss_sp, &uss->ss_sp);
-        __get_user(ss.ss_size, &uss->ss_size);
-        __get_user(ss.ss_flags, &uss->ss_flags);
-        unlock_user_struct(uss, uss_addr, 0);
-
-        ret = -TARGET_EPERM;
-        if (on_sig_stack(sp))
+        ret = target_restore_altstack(uss, sp);
+        if (ret) {
             goto out;
-
-        ret = -TARGET_EINVAL;
-        if (ss.ss_flags != TARGET_SS_DISABLE
-            && ss.ss_flags != TARGET_SS_ONSTACK
-            && ss.ss_flags != 0)
-            goto out;
-
-        if (ss.ss_flags == TARGET_SS_DISABLE) {
-            ss.ss_size = 0;
-            ss.ss_sp = 0;
-        } else {
-            ret = -TARGET_ENOMEM;
-            if (ss.ss_size < minstacksize) {
-                goto out;
-            }
         }
-
-        ts->sigaltstack_used.ss_sp = ss.ss_sp;
-        ts->sigaltstack_used.ss_size = ss.ss_size;
     }
 
     if (uoss_addr) {
-        ret = -TARGET_EFAULT;
-        if (copy_to_user(uoss_addr, &oss, sizeof(oss)))
-            goto out;
+        memcpy(uoss, &oss, sizeof(oss));
+        unlock_user_struct(uoss, uoss_addr, 1);
+        uoss = NULL;
     }
-
     ret = 0;
-out:
+
+ out:
+    if (uoss) {
+        unlock_user_struct(uoss, uoss_addr, 0);
+    }
     return ret;
 }
 
-- 
2.31.1


