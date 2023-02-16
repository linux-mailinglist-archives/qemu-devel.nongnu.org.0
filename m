Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E003B69A266
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlS-00009Y-Gf; Thu, 16 Feb 2023 18:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlQ-00007y-D2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:08 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlO-0008Pt-8G
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:34:08 -0500
Received: by mail-il1-x133.google.com with SMTP id v13so1422643iln.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+xNG+XIxDzZrfUzAM1AKP8QRLGF04ZsNMQklPyjAdQ=;
 b=r1X5vjJOspIs0Fl80DHWrWQz/WLfbjM1rjYRKjBSjySclUPpGOlWfiZ2Vh/9vG31Pz
 dtcUjU2lfMksAlqhUN6JbBU6u9b0q2goqDyHOsDwIW4mtOUnUnlYqsGp8DYJ/6NmeUim
 JEscLLJ1robmb5VgTmqTKiYd+t+9yVtbnAVetsRLtlHBIU4JBLZ14cibkk/H1RLOqVq2
 E0j4pRuSaBMsIamM1iMSEQRBqtTMoSHlcXatx/12LyeDrILwxod+oVLalRG8ceG/OisC
 IXRQVe73UDz3glfvk497LXP7rQLievdG2Jy/IWLx6QfXBs3chu8Fiz3Llzw00Ub9VZuM
 c9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+xNG+XIxDzZrfUzAM1AKP8QRLGF04ZsNMQklPyjAdQ=;
 b=rQL1Dh5INzHmCh7vQarebvRyh7JrtN9DY6JuhG2NwrcmpERQTjOfn3w6UItlET5UFT
 XCySdPKg/mnJhP7Mbv103JYEptd3R4DFCb2WmJHmfRzQq9u/eyvB4Q/a2YEsOFCg/3bl
 QyInM7r4c3Uuojj6wFRLmpAFF+CA4sRD/WeUMSiItMWvLPAIRsf4Rs25erl9QRIX5hzh
 Zc4EIQVLwtKnSYk8rNeFQ+z8nCpeSCiE3qyyqF9JewRi4ofa6FZqICCIrR57+5PYi7Y0
 oXfgMCi/UFxdJxv4OCr7FWcc2JyhmgKJTO11uMN60I9grGN3Ir3ImF1hWO7aIeD7swwO
 Lz5g==
X-Gm-Message-State: AO0yUKUtBjdZpKK+vitgu+51b3w+RumD1X49tuv3V5ItAyZk4zva7pPt
 RjcMpr5SsWhK2JcaxSEMLundqvPFokeTN4yY
X-Google-Smtp-Source: AK7set8+14hLGUJ63avHF2f50tpGcP7pqeSg6ce5ZLFtRPmUZUx+upnLZPJoXAIUxl3cX2eqK5TmIQ==
X-Received: by 2002:a05:6e02:2185:b0:312:7bbf:94f5 with SMTP id
 j5-20020a056e02218500b003127bbf94f5mr8473610ila.3.1676590445233; 
 Thu, 16 Feb 2023 15:34:05 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:34:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v3 10/11] bsd-user: do_freebsd_sysctl helper for sysctl(2)
Date: Thu, 16 Feb 2023 16:33:52 -0700
Message-Id: <20230216233353.13944-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216233353.13944-1-imp@bsdimp.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
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
index 1464e64428f..f07ae7da740 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -249,7 +249,7 @@ static inline void sysctl_oidfmt(uint32_t *holdp)
     holdp[0] = tswap32(holdp[0]);
 }
 
-static abi_long G_GNUC_UNUSED do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
+static abi_long do_freebsd_sysctl_oid(CPUArchState *env, int32_t *snamep,
         int32_t namelen, void *holdp, size_t *holdlenp, void *hnewp,
         size_t newlen)
 {
@@ -472,6 +472,60 @@ out:
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


