Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EA368668
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 20:12:08 +0200 (CEST)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZdo7-0000xO-Jw
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 14:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZdkc-0008O0-Lx
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:08:31 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZdkV-000440-1D
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:08:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 j14-20020a17090a694eb0290152d92c205dso1433426pjm.0
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0a7DmIM2LUgyZJG75mINEJOa0kwDbiMG8yxiWS7sPg=;
 b=bwF/nE4Lnzian+xTv8ImMAMmQnKWy8HVbBhCS6pkPiAM/gRLf2zwohUag6QKiCMuU+
 gGfVI0PaARJz7N0ePkYrGinETuretwwCt/k1ByjwUs8Nak71ThT4ffoger94yog9hKha
 Q9gnk6s6Dgsl2klNCoEgBoCbBzuzhYC0cycHN9RZHx4q9xm/xvWZIBn+g4haqRdAkbiL
 YmNDyIYKILGw3fechxnFKQgrPMvd9VneWWW59GLZIxqy+d2OqSi5OzFt+derKypfNOwW
 34KNTQImK9tSsb1W93ILxmaMfpGG/oLq9O7+TBP3ra32x9GUYjYHP3nCz2tPIN4+z+ln
 baTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0a7DmIM2LUgyZJG75mINEJOa0kwDbiMG8yxiWS7sPg=;
 b=Kdrv7kh0kpspcSlggCr1UsmbqdfgnH/qHeDfT0mzyVS5dsAg4vR6SGThEpsN7W3QJP
 O104LU4ZvJ6IyNefgFdvfxaf+j8oFwd7Fs30evZcfqe1Mx6ou+qIcj8bf1icJfPfNvjz
 n9cD247cR8hexOoDmGeVg79HBv/6EeswAgLAbGcNVhKYD1pnUebx6aTQ/VwSlgq/oTTK
 O5ZbjRJkTdlWXYa/sPKJukOmv9UqTbWqgaXZT9Y7qziGMGxPjzyxu04nao/9Q0zB++ec
 L8Z3i91qJ65G2+78mGn6XjmNbEsQzbABblb0GqJypizSmj4uEKIbzMFG1sPr7hUXNU1R
 zIkQ==
X-Gm-Message-State: AOAM533yq0wPj9qw0FLmrfyqDOPyvNPmi0cboF6NG/fMYqMY6TxdZw2+
 RdS1NRhpQg/+BZnImmyv4J6SoXm4wSyADA==
X-Google-Smtp-Source: ABdhPJzBEfQKI0UXoGMyM4mWnGYXHKm11oUGgGpS4ixUdViI1172ij8cVca6e9UmPOtw4QEh1aFFKw==
X-Received: by 2002:a17:90a:fd83:: with SMTP id
 cx3mr5077542pjb.41.1619114901718; 
 Thu, 22 Apr 2021 11:08:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q6sm2606508pfs.33.2021.04.22.11.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 11:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user: Clean up sigaction ka_restorer
Date: Thu, 22 Apr 2021 11:08:19 -0700
Message-Id: <20210422180819.252121-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422180819.252121-1-richard.henderson@linaro.org>
References: <20210422180819.252121-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass the ka_restorer value as an argument to do_sigaction,
and put it into the sigaction table.

Drop the separate TARGET_ALPHA struct target_rt_sigaction
and define TARGET_ARCH_HAS_KA_RESTORER.

Tidy up TARGET_NR_rt_sigaction, merging TARGET_ALPHA, and
TARGET_SPARC into common code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 17 +++-----
 linux-user/alpha/signal.c |  8 ++--
 linux-user/signal.c       |  4 +-
 linux-user/syscall.c      | 90 ++++++++++++---------------------------
 4 files changed, 41 insertions(+), 78 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 25be414727..226379fc9b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -492,7 +492,7 @@ void target_to_host_old_sigset(sigset_t *sigset,
                                const abi_ulong *old_sigset);
 struct target_sigaction;
 int do_sigaction(int sig, const struct target_sigaction *act,
-                 struct target_sigaction *oact);
+                 struct target_sigaction *oact, abi_ulong ka_restorer);
 
 #include "target_signal.h"
 
@@ -507,19 +507,16 @@ struct target_old_sigaction {
     int32_t sa_flags;
 };
 
