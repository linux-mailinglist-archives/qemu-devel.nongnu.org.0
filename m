Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD208657CEB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 16:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAYTJ-00031G-Od; Wed, 28 Dec 2022 10:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYTH-00030k-3k
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 10:35:59 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAYTF-0006mJ-9n
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 10:35:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id bk16so2029592wrb.11
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J7j9Wk0f3OlackFV6lpjD3tFD965I78lpUTOMamnvHk=;
 b=mF89zWXbCqDwTenTkB80VzLDt7c0gQeoLSlefLauyrQyhhxW/YLjywOxQwdJPPbXdF
 cd8M4dUBQu4360cJel8BLpAexXEFEzEPWwwhzP3whxK3tV1MB5dSY22JL/YcIXa+vsGv
 4y7U4tkLHvJHB3vYBMSS3cs4iC2hXGv8szIlqY2tV2Y9zb4Vo5z2Akb1rqD16xaykzDp
 b49GKaEDW5aSCo010qEB6FPhhVXkWpQeHXXqc4KyJsshrKOwzxo1PBe+QAYmEFL7RbGs
 GbYE88pfNhU1acjbhFk9lwVhVIit6W8wAE4ur5L5XDKDM7V0PyIes7lM80r/VobZu1uv
 jmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7j9Wk0f3OlackFV6lpjD3tFD965I78lpUTOMamnvHk=;
 b=opA+ulvskvvNcbZOt92xfqSIRTp2ALfqTul1oKrLX/GyQWRR04GC8GpIL8L6YI50Jo
 JSJKWicgKIjzZWeMuO3mboMOvxDjCNjefBc7c9EhrMsuXBP5PeAXQPNyktixPTa6Vzdx
 XGM+FzV15PafO11lobUIAP8n5PwljFpsDFep159DlLCSEjuijtRxSgUqEOIEKGYQzp7D
 CsNmrrs8GkTB63mnPBew0YFAcQQoI6ChsbaH+JptzFVc4UQ1f9uBMPedcVL0onz+yt3z
 +aKCcOqqWpYA78DT/LWJsNvLxelfI6dcbGlXkl0P2sq/bCJznGXB34AxB8T81k7QeYm1
 8TMA==
X-Gm-Message-State: AFqh2kpvOhSI68z97qrSDhFmHi7DfGaVw7aQebhk6OgchI0R2Fu1/1xU
 RvYmFhkCF3O+KL+wZXojTS6c6NJJduk0u7k8
X-Google-Smtp-Source: AMrXdXvisXXULEB0ZuL051H3hI1eSwN//8eNsJlhfKiUwIpxS9tt05DGJ9vUKTxriUnol60v57n9Ww==
X-Received: by 2002:a5d:438e:0:b0:241:94bc:26d3 with SMTP id
 i14-20020a5d438e000000b0024194bc26d3mr17920453wrq.49.1672241755412; 
 Wed, 28 Dec 2022 07:35:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a5d664e000000b0027f4a7efc54sm7177666wrw.15.2022.12.28.07.35.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Dec 2022 07:35:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Zach van Rijn <me@zv.io>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] linux-user/syscall: Endian-swap [res]uid/gid
Date: Wed, 28 Dec 2022 16:35:53 +0100
Message-Id: <20221228153553.83773-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Various syscalls miss swapping the endiannes of the [res]uid/gid
values. Use the tswapid() helper meant to do exactly that.

Fixes: b03c60f351 ("more syscalls")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall.c | 55 ++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..2aa19e33ca 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11405,30 +11405,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_lchown:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-        ret = get_errno(lchown(p, low2highuid(arg2), low2highgid(arg3)));
+        ret = get_errno(lchown(p, low2highuid(tswapid(arg2)),
+                               low2highgid(tswapid(arg3))));
         unlock_user(p, arg1, 0);
         return ret;
 #endif
 #ifdef TARGET_NR_getuid
     case TARGET_NR_getuid:
-        return get_errno(high2lowuid(getuid()));
+        return get_errno(tswapid(high2lowuid(getuid())));
 #endif
 #ifdef TARGET_NR_getgid
     case TARGET_NR_getgid:
-        return get_errno(high2lowgid(getgid()));
+        return get_errno(tswapid(high2lowgid(getgid())));
 #endif
 #ifdef TARGET_NR_geteuid
     case TARGET_NR_geteuid:
-        return get_errno(high2lowuid(geteuid()));
+        return get_errno(tswapid(high2lowuid(geteuid())));
 #endif
 #ifdef TARGET_NR_getegid
     case TARGET_NR_getegid:
-        return get_errno(high2lowgid(getegid()));
+        return get_errno(tswapid(high2lowgid(getegid())));
 #endif
     case TARGET_NR_setreuid:
