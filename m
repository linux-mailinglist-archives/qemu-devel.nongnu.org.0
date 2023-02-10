Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E573692B0F
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcjD-0007BY-Nv; Fri, 10 Feb 2023 18:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj7-0007BG-H3
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:45 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj5-00053r-TI
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:45 -0500
Received: by mail-il1-x132.google.com with SMTP id v13so1349733iln.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1kTTQBkTJkPrcjFSf8LeSCgkPCLAZN38tRqgAA8ZV8=;
 b=sqkUKkWGq0X96B4K/hYfXdl4IIco37tK1ZeIN9Lo13WPVOL2WXJaP6FtOhlnYSffpa
 GuFEbCeRjGImkohTTM02iLxvspZbrNRP2KnXZzkX8RpLidUV1uuKJI3A7Xd90DHXqhUn
 ikQOrHznTLho1WACodrbLMJ456gfY2JnL5dk+FXjGYFVxed0Z5+ZDmzBcWtP4EMUNuSb
 lgxRD48sm10W6ixPjcBKJXC1CX5hz5+H4XRS7Z/Nh+9u84s+iWRjVHEtase9ODm6DBFz
 u1tueZNGG+sXCiH49aSXvxIe2d7Y/YMIWrkJoPN1O8IUSyO+025CFAeJ1D9MoohOobo1
 tIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1kTTQBkTJkPrcjFSf8LeSCgkPCLAZN38tRqgAA8ZV8=;
 b=VMkoocZ3krSILMM78fXLEgSGV8s7IHiFvITSupYN6jU8uPx2AH6GG7C+OVUQYHodbS
 wEnKBSWmpL97n3Q2iwJtPknxRoyhC4jda2p7AG9j5/n8hdX1+fvOjN5KHmc0tho/1YiC
 8v1p/NkXIHoKaeR6gAA/gEUfWRswUAWkVSq7Nl67s8yHRWxtgjqTsMeVzLxPB1TScqkv
 /LCbyjx+/gFWhWAnOZBDS5b/pWoZIEyIs3lpOnIYTNLsSM9FZQfmUJCeR7kCpRvVJLxt
 tEXZZXK8bC6SJ3O96B/6KWC82/P0Bbu49LoquEeljJd/35W1Q3cBvLTn6rJ9hvNiWw15
 UklA==
X-Gm-Message-State: AO0yUKVbSsSY5D5jHpGu+TTx18Uxx2e4b9MrJPPolATrfCCJTeA6Sqte
 Drbj47H9TZcdxRJWeEYSwi73hqQWg6IQk8bt
X-Google-Smtp-Source: AK7set/U7SRtObqY2RIGNwJgy9OfKCH/13yNoV5Tp+XI7UgFRgPPUJphs/39KWP5WWS1MECXqZEcaw==
X-Received: by 2002:a05:6e02:1a6e:b0:313:d8a3:9e6c with SMTP id
 w14-20020a056e021a6e00b00313d8a39e6cmr16832682ilv.15.1676071361015; 
 Fri, 10 Feb 2023 15:22:41 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 7/9] bsd-user: do_freebsd_sysctl helper for sysctl(2)
Date: Fri, 10 Feb 2023 16:18:27 -0700
Message-Id: <20230210231829.39476-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c     | 50 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index a8fb29f36b7..13736936e5f 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -345,6 +345,56 @@ out:
     return ret;
 }
 
+abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
+        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
+{
+    abi_long ret;
+    void *hnamep, *holdp = NULL, *hnewp = NULL;
+    size_t holdlen;
+    abi_ulong oldlen = 0;
+    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
+
+    if (oldlenp) {
+        if (get_user_ual(oldlen, oldlenp)) {
+            return -TARGET_EFAULT;
+        }
+    }
+    hnamep = lock_user(VERIFY_READ, namep, namelen, 1);
+    if (hnamep == NULL) {
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
+    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++) {
+        *q++ = tswap32(*p);
+    }
+
+    ret = do_freebsd_sysctl_oid(env, snamep, namelen, holdp, &holdlen, hnewp,
+        newlen);
+
+    if (oldlenp) {
+        put_user_ual(holdlen, oldlenp);
+    }
+    unlock_user(hnamep, namep, 0);
+    unlock_user(holdp, oldp, holdlen);
+    if (hnewp) {
+        unlock_user(hnewp, newp, 0);
+    }
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
-- 
2.39.1


