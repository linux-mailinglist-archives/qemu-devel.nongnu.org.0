Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BD55BEE1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:55:18 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6581-0001gK-Pc
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GK-00041C-Ou
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:44 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63GI-0000Gx-LC
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:44 -0400
Received: by mail-pf1-x436.google.com with SMTP id 65so10913129pfw.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xz1GJ2vpyUefp+d9+tObRooQRvZARHWKCaa2fidKEx8=;
 b=YDO3MAWruLzbZK7abyxVaacC0k/lCnj7r3IJU0rGn1C/jb7glnu5+k0C5Mjt5wCC+e
 EaHcneY7uAMgi/7d2K6cb7yikrTvxJRoae/t3ibsUB9RYuaL6IfmHSHElP1vjtqemlvO
 rVEtD0LKMM7TkM1DNl/rdkCAPZFT9mdxhh4JJb5VBht/yZqR7Rk8D9GFqlv29blxti2s
 piRvdiX8Y/PjEyDx/lsqHJ6aRxsNMfXfjjokYrLqN4inOkam03Sn1OFH0ydqYuj43gXR
 W1QC4X6eEc03aAEX3oZqk06O5Lk5FRGhNrX+ReocERztOCoznXK0NCa3JEkoqd9E3cdD
 fOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xz1GJ2vpyUefp+d9+tObRooQRvZARHWKCaa2fidKEx8=;
 b=kFQ1PAyACRogH+ruCSlwcLf9oJwWAU5bDi3Z0/hZ+zVk8QnOhIf7Vzk3wtetcrScaa
 zHtZYLK66xVAqXfxaXvgDdHKQoorirTKrE+FAhRh3xY/mKOmE67FJaiI/c7cc77Y+Kqh
 O4o+pwr+B8b40oF8zl8rUqeo9LF8rL/EnvoY4EhDCPPfyvqBTba3HdZYJCQpzI8treXC
 FM1ds1LmamnuOBAmRvR1nwCL80LqQ73vNGKUDtqRxqt4g29m5VRk70ngMaw8Nfjl0KK8
 6Z+srEXL90RR6vk4aA0aCxcLqCbrO7QC4lT8iBfgf2/TZ7Ee55qWs3n5bxEdF0a789F0
 8YDA==
X-Gm-Message-State: AJIora+dk6XP+cph67OcKKpIDXm39hT1w3GDnxxZt0UmvjY1ehmWwkOr
 +v5WvGMbkMMt5Sh/6KzV1fcfBr0EezOgTw==
X-Google-Smtp-Source: AGRyM1tegbcePlFNWHYVIL4Q9h3/VdFQZF8QKYUajPXqH2FAKvnFh9KrnVMnUECpfW1Z5fS4mZr1xw==
X-Received: by 2002:a62:1652:0:b0:525:4253:6f5a with SMTP id
 79-20020a621652000000b0052542536f5amr2747195pfw.59.1656392141343; 
 Mon, 27 Jun 2022 21:55:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 38/60] semihosting: Create semihost_sys_{stat,fstat}
Date: Tue, 28 Jun 2022 10:23:41 +0530
Message-Id: <20220628045403.508716-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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


