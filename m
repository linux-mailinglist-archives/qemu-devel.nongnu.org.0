Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018B541E68
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:31:42 +0200 (CEST)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhjh-0001ai-DA
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5i-0007Gd-4o
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:21 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5g-0001Mg-0s
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id r71so17015993pgr.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxNDqSzg5Hw13giw27gxbf2VZjOoolDUxgjGkiB+OjI=;
 b=g7GI5eJj97SG063ZqeBvHi0ZQ1Fg4ZJa9fqxmZzolElaodj9My3CQg19R6wbsGHHHV
 MeBqcjDlnlQRlp46WQsb5FJEtaFGp8aoX7jsPuPcTOL49AU0fwNr9oJwZL8g22+ahPtZ
 OIfckUhDnDhghe7Q0A3pwyHYpjdgdsn+w6FAzJhGwmzXSj0AnbpPbx5oZ8hX77GDl74f
 i4JAJOKjFyG5nImS0NqkZeARvUpQumUZNDCJCUbShw4gJ2TUyRO4FtdZ8Nz7Yx6CIRMo
 ToR4F+2gcgV/Wsd5sYV7i23FVlqjGCVIq7p6zvkgHa7gnFgfFsIDTFLTgGe2ix8+r/5D
 bdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxNDqSzg5Hw13giw27gxbf2VZjOoolDUxgjGkiB+OjI=;
 b=Co5p3J8T0Pqj3tXJIIAwHKk3hSFTplEJr2Y/s14p2UjZVs3Horx3jQUJ8X128ZTutf
 h68XX+3rjnVnG6XUxwuiIOd81LxOVJ9cWKaBZayqQ+PNJQC5gGmrR59jHgpMfDWEX2r/
 2BxLwGiyw+98da/bJUUVXjT8Xyg0hcGBqHXuW+F13yajmEENQCWDGaR8WJKGNoK1TjsP
 SlNCj49+7miyuwccdE6tlZa/dJnGhQcivdDKzZh99Jm3KpiqktSkBkqNFi5VTBFpsFxh
 5/gT3j/Gx5PAA2vST1kc7jYommkYaCV136JP0QXiADDGIIEuUYvPoXPg5221Bp6VtGrO
 Ow0w==
X-Gm-Message-State: AOAM5308jCB9mIlIkiaVJ8QVLxvL9UgGiNQOqkSPLtQh+gJuFqKVArbv
 4arFE90ss2AJ8CETusMGoFt7b4lE9NY++w==
X-Google-Smtp-Source: ABdhPJyfChfeDcj2FvrbO0ezblrO3bPxqSQX3rTSR0MH/aAz2Y+tEywy1yT/jMK/RlOyWfaSNhBSqw==
X-Received: by 2002:a05:6a00:148d:b0:51c:4b1e:9436 with SMTP id
 v13-20020a056a00148d00b0051c4b1e9436mr2407066pfu.38.1654634774659; 
 Tue, 07 Jun 2022 13:46:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 17/53] include/exec: Move gdb_stat and gdb_timeval to
 gdbstub.h
Date: Tue,  7 Jun 2022 13:45:21 -0700
Message-Id: <20220607204557.658541-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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


