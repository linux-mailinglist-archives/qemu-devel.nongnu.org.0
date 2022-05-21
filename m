Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424ED52F727
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:55:06 +0200 (CEST)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDOb-0007xU-Cr
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCc6-0008CA-Ct
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:05:00 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbY-000408-E0
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:48 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so9051593pjq.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o7WLR0F1itSeL1D48lB12rI6iLH/uoOr7m0MR0rWKoM=;
 b=cNUHDmDNyq+Ai9EELn3N5NwNo+tJRt6FtwsKwSpJHHrWz96WETSqad8TWgt30bmTfN
 8AsjlPzQIv0SFtW7EYJ2DXJr4tn2c3w2Cy6lqLISsUJ7b7gkfxqZNGfl9rZFUQ7JiM6Y
 AiOdbDSG7jV7Cd4jE4t2kvhpQJYTW6bya7/w4f/2HGYLe5jkIsNjZpPaW3eM1Y4c7u2K
 NS2YuJcGDBpLQtJye95oiKC0r4f8o+4+pQrh1pOYpki1hrFHhVMFpg6Ode0lmUlTv8WF
 QK68950tH2TViVw1zh9qs0mZOUO0ocwRCjYnsgkUmrjXxrDDZT8q9pCVk9wjB9vnnFQ6
 UdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7WLR0F1itSeL1D48lB12rI6iLH/uoOr7m0MR0rWKoM=;
 b=1QrMHbqNS/HNl3rblYVO3Pbq+CTC1CL44hojux0l8jKm3tIHaBAD0G/PWpycKbi1ey
 oNc9TwSY6xgnMJvQJUjji/Zd3wjug79lLUaxGzonDvOIhnU7126ubZmYp5498fqshmOc
 UhmQKyFXGXYz21NvJ0KyuRmuQ0XnVaeDD6Rysm10hHlRDv+a/whChJy6WYjBuzia4m18
 V6dTEO6YUtFQTFzJo6ePWwziHEXRWs+fLCNQLsWBhb9jQ+wPacCv/iRvYY6jqVBgGnnL
 8OOcEP9ZzZY/6O7HJObSf80HJEMF9qkC3WYsYGaTsyMFJMH0+JezMafCPaIcPP7+H7ZW
 hRlA==
X-Gm-Message-State: AOAM530ckQOlZOZ4JdfHUIWUTCvqKEOv4Mf0PXQ4nMd1B7itPxNOyI6Y
 Rby+Pu+xhQekVoEI3WHyN36XZ77scmck3w==
X-Google-Smtp-Source: ABdhPJx+gRxTsf9CqjN3L7IZbU0dfMH3ag3qpeZO+vAzz22oIz/ACdCGwf6NUIOj8rogvEpl9y7b4g==
X-Received: by 2002:a17:902:ea0a:b0:161:fb2f:ef9b with SMTP id
 s10-20020a170902ea0a00b00161fb2fef9bmr3301166plg.22.1653091460357; 
 Fri, 20 May 2022 17:04:20 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 15/49] include/exec: Move gdb_stat and gdb_timeval to
 gdbstub.h
Date: Fri, 20 May 2022 17:03:26 -0700
Message-Id: <20220521000400.454525-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


