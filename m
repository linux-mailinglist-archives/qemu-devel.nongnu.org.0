Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7247A370FFB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:05:05 +0200 (CEST)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM5A-0007j5-Ft
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxy-0007cl-P4
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:39 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxw-0000ZV-4j
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:38 -0400
Received: by mail-pf1-x436.google.com with SMTP id k19so16034pfu.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fs6QjQmA5ZckekrFaBMI1Q70p1jpXuFR5h5RaQBin6E=;
 b=vG2A4WBeh9iCg+hUfO3zBTYW5OR5ks+zC+7SEFi2b3yJxfDpl+pHDykexoC6FUs8oC
 8VLGZ2ysPZyodyTiBxNONVZAk5e2lC2O0TxhYjMEFj8NWjG727+9EV/sMQQgPehUgu27
 LHqObZAbGcYJbu09QZ4wKWJGh5h2bn8PQ6+8edbGiQwC9/nFNQSTbaGNG9wYS9t/+zaO
 Xe5I0/bE5qrSYftMuTA7BR4wV57/OPpZQBij47r7JtVVvf8TXy3UACXjZr0ZSoxL3fWW
 amLGO87qv6pPmHsEa6xu3FZLQMi8ePZkxYigkVAf1COcrPW0CKyIlnHQHObSGdeKomfZ
 hGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fs6QjQmA5ZckekrFaBMI1Q70p1jpXuFR5h5RaQBin6E=;
 b=trIw7eT8Z8MBKdOuLpRc8u0kdp7/9hSShc++nTiqv1ptSOlqQVQE+34BS0eK62R20W
 rX7XwytOT3Tk6sWNowRvr8/1X7baQa1fOl+hUKQu6a/4B7YJ4Df27GW2A1v/Zm+8O9Qz
 mzL7lmadzBWuJ7ngJAZKIRLxkNy1WueK1FUVPK9XePx1pBk6F5JwTNwyFtuG0akvHekk
 8vnstzpZqDmwjBuFLGBrIJxzA9lNa96ngPPi3sy9XfyHHdhYv3b4A2IhLRwPPk5uC+aF
 oRGDflBDi9QrnS1amcNWO7UrUtGn7ho5EsOgn76EVfl4jHxVoZSTA3JWjbMuqujnacsz
 v0Qw==
X-Gm-Message-State: AOAM533cbZR8rZJGe0efK98FUMCb/o2sPOa8e/WcAmeDigW2SQCkUyPc
 DyLwdXROwdUmFxgoLyL71s/8e30XzT09yw==
X-Google-Smtp-Source: ABdhPJycc04YScL1OZHhQMXkumUvyPTTGHgAe/HkHJUPeahpJv9vKVU7Y2ZQjNq6f1izzpoHMM416Q==
X-Received: by 2002:aa7:8389:0:b029:209:da1c:17b5 with SMTP id
 u9-20020aa783890000b0290209da1c17b5mr16365547pfm.29.1619999854826; 
 Sun, 02 May 2021 16:57:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/26] tcg: Build ffi data structures for helpers
Date: Sun,  2 May 2021 16:57:09 -0700
Message-Id: <20210502235727.1979457-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add libffi as a build requirement for TCI.
Add libffi to the dockerfiles to satisfy that requirement.

Construct an ffi_cif structure for each unique typemask.
Record the result in a separate hash table for later lookup;
this allows helper_table to stay const.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                   |  9 ++-
 tcg/tcg.c                                     | 58 +++++++++++++++++++
 tests/docker/dockerfiles/alpine.docker        |  1 +
 tests/docker/dockerfiles/centos7.docker       |  1 +
 tests/docker/dockerfiles/centos8.docker       |  1 +
 tests/docker/dockerfiles/debian10.docker      |  1 +
 .../dockerfiles/fedora-i386-cross.docker      |  1 +
 .../dockerfiles/fedora-win32-cross.docker     |  1 +
 .../dockerfiles/fedora-win64-cross.docker     |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/ubuntu.docker        |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
 13 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e..0bb0b7b28d 100644
--- a/meson.build
+++ b/meson.build
@@ -1942,7 +1942,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'tcg/tcg-op.c',
   'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
+
+if get_option('tcg_interpreter')
+  libffi = dependency('libffi', version: '>=3.0',
+                      static: enable_static, method: 'pkg-config',
+                      required: true)
+  specific_ss.add(libffi)
+  specific_ss.add(files('tcg/tci.c'))
+endif
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1e5e165bff..8bb65ff1c6 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -67,6 +67,10 @@
 #include "sysemu/sysemu.h"
 #include "internal.h"
 
+#ifdef CONFIG_TCG_INTERPRETER
+#include <ffi.h>
+#endif
+
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
@@ -1093,6 +1097,19 @@ static const TCGHelperInfo all_helpers[] = {
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
@@ -1135,6 +1152,47 @@ void tcg_context_init(TCGContext *s)
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
 
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index d63a269aef..017cbbceac 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -20,6 +20,7 @@ ENV PACKAGES \
 	gtk+3.0-dev \
 	libaio-dev \
 	libcap-ng-dev \
+	libffi-dev \
 	libjpeg-turbo-dev \
 	libnfs-dev \
 	libpng-dev \
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 75fdb53c7c..fff7c5a424 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -20,6 +20,7 @@ ENV PACKAGES \
     libaio-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
     libgcrypt-devel \
     librdmacm-devel \
     libzstd-devel \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a8c6c528b0..fcab3bc8e4 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -16,6 +16,7 @@ ENV PACKAGES \
     libaio-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
     libgcrypt-devel \
     lzo-devel \
     make \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index d034acbd25..1f8bea97b3 100644
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
index 966072c08e..b620d7664d 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -5,6 +5,7 @@ ENV PACKAGES \
     findutils \
     gcc \
     git \
+    libffi-devel.i686 \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 81b5659e9c..5072c9c2a6 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -18,6 +18,7 @@ ENV PACKAGES \
     mingw32-gmp \
     mingw32-gnutls \
     mingw32-gtk3 \
+    mingw32-libffi \
     mingw32-libjpeg-turbo \
     mingw32-libpng \
     mingw32-libtasn1 \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index bcb428e724..5cdca965c2 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -17,6 +17,7 @@ ENV PACKAGES \
     mingw64-glib2 \
     mingw64-gmp \
     mingw64-gtk3 \
+    mingw64-libffi \
     mingw64-libjpeg-turbo \
     mingw64-libpng \
     mingw64-libtasn1 \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 915fdc1845..8140fe67b2 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -32,6 +32,7 @@ ENV PACKAGES \
     libcurl-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
     libiscsi-devel \
     libjpeg-devel \
     libpmem-devel \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index b5ef7a8198..204a7c10a5 100644
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
index 9b0a19ba5e..4d567a46fe 100644
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
index 9750016e51..f73631ba84 100644
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


