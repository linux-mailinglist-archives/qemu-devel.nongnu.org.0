Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDD96A897D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:27:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoYy-0003L2-T2; Thu, 02 Mar 2023 14:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoYx-0003Ks-Fy
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:25:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXoYv-0005uf-9c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 14:25:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id q16so195666wrw.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 11:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d8cjIlI3a7pcmH1rRKqqQevLGLhae9Nfy265N/OE98Q=;
 b=qli90dZX5nB3CD05zK4juAtlesz0uhl0UxkT5i/BY+/+Wg+/RnD8f6UfXddHPWFuHz
 W7Qn+UFAt7Usp9RQrPJz8crXUtCNcDcPuXZ2Ltaick7SgdlyUgHA0UI1vLgdyJSX0Qbw
 Xl88v9RfpYNarqapiJccFfdOrTKdlCV/PR8ceAVNv47lJlIvmRxmrbmAP//keFWV3dd1
 P8bixPP/pT3gcqtcZeeyThTiRQC1lTnGQsxOv5EI0eABin9M6wCxEmCqzTJNuVVX9KRx
 752PDMZGnmIjybXSI0a0UtC+86lLQtfYPdyjX17IHZFi48Biqvf6ZPg2nDb4LXP8GZJ0
 Qb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d8cjIlI3a7pcmH1rRKqqQevLGLhae9Nfy265N/OE98Q=;
 b=OUwvnh91z8GMYBACw6PI/DtKAp2iZtY1SpPii2omsqZUhytVfNiDXw9aMKYYJpI0ua
 U309HfAQjUUQu9Qn50kL5T1qcseyyn6U6aMLIT5lrf5C9fYEonvId2cAeNZ6QzBFfP/c
 9RPOBiV8dHjIMKfv+qOW/l2OJaKusFWHPbwJBh6KAnqQgHGfPXBevPSIJGhu7N/eEbxq
 qRXcUl1adJ2fAs5qGO0zdOqMMz+Gll5wROQ7JxGqPP7lYl5TVNdAa2VJuWW9mLma4g5T
 dRVCZ5FJfqmojTLEUdgH6Uod7nvDseui5TbWXYpZg1kXAwxK0zREr6tfz5mnuSCckbws
 LXzQ==
X-Gm-Message-State: AO0yUKVtszy7vb4WrQob3hhc9qCzjWYXm2XND2PmKtT288uZm3OBy0hJ
 cd8ZQpehIEW+3f9/Fq4BkK2Utg==
X-Google-Smtp-Source: AK7set8qlzG/8KsO42DcwbAVEeOt84ROKkgEy+6b/XcMLzyOos5dmN7eyTugaMNKRrv7MVXfj1j3YA==
X-Received: by 2002:a5d:6542:0:b0:2c7:434e:9a5a with SMTP id
 z2-20020a5d6542000000b002c7434e9a5amr9117681wrv.65.1677785155162; 
 Thu, 02 Mar 2023 11:25:55 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a5d4944000000b002c56013c07fsm143863wrs.109.2023.03.02.11.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 11:25:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 849011FFB7;
 Thu,  2 Mar 2023 19:25:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH] gdbstub: attempt to split gdb into 32/64 bit targets
 [!WORKING PLZ HELP]
Date: Thu,  2 Mar 2023 19:25:46 +0000
Message-Id: <20230302192546.2617633-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of building gdb syscalls for every target only build what
really matters, 64 or 32 bit support.

