Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C568E52F740
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 03:06:14 +0200 (CEST)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDZN-0000em-Tz
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 21:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc6-0008CK-WD
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbp-00042D-OB
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so8556604plk.8
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LN6XpMNK1B7AUGbjroKLaQGdSs8x64FTUaroN/g+tus=;
 b=aAfH0ZA/X9yVbGcmtAb4roHMq6C/zyYZBRaZ4/5ntSTdXT58Njth2UTwhct/5iGeVj
 LqqAez6GB1r28d5HOeCsb3EKKu4ipdWfwXOV7XocjQ52rm7Db00r6ZIzG4/zvpfLUz7r
 DL3txqX0gn2kigtJX2CDP83ddmc40KuNZ938fleTKc9lkZRjOHAL/GEvRznYLkiiFLY1
 ZfjV8hfqOZn/v+T/nMR7XBZkXuVmEj+skob2jcfryrp8uNmM9ZaStHcbxdHDNyFoYUWL
 H45YRhCsYZpsTQ2z4JI90EkdVl210ZmRGszBSIyl4AWATdrwubQVtxPoSBib8mhS+t8M
 EVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LN6XpMNK1B7AUGbjroKLaQGdSs8x64FTUaroN/g+tus=;
 b=EjCXGQV5VSVv4JGu4DW+a+70YfFKCB2wPQGPGmugh2rLuzU0KUGiRNn7FSm1+cK6ko
 YpjzNhLEBzxVMkKQ8de4sVKGfQ1EGDUKjqEPPb6fwkz6GOTnjsbpeEFKtF0ldOOo5ogU
 cSY4L8eedTte5cSApF8BelcD2qi62CXynUq/sGfPIZfQxtUVByocnfyZV5qs3UaYeuhM
 XX8Her/VpWRrRSXCr1SDCOadT/gVuVbLaILlfn11+V/S/D5tRxf12hDl88ZqzovElSgy
 MEYEMUQbya7DSwaFTrW53N+jTuGYyBs/oTVo4gBUmQZl9ivLaO8cumHbqPo0jdlmd06k
 YhWA==
X-Gm-Message-State: AOAM532Unca39wVT/02Ta3t0TaZ2nVQvyWff9kKKHp5a5clOSnkOx7sw
 EAONpjoTxccstQUopfiz201+ID0m/8tmZw==
X-Google-Smtp-Source: ABdhPJxdFSi08P/ifQ/qDxVOsLm+4JHpWqWcDmuhRJRj3RsaPMACqDgpzOhw3jXahdCZbIDmTIDtzw==
X-Received: by 2002:a17:90b:3a89:b0:1de:bad4:b614 with SMTP id
 om9-20020a17090b3a8900b001debad4b614mr14181225pjb.139.1653091477058; 
 Fri, 20 May 2022 17:04:37 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 31/49] semihosting: Split out semihost_sys_remove
Date: Fri, 20 May 2022 17:03:42 -0700
Message-Id: <20220521000400.454525-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index 5dd8c800cc..b4320939a1 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -470,18 +470,7 @@ void do_common_semihosting(CPUState *cs)
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


