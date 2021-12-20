Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38F47B52D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:27:30 +0100 (CET)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQBt-0003em-RU
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mzLMJ-00037A-Bg
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:17:55 -0500
Received: from [2607:f8b0:4864:20::62f] (port=40686
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tonistiigi@gmail.com>)
 id 1mzLMH-0006uv-Ch
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:17:55 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v19so8485370plo.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qyfICRpTiU6HSGFfdCMOCPh+MCKMx8Zg1jTgry03f/s=;
 b=qLtk3QFzttBkmL0f/xgVpmPgrB2NZcFfzj03Z4r5QuHzlANz+UAI9mf5aY3bIjzjmF
 OtTX1QBknsimqibwXiZR0izZcTa8TQmjIG7iE3Hgljj36pByCh3jcQSR+KTTNcVeTTgm
 OwDHPpFXON78lu2/DUmpbDdVPmM0fJW+KCaBNWi0VcdAA9rRH6+wcbpihrA9XME2qgvh
 rZIV/YI/rejX9yfO4ykeurW+V7BrdLGeeECORAcKW5goFZgZ6JJuNrnPHVbhZQDhKRap
 Q6WndjEEZrTgNAHrtAg4fpMsohJO/NZSy8NbC/6SfP2c/3+gJsK50SRY+c8hoctja8Xk
 c8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qyfICRpTiU6HSGFfdCMOCPh+MCKMx8Zg1jTgry03f/s=;
 b=Yn8ICLClYpGCF6WLgwiv2DJjrGKPPhbF0aYWLE3pUBUmGKnqiAujFTk5Fw1/dRTUbp
 G3wS6YWyw2T7H5/1+kTy6uKi+JuAB/ymX1nYinSbFsz85yyw7Uz4m6MeNXMd0ckPfiKy
 g+WsKxfs5+jSUzQXtUrfhephMh2LQ7ttm328JEGuCb+Hxn0gfaFMDLzuZ8AI4R1pTLfe
 pXuaZGF79cODen20+876XEG8+tjwH+Z88BIkZWPtuwWlTtiTC+EJbVYW+qS1ZmaVHXsC
 /rcI8r1O8esUCgQsQ/oum2XjNpOS2FKvdm30dPozypUzw1ppEmCoAlH++B8m5S1fIklx
 OSOw==
X-Gm-Message-State: AOAM533eOvGDz3KIw5ztfgZTjye4JR7xe7Wb+zVJXkOLCwH2QL90c7zn
 55aOWwP7hRo/WFhB00Yc2L35GlDw1Vg92g==
X-Google-Smtp-Source: ABdhPJy2VdRF2G7cQGwlqj4qPB0o7MyuIE2ypRBji4AeVtt5KUmUgCRQCgslwPJ/fIgN88kTzRXCUw==
X-Received: by 2002:a17:903:191:b0:148:b9fc:c42b with SMTP id
 z17-20020a170903019100b00148b9fcc42bmr15385923plg.63.1639984899070; 
 Sun, 19 Dec 2021 23:21:39 -0800 (PST)
Received: from localhost ([2601:646:100:6be:144b:f686:1c59:8e87])
 by smtp.gmail.com with UTF8SMTPSA id lb12sm4291905pjb.27.2021.12.19.23.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 23:21:38 -0800 (PST)
