Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247E515DE9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:54:23 +0200 (CEST)
Received: from localhost ([::1]:48652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknYE-00088g-L6
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAk-0004yR-5q
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:06 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAh-0006K5-Gy
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:05 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso12765622pjb.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wjsjJKro/B7ogDkOsPzqR4XAGlS7j/Ldrx/QhnOdC5E=;
 b=OfRzmxNe++0g76nMhh5aeBaag0Qsr39zIWssjobQpJYWcI1nxHfO0+t8YvY+sE0aj4
 cmKAuWx/eI9rp//Ey+GpFz7eJjm0b6OyVinz7Wcx8kpGAhLdWnbT/pwQBXEu5OoyTes2
 NH5RHYTl/N0/4LFGAC5iaTbOekmDA8INU+NjCD6t7FYHFjPe+w+VJzyUGSanapu7H5BY
 fpJAXT5TaDU2SfGduvGQFkKL3/UidOo0hPhOU7AkErM69eR49zaXUEA0ilFcu5Uqzu0i
 qYzNQGyCCJn+TKEESaSvNb5d3D/MSP031ICGgcduR9vasiCNGkownlwCSp4wrELvzD7A
 2X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wjsjJKro/B7ogDkOsPzqR4XAGlS7j/Ldrx/QhnOdC5E=;
 b=q/AkXoHtt37xApB1TC8gGcKjnnKuPZpRzLJ9g3YHircDEIfcnSkRPCdj2YkqeybnQN
 yCNY9ULPt+htTm8/uXAR0zqatbt58FsechcIPsAOKhxBRuABHFrRCKDVCGtIobzJbhGK
 MvoTiy0YoyJaZctfcWwAp3jt3sb6+o6rsmxcjNwLrNXuDKZYMGkoLTl4JPIXagyjAviK
 45q6e7QIwLPqiw/EX2WVsRcTPuxS0DIVH0oULznQeUNRnD3FZlwHHkCgPjswMRHpMdDB
 yhz3ZuBXmFrwfj+J7YoYaFrebgur4JLvbEcVtL5pnHpodyRPXTbyCjz8andORESnwydk
 umcA==
X-Gm-Message-State: AOAM530Bbt1iFyUowtkS7m3fj/gY5n+Y51ROq+Xv+KguGNn9HmGQKZzN
 jcDf0bixtJ7RKVtBPQJ/3uM4QYjsT7n8/w==
X-Google-Smtp-Source: ABdhPJwFsawUcwN0TMlRLutC7MqvDwPiM87ku42mz/Jpg1ApW9qCK8Zux7XsQeKO2XBfLnRD2f8Ttg==
X-Received: by 2002:a17:903:241:b0:15c:ee52:cbf2 with SMTP id
 j1-20020a170903024100b0015cee52cbf2mr3908919plh.10.1651325402248; 
 Sat, 30 Apr 2022 06:30:02 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/43] semihosting: Split out semihost_sys_remove
Date: Sat, 30 Apr 2022 06:29:17 -0700
Message-Id: <20220430132932.324018-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Split out the non-ARM specific portions of SYS_REMOVE to a
reusable function.  This doesn't use GuestFD, but it does
reuse validate_strlen() from semihost_sys_open.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  3 +++
 semihosting/arm-compat-semi.c | 13 +-----------
 semihosting/guestfd.c         | 40 +++++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index d362b7ccf0..c31a48598a 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -72,4 +72,7 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
                        gdb_syscall_complete_cb flen_cb,
                        int fd, target_ulong fstat_addr);
 
+void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
+                         target_ulong fname, target_ulong fname_len);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index f9938ac879..d460754ea0 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -472,18 +472,7 @@ void do_common_semihosting(CPUState *cs)
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
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 3a2100585d..17d43e83d3 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -617,3 +617,43 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
         g_assert_not_reached();
     }
 }
+
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


