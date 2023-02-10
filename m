Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331F3692B18
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcjY-0007En-Cy; Fri, 10 Feb 2023 18:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj7-0007BN-QM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:45 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj6-000517-7D
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:45 -0500
Received: by mail-il1-x12a.google.com with SMTP id h29so1085144ila.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfM7MPIhx5UEM8aS55+Appk5Bx6FRMOBwHmKVdc0eBg=;
 b=xFvO5sUyqKVtlcpFEXXWOfAKCLETsiOOEryAbdytAvBchVdhbcnB3YrYLGMtdzGDVA
 hk3Q0g96OxKcE9NLzmyKSkTVmHGHgSkzyXPYuk85iQgIsiyB/hP0q8+PhyTBH9srn16X
 knvDnJeLQT4v+PN4OuBBZJXg91VrUePx6Msca//rGjWOLv/ZcnglEuLy05tBkpBEXDDW
 0jZndhWnT2IELd4ndoOEFWd1sCqU6D6AO+jfhn0RQojEFG9bMqKvsPN25iSDILNrUBwf
 z0HWq9rPLqBWx9mjvUCMnou9yx8uDwjIAgLUMeHBK7TgdDmVqGBVnkELnttUnlhFLlny
 WhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfM7MPIhx5UEM8aS55+Appk5Bx6FRMOBwHmKVdc0eBg=;
 b=Yk28DiQNPCEe70X1Lnpw9rAtqbBTcoZI02DnfvxnfEVvB+H6eF1KG58Sgxq3YPkJuQ
 XiZswsucVpWKt4ihcZNMpuq/MKeFP4cJC3YMiid2YDfBDc/4LS4QOSVtzpf+6dzwof+q
 vQPcsaTAzy8jhHeMkmV1eYSXVFlMJjzu0hqN6Ca9ZCdif6+zEh7zHbZOufFJvnQzKyLy
 +T1XsUkfUZVbFnMTryYgnr8l/eHE/sNPC8QquVq17iku1rw7saTxL/ZIW/vUJwX/B+sI
 YID6p4wM4trdAQGKeiFKG7OBHRITIB0j8EjCsoITDEA65RpPVzbRskuObhze0LL26rZ3
 tcLQ==
X-Gm-Message-State: AO0yUKWPUg5ofxrdnY6SIHF5ZOehvijk9s3b5a0hvE07QscAqZD8Pqfs
 rEOdH4iEuGXlkkeTygzVZelU/JHoh0NYLmBE
X-Google-Smtp-Source: AK7set/5Og+q6EyFSso5lThoAEZTztjJHRjzaOykDFUAlDXoOKglM52/Ptzml3rfX/iinq4XTUVqkA==
X-Received: by 2002:a05:6e02:1aac:b0:313:fd3c:6439 with SMTP id
 l12-20020a056e021aac00b00313fd3c6439mr10204478ilv.23.1676071361910; 
 Fri, 10 Feb 2023 15:22:41 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@FreeBSD.org>
Subject: [PATCH 8/9] bsd-user: implement sysctlbyname(2)
Date: Fri, 10 Feb 2023 16:18:28 -0700
Message-Id: <20230210231829.39476-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c     | 58 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 +++
 2 files changed, 62 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 13736936e5f..62c729dfe47 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -345,6 +345,64 @@ out:
     return ret;
 }
 
+/*
+ * This syscall was created to make sysctlbyname(3) more efficient.
+ * Unfortunately, because we have to fake some sysctls, we can't do that.
+ */
+abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
+        int32_t namelen, abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp,
+        abi_ulong newlen)
+{
+    abi_long ret;
+    void *holdp = NULL, *hnewp = NULL;
+    char *snamep;
+    int oid[CTL_MAXNAME + 2];
+    size_t holdlen, oidplen;
+    abi_ulong oldlen = 0;
+
+    if (oldlenp) {
+        if (get_user_ual(oldlen, oldlenp)) {
+            return -TARGET_EFAULT;
+        }
+    }
+    snamep = lock_user_string(namep);
+    if (snamep == NULL) {
+        return -TARGET_EFAULT;
+    }
+    if (newp) {
+        hnewp = lock_user(VERIFY_READ, newp, newlen, 1);
+        if (hnewp == NULL) {
+            return -TARGET_EFAULT;
+        }
+    }
+    if (oldp) {
+        holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0);
+        if (holdp == NULL) {
+            return -TARGET_EFAULT;
+        }
+    }
+    holdlen = oldlen;
+
+    oidplen = sizeof(oid) / sizeof(int);
+    if (sysctlnametomib(snamep, oid, &oidplen) != 0) {
+        return -TARGET_EINVAL;
+    }
+
+    ret = do_freebsd_sysctl_oid(env, oid, oidplen, holdp, &holdlen, hnewp,
+        newlen);
+
+    if (oldlenp) {
+        put_user_ual(holdlen, oldlenp);
+    }
+    unlock_user(snamep, namep, 0);
+    unlock_user(holdp, oldp, holdlen);
+    if (hnewp) {
+        unlock_user(hnewp, newp, 0);
+    }
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
-- 
2.39.1