From: Tonis Tiigi <tonistiigi@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] linux-user: call set/getscheduler set/getparam directly
Date: Sun, 19 Dec 2021 23:21:05 -0800
Message-Id: <20211220072105.48860-3-tonistiigi@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20211220072105.48860-1-tonistiigi@gmail.com>
References: <20211220072105.48860-1-tonistiigi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=tonistiigi@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:21:26 -0500
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
Cc: Tonis Tiigi <tonistiigi@gmail.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There seems to be difference in syscall and libc definition of these
methods and therefore musl does not implement them (1e21e78bf7). Call
syscall directly to ensure the behavior of the libc of user application,
not the libc that was used to build QEMU.

Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
---
 linux-user/syscall.c      | 40 ++++++++++++++++++++++++++-------------
 linux-user/syscall_defs.h |  4 ++++
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a447ce1f92..6adecf745a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -345,6 +345,17 @@ _syscall4(int, sys_sched_getattr, pid_t, pid, struct target_sched_attr *, attr,
 #define __NR_sys_sched_setattr __NR_sched_setattr
 _syscall3(int, sys_sched_setattr, pid_t, pid, struct target_sched_attr *, attr,
           unsigned int, flags);
+#define __NR_sys_sched_getscheduler __NR_sched_getscheduler
+_syscall1(int, sys_sched_getscheduler, pid_t, pid);
+#define __NR_sys_sched_setscheduler __NR_sched_setscheduler
+_syscall3(int, sys_sched_setscheduler, pid_t, pid, int, policy,
+          const struct target_sched_param *, param);
+#define __NR_sys_sched_getparam __NR_sched_getparam
+_syscall2(int, sys_sched_getparam, pid_t, pid,
+          struct target_sched_param *, param);
+#define __NR_sys_sched_setparam __NR_sched_setparam
+_syscall2(int, sys_sched_setparam, pid_t, pid,
+          const struct target_sched_param *, param);
 #define __NR_sys_getcpu __NR_getcpu
 _syscall3(int, sys_getcpu, unsigned *, cpu, unsigned *, node, void *, tcache);
 _syscall4(int, reboot, int, magic1, int, magic2, unsigned int, cmd,
@@ -10555,30 +10566,32 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setparam:
         {
-            struct sched_param *target_schp;
-            struct sched_param schp;
+            struct target_sched_param *target_schp;
+            struct target_sched_param schp;
 
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1))
+            if (!lock_user_struct(VERIFY_READ, target_schp, arg2, 1)) {
                 return -TARGET_EFAULT;
+            }
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg2, 0);
-            return get_errno(sched_setparam(arg1, &schp));
+            return get_errno(sys_sched_setparam(arg1, &schp));
         }
     case TARGET_NR_sched_getparam:
         {
-            struct sched_param *target_schp;
-            struct sched_param schp;
+            struct target_sched_param *target_schp;
+            struct target_sched_param schp;
 
             if (arg2 == 0) {
                 return -TARGET_EINVAL;
             }
-            ret = get_errno(sched_getparam(arg1, &schp));
+            ret = get_errno(sys_sched_getparam(arg1, &schp));
             if (!is_error(ret)) {
-                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0))
+                if (!lock_user_struct(VERIFY_WRITE, target_schp, arg2, 0)) {
                     return -TARGET_EFAULT;
+                }
                 target_schp->sched_priority = tswap32(schp.sched_priority);
                 unlock_user_struct(target_schp, arg2, 1);
             }
@@ -10586,19 +10599,20 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
     case TARGET_NR_sched_setscheduler:
         {
-            struct sched_param *target_schp;
-            struct sched_param schp;
+            struct target_sched_param *target_schp;
+            struct target_sched_param schp;
             if (arg3 == 0) {
                 return -TARGET_EINVAL;
             }
-            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1))
+            if (!lock_user_struct(VERIFY_READ, target_schp, arg3, 1)) {
                 return -TARGET_EFAULT;
+            }
             schp.sched_priority = tswap32(target_schp->sched_priority);
             unlock_user_struct(target_schp, arg3, 0);
-            return get_errno(sched_setscheduler(arg1, arg2, &schp));
+            return get_errno(sys_sched_setscheduler(arg1, arg2, &schp));
         }
     case TARGET_NR_sched_getscheduler:
-        return get_errno(sched_getscheduler(arg1));
+        return get_errno(sys_sched_getscheduler(arg1));
     case TARGET_NR_sched_getattr:
         {
             struct target_sched_attr *target_scha;
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 310d6ce8ad..28b9fe9a47 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2928,4 +2928,8 @@ struct target_sched_attr {
     abi_uint sched_util_max;
 };
 
+struct target_sched_param {
+    abi_int sched_priority;
+};
+
 #endif
-- 
2.32.0 (Apple Git-132)


