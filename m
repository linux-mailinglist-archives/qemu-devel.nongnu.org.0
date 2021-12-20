Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E847B536
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:30:37 +0100 (CET)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQEu-0006t2-Ar
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:30:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mzLX0-0000Wj-Hp
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:28:58 -0500
Received: from [2607:f8b0:4864:20::1031] (port=55837
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mzLWv-0003SX-1k
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:28:55 -0500
Received: by mail-pj1-x1031.google.com with SMTP id iy13so4449977pjb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2EngvWktQzPKI4UWuTrjTke03rnPQ6HHq2KsDFrxlM=;
 b=BRAuYAi7iQ2NMoH+OV4Yks2Ut/yWuWTmnT8QyhbYttk1791kf5wEMVjFuH7vhYFSDf
 2s0r86qjFmYJJVDMUh6zqH9olQUrGHOnKdCKK0LTQtAU8rkHXC11Wb6J4Li80UirTdCJ
 dqMavfmrLOhZ3o9nqo8gqewnissVFMl8ioS4lwJPp81WNaAgzILfhZ+ZXuy4rXOwdYS9
 XooSKytUXr+kVUwgyoIOFMBq00IsMSJslZSrMu66aVX0JTENweEwvL40Ke29YjV3SvXM
 CE7zTL8hxYzfkU7uhynn7TX+Y1YJ2NfFaKe7d84nthi0RUGWnnd1+1GVb/h66PFJXe2O
 +rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2EngvWktQzPKI4UWuTrjTke03rnPQ6HHq2KsDFrxlM=;
 b=ZI1w8+IUnH5RlIHKyPn2C0Hlrm/R+clixeYwKLtbcYHkSZJp6/f4Ylyh2lNIxcT8Y3
 d+RFa2EaTqUt7BUCdx1cVr5p9WMjSrD4OiiJBp9W2enOj9qKR7HWxNiCDabOlx9Arsyt
 2n3BVSi2T0UGlm/t/nfRpuCXpzNVL6r8C5DoQN/881v1iSypGiTPBgNXAyPvTVN1akQ5
 bLWQSy9DCL9TU0yU1HWnps0xq0pZxgHm/FOLfmgWHJAS/vp7U8rXzqvCKDi+eqYy0pU7
 vzdP/VQvwBgFD0/0cnWodGc4ozlTM9aovPspI5EoJgaf7aH/vk5z7SVX4JLnJNQr2Xu7
 Pkyg==
X-Gm-Message-State: AOAM532Pge+Riphi/tx307QTW0rmCCUy/Yhe6Ki6y6QPXEifZ+vpNtw4
 6JThBTAFEdg6bGSO6JP6wjE1XkRq7cTsbA==
X-Google-Smtp-Source: ABdhPJyupNDgYqdpxpEBDZx9PTGmfyvvOgA4Ct98Q2mJHgWzvYZH/+aa6gbjEqg+z4ljO67kUG3o2Q==
X-Received: by 2002:a17:902:e805:b0:149:95a:1983 with SMTP id
 u5-20020a170902e80500b00149095a1983mr5317196plg.9.1639984895327; 
 Sun, 19 Dec 2021 23:21:35 -0800 (PST)
Received: from localhost ([2601:646:100:6be:144b:f686:1c59:8e87])
 by smtp.gmail.com with UTF8SMTPSA id u2sm6477896pjc.23.2021.12.19.23.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:21:34 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] linux-user: add sched_getattr support
Date: Sun, 19 Dec 2021 23:21:04 -0800
Message-Id: <20211220072105.48860-2-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20211220072105.48860-1-tonistiigi@gmail.com>
References: <20211220072105.48860-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=tonistiigi@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:21:27 -0500
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

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 72 +++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h | 14 ++++++++
 2 files changed, 86 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f1cfcc8104..a447ce1f92 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -339,6 +339,12 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
 #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
 _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
           unsigned long *, user_mask_ptr);
+#define __NR_sys_sched_getattr __NR_sched_getattr
+_syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
+          unsigned int, size, unsigned int, flags);
+#define __NR_sys_sched_setattr __NR_sched_setattr
+_syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
+          unsigned int, flags);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10593,6 +10599,72 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         }
     case TARGET_NR_sched_getscheduler:
         return get_errno(sched_getscheduler(arg1));
+    case TARGET_NR_sched_getattr:
+        {
+            struct target_sched_attr *target_scha;
+            struct target_sched_attr scha;
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
+                target_scha->sched_flags = tswap64(scha.sched_policy);
+                target_scha->sched_nice = tswap32(scha.sched_nice);
+                target_scha->sched_priority = tswap32(scha.sched_priority);
+                target_scha->sched_runtime = tswap64(scha.sched_runtime);
+                target_scha->sched_deadline = tswap64(scha.sched_deadline);
+                target_scha->sched_period = tswap64(scha.sched_period);
+                if (scha.size > offsetof(struct target_sched_attr, sched_util_min)) {
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
+            struct target_sched_attr scha;
+            uint32_t *size;
+            if (arg2 == 0) {
+                return -TARGET_EINVAL;
+            }
+
+            if (!lock_user_struct(VERIFY_READ, size, arg2, 1)) {
+                return -TARGET_EFAULT;
+            }
+            unlock_user_struct(size, arg2, 0);
+            *size = tswap32(*size);
+
+            target_scha = lock_user(VERIFY_READ, arg2, *size, 1);
+            if (!target_scha) {
+                return -TARGET_EFAULT;
+            }
+            scha.size = *size;
+            scha.sched_policy = tswap32(target_scha->sched_policy);
+            scha.sched_flags = tswap64(target_scha->sched_flags);
+            scha.sched_nice = tswap32(target_scha->sched_nice);
+            scha.sched_priority = tswap32(target_scha->sched_priority);
+            scha.sched_runtime = tswap64(target_scha->sched_runtime);
+            scha.sched_deadline = tswap64(target_scha->sched_deadline);
+            scha.sched_period = tswap64(target_scha->sched_period);
+            if (scha.size > offsetof(struct target_sched_attr, sched_util_min)) {
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
index 0b13975937..310d6ce8ad 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2914,4 +2914,18 @@ struct target_statx {
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
2.32.0 (Apple Git-132)


