Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E441F695554
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjBG-0007S0-Lz; Mon, 13 Feb 2023 19:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB8-0007Rg-6Q
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:14 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjB6-00060S-Iu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:13 -0500
Received: by mail-il1-x134.google.com with SMTP id a5so5835941ilk.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xPed9Hmei9C8C938impO73nLqRfwKXEcgeKH5shVNaI=;
 b=GNW7CnJncjsDQCR858RWB0rF5qJy594MfcCTeZ4mGG0HLL/S+4d2G9tzvttVTrNfQo
 oXHN/MWfRNXpB/0dTft019ZvLQoOIBaB2oQ357vu4kPeBe26vHiw/B1JICdJeFq48lvM
 Pr3dBUYv1bgMbg60Q1kBlf38UZJ7W8uEM4d/FQPRg9/EqY9Jmg/EKw6caMwJJHwp8X0o
 Cf9ZKUU/a7X+W07Suv14TbetHte8pznIBJkU6OX5PIRry/Nr5RNDPZAPz8Zgo0FsWYHE
 ECh2o9KU8K+jkbHEoaMCgJDP1cpBGpEShZTyzhKQUWeZKeowwgDhmvOpZPyUUTx6N0Vl
 iBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xPed9Hmei9C8C938impO73nLqRfwKXEcgeKH5shVNaI=;
 b=pqjAriutkDf9zgRvuwIGWK4EctT7cU0Y3zFYbvPqFKUC/Hwhv0FEHm9xN/sBAIHmQx
 4P+HgEVzHpxZI/u7+ednnC8VhxJmPaCU5S2j3KgnWOsTj6t3/Y9YGkqf7y7bjd2sMLyI
 sX1sLkynb1TjS84ds0V6EzuN1w4dMHMNEIq6zSAyQiyJysJEbfhG0bM2MUe3wPRLdloI
 XGhoL25cYUUI/7MwlCbJIrXmwJp3eyjMxxb9JUATcQSC+JstTl0xWkTArKMl+BGeDJP3
 O3OdgE3QVija1/d6XpVDmkW46943D31991rkAT2+X9gMmtPWmdSfzkpB3zfVIVtD20t6
 T3fg==
X-Gm-Message-State: AO0yUKU+j6hsHN5rE5gRoKq0XrRtWv6htDDkq0ybYHb9QCeucumoXpKx
 hnBkta6xSeMrY0jk1TQdP2ALN8qFYdDzW4D4
X-Google-Smtp-Source: AK7set/KX04VEi5Ywe9hBYIDgXCXx4Fm+dqmxBbtnRvqC7dT/NbXEc7CR0MBB8dgqhVkqNgjVlmeFw==
X-Received: by 2002:a05:6e02:1a88:b0:313:bbf8:29e9 with SMTP id
 k8-20020a056e021a8800b00313bbf829e9mr780212ilv.29.1676334491113; 
 Mon, 13 Feb 2023 16:28:11 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:28:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 10/12] bsd-user: do_freebsd_sysctl helper for sysctl(2)
Date: Mon, 13 Feb 2023 17:27:55 -0700
Message-Id: <20230214002757.99240-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214002757.99240-1-imp@bsdimp.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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
---
 bsd-user/freebsd/os-sys.c     | 57 ++++++++++++++++++++++++++++++++++-
 bsd-user/freebsd/os-syscall.c |  4 +++
 bsd-user/qemu.h               |  2 ++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index cbaa70958b9..e70f8f21c52 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -258,7 +258,7 @@ static inline void sysctl_oidfmt(uint32_t *holdp)
     holdp[0] = tswap32(holdp[0]);
 }
 
-static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
+static abi_long do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
         int32_t namelen, void *holdp, size_t *holdlenp, void *hnewp,
         size_t newlen)
 {
@@ -481,6 +481,61 @@ out:
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
+    unlock_user(holdp, oldp, holdlen);
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
index 0ceecfb6dfa..c7248cfde6f 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -252,6 +252,8 @@ bool is_error(abi_long ret);
 int host_to_target_errno(int err);
 
 /* os-sys.c */
+abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
+        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
 
 /* user access */
-- 
2.39.1


