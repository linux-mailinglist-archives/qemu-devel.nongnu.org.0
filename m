Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E504030C3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:14:14 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjM5-00036E-RN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2o-0006aS-1i
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:18 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2a-00011Z-Rj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:17 -0400
Received: by mail-il1-x144.google.com with SMTP id x5so176058ill.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8wFbjVq5zO3wyTMiSXNG8FjHa8BNCmoaasDs0yUEaU=;
 b=dVteRuzK7BSDEP380Zyn80IMqXkq0WgTqGt/SYiGJwwAxDzCfoBzpw2VV9UwNO2sRd
 vthkENxPdPw9jmY3e6XfZyJEppEM8LcD65J77Dnb2JcuENIlGWoMS8R05q0V05WddPrs
 bMyjR7xVvW3wH6fMijPAauruzCOlMbxdxUvF3i9cFDL6xlVGfA1LCqE8lojvD62IoQBH
 8nlqTdkFRByFSQEFQB6n9aZr/qZXf+U78dHndfp6xzG09j9vQbhJ5zUF9381ia+OduBp
 21tAZ6t5HJ4lz4OQoOgKW/xdxkATxAK1ZpTQwfI9F5bXCzglMPFUH8z9/HM8VLiTPlBr
 ymJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8wFbjVq5zO3wyTMiSXNG8FjHa8BNCmoaasDs0yUEaU=;
 b=Y00VOOmTNUJFAy9MYL9qOy/xfRifMKn0FnR4WB4KFLY9/gm9UNIzdzAxgoKHjd9Vhj
 Xq7JfYzVd+B9KrVEs0QwKZCF4fnFxp39GPIcKq1w4RUClTVWG03ucrtLphuYHwFyJGvn
 ucegMZjxPuUN8PVi2tjEG1uLlEHdDXRg3F1eo8UEWBmbA/5JisqPkLc8Un7hD9kugh27
 FFKG2jtfhqQv9M4FsV+zmXpRlTB7FlSR7ac7ir9qXXn2i1f//TJ621LlKCWl92U4JUtA
 QglW+aCVqVwqkFyQFO0wdYOrSGNOsv0drA2nGG0VQvLyR2Xbhx/iJKN/Y8J4zDvxs+F3
 whCQ==
X-Gm-Message-State: AOAM533slV9QnWm2HU6Lc8UEhAdxqNPo/bULTUrenEAw7lvZSfdXB4Uz
 Go8kfglRYQMLukCbns7abqdQCuzcCXcR1h7y460=
X-Google-Smtp-Source: ABdhPJxfKaPnNIXVgs3tSWlvoS5+EfuyLb5BDgPAOgIb/6MC91F1TTnYHwYUJBo+7hzJk5iaVWE5nQ==
X-Received: by 2002:a05:6e02:2163:: with SMTP id
 s3mr322477ilv.172.1631051643458; 
 Tue, 07 Sep 2021 14:54:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:03 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 28/42] bsd-user: Move stack initializtion into a per-os file.
Date: Tue,  7 Sep 2021 15:53:18 -0600
Message-Id: <20210907215332.30737-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::144;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x144.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Move all of the stack initialization into target_os_stack.h. Each BSD
sets up processes a little differently.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_stack.h | 181 +++++++++++++++++++++++++++++
 bsd-user/netbsd/target_os_stack.h  |  56 +++++++++
 bsd-user/openbsd/target_os_stack.h |  56 +++++++++
 3 files changed, 293 insertions(+)
 create mode 100644 bsd-user/freebsd/target_os_stack.h
 create mode 100644 bsd-user/netbsd/target_os_stack.h
 create mode 100644 bsd-user/openbsd/target_os_stack.h

