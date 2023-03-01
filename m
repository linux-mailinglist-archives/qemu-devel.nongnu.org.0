Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972416A735A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7k-0005ZJ-75; Wed, 01 Mar 2023 13:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7i-0005Xf-NK
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:18 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7h-0006pV-4c
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:18 -0500
Received: by mail-io1-xd2a.google.com with SMTP id v10so5743765iox.8
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izUUSmVMMLad6kw3jAaqzTh4DzadBB2bLLAowF8XXvA=;
 b=Cx4Pm+hQ+2KR5pMe2EXrKniIOU2q0A9yYEuoBdqNkElyrF7bKREJn32gN6lH4A4upi
 5Av7JaWb3F1HdEx9WuEjjNHf8FggEtVP9IIn3hYvWRPaIImQOtaFgQwInh6qRxwS2kqA
 5TbXC8NNanyyqg1paQ/JngH1lPuM0WXt1e5QeAfVrk3hYsO7avzU7Wxz0ji1u+JcCDSK
 CHN77Qr6deyBwfSjJHsmyJ9f98yU2qwNKJ4IRGe9lLp4lfcPlJUgmrOW5F4sWKMKdHL3
 GyX2OHPH3m1CAaxdfFfMJZCB9GHLxDVKhrsWf6zd3QhDJueKA18c2i1pwDbtTaafZWBv
 M52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=izUUSmVMMLad6kw3jAaqzTh4DzadBB2bLLAowF8XXvA=;
 b=Bhzmc+lQDUPTTbltdw/JzQ8zRMeMArwRWD54ONjxofh8YprLjqcuksUImKmT1jIryX
 R/e6GNEzfP3LEKrmPlICyHq0L2Z1nFHUeVY91iu5tWiFelZ82rwbH5cAy+Vc/BlsQzfY
 OSQN2MvS1Zb9BBJJDr2qu4NXLX/IE/mxM20VEwxmgJcs7RVWSD/Z2qDISbLIULLoRrTS
 IDjXQZcv9tXn6tUqmPISjg8TxjGgggkxxg3u+kP+Axrd4PfLBwsXms8bBcdcwh3zL3u2
 n9+s77Tc1I5dERoSFGmkdek1asP6fGT8UjdlG/0FWbFV7rdADRI2JuRPPh1eFgwdwalk
 PpEQ==
X-Gm-Message-State: AO0yUKWLl5vKSPbExpLh+x6HSmr3NfN0Rai8+SauIPzmnzXj0wUzoT6A
 hMEnXqzjm51AmyH3CaoK4nAYbvgA391RLbc/
X-Google-Smtp-Source: AK7set//HoG/rzR6f39nmr8PpbuSH7YwchLIwPbdfb5TaIE97JtrA6HQTs/JQUwHHFGtOHg2HH1oXA==
X-Received: by 2002:a05:6602:22c5:b0:74c:8b1c:239c with SMTP id
 e5-20020a05660222c500b0074c8b1c239cmr4472109ioe.10.1677695055613; 
 Wed, 01 Mar 2023 10:24:15 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:15 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 10/10] bsd-user: implement sysctlbyname(2)
Date: Wed,  1 Mar 2023 11:23:53 -0700
Message-Id: <20230301182353.21559-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kyle Evans <kevans@FreeBSD.org>

do_freebsd_sysctlbyname needs to translate the 'name' back down to a OID
so we can intercept the special ones. Do that and call the common wrapper
do_freebsd_sysctl_oid.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c     | 67 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 +++
 bsd-user/qemu.h               |  3 ++
 3 files changed, 74 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 646b8e3f74d..df317065587 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -471,6 +471,73 @@ out:
     return ret;
 }
 
+/*
+ * This syscall was created to make sysctlbyname(3) more efficient, but we can't
+ * really provide it in bsd-user.  Notably, we must always translate the names
+ * independently since some sysctl values have to be faked for the target
+ * environment, so it still has to break down to two syscalls for the underlying
+ * implementation.
+ */
+abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
+        int32_t namelen, abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp,
+        abi_ulong newlen)
+{
+    abi_long ret = -TARGET_EFAULT;
+    void *holdp = NULL, *hnewp = NULL;
+    char *snamep = NULL;
+    int oid[CTL_MAXNAME + 2];
+    size_t holdlen, oidplen;
+    abi_ulong oldlen = 0;
+
+    /* oldlenp is read/write, pre-check here for write */
+    if (oldlenp) {
+        if (!access_ok(VERIFY_WRITE, oldlenp, sizeof(abi_ulong)) ||
+            get_user_ual(oldlen, oldlenp)) {
+            goto out;
+        }
+    }
+    snamep = lock_user_string(namep);
+    if (snamep == NULL) {
+        goto out;
+    }
+    if (newp) {
+        hnewp = lock_user(VERIFY_READ, newp, newlen, 1);
+        if (hnewp == NULL) {
+            goto out;
+        }
+    }
+    if (oldp) {
+        holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0);
+        if (holdp == NULL) {
+            goto out;
+        }
+    }
+    holdlen = oldlen;
+
+    oidplen = ARRAY_SIZE(oid);
+    if (sysctlnametomib(snamep, oid, &oidplen) != 0) {
+        ret = -TARGET_EINVAL;
+        goto out;
+    }
+
+    ret = do_freebsd_sysctl_oid(env, oid, oidplen, holdp, &holdlen, hnewp,
+        newlen);
+
+    /*
+     * writeability pre-checked above. __sysctl(2) returns ENOMEM and updates
+     * oldlenp for the proper size to use.
+     */
+    if (oldlenp && (ret == 0 || ret == -TARGET_ENOMEM)) {
+        put_user_ual(holdlen, oldlenp);
+    }
+out:
+    unlock_user(snamep, namep, 0);
+    unlock_user(holdp, oldp, ret == 0 ? holdlen : 0);
+    unlock_user(hnewp, newp, 0);
+
+    return ret;
+}
+
 abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
         abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
 {
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 20ab3d4d9a1..179a20c304b 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -498,6 +498,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_freebsd_sysctl(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
         break;
 
+    case TARGET_FREEBSD_NR___sysctlbyname: /* sysctlbyname(2) */
+        ret = do_freebsd_sysctlbyname(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
     case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
         ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
         break;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 208772d4ed6..41d84e0b81b 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -255,6 +255,9 @@ int host_to_target_errno(int err);
 /* os-sys.c */
 abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
         abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
+abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
+        int32_t namelen, abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp,
+        abi_ulong newlen);
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
 
 /* user access */
-- 
2.39.1


