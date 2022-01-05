Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3889484D0E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:22:33 +0100 (CET)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xon-0005ZW-1U
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4xlM-00039u-9K
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:19:00 -0500
Received: from [2607:f8b0:4864:20::433] (port=41664
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1n4xlD-0002Iz-TQ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:18:59 -0500
Received: by mail-pf1-x433.google.com with SMTP id m1so34051906pfk.8
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 20:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80SNNLA7Xbmhx09T7VHhYcUTLbL4szp0eV2TvyB2pdw=;
 b=adojGwteuqVGSf4TG47I804mcHIARHnAfN5damji9iu7qaK+xo2qW+oPCAFHSHNDXS
 3kI62E065ZBb5AgMMfM67FtkVQHNJnxaFUqCWnHoIPxOGEvEQlIj1bta7W92/9aJE8Gl
 q6Hh/fQNuoSxjeSDVyYUVchs5t8oAktCVdUe7HeRf/styJ4da2VtzRExkjB0JqrRVzKf
 H0AbyYBkjiGpAHYHo4JyGtrxhgnvvCBvQVTQDsFufJICXgiYvcT0o4SJX/NLbFw7QD+j
 dS8dIHHPoeMa/Iom+T8amEKojobqDjz3ujRFi8WTV9k3ZivN2jIYzJ+xlf5QPaIBOyxR
 bvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80SNNLA7Xbmhx09T7VHhYcUTLbL4szp0eV2TvyB2pdw=;
 b=knZ21k7LJKZwLFmau1DlvOjE3AHFryGxKfJrdoUgjIrgRs+/XnMLPz7VoornM62Cx4
 lT5v1/6EnDGecesgDqB1U4w3Z/+lcIVtKR8RqK1P730Sw0lusjnJDBGZl9fOEuptrD1t
 S0EKI6mxL2+FO5J4Gugt2yIH8WXUq/7yG+5ccpTH36F3KIfhtXNbytc/D9dVdZI1ulSj
 BVJ3lkNymKjCEoH8jfkYRijq/ExhLrcyJcuLGmMaVBHPsci8lwWpevYU0cd5eLTXZiLb
 LNo82pqww/doNkeNhC0xFCCYpWsKimCcWGX2W29LXN6plz8LAizhgrmDbBuzxh5rrWvZ
 06tA==
X-Gm-Message-State: AOAM532FfUBs4BEptd2t/HQlu3k9hZsgi4hfsOd3DWPXpkL6EXcKe9oC
 35CsHn+ABi165irZY36tc1alw33vKN1Xnw==
X-Google-Smtp-Source: ABdhPJzeBkHBlTPxNkaLifEZQxofctXLJmheBcbzzGfDa9nuByBevzwW5DroRTMp6gpc/7WZeUqNvA==
X-Received: by 2002:a63:1422:: with SMTP id u34mr47318431pgl.135.1641356330294; 
 Tue, 04 Jan 2022 20:18:50 -0800 (PST)
Received: from localhost ([2601:646:100:6be:50e6:7c07:b67:f135])
 by smtp.gmail.com with UTF8SMTPSA id f4sm41164498pfj.25.2022.01.04.20.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 20:18:49 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] linux-user: add sched_getattr support
Date: Tue,  4 Jan 2022 20:18:18 -0800
Message-Id: <20220105041819.24160-2-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220105041819.24160-1-tonistiigi@gmail.com>
References: <20220105041819.24160-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=tonistiigi@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These syscalls are not exposed by glibc. The struct type need to be
redefined as it can't be included directly before
https://lkml.org/lkml/2020/5/28/810 .

sched_attr type can grow in future kernel versions. When client sends
values that QEMU does not understand it will return E2BIG with same
semantics as old kernel would so client can retry with smaller inputs.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 123 ++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h |  14 +++++
 2 files changed, 137 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56a3e17183..1b8415c8a3 100644
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
@@ -10594,6 +10631,92 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