diff --git a/bsd-user/freebsd/target_os_stack.h b/bsd-user/freebsd/target_os_stack.h
new file mode 100644
index 0000000000..1bb1a2bf56
--- /dev/null
+++ b/bsd-user/freebsd/target_os_stack.h
@@ -0,0 +1,181 @@
+/*
+ *  FreeBSD setup_initial_stack() implementation.
+ *
+ *  Copyright (c) 2013-14 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_OS_STACK_H_
+#define _TARGET_OS_STACK_H_
+
+#include <sys/param.h>
+#include "target_arch_sigtramp.h"
+#include "qemu/guest-random.h"
+
+/*
+ * The inital FreeBSD stack is as follows:
+ * (see kern/kern_exec.c exec_copyout_strings() )
+ *
+ *  Hi Address -> char **ps_argvstr  (struct ps_strings for ps, w, etc.)
+ *                unsigned ps_nargvstr
+ *                char **ps_envstr
+ *  PS_STRINGS -> unsigned ps_nenvstr
+ *
+ *                machine dependent sigcode (sv_sigcode of size
+ *                                           sv_szsigcode)
+ *
+ *                execpath          (absolute image path for rtld)
+ *
+ *                SSP Canary        (sizeof(long) * 8)
+ *
+ *                page sizes array  (usually sizeof(u_long) )
+ *
+ *  "destp" ->    argv, env strings (up to 262144 bytes)
+ */
+static inline int setup_initial_stack(struct bsd_binprm *bprm,
+        abi_ulong *ret_addr, abi_ulong *stringp)
+{
+    int i;
+    abi_ulong stack_hi_addr;
+    size_t execpath_len, stringspace;
+    abi_ulong destp, argvp, envp, p;
+    struct target_ps_strings ps_strs;
+    char canary[sizeof(abi_long) * 8];
+
+    stack_hi_addr = p = target_stkbas + target_stksiz;
+
+    /* Save some space for ps_strings. */
+    p -= sizeof(struct target_ps_strings);
+
+    /* Add machine depedent sigcode. */
+    p -= TARGET_SZSIGCODE;
+    if (setup_sigtramp(p, (unsigned)offsetof(struct target_sigframe, sf_uc),
+            TARGET_FREEBSD_NR_sigreturn)) {
+        errno = EFAULT;
+        return -1;
+    }
+    if (bprm->fullpath) {
+        execpath_len = strlen(bprm->fullpath) + 1;
+        p -= roundup(execpath_len, sizeof(abi_ulong));
+        if (memcpy_to_target(p, bprm->fullpath, execpath_len)) {
+            errno = EFAULT;
+            return -1;
+        }
+    }
+    /* Add canary for SSP. */
+    qemu_guest_getrandom_nofail(canary, sizeof(canary));
+    p -= roundup(sizeof(canary), sizeof(abi_ulong));
+    if (memcpy_to_target(p, canary, sizeof(canary))) {
+        errno = EFAULT;
+        return -1;
+    }
+    /* Add page sizes array. */
+    p -= sizeof(abi_ulong);
+    if (put_user_ual(TARGET_PAGE_SIZE, p)) {
+        errno = EFAULT;
+        return -1;
+    }
+    /*
+     * Deviate from FreeBSD stack layout: force stack to new page here
+     * so that signal trampoline is not sharing the page with user stack
+     * frames. This is actively harmful in qemu as it marks pages with
+     * code it translated as read-only, which is somewhat problematic
+     * for user trying to use the stack as intended.
+     */
+    p = rounddown(p, TARGET_PAGE_SIZE);
+
+    /* Calculate the string space needed */
+    stringspace = 0;
+    for (i = 0; i < bprm->argc; ++i) {
+        stringspace += strlen(bprm->argv[i]) + 1;
+    }
+    for (i = 0; i < bprm->envc; ++i) {
+        stringspace += strlen(bprm->envp[i]) + 1;
+    }
+    if (stringspace > TARGET_ARG_MAX) {
+        errno = ENOMEM;
+        return -1;
+    }
+    /* Make room for the argv and envp strings */
+    destp = rounddown(p - stringspace, sizeof(abi_ulong));
+    p = argvp = destp - (bprm->argc + bprm->envc + 2) * sizeof(abi_ulong);
+    /* Remember the strings pointer */
+    if (stringp) {
+        *stringp = destp;
+    }
+    /*
+     * Add argv strings.  Note that the argv[] vectors are added by
+     * loader_build_argptr()
+     */
+    /* XXX need to make room for auxargs */
+    ps_strs.ps_argvstr = tswapl(argvp);
+    ps_strs.ps_nargvstr = tswap32(bprm->argc);
+    for (i = 0; i < bprm->argc; ++i) {
+        size_t len = strlen(bprm->argv[i]) + 1;
+
+        if (memcpy_to_target(destp, bprm->argv[i], len)) {
+            errno = EFAULT;
+            return -1;
+        }
+        if (put_user_ual(destp, argvp)) {
+            errno = EFAULT;
+            return -1;
+        }
+        argvp += sizeof(abi_ulong);
+        destp += len;
+    }
+    if (put_user_ual(0, argvp)) {
+        errno = EFAULT;
+        return -1;
+    }
+    /*
+     * Add env strings. Note that the envp[] vectors are added by
+     * loader_build_argptr().
+     */
+    envp = argvp + sizeof(abi_ulong);
+    ps_strs.ps_envstr = tswapl(envp);
+    ps_strs.ps_nenvstr = tswap32(bprm->envc);
+    for (i = 0; i < bprm->envc; ++i) {
+        size_t len = strlen(bprm->envp[i]) + 1;
+
+        if (memcpy_to_target(destp, bprm->envp[i], len)) {
+            errno = EFAULT;
+            return -1;
+        }
+        if (put_user_ual(destp, envp)) {
+            errno = EFAULT;
+            return -1;
+        }
+        envp += sizeof(abi_ulong);
+        destp += len;
+    }
+    if (put_user_ual(0, envp)) {
+        errno = EFAULT;
+        return -1;
+    }
+    if (memcpy_to_target(stack_hi_addr - sizeof(ps_strs), &ps_strs,
+                sizeof(ps_strs))) {
+        errno = EFAULT;
+        return -1;
+    }
+
+    if (ret_addr) {
+        *ret_addr = p;
+    }
+
+    return 0;
+ }
+
+#endif /* !_TARGET_OS_STACK_H_ */
diff --git a/bsd-user/netbsd/target_os_stack.h b/bsd-user/netbsd/target_os_stack.h
new file mode 100644
index 0000000000..503279c1a9
--- /dev/null
+++ b/bsd-user/netbsd/target_os_stack.h
@@ -0,0 +1,56 @@
+/*
+ *  NetBSD setup_initial_stack() implementation.
+ *
+ *  Copyright (c) 2013-14 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_OS_STACK_H_
+#define _TARGET_OS_STACK_H_
+
+#include "target_arch_sigtramp.h"
+
+static inline int setup_initial_stack(struct bsd_binprm *bprm, abi_ulong *p,
+    abi_ulong *stringp)
+{
+    int i;
+    abi_ulong stack_base;
+
+    stack_base = (target_stkbas + target_stksiz) -
+                  MAX_ARG_PAGES * TARGET_PAGE_SIZE;
+    if (p) {
+        *p = stack_base;
+    }
+    if (stringp) {
+        *stringp = stack_base;
+    }
+
+    for (i = 0; i < MAX_ARG_PAGES; i++) {
+        if (bprm->page[i]) {
+            info->rss++;
+            if (!memcpy_to_target(stack_base, bprm->page[i],
+                        TARGET_PAGE_SIZE)) {
+                errno = EFAULT;
+                return -1;
+            }
+            g_free(bprm->page[i]);
+        }
+        stack_base += TARGET_PAGE_SIZE;
+    }
+
+    return 0;
+}
+
+#endif /* !_TARGET_OS_STACK_H_ */
diff --git a/bsd-user/openbsd/target_os_stack.h b/bsd-user/openbsd/target_os_stack.h
new file mode 100644
index 0000000000..4b37955d3b
--- /dev/null
+++ b/bsd-user/openbsd/target_os_stack.h
@@ -0,0 +1,56 @@
+/*
+ *  OpenBSD setup_initial_stack() implementation.
+ *
+ *  Copyright (c) 2013-14 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_OS_STACK_H_
+#define _TARGET_OS_STACK_H_
+
+#include "target_arch_sigtramp.h"
+
+static inline int setup_initial_stack(struct bsd_binprm *bprm, abi_ulong *p,
+    abi_ulong *stringp)
+{
+    int i;
+    abi_ulong stack_base;
+
+    stack_base = (target_stkbas + target_stksiz) -
+                  MAX_ARG_PAGES * TARGET_PAGE_SIZE;
+    if (p) {
+        *p = stack_base;
+    }
+    if (stringp) {
+        *stringp = stack_base;
+    }
+
+    for (i = 0; i < MAX_ARG_PAGES; i++) {
+        if (bprm->page[i]) {
+            info->rss++;
+            if (!memcpy_to_target(stack_base, bprm->page[i],
+                        TARGET_PAGE_SIZE)) {
+                errno = EFAULT;
+                return -1;
+            }
+            g_free(bprm->page[i]);
+        }
+        stack_base += TARGET_PAGE_SIZE;
+    }
+
+    return 0;
+}
+
+#endif /* !_TARGET_OS_STACK_H_ */
-- 
2.32.0


