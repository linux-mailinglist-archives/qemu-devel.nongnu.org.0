Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A666486331
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:52:42 +0100 (CET)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QNt-0007xM-L2
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDY-0007kv-Gu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:00 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:32871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDQ-0004jG-I0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:00 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MWAaw-1mtrTF47Z4-00Xe5Q; Thu, 06
 Jan 2022 11:41:48 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] linux-user: call set/getscheduler set/getparam directly
Date: Thu,  6 Jan 2022 11:41:25 +0100
Message-Id: <20220106104137.732883-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MJpgKlmKT5ovh0uv15NA323MEfOcEzgeK7cvYL9SlT7cjCGFtZw
 0kFAap0fllfglK6lRaozoW9HiTu5Ei2Sjsgau2atfksJPG6Gr31NhGJg7ihgXKWuBYdP5Pm
 ruTPo6edPbHDn/UEYvAqn3ABWkJVLKlN+Z/DVqIxzB3d9uuTHvY/qh8kY19wr+sCZThnhSp
 scRheWGd/f38NRA7jzp6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jlRtTYvRutw=:wEcw4w8PuATUG+0uFXVHG3
 UiReeri/uAL6SCrUmkpOWC2t/4BHq4/0ZJi5pcpSM/8DMz8vMmjD5vNiMzXV4AfhCbTknW6l9
 4Sddg6C6FkSLNjWoPtJWhmO2ZrYJbh6sj2vD8NXK7aw/Q8+MVRA9A3qaUetMfAiXlRpxJ9E77
 WQLoBhc93Im0Rl0k0WQoOJ8b8LR5ROWJnJVaKlBhk9vKxk72o2/o6GUhzZsUK7pfI/N6gckO4
 er1mzrS2qTXgF9580HaknWSd3v654FLN97Wlh64iz/3j3hai64hRNTJHGBUalYwbAtD+qpjbg
 1BVlH7cDMvlqCAocjmmdNIZ13Cj+hX4Gw9OULwJAjb7t18L1P7bMf7zG2PrfF7sP6Qyx+r7bp
 I9HBLwS+EOTQBkER3IfMhefm8K6jVqFL8yrvyN4fgjPihulSmohIAxc4ZgMaWByQm+1IWt7Wa
 ZM1di3zwk82GamaEokpr9ElBa3JeMqj9GwyQfvVhkMh7gOmc11P/LE27z9El+dR3Z8eWGmeZE
 tznyiSFyY6qK89RWzEbZqOWiZkBLDV0HJQTOeyXFXv/PcohSL75UF34TorBtZUACtJsbjfAXg
 r5Zg1axLQ+x0VyXrelC63uPSZZq6WyBJBC7vUAKEyFdvcLXRcBAlC2ijpLji9ZEy4PnAmR1Km
 Vu7yJmMgIYgABlNHeiEPKDPVpTmQFk/oVFA9pOTo9UKrQ5uuudOtwepBGVGLU354NYCQ=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tonis Tiigi <tonistiigi@gmail.com>

There seems to be difference in syscall and libc definition of these
methods and therefore musl does not implement them (1e21e78bf7). Call
syscall directly to ensure the behavior of the libc of user application,
not the libc that was used to build QEMU.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
Message-Id: <20220105041819.24160-3-tonistiigi@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c      | 34 ++++++++++++++++++++++++----------
 linux-user/syscall_defs.h |  4 ++++
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6de116eb90cb..01cd59cdce53 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -359,6 +359,17 @@ _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
 #define __NR_sys_sched_setattr __NR_sched_setattr
 _syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr,
           unsigned int, flags);
+#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
+_syscall1(int, sys_sched_getscheduler, pid_t, pid);
+#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
+_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy,
+          const struct sched_param *, param);
+#define __NR_sys_sched_getparam __NR_sched_getparam
+_syscall2(int, sys_sched_getparam, pid_t, pid,
+          struct sched_param *, param);
+#define __NR_sys_sched_setparam __NR_sched_setparam
+_syscall2(int, sys_sched_setparam, pid_t, pid,
+          const struct sched_param *, param);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10794,30 +10805,32 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setparam:
         {
-            struct sched_param *target_schp;
+            struct target_sched_param *target_schp;
             struct sched_param schp;
 
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1))
+            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1)) {
                 return -TARGET_EFAULT;
+            }
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg2, 0);
-            return get_errno(sched_setparam(arg1, &schp));
+            return get_errno(sys_sched_setparam(arg1, &schp));
         }
     case TARGET_NR_sched_getparam:
         {
-            struct sched_param *target_schp;
+            struct target_sched_param *target_schp;
             struct sched_param schp;
 
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            ret = get_errno(sched_getparam(arg1, &schp));
+            ret = get_errno(sys_sched_getparam(arg1, &schp));
             if (!is_error(ret)) {
-                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0))
+                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0)) {
                     return -TARGET_EFAULT;
+                }
                 target_schp->sched_priority = tswap32(schp.sched_priority);
                 unlock_user_struct(target_schp, arg2, 1);
             }
@@ -10825,19 +10838,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setscheduler:
         {
-            struct sched_param *target_schp;
+            struct target_sched_param *target_schp;
             struct sched_param schp;
             if (arg3 == 0) {
                 return -TARGET_EINVAL;
             }
-            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1))
+            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1)) {
                 return -TARGET_EFAULT;
+            }
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg3, 0);
-            return get_errno(sched_setscheduler(arg1, arg2, &schp));
+            return get_errno(sys_sched_setscheduler(arg1, arg2, &schp));
         }
     case TARGET_NR_sched_getscheduler:
-        return get_errno(sched_getscheduler(arg1));
+        return get_errno(sys_sched_getscheduler(arg1));
     case TARGET_NR_sched_getattr:
         {
             struct target_sched_attr *target_scha;
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 66244589aa3d..cca561f62268 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2904,4 +2904,8 @@ struct target_sched_attr {
     abi_uint sched_util_max;
 };
 
+struct target_sched_param {
+    abi_int sched_priority;
+};
+
 #endif
-- 
2.33.1


