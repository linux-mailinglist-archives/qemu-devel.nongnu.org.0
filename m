Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46EA48631F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:47:49 +0100 (CET)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QJA-0005Cc-Mq
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDX-0007iQ-Ul
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:59 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:57159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDQ-0004j2-I0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:59 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N63NQ-1mL4x12H7I-016Qbi; Thu, 06
 Jan 2022 11:41:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/27] linux-user: add sched_getattr support
Date: Thu,  6 Jan 2022 11:41:24 +0100
Message-Id: <20220106104137.732883-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SV4a/XRVJ3D42ofnmFsE0qxbCh4YpfwnQhpbIzxVwb/wS5ei9Bs
 x53LaPSQzdvTzdw43MPA0OXpbtHbe0dYPb0HD+6lPUbORb93pAiHGTrTxeqFiPjY5/a5S3Y
 eFnc/ULJUIi8hRQWUqEWf20/kS5CAEjqmMdHhdOJiIkzfYiGlKAcsG++wEeGpCbdNS/S+qO
 J7J/6us0fG7BD8lvizrtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0i4fSjI8n90=:A9uqGWAsNJJKzU4+6fimkF
 /igf0F57YHBDKOth0itLrnSNrCF/s2MyFGpB2hltX9gRHVV9La5JvkRWizKoZOHUA44OE2oXN
 TX3JtMzggPS1DK2KKp6yxFe8GHqS5gziEp6M+OB15GR4KFlula3ieY9Cz2cAUu1TqazDyxFIR
 VWg3NnloRWTexH5MiK5jwi5OX5hcmGqGcGP+o7uie99S4BMOW5wexpuBpy3HxIGhNyjBO9IAh
 kUAGpnEeliG+7aCqOBta4bELLXwUnuVtsl6+AnrDBUWUOrT+t1qTBgFmIATzRmlhzXIZSZCgQ
 hWCiBe2GolImpbh86+lns/iaNKt4OLuXAPivtSWxqwDgsHuUI2lYSWpJHYvPH96Rj0H0RGoWB
 phMmRytJHnDzEcuHGnVJh5rS5D+O1cLrSScvdc8HL9EMxdWk7Ke13T1l4aTTIs6MzLD/ZQMTG
 CTHnu4nYTPQ/SCnE8+qtvMRHkmj+WqEeFFWlPBVijidtwxeA9pEiY3v+U1VxOj+bYoN/yPvs6
 nfOCduBYjnV3TId2a2n+TDKHFSExfjkGcAtgk1S0b5wiHoIY0O6cj+fGbJkqEgWiJmwYyvugw
 HEHRg/XSdbIfU51b5TboIKpxW9OyBe0S6xSQ2RbRnCDlUJr6TMOPGL5zb/LMnwwekCOoKdSr/
 FP6DzZE58HHbSwCnEULlIIrNPgk+I5UY3smAmwKjrRl3IPlVUyYTUCcaPg5PlbxpbeSY=
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

These syscalls are not exposed by glibc. The struct type need to be
redefined as it can't be included directly before
https://lkml.org/lkml/2020/5/28/810 .

sched_attr type can grow in future kernel versions. When client sends
values that QEMU does not understand it will return E2BIG with same
semantics as old kernel would so client can retry with smaller inputs.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
Message-Id: <20220105041819.24160-2-tonistiigi@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c      | 123 ++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h |  14 +++++
 2 files changed, 137 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b5112891b046..6de116eb90cb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -340,6 +340,25 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
 #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
 _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
           unsigned long *, user_mask_ptr);
+/* sched_attr is not defined in glibc */
+struct sched_attr {
+    uint32_t size;
+    uint32_t sched_policy;
+    uint64_t sched_flags;
+    int32_t sched_nice;
+    uint32_t sched_priority;
+    uint64_t sched_runtime;
+    uint64_t sched_deadline;
+    uint64_t sched_period;
+    uint32_t sched_util_min;
+    uint32_t sched_util_max;
+};
+#define __NR_sys_sched_getattr __NR_sched_getattr
+_syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
+          unsigned int, size, unsigned int, flags);
+#define __NR_sys_sched_setattr __NR_sched_setattr
+_syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr,
+          unsigned int, flags);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -558,6 +577,24 @@ const char *target_strerror(int err)
     return strerror(target_to_host_errno(err));
 }
 
