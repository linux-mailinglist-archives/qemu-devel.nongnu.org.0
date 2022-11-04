Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A513619EE8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0d2-0000X3-CQ; Fri, 04 Nov 2022 13:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cr-0000QJ-Mc
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:37:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0cp-0003we-Qq
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:37:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a14so8029148wru.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQYxV3PJZu2Jr0ktEDFDlqlPTXyHP+yOYwY1EEXlXv0=;
 b=ec7kzmQR+B8Z/PKE7Z6Hy/nquPiUIrZMgL+G04C2ABvi82mVwtKoU5VArrrlMehDEu
 tIBxcC8tNRL/k+a5irQE6oGl2XdTqccDeOs8ryGAEEgn8+F4medLoFCcXYp5sbFcgsUf
 lcx+i1Zx4ZPEwYSKg3+0HOULUV2LB+qRo0YKMYTMfm8o8ks3hCVC8IJdkObF15Kwp3KR
 9Ix+VCLbNYy4/HBE4oWnTPkwSqYemQcIZpjzhQpKuNvRQd0iLzZiZR6Szi0DCcs6k/Hp
 lPmbY0Fk3C0Ix9M6oa7uoY5LdQcb9zajLnIkL3O5p3C2dP5Rhcuh/sT2u6YHJZ6+IA+D
 fdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQYxV3PJZu2Jr0ktEDFDlqlPTXyHP+yOYwY1EEXlXv0=;
 b=1DyUy4aYGAG3RmC+qeORbZZOK9Fk7OvAygqt3kABFWfKzLYV2FKPVOFyv6BSG1pKEj
 6+mvSFojnZhua8qNqN0enfHAbrCaM5Kit4CDQTHT/am8capstQ0qfT6EeVdBAyl/IUfI
 5DL8s2K93zu+CMixyUnu7pBBjtrQj+q6ktegGclNm0aV79MVQD06MMf7WmELi/O/X1+g
 SRqIiDfwDtghK7ZG8a9tYLDKKwjwUl+TBJmc0GrHoNOnlwXafLkBJUr8JHFG6ulfZ2Zk
 SrNJvQcs2+d7MknrNx1gZdvbwQyJDGfXUOGimPp3fGuVmI5c5BARNNEq2ibmJSDI68nw
 R9hw==
X-Gm-Message-State: ACrzQf0s3y1BpkAHa3SUJU+ox5mEJDb3Cf6NV4v8Wg2hcrkPsNnEyRBj
 9B0Wq2gksMP1UpS5hjf6QdW4x20wfwUz5g==
X-Google-Smtp-Source: AMsMyM7bEAiRlx+5mjVaaC7/Sk2eq/9Om0tkovFCVLFtX3yBeanSWL5UG7aiqx7TXHlIQ6vFoRidKg==
X-Received: by 2002:a05:6000:609:b0:236:8fa3:9028 with SMTP id
 bn9-20020a056000060900b002368fa39028mr22917848wrb.133.1667583421013; 
 Fri, 04 Nov 2022 10:37:01 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c089600b003c6bbe910fdsm3999636wmp.9.2022.11.04.10.37.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 10:37:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 5/5] linux-user/syscall: Implement execveat()
Date: Fri,  4 Nov 2022 18:36:32 +0100
Message-Id: <20221104173632.1052-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104173632.1052-1-philmd@linaro.org>
References: <20221104173632.1052-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Drew DeVault <sir@cmpwn.com>

References: https://gitlab.com/qemu-project/qemu/-/issues/1007
Signed-off-by: Drew DeVault <sir@cmpwn.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221104081015.706009-1-sir@cmpwn.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c3ac6bb4d2..c267db9542 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -696,7 +696,8 @@ safe_syscall4(pid_t, wait4, pid_t, pid, int *, status, int, options, \
 #endif
 safe_syscall5(int, waitid, idtype_t, idtype, id_t, id, siginfo_t *, infop, \
               int, options, struct rusage *, rusage)
-safe_syscall3(int, execve, const char *, filename, char **, argv, char **, envp)
+safe_syscall5(int, execveat, int, dirfd, const char *, filename,
+              char **, argv, char **, envp, int, flags)
 #if defined(TARGET_NR_select) || defined(TARGET_NR__newselect) || \
     defined(TARGET_NR_pselect6) || defined(TARGET_NR_pselect6_time64)
 safe_syscall6(int, pselect6, int, nfds, fd_set *, readfds, fd_set *, writefds, \
@@ -8357,9 +8358,9 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     return safe_openat(dirfd, path(pathname), flags, mode);
 }
 
-static int do_execve(CPUArchState *cpu_env,
+static int do_execveat(CPUArchState *cpu_env, int dirfd,
                        abi_long pathname, abi_long guest_argp,
-                       abi_long guest_envp)
+                       abi_long guest_envp, int flags)
 {
     int ret;
     char **argp, **envp;
@@ -8439,9 +8440,9 @@ static int do_execve(CPUArchState *cpu_env,
     }
 
     if (is_proc_myself(p, "exe")) {
-        ret = get_errno(safe_execve(exec_path, argp, envp));
+        ret = get_errno(safe_execveat(dirfd, exec_path, argp, envp, flags));
     } else {
-        ret = get_errno(safe_execve(p, argp, envp));
+        ret = get_errno(safe_execveat(dirfd, p, argp, envp, flags));
     }
 
     unlock_user(p, pathname, 0);
@@ -8979,8 +8980,10 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+    case TARGET_NR_execveat:
+        return do_execveat(cpu_env, arg1, arg2, arg3, arg4, arg5);
     case TARGET_NR_execve:
-        return do_execve(cpu_env, arg1, arg2, arg3);
+        return do_execveat(cpu_env, AT_FDCWD, arg1, arg2, arg3, 0);
     case TARGET_NR_chdir:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-- 
2.38.1


