Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA956A735E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7j-0005Xn-GJ; Wed, 01 Mar 2023 13:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7i-0005XP-0x
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:18 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7g-0006pN-BU
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:17 -0500
Received: by mail-io1-xd32.google.com with SMTP id k17so514188iob.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVAFST4RrlFu4AcDhd5jEFTFoa+9vwKukHM5XKdcLo8=;
 b=ylSv5wMM3dTGykMhi2mJFs3RrAAtZZC4Hgkp9GkbUsCOJ053BuZryogyDsUanMeUbH
 SCXxNV8ZSU5K9Q2yArGhIZAMVNQealFwfRxDUiXRUjYWqUqsmMlffWEKlD8G81wJb5cp
 +D3paO4qBqADSHpWMhNAuEjVuKehEaMk/OHRXa/9Nb04iWIt0qoetoohKg+mTJRZ4cfy
 EExhMzu2UjAJD4B912l3jo7K52WiDdEEZl0XozUCJ8toxYZh9G18Aw5Aa4Ox4ydZ8gXz
 xUqQD+7WPRrGMtXQFAMnFFNHwD1zy2rt1IbMpW9vcmXe4h6J44UhzAhewiy/NChBgEwa
 4Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVAFST4RrlFu4AcDhd5jEFTFoa+9vwKukHM5XKdcLo8=;
 b=R3HupwoATEiLB20YIiDAN6hssc1U9RCCOxKje+puGf9XLNQ3gppgs+sL3+tBW19ZMg
 h0QvSMOHPg+rTv/WlrjVDAb1/Lpp6D3Sy3EtJJ0FeZO5IJ3cS7fjT08r/+YxsHzPKSB8
 w/IHxhURJHL1afBRkrc9TmIaIvLgv0Zy+UVEbABRMegjpdj5nQluDEZcV1qr8810vygh
 5N3ldzZtTp24tWfWL+Ah1h5y+UZ2sQHiSP+2J9kRD1IVOsTGMX1/omnKNggSGvF0huiW
 jdiygoZQxuREmkCe8fg6BgqZs564kPH0AGAbgT40CL7gSgTTn+iSm508sudNnt6wwSL7
 e1Ng==
X-Gm-Message-State: AO0yUKXRLvB0Y+dyrZvd3lTbPr3xInFtSZTQsrqZicUtwSqto9QRIcH1
 diqrD9vZvdwWcPxxWCO6zKnQyu1c6JCM7zy6
X-Google-Smtp-Source: AK7set+tx7cbdADFT2GGg9ERMz7Ahrd+6xSqFBVkXJ6IUslb+PDuJM5t0ivF79cr6hxCXEPX3W2yhw==
X-Received: by 2002:a6b:ed16:0:b0:74c:91c7:8794 with SMTP id
 n22-20020a6bed16000000b0074c91c78794mr4462610iog.21.1677695054732; 
 Wed, 01 Mar 2023 10:24:14 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 09/10] bsd-user: do_freebsd_sysctl helper for sysctl(2)
Date: Wed,  1 Mar 2023 11:23:52 -0700
Message-Id: <20230301182353.21559-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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

Implement the wrapper function for sysctl(2). This puts the oid
arguments into a standard form and calls the common
do_freebsd_sysctl_oid.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Co-Authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c     | 56 ++++++++++++++++++++++++++++++++++-
 bsd-user/freebsd/os-syscall.c |  4 +++
 bsd-user/qemu.h               |  2 ++
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 6c9c2f8fd0b..646b8e3f74d 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -248,7 +248,7 @@ static inline void sysctl_oidfmt(uint32_t *holdp)
     holdp[0] = tswap32(holdp[0]);
 }
 
-static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
+static abi_long do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
         int32_t namelen, void *holdp, size_t *holdlenp, void *hnewp,
         size_t newlen)
 {
@@ -471,6 +471,60 @@ out:
     return ret;
 }
 
+abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
+        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
+{
+    abi_long ret = -TARGET_EFAULT;
+    void *hnamep, *holdp = NULL, *hnewp = NULL;
+    size_t holdlen;
+    abi_ulong oldlen = 0;
+    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
+
+    /* oldlenp is read/write, pre-check here for write */
+    if (oldlenp) {
+        if (!access_ok(VERIFY_WRITE, oldlenp, sizeof(abi_ulong)) ||
+            get_user_ual(oldlen, oldlenp)) {
+            goto out;
+        }
+    }
+    hnamep = lock_user(VERIFY_READ, namep, namelen, 1);
+    if (hnamep == NULL) {
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
+    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++, q++) {
+        *q = tswap32(*p);
+    }
+
+    ret = do_freebsd_sysctl_oid(env, snamep, namelen, holdp, &holdlen, hnewp,
+        newlen);
+
+    /*
+     * writeability pre-checked above. __sysctl(2) returns ENOMEM and updates
+     * oldlenp for the proper size to use.
+     */
+    if (oldlenp && (ret == 0 || ret == -TARGET_ENOMEM)) {
+        put_user_ual(holdlen, oldlenp);
+    }
+    unlock_user(hnamep, namep, 0);
+    unlock_user(holdp, oldp, ret == 0 ? holdlen : 0);
+out:
+    g_free(snamep);
+    return ret;
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index e00997a818c..20ab3d4d9a1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -494,6 +494,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         /*
          * sys{ctl, arch, call}
          */
+    case TARGET_FREEBSD_NR___sysctl: /* sysctl(3) */
+        ret = do_freebsd_sysctl(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
     case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
         ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
         break;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4e7b8b1c06a..208772d4ed6 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -253,6 +253,8 @@ bool is_error(abi_long ret);
 int host_to_target_errno(int err);
 
 /* os-sys.c */
+abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
+        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
 
 /* user access */
-- 
2.39.1


