Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E0541CC8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:06:25 +0200 (CEST)
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhLE-0007bK-FE
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5c-0007Cs-2u
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:13 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5X-0001Jw-TU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id u2so16537423pfc.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkh+LDqP33Cbq4HWpFkXCgNp8t9Pp+94sT7PUU0Lz2Q=;
 b=izrApHPtoWeehapJRTiOaMS/z/z/GWe+PNZY5Mjn5TRwb/GGNIbaUh5b7F4RKVWJIB
 MwXg1D20iK/c9QGfnDhxBBMMXE8Zp8+FKaS6wFFs48vJdANe3LIlKOKlZ4g3FTYwi57B
 kwM38oSiJO1Vczr17EgMqVAef97hfE6rcFEL25yySFxXrrqGf/ZQSslkELtu5zO42t9B
 FOFZLk5yipSva4IPqBDO7TtBknLHXBvK7PA1zucEdlkaQz4PW+x5QMSUYtpHK0ZZxMcA
 BD4pn2n4HwPTN2swAOMAeNkRnckKtIZGLIK8h9muSVjtJYriyOPVFROjTUKbkfwBhTJU
 gM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkh+LDqP33Cbq4HWpFkXCgNp8t9Pp+94sT7PUU0Lz2Q=;
 b=lJ1pqhJ1qixhE7ONui9dCywLzG6IupunDqUZfthqY5foJZciXTY15uznI6lyGiEUJ1
 5uBmFA7T9a+fP7h/JWf2qwq6kepaPXNdoue+rd0wOUB5oj+FB3pcVNrZRy3DcgffrgWk
 jYh++gvJIB9HRxWh/5S4XHvPTMNKZrYPzJcxXsLhI9O4yqUlN2rG2IxnmCHC073gIT0y
 zmyKyfLNsBHxh0ZJ20q93RCT4V8sQJABYMs/MHqndXjS090nc7zIqrcGV5sILpqz9yih
 8QX6qDCKOnjzqdBnbIgUPGYfniIx6XvkoK1f/8DyLNAZoT8xOPeac4K+7r/psA1+mqY3
 okTQ==
X-Gm-Message-State: AOAM530xCYi7BQBOovJFhCpn5+7tFLZFWK3ONPZ8H/q512CDPionFDse
 RN6LM65BXJso3H3X1h2haJ1Prr6k1e4Dfg==
X-Google-Smtp-Source: ABdhPJztP9DzfMWYbUaWP6h4tx6Y1I/8zlZVcIHQDyCm18rNssrz91B7rEYiEnX+FymzyPCs+GpkWA==
X-Received: by 2002:a05:6a00:15c9:b0:51c:178:ac7e with SMTP id
 o9-20020a056a0015c900b0051c0178ac7emr16521101pfu.64.1654634766357; 
 Tue, 07 Jun 2022 13:46:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 08/53] semihosting: Split out guestfd.c
