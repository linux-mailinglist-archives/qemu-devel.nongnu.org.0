Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57175518E96
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:19:23 +0200 (CEST)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyzS-0006MK-65
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWI-0001w2-Vu
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:15 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWD-0003ay-3f
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id i1so9737491plg.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1rMTJEowh+1/F2+H1eC/4OFTUMesMIGu/YPb8vPE9Cc=;
 b=JQMPilqdU5XA1CU+12ojhec7Jo6T9RO11bYratSyk5/pWdTZpV56CGOODmdgLQI+ri
 Ns5eZ81FxKmKwOedMFOIEHyvZAALPqJ+zjTEccMgTB7vYECx30OryHy5nXzzq9x/RPV7
 f73Uwx/Uy7oDKhRsR4JHvNvbeVheYxlUvpaI6LAkuQhd7diI1f1NBeXg4gkgrsLDgo1Z
 qwSreSmgyBB3ep8oUC9HGmDKhxw7FcF+JKdsUX9FiCTe2sLPYHtwAgADasVjMvnRJSwY
 FOuWLzCY91uKHGBvcrjl3MFBFDRbpGg0sHQgg7jLMZ++DUHqGTyaK+L6aburPslmKDSy
 x/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rMTJEowh+1/F2+H1eC/4OFTUMesMIGu/YPb8vPE9Cc=;
 b=jWfPXHwQXWWT2UO99v0u2WzSGTPb2CsmmNLc+buRAgixI+hObjpiPWKd6+o4icgn4k
 aLk89UEJDPx5Z7pWTLDMkDG3AC+2lxbuX7OVRhXpHTOnvXxnC/MdXP52r0HkrihIOSua
 wrrH6vtNAZitbwfAekkrehLbtuhImGzE06rHSdlmkvbQ8jmOwAceiDNsP2wtuwO7t+4E
 X3D3r9LcELKyAU2jxiVYHqa7y3rAMFyZn67ysUkKao6Rpl4VfTG1ZY5IuQBzQRGf1hpz
 rV+W0muocJ4wBm76lCfxnHc0rb4W4otrOUxG7s5T4A5dS1X92oir4q5UB6vpR/hvb343
 fl5A==
X-Gm-Message-State: AOAM531ZhqzPYVc91ArjRHN4/I/Rj8cQG/zBOhXzi8v6Uj0HMcDQ9m1r
 25Psm2NpzG40LPtqsrvPzQKEmrccbM8Usw==
X-Google-Smtp-Source: ABdhPJyHQDY6ZUmtFIjq+yxQmIagSlfZApCa6S7uV2Brjo9H0P73MFlbukozvflPKx78L+vQ0sOn+Q==
X-Received: by 2002:a17:90b:1c04:b0:1dc:4dfd:5a43 with SMTP id
 oc4-20020a17090b1c0400b001dc4dfd5a43mr6614696pjb.160.1651607347745; 
 Tue, 03 May 2022 12:49:07 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/74] semihosting: Split out semihost_sys_close
Date: Tue,  3 May 2022 12:47:51 -0700
Message-Id: <20220503194843.1379101-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
index 4a2f0c9202..8ebe3aad55 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -277,7 +277,6 @@ common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
  * do the work and return the required return value to the guest
  * via common_semi_cb.
  */
-typedef void sys_closefn(CPUState *cs, GuestFD *gf);
 typedef void sys_writefn(CPUState *cs, GuestFD *gf,
                          target_ulong buf, uint32_t len);
 typedef void sys_readfn(CPUState *cs, GuestFD *gf,
@@ -286,23 +285,6 @@ typedef void sys_isattyfn(CPUState *cs, GuestFD *gf);
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
@@ -363,11 +345,6 @@ static void host_flenfn(CPUState *cs, GuestFD *gf)
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
@@ -415,12 +392,6 @@ static const uint8_t featurefile_data[] = {
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
@@ -469,7 +440,6 @@ static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
 }
 
 typedef struct GuestFDFunctions {
-    sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
@@ -479,7 +449,6 @@ typedef struct GuestFDFunctions {
 
 static const GuestFDFunctions guestfd_fns[] = {
     [GuestFDHost] = {
-        .closefn = host_closefn,
         .writefn = host_writefn,
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
@@ -487,7 +456,6 @@ static const GuestFDFunctions guestfd_fns[] = {
         .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
-        .closefn = gdb_closefn,
         .writefn = gdb_writefn,
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
@@ -495,7 +463,6 @@ static const GuestFDFunctions guestfd_fns[] = {
         .flenfn = gdb_flenfn,
     },
     [GuestFDStatic] = {
-        .closefn = staticfile_closefn,
         .writefn = staticfile_writefn,
         .readfn = staticfile_readfn,
         .isattyfn = staticfile_isattyfn,
@@ -586,13 +553,7 @@ void do_common_semihosting(CPUState *cs)
 
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
index a44d5cbae2..9c4b635317 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -124,6 +124,12 @@ static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -170,6 +176,23 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
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
+        complete(cs, -1, errno_for_gdb());
+    } else {
+        complete(cs, 0, 0);
+    }
+}
+
 /*
  * Syscall entry points.
  */
@@ -184,3 +207,27 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
         host_open(cs, complete, fname, fname_len, gdb_flags, mode);
     }
 }
+
+void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, GDB_EBADF);
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


