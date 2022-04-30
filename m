Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEF515DCA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:43:09 +0200 (CEST)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknNN-0005dI-1T
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAV-0004ly-PM
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:56 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAS-0006Fz-K3
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:50 -0400
Received: by mail-pf1-x432.google.com with SMTP id y38so9057443pfa.6
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7WLR0F1itSeL1D48lB12rI6iLH/uoOr7m0MR0rWKoM=;
 b=T7CoM01YNVS77MrHESTFuiw4aqmwC0ymAhMNvJ8+i0tbXf+K3pA8f0ePAKMceb86d9
 2Mf4HrAytn2+htYPN10wWdEmIUyU12eDVCCim6DBt9e1JAfI32t15E3/Q/xbWC+aHWI5
 2PVvZx6aX2lWfY7GVjK/QsOccg8TI8T+L9FjUjfNP/Qf8xOdhKVG34lXffc3zEsrOtEU
 7jgNwujOeyHBZY93h9IrmrR6zoRXrD4eUEtnEHhlXzQE6ionDekajiqhOn1izKk6EGIq
 g0v25IuVblCCSSmgUEH1GHQ/LgHtZw3FI+QXvUV6NEhHLF+vp3Cx1CU5BWUnRjOR1e+K
 gtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7WLR0F1itSeL1D48lB12rI6iLH/uoOr7m0MR0rWKoM=;
 b=7v1dAOnr6NGo+WNIUFw6tZYrzu3EsixUOldUXwWBJTGPI3bnxH+nOjZ/I44R5ffNoB
 6YesrwRnd3JpvQNBYf/iKlkpVEdfvG9bIjHngz9Dz3r53hCEn7YEYgR6mDXv/FXX3unj
 tFqQ5q/TVW+inOAzQKXwwlcirqF8yiSgf3ky6ddYArn9vjdkYINos8dhLnt9dUAyMhBk
 Py4GAdcwQu9Cp9r2nUlZHlukQjO4HIMzRT6sCEm2DmAm13XmL1pOi5sHxn3rZNa1YuY1
 gHyF1gm7fwt6GkXeWv3lc1NJuIww452ez3hpUUbqk21wvaT2Rc9ijEomLKlqDrOjQ12F
 UJoQ==
X-Gm-Message-State: AOAM532DXc1DtxPderP03ak5VXOVJokI+ztFl+nrJFI5uzobgp6EARrH
 f72UvgzHdKF9Ak6kR6hB1fyyFPewGALdzQ==
X-Google-Smtp-Source: ABdhPJw8XrTz0WYu6KN2ji+J/+Bvx6MxE39IM5LqfFKN17RAXjbXX+w3cO9KTGIjtr6LZH+hOHNbtA==
X-Received: by 2002:a63:4d64:0:b0:39d:5e6e:242d with SMTP id
 n36-20020a634d64000000b0039d5e6e242dmr3193529pgl.32.1651325387237; 
 Sat, 30 Apr 2022 06:29:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/43] include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
Date: Sat, 30 Apr 2022 06:29:02 -0700
Message-Id: <20220430132932.324018-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

We have two copies of these structures, and require them
in semihosting/ going forward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h    | 25 +++++++++++++++++++++++++
 target/m68k/m68k-semi.c   | 30 +++---------------------------
 target/nios2/nios2-semi.c | 30 +++---------------------------
 3 files changed, 31 insertions(+), 54 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 2aaba9c723..33a262a5a3 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -20,6 +20,31 @@
 #define GDB_O_TRUNC   0x400
 #define GDB_O_EXCL    0x800
 