-        return get_errno(setreuid(low2highuid(arg1), low2highuid(arg2)));
+        return get_errno(setreuid(low2highuid(tswapid(arg1)),
+                                  low2highuid(tswapid(arg2))));
     case TARGET_NR_setregid:
-        return get_errno(setregid(low2highgid(arg1), low2highgid(arg2)));
+        return get_errno(setregid(low2highgid(tswapid(arg1)),
+                                  low2highgid(tswapid(arg2))));
     case TARGET_NR_getgroups:
         {
             int gidsetsize = arg1;
@@ -11470,21 +11473,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return get_errno(setgroups(gidsetsize, grouplist));
         }
     case TARGET_NR_fchown:
-        return get_errno(fchown(arg1, low2highuid(arg2), low2highgid(arg3)));
+        return get_errno(fchown(arg1, low2highuid(tswapid(arg2)),
+                                low2highgid(tswapid(arg3))));
 #if defined(TARGET_NR_fchownat)
     case TARGET_NR_fchownat:
         if (!(p = lock_user_string(arg2))) 
             return -TARGET_EFAULT;
-        ret = get_errno(fchownat(arg1, p, low2highuid(arg3),
-                                 low2highgid(arg4), arg5));
+        ret = get_errno(fchownat(arg1, p, low2highuid(tswapid(arg3)),
+                                 low2highgid(tswapid(arg4)), arg5));
         unlock_user(p, arg2, 0);
         return ret;
 #endif
 #ifdef TARGET_NR_setresuid
     case TARGET_NR_setresuid:
-        return get_errno(sys_setresuid(low2highuid(arg1),
-                                       low2highuid(arg2),
-                                       low2highuid(arg3)));
+        return get_errno(sys_setresuid(low2highuid(tswapid(arg1)),
+                                       low2highuid(tswapid(arg2)),
+                                       low2highuid(tswapid(arg3))));
 #endif
 #ifdef TARGET_NR_getresuid
     case TARGET_NR_getresuid:
@@ -11492,9 +11496,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             uid_t ruid, euid, suid;
             ret = get_errno(getresuid(&ruid, &euid, &suid));
             if (!is_error(ret)) {
-                if (put_user_id(high2lowuid(ruid), arg1)
-                    || put_user_id(high2lowuid(euid), arg2)
-                    || put_user_id(high2lowuid(suid), arg3))
+                if (put_user_id(tswapid(high2lowuid(ruid)), arg1)
+                    || put_user_id(tswapid(high2lowuid(euid)), arg2)
+                    || put_user_id(tswapid(high2lowuid(suid)), arg3))
                     return -TARGET_EFAULT;
             }
         }
@@ -11502,9 +11506,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_getresgid
     case TARGET_NR_setresgid:
-        return get_errno(sys_setresgid(low2highgid(arg1),
-                                       low2highgid(arg2),
-                                       low2highgid(arg3)));
+        return get_errno(sys_setresgid(low2highgid(tswapid(arg1)),
+                                       low2highgid(tswapid(arg2)),
+                                       low2highgid(tswapid(arg3))));
 #endif
 #ifdef TARGET_NR_getresgid
     case TARGET_NR_getresgid:
@@ -11512,9 +11516,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             gid_t rgid, egid, sgid;
             ret = get_errno(getresgid(&rgid, &egid, &sgid));
             if (!is_error(ret)) {
-                if (put_user_id(high2lowgid(rgid), arg1)
-                    || put_user_id(high2lowgid(egid), arg2)
-                    || put_user_id(high2lowgid(sgid), arg3))
+                if (put_user_id(tswapid(high2lowgid(rgid)), arg1)
+                    || put_user_id(tswapid(high2lowgid(egid)), arg2)
+                    || put_user_id(tswapid(high2lowgid(sgid)), arg3))
                     return -TARGET_EFAULT;
             }
         }
@@ -11524,14 +11528,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_chown:
         if (!(p = lock_user_string(arg1)))
             return -TARGET_EFAULT;
-        ret = get_errno(chown(p, low2highuid(arg2), low2highgid(arg3)));
+        ret = get_errno(chown(p, low2highuid(tswapid(arg2)),
+                              low2highgid(tswapid(arg3))));
         unlock_user(p, arg1, 0);
         return ret;
 #endif
     case TARGET_NR_setuid:
-        return get_errno(sys_setuid(low2highuid(arg1)));
+        return get_errno(sys_setuid(low2highuid(tswapid(arg1))));
     case TARGET_NR_setgid:
-        return get_errno(sys_setgid(low2highgid(arg1)));
+        return get_errno(sys_setgid(low2highgid(tswapid(arg1))));
     case TARGET_NR_setfsuid:
         return get_errno(setfsuid(arg1));
     case TARGET_NR_setfsgid:
-- 
2.38.1


