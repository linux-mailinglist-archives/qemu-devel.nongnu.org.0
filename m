Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19833247B52
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 01:58:27 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7p1F-0005LU-K9
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 19:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1k7p0D-0004gs-1V
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 19:57:21 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aladjev.andrew@gmail.com>)
 id 1k7p0B-0007wv-AX
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 19:57:20 -0400
Received: by mail-wr1-x441.google.com with SMTP id a15so16539475wrh.10
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 16:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sBrmmEmnH2nlvNfW79Q00MjuPYlDGFgLKe/nn6RzzQ0=;
 b=GfJJH3IkbC2OVl1buWEM0RHEZ7qlCDtUrg9vxZ0iJndyGz/DYNsvpkIq+r1AG6pzA6
 IMC9c9G27cW6y0Hxz1PT5EUJREGpJ6NvNYNh3NZRhUxobc4Uuo3fHKGCa9fVlzrlisok
 DCdMGk9GkT9krnEkOWsbFh0RBKHNJBTyl43WXWc3MFj8R6SaFLmFF1EGSlFdPuHeln95
 01fMu1/LOkIIOv144svtT2ySeQWV3cxYGnekGjKW3okbNHJQKYza1bfCvrsRGzEd3p3b
 SlgGL57aSTeY4g3ntL2qWJCwvKAbdv3gj5iVnyRu8kOWc/ebQBzzk0X9FE6Es0SyyEmJ
 1vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sBrmmEmnH2nlvNfW79Q00MjuPYlDGFgLKe/nn6RzzQ0=;
 b=DHKLGRZQ0Hm7JvhakUpCisWigp7YYIFlrKFLnhYO5qFKbDF1eF4dGezZraceXtzWlX
 ZpAyZbhjoAuyMgmojTQZHD3DCFpZHUnfzQd2aO5tByJbYkjwLaTOsZ7z+npNot4Z3+Tu
 O9U2zrROgGb7X9hTyYOzx0JX/FhAbH9V33+bA00/tib8AO4iljVdJKX1PvXANVXtvp1J
 7dVFtdxQfp/xkNdO5U3pObUcd+QmZdXUijoniq/NaWlkxVBS6m273672B5W/Ap8+1RCe
 bxuPB3SYRnlD509Dkx1KaI6xFEwWOH4Iey+uHleoPxpe+2WOCVt31tCjH/r0l3jvWdKD
 9TyA==
X-Gm-Message-State: AOAM533SSDU1MQIt/1fLU16kaQmd0Xnk+J7dXrW4y4kgguYVJ6T+fvV0
 NrR8YMYusfetry9LnNLygt6XCf/azwEbQg==
X-Google-Smtp-Source: ABdhPJytQq6MhrG9tmckiht6HQ1cNlcmdgHvKjAJa0cQhRsQKjqtc8MIRAl+p5X7SPtREdPVOgt85A==
X-Received: by 2002:adf:b30c:: with SMTP id j12mr17395751wrd.420.1597708637034; 
 Mon, 17 Aug 2020 16:57:17 -0700 (PDT)
Received: from mini.lan (ns331963.ip-37-187-122.eu. [37.187.122.190])
 by smtp.gmail.com with ESMTPSA id z12sm32715495wrp.20.2020.08.17.16.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:57:16 -0700 (PDT)
From: Andrew Aladjev <aladjev.andrew@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux user: make execfd global (like exec path) and keep
 it open
Date: Tue, 18 Aug 2020 02:57:10 +0300
Message-Id: <20200817235712.10957-1-aladjev.andrew@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=aladjev.andrew@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

User opens /proc/self/exe symlink, than kernel should create /proc/self/fd/<execfd> symlink. We should be able to detect both exe and fd/<execfd> symlinks to provide common behaviour. The easiest solution is to make execfd global and keep it open. This solution looks acceptable because exec_path is already global.

Signed-off-by: Andrew Aladjev <aladjev.andrew@gmail.com>
---
 linux-user/elfload.c |  3 ++-
 linux-user/exit.c    |  7 +++++--
 linux-user/main.c    |  2 +-
 linux-user/qemu.h    |  1 +
 linux-user/syscall.c | 18 ++++++++++++++----
 5 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fe9dfe795d..dfaf937ab9 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2363,6 +2363,7 @@ void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
 
    IMAGE_NAME is the filename of the image, to use in error messages.
    IMAGE_FD is the open file descriptor for the image.
+   WARNING: IMAGE_FD won't be closed.
 
    BPRM_BUF is a copy of the beginning of the file; this of course
    contains the elf file header at offset 0.  It is assumed that this
@@ -2632,7 +2633,6 @@ static void load_elf_image(const char *image_name, int image_fd,
 
     mmap_unlock();
 
-    close(image_fd);
     return;
 
  exit_read:
@@ -2666,6 +2666,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
     }
 
     load_elf_image(filename, fd, info, NULL, bprm_buf);
+    close(fd);
     return;
 
  exit_perror:
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 1594015444..f0626fc432 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -28,12 +28,15 @@ extern void __gcov_dump(void);
 
 void preexit_cleanup(CPUArchState *env, int code)
 {
+    close(execfd);
+
 #ifdef CONFIG_GPROF
         _mcleanup();
 #endif
 #ifdef CONFIG_GCOV
         __gcov_dump();
 #endif
-        gdb_exit(env, code);
-        qemu_plugin_atexit_cb();
+
+    gdb_exit(env, code);
+    qemu_plugin_atexit_cb();
 }
diff --git a/linux-user/main.c b/linux-user/main.c
index 75c9785157..27644a831a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -49,6 +49,7 @@
 #include "crypto/init.h"
 
 char *exec_path;
+int execfd;
 
 int singlestep;
 static const char *argv0;
@@ -629,7 +630,6 @@ int main(int argc, char **argv, char **envp)
     int target_argc;
     int i;
     int ret;
-    int execfd;
     int log_mask;
     unsigned long max_reserved_va;
 
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5c964389c1..f99be78d42 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -156,6 +156,7 @@ typedef struct TaskState {
 } __attribute__((aligned(16))) TaskState;
 
 extern char *exec_path;
+extern int execfd;
 void init_task_state(TaskState *ts);
 void task_settid(TaskState *);
 void stop_all_tasks(void);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 945fc25279..5741c72733 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7613,8 +7613,7 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+        return execfd;
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
@@ -7872,8 +7871,19 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
     case TARGET_NR_close:
-        fd_trans_unregister(arg1);
-        return get_errno(close(arg1));
+        {
+            int fd = arg1;
+            if (fd == execfd) {
+                /*
+                 * We don't need to close execfd.
+                 * It will be closed on QEMU exit.
+                 */
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


