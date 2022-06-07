Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BF2541F2D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:44:19 +0200 (CEST)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhvu-0007ub-Rp
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg60-0007pN-AH
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5y-0001aH-IA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so21959886pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C6xp81ranfCqai/DcLj6AIlbJEP0wLff5Junjx60lw0=;
 b=YnjHQsUEFJSG28y/XlrVAJjlqSey+5/zwHsathfp+D3SEbXZ13RPj/VOri88SqfH8E
 c0iHIZAb0jdAHLLqpjRZ51z3fAKSu4G/U8aN6+CQYV2Rvp4/Icb5qPZZjXw5079Pl8rQ
 E30g2H5sSdUBVOMucfixQA6rHzFMPpSzFknPS8H1SWxhPPdY4HRUnirJTlBhHRGx6PXz
 zzL2HvRSk6GPerStzCYSGLRG4IIVjbH6uhTrcfUSe2XZyHGP8QYKwehHgKLT/MJJAXeR
 wvpE1JXaEcaTej712Zs1R8GtoBZHN3seEw/gGuj7CbIRPIAzltx95mgsEJXTZXA5XNj2
 UaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C6xp81ranfCqai/DcLj6AIlbJEP0wLff5Junjx60lw0=;
 b=Sqh8EtGaQGR71djP8XhRx8Qv/MEMWM/wR81OqdBVDHUyQlU+FMPNyUxMpYxwhnI4eY
 u3rTxFvozo5lFN32fDgCHR+x9STiSV1WZ+7wkP8JV+z1aXBzj5ki3mDjv6+oi5D2sWHZ
 UiGV73ZfZBIQN/tJqngZfonrE3qGh0BU7DPqac3v9oJI/7zGAY3i2AXzYtsm8skRUn/A
 9q4SqnrmaBw/byKp9ZR3ToNm6HGK4n7jWdHwqKsstGFkr2MPsB8s529WxeMf5dpM/web
 TGTFp+2Bdv/Wf8GIiZL9TIrT3zKfPgy2KiJ9z0pZOsIpHvs9ceu9xaZes7jrJPEq/21V
 mSNQ==
X-Gm-Message-State: AOAM532RO8abF+LaJIFe2yBlerwwwZPz6c3zPiCc0OusfEem/b6FMsd8
 Tz4KHF/jdShzeajqC66NabVmSjNEnZvkmw==
X-Google-Smtp-Source: ABdhPJx+UY8RGCKOU5ylUPGUoYtNOyfjzrqo7foQ0v7CQmycdqoc4hE1XvXoZnFejbOFH2dzv3E9Ng==
X-Received: by 2002:a17:90b:3b4c:b0:1e8:5e53:2796 with SMTP id
 ot12-20020a17090b3b4c00b001e85e532796mr19247401pjb.184.1654634793143; 
 Tue, 07 Jun 2022 13:46:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 38/53] semihosting: Create semihost_sys_{stat,fstat}
Date: Tue,  7 Jun 2022 13:45:42 -0700
Message-Id: <20220607204557.658541-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index de846ced32..d21064716d 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -63,6 +63,52 @@ static int validate_lock_user_string(char **pstr, CPUState *cs,
     return ret;
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
 /*
  * GDB semihosting syscall implementations.
  */
@@ -133,6 +179,19 @@ static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
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
@@ -321,6 +380,51 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
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
+        complete(cs, -1, errno);
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
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
                         target_ulong fname, target_ulong fname_len)
 {
@@ -629,6 +733,39 @@ void semihost_sys_flen(CPUState *cs, gdb_syscall_complete_cb fstat_cb,
     }
 }
 
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


