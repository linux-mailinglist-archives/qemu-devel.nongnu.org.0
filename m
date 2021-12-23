Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDC47E553
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 16:04:35 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Pdy-0006Tp-41
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 10:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0I0W-0001V8-Vl
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:55:21 -0500
Received: from [2607:f8b0:4864:20::f31] (port=40627
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n0I0V-0000ju-CO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:55:20 -0500
Received: by mail-qv1-xf31.google.com with SMTP id q3so4418485qvc.7
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 22:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIw+R1RY/Y5QFG4Ac7lm7tGzhOFe3QwmKTSdFZsUqpg=;
 b=FSIigy/qC/jXAy5ng2BzEnu29PO5wOYimMoBpOzYAofJ5R6QOPXLJBhj5qvjfzxvWW
 SCSOVAP2xqH7sgZXYKPEnzpTbe0kDzi9B8JOSUlZYB4xEtlyjYPIMzny82SdrFMwyBLU
 tqph2H4Xs9efC0kUZf4uTPITZh0yo396twjdoFwMyyDc2pJrW4O7dQCxP6m4AqLpWRiH
 lvewgouNWQ417mP8qHFD8N86CZhPvS/W82iB9LrK195gkVTNdNSha4uHtFlbDf4KgrpZ
 1fMI95cIChgyQmxYPMUmD8LQQ4U/euDKtP8b2zoNx696/IJ5cLfqzvbNQKDXlA3tMvDo
 gJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIw+R1RY/Y5QFG4Ac7lm7tGzhOFe3QwmKTSdFZsUqpg=;
 b=rKDIkR2Yb77YLjc+Unm/pJ1qzoHl7z59T+1JIx5Wol02Wf+Oi7WSmicwLvn2AMACPP
 sOLGOjt6ViBipZ7cb+C/SAWxB4+wpxaAeUceciesdFiqIo/6OF7FpDTzpBfkecIplfgo
 IsHimXpmcfXerNxbxHC2co0ssbxY+FmAcFT2rfVdheiRPLC3sQXPHuAWDCYwErZTZNuH
 23KbN1ZemHhEPCoHcYE1YFTedgMWbu0tx9Wwc9l5Go29kLQSm+Qeqv6VRSBvO2eBM6gK
 SCeePJulstzH0OzRUlmBLcTITVhE/exvpGXp9wBosgQWvqALpiP9TqB38WWOdQgwJCCq
 9iIg==
X-Gm-Message-State: AOAM532spr8839YKH5eu6c0GeblOxUp7keCMN/aiLy6uEwGUfltmxDza
 Gs/3yVMWdPE7ku9iy/rL4JY0Aid/hdLgGKEu
X-Google-Smtp-Source: ABdhPJwWFtxgMA8adPpAvWWBZ2QNgVdS1ybt54H6nS8eQQ0ZeoH/l9YEwnu/lLXOgcVAjbDrfgvDdw==
X-Received: by 2002:a17:902:708b:b0:148:b0b0:2ad3 with SMTP id
 z11-20020a170902708b00b00148b0b02ad3mr1105024plk.115.1640242065546; 
 Wed, 22 Dec 2021 22:47:45 -0800 (PST)
Received: from localhost ([2601:646:100:6be:28e2:4700:e00c:9454])
 by smtp.gmail.com with UTF8SMTPSA id m16sm4697133pfk.32.2021.12.22.22.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 22:47:45 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] linux-user: add sched_getattr support
Date: Wed, 22 Dec 2021 22:47:27 -0800
Message-Id: <20211223064728.18048-2-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20211223064728.18048-1-tonistiigi@gmail.com>
References: <20211223064728.18048-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=tonistiigi@gmail.com; helo=mail-qv1-xf31.google.com
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

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 94 +++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h | 14 ++++++
 2 files changed, 108 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f1cfcc8104..2f5a0fac5a 100644
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
@@ -10593,6 +10599,94 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
+                target_scha->sched_flags = tswap64(scha.sched_flags);
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
+            if (arg2 == 0) {
+                return -TARGET_EINVAL;
+            }
+            uint32_t size;
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
+            if (size > sizeof(scha)) {
+                for (int i = sizeof(scha); i < size; i++) {
+                    uint8_t b;
+                    if (get_user_u8(b, arg2 + i)) {
+                        return -TARGET_EFAULT;
+                    }
+                    if (b != 0) {
+                        if (put_user_u32(sizeof(struct target_sched_attr), arg2)) {
+                            return -TARGET_EFAULT;
+                        }
+                        return -TARGET_E2BIG;
+                    }
+                }
+                size = sizeof(scha);
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