Date: Tue,  7 Jun 2022 13:45:12 -0700
Message-Id: <20220607204557.658541-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/aarch64-linux-user.mak    |   1 +
 configs/targets/aarch64_be-linux-user.mak |   1 +
 configs/targets/arm-linux-user.mak        |   1 +
 configs/targets/armeb-linux-user.mak      |   1 +
 configs/targets/riscv32-linux-user.mak    |   1 +
 configs/targets/riscv64-linux-user.mak    |   1 +
 include/semihosting/guestfd.h             |  83 +++++++++++
 semihosting/arm-compat-semi.c             | 164 +++-------------------
 semihosting/guestfd.c                     | 118 ++++++++++++++++
 semihosting/meson.build                   |   4 +
 10 files changed, 233 insertions(+), 142 deletions(-)
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
index 0000000000..ef268abe85
--- /dev/null
+++ b/include/semihosting/guestfd.h
@@ -0,0 +1,83 @@
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
+    GuestFDStatic = 3,
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
+        struct {
+            const uint8_t *data;
+            size_t len;
+            size_t off;
+        } staticfile;
+    };
+} GuestFD;
+
+/**
+ * alloc_guestfd:
+ *
+ * Allocate an unused GuestFD index.  The associated guestfd index
+ * will still be GuestFDUnused until it is initialized.
+ */
+int alloc_guestfd(void);
+
+/**
+ * dealloc_guestfd:
+ * @guestfd: GuestFD index
+ *
+ * Deallocate a GuestFD index.  The associated GuestFD structure
+ * will be recycled for a subsequent allocation.
+ */
+void dealloc_guestfd(int guestfd);
+
+/**
+ * get_guestfd:
+ * @guestfd: GuestFD index
+ *
+ * Return the GuestFD structure associated with an initialized @guestfd,
+ * or NULL if it has not been allocated, or hasn't been initialized.
+ */
+GuestFD *get_guestfd(int guestfd);
+
+/**
+ * associate_guestfd:
+ * @guestfd: GuestFD index
+ * @hostfd: host file descriptor
+ *
+ * Initialize the GuestFD for @guestfd to GuestFDHost using @hostfd.
+ */
+void associate_guestfd(int guestfd, int hostfd);
+
+/**
+ * staticfile_guestfd:
+ * @guestfd: GuestFD index
+ * @data: data to be read
+ * @len: length of @data
+ *
+ * Initialize the GuestFD for @guestfd to GuestFDStatic.
+ * The @len bytes at @data will be returned to the guest on reads.
+ */
+void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len);
+
+#endif /* SEMIHOSTING_GUESTFD_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1033e751ef..2fa7f23d8b 100644
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
@@ -665,22 +553,13 @@ static const uint8_t featurefile_data[] = {
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
-static uint32_t featurefile_closefn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_closefn(CPUState *cs, GuestFD *gf)
 {
     /* Nothing to do */
     return 0;
 }
 
-static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_writefn(CPUState *cs, GuestFD *gf,
                                     target_ulong buf, uint32_t len)
 {
     /* This fd can never be open for writing */
@@ -689,7 +568,7 @@ static uint32_t featurefile_writefn(CPUState *cs, GuestFD *gf,
     return set_swi_errno(cs, -1);
 }
 
-static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_readfn(CPUState *cs, GuestFD *gf,
                                    target_ulong buf, uint32_t len)
 {
     CPUArchState *env = cs->env_ptr;
@@ -703,11 +582,11 @@ static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
     }
 
     for (i = 0; i < len; i++) {
-        if (gf->featurefile_offset >= sizeof(featurefile_data)) {
+        if (gf->staticfile.off >= gf->staticfile.len) {
             break;
         }
-        s[i] = featurefile_data[gf->featurefile_offset];
-        gf->featurefile_offset++;
+        s[i] = gf->staticfile.data[gf->staticfile.off];
+        gf->staticfile.off++;
     }
 
     unlock_user(s, buf, len);
@@ -716,21 +595,21 @@ static uint32_t featurefile_readfn(CPUState *cs, GuestFD *gf,
     return len - i;
 }
 
-static uint32_t featurefile_isattyfn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_isattyfn(CPUState *cs, GuestFD *gf)
 {
     return 0;
 }
 
-static uint32_t featurefile_seekfn(CPUState *cs, GuestFD *gf,
+static uint32_t staticfile_seekfn(CPUState *cs, GuestFD *gf,
                                    target_ulong offset)
 {
-    gf->featurefile_offset = offset;
+    gf->staticfile.off = offset;
     return 0;
 }
 
-static uint32_t featurefile_flenfn(CPUState *cs, GuestFD *gf)
+static uint32_t staticfile_flenfn(CPUState *cs, GuestFD *gf)
 {
-    return sizeof(featurefile_data);
+    return gf->staticfile.len;
 }
 
 typedef struct GuestFDFunctions {
@@ -759,13 +638,13 @@ static const GuestFDFunctions guestfd_fns[] = {
         .seekfn = gdb_seekfn,
         .flenfn = gdb_flenfn,
     },
-    [GuestFDFeatureFile] = {
-        .closefn = featurefile_closefn,
-        .writefn = featurefile_writefn,
-        .readfn = featurefile_readfn,
-        .isattyfn = featurefile_isattyfn,
-        .seekfn = featurefile_seekfn,
-        .flenfn = featurefile_flenfn,
+    [GuestFDStatic] = {
+        .closefn = staticfile_closefn,
+        .writefn = staticfile_writefn,
+        .readfn = staticfile_readfn,
+        .isattyfn = staticfile_isattyfn,
+        .seekfn = staticfile_seekfn,
+        .flenfn = staticfile_flenfn,
     },
 };
 
@@ -886,7 +765,8 @@ target_ulong do_common_semihosting(CPUState *cs)
                 errno = EACCES;
                 return set_swi_errno(cs, -1);
             }
-            init_featurefile_guestfd(guestfd);
+            staticfile_guestfd(guestfd, featurefile_data,
+                               sizeof(featurefile_data));
             return guestfd;
         }
 
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
new file mode 100644
index 0000000000..b6405f5663
--- /dev/null
+++ b/semihosting/guestfd.c
@@ -0,0 +1,118 @@
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
+void staticfile_guestfd(int guestfd, const uint8_t *data, size_t len)
+{
+    GuestFD *gf = do_get_guestfd(guestfd);
+
+    assert(gf);
+    gf->type = GuestFDStatic;
+    gf->staticfile.data = data;
+    gf->staticfile.len = len;
+    gf->staticfile.off = 0;
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


