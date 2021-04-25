Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FA36A824
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 17:59:36 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahAV-0000oj-LI
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 11:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8w-0007re-LO
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8r-0003AM-UP
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id s20so11791073plr.13
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IgvkexELK5GJ0O4GQCm7etvF50WdinqYZI5Hh6LxDP8=;
 b=jPPreAgjHdgMos9T0ha5KnqW+/CZp2iVeATt9rtPLncqW1SEb6p9v7zD4rj1H46cgW
 LvRKAAOAEDB8lgDPS/sJPCDT43P8PvZ5AoIn/WmuM3a+gJvpOfNLW4U/vQr0taqD2b1c
 BOXkLkwqXkDRjB0ZcQ5nA+JvTHc9z77CSAoTZctOd/UCk1X2ZufpDY9n9bkmr8mK4ph1
 JvddAcxhNavI16/nQhQAq32SbNsDUXoMq39P2sNt/Ka1swOjKqrH5xxCBZ8iGH5xSVC4
 7guDA9kA2USLbANDfRZOp8kg7FBMY9ec0Rr/jZ3kvOT4uyekILghcT9eNeYQdB3TMO9C
 KnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgvkexELK5GJ0O4GQCm7etvF50WdinqYZI5Hh6LxDP8=;
 b=T+zjpkJ067AfOvyg2hptyZ482/OAZQvN8lV8WJEJKLDdFoDMLu5xa+cvwvslDr8C6i
 QVIo0BrBsj1+LojsHzMHz3hSXH1I6KK84jPfrfmr/YmCdgG7mxwzjcTKPe3krp5z7xkZ
 Yb7oTUDyOGsKOFY+cJ+c2PAX9IWlcKwDiDd5+g7odiwTJdkfpNCCPw5HkDVlI2yPXJNA
 v4Aoi7z563RSvLFHTF+s/sWIaS8QRvr/C7nBRe89U1gy18FOWGHjrhLEv4u8p4FppaQ6
 8d/CLvo4X7QLO7GxBSXLllsapNo8/cz3Z9kBvvqH4Ynj2hDdf2JSsv/rDe1XKFvFa101
 WfCw==
X-Gm-Message-State: AOAM533CBxOhzg62cWQkTBouhCzjJ06kAbc/W/itH/n5/eDWyKJdnPJQ
 M+7l7bGw5LgLBqxyVlGRtJk4/x1iF1xAAg==
X-Google-Smtp-Source: ABdhPJyKByADHyOTgl4UePN4ApkDQ6gero1mz6CalA2m614BcdLePlOAvQNwETxbPjV2fccnwQft3g==
X-Received: by 2002:a17:90b:88d:: with SMTP id
 bj13mr9555545pjb.192.1619366272598; 
 Sun, 25 Apr 2021 08:57:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] linux-user: Pass CPUArchState to do_sigaltstack
Date: Sun, 25 Apr 2021 08:57:44 -0700
Message-Id: <20210425155749.896330-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have exactly one call, it's easy to pass
in env instead of passing in the sp value.
Use target_save_altstack, which required env.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h    |  3 ++-
 linux-user/signal.c  | 11 ++++-------
 linux-user/syscall.c |  3 +--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 74e06e7121..3b0b6b75fe 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -432,7 +432,8 @@ int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env);
 int do_sigprocmask(int how, const sigset_t *set, sigset_t *oldset);
 abi_long do_swapcontext(CPUArchState *env, abi_ulong uold_ctx,
                         abi_ulong unew_ctx, abi_long ctx_size);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 306f3edec5..83891f7c47 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -800,21 +800,18 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
 
 /* do_sigaltstack() returns target values and errnos. */
 /* compare linux/kernel/signal.c:do_sigaltstack() */
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
+                        CPUArchState *env)
 {
     target_stack_t oss, *uoss = NULL;
     abi_long ret = -TARGET_EFAULT;
 
     if (uoss_addr) {
-        TaskState *ts = (TaskState *)thread_cpu->opaque;
-
         /* Verify writability now, but do not alter user memory yet. */
         if (!lock_user_struct(VERIFY_WRITE, uoss, uoss_addr, 0)) {
             goto out;
         }
-        __put_user(ts->sigaltstack_used.ss_sp, &oss.ss_sp);
-        __put_user(ts->sigaltstack_used.ss_size, &oss.ss_size);
-        __put_user(sas_ss_flags(sp), &oss.ss_flags);
+        target_save_altstack(&oss, env);
     }
 
     if (uss_addr) {
@@ -823,7 +820,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
         if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
             goto out;
         }
-        ret = target_restore_altstack(uss, sp);
+        ret = target_restore_altstack(uss, get_sp_from_cpustate(env));
         if (ret) {
             goto out;
         }
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c7c3257f40..32a41c1387 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11140,8 +11140,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     }
     case TARGET_NR_sigaltstack:
-        return do_sigaltstack(arg1, arg2,
-                              get_sp_from_cpustate((CPUArchState *)cpu_env));
+        return do_sigaltstack(arg1, arg2, cpu_env);
 
 #ifdef CONFIG_SENDFILE
 #ifdef TARGET_NR_sendfile
-- 
2.25.1


