Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2E518DAE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:02:15 +0200 (CEST)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyis-0001qK-Uo
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW4-0001AG-MX
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVy-0003XF-9b
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:56 -0400
Received: by mail-pg1-x535.google.com with SMTP id j70so3886172pge.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Rdp8FUFv0ef0StprWjSCHgZq98w5M9LAMIgcdDdNZUM=;
 b=M2iTS49jC5fPxkJzVEGryyLmyh9nIOlKpXwWFAdAkuWlBDFzAEkBzv2gDbTi7KArbX
 ZKB1PP41NHkGFJP3EwIL0eR3YjHongXSrJkNtyhI83oEM4Hitmg7HJX+dYD5zUbs2hTM
 rQ54fYpVbaaplmzwbizEAUKBBUpTE6HpFG/qf4ZBRRmZdFL/AzG7FX7Y9fFnYPsnC3s9
 h/nRDM+1KOveTN9zbmctMXG/S6jjZuCPD4OZNNXPrCoTGF0atC/I4amjS0nFnPbdsXje
 nGJRgEEUlqnfJ5nxynID5KhjrsvdoRGkA4WxecfzwH4vjORr6zQhvCZjb8D06BmDnONL
 lRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rdp8FUFv0ef0StprWjSCHgZq98w5M9LAMIgcdDdNZUM=;
 b=1liSjbNRty7H0lA3EX9GHXB9wdL5xR5h2xSDGBclQixCHIAa/1Eq+S77+HLOBFGMcU
 +cDmlVeG+Kth87Ub0puEYlwGPCQwvVdrxDEbZs3czTwu+3U91GKVoGPDvZyk1KJPUZyx
 6FVDjkrcpcaQDQ5lU43UFYaJxJX2k4Niwo/F80k2w0nChbS8/3xe/Pzc9Mx4bj9cUY68
 3/u+N5Ugeqc4nH8EWCfUMQpSwsi7Ox9r+JIYNPBAQ+pKVITHJmzdlMM8hmM5bBJuwvO8
 OYiXq418iSe6mCwEEmK6BnYfwiOMfyOBDSuu2XMZygUJGkyZ3Vtk4C5tW+qfjawCQAyo
 CtGw==
X-Gm-Message-State: AOAM530iwXQ5vrDn2fVrEb/E3CCOq0YVax/JOKCry4OdACfRMxGZqsAw
 4yLGUNbxWLOmWaRm2rCVGJTbdtugc7EZvA==
X-Google-Smtp-Source: ABdhPJydlWNLe4IKOP3f2ZoUlAO9aHykmhCqQkT/MMHSGIcZeue7cyHgRQeKBBdLWcQfNjkvijvW4Q==
X-Received: by 2002:aa7:88d3:0:b0:50d:a2d7:7f12 with SMTP id
 k19-20020aa788d3000000b0050da2d77f12mr12322991pff.27.1651607332880; 
 Tue, 03 May 2022 12:48:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/74] semihosting: Split out guestfd.c
Date: Tue,  3 May 2022 12:47:36 -0700
Message-Id: <20220503194843.1379101-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

In arm-compat-semi.c, we have more advanced treatment of
guest file descriptors than we do in other implementations.
Split out GuestFD and related functions to a new file so
that they can be shared.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/aarch64-linux-user.mak    |   1 +
 configs/targets/aarch64_be-linux-user.mak |   1 +
 configs/targets/arm-linux-user.mak        |   1 +
 configs/targets/armeb-linux-user.mak      |   1 +
 configs/targets/riscv32-linux-user.mak    |   1 +
 configs/targets/riscv64-linux-user.mak    |   1 +
 include/semihosting/guestfd.h             |  40 +++++++
 semihosting/arm-compat-semi.c             | 125 +---------------------
 semihosting/guestfd.c                     | 116 ++++++++++++++++++++
 semihosting/meson.build                   |   4 +
 10 files changed, 168 insertions(+), 123 deletions(-)
 create mode 100644 include/semihosting/guestfd.h
 create mode 100644 semihosting/guestfd.c

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index d0c603c54e..db552f1839 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -2,4 +2,5 @@ TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index 7794424745..dc78044fb1 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -3,4 +3,5 @@ TARGET_BASE_ARCH=arm
 TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
