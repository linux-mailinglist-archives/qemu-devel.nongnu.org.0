Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D181E69A26E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlT-00009l-GW; Thu, 16 Feb 2023 18:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlR-00008h-42
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:09 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlP-0008Qw-EA
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:08 -0500
Received: by mail-il1-x12d.google.com with SMTP id g14so1412788ild.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzF5n/1/KVwLC31ZXtP5Hy3esjXH+09jTaZZtYxZEo4=;
 b=IrTPshsT3+9BU58xGEDEA10k66GUqKBeRVGZHn60DURMU04Z/wykdJVZ3goJn3Qwjy
 6o89UuRoe3FAgHIyTqKcTSVlcAqvgmCkZv+6ttlCjzulm6aMGtBURR8LGSHBqMBy/f2A
 0uXzstd2iD9eTBpSuCwwFtej8Y5XhEWxgbPXeFPosSRbMbhkDk1IMiRQQnAI8eW51pRL
 QTT/yDggS4/OjnDqcDamZCsR1VIYdrKA8Z89WvnLV1GGiopihIM16Pxn8gLKZ+B0UJJp
 vaCYxtDwZNR2GMqiQNgSef+nz3rX5XrCujul+XgrZOi6YxSOnqyl4lPRhIEPqlOVU0wC
 ZXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BzF5n/1/KVwLC31ZXtP5Hy3esjXH+09jTaZZtYxZEo4=;
 b=ofTZ3G7qgTQmr4a5fGx9T05YVcg5WMZpyTQNksCjwaWfy6bkvypXPoqnI6C/WHADGc
 4iiq9SqfYEZe+yuRTgp02pgQz65ZjTsLZIC8rZekiQwmKYUVeFGOHiTzVRxkDKAKzoUe
 Ka3JUkGYJlf9btz6OxtAkW109DkSIN8dzoNuVkalOoFrTy/A1DYI2JcYQpCklLsbcY1n
 8VvFHBUgGbyrHN4YloCBR3THh2O7ekuartVzi70z9/AKUv8bnkAeG1FlUQ2x7l3zfUaz
 Rq5ae73MRtrbA2fOwTIZBytUBEL37wXmgqy8zLSl3nHsVNO5lmWuP1KXWHiKEjmOE6pn
 6NRA==
X-Gm-Message-State: AO0yUKVuDo9qtwA8Gu56Tn1g50KfRdkp9FGYFbBXoU8BrS3mvxidKtPq
 z8f6cXzBrTlJcRN8EgsAQpPdHkXHx7AVQYAh
X-Google-Smtp-Source: AK7set/uPg3BZBoXrx4Tq1aSn8GGHDLyGEEi50Zdd7g81durcAzjDPtvJkSyRBbUmN2nwXMHYhFsfQ==
X-Received: by 2002:a05:6e02:1c4c:b0:315:4350:9c09 with SMTP id
 d12-20020a056e021c4c00b0031543509c09mr7755952ilg.16.1676590446334; 
 Thu, 16 Feb 2023 15:34:06 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:34:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH v3 11/11] bsd-user: implement sysctlbyname(2)
Date: Thu, 16 Feb 2023 16:33:53 -0700
Message-Id: <20230216233353.13944-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
index f07ae7da740..d9386d3e7ef 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -472,6 +472,73 @@ out:
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