+/* For gdb file i/o stat/fstat. */
+typedef uint32_t gdb_mode_t;
+typedef uint32_t gdb_time_t;
+
+struct gdb_stat {
+  uint32_t    gdb_st_dev;     /* device */
+  uint32_t    gdb_st_ino;     /* inode */
+  gdb_mode_t  gdb_st_mode;    /* protection */
+  uint32_t    gdb_st_nlink;   /* number of hard links */
+  uint32_t    gdb_st_uid;     /* user ID of owner */
+  uint32_t    gdb_st_gid;     /* group ID of owner */
+  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
+  uint64_t    gdb_st_size;    /* total size, in bytes */
+  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
+  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
+  gdb_time_t  gdb_st_atime;   /* time of last access */
+  gdb_time_t  gdb_st_mtime;   /* time of last modification */
+  gdb_time_t  gdb_st_ctime;   /* time of last change */
+} QEMU_PACKED;
+
+struct gdb_timeval {
+  gdb_time_t tv_sec;  /* second */
+  uint64_t tv_usec;   /* microsecond */
+} QEMU_PACKED;
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 475a6b13b7..da0186f3ef 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -45,30 +45,6 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
-typedef uint32_t gdb_mode_t;
-typedef uint32_t gdb_time_t;
-
-struct m68k_gdb_stat {
-  uint32_t    gdb_st_dev;     /* device */
-  uint32_t    gdb_st_ino;     /* inode */
-  gdb_mode_t  gdb_st_mode;    /* protection */
-  uint32_t    gdb_st_nlink;   /* number of hard links */
-  uint32_t    gdb_st_uid;     /* user ID of owner */
-  uint32_t    gdb_st_gid;     /* group ID of owner */
-  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
-  uint64_t    gdb_st_size;    /* total size, in bytes */
-  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
-  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
-  gdb_time_t  gdb_st_atime;   /* time of last access */
-  gdb_time_t  gdb_st_mtime;   /* time of last modification */
-  gdb_time_t  gdb_st_ctime;   /* time of last change */
-} QEMU_PACKED;
-
-struct gdb_timeval {
-  gdb_time_t tv_sec;  /* second */
-  uint64_t tv_usec;   /* microsecond */
-} QEMU_PACKED;
-
 static int translate_openflags(int flags)
 {
     int hf;
@@ -90,9 +66,9 @@ static int translate_openflags(int flags)
 
 static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
 {
-    struct m68k_gdb_stat *p;
+    struct gdb_stat *p;
 
-    if (!(p = lock_user(VERIFY_WRITE, addr, sizeof(struct m68k_gdb_stat), 0)))
+    if (!(p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0)))
         /* FIXME - should this return an error code? */
         return;
     p->gdb_st_dev = cpu_to_be32(s->st_dev);
@@ -114,7 +90,7 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
     p->gdb_st_atime = cpu_to_be32(s->st_atime);
     p->gdb_st_mtime = cpu_to_be32(s->st_mtime);
     p->gdb_st_ctime = cpu_to_be32(s->st_ctime);
-    unlock_user(p, addr, sizeof(struct m68k_gdb_stat));
+    unlock_user(p, addr, sizeof(struct gdb_stat));
 }
 
 static void m68k_semi_return_u32(CPUM68KState *env, uint32_t ret, uint32_t err)
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 0eec1f9a1c..3e504a6c5f 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -47,30 +47,6 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
-typedef uint32_t gdb_mode_t;
-typedef uint32_t gdb_time_t;
-
-struct nios2_gdb_stat {
-  uint32_t    gdb_st_dev;     /* device */
-  uint32_t    gdb_st_ino;     /* inode */
-  gdb_mode_t  gdb_st_mode;    /* protection */
-  uint32_t    gdb_st_nlink;   /* number of hard links */
-  uint32_t    gdb_st_uid;     /* user ID of owner */
-  uint32_t    gdb_st_gid;     /* group ID of owner */
-  uint32_t    gdb_st_rdev;    /* device type (if inode device) */
-  uint64_t    gdb_st_size;    /* total size, in bytes */
-  uint64_t    gdb_st_blksize; /* blocksize for filesystem I/O */
-  uint64_t    gdb_st_blocks;  /* number of blocks allocated */
-  gdb_time_t  gdb_st_atime;   /* time of last access */
-  gdb_time_t  gdb_st_mtime;   /* time of last modification */
-  gdb_time_t  gdb_st_ctime;   /* time of last change */
-} QEMU_PACKED;
-
-struct gdb_timeval {
-  gdb_time_t tv_sec;  /* second */
-  uint64_t tv_usec;   /* microsecond */
-} QEMU_PACKED;
-
 static int translate_openflags(int flags)
 {
     int hf;
@@ -102,9 +78,9 @@ static int translate_openflags(int flags)
 static bool translate_stat(CPUNios2State *env, target_ulong addr,
                            struct stat *s)
 {
-    struct nios2_gdb_stat *p;
+    struct gdb_stat *p;
 
-    p = lock_user(VERIFY_WRITE, addr, sizeof(struct nios2_gdb_stat), 0);
+    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
 
     if (!p) {
         return false;
@@ -128,7 +104,7 @@ static bool translate_stat(CPUNios2State *env, target_ulong addr,
     p->gdb_st_atime = cpu_to_be32(s->st_atime);
     p->gdb_st_mtime = cpu_to_be32(s->st_mtime);
     p->gdb_st_ctime = cpu_to_be32(s->st_ctime);
-    unlock_user(p, addr, sizeof(struct nios2_gdb_stat));
+    unlock_user(p, addr, sizeof(struct gdb_stat));
     return true;
 }
 
-- 
2.34.1