index 3e10d6b15d..7f5d65794c 100644
--- a/configs/targets/arm-linux-user.mak
+++ b/configs/targets/arm-linux-user.mak
@@ -3,4 +3,5 @@ TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
index a249cc2e29..943d0d87bf 100644
--- a/configs/targets/armeb-linux-user.mak
+++ b/configs/targets/armeb-linux-user.mak
@@ -4,4 +4,5 @@ TARGET_SYSTBL=syscall.tbl
 TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/riscv32-linux-user.mak b/configs/targets/riscv32-linux-user.mak
index bd2f1fd497..9761618e67 100644
--- a/configs/targets/riscv32-linux-user.mak
+++ b/configs/targets/riscv32-linux-user.mak
@@ -2,4 +2,5 @@ TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-virtual.xml
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/riscv64-linux-user.mak b/configs/targets/riscv64-linux-user.mak
index 4aca7662ce..cfd1fd382f 100644
--- a/configs/targets/riscv64-linux-user.mak
+++ b/configs/targets/riscv64-linux-user.mak
@@ -2,4 +2,5 @@ TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
+CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
new file mode 100644
index 0000000000..5d6e744305
--- /dev/null
+++ b/include/semihosting/guestfd.h
@@ -0,0 +1,40 @@
+/*
+ * Hosted file support for semihosting syscalls.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019 Linaro
+ * Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef SEMIHOSTING_GUESTFD_H
+#define SEMIHOSTING_GUESTFD_H
+
+typedef enum GuestFDType {
+    GuestFDUnused = 0,
+    GuestFDHost = 1,
+    GuestFDGDB = 2,
+    GuestFDFeatureFile = 3,
+} GuestFDType;
+
+/*
+ * Guest file descriptors are integer indexes into an array of
+ * these structures (we will dynamically resize as necessary).
+ */
+typedef struct GuestFD {
+    GuestFDType type;
+    union {
+        int hostfd;
+        unsigned featurefile_offset;
+    };
+} GuestFD;
+
+int alloc_guestfd(void);
+void dealloc_guestfd(int guestfd);
+GuestFD *get_guestfd(int guestfd);
+
+void associate_guestfd(int guestfd, int hostfd);
+void init_featurefile_guestfd(int guestfd);
+
+#endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index dbef280b87..c092138031 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -32,12 +32,13 @@
  */
 
 #include "qemu/osdep.h"
-
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
+#include "semihosting/guestfd.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
+
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -123,27 +124,6 @@ static int open_modeflags[12] = {
     O_RDWR | O_CREAT | O_APPEND | O_BINARY
 };
 
