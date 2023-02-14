Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D09695560
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:30:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjBL-0007U9-7J; Mon, 13 Feb 2023 19:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB9-0007Rz-Qu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:16 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB7-00060k-TH
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:15 -0500
Received: by mail-il1-x133.google.com with SMTP id u8so5819403ilq.13
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dwPHE1FXflVhMkzlH4zIuKp10+3mi6EDvmobdXFkcL8=;
 b=MZmZMX/bhHIxgNojzAjOAFViaG7RPva/b4DhO3XUpuLq405B8qyiARThlQZGjp7D/Z
 c2QIlfoT0DTILwJL9I4dRAdokWHkgbiDD+njjgeFl0G10SlHEixTS00wMBf4FKcb6Km5
 8fDy38siV9dLWLLJ/ag/bd07etgjRlrSobWZCtZqv02JMsmYQxTAyPbzfmPesEXmQszK
 Uy5wxGqJG5Supw/1ynANGBTle0aepCjjBVkIzZ3S/k4MA5BnRGvh83KWyfrIiobVHb5/
 VGe04F9GHX0fi3tUOzUaRaNReRW5OTygMCYJMGbTuVSmacKT/2M23aRcEq5wZwoiqVPt
 dbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dwPHE1FXflVhMkzlH4zIuKp10+3mi6EDvmobdXFkcL8=;
 b=L5My+l6xfDRySl/v1DNtd17ekihC1idZc1MX1iGsoqJBhsfhq/gjV5HuNIW8kUR+lr
 qsCHUwstJXqx2uAE1GHJMCHH2J1BQFeVyQeiAAw51jLUt0vxbLrCP6uBJfKTk0x/y1Cu
 8zDbJ7lkzqEmmiN+/OEqViVJsn64RvEqZ8QvpBWuy01MIVieSrHC4RIIo++oCS20mGVq
 b9BaqOIiltAJQfjJliMjXSOjq5KkjlO4mxf8EDZdIunGZJhTYqDyzRIXmOfUWbkXy4Oc
 rCMrSvErm4D3tNlHDnQGKS+kfljMc2ZpOAHdfwX/2YzjEsqYCAU+UJooOBYoBUKyFb6D
 v0AA==
X-Gm-Message-State: AO0yUKUQU81vOUM6b4X4438J/0c+c1S48EVvcEVe36XbsD7gE+xMtAxS
 G7EKnFdQNQf7A/+9VqvbMi75AwdLXOMqg6vq
X-Google-Smtp-Source: AK7set+28Hn/7XQevFVLps3N6+KJPLSnqJeifeXaxXEaa8RweQxClAJvGfHROc6RsIE5Ex7ZyJRS7g==
X-Received: by 2002:a05:6e02:2147:b0:30f:36c4:8c6b with SMTP id
 d7-20020a056e02214700b0030f36c48c6bmr762918ilv.6.1676334492369; 
 Mon, 13 Feb 2023 16:28:12 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:11 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v2 11/12] bsd-user: implement sysctlbyname(2)
Date: Mon, 13 Feb 2023 17:27:56 -0700
Message-Id: <20230214002757.99240-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
---
 bsd-user/freebsd/os-sys.c     | 67 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 +++
 bsd-user/qemu.h               |  3 ++
 3 files changed, 74 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index e70f8f21c52..33720ddbb38 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -481,6 +481,73 @@ out:
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
+    oidplen = sizeof(oid) / sizeof(int);
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
index c7248cfde6f..e24a8cfcfb1 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -254,6 +254,9 @@ int host_to_target_errno(int err);
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


