Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89855BEC1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:29:36 +0200 (CEST)
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64j6-0005qw-UM
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FT-0003DQ-RB
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FS-0008Ks-02
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so6016270pji.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxNDqSzg5Hw13giw27gxbf2VZjOoolDUxgjGkiB+OjI=;
 b=ndTeFlB+l0d7nq/d0xZcknu9utwtxMmJ6hW7VdpcxJInFEABVVykGMvYr9ZgaaO11m
 m6W+HloFIhyquXhQgFx6JtLnrfnNvHFchRl/ng7vwHdTYmto/u1poZQkKGEZ8aSd2c9I
 9CiK4pongDLmnKZHuXXsw+RQTs0B39WeVxexiWSxtPz8L1rblcbBYp8LOnGOFPcZB9xy
 6Xum74LQ8RmLlhn/qBbYxIWzvnkFwRCo0s8SAZ5g6D+JoEv82NTAlJhiAeDcmajEOs7H
 GlkGFj+H5Yn22UtFg7tESv9996QpciTseD7ZfQTcUYUuC7NEr7tiVGhB2P8qsa6dtNED
 Vgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxNDqSzg5Hw13giw27gxbf2VZjOoolDUxgjGkiB+OjI=;
 b=4ZlL/5a39jolFLmbi/9yYCAyvrDEK0H39w/Xilni6geXcpMuGDOUnxXP8BC/U55Zov
 OYL/qc/+XW4UuQBZ32Pcblf6397XOLXx51Mz7CaiPePxf4Fd8SzsVCKxU8L8cFvxAMlG
 u9Beaq31nujYZdpSlNok1Pm6x3iyOrElTmOGKofoOWTRpMqSI4e3mn0gq1hcSoAz0Ilm
 vKeGUbs/TiB2bq/ubzl9XlDf2LZ1oJQ7FqjstWfoEh6AOzBzAleHIL+pDVyDFrRI6aa+
 oF07TPYWF8re+o8roDT2BxIs2oo9X5rRIqn7fSfkod9SnmrofojEtpQa5oOGWyZdMNNp
 jw+g==
X-Gm-Message-State: AJIora+MKVqMbRbQAV8nzgkAHey4Q96e/XbalFmH3YjoJb3uBDx7alSX
 huxk2EM/2NLqqpPHLX7u4cGhSPT1kUIY9Q==
X-Google-Smtp-Source: AGRyM1vRbOqeFsHdMV8GyRdv2iBk6E3qIyMHHq04SUlC+FRE7ziae1rjFNn5iGk8FkRGG01sNn4PMg==
X-Received: by 2002:a17:90b:1982:b0:1ec:988f:e133 with SMTP id
 mv2-20020a17090b198200b001ec988fe133mr25462090pjb.211.1656392088748; 
 Mon, 27 Jun 2022 21:54:48 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/60] include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
Date: Tue, 28 Jun 2022 10:23:20 +0530
Message-Id: <20220628045403.508716-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

We have two copies of these structures, and require them
in semihosting/ going forward.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gdbstub.h    | 25 +++++++++++++++++++++++++
 target/m68k/m68k-semi.c   | 32 +++++---------------------------
 target/nios2/nios2-semi.c | 30 +++---------------------------
 3 files changed, 33 insertions(+), 54 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 603e22ae80..7413ffeba2 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -19,6 +19,31 @@
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
index 475a6b13b7..b886ebf714 100644
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
@@ -90,11 +66,13 @@ static int translate_openflags(int flags)
 
 static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
 {
-    struct m68k_gdb_stat *p;
+    struct gdb_stat *p;
 
-    if (!(p = lock_user(VERIFY_WRITE, addr, sizeof(struct m68k_gdb_stat), 0)))
+    p = lock_user(VERIFY_WRITE, addr, sizeof(struct gdb_stat), 0);
+    if (!p) {
         /* FIXME - should this return an error code? */
         return;
+    }
     p->gdb_st_dev = cpu_to_be32(s->st_dev);
     p->gdb_st_ino = cpu_to_be32(s->st_ino);
     p->gdb_st_mode = cpu_to_be32(s->st_mode);
@@ -114,7 +92,7 @@ static void translate_stat(CPUM68KState *env, target_ulong addr, struct stat *s)
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


