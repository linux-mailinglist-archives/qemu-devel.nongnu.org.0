Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B76471327
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 10:27:01 +0100 (CET)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvyeh-0003BU-Il
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 04:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mvsA3-00048V-V5
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 21:30:55 -0500
Received: from [2607:f8b0:4864:20::1030] (port=50709
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mvsA0-0001NI-Nf
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 21:30:54 -0500
Received: by mail-pj1-x1030.google.com with SMTP id x7so8112693pjn.0
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 18:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtZ1YMikYyFgsi1Yt0htyJikk5T5nrKxHzHvgXKYm2w=;
 b=qwWGB8xgS18e7njeHMxDsaPmaVTmIIW+SicQnhscVfHa/lK2l9lKT61SRm/5mAzqc9
 ctRkW66dJGH/CLdcpgXMLDBvQBU25ol//w3Wwq3e8UBz0K6b6Kj9479MPXbv314ij+kY
 L+xa4yJ43HeKA8AQFqD3gDDKiegSBs84a19jthdIs7NSe6NsE4SI07FAlSnJcWuNyBeD
 tRUWrY+YVYJRlkbe1zGjBF8/Nq0yJQ2rYE6hPQxBV+Wq14+f5/GBWtIPdxHEefkM6HDh
 +DKAqHIdjPm8MeT4JUUKP7ZgweqQvTHEyRVZ+nl2/DhxilN6pPLy+5KFb83Axs1csAKM
 0H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtZ1YMikYyFgsi1Yt0htyJikk5T5nrKxHzHvgXKYm2w=;
 b=66t2Yr9PBmIadp7XXWDd464OlBQalZksepWjWQD5R2xqTGa7kcLCfgz93cCmQWjYZs
 hmB4kRh10o/TM/myR7XBpTJ+21egltNDUGA2T5OLd4mcS6EU8h0e+ej6p7KkeYfY3mU8
 v/A6ab9PmZtHFY/4r1/HGodyE1/9OUTaJLg+FvV71Kb2k5UTli8t84vI0Pqn5dHKQl9L
 EnM5Uqejks0iPKqEii7tjkuCsP4SVY846EqAfoso+1MO86r9ABkqFgBc3U0GXlsBdb9P
 QGiKVCeXWUkMxXDTu/1b+ACcy4XL2kFXYOQcuDv8x9CtGC7IqrsziceZA3hhih4HeZjO
 VsTg==
X-Gm-Message-State: AOAM530Fr8fT6MYGnP42pe/a9FeXQxVeWuyuOBuS7ag5cQEX5XynCRte
 mM6VHf2X2sjRCQovQbhzRWcyGpKgNcg=
X-Google-Smtp-Source: ABdhPJx8i+TFQXpBkIxpkugpbnUsh72q3k/mJyxLlCM8Zn/qCI/Wbz+H5V/QcEXN3Kb/Ki58khWYgw==
X-Received: by 2002:a17:90a:e60a:: with SMTP id
 j10mr28778776pjy.169.1639189851075; 
 Fri, 10 Dec 2021 18:30:51 -0800 (PST)
Received: from localhost ([2601:646:100:6be:6177:c6b7:1b7d:7a95])
 by smtp.gmail.com with UTF8SMTPSA id s15sm276094pjs.51.2021.12.10.18.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 18:30:50 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] linux-user: add sched_getattr support
Date: Fri, 10 Dec 2021 18:27:49 -0800
Message-Id: <20211211022749.95384-2-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211211022749.95384-1-tonistiigi@gmail.com>
References: <20211211022749.95384-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=tonistiigi@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Dec 2021 04:25:16 -0500
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 55 +++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h | 15 +++++++++++
 2 files changed, 70 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f1cfcc8104..670b61b2ef 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -339,6 +339,10 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
 #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
 _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
           unsigned long *, user_mask_ptr);
+#define __NR_sys_sched_getattr __NR_sched_getattr
+_syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr, unsigned int, size, unsigned int, flags);
+#define __NR_sys_sched_setattr __NR_sched_setattr
+_syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr, unsigned int, flags);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10593,6 +10597,57 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
+            ret = get_errno(sys_sched_getattr(arg1, &scha, arg3, arg4));
+            if (!is_error(ret)) {
+                if (!lock_user_struct(VERIFY_WRITE, target_scha, arg2, 0))
+                    return -TARGET_EFAULT;
+                target_scha->size = tswap32(scha.size);
+                target_scha->sched_policy = tswap32(scha.sched_policy);
+                target_scha->sched_flags = tswap64(scha.sched_policy);
+                target_scha->sched_nice = tswap32(scha.sched_nice);
+                target_scha->sched_priority = tswap32(scha.sched_priority);
+                target_scha->sched_runtime = tswap64(scha.sched_runtime);
+                target_scha->sched_deadline = tswap64(scha.sched_deadline);
+                target_scha->sched_period = tswap64(scha.sched_period);
+                if (scha.size >= 0x38) {
+                    target_scha->sched_util_min = tswap32(scha.sched_util_min);
+                    target_scha->sched_util_max = tswap32(scha.sched_util_max);
+                }
+                unlock_user_struct(target_scha, arg2, 1);
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
+            if (!lock_user_struct(VERIFY_READ, target_scha, arg2, 1))
+                return -TARGET_EFAULT;
+            scha.size = tswap32(target_scha->size);
+            scha.sched_policy = tswap32(target_scha->sched_policy);
+            scha.sched_flags = tswap64(target_scha->sched_flags);
+            scha.sched_nice = tswap32(target_scha->sched_nice);
+            scha.sched_priority = tswap32(target_scha->sched_priority);
+            scha.sched_runtime = tswap64(target_scha->sched_runtime);
+            scha.sched_deadline = tswap64(target_scha->sched_deadline);
+            scha.sched_period = tswap64(target_scha->sched_period);
+            if (scha.size >= 0x38) {
+                scha.sched_util_min = tswap32(target_scha->sched_util_min);
+                scha.sched_util_max = tswap32(target_scha->sched_util_max);
+            }
+            unlock_user_struct(target_scha, arg2, 0);
+            return get_errno(sys_sched_setattr(arg1, &scha, arg3));
+        }
     case TARGET_NR_sched_yield:
         return get_errno(sched_yield());
     case TARGET_NR_sched_get_priority_max:
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 0b13975937..715ec75462 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2914,4 +2914,19 @@ struct target_statx {
    /* 0x100 */
 };
 
+/* from kernel's include/linux/sched/types.h */
+struct target_sched_attr {
+    uint32_t size;
+    uint32_t sched_policy;
+    uint64_t sched_flags;
+    int32_t sched_nice;
+    uint32_t sched_priority;
+    uint64_t sched_runtime;
+    uint64_t sched_deadline;
+    uint64_t sched_period;
+    // 0x30
+    uint32_t sched_util_min;
+    uint32_t sched_util_max;
+};
+
 #endif
-- 
2.30.1 (Apple Git-130)


