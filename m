Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D4515DE6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:53:45 +0200 (CEST)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknXc-0006fJ-BV
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAj-0004yK-Ez
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:06 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAg-0006JT-H7
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:04 -0400
Received: by mail-pf1-x431.google.com with SMTP id x23so3772818pff.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/V/5ek2/sTpAJkdwhvVli5OsV2nxpbp/oo1KwpsxAiw=;
 b=KvWVZIAU8RdLIvkgyGatvsVJtUsvXIyjxP+8ZgBKWA/EgDuf/jOv6xhvME0knEQa7k
 S8W+B55NCSMykiasRXDwTTKzrdnqzjSJeq/lM/opl82Qyzi3ym/AmP9xTLrxYLsz9C0/
 /ieRLstx05Y4bsi8VFVUjcvrC8I9tXXpZoCbS309mJeNPnOO9iOG/vNltFccHIkYCAHe
 LqIPJSKdAi0KZQMFlN8xGWInXHEzrGNtztOAkCwBJUx1l441W7LaCHKcIc3QvwCmZ7Db
 s6lMCgZXSNKubwBP2uOrDTJRMwFl8Y8zwdYgC5XRlyi5X2F9GdHz8Sjr8NK/fGg0WpOt
 aNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/V/5ek2/sTpAJkdwhvVli5OsV2nxpbp/oo1KwpsxAiw=;
 b=u2piZwSaYQJ6ED6B6v1zDnBjA2yyzT7HqOu5X12obcg+RqW3SzLc4kT74/uObCERQY
 NrhERleji477H8pEsDACP6xFUtRXXYvolABlP1Wpl6eR6BsHzd50L7tNpuaXoIJX43HN
 qNEQuLteAWcISjh91oYOqBmCKYPvgmwyu4HeStnGLYFWvT0tTgfaorTl6gWH6HZl5KYW
 PLFmzQMeTlpo58ShHtgTUALUlGVyb6qbc9NoaVUCA3iuqW1K7LzbJ/nTOy8pNevWZMfE
 81B5ZvNmLBzDX8boxYRAqmc9bue29XZOeAa+ykXDfqKznolRnU8I36zCfHTPha5c0+xK
 K5WA==
X-Gm-Message-State: AOAM530XTw2x0ihcoT4+LfzdvzASvSxuHFipbLd90OEqn25pgfrU7WuO
 dSfT0fZpHoT+PF7evwSHWYXcFpK+7GELLQ==
X-Google-Smtp-Source: ABdhPJxVxrv6VZXQPp2x7CBpxXRRunAHlta1P/fIvh770Pi3pzmWfd/KAK+6YA1qhwyNaO/Ydc5Ykw==
X-Received: by 2002:a05:6a00:130e:b0:4f3:9654:266d with SMTP id
 j14-20020a056a00130e00b004f39654266dmr3678662pfu.59.1651325401192; 
 Sat, 30 Apr 2022 06:30:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/43] semihosting: Split out semihost_sys_flen
Date: Sat, 30 Apr 2022 06:29:16 -0700
Message-Id: <20220430132932.324018-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

The ARM-specific SYS_FLEN isn't really something that can be
reused by other semihosting apis, but moving the implementation
to guestfd.c means that we can keep the GuestFD stuff together.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |  4 ++
 semihosting/arm-compat-semi.c | 83 ++++++++---------------------------
 semihosting/guestfd.c         | 55 +++++++++++++++++++++++
 3 files changed, 78 insertions(+), 64 deletions(-)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index d3dd081e81..d362b7ccf0 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -68,4 +68,8 @@ void semihost_sys_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
                          int fd);
 
+void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
+                       gdb_syscall_complete_cb flen_cb,
+                       int fd, target_ulong fstat_addr);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 3844d0e376..f9938ac879 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -272,41 +272,25 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 }
 
 static void
