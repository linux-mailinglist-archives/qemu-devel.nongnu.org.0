Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DC515DDB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:50:53 +0200 (CEST)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknUq-0000mJ-Qh
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAl-0004z0-QC
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:08 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAk-0006VJ-0E
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:07 -0400
Received: by mail-pg1-x52d.google.com with SMTP id z21so8514575pgj.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzhRI9ZBMDbSjvbxlK4evTeTziJ0fFpirvhUh0Y9F/o=;
 b=xUQXwGJOmwyCFP9VQvwle5SAyxVEzVvT5jy7ReNbeQdilaqYY8EzhH6xTfMWoLk6cG
 k5aqtfKQItefka1WwZaCihavADzj3DfX3/zlKeyk1dU6ybpustq348nHAMHDRMvA+Ica
 A369e9N6Ur72ou4iogafQ3Lwd13eCNx1J5jBHQRdftYSsNPox3iRpRq3TGM0enPzfLSS
 3rLClbVRhhe1R2Znky3pZsqY/STr0Pmo37XHd+IuzNrlCuVU8sTCMIjNorsY71q+nFvH
 7ZR6fWcdblTxsv5o5qd/ChFc1XlUbTdUmN/g6agXn49TKe+XohbfwkDOHkqCgsFtDIE6
 v83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzhRI9ZBMDbSjvbxlK4evTeTziJ0fFpirvhUh0Y9F/o=;
 b=az+iTPIrnCNXkOTkzPDwAtOzcYtkUnvifnaC3mTD/s02iJabVFzWQxuDcqpzZch07Y
 oqz8SHN3S6wGiJU+odjCi0FOBIRt7tezDqv348onN6Zs//z0x4w6DJo1V0JHt1z8dvB+
 +sfn0Vd5skVbDCES0Z3mw7VYmgpK2qYs6gfKyS5V/4KpxefFfpl9BPoRdIrzTSHQ/rMC
 UgdjerYPEb2y2VbJkTHadi0/KaRht8F9OgIaBoDHJrd/EXT64a5Z1p8TLIyhSXqUN8l5
 2JsFuud0ypyFr3rw/Mvr/ufvrKkGYa5w3fGqkrhO61h/6WchkDI/n9o5E/pxOtUxGLuk
 ILqw==
X-Gm-Message-State: AOAM531UsIa2nZWKNHq7I+tlrbdXMZjmBNKIbdHftiQWn5Y88j75lacz
 FwkISS2LykIygemVI3jZvksAvhzzWabKxQ==
X-Google-Smtp-Source: ABdhPJz6ikL93NRqiCuAhYEbooq7dAHCoV+y5wre2Gz06JyQEZs1HoukDldOjGdkIgcO+oRmMaPJXg==
X-Received: by 2002:a63:500a:0:b0:3c1:afc5:1213 with SMTP id
 e10-20020a63500a000000b003c1afc51213mr3199257pgb.148.1651325404721; 
 Sat, 30 Apr 2022 06:30:04 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/43] semihosting: Create semihost_sys_{stat,fstat}
Date: Sat, 30 Apr 2022 06:29:20 -0700
Message-Id: <20220430132932.324018-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

These syscalls will be used by m68k and nios2 semihosting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/guestfd.h |   7 ++
 semihosting/guestfd.c         | 137 ++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index a6d34e8141..315cac1c44 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -82,4 +82,11 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
 void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
                          target_ulong cmd, target_ulong cmd_len);
 
+void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong addr);
+
+void semihost_sys_stat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       target_ulong fname, target_ulong fname_len,
+                       target_ulong addr);
+
 #endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 9176ddd301..c182d5b7e6 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -563,12 +563,95 @@ void semihost_sys_isatty(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
     }
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
+        return -EOVERFLOW;
+    }
+
+    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
+    if (!p) {
+        return -EFAULT;
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
 static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
                       GuestFD *gf, target_ulong addr)
 {
     gdb_do_syscall(complete, "fstat,%x,%x", (target_ulong)gf->hostfd, addr);
 }
 
+static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                       GuestFD *gf, target_ulong addr)
+{
+    struct stat buf;
+    int ret;
+
+    ret = fstat(gf->hostfd, &buf);
+    if (ret) {
+        complete(cs, -1, errno);
+        return;
+    }
+    ret = copy_stat_to_user(cs, addr, &buf);
+    complete(cs, ret ? -1 : 0, ret ? -ret : 0);
+}
+
+void semihost_sys_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
+                        int fd, target_ulong addr)
+{
+    GuestFD *gf = get_guestfd(fd);
+
+    if (!gf) {
+        complete(cs, -1, EBADF);
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
 static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
                       GuestFD *gf)
 {
@@ -754,3 +837,57 @@ void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
         host_system(cs, complete, cmd, cmd_len);
     }
 }
+
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
+        err = errno;
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
-- 
2.34.1


