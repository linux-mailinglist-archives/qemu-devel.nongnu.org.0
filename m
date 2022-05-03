Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17472518D7E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:54:30 +0200 (CEST)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlybN-0000h5-2r
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW7-0001Ob-LA
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:03 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW4-0003Y2-Ew
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:03 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so3213750pjb.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o7WLR0F1itSeL1D48lB12rI6iLH/uoOr7m0MR0rWKoM=;
 b=n1p+YBgD6XI2JwnHgOijz7KfPR9n1UnNU4QtocC+XqF46pcmizC9w/iNgEmjKw4HBg
 esfQwnRa55pdJMQIQpLufB8B6PydWJAiaU8GfUM6Wn6RAWrhEE580ZinfF4lOUXm13ZA
 HEm/oWIiofnCqIIyJ7nX7cgthsIFAIAOW7cC/YtvzYrsPs2CpmNPpQaRYJEw5LqyfqeU
 NG3uC98XZt7oXxSBqOwog5PBETFsr9lcjIC9ep6HjunTPTxh9zS96GEfXKTbtypDdViF
 9TG31i94jkGGP9FyCL0EG1lApL3bFvbO/uAlsmJC4Z5euxd8hPhinj73GENV1+BuSyhh
 vyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o7WLR0F1itSeL1D48lB12rI6iLH/uoOr7m0MR0rWKoM=;
 b=0XSSAInd9yPkfEk8eHqPmfF9aQIhQwz/Ldso+/objxtpMTDSj4wLaztA/Sn5myWxho
 1Igbrm6HvrQlRiZvl2ER8npBJ9PYD7C5XLtvoc94MZCkctV+WOUfBNC+swpPz8EsihN8
 bR0pUZ/PPeRYMW904+7LEmEsPTUoVJMbCr5m47hgWLUqshLokE5WJj9wGE4Vi5ttcdaY
 j95obn6id5LkVmc3i3CIIXbHU1p+Klmomq9A/7NYFBuTRsZ/rEIOqp4TcAPh1g5gcIqF
 fhJV5kNWKCQTVRy3t+IfF1iXGo4/ASnly3L3lWe8cTd005khh240ZOBvNV40mQYXImNj
 +X6A==
X-Gm-Message-State: AOAM531FjjSo4wIOAXisFZKY/t0gRy6LbPxWd3Ws4oi/e/CP8IVAesIQ
 oq9CEdvJB7gChoX/59GtlcAX9mdHuXtfUg==
X-Google-Smtp-Source: ABdhPJwK2AQTUGZ/GraA8X6EL0XEbtl00AY09X+ufAK/xqmyFBr8ehh6ARRd3PVGx7uobbdFQClhIw==
X-Received: by 2002:a17:903:2344:b0:15e:bc62:bda7 with SMTP id
 c4-20020a170903234400b0015ebc62bda7mr3159739plh.120.1651607338655; 
 Tue, 03 May 2022 12:48:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/74] include/exec: Move gdb_stat and gdb_timeval to
 gdbstub.h
Date: Tue,  3 May 2022 12:47:42 -0700
Message-Id: <20220503194843.1379101-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
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


