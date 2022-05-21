Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C288A52F6BE
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:26:18 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCwj-0000HS-Sc
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc8-0008D3-UM
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:11 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc4-00042V-KB
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 202so1967984pfu.0
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WEErp9U3fuLYooIL1EDmPgWGgYpjbgO1xt64/VLw3c=;
 b=I1Fday/h2CjzF7iE7KlD0VKYrqwjHSF/tC1MHoH4Uo8HXWNqaRJ34rjq/09vEdOk21
 C4ngkWP4s0q9qmm6KqeMAxtfWqcpsPmwwERPRInAXZadk/HNTy2kqgURCNeUHc+FJh2M
 s6g2lC6PJs9Ud1i6XK8iVZWD8O2faTfPGfWqeaU0jka2+Jt9Wf+9GiDSMSdECeuE6X4I
 BZTkgamUepE3Q++zhLhXLgTq572p81NrbQtZ11+FrGaiokZHtaOonkWIjTVeXFYrgxjR
 ZbZZfgnh3jNmH/g6mUxAF1TTDZllxsU6kG51HwvzKixJSBPI+8smVfGxl36kYFScMllw
 a97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WEErp9U3fuLYooIL1EDmPgWGgYpjbgO1xt64/VLw3c=;
 b=rQWOqYwLBYQVufGE4oUi3nffz7fVzoeK1l1hL4mIzya3cpg1BCF+4Vr+T7RI86pavR
 iwZJBiX6MZcS6wiFAriPRpeoRiH1fRtEwA2DAHyiOCw2u/oHkStZLPM3/FTjrItksFmP
 HHHdzlCji5pqKTlC2iR/sRVdTDW2Ylv9VnXaUT1cR0Qhrm6m7gdNXU++c5SM9H0YKaqI
 J48fVokuYwrSItrHf7FEYpczg3KWSsbB4m2pgnGzHMk1EI7OKpl93M6Q5/pCpt2LgqAL
 SJLu/jXHNljfVTaJClAr+FGr/EBLCPgil0q6WpThWxD5ArVw6K29qBs/X99oVHDKV9zg
 PMdA==
X-Gm-Message-State: AOAM532LwetWygAlx0jBARJikPs4AVOQxvww6SYh4/iF18TH68J/cX/N
 B0P6PtN376ZHYDQ6m7ym4l2UBJpx3+mhPA==
X-Google-Smtp-Source: ABdhPJwLm3iT1rAfdW0j9ZxuKTnieDokU7L0fsQaa9oxhuwk5l+GvHedPxf9z/7dySFycVme532tkA==
X-Received: by 2002:a63:4204:0:b0:3f6:4a4f:5a96 with SMTP id
 p4-20020a634204000000b003f64a4f5a96mr8324751pga.10.1653091479844; 
 Fri, 20 May 2022 17:04:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 34/49] semihosting: Create semihost_sys_{stat,fstat}
Date: Fri, 20 May 2022 17:03:45 -0700
Message-Id: <20220521000400.454525-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

These syscalls will be used by m68k and nios2 semihosting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/syscalls.h |   7 ++
 semihosting/syscalls.c         | 137 +++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
index c9f9e66be1..ecc97751a9 100644
--- a/include/semihosting/syscalls.h
+++ b/include/semihosting/syscalls.h
@@ -49,6 +49,13 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
                        gdb_syscall_complete_cb flen_cb,
                        int fd, target_ulong fstat_addr);
 
+void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong addr);
+
+void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       target_ulong addr);
+
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len);
 
diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index b6c395af22..7bc2640512 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -93,6 +93,52 @@ static int errno_for_gdb(void)
 #undef E
 }
 
