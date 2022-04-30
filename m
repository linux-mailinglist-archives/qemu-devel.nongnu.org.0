Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE8D515DF3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:02:35 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkngA-0001yO-7t
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAl-0004yy-J0
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:08 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAj-0006NX-Fc
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id h12so9282238plf.12
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qA/dc39lMp/qfah2YhoKmuHzdA4VCD/D6LCwwGwyU4A=;
 b=aAsXhpdQg4Whxe9rVEPdPbpXlBwznzjH1tOm4GlVEIs0kP+gIburoRnF/K4me7YMVD
 Xq6GkQxwpLYbRAFV29tjy9QtdqY+YAmkBdnsbKbth5+TA7V8q1qRsnSqAJsZiYZ6OqEP
 3nBy5IhUSdIxjkmoSpN20O9cwfi/D6i/RTlNNptv1A7FcMLhY7XG+tkY3e4LGSGPUKhw
 PTQxvSkX/nrNk6PNJf2UFzAKuVsTNAybysJalmpgKU+CyBKgEUEy1o8h8WGYUYpSEDQD
 En3VCt3CXoPpKDQtpOoimrHlBEUpkYEESJP6PZQLO/z0FftYz3/zU/67D9UtwZkC0JP+
 2/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qA/dc39lMp/qfah2YhoKmuHzdA4VCD/D6LCwwGwyU4A=;
 b=KCjUzSUUMeNt49hEZuwCykapSVYOiqRri3lWqy1B6BVvasVz9/Clyfab1xNvR5wGIF
 kTFLNN+NtcFPPLjazcKCLhWpDcQuPHnSe7/TZGLkFmn6q2GSdw5Tn565BokXYQOw9rvY
 7kBlXtCpVefymW+vQTkLQy5JywIvHMoHOFx3RrR8XjSdYlERtmQGqcXcdWZH6SIk9set
 wQU0F1jKcuOpki99jIZ+BLDPv7opkXRjRhw8OmiAEow1OsnysfL2jFUtHghsdVdoQ6xs
 +1pPYqjPyDiGs9P9dYYs9VxYJI0dKbNVuc/76jeEvSPZH0Nei5shHpe+KAHiluIxctIV
 QMLg==
X-Gm-Message-State: AOAM533RYUQBHlBZCoB2MDvuyc5X8wbrsSvbKqOg51DFO2LFcwBbL+fg
 5HX8/FXyHwwDRABgf2uw51rDnaKhwzqung==
X-Google-Smtp-Source: ABdhPJyTa9FSJ1VtjRbiSuemsRejFz4Gs9EAKqCcfuq48PyFLr4bEpdyFvP17Vehep4aSlZMV/ZK/w==
X-Received: by 2002:a17:90a:e641:b0:1da:43b8:95b7 with SMTP id
 ep1-20020a17090ae64100b001da43b895b7mr4213760pjb.180.1651325403858; 
 Sat, 30 Apr 2022 06:30:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/43] semihosting: Split out semihost_sys_system
Date: Sat, 30 Apr 2022 06:29:19 -0700
Message-Id: <20220430132932.324018-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the non-ARM specific portions of SYS_SYSTEM to a
reusable function.  This doesn't use GuestFD, but it does
reuse validate_strlen() from semihost_sys_open.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  3 +++
 semihosting/arm-compat-semi.c | 12 +----------
 semihosting/guestfd.c         | 40 +++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 2bdf02429b..a6d34e8141 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -79,4 +79,7 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong oname, target_ulong oname_len,
                          target_ulong nname, target_ulong nname_len);
 
+void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong cmd, target_ulong cmd_len);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 143c8689f5..61e8dede8d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -495,17 +495,7 @@ void do_common_semihosting(CPUState *cs)
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
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 03e516535a..9176ddd301 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -714,3 +714,43 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
         host_rename(cs, complete, oname, oname_len, nname, nname_len);
     }
 }
+
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