[AJB: Any clues or hints, I get a double linking compilation error:

FAILED: qemu-system-aarch64
c++ -m64 -mcx16 @qemu-system-aarch64.rsp
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `use_gdb_syscalls':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:50: multiple definition of `use_gdb_syscalls'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:50: first defined here
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `gdb_disable_syscalls':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:71: multiple definition of `gdb_disable_syscalls'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:71: first defined here
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `gdb_syscall_reset':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:76: multiple definition of `gdb_syscall_reset'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:76: first defined here
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `gdb_handled_syscall':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:81: multiple definition of `gdb_handled_syscall'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:81: first defined here
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `gdb_attached':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:39: multiple definition of `gdb_do_syscallv'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:39: first defined here
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `gdb_do_syscall':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:156: multiple definition of `gdb_do_syscall'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:156: first defined here
/usr/bin/ld: gdbstub/libgdb64.fa.p/syscalls.c.o: in function `gdb_handle_file_io':
/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:170: multiple definition of `gdb_handle_file_io'; gdbstub/libgdb64.fa.p/syscalls.c.o:/home/alex/lsrc/qemu.git/builds/all/../../gdbstub/syscalls.c:170: first defined here
/usr/bin/ld: /lib/x86_64-linux-gnu/libtirpc.so.3: warning: common of `rpc_createerr@@GLIBC_2.2.5' overridden by definition from /lib/x86_64-linux-gnu/libc.so.6
collect2: error: ld returned 1 exit status
]

Based-on: <20230302190846.2593720-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/targets/aarch64-linux-user.mak    |  1 +
 configs/targets/aarch64-softmmu.mak       |  1 +
 configs/targets/aarch64_be-linux-user.mak |  1 +
 configs/targets/alpha-linux-user.mak      |  1 +
 configs/targets/alpha-softmmu.mak         |  1 +
 configs/targets/arm-softmmu.mak           |  1 +
 configs/targets/sh4-linux-user.mak        |  1 +
 configs/targets/sh4-softmmu.mak           |  1 +
 configs/targets/sh4eb-linux-user.mak      |  1 +
 configs/targets/sh4eb-softmmu.mak         |  1 +
 include/exec/poison.h                     |  7 ++++++
 include/exec/target_long.h                |  7 ++++++
 gdbstub/syscalls.c                        |  3 ++-
 gdbstub/meson.build                       | 28 +++++++++++++++++++++--
 scripts/make-config-poison.sh             |  7 +++++-
 15 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
index db552f1839..2f8d05d400 100644
--- a/configs/targets/aarch64-linux-user.mak
+++ b/configs/targets/aarch64-linux-user.mak
@@ -1,5 +1,6 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
+TARGET_64BIT=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index d489e6da83..dacab8b96a 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -1,5 +1,6 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
+TARGET_64BIT=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index dc78044fb1..f81ce2bcf2 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -1,5 +1,6 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
+TARGET_64BIT=y
 TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/alpha-linux-user.mak b/configs/targets/alpha-linux-user.mak
index 7e62fd796a..3714c1f6ae 100644
--- a/configs/targets/alpha-linux-user.mak
+++ b/configs/targets/alpha-linux-user.mak
@@ -1,4 +1,5 @@
 TARGET_ARCH=alpha
+TARGET_32BIT=y
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/alpha-softmmu.mak b/configs/targets/alpha-softmmu.mak
index e4b874a19e..7c10ce4550 100644
--- a/configs/targets/alpha-softmmu.mak
+++ b/configs/targets/alpha-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=alpha
+TARGET_64BIT=y
 TARGET_ALIGNED_ONLY=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
index 92c8349b96..c06975ba86 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -1,4 +1,5 @@
 TARGET_ARCH=arm
+TARGET_32BIT=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/sh4-linux-user.mak b/configs/targets/sh4-linux-user.mak
index 0152d6621e..39370af1ed 100644
--- a/configs/targets/sh4-linux-user.mak
+++ b/configs/targets/sh4-linux-user.mak
@@ -1,4 +1,5 @@
 TARGET_ARCH=sh4
+TARGET_32BIT=y
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/sh4-softmmu.mak b/configs/targets/sh4-softmmu.mak
index 95896376c4..b632e874df 100644
--- a/configs/targets/sh4-softmmu.mak
+++ b/configs/targets/sh4-softmmu.mak
@@ -1,2 +1,3 @@
 TARGET_ARCH=sh4
+TARGET_32BIT=y
 TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/sh4eb-linux-user.mak b/configs/targets/sh4eb-linux-user.mak
index 6724165efe..fdf04dea2b 100644
--- a/configs/targets/sh4eb-linux-user.mak
+++ b/configs/targets/sh4eb-linux-user.mak
@@ -1,4 +1,5 @@
 TARGET_ARCH=sh4
+TARGET_32BIT=y
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
diff --git a/configs/targets/sh4eb-softmmu.mak b/configs/targets/sh4eb-softmmu.mak
index dc8b30bf7a..e95b7a5da9 100644
--- a/configs/targets/sh4eb-softmmu.mak
+++ b/configs/targets/sh4eb-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=sh4
+TARGET_32BIT=y
 TARGET_ALIGNED_ONLY=y
 TARGET_BIG_ENDIAN=y
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 140daa4a85..69850b46fa 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -42,10 +42,17 @@
 #pragma GCC poison TARGET_BIG_ENDIAN
 #pragma GCC poison BSWAP_NEEDED
 
+/*
+ * In some special cases we may define TARGET_LONG_BITS directly to
+ * build 32 and 64 bit versions of a common binary. Therefor if it is
+ * already defined for the compilation unit don't poison it.
+ */
+#ifndef TARGET_LONG_BITS
 #pragma GCC poison TARGET_LONG_BITS
 #pragma GCC poison TARGET_FMT_lx
 #pragma GCC poison TARGET_FMT_ld
 #pragma GCC poison TARGET_FMT_lu
+#endif
 
 #pragma GCC poison TARGET_PAGE_SIZE
 #pragma GCC poison TARGET_PAGE_MASK
diff --git a/include/exec/target_long.h b/include/exec/target_long.h
index 93c9472971..5576543588 100644
--- a/include/exec/target_long.h
+++ b/include/exec/target_long.h
@@ -20,6 +20,13 @@
 #error TARGET_LONG_BITS not defined
 #endif
 
+/* Sanity check with system configuration via configs/ */
+#if defined(TARGET_64BIT) && TARGET_LONG_BITS != 64
+#error system 64 bit configuration disagrees with cpu-param.h
+#elif defined(TARGET_32BIT) && TARGET_LONG_BITS != 32
+#error system 32 bit configuration disagrees with cpu-param.h
+#endif
+
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
 /* target_ulong is the type of a virtual address */
diff --git a/gdbstub/syscalls.c b/gdbstub/syscalls.c
index 1ca3d81305..c01f4d0dea 100644
--- a/gdbstub/syscalls.c
+++ b/gdbstub/syscalls.c
@@ -13,7 +13,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
+#include "exec/hwaddr.h"
+#include "exec/target_long.h"
 #include "semihosting/semihost.h"
 #include "sysemu/runstate.h"
 #include "gdbstub/user.h"
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index d679c7ab86..c8b1f8361b 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -31,8 +31,32 @@ user_ss.add(gdb_user)
 gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
 softmmu_ss.add(gdb_softmmu)
 
-# These have to built to the target ABI
-specific_ss.add(files('syscalls.c'))
+# These have to built to the target ABI but are otherwise target
+# independent
+gdb32_ss = ss.source_set()
+gdb64_ss = ss.source_set()
+
+gdb32_ss.add(files('syscalls.c'))
+gdb64_ss.add(files('syscalls.c'))
+
+gdb32_ss = gdb32_ss.apply(config_host, strict: false)
+gdb64_ss = gdb64_ss.apply(config_host, strict: false)
+
+libgdb32 = static_library('gdb32', gdb32_ss.sources(),
+                          name_suffix: 'fa',
+                          c_args: ['-DTARGET_LONG_BITS=32'])
+libgdb64 = static_library('gdb64', gdb64_ss.sources(),
+                          name_suffix: 'fa',
+                          c_args: ['-DTARGET_LONG_BITS=64'])
+
+gdb32 = declare_dependency(link_whole: libgdb32)
+gdb64 = declare_dependency(link_whole: libgdb64)
+
+specific_ss.add(when: 'TARGET_64BIT', if_true: gdb64)
+specific_ss.add(when: 'TARGET_32BIT', if_true: gdb32)
+
+# finally add to specific_ss depending on the target bit size
+specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
 
 # The user-target is specialised by the guest
 specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))
diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.sh
index 1892854261..bbbff7c681 100755
--- a/scripts/make-config-poison.sh
+++ b/scripts/make-config-poison.sh
@@ -5,10 +5,15 @@ if test $# = 0; then
 fi
 
 # Create list of config switches that should be poisoned in common code...
-# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
+# but filter out those which are special including:
+#   CONFIG_TCG
+#   CONFIG_USER_ONLY
+#   TARGET_[32|64]_BIT
 exec sed -n \
   -e' /CONFIG_TCG/d' \
   -e '/CONFIG_USER_ONLY/d' \
+  -e '/TARGET_64BIT/d' \
+  -e '/TARGET_32BIT/d' \
   -e '/^#define / {' \
   -e    's///' \
   -e    's/ .*//' \
-- 
2.39.2