+static int check_zeroed_user(abi_long addr, size_t ksize, size_t usize)
+{
+    int i;
+    uint8_t b;
+    if (usize <= ksize) {
+        return 1;
+    }
+    for (i = ksize; i < usize; i++) {
+        if (get_user_u8(b, addr + i)) {
+            return -TARGET_EFAULT;
+        }
+        if (b != 0) {
+            return 0;
+        }
+    }
+    return 1;
+}
+
 #define safe_syscall0(type, name) \
 static type safe_##name(void) \
 { \
@@ -10801,6 +10838,92 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         }
     case TARGET_NR_sched_getscheduler:
         return get_errno(sched_getscheduler(arg1));
+    case TARGET_NR_sched_getattr:
+        {
+            struct target_sched_attr *target_scha;
+            struct sched_attr scha;
+            if (arg2 == 0) {
+                return -TARGET_EINVAL;
+            }
+            if (arg3 > sizeof(scha)) {
+                arg3 = sizeof(scha);
+            }
+            ret = get_errno(sys_sched_getattr(arg1, &scha, arg3, arg4));
+            if (!is_error(ret)) {
+                target_scha = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+                if (!target_scha) {
+                    return -TARGET_EFAULT;
+                }
+                target_scha->size = tswap32(scha.size);
+                target_scha->sched_policy = tswap32(scha.sched_policy);
+                target_scha->sched_flags = tswap64(scha.sched_flags);
+                target_scha->sched_nice = tswap32(scha.sched_nice);
+                target_scha->sched_priority = tswap32(scha.sched_priority);
+                target_scha->sched_runtime = tswap64(scha.sched_runtime);
+                target_scha->sched_deadline = tswap64(scha.sched_deadline);
+                target_scha->sched_period = tswap64(scha.sched_period);
+                if (scha.size > offsetof(struct sched_attr, sched_util_min)) {
+                    target_scha->sched_util_min = tswap32(scha.sched_util_min);
+                    target_scha->sched_util_max = tswap32(scha.sched_util_max);
+                }
+                unlock_user(target_scha, arg2, arg3);
+            }
+            return ret;
+        }
+    case TARGET_NR_sched_setattr:
+        {
+            struct target_sched_attr *target_scha;
+            struct sched_attr scha;
+            uint32_t size;
+            int zeroed;
+            if (arg2 == 0) {
+                return -TARGET_EINVAL;
+            }
+            if (get_user_u32(size, arg2)) {
+                return -TARGET_EFAULT;
+            }
+            if (!size) {
+                size = offsetof(struct target_sched_attr, sched_util_min);
+            }
+            if (size < offsetof(struct target_sched_attr, sched_util_min)) {
+                if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
+                    return -TARGET_EFAULT;
+                }
+                return -TARGET_E2BIG;
+            }
+
+            zeroed = check_zeroed_user(arg2, sizeof(struct target_sched_attr), size);
+            if (zeroed < 0) {
+                return zeroed;
+            } else if (zeroed == 0) {
+                if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
+                    return -TARGET_EFAULT;
+                }
+                return -TARGET_E2BIG;
+            }
+            if (size > sizeof(struct target_sched_attr)) {
+                size = sizeof(struct target_sched_attr);
+            }
+
+            target_scha = lock_user(VERIFY_READ, arg2, size, 1);
+            if (!target_scha) {
+                return -TARGET_EFAULT;
+            }
+            scha.size = size;
+            scha.sched_policy = tswap32(target_scha->sched_policy);
+            scha.sched_flags = tswap64(target_scha->sched_flags);
+            scha.sched_nice = tswap32(target_scha->sched_nice);
+            scha.sched_priority = tswap32(target_scha->sched_priority);
+            scha.sched_runtime = tswap64(target_scha->sched_runtime);
+            scha.sched_deadline = tswap64(target_scha->sched_deadline);
+            scha.sched_period = tswap64(target_scha->sched_period);
+            if (size > offsetof(struct target_sched_attr, sched_util_min)) {
+                scha.sched_util_min = tswap32(target_scha->sched_util_min);
+                scha.sched_util_max = tswap32(target_scha->sched_util_max);
+            }
+            unlock_user(target_scha, arg2, 0);
+            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
+        }
     case TARGET_NR_sched_yield:
         return get_errno(sched_yield());
     case TARGET_NR_sched_get_priority_max:
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 585e933140ac..66244589aa3d 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2890,4 +2890,18 @@ struct target_statx {
    /* 0x100 */
 };
 
+/* from kernel's include/linux/sched/types.h */
+struct target_sched_attr {
+    abi_uint size;
+    abi_uint sched_policy;
+    abi_ullong sched_flags;
+    abi_int sched_nice;
+    abi_uint sched_priority;
+    abi_ullong sched_runtime;
+    abi_ullong sched_deadline;
+    abi_ullong sched_period;
+    abi_uint sched_util_min;
+    abi_uint sched_util_max;
+};
+
 #endif
-- 
2.33.1


