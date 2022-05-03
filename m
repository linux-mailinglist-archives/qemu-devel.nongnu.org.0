Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7EC518E8E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:17:32 +0200 (CEST)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyxf-00032l-BA
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWT-0002Gi-6p
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWL-0003by-H8
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:21 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i62so14802499pgd.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4cvH0ebqo0OJd6RBcXpOB2gOw1DN8L+GgldZsIUiDKo=;
 b=Y4eOvP6FIKO9Z6vVBAbwUilWA36rzk2sajzQnm7PMOrfkjR4m8D5oMcj81T+cwslD0
 /YGt2fJqqknhVK+Yw6Cvz+1NLrO0JMse0GPgWa94O6le19gFKa1kqOW4pmssbD6CKkhP
 INnYWQ7w1bllhEiHo+I8le3Skhy7h1LS3Hm+jge5oIYCI0bVpUisj5jJfK5VJTeVdcvU
 VhSevERLuoxxNmsU8w0y4/xBDMBCGjRqc9oiVGv5p7EuyBhGcC0D2zN2M5PXbym4jDqj
 Nmun/eUFTt3rY5Z52LUXR6AsRALWksBeBSI3MxfQCPwCSX6ddqmX4POPNl/4t6hcqCJz
 GacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4cvH0ebqo0OJd6RBcXpOB2gOw1DN8L+GgldZsIUiDKo=;
 b=RfeJnbm3zLhccjTGk6SjsGm1DTmFxppFwLgAWr8RK0S5M6njeqzdGWRmSLoSkwHK6l
 C+TLjOs6vfOsbWiFJRaoIDLxMwlWTF0YFr/h+JpHjWBMg0B7gUYQh5vkUgNSnLTQ2NKv
 +7jZm0Ytm3CtrFMaFRUxjFlJZijZ0afS6pnwCRUf+IUnfYCvM6KALgfmNicy1nBoBG/t
 +oHqtBJATmrwFvIO0Ev/fW1BbYt7uy0lXqwQ5HUV/LHuWduboBjCu0zTlTb7HuxoT4ZV
 XXSfi2DjO7/pcvPNfNWg6TlWOWfiH26njSj/7DBWBZNGHiQbkiPjpM8uk+hP/lPX9sgZ
 lhAg==
X-Gm-Message-State: AOAM532wToWCdrVEAmZHdCm0U8IHKSjbAdRfiDWnifv1aDdj4fRF0Hje
 eWbSB7S6DrYBxAqkKIDHmgcYKgr7cr1PtA==
X-Google-Smtp-Source: ABdhPJwShTglbjNmZn/5DTFK8YZsXiQD8XVW6kXzfYg9zhCnrkBQ2mXHBfuoUrEBD6H8QghW4pFAsg==
X-Received: by 2002:a63:cd41:0:b0:3c5:1242:3a0d with SMTP id
 a1-20020a63cd41000000b003c512423a0dmr928181pgj.266.1651607354731; 
 Tue, 03 May 2022 12:49:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/74] semihosting: Split out semihost_sys_remove
Date: Tue,  3 May 2022 12:47:58 -0700
Message-Id: <20220503194843.1379101-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the non-ARM specific portions of SYS_REMOVE to a
reusable function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  3 +++
 semihosting/arm-compat-semi.c  | 13 +----------
 semihosting/syscalls.c         | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 1ae5ba6716..748a4b5e47 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -49,4 +49,7 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
                        gdb_syscall_complete_cb flen_cb,
                        int fd, target_ulong fstat_addr);
 
+void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong fname, target_ulong fname_len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index ad43bc8b0d..9c98af19ca 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -473,18 +473,7 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(common_semi_cb, "unlink,%s",
-                           arg0, (int)arg1 + 1);
-            break;
-        }
-        s = lock_user_string(arg0);
-        if (!s) {
-            goto do_fault;
-        }
-        ret = remove(s);
-        unlock_user(s, arg0, 0);
-        common_semi_cb(cs, ret, ret ? errno : 0);
+        semihost_sys_remove(cs, common_semi_cb, arg0, arg1 + 1);
         break;
 
     case TARGET_SYS_RENAME:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 1425156bf6..3464896281 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -163,6 +163,18 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
 }
 
+static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len)
+{
+    int len = validate_strlen(cs, fname, fname_len);
+    if (len < 0) {
+        complete(cs, -1, -len);
+        return;
+    }
+
+    gdb_do_syscall(complete, "unlink,%s", fname, len);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -307,6 +319,24 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
+                        target_ulong fname, target_ulong fname_len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *p;
+    int ret;
+
+    ret = validate_lock_user_string(&p, cs, fname, fname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = remove(p);
+    complete(cs, ret, ret ? errno_for_gdb() : 0);
+    unlock_user(p, fname, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -552,3 +582,13 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
         g_assert_not_reached();
     }
 }
+
+void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong fname, target_ulong fname_len)
+{
+    if (use_gdb_syscalls()) {
+        gdb_remove(cs, complete, fname, fname_len);
+    } else {
+        host_remove(cs, complete, fname, fname_len);
+    }
+}
-- 
2.34.1


