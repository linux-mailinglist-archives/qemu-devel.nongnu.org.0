Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D8541EC6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:36:05 +0200 (CEST)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhnw-000234-4B
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5s-0007RM-LX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:28 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5p-0001W8-P7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:28 -0400
Received: by mail-pg1-x536.google.com with SMTP id 184so1031052pga.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b+MA80j3xqUJAkmx63/7RsbQGAdy+LQJceEO3bo0dWc=;
 b=DnP9AeQ580A63IXqN3y6e0uHrih8l1w4ja0Ywl/a9LgklI5fgfsdmgapdCdrUzYKHv
 vvHgPKHbfJlxCtY7AKBVEmyH7ztXSjkH7jYSnb0f0Lfr7e8K2XDdBRg+vIm6KJDVZYVc
 AyCEzKBZtsVcxTAXwwpjWKU/vm7+x6NRr6OauwHbWt7V03a826lbRv4j/4ddjvGKcNKR
 EGYOwy/RnmxyCHANtrVCxGqp2sFxdkZuFhD5kzcY2xIdBMc9blU6LDKNG1xYBYZos6WN
 zmmM8aQL658oQ3qqtdwhUSJh64v/6bx7hQpvVKLav3+wjZObPNHbA9wryqOqIBXSwfaP
 10KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+MA80j3xqUJAkmx63/7RsbQGAdy+LQJceEO3bo0dWc=;
 b=dGsFaY+lgpPFMfCq9fKbR19Ey5YMLbAEz5l03XL5je4Jg7Ivsx1mA4mGjpey3PEiV3
 kcTsuJbUyvdU51zMvvUfZ1rmh/t1LdgzHC3v4bBofaIUlVaLuYsdf+JZFVQI2pqmB+qr
 PQs6fJeOaZe4WzkhHvsD7UBm3qixRQYKufl6Zi+hlU0vVBGVCpTmZcjz5RIdjciDGAlY
 wUYYMgFakGCzk0dAUCN6R2hk7qDQRuao8TA7fNk/UgUcR9Wh2dH446KOnpXbezx8oRcF
 9vFyeaBN7CSEq6Qsg3/pM9Nv2A/BNPBqxVAy8hZmlhzgkkzkr4XS/XgJClLftkyuRrCm
 e9Lw==
X-Gm-Message-State: AOAM5324HOki8tfb4moa6njqbytEEQwLQiWFVwE3qidfwTpveBHCW01Y
 B4Rov0+qJIwWzABJ1iJJlEqz7BFVr23uSQ==
X-Google-Smtp-Source: ABdhPJy0CFc+JxZl0WVbqK1LQSGj7jenbosBiCUJMYHSmZf/loSRk801PsYoPfFtU5iHvqzwEBUu0w==
X-Received: by 2002:a05:6a00:1687:b0:518:6c6b:6a9a with SMTP id
 k7-20020a056a00168700b005186c6b6a9amr31173903pfc.81.1654634784370; 
 Tue, 07 Jun 2022 13:46:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/53] semihosting: Split out semihost_sys_close
Date: Tue,  7 Jun 2022 13:45:32 -0700
Message-Id: <20220607204557.658541-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Split out the non-ARM specific portions of SYS_CLOSE to a
reusable function.  This handles all GuestFD.

Note that gdb_do_syscall %x reads target_ulong, not int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |  3 +++
 semihosting/arm-compat-semi.c  | 41 +----------------------------
 semihosting/guestfd.c          |  7 ++++-
 semihosting/syscalls.c         | 47 ++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 41 deletions(-)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index 991658bf79..00e718f11d 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -22,4 +22,7 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
                        target_ulong fname, target_ulong fname_len,
                        int gdb_flags, int mode);
 
+void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd);
+
 #endif /* SEMIHOSTING_SYSCALLS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 3239eda513..a6dddb2aa2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -276,7 +276,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * do the work and return the required return value to the guest
  * via common_semi_cb.
  */
