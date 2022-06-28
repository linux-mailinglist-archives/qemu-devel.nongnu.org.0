Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AED55BF51
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:02:45 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66BG-0004MB-SR
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GH-0003vs-TT
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:42 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GG-0000Gk-9b
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so14638271pjm.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnFWwBa1I9VJoksIMHyZzDE5/cUcTWTNeSlLEr2nKGs=;
 b=VIw/+1noFjzd2DXm5WGJmLaqSAX8Nuv8x+Ze4SLQgbA5tG3LPUG2j0qF6/SRFB/N/l
 o9UPqFOGovgfukdQOJUeFmGSik6UfrH7SVqpCazMn80VSGbPz7E5eTiwRxB+puvaArWP
 ZAA614ADrxhGvfI4bS8dPOlNUKcZD+grqLSdp1W+TZjznz6StHACyriQIYp7cZSozKKS
 QZOet/XLyNqVIwsdkX7iPkYw8gpmpjRHA4yao4ZUB1JKxdUcTrRCjZeEbqnsBsXUYgnq
 lbdpfskyajW8DKCZfhOxJB6k7yFRMhFJcAQTeS9AIXC1UJ/QLUNxOtp/XqjfxtdLZkE6
 90TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnFWwBa1I9VJoksIMHyZzDE5/cUcTWTNeSlLEr2nKGs=;
 b=aUeRuUM8vsZp/EBKp0W3F3oBihpu/6nln5LPCuy7LLoV7V4b5pKHHsfFg+ICWJwX/a
 QeN8SGdQ9K9YNsv5pxhp0fZ4Sk30B3m/AVniPfYF7eJCi4cV7d8vY4mQJjvT1Z9QeuoY
 7l2brl/bNNZGBICrojMv2wilDOXvBGYbUXqfcPSDLsq7XAE8b7D2jrrd982Pz56YfDtY
 GUxQpZpsYUHipol/QVocIATKJKoYPJw6iGckbjOqnvTZaVJvRgPBTXa2Ky5JRmR0k8Np
 gRY1ndTl7+YVDdOZp6sarwQnbAnx2JRP2GoNHH/5KfEs1WK4MmdZBzBiL8z7XKhw1cbM
 eCDw==
X-Gm-Message-State: AJIora+2KMHmkYHyvfmZuf3ra7aMtsyYb/3lnccaSUQNFr86+HwXsx8z
 0qfyPMOVdRvmBo9+eHBymWfJH+F470rZBg==
X-Google-Smtp-Source: AGRyM1sQitXa7nl91vAze6Qw977cvvdk1vUsGgS24BwC82tPxFTXxppopfzqb0xo6dXMKNtNUJeX3A==
X-Received: by 2002:a17:90a:b703:b0:1dd:1e2f:97d7 with SMTP id
 l3-20020a17090ab70300b001dd1e2f97d7mr24902310pjr.62.1656392139103; 
 Mon, 27 Jun 2022 21:55:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 37/60] semihosting: Split out semihost_sys_system
Date: Tue, 28 Jun 2022 10:23:40 +0530
Message-Id: <20220628045403.508716-38-richard.henderson@linaro.org>
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

Split out the non-ARM specific portions of SYS_SYSTEM to a
reusable function.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  3 +++
 semihosting/arm-compat-semi.c  | 12 +---------
 semihosting/syscalls.c         | 40 ++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 21430aa0ef..c9f9e66be1 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -56,4 +56,7 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong oname, target_ulong oname_len,
                          target_ulong nname, target_ulong nname_len);
 
+void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong cmd, target_ulong cmd_len);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 14d37ac9da..7ab6afd7fc 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -507,17 +507,7 @@ void do_common_semihosting(CPUState *cs)
     case TARGET_SYS_SYSTEM:
         GET_ARG(0);
         GET_ARG(1);
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(common_semi_cb, "system,%s", arg0, (int)arg1 + 1);
-            break;
-        }
-        s = lock_user_string(arg0);
-        if (!s) {
-            goto do_fault;
-        }
-        ret = system(s);
-        unlock_user(s, arg0, 0);
-        common_semi_cb(cs, ret, ret == -1 ? errno : 0);
+        semihost_sys_system(cs, common_semi_cb, arg0, arg1 + 1);
         break;
 
     case TARGET_SYS_ERRNO:
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 223916b110..de846ced32 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -165,6 +165,18 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
 }
 
+static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong cmd, target_ulong cmd_len)
+{
+    int len = validate_strlen(cs, cmd, cmd_len);
+    if (len < 0) {
+        complete(cs, -1, -len);
+        return;
+    }
+
+    gdb_do_syscall(complete, "system,%s", cmd, len);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -353,6 +365,24 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(nstr, nname, 0);
 }
 
+static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                        target_ulong cmd, target_ulong cmd_len)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    char *p;
+    int ret;
+
+    ret = validate_lock_user_string(&p, cs, cmd, cmd_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = system(p);
+    complete(cs, ret, ret == -1 ? errno : 0);
+    unlock_user(p, cmd, 0);
+}
+
 /*
  * Static file semihosting syscall implementations.
  */
@@ -619,3 +649,13 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
         host_rename(cs, complete, oname, oname_len, nname, nname_len);
     }
 }
+
+void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong cmd, target_ulong cmd_len)
+{
+    if (use_gdb_syscalls()) {
+        gdb_system(cs, complete, cmd, cmd_len);
+    } else {
+        host_system(cs, complete, cmd, cmd_len);
+    }
+}
-- 
2.34.1


