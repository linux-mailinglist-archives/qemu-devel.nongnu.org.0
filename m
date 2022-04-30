Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3F515DDC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:50:58 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknUv-0000qu-5z
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAe-0004qn-0B
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAc-0006HT-8R
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e24so9298501pjt.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ifeWU+//WzY4yqP3RZk+9v7785I7G9eMl5ZAoLqQLT4=;
 b=pEh7y/5MVkas+1F1UrF93yju2Efwn4zAwDxVIBk/33g/v57H/6Ig0WSx9yvxk3SxPb
 kPeBwlGz/CYzA7uto7EHgP0uD8rrzinkEkSC4ARGztaEWpz3Pdf9dQ1e34Ecd/YbtJ6t
 rWiRh9T9fSSSA4Z1zX+oc6JzKt3AaMKxx2A7vnLziGnJG0jxSSKhHKEGdcI19dniGloX
 KcwIFmPAgMbTC3OJs5JXtrXY3DETa97iBAe0v5Uc19D1P09TwUOR/blC81zHasbbMh3/
 mO2QkyZC+L36mYp9ygSBQ659KKTYHkrf/82VTxDwOKx+gSrUNcIqcHSfK5NG1js0iK2g
 41QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ifeWU+//WzY4yqP3RZk+9v7785I7G9eMl5ZAoLqQLT4=;
 b=W5ovEr5e16U18gXb96k2qladyTut5VHj5RQVRW75BluSjtTJVbn1iClBSda0SiiQ+z
 MnZcbo80XxSzjXBP3apRjmrsXh0uKh74wPzHYglh3pEpd8HryMJWGJj6nULh9gK6zYjQ
 TnwIl7laKn/l6oqfrzDDCtCnHqgcXWX9le8b7h31kBUma8Ke0KhMaO9YOkTmyf+kZshp
 UBKvRMPHO0Ml/Mi+rDaQZ/g1IvSH5oEjojPlambikt6uN4/Yd84xjfSgWfT/g18w+O6U
 f1L1wJpzuoKsFLwh1dcnviLGB1vHuu8YAiLC6tMl6Gp+XTo+gafZdg3D5rwJUMELE9Se
 8IcA==
X-Gm-Message-State: AOAM5300URe7eqHa8XDwXl5zbOdi418HK9OqU6e7sqDw7Jc9o6Ooi5sx
 xtRj0y6Va1mCOQZA9b8Giw+ckKWjksHZaA==
X-Google-Smtp-Source: ABdhPJytl30wMyhuIOUNRTqBj8yOaVy9BYWaaeTPFpsdSY+iBv0Kj4fyjr++HePDa3dxFELAJz8BGA==
X-Received: by 2002:a17:90b:4d0d:b0:1ce:ef5d:f1ef with SMTP id
 mw13-20020a17090b4d0d00b001ceef5df1efmr8909660pjb.91.1651325395215; 
 Sat, 30 Apr 2022 06:29:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/43] semihosting: Split out semihost_sys_close
Date: Sat, 30 Apr 2022 06:29:10 -0700
Message-Id: <20220430132932.324018-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Split out the non-ARM specific portions of SYS_CLOSE to a
reusable function.  This handles all GuestFD.

Note that gdb_do_syscall %x reads target_ulong, not int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  2 ++
 semihosting/arm-compat-semi.c | 41 +-------------------------
 semihosting/guestfd.c         | 54 ++++++++++++++++++++++++++++++++++-
 3 files changed, 56 insertions(+), 41 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 275b91b73a..c38b1d3657 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -54,4 +54,6 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
                        target_ulong fname, target_ulong fname_len,
                        int gdb_flags, int mode);
 
+void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e2decd54e4..f20e84c4f0 100644
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
index 1393279333..c26b1c677e 100644
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
@@ -119,7 +124,7 @@ void dealloc_guestfd(int guestfd)
     GuestFD *gf = do_get_guestfd(guestfd);
 
     assert(gf);
-    gf->type = GuestFDUnused;
+    do_dealloc_guestfd(gf);
 }
 
 /*
@@ -251,3 +256,50 @@ void semihost_sys_open(CPUState *cs, gdb_syscall_complete_cb complete,
         host_open(cs, complete, fname, fname_len, gdb_flags, mode);
     }
 }
+
+static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf)
+{
+    gdb_do_syscall(complete, "close,%x", (target_ulong)gf->hostfd);
+}
+
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
+    do_dealloc_guestfd(gf);
+}
-- 
2.34.1


