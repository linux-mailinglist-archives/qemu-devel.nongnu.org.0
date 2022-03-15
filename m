Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A94DA5A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 23:47:24 +0100 (CET)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUFwo-00072U-OR
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 18:47:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUFuv-0005v6-PA
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 18:45:25 -0400
Received: from [2607:f8b0:4864:20::629] (port=36836
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUFut-0001wR-Lp
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 18:45:25 -0400
Received: by mail-pl1-x629.google.com with SMTP id e13so353898plh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 15:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdJ9yiQhHKZCmYt8QF75X0yw/2/BsUiW50oWy1jsd8Q=;
 b=JO7nDHLP++b0bz6NQ1n9cOBCb/sdhlkgADcPv+pGbwG+QgTO6QZaBtUveCXL3drKFK
 Krgks9DjZLWTqHu65pmkg4PuLuB9pF+yzluNM/JFyzGAP8PL+l4TSfMF+z/GduoHYjLU
 1jvSbGE3dIhXG4Gf3CD5YYbyLtC3BPzUD0/NOMNjGH5RWzUI0Gn8AWXa5g/GgDdAUagc
 idlU2w/R9jeoGYJIOmvn0YipHUt6tv7T1UiADoX5J5wuV3OwjfGILmc7BUwr+HDfUY/t
 Ypz6yqkwk+QDGh66FxOyzyQUZV0eLP3c0Yz5aiJ6zyX7vBxsnm8AeYEUt27lScZuW5/g
 0OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdJ9yiQhHKZCmYt8QF75X0yw/2/BsUiW50oWy1jsd8Q=;
 b=7LCT9Z+fPgZPLakSxKjM00rcu+oUWfq6wKMkWTA/VqX1WuWKeDe5fzsz+ua/gYfTun
 a8wzGzw1Xto6WFgW6wQ3S+LXp13klVAZIfHtGLhfOB/BLizxhgF10CBY+YWxttoCvzX1
 P8E0cyi+1IRf9YD3VL2SdxPrZ3qvzFBvVmBJnKIre4urV2gXI79f07pDyJwoqv47C6WA
 miYls8VNSAmOOMjx9ME8kDVaA7jsYxAX5e4gx0gzjZ+q7wRND8bvohH2UNCRbgFWLI4S
 y9jsRZNNhiL3G53ZSIbKG1nojlPdmlHU8fCmsm7jzAvLpMdutQxS9MqAbhvOBK5xGS2Z
 fjAQ==
X-Gm-Message-State: AOAM530/K7n7BDvF5EiQoBN0ejx7rBr2hU9iD4SL+3KYcYTL/1IXovnl
 SZZZx+xU+5GwBbvqtYOHfvDkpttRk76Azw==
X-Google-Smtp-Source: ABdhPJyBFtqbsBMjOwblRO0H03xu/g8scU7jOlchUh7vnEWYl8qfHfghYPmfwnZyOBDrW6/uWBZ+yg==
X-Received: by 2002:a17:90a:e541:b0:1c6:55e5:ae4b with SMTP id
 ei1-20020a17090ae54100b001c655e5ae4bmr2304289pjb.62.1647384321142; 
 Tue, 15 Mar 2022 15:45:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 c11-20020a056a000acb00b004f35ee129bbsm143005pfl.140.2022.03.15.15.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:45:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Clean up arg_start/arg_end confusion
Date: Tue, 15 Mar 2022 15:45:19 -0700
Message-Id: <20220315224519.498463-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had two sets of variables: arg_start/arg_end, and
arg_strings/env_strings.  In linuxload.c, we set the
first pair to the bounds of the argv strings, but in
elfload.c, we set the first pair to the bounds of the
argv pointers and the second pair to the bounds of
the argv strings.

Remove arg_start/arg_end, replacing them with the standard
argc/argv/envc/envp values.  Retain arg_strings/env_strings.
Update linuxload.c, elfload.c, and arm-compat-semi.c to match.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/714
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h             | 12 ++++++++----
 linux-user/elfload.c          | 10 ++++++----
 linux-user/linuxload.c        | 18 ++++++++++--------
 linux-user/main.c             |  5 ++---
 semihosting/arm-compat-semi.c |  4 ++--
 5 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 98dfbf2096..3ac39793e1 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -40,15 +40,19 @@ struct image_info {
         abi_ulong       data_offset;
         abi_ulong       saved_auxv;
         abi_ulong       auxv_len;
-        abi_ulong       arg_start;
-        abi_ulong       arg_end;
-        abi_ulong       arg_strings;
-        abi_ulong       env_strings;
+        abi_ulong       argc;
+        abi_ulong       argv;
+        abi_ulong       envc;
+        abi_ulong       envp;
         abi_ulong       file_string;
         uint32_t        elf_flags;
         int             personality;
         abi_ulong       alignment;
 
+        /* Generic semihosting knows about these pointers. */
+        abi_ulong       arg_strings;   /* strings for argv */
+        abi_ulong       env_strings;   /* strings for envp; ends arg_strings */
+
         /* The fields below are used in FDPIC mode.  */
         abi_ulong       loadmap_addr;
         uint16_t        nsegs;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9628a38361..828ac2d8db 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1517,8 +1517,8 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->iaoq[0] = infop->entry;
     regs->iaoq[1] = infop->entry + 4;
     regs->gr[23] = 0;
-    regs->gr[24] = infop->arg_start;
-    regs->gr[25] = (infop->arg_end - infop->arg_start) / sizeof(abi_ulong);
+    regs->gr[24] = infop->argv;
+    regs->gr[25] = infop->argc;
     /* The top-of-stack contains a linkage buffer.  */
     regs->gr[30] = infop->start_stack + 64;
     regs->gr[31] = infop->entry;
@@ -2121,8 +2121,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     u_envp = u_argv + (argc + 1) * n;
     u_auxv = u_envp + (envc + 1) * n;
     info->saved_auxv = u_auxv;
-    info->arg_start = u_argv;
-    info->arg_end = u_argv + argc * n;
+    info->argc = argc;
+    info->envc = envc;
+    info->argv = u_argv;
+    info->envp = u_envp;
 
     /* This is correct because Linux defines
      * elf_addr_t as Elf32_Off / Elf64_Off
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 2ed5fc45ed..eb010b0109 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -92,33 +92,35 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
     envp = sp;
     sp -= (argc + 1) * n;
     argv = sp;
+    ts->info->envp = envp;
+    ts->info->envc = envc;
+    ts->info->argv = argv;
+    ts->info->argc = argc;
+
     if (push_ptr) {
-        /* FIXME - handle put_user() failures */
         sp -= n;
         put_user_ual(envp, sp);
         sp -= n;
         put_user_ual(argv, sp);
     }
+
     sp -= n;
-    /* FIXME - handle put_user() failures */
     put_user_ual(argc, sp);
-    ts->info->arg_start = stringp;
+
+    ts->info->arg_strings = stringp;
     while (argc-- > 0) {
-        /* FIXME - handle put_user() failures */
         put_user_ual(stringp, argv);
         argv += n;
         stringp += target_strlen(stringp) + 1;
     }
-    ts->info->arg_end = stringp;
-    /* FIXME - handle put_user() failures */
     put_user_ual(0, argv);
+
+    ts->info->env_strings = stringp;
     while (envc-- > 0) {
-        /* FIXME - handle put_user() failures */
         put_user_ual(stringp, envp);
         envp += n;
         stringp += target_strlen(stringp) + 1;
     }
-    /* FIXME - handle put_user() failures */
     put_user_ual(0, envp);
 
     return sp;
diff --git a/linux-user/main.c b/linux-user/main.c
index fbc9bcfd5f..8995379aa3 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -869,9 +869,8 @@ int main(int argc, char **argv, char **envp)
         qemu_log("start_stack 0x" TARGET_ABI_FMT_lx "\n", info->start_stack);
         qemu_log("brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
         qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
-        qemu_log("argv_start  0x" TARGET_ABI_FMT_lx "\n", info->arg_start);
-        qemu_log("env_start   0x" TARGET_ABI_FMT_lx "\n",
-                 info->arg_end + (abi_ulong)sizeof(abi_ulong));
+        qemu_log("argv_start  0x" TARGET_ABI_FMT_lx "\n", info->argv);
+        qemu_log("env_start   0x" TARGET_ABI_FMT_lx "\n", info->envp);
         qemu_log("auxv_start  0x" TARGET_ABI_FMT_lx "\n", info->saved_auxv);
     }
 
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7a51fd0737..b6ddaf863a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1106,7 +1106,7 @@ target_ulong do_common_semihosting(CPUState *cs)
 #else
             unsigned int i;
 
-            output_size = ts->info->arg_end - ts->info->arg_start;
+            output_size = ts->info->env_strings - ts->info->arg_strings;
             if (!output_size) {
                 /*
                  * We special-case the "empty command line" case (argc==0).
@@ -1146,7 +1146,7 @@ target_ulong do_common_semihosting(CPUState *cs)
                 goto out;
             }
 
-            if (copy_from_user(output_buffer, ts->info->arg_start,
+            if (copy_from_user(output_buffer, ts->info->arg_strings,
                                output_size)) {
                 errno = EFAULT;
                 status = set_swi_errno(cs, -1);
-- 
2.25.1


