Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497155BEE4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:58:52 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65BT-0005SY-AB
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GD-0003j8-HN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GB-0000GM-Sk
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id w24so11407914pjg.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75MpsrFXvyEUWpCESuFADgwToaEzRn7+pYxzAo7cwTQ=;
 b=bsWBNFHhXhhcuJ/17hvviMdtaF/6DrfFR8dw+0nL4WieqMjJBkzXotPEWSHBJj7tBi
 qS4CllRk9MXE64fW+n7ZkHd0gmhfopvPRcxqY1D2eM3vaISYIsNHj7ia/tvNG88eKJ2J
 UgrEq2zm6HCUmhBI5QRJCSV2FNjs6jBizmuoCFyArvUQGheHsuqLvoB7V40GqQZoF8A6
 pp5cuQHq5C7NMK4GTfdr5qr+FpXrMoR9lZNgelZGeXCW8WmxF99D8RIGndVBecVf/7dR
 gePE0CjmWvwf+nADF++aBNguw/NRbf91aWmb4sbHCCw/ZHz3NY5u+bm63apyh0whd7OR
 CSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75MpsrFXvyEUWpCESuFADgwToaEzRn7+pYxzAo7cwTQ=;
 b=jhCZtP8aJeR8uz33yD+UkcLIOIhi4krT4J5AKw5fr63Wiqc9ksbeGGRdbtlxB5xd66
 8zT/f6ai7uCZg7pEZa9D+iu3uyYvg7aGJvNqZUxmh11kqJBBzFVK19pZJUY7hs6N3sc4
 JQX9Jh7xhbmgiMJ6HLqX7jGtTwC1Xq3cFkOA6ABujOdD1JTMIl13z0v0hww/pgdDzlRI
 AGcglK73jGVsqgJZZ2Ztsb9QDp2NpJyG6SF37AOJ5tI3BSoePcEVF0NCwlsrN9mvY5go
 YrZxGr08I2CtdV7DdKtrJfJg3DcZpnZHcr9D54ZR+j79bF9v3q/TyIN7+vag9RpoTcLH
 0zgA==
X-Gm-Message-State: AJIora+wvBcnkKedDKyf8CGmvAPP1TygDewe9uWM+w/fTRoIGxBxVxvP
 lcKw21Xkk9MtHwuIv4MIPtNlkp4yjX644w==
X-Google-Smtp-Source: AGRyM1skz/9djfdgaOoV+LOoAIRlilipFbqh2zcESaFuD+x00v+TYakyRUcTY3t9rG+6KNW1ECZQGA==
X-Received: by 2002:a17:903:32c4:b0:16a:6b37:7cbe with SMTP id
 i4-20020a17090332c400b0016a6b377cbemr1822703plr.30.1656392134542; 
 Mon, 27 Jun 2022 21:55:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 35/60] semihosting: Split out semihost_sys_remove
Date: Tue, 28 Jun 2022 10:23:38 +0530
Message-Id: <20220628045403.508716-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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
index 68e13d9077..f4ce3851a4 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -484,18 +484,7 @@ void do_common_semihosting(CPUState *cs)
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
index fff9550c89..5ec4e8f827 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -133,6 +133,18 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -277,6 +289,24 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
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
+    complete(cs, ret, ret ? errno : 0);
+    unlock_user(p, fname, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -522,3 +552,13 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
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


