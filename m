Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C7541E10
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:24:15 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhcV-00004v-0m
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5y-0007hi-8i
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:34 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5w-0001Kf-DW
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:33 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so10191908pgc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4sagk9WK8UfUwwphTVx4M3L/8wzZLywpfR5arWi4wQI=;
 b=MYyB1Oye5aBfoZTGzUF24SryUceyVsyplnCPxZpRHyfy+Otl990DSUU7l1xcUeTWcX
 llLoqMsfUiWKF4TUeBj+71jN2vgJ2UehwWvIBnn4i1yN73y6XsFcT1XlAhcTldg/eIXZ
 RIxaeLyq4523VW7mETDg7GeC8LdQVeomFEqWJV+DbFJ6h/prvoyOFABornSVSaURVUMn
 ZX7/0/MJG7obymda+CP8TOy806kUz7QGw0pOM0xnY4TuZiuZMsw4ZHsoYost0FrKbDby
 gREXXMmDBPJq7XbhpHBQxZL7tvF0nyBWIj6eo7gWqFvYPgMciuxOQRtpZd9UQsACei5K
 Ofsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4sagk9WK8UfUwwphTVx4M3L/8wzZLywpfR5arWi4wQI=;
 b=51FHtrVYRab7t/YuGfpvqInRxt85VXNQyVmqS3tYH62APthSHDssqDP7QWOnComkED
 oOEJ3rKmI5+qVzwdLvYlMydflEFblpox/5T3yl7apnzyhJ4kCTmnxWtop+vVcwuLhenr
 kW4h4bHihNiRyVlY2YALMhpvq+u9pODSr0TfNXqxjvf8fUgDwOu/7tYjOlhOPT4z/9OS
 bu0xbCQxGvfIGfMASNMYzuVp4pEw0fjV5fkJVebg3+YbFo/vjcZwYjEMlffynbscc9IE
 7noe97Vo7BMJusMEWo+SN6GpHc1abWFYsEfMnok/BQUI6I8UcGaZvwq8hGMmJ6Hw2e/R
 AhpA==
X-Gm-Message-State: AOAM532CE3R9PdYT61TnlgRhpIu0SU3f/f1yRCXJoIwV3boLRPs0nXEh
 Z7WoQmkxVhV7outnuxKsJMFbLJ1+0Lc6KA==
X-Google-Smtp-Source: ABdhPJw/pgDmQi1Bx8rSHlYhiyA8u/2DcyIHime8BtgGbG7leVd5GMZSXgIFLO+jwtwax7KfNCONUw==
X-Received: by 2002:a05:6a00:2809:b0:51b:f239:d24d with SMTP id
 bl9-20020a056a00280900b0051bf239d24dmr20127354pfb.73.1654634790655; 
 Tue, 07 Jun 2022 13:46:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/53] semihosting: Split out semihost_sys_remove
Date: Tue,  7 Jun 2022 13:45:39 -0700
Message-Id: <20220607204557.658541-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 81dd22e1c5..6c9d50176a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -483,18 +483,7 @@ void do_common_semihosting(CPUState *cs)
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


