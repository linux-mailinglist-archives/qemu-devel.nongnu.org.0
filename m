Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA347E552
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:04:33 +0100 (CET)
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Pdw-0006Rx-IC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:04:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0Hyb-0000aM-BK
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:53:22 -0500
Received: from [2607:f8b0:4864:20::1036] (port=53873
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0HyZ-0000St-KD
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:53:21 -0500
Received: by mail-pj1-x1036.google.com with SMTP id mj19so4263280pjb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 22:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=roIWVlWrA/XJs3K+sn+TYf0ybx6nOcZ/6lNtmMZ5D4I=;
 b=Yd/X+qwl5Fls5Nf5zFxjhuxs3WbuwVvnkoOs4+7MAy9tCdiJ3yA+/Mb1H5fOrNETl2
 fVymsWHS5z0Q4P2Cocg6FdFJypjjy3y/VGp7LfrvC0f+k5ZQhhD9tdi7GE4ZHcY/aDRu
 H307nNHKrQ7ZU1FOVp5MC+fTHK2wA4wC24vDRUwLRUA4dIyIsns9uuDQrf9gSq3UUJ5n
 1gFmjogLDghVaX7nA7rCs1g0Ku2ibu1nUplpxqBfqpgbYFgX5h8hOXT8EhiDPp/CJaPm
 VtKPfYKq4LiTEykqytlK+eQODIHocB4OOT5gfh99/LEozm5hGxWl/ITO6PKJ8IoUp3Cu
 a8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=roIWVlWrA/XJs3K+sn+TYf0ybx6nOcZ/6lNtmMZ5D4I=;
 b=7LZgm2BYo+h1vAYt/aKIA+m/lKXcoGVJ57Xr4ptETgjgjEErNPRr+Hng3uLnhW8MWK
 LPXRVylB5Sj+pmNChYU2toZGLNjZxQOduxGdToQ1VKdsnxyGydWCsShZGwLE3jUKDE5p
 aG4kjCO7BWzNJcS0gOJFTiOTJOF47QhiRVCrzrfVLx2J2jZLEKhqeGBwP0jBTSyDOW1T
 0AUBJ/qlGuZWkh85lmF2Cj0wxO7LXP4/HPeHSvoyTNhg9LivFjMRXaTR9DYAk4gDiam3
 d7fui4HJrAVrG8TNAGqwT1T9G5c5yNULAqLzZ3vHI7MlyBHam0ukp580Me9blLgbCT+m
 OwdA==
X-Gm-Message-State: AOAM530IwXxUc2h9+XCrzp0xPWkghHnkM9cqjMgTRmdNjOJz9DddW7dz
 oyto/lfGCUTFliRmFloOYjy80FTzU8LJs0lz
X-Google-Smtp-Source: ABdhPJyUz1Q6caiE4WmQxxwG2JlVZj2Mr6wZ0fMeeT260yB6kKrpbKXzixCD1YFsfV+GvKRfvayUZA==
X-Received: by 2002:a17:902:d346:b0:148:d0bf:8ef1 with SMTP id
 l6-20020a170902d34600b00148d0bf8ef1mr1110447plk.77.1640242068601; 
 Wed, 22 Dec 2021 22:47:48 -0800 (PST)
Received: from localhost ([2601:646:100:6be:28e2:4700:e00c:9454])
 by smtp.gmail.com with UTF8SMTPSA id e24sm7525708pjt.45.2021.12.22.22.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 22:47:48 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] linux-user: call set/getscheduler set/getparam directly
Date: Wed, 22 Dec 2021 22:47:28 -0800
Message-Id: <20211223064728.18048-3-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20211223064728.18048-1-tonistiigi@gmail.com>
References: <20211223064728.18048-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=tonistiigi@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 10:02:09 -0500
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There seems to be difference in syscall and libc definition of these
methods and therefore musl does not implement them (1e21e78bf7). Call
syscall directly to ensure the behavior of the libc of user application,
not the libc that was used to build QEMU.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 40 ++++++++++++++++++++++++++-------------
 linux-user/syscall_defs.h |  4 ++++
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2f5a0fac5a..8c03a52a36 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -345,6 +345,17 @@ _syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
 #define __NR_sys_sched_setattr __NR_sched_setattr
 _syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
           unsigned int, flags);
+#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
+_syscall1(int, sys_sched_getscheduler, pid_t, pid);
+#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
+_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy,
+          const struct target_sched_param *, param);
+#define __NR_sys_sched_getparam __NR_sched_getparam
+_syscall2(int, sys_sched_getparam, pid_t, pid,
+          struct target_sched_param *, param);
+#define __NR_sys_sched_setparam __NR_sched_setparam
+_syscall2(int, sys_sched_setparam, pid_t, pid,
+          const struct target_sched_param *, param);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10555,30 +10566,32 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setparam:
         {
-            struct sched_param *target_schp;
-            struct sched_param schp;
+            struct target_sched_param *target_schp;
+            struct target_sched_param schp;
 
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
-            struct sched_param schp;
+            struct target_sched_param *target_schp;
+            struct target_sched_param schp;
 
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
@@ -10586,19 +10599,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setscheduler:
         {
-            struct sched_param *target_schp;
-            struct sched_param schp;
+            struct target_sched_param *target_schp;
+            struct target_sched_param schp;
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
index 310d6ce8ad..28b9fe9a47 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2928,4 +2928,8 @@ struct target_sched_attr {
     abi_uint sched_util_max;
 };
 
+struct target_sched_param {
+    abi_int sched_priority;
+};
+
 #endif
-- 
2.32.0 (Apple Git-132)