+/*
+ * TODO: Note that gdb always stores the stat structure big-endian.
+ * So far, that's ok, as the only two targets using this are also
+ * big-endian.  Until we do something with gdb, also produce the
+ * same big-endian result from the host.
+ */
+static int copy_stat_to_user(CPUState *cs, target_ulong addr,
+                             const struct stat *s)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    struct gdb_stat *p;
+
+    if (s->st_dev != (uint32_t)s->st_dev ||
+        s->st_ino != (uint32_t)s->st_ino) {
+        return -GDB_EOVERFLOW;
+    }
+
+    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
+    if (!p) {
+        return -GDB_EFAULT;
+    }
+
+    p->gdb_st_dev = cpu_to_be32(s->st_dev);
+    p->gdb_st_ino = cpu_to_be32(s->st_ino);
+    p->gdb_st_mode = cpu_to_be32(s->st_mode);
+    p->gdb_st_nlink = cpu_to_be32(s->st_nlink);
+    p->gdb_st_uid = cpu_to_be32(s->st_uid);
+    p->gdb_st_gid = cpu_to_be32(s->st_gid);
+    p->gdb_st_rdev = cpu_to_be32(s->st_rdev);
+    p->gdb_st_size = cpu_to_be64(s->st_size);
+#ifdef _WIN32
+    /* Windows stat is missing some fields.  */
+    p->gdb_st_blksize = 0;
+    p->gdb_st_blocks = 0;
+#else
+    p->gdb_st_blksize = cpu_to_be64(s->st_blksize);
+    p->gdb_st_blocks = cpu_to_be64(s->st_blocks);
+#endif
+    p->gdb_st_atime = cpu_to_be32(s->st_atime);
+    p->gdb_st_mtime = cpu_to_be32(s->st_mtime);
+    p->gdb_st_ctime = cpu_to_be32(s->st_ctime);
+
+    unlock_user(p, addr, sizeof(struct gdb_stat));
+    return 0;
+}
+
 /*
  * GDB semihosting syscall implementations.
  */
@@ -163,6 +209,19 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
     gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
 }
 
+static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                     target_ulong fname, target_ulong fname_len,
+                     target_ulong addr)
+{
+    int len = validate_strlen(cs, fname, fname_len);
+    if (len < 0) {
+        complete(cs, -1, -len);
+        return;
+    }
+
+    gdb_do_syscall(complete, "stat,%s,%x", fname, len, addr);
+}
+
 static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                        target_ulong fname, target_ulong fname_len)
 {
@@ -351,6 +410,51 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 }
 
+static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf, target_ulong addr)
+{
+    struct stat buf;
+    int ret;
+
+    ret = fstat(gf->hostfd, &buf);
+    if (ret) {
+        complete(cs, -1, errno_for_gdb());
+        return;
+    }
+    ret = copy_stat_to_user(cs, addr, &buf);
+    complete(cs, ret ? -1 : 0, ret ? -ret : 0);
+}
+
+static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                      target_ulong fname, target_ulong fname_len,
+                      target_ulong addr)
+{
+    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+    struct stat buf;
+    char *name;
+    int ret, err;
+
+    ret = validate_lock_user_string(&name, cs, fname, fname_len);
+    if (ret < 0) {
+        complete(cs, -1, -ret);
+        return;
+    }
+
+    ret = stat(name, &buf);
+    if (ret) {
+        err = errno_for_gdb();
+    } else {
+        ret = copy_stat_to_user(cs, addr, &buf);
+        err = 0;
+        if (ret < 0) {
+            err = -ret;
+            ret = -1;
+        }
+    }
+    complete(cs, ret, err);
+    unlock_user(name, fname, 0);
+}
+
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                         target_ulong fname, target_ulong fname_len)
 {
@@ -659,6 +763,39 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
     }
 }
 
+void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong addr)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, GDB_EBADF);
+        return;
+    }
+    switch (gf->type) {
+    case GuestFDGDB:
+        gdb_fstat(cs, complete, gf, addr);
+        break;
+    case GuestFDHost:
+        host_fstat(cs, complete, gf, addr);
+        break;
+    case GuestFDStatic:
+    default:
+        g_assert_not_reached();
+    }
+}
+
+void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       target_ulong addr)
+{
+    if (use_gdb_syscalls()) {
+        gdb_stat(cs, complete, fname, fname_len, addr);
+    } else {
+        host_stat(cs, complete, fname, fname_len, addr);
+    }
+}
+
 void semihost_sys_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong fname, target_ulong fname_len)
 {
-- 
2.34.1


