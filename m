Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D32C471328
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 10:28:45 +0100 (CET)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvygO-0005UP-GN
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 04:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mvsA6-0004Dx-Sg
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 21:30:58 -0500
Received: from [2607:f8b0:4864:20::52d] (port=33491
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mvsA4-0001Za-Nw
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 21:30:58 -0500
Received: by mail-pg1-x52d.google.com with SMTP id f125so9621414pgc.0
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 18:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrOUghzPEPWUSUHwujj/LIcQrPwhnw1OvJdWErKdR8M=;
 b=hbvOCBeLFC+bt43BZiJdHeHl7qNb1lvyUg6ZzPdgiZVZq7rb8fMIZOGzlz4RL+oMy5
 qBvoT95CxYoVgCVIl5We5T9wa4T2urCg8BFkwYrD0W9Evm6MYSvqW2KLprtERCxk4EwY
 NjiyBuvRplTGb34IknXhvF94DXO/IT4BeKT6/RT/to3BfO+7HW9kQ89Vcl0UGUadKapz
 tl0lKISojead9mJ1e7Ya6itbazgDHC5gXlW7M9YIJ9PVpP8JXWw5Jy0o38ydjsKypwDT
 MbHdFdVYQ7/AQHjq96URHutcn6xz3PAw3U8SB0VcojEZ2Ch7UKR+/0jiG1PFLVPecKl8
 4hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrOUghzPEPWUSUHwujj/LIcQrPwhnw1OvJdWErKdR8M=;
 b=g8ZLEXeLxst9E7pfdaLGVfcSCyG3834CLox4vmx/yRZrLHUg3zOVsMPez8+2yXqTQC
 lW6B6gmf46SyiREvDhXhCOfF6VQQyU3xWIxVKcxM7QIFVC8PWF90oWDDbqJBY6QtVIoV
 tYZc7RUXGvV5GMxJWkb7I4jiR2sdLYzjlUVcjobrO2Tqi8vHJhp89CwgbueFrmvtlE4i
 rMJR8VeV0E8m0UipWIJoF+AwDUHrLbQCjoznaJB53H9u8eKSKncDuKFR15GxxMtj9Yf8
 uTJk71bhFRaQOGv2CiDvkep93HLJ8Bp6q7/ZIAQ2NoreeLfCjxt/kPXKNNaljmu6GtaL
 zvfQ==
X-Gm-Message-State: AOAM53261ACl6WB2kJpuniUZBi8dtr8CLqtTj25WRackDkGie2yjUdG4
 xl0hrg1EpwG/ejvz2UnxbJrik5gb8jk=
X-Google-Smtp-Source: ABdhPJyNX2pQkY1NgXpyfrhzK9JkpLgbAikp7WdBLMP1VR07c4b7KJR6/aW4TbajfQVALqI1PHl6LA==
X-Received: by 2002:a63:41c6:: with SMTP id
 o189mr42475643pga.625.1639189854207; 
 Fri, 10 Dec 2021 18:30:54 -0800 (PST)
Received: from localhost ([2601:646:100:6be:6177:c6b7:1b7d:7a95])
 by smtp.gmail.com with UTF8SMTPSA id mg12sm292397pjb.10.2021.12.10.18.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 18:30:53 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] linux-user: call set/getscheduler set/getparam directly
Date: Fri, 10 Dec 2021 18:27:50 -0800
Message-Id: <20211211022749.95384-3-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211211022749.95384-1-tonistiigi@gmail.com>
References: <20211211022749.95384-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=tonistiigi@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 11 Dec 2021 04:25:17 -0500
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

There seems to be difference in syscall and libc definition of these
methods and therefore musl does not implement them (1e21e78bf7). Call
syscall directly to ensure the behavior of the libc of user application,
not the libc that was used to build QEMU.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 670b61b2ef..263d7fac5e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -343,6 +343,14 @@ _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
 _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr, unsigned int, size, unsigned int, flags);
 #define __NR_sys_sched_setattr __NR_sched_setattr
 _syscall3(int, sys_sched_setattr, pid_t, pid, struct sched_attr *, attr, unsigned int, flags);
+#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
+_syscall1(int, sys_sched_getscheduler, pid_t, pid);
+#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
+_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy, const struct sched_param *, param);
+#define __NR_sys_sched_getparam __NR_sched_getparam
+_syscall2(int, sys_sched_getparam, pid_t, pid, struct sched_param *, param);
+#define __NR_sys_sched_setparam __NR_sched_setparam
+_syscall2(int, sys_sched_setparam, pid_t, pid, const struct sched_param *, param);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10563,7 +10571,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 return -TARGET_EFAULT;
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg2, 0);
-            return get_errno(sched_setparam(arg1, &schp));
+            return get_errno(sys_sched_setparam(arg1, &schp));
         }
     case TARGET_NR_sched_getparam:
         {
@@ -10573,7 +10581,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            ret = get_errno(sched_getparam(arg1, &schp));
+            ret = get_errno(sys_sched_getparam(arg1, &schp));
             if (!is_error(ret)) {
                 if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0))
                     return -TARGET_EFAULT;
@@ -10593,10 +10601,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 return -TARGET_EFAULT;
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
-- 
2.30.1 (Apple Git-130)


