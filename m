Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900A4E6046
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:24:45 +0100 (CET)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIlu-0000El-H8
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:24:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhn-0005ws-00
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:27 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:50943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhk-0003OW-Ao
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:26 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Ml6Zo-1nuUun0f8O-00lTl8; Thu, 24
 Mar 2022 09:20:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] linux-user: Split out helpers for sigsuspend
Date: Thu, 24 Mar 2022 09:20:09 +0100
Message-Id: <20220324082016.3463521-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:h/hiLCYON9mf8iCUsZb+jRyt3rv6XTzgK0T3aX4p84MSt87Vob8
 oRHX5kpanZA0ZDmU9NSDBxzbHNbPLffD684tuYuh5037wq5D41+kUDB0DVYe3e0DKAgBFde
 jPDUtgC86834AsAjjYIKYKoW6CdBMIlzR3kVl0DHfxTsS/QayZSWcoJF2eG7N6lPFT58C9t
 BhG6n3D45Sj7Auh1RsF6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lAP70PINeZE=:EyxbdLcmu0vMgirTlViHdN
 H6u6EoCiG/VvqGBsCFwuMCPG8i33eUzpnOBjmSzCeEXlmKE5O1xn/zKYj9MJbk5XwmBamCeJA
 UF06r2EoYZPTdmkrFWIw6BruW5/CqfCJSXP1W11W33bBlotzuArjREMmhn3mPkXmc1oArsJJm
 QKJnxomoNVPn2aeTCKargey0JN9RaDd0zIEbghpnII6mgYAmbBFarcUw5rGHjAx3vEjYM1her
 KlOV1UmvEl7grbHkrKMKP9/OK5SPe05yUTUpeeIfeF4KhOH3JYIDlXry99R28nsX/sHLKs+S6
 jiRT13Y3fWIVGjTGRBBkkVfJgDWlGXEqQ64YbBL94y0XZI6M3YnDjzOX+eVkH5ewCE0VPlknY
 MrTN9Zep10zdZ19LcaUb6kum6bVgwKQ0ImY19QfvBiITa/JPgpcI2piADyvAuU/2c2s68RmWX
 K3Cx4nw1F8TJoVBOPois5VE8TMf7H9pM2WfgSRR8NghVuV6T+juL82PYn8HCsTxTrZvXp0TCV
 EPKtqxnraG41Vu36kmhHqz++AZt39yhHv5DC+JWFB/GtVNmhHQWxYruP3I0f3zqyo214E0Aza
 wMteeCPrFVFMmtVCXbUXJaG+j+936hRzLocn43jbua4H9yLRVBheA34pCBVq5xFlvfzdMOJSX
 hieYP/vyDEE+Ju2HsTvjk5PpaS0MocftavQTyKxRms30TFu9hz8ztx9B61gMgp3Wwz4g=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Two new functions: process_sigsuspend_mask and finish_sigsuspend_mask.
Move the size check and copy-from-user code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220315084308.433109-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal-common.h | 26 +++++++++++++++++++++++++
 linux-user/signal.c        | 23 ++++++++++++++++++++++
 linux-user/syscall.c       | 40 ++++++++++++++++----------------------
 3 files changed, 66 insertions(+), 23 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 2113165a7583..6a7e4a93fc13 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -92,4 +92,30 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
  */
 int block_signals(void); /* Returns non zero if signal pending */
 
+/**
+ * process_sigsuspend_mask: read and apply syscall-local signal mask
+ *
+ * Read the guest signal mask from @sigset, length @sigsize.
+ * Convert that to a host signal mask and save it to sigpending_mask.
+ *
+ * Return value: negative target errno, or zero;
+ *               store &sigpending_mask into *pset on success.
+ */
+int process_sigsuspend_mask(sigset_t **pset, target_ulong sigset,
+                            target_ulong sigsize);
+
+/**
+ * finish_sigsuspend_mask: finish a sigsuspend-like syscall
+ *
+ * Set in_sigsuspend if we need to use the modified sigset
+ * during process_pending_signals.
+ */
+static inline void finish_sigsuspend_mask(int ret)
+{
+    if (ret != -QEMU_ERESTARTSYS) {
+        TaskState *ts = (TaskState *)thread_cpu->opaque;
+        ts->in_sigsuspend = 1;
+    }
+}
+
 #endif
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 2a3f3cc23f92..092e70b80c6f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1199,3 +1199,26 @@ void process_pending_signals(CPUArchState *cpu_env)
     }
     ts->in_sigsuspend = 0;
 }
+
+int process_sigsuspend_mask(sigset_t **pset, target_ulong sigset,
+                            target_ulong sigsize)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    sigset_t *host_set = &ts->sigsuspend_mask;
+    target_sigset_t *target_sigset;
+
+    if (sigsize != sizeof(*target_sigset)) {
+        /* Like the kernel, we enforce correct size sigsets */
+        return -TARGET_EINVAL;
+    }
+
+    target_sigset = lock_user(VERIFY_READ, sigset, sigsize, 1);
+    if (!target_sigset) {
+        return -TARGET_EFAULT;
+    }
+    target_to_host_sigset(host_set, target_sigset);
+    unlock_user(target_sigset, sigset, 0);
+
+    *pset = host_set;
+    return 0;
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 77cd88b53785..d9b5662ff820 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9557,41 +9557,35 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigsuspend
     case TARGET_NR_sigsuspend:
         {
-            TaskState *ts = cpu->opaque;
+            sigset_t *set;
+
 #if defined(TARGET_ALPHA)
+            TaskState *ts = cpu->opaque;
             /* target_to_host_old_sigset will bswap back */
             abi_ulong mask = tswapal(arg1);
-            target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
+            set = &ts->sigsuspend_mask;
+            target_to_host_old_sigset(set, &mask);
 #else
-            if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-                return -TARGET_EFAULT;
-            target_to_host_old_sigset(&ts->sigsuspend_mask, p);
-            unlock_user(p, arg1, 0);
-#endif
-            ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
-                                               SIGSET_T_SIZE));
-            if (ret != -QEMU_ERESTARTSYS) {
-                ts->in_sigsuspend = 1;
+            ret = process_sigsuspend_mask(&set, arg1, sizeof(target_sigset_t));
+            if (ret != 0) {
+                return ret;
             }
+#endif
+            ret = get_errno(safe_rt_sigsuspend(set, SIGSET_T_SIZE));
+            finish_sigsuspend_mask(ret);
         }
         return ret;
 #endif
     case TARGET_NR_rt_sigsuspend:
         {
-            TaskState *ts = cpu->opaque;
+            sigset_t *set;
 
-            if (arg2 != sizeof(target_sigset_t)) {
-                return -TARGET_EINVAL;
-            }
-            if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))
-                return -TARGET_EFAULT;
-            target_to_host_sigset(&ts->sigsuspend_mask, p);
-            unlock_user(p, arg1, 0);
-            ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
-                                               SIGSET_T_SIZE));
-            if (ret != -QEMU_ERESTARTSYS) {
-                ts->in_sigsuspend = 1;
+            ret = process_sigsuspend_mask(&set, arg1, arg2);
+            if (ret != 0) {
+                return ret;
             }
+            ret = get_errno(safe_rt_sigsuspend(set, SIGSET_T_SIZE));
+            finish_sigsuspend_mask(ret);
         }
         return ret;
 #ifdef TARGET_NR_rt_sigtimedwait
-- 
2.35.1