-typedef void sys_closefn(CPUState *cs, GuestFD *gf);
 typedef void sys_writefn(CPUState *cs, GuestFD *gf,
                          target_ulong buf, uint32_t len);
 typedef void sys_readfn(CPUState *cs, GuestFD *gf,
@@ -285,23 +284,6 @@ typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
 typedef void sys_seekfn(CPUState *cs, GuestFD *gf, target_ulong offset);
 typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
 
-static void host_closefn(CPUState *cs, GuestFD *gf)
-{
-    int ret;
-    /*
-     * Only close the underlying host fd if it's one we opened on behalf
-     * of the guest in SYS_OPEN.
-     */
-    if (gf->hostfd == STDIN_FILENO ||
-        gf->hostfd == STDOUT_FILENO ||
-        gf->hostfd == STDERR_FILENO) {
-        ret = 0;
-    } else {
-        ret = close(gf->hostfd);
-    }
-    common_semi_cb(cs, ret, ret ? errno : 0);
-}
-
 static void host_writefn(CPUState *cs, GuestFD *gf,
                          target_ulong buf, uint32_t len)
 {
@@ -362,11 +344,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
     }
 }
 
-static void gdb_closefn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_cb, "close,%x", gf->hostfd);
-}
-
 static void gdb_writefn(CPUState *cs, GuestFD *gf,
                         target_ulong buf, uint32_t len)
 {
@@ -414,12 +391,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_closefn(CPUState *cs, GuestFD *gf)
-{
-    /* Nothing to do */
-    common_semi_cb(cs, 0, 0);
-}
-
 static void staticfile_writefn(CPUState *cs, GuestFD *gf,
                                target_ulong buf, uint32_t len)
 {
@@ -468,7 +439,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 }
 
 typedef struct GuestFDFunctions {
-    sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
@@ -478,7 +448,6 @@ typedef struct GuestFDFunctions {
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
-        .closefn = host_closefn,
         .writefn = host_writefn,
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
@@ -486,7 +455,6 @@ static const GuestFDFunctions guestfd_fns[] = {
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
-        .closefn = gdb_closefn,
         .writefn = gdb_writefn,
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
@@ -494,7 +462,6 @@ static const GuestFDFunctions guestfd_fns[] = {
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
-        .closefn = staticfile_closefn,
         .writefn = staticfile_writefn,
         .readfn = staticfile_readfn,
         .isattyfn = staticfile_isattyfn,
@@ -585,13 +552,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_CLOSE:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].closefn(cs, gf);
-        dealloc_guestfd(arg0);
+        semihost_sys_close(cs, common_semi_cb, arg0);
         break;
 
     case TARGET_SYS_WRITEC:
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 7ac2e147a8..e3122ebba9 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -49,6 +49,11 @@ int alloc_guestfd(void)
     return i;
 }
 
+static void do_dealloc_guestfd(GuestFD *gf)
+{
+    gf->type = GuestFDUnused;
+}
+
 /*
  * Look up the guestfd in the data structure; return NULL
  * for out of bounds, but don't check whether the slot is unused.
@@ -119,5 +124,5 @@ void dealloc_guestfd(int guestfd)
     GuestFD *gf = do_get_guestfd(guestfd);
 
     assert(gf);
-    gf->type = GuestFDUnused;
+    do_dealloc_guestfd(gf);
 }
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 9f9d19a59a..3648b9dd49 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -94,6 +94,12 @@ static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
                    fname, len, (target_ulong)gdb_flags, (target_ulong)mode);
 }
 
+static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf)
+{
+    gdb_do_syscall(complete, "close,%x", (target_ulong)gf->hostfd);
+}
+
 /*
  * Host semihosting syscall implementations.
  */
@@ -140,6 +146,23 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
     unlock_user(p, fname, 0);
 }
 
+static void host_close(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf)
+{
+    /*
+     * Only close the underlying host fd if it's one we opened on behalf
+     * of the guest in SYS_OPEN.
+     */
+    if (gf->hostfd != STDIN_FILENO &&
+        gf->hostfd != STDOUT_FILENO &&
+        gf->hostfd != STDERR_FILENO &&
+        close(gf->hostfd) < 0) {
+        complete(cs, -1, errno);
+    } else {
+        complete(cs, 0, 0);
+    }
+}
+
 /*
  * Syscall entry points.
  */
@@ -154,3 +177,27 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
         host_open(cs, complete, fname, fname_len, gdb_flags, mode);
     }
 }
+
+void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_close(cs, complete, gf);
+        break;
+    case GuestFDHost:
+        host_close(cs, complete, gf);
+        break;
+    case GuestFDStatic:
+        complete(cs, 0, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    dealloc_guestfd(fd);
+}
-- 
2.34.1