-common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
+common_semi_flen_fstat_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract the value. */
-    uint64_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) +
-                        offsetof(struct gdb_stat, gdb_st_size),
-                        &size, 8, 0);
-    size = be64_to_cpu(size);
-    common_semi_cb(cs, -1, err);
-    common_semi_set_ret(cs, size);
-}
-
-/*
- * Types for functions implementing various semihosting calls
- * for specific types of guest file descriptor. These must all
- * do the work and return the required return value to the guest
- * via common_semi_cb.
- */
-typedef void sys_flenfn(CPUState *cs, GuestFD *gf);
-
-static void host_flenfn(CPUState *cs, GuestFD *gf)
-{
-    struct stat buf;
-
-    if (fstat(gf->hostfd, &buf)) {
-        common_semi_cb(cs, -1, errno);
-    } else {
-        common_semi_cb(cs, buf.st_size, 0);
+    if (!err) {
+        /* The size is always stored in big-endian order, extract the value. */
+        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+        uint64_t size;
+        if (get_user_u64(size, common_semi_flen_buf(cs) +
+                         offsetof(struct gdb_stat, gdb_st_size))) {
+            ret = -1, err = EFAULT;
+        } else {
+            /* Undo the tswap from get_user_u64, then swap from BE. */
+            size = be64_to_cpu(tswap64(size));
+            ret = size;
+            if (ret != size) {
+                ret = -1, err = EOVERFLOW;
+            }
+        }
     }
-}
-
-static void gdb_flenfn(CPUState *cs, GuestFD *gf)
-{
-    gdb_do_syscall(common_semi_flen_cb, "fstat,%x,%x",
-                   gf->hostfd, common_semi_flen_buf(cs));
+    common_semi_cb(cs, ret, err);
 }
 
 #define SHFB_MAGIC_0 0x53
@@ -326,27 +310,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void staticfile_flenfn(CPUState *cs, GuestFD *gf)
-{
-    common_semi_cb(cs, gf->staticfile.len, 0);
-}
-
-typedef struct GuestFDFunctions {
-    sys_flenfn *flenfn;
-} GuestFDFunctions;
-
-static const GuestFDFunctions guestfd_fns[] = {
-    [GuestFDHost] = {
-        .flenfn = host_flenfn,
-    },
-    [GuestFDGDB] = {
-        .flenfn = gdb_flenfn,
-    },
-    [GuestFDStatic] = {
-        .flenfn = staticfile_flenfn,
-    },
-};
-
 /*
  * Do a semihosting call.
  *
@@ -365,7 +328,6 @@ void do_common_semihosting(CPUState *cs)
     char * s;
     int nr;
     uint32_t ret;
-    GuestFD *gf;
     int64_t elapsed;
 
     nr = common_semi_arg(cs, 0) & 0xffffffffU;
@@ -478,12 +440,8 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_FLEN:
         GET_ARG(0);
-
-        gf = get_guestfd(arg0);
-        if (!gf) {
-            goto do_badf;
-        }
-        guestfd_fns[gf->type].flenfn(cs, gf);
+        semihost_sys_flen(cs, common_semi_flen_fstat_cb, common_semi_cb,
+                          arg0, common_semi_flen_buf(cs));
         break;
 
     case TARGET_SYS_TMPNAM:
@@ -805,9 +763,6 @@ void do_common_semihosting(CPUState *cs)
         cpu_dump_state(cs, stderr, 0);
         abort();
 
-    do_badf:
-        common_semi_cb(cs, -1, EBADF);
-        break;
     do_fault:
         common_semi_cb(cs, -1, EFAULT);
         break;
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 6ed4a9162d..3a2100585d 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -562,3 +562,58 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
         g_assert_not_reached();
     }
 }
+
+static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf, target_ulong addr)
+{
+    gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
+}
+
+static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
+                      GuestFD *gf)
+{
+    struct stat buf;
+    target_ulong ret;
+
+    if (fstat(gf->hostfd, &buf) < 0) {
+        complete(cs, -1, errno);
+    } else {
+        ret = buf.st_size;
+        if (ret != buf.st_size) {
+            complete(cs, -1, EOVERFLOW);
+        } else {
+            complete(cs, ret, 0);
+        }
+    }
+}
+
+static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
+                            GuestFD *gf)
+{
+    complete(cs, gf->staticfile.len, 0);
+}
+
+void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
+                       gdb_syscall_complete_cb flen_cb, int fd,
+                       target_ulong fstat_addr)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        flen_cb(cs, -1, EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_fstat(cs, fstat_cb, gf, fstat_addr);
+        break;
+    case GuestFDHost:
+        host_flen(cs, flen_cb, gf);
+        break;
+    case GuestFDStatic:
+        staticfile_flen(cs, flen_cb, gf);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.34.1


