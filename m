Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC5325827
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:56:46 +0100 (CET)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFNgj-0005Zr-2a
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNey-0004WR-OR
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:54:56 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1lFNex-0000gl-0q
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:54:56 -0500
Received: by mail-ed1-x52d.google.com with SMTP id w21so8581102edc.7
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZU4Ny6U3GKbxFz6iwOzcZ/o2uo5k3ZnM0M8EEtaHho=;
 b=Mi00jnHmi+JNnJMcwRQlknrtkKDFfM8NQJpYfA8yluIx3BOK5jvZ2Aw74UsImzEz/b
 udI3PrStTS/JGWqrZKtzIThVTV9P6o7RB9gfUDSJiHKX7rdJHrB/vNnwpI656tkTyFy0
 PrfR9FmoQw+b2LNTCF6BDV8BJqcvxouLaX4jcEnVYXYYmM5FRbr68AzgLvH2X96oVh3q
 nlWnUI226ZJNkKKxuItdtFI/CzgLAib7lJ/bACpU09Y5tu4ylCq/NtAJEsCOVMx70CBq
 gALBWZeW5u9jWiej2qVfipJRCNm15rVs3+A7F+ibZsI2BrjK2+xKZxOHoQK3ic8ORzdf
 8G1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZU4Ny6U3GKbxFz6iwOzcZ/o2uo5k3ZnM0M8EEtaHho=;
 b=Abkob5TSqSOJPrYewBqGvkzIXTc/9DuuXVicOkg4MSHnc2P5l5eI3nZqbixNvBawSP
 yrhPB+iOpcUTIk7s24dwn65jXid2Al4Z9XJf+G528R2X0I928f0OiiTAZ11aRF7NccQJ
 FQKOilnfElmRNuMmDHuBtbuauMiHUy/l6/z3fLmiA1XVxcS9m+hQq09PfpXFPAfHLjh/
 edoinki884KlUjs5y00sQzXMKKhmPXglzpEY/5QEk8O4Zw8UMabMMIT4uoBoz9lHEx0T
 pP+wqr2r1sze2/595Iv2Mv9q5bfpZMLLwM2C+9178An4mIHB/MtceIqXd8O7tEoWeHdd
 KllA==
X-Gm-Message-State: AOAM530Uh/29Qkpr4rtHiU+5A/AkleLNas5tKeHt1qT//d0YEaB4bzwR
 y6cXwZ3PNVa8wTtghxysmLgRIDap0FURdg==
X-Google-Smtp-Source: ABdhPJy5NRko/Yv2VQ4heE5HZKmdGnT7bUs/fiU8NtDC8VXSR5Ns35vpj5fYKp0/c5CJe7q1GW4/+A==
X-Received: by 2002:a05:6402:899:: with SMTP id
 e25mr5070392edy.212.1614286492171; 
 Thu, 25 Feb 2021 12:54:52 -0800 (PST)
Received: from mini.lan (ns331963.ip-37-187-122.eu. [37.187.122.190])
 by smtp.gmail.com with ESMTPSA id c17sm949472edw.32.2021.02.25.12.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 12:54:51 -0800 (PST)
From: aladjev.andrew@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] linux user: make execfd global (like exec path) and keep
 it open
Date: Thu, 25 Feb 2021 23:54:45 +0300
Message-Id: <20210225205448.10624-1-aladjev.andrew@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=aladjev.andrew@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Aladjev <aladjev.andrew@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Aladjev <aladjev.andrew@gmail.com>

User opens /proc/self/exe symlink, than kernel should create /proc/self/fd/<execfd> symlink. We should be able to detect both exe and fd/<execfd> symlinks to provide common behaviour. The easiest solution is to make execfd global and keep it open. This solution looks acceptable because exec_path is already global. PS load_flt_binary is not closing bprm->fd, so load_elf_binary may not close it too (used symmetrically in loader_exec).
---
 linux-user/elfload.c |  3 ++-
 linux-user/exit.c    |  2 ++
 linux-user/main.c    |  2 +-
 linux-user/qemu.h    |  1 +
 linux-user/syscall.c | 16 ++++++++++++----
 5 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bab4237..4c347b0 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2600,6 +2600,7 @@ static bool parse_elf_properties(int image_fd,
 
    IMAGE_NAME is the filename of the image, to use in error messages.
    IMAGE_FD is the open file descriptor for the image.
+   WARNING: IMAGE_FD won't be closed.
 
    BPRM_BUF is a copy of the beginning of the file; this of course
    contains the elf file header at offset 0.  It is assumed that this
@@ -2910,7 +2911,6 @@ static void load_elf_image(const char *image_name, int image_fd,
 
     mmap_unlock();
 
-    close(image_fd);
     return;
 
  exit_read:
@@ -2953,6 +2953,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
     }
 
     load_elf_image(filename, fd, info, NULL, bprm_buf);
+    close(fd);
 }
 
 static int symfind(const void *s0, const void *s1)
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 70b3440..cc9cf38 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -28,6 +28,8 @@ extern void __gcov_dump(void);
 
 void preexit_cleanup(CPUArchState *env, int code)
 {
+    close(execfd);
+
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff..d365335 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -50,6 +50,7 @@
 #include "crypto/init.h"
 
 char *exec_path;
+int execfd;
 
 int singlestep;
 static const char *argv0;
@@ -628,7 +629,6 @@ int main(int argc, char **argv, char **envp)
     int target_argc;
     int i;
     int ret;
-    int execfd;
     int log_mask;
     unsigned long max_reserved_va;
 
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 52c9817..ec26730 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -160,6 +160,7 @@ typedef struct TaskState {
 } __attribute__((aligned(16))) TaskState;
 
 extern char *exec_path;
+extern int execfd;
 void init_task_state(TaskState *ts);
 void task_settid(TaskState *);
 void stop_all_tasks(void);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 389ec09..c171dea 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8110,8 +8110,7 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+        return execfd;
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
@@ -8369,8 +8368,17 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
     case TARGET_NR_close:
-        fd_trans_unregister(arg1);
-        return get_errno(close(arg1));
+        {
+            int fd = arg1;
+
+            /* We don't need to close execfd, it will be closed on QEMU exit. */
+            if (fd == execfd) {
+                return 0;
+            }
+
+            fd_trans_unregister(fd);
+            return get_errno(close(fd));
+        }
 
     case TARGET_NR_brk:
         return do_brk(arg1);
-- 
2.26.2


