Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B723ADB44
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:22:35 +0200 (CEST)
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufc2-0006ns-JB
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUj-0000hS-D3
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:01 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUh-0002Eq-9q
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:01 -0400
Received: by mail-pl1-x635.google.com with SMTP id 69so6334630plc.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYoI4UBf5tUFjOCHxxgodMxhDrVCT55EmnBgp0S5rzE=;
 b=K2VlTU99K+nnNxnkfDuZ2Qz9BDLiIzztYqCJVeOkh4Q3+0v3n4dZhXNKnafYJczg/M
 UKk2zbOA3sX0UjQz2FxZtocKgFmzSjJgmuuS5UjwZHM6P/0o8c28CwSa+ZvmzORQ/Lvw
 rOXqFQlcDP2sj7wYVFby7BAWR13/pNBrG/ze8iPk/ijeE5nNRo27e7x71+cRwnP7vSp/
 Wc5Q6h+5UBIV85lhdoTo0xFtn1Vdx9nfHr1DNjPmtufOF+sbCRbn67dpAUA1ULQw2aBp
 fJrhLfGOmnmK+Xe1AAk6ZBlSC0aOVMrvrHeAvc31GPq24LJ8B1BOllYWpDcgj+74RXTX
 0bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GYoI4UBf5tUFjOCHxxgodMxhDrVCT55EmnBgp0S5rzE=;
 b=KOKlbM23cJOqjE6POHuBqZ4MS3bXrOvKj8C+Y122yMlgIM/m+rwZD5dQk9aeisLKM8
 pBC70KlJ//IixBHP9uH/CACNxEd2uumEI2jqzUgScgst/fOQ6lAiMfwPPk0VRu6q8Klk
 WIsMFaN5XpubIMBpbQ5Ltpr5+ZxqJQAhf8mXsqStpBZrrC2nwClluVaRHWcQLZUtrZi5
 CxZ/oIqRUAZN/45Jk3rz55gy32LASLO+QBRH60gvEolQN3rxIp85RdoleptntRoM1gev
 vmtATQ5lbBEd94DHYCAqO/fR7c+4aQKbmq3M95WHeqsO75rIevNlT+O/3ZzSA36A/RVg
 znMA==
X-Gm-Message-State: AOAM530xNp92I/L922jXRMq0uwqDxVLiGgoFGMNhnsB3U+TZantfZmme
 594wVcyy86rG+zz2uT85VI3owI25AdqJWQ==
X-Google-Smtp-Source: ABdhPJxgDKcuzQP0c47Ccqgv1FcKt0rQd4ji7sYE08LHNeLBAjqycqUCLHn8j/hbFcXVubyZQSuicg==
X-Received: by 2002:a17:90a:f094:: with SMTP id
 cn20mr17779008pjb.157.1624126497869; 
 Sat, 19 Jun 2021 11:14:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] tcg: Build ffi data structures for helpers
Date: Sat, 19 Jun 2021 11:14:27 -0700
Message-Id: <20210619181452.877683-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add libffi as a build requirement for TCI.
Add libffi to the dockerfiles to satisfy that requirement.

Construct an ffi_cif structure for each unique typemask.
Record the result in a separate hash table for later lookup;
this allows helper_table to stay const.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                                     | 58 +++++++++++++++++++
 tcg/meson.build                               |  8 ++-
 tests/docker/dockerfiles/alpine.docker        |  1 +
 tests/docker/dockerfiles/centos8.docker       |  1 +
 tests/docker/dockerfiles/debian10.docker      |  1 +
 .../dockerfiles/fedora-i386-cross.docker      |  1 +
 .../dockerfiles/fedora-win32-cross.docker     |  1 +
 .../dockerfiles/fedora-win64-cross.docker     |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/ubuntu.docker        |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
 12 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8f4f1711cd..de1a593ce7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -60,6 +60,10 @@
 #include "exec/log.h"
 #include "tcg-internal.h"
 
+#ifdef CONFIG_TCG_INTERPRETER
+#include <ffi.h>
+#endif
+
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
@@ -539,6 +543,19 @@ static const TCGHelperInfo all_helpers[] = {
 };
 static GHashTable *helper_table;
 
+#ifdef CONFIG_TCG_INTERPRETER
+static GHashTable *ffi_table;
+
+static ffi_type * const typecode_to_ffi[8] = {
+    [dh_typecode_void] = &ffi_type_void,
+    [dh_typecode_i32]  = &ffi_type_uint32,
+    [dh_typecode_s32]  = &ffi_type_sint32,
+    [dh_typecode_i64]  = &ffi_type_uint64,
+    [dh_typecode_s64]  = &ffi_type_sint64,
+    [dh_typecode_ptr]  = &ffi_type_pointer,
+};
+#endif
+
 static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_order)];
 static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
@@ -582,6 +599,47 @@ static void tcg_context_init(unsigned max_cpus)
                             (gpointer)&all_helpers[i]);
     }
 