-struct target_rt_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_flags;
-    target_sigset_t sa_mask;
-};
-
-/* This is the struct used inside the kernel.  The ka_restorer
-   field comes from the 5th argument to sys_rt_sigaction.  */
+#define TARGET_ARCH_HAS_KA_RESTORER 1
 struct target_sigaction {
     abi_ulong _sa_handler;
     abi_ulong sa_flags;
     target_sigset_t sa_mask;
-    abi_ulong sa_restorer;
+    /*
+     * This is used inside the kernel.  The ka_restorer field comes
+     * from the 5th argument to sys_rt_sigaction.
+     */
+    abi_ulong ka_restorer;
 };
 #elif defined(TARGET_MIPS)
 struct target_sigaction {
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 86f5d2276d..3aa4b339a4 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -138,8 +138,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     setup_sigcontext(&frame->sc, env, frame_addr, set);
 
-    if (ka->sa_restorer) {
-        r26 = ka->sa_restorer;
+    if (ka->ka_restorer) {
+        r26 = ka->ka_restorer;
     } else {
         __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
         __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
@@ -192,8 +192,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    if (ka->sa_restorer) {
-        r26 = ka->sa_restorer;
+    if (ka->ka_restorer) {
+        r26 = ka->ka_restorer;
     } else {
         __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
         __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7eecec46c4..de97cb8829 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -830,7 +830,7 @@ out:
 
 /* do_sigaction() return target values and host errnos */
 int do_sigaction(int sig, const struct target_sigaction *act,
-                 struct target_sigaction *oact)
+                 struct target_sigaction *oact, abi_ulong ka_restorer)
 {
     struct target_sigaction *k;
     struct sigaction act1;
@@ -863,6 +863,8 @@ int do_sigaction(int sig, const struct target_sigaction *act,
         __get_user(k->sa_flags, &act->sa_flags);
 #ifdef TARGET_ARCH_HAS_SA_RESTORER
         __get_user(k->sa_restorer, &act->sa_restorer);
+#elif defined(TARGET_ARCH_HAS_KA_RESTORER)
+        k->ka_restorer = ka_restorer;
 #endif
         /* To be swapped in target_to_host_sigset.  */
         k->sa_mask = act->sa_mask;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc43..7c36650cbc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8984,19 +8984,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             struct target_sigaction act, oact, *pact = 0;
             struct target_old_sigaction *old_act;
             if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, old_act, arg2, 1))
+                if (!lock_user_struct(VERIFY_READ, old_act, arg2, 1)) {
                     return -TARGET_EFAULT;
+                }
                 act._sa_handler = old_act->_sa_handler;
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
-                act.sa_restorer = 0;
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             }
-            ret = get_errno(do_sigaction(arg1, pact, &oact));
+            ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
             if (!is_error(ret) && arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
+                if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0)) {
                     return -TARGET_EFAULT;
+                }
                 old_act->_sa_handler = oact._sa_handler;
                 old_act->sa_mask = oact.sa_mask.sig[0];
                 old_act->sa_flags = oact.sa_flags;
@@ -9017,7 +9018,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 		pact = NULL;
 	    }
 
-	    ret = get_errno(do_sigaction(arg1, pact, &oact));
+	    ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
 
 	    if (!is_error(ret) && arg3) {
                 if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
@@ -9040,15 +9041,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
                 act.sa_restorer = old_act->sa_restorer;
-#ifdef TARGET_ARCH_HAS_KA_RESTORER
-                act.ka_restorer = 0;
-#endif
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             } else {
                 pact = NULL;
             }
-            ret = get_errno(do_sigaction(arg1, pact, &oact));
+            ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
             if (!is_error(ret) && arg3) {
                 if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
                     return -TARGET_EFAULT;
@@ -9064,77 +9062,43 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
     case TARGET_NR_rt_sigaction:
         {
-#if defined(TARGET_ALPHA)
-            /* For Alpha and SPARC this is a 5 argument syscall, with
+            /*
+             * For Alpha and SPARC this is a 5 argument syscall, with
              * a 'restorer' parameter which must be copied into the
              * sa_restorer field of the sigaction struct.
              * For Alpha that 'restorer' is arg5; for SPARC it is arg4,
              * and arg5 is the sigsetsize.
-             * Alpha also has a separate rt_sigaction struct that it uses
-             * here; SPARC uses the usual sigaction struct.
              */
-            struct target_rt_sigaction *rt_act;
-            struct target_sigaction act, oact, *pact = 0;
-
-            if (arg4 != sizeof(target_sigset_t)) {
-                return -TARGET_EINVAL;
-            }
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, rt_act, arg2, 1))
-                    return -TARGET_EFAULT;
-                act._sa_handler = rt_act->_sa_handler;
-                act.sa_mask = rt_act->sa_mask;
-                act.sa_flags = rt_act->sa_flags;
-                act.sa_restorer = arg5;
-                unlock_user_struct(rt_act, arg2, 0);
-                pact = &act;
-            }
-            ret = get_errno(do_sigaction(arg1, pact, &oact));
-            if (!is_error(ret) && arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, rt_act, arg3, 0))
-                    return -TARGET_EFAULT;
-                rt_act->_sa_handler = oact._sa_handler;
-                rt_act->sa_mask = oact.sa_mask;
-                rt_act->sa_flags = oact.sa_flags;
-                unlock_user_struct(rt_act, arg3, 1);
-            }
-#else
-#ifdef TARGET_SPARC
+#if defined(TARGET_ALPHA)
+            target_ulong sigsetsize = arg4;
+            target_ulong restorer = arg5;
+#elif defined (TARGET_SPARC)
             target_ulong restorer = arg4;
             target_ulong sigsetsize = arg5;
 #else
             target_ulong sigsetsize = arg4;
+            target_ulong restorer = 0;
 #endif
-            struct target_sigaction *act;
-            struct target_sigaction *oact;
+            struct target_sigaction *act = NULL;
+            struct target_sigaction *oact = NULL;
 
             if (sigsetsize != sizeof(target_sigset_t)) {
                 return -TARGET_EINVAL;
             }
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, act, arg2, 1)) {
-                    return -TARGET_EFAULT;
-                }
-#ifdef TARGET_ARCH_HAS_KA_RESTORER
-                act->ka_restorer = restorer;
-#endif
-            } else {
-                act = NULL;
+            if (arg2 && !lock_user_struct(VERIFY_READ, act, arg2, 1)) {
+                return -TARGET_EFAULT;
             }
-            if (arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
-                    ret = -TARGET_EFAULT;
-                    goto rt_sigaction_fail;
+            if (arg3 && !lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(do_sigaction(arg1, act, oact, restorer));
+                if (oact) {
+                    unlock_user_struct(oact, arg3, 1);
                 }
-            } else
-                oact = NULL;
-            ret = get_errno(do_sigaction(arg1, act, oact));
-	rt_sigaction_fail:
-            if (act)
+            }
+            if (act) {
                 unlock_user_struct(act, arg2, 0);
-            if (oact)
-                unlock_user_struct(oact, arg3, 1);
-#endif
+            }
         }
         return ret;
 #ifdef TARGET_NR_sgetmask /* not on alpha */
-- 
2.25.1