-typedef enum GuestFDType {
-    GuestFDUnused = 0,
-    GuestFDHost = 1,
-    GuestFDGDB = 2,
-    GuestFDFeatureFile = 3,
-} GuestFDType;
-
-/*
- * Guest file descriptors are integer indexes into an array of
- * these structures (we will dynamically resize as necessary).
- */
-typedef struct GuestFD {
-    GuestFDType type;
-    union {
-        int hostfd;
-        target_ulong featurefile_offset;
-    };
-} GuestFD;
-
-static GArray *guestfd_array;
-
 #ifndef CONFIG_USER_ONLY
 
 /**
@@ -268,98 +248,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
 
 #endif
 
-/*
- * Allocate a new guest file descriptor and return it; if we
- * couldn't allocate a new fd then return -1.
- * This is a fairly simplistic implementation because we don't
- * expect that most semihosting guest programs will make very
- * heavy use of opening and closing fds.
- */
-static int alloc_guestfd(void)
-{
-    guint i;
-
-    if (!guestfd_array) {
-        /* New entries zero-initialized, i.e. type GuestFDUnused */
-        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
-    }
-
-    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
-    for (i = 1; i < guestfd_array->len; i++) {
-        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
-
-        if (gf->type == GuestFDUnused) {
-            return i;
-        }
-    }
-
-    /* All elements already in use: expand the array */
-    g_array_set_size(guestfd_array, i + 1);
-    return i;
-}
-
-/*
- * Look up the guestfd in the data structure; return NULL
- * for out of bounds, but don't check whether the slot is unused.
- * This is used internally by the other guestfd functions.
- */
-static GuestFD *do_get_guestfd(int guestfd)
-{
-    if (!guestfd_array) {
-        return NULL;
-    }
-
-    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
-        return NULL;
-    }
-
-    return &g_array_index(guestfd_array, GuestFD, guestfd);
-}
-
-/*
- * Associate the specified guest fd (which must have been
- * allocated via alloc_fd() and not previously used) with
- * the specified host/gdb fd.
- */
-static void associate_guestfd(int guestfd, int hostfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    assert(gf);
-    gf->type = use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
-    gf->hostfd = hostfd;
-}
-
-/*
- * Deallocate the specified guest file descriptor. This doesn't
- * close the host fd, it merely undoes the work of alloc_fd().
- */
-static void dealloc_guestfd(int guestfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    assert(gf);
-    gf->type = GuestFDUnused;
-}
-
-/*
- * Given a guest file descriptor, get the associated struct.
- * If the fd is not valid, return NULL. This is the function
- * used by the various semihosting calls to validate a handle
- * from the guest.
- * Note: calling alloc_guestfd() or dealloc_guestfd() will
- * invalidate any GuestFD* obtained by calling this function.
- */
-static GuestFD *get_guestfd(int guestfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    if (!gf || gf->type == GuestFDUnused) {
-        return NULL;
-    }
-    return gf;
-}
-
 /*
  * The semihosting API has no concept of its errno being thread-safe,
  * as the API design predates SMP CPUs and was intended as a simple
@@ -665,15 +553,6 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
-static void init_featurefile_guestfd(int guestfd)
-{
-    GuestFD *gf = do_get_guestfd(guestfd);
-
-    assert(gf);
-    gf->type = GuestFDFeatureFile;
-    gf->featurefile_offset = 0;
-}
-
 static uint32_t featurefile_closefn(CPUState *cs, GuestFD *gf)
 {
     /* Nothing to do */
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
new file mode 100644
index 0000000000..e77265db0f
--- /dev/null
+++ b/semihosting/guestfd.c
@@ -0,0 +1,116 @@
+/*
+ * Hosted file support for semihosting syscalls.
+ *
+ * Copyright (c) 2005, 2007 CodeSourcery.
+ * Copyright (c) 2019 Linaro
+ * Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/gdbstub.h"
+#include "semihosting/guestfd.h"
+
+static GArray *guestfd_array;
+
+/*
+ * Allocate a new guest file descriptor and return it; if we
+ * couldn't allocate a new fd then return -1.
+ * This is a fairly simplistic implementation because we don't
+ * expect that most semihosting guest programs will make very
+ * heavy use of opening and closing fds.
+ */
+int alloc_guestfd(void)
+{
+    guint i;
+
+    if (!guestfd_array) {
+        /* New entries zero-initialized, i.e. type GuestFDUnused */
+        guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
+    }
+
+    /* SYS_OPEN should return nonzero handle on success. Start guestfd from 1 */
+    for (i = 1; i < guestfd_array->len; i++) {
+        GuestFD *gf = &g_array_index(guestfd_array, GuestFD, i);
+
+        if (gf->type == GuestFDUnused) {
+            return i;
+        }
+    }
+
+    /* All elements already in use: expand the array */
+    g_array_set_size(guestfd_array, i + 1);
+    return i;
+}
+
+/*
+ * Look up the guestfd in the data structure; return NULL
+ * for out of bounds, but don't check whether the slot is unused.
+ * This is used internally by the other guestfd functions.
+ */
+static GuestFD *do_get_guestfd(int guestfd)
+{
+    if (!guestfd_array) {
+        return NULL;
+    }
+
+    if (guestfd <= 0 || guestfd >= guestfd_array->len) {
+        return NULL;
+    }
+
+    return &g_array_index(guestfd_array, GuestFD, guestfd);
+}
+
+/*
+ * Given a guest file descriptor, get the associated struct.
+ * If the fd is not valid, return NULL. This is the function
+ * used by the various semihosting calls to validate a handle
+ * from the guest.
+ * Note: calling alloc_guestfd() or dealloc_guestfd() will
+ * invalidate any GuestFD* obtained by calling this function.
+ */
+GuestFD *get_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    if (!gf || gf->type == GuestFDUnused) {
+        return NULL;
+    }
+    return gf;
+}
+
+/*
+ * Associate the specified guest fd (which must have been
+ * allocated via alloc_fd() and not previously used) with
+ * the specified host/gdb fd.
+ */
+void associate_guestfd(int guestfd, int hostfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = use_gdb_syscalls() ? GuestFDGDB : GuestFDHost;
+    gf->hostfd = hostfd;
+}
+
+void init_featurefile_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDFeatureFile;
+    gf->featurefile_offset = 0;
+}
+
+/*
+ * Deallocate the specified guest file descriptor. This doesn't
+ * close the host fd, it merely undoes the work of alloc_fd().
+ */
+void dealloc_guestfd(int guestfd)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDUnused;
+}
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 10b3b99921..d2c1c37bfd 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,3 +1,7 @@
+specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+  'guestfd.c',
+))
+
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
-- 
2.34.1