+#ifdef CONFIG_TCG_INTERPRETER
+    /* g_direct_hash/equal for direct comparisons on uint32_t.  */
+    ffi_table = g_hash_table_new(NULL, NULL);
+    for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
+        struct {
+            ffi_cif cif;
+            ffi_type *args[];
+        } *ca;
+        uint32_t typemask = all_helpers[i].typemask;
+        gpointer hash = (gpointer)(uintptr_t)typemask;
+        ffi_status status;
+        int nargs;
+
+        if (g_hash_table_lookup(ffi_table, hash)) {
+            continue;
+        }
+
+        /* Ignoring the return type, find the last non-zero field. */
+        nargs = 32 - clz32(typemask >> 3);
+        nargs = DIV_ROUND_UP(nargs, 3);
+
+        ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
+        ca->cif.rtype = typecode_to_ffi[typemask & 7];
+        ca->cif.nargs = nargs;
+
+        if (nargs != 0) {
+            ca->cif.arg_types = ca->args;
+            for (i = 0; i < nargs; ++i) {
+                int typecode = extract32(typemask, (i + 1) * 3, 3);
+                ca->args[i] = typecode_to_ffi[typecode];
+            }
+        }
+
+        status = ffi_prep_cif(&ca->cif, FFI_DEFAULT_ABI, nargs,
+                              ca->cif.rtype, ca->cif.arg_types);
+        assert(status == FFI_OK);
+
+        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
+    }
+#endif
+
     tcg_target_init(s);
     process_op_defs(s);
 
diff --git a/tcg/meson.build b/tcg/meson.build
index 5be3915529..c4c63b19d4 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -9,6 +9,12 @@ tcg_ss.add(files(
   'tcg-op-gvec.c',
   'tcg-op-vec.c',
 ))
-tcg_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
+
+if get_option('tcg_interpreter')
+  libffi = dependency('libffi', version: '>=3.0', required: true,
+                      method: 'pkg-config', kwargs: static_kwargs)
+  specific_ss.add(libffi)
+  specific_ss.add(files('tci.c'))
+endif
 
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7eeecacc46..7e6997e301 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -22,6 +22,7 @@ ENV PACKAGES \
 	libaio-dev \
 	libbpf-dev \
 	libcap-ng-dev \
+	libffi-dev \
 	libjpeg-turbo-dev \
 	libnfs-dev \
 	libpng-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index efc1349cc8..03e0440e03 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -17,6 +17,7 @@ ENV PACKAGES \
     libbpf-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
     libgcrypt-devel \
     lzo-devel \
     make \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 63cf835ec5..4ffe47671e 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -26,6 +26,7 @@ RUN apt update && \
         gdb-multiarch \
         gettext \
         git \
+        libffi-dev \
         libncurses5-dev \
         ninja-build \
         pkg-config \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 66cdb06c19..8004fd8ee5 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -6,6 +6,7 @@ ENV PACKAGES \
     findutils \
     gcc \
     git \
+    libffi-devel.i686 \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 3733df63e9..a638afb525 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -19,6 +19,7 @@ ENV PACKAGES \
     mingw32-gmp \
     mingw32-gnutls \
     mingw32-gtk3 \
+    mingw32-libffi \
     mingw32-libjpeg-turbo \
     mingw32-libpng \
     mingw32-libtasn1 \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 2564ce4979..f53007ac86 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -18,6 +18,7 @@ ENV PACKAGES \
     mingw64-glib2 \
     mingw64-gmp \
     mingw64-gtk3 \
+    mingw64-libffi \
     mingw64-libjpeg-turbo \
     mingw64-libpng \
     mingw64-libtasn1 \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0979c0e1f4..00cac5d61c 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -33,6 +33,7 @@ ENV PACKAGES \
     libepoxy-devel \
     libfdt-devel \
     libbpf-devel \
+    libffi-devel \
     libiscsi-devel \
     libjpeg-devel \
     libpmem-devel \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index 98a527361c..24d1647a65 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -28,6 +28,7 @@ ENV PACKAGES \
     libdrm-dev \
     libepoxy-dev \
     libfdt-dev \
+    libffi-dev \
     libgbm-dev \
     libgnutls28-dev \
     libgtk-3-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index c0d3642507..2f1ec7c42b 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -16,6 +16,7 @@ ENV PACKAGES \
     libdrm-dev \
     libepoxy-dev \
     libfdt-dev \
+    libffi-dev \
     libgbm-dev \
     libgtk-3-dev \
     libibverbs-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index f1e0ebad49..fe993fe2a3 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -19,6 +19,7 @@ ENV PACKAGES flex bison \
     libdrm-dev \
     libepoxy-dev \
     libfdt-dev \
+    libffi-dev \
     libgbm-dev \
     libgtk-3-dev \
     libibverbs-dev \
-- 
2.25.1


