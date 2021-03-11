Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF7337659
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:00:28 +0100 (CET)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMnb-0006Th-5P
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUM-0003aw-Kn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:34 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUG-0006V5-SF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:34 -0500
Received: by mail-qk1-x72e.google.com with SMTP id t4so20833893qkp.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gmwGO0qEHYSo9Z61qij4y5Ji4Cvw+K/34YSzYTurmeE=;
 b=Bn+cX3Svf+VwJQHQZmrHRctkBzE//rCk1cjeCkMjbpwY/5T17rEkbTaLJKzOkUkdxH
 QrQOLmUJpnX7PcuyLZaTQlSNmo7VAuoi9KAsjbW1fcOqW8NlbYq0Fz05RIuA15qjkUIj
 h+ZiI0oiDYhHInP2V5TR9EqSAWD8sXXb6Jd7ilTWf4AYuxdh54Eywis+WQJuY7vbZ48A
 5DoRW0vBX4fR3QVMECen4K5Y54NwtUn+7IH5wijygQWNsjvQBqqishYICI2CGPQ2p88B
 d6gr1oKhtcCtDJHn9ADhrlyn3AaAtI+c5QkSRGvF37ToLRovKZzjBSks+x5fWY0Zf90s
 /bbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmwGO0qEHYSo9Z61qij4y5Ji4Cvw+K/34YSzYTurmeE=;
 b=bjeOAAXsmnPe8/t/AzscTtGCl6iqqU0qoEkfo4sc3uoIPUxCq+N7cCqkS3B7T3rYta
 P4RfriWDURHtXluQmiH+ntGpOs14hDUDoNJFsUaN2i2pdXoJTTWemw/QmFOU3r4qURdC
 I0nvRD5UZfyS0Fj4Gmh03gRViTeXx3Icnl8+cRDHELOXd2cT7DeW4XYZxmRbX/E66x3A
 tOet/+haesVS5ek8W0QSqxylqpwJY6ck42/jICEmtZmTv4HVKJ95xW4qk9JGlxgL2OG1
 +ABX7EsxlKby8hlSOQQmwDgf6SrNggLquolc+zJTzuLwQKxwInxYi1IBDS4GjLu7aAjn
 9aRw==
X-Gm-Message-State: AOAM530wwKtWpwsjSwh5dllfT+vx1ThNd7wLDNGf/M4QUM9m2rIREDGX
 QbEQ/ywxxy3rH2vBwf7xhE1BH3+f4qnXMapu
X-Google-Smtp-Source: ABdhPJxG457/V/GwW9BCyyfRKeEy7QIwjH6sV/PSefPmBVZTYrTmOB3SYtH20npGKYHYzJXjkN6tpg==
X-Received: by 2002:a37:9e88:: with SMTP id h130mr8051791qke.301.1615473627843; 
 Thu, 11 Mar 2021 06:40:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/57] tcg: Build ffi data structures for helpers
Date: Thu, 11 Mar 2021 08:39:23 -0600
Message-Id: <20210311143958.562625-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly use libffi for tci, as that is the only
portable way of calling arbitrary functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                            |   9 +-
 include/exec/helper-ffi.h              | 115 +++++++++++++++++++++++++
 include/exec/helper-tcg.h              |  24 ++++--
 target/hppa/helper.h                   |   2 +
 target/i386/ops_sse_header.h           |   6 ++
 target/m68k/helper.h                   |   1 +
 target/ppc/helper.h                    |   3 +
 tcg/tcg.c                              |  20 +++++
 tests/docker/dockerfiles/fedora.docker |   1 +
 9 files changed, 172 insertions(+), 9 deletions(-)
 create mode 100644 include/exec/helper-ffi.h

diff --git a/meson.build b/meson.build
index fda86ab8ce..e16b890546 100644
--- a/meson.build
+++ b/meson.build
@@ -1943,7 +1943,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
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
 
 subdir('backends')
 subdir('disas')
diff --git a/include/exec/helper-ffi.h b/include/exec/helper-ffi.h
new file mode 100644
index 0000000000..3af1065af3
--- /dev/null
+++ b/include/exec/helper-ffi.h
@@ -0,0 +1,115 @@
+/*
+ * Helper file for declaring TCG helper functions.
+ * This one defines data structures private to tcg.c.
+ */
+
+#ifndef HELPER_FFI_H
+#define HELPER_FFI_H 1
+
+#include "exec/helper-head.h"
+
+#define dh_ffitype_i32  &ffi_type_uint32
+#define dh_ffitype_s32  &ffi_type_sint32
+#define dh_ffitype_int  &ffi_type_sint
+#define dh_ffitype_i64  &ffi_type_uint64
+#define dh_ffitype_s64  &ffi_type_sint64
+#define dh_ffitype_f16  &ffi_type_uint32
+#define dh_ffitype_f32  &ffi_type_uint32
+#define dh_ffitype_f64  &ffi_type_uint64
+#ifdef TARGET_LONG_BITS
+# if TARGET_LONG_BITS == 32
+#  define dh_ffitype_tl &ffi_type_uint32
+# else
+#  define dh_ffitype_tl &ffi_type_uint64
+# endif
+#endif
+#define dh_ffitype_ptr  &ffi_type_pointer
+#define dh_ffitype_cptr &ffi_type_pointer
+#define dh_ffitype_void &ffi_type_void
+#define dh_ffitype_noreturn &ffi_type_void
+#define dh_ffitype_env  &ffi_type_pointer
+#define dh_ffitype(t) glue(dh_ffitype_, t)
+
+#define DEF_HELPER_FLAGS_0(NAME, FLAGS, ret)    \
+    static ffi_cif glue(cif_,NAME) = {          \
+        .rtype = dh_ffitype(ret), .nargs = 0,   \
+    };
+
+#define DEF_HELPER_FLAGS_1(NAME, FLAGS, ret, t1)                        \
+    static ffi_type *glue(cif_args_,NAME)[1] = { dh_ffitype(t1) };      \
+    static ffi_cif glue(cif_,NAME) = {                                  \
+        .rtype = dh_ffitype(ret), .nargs = 1,                           \
+        .arg_types = glue(cif_args_,NAME),                              \
+    };
+
+#define DEF_HELPER_FLAGS_2(NAME, FLAGS, ret, t1, t2)    \
+    static ffi_type *glue(cif_args_,NAME)[2] = {        \
+        dh_ffitype(t1), dh_ffitype(t2)                  \
+    };                                                  \
+    static ffi_cif glue(cif_,NAME) = {                  \
+        .rtype = dh_ffitype(ret), .nargs = 2,           \
+        .arg_types = glue(cif_args_,NAME),              \
+    };
+
+#define DEF_HELPER_FLAGS_3(NAME, FLAGS, ret, t1, t2, t3)        \
+    static ffi_type *glue(cif_args_,NAME)[3] = {                \
+        dh_ffitype(t1), dh_ffitype(t2), dh_ffitype(t3)          \
+    };                                                          \
+    static ffi_cif glue(cif_,NAME) = {                          \
+        .rtype = dh_ffitype(ret), .nargs = 3,                   \
+        .arg_types = glue(cif_args_,NAME),                      \
+    };
+
+#define DEF_HELPER_FLAGS_4(NAME, FLAGS, ret, t1, t2, t3, t4)            \
+    static ffi_type *glue(cif_args_,NAME)[4] = {                        \
+        dh_ffitype(t1), dh_ffitype(t2), dh_ffitype(t3), dh_ffitype(t4)  \
+    };                                                                  \
+    static ffi_cif glue(cif_,NAME) = {                                  \
+        .rtype = dh_ffitype(ret), .nargs = 4,                           \
+        .arg_types = glue(cif_args_,NAME),                              \
+    };
+
+#define DEF_HELPER_FLAGS_5(NAME, FLAGS, ret, t1, t2, t3, t4, t5)        \
+    static ffi_type *glue(cif_args_,NAME)[5] = {                        \
+        dh_ffitype(t1), dh_ffitype(t2), dh_ffitype(t3),                 \
+        dh_ffitype(t4), dh_ffitype(t5)                                  \
+    };                                                                  \
+    static ffi_cif glue(cif_,NAME) = {                                  \
+        .rtype = dh_ffitype(ret), .nargs = 5,                           \
+        .arg_types = glue(cif_args_,NAME),                              \
+    };
+
+#define DEF_HELPER_FLAGS_6(NAME, FLAGS, ret, t1, t2, t3, t4, t5, t6)    \
+    static ffi_type *glue(cif_args_,NAME)[6] = {                        \
+        dh_ffitype(t1), dh_ffitype(t2), dh_ffitype(t3),                 \
+        dh_ffitype(t4), dh_ffitype(t5), dh_ffitype(t6)                  \
+    };                                                                  \
+    static ffi_cif glue(cif_,NAME) = {                                  \
+        .rtype = dh_ffitype(ret), .nargs = 6,                           \
+        .arg_types = glue(cif_args_,NAME),                              \
+    };
+
+#define DEF_HELPER_FLAGS_7(NAME, FLAGS, ret, t1, t2, t3, t4, t5, t6, t7) \
+    static ffi_type *glue(cif_args_,NAME)[7] = {                        \
+        dh_ffitype(t1), dh_ffitype(t2), dh_ffitype(t3),                 \
+        dh_ffitype(t4), dh_ffitype(t5), dh_ffitype(t6), dh_ffitype(t7)  \
+    };                                                                  \
+    static ffi_cif glue(cif_,NAME) = {                                  \
+        .rtype = dh_ffitype(ret), .nargs = 7,                           \
+        .arg_types = glue(cif_args_,NAME),                              \
+    };
+
+#include "helper.h"
+#include "trace/generated-helpers.h"
+#include "tcg-runtime.h"
+
+#undef DEF_HELPER_FLAGS_0
+#undef DEF_HELPER_FLAGS_1
+#undef DEF_HELPER_FLAGS_2
+#undef DEF_HELPER_FLAGS_3
+#undef DEF_HELPER_FLAGS_4
+#undef DEF_HELPER_FLAGS_5
+#undef DEF_HELPER_FLAGS_6
+#undef DEF_HELPER_FLAGS_7
+
+#endif /* HELPER_FFI_H */
diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
index 27870509a2..a71b848576 100644
--- a/include/exec/helper-tcg.h
+++ b/include/exec/helper-tcg.h
@@ -10,50 +10,57 @@
    to get all the macros expanded first.  */
 #define str(s) #s
 
+#ifdef CONFIG_TCG_INTERPRETER
+# define DO_CIF(NAME)  .cif = &cif_##NAME,
+#else
+# define DO_CIF(NAME)
+#endif
+
 #define DEF_HELPER_FLAGS_0(NAME, FLAGS, ret) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) },
 
 #define DEF_HELPER_FLAGS_1(NAME, FLAGS, ret, t1) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) },
 
 #define DEF_HELPER_FLAGS_2(NAME, FLAGS, ret, t1, t2) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
     | dh_sizemask(t2, 2) },
 
 #define DEF_HELPER_FLAGS_3(NAME, FLAGS, ret, t1, t2, t3) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
     | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) },
 
 #define DEF_HELPER_FLAGS_4(NAME, FLAGS, ret, t1, t2, t3, t4) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
     | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) },
 
 #define DEF_HELPER_FLAGS_5(NAME, FLAGS, ret, t1, t2, t3, t4, t5) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
     | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) \
     | dh_sizemask(t5, 5) },
 
 #define DEF_HELPER_FLAGS_6(NAME, FLAGS, ret, t1, t2, t3, t4, t5, t6) \
-  { .func = HELPER(NAME), .name = str(NAME), \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
     | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) \
     | dh_sizemask(t5, 5) | dh_sizemask(t6, 6) },
 
 #define DEF_HELPER_FLAGS_7(NAME, FLAGS, ret, t1, t2, t3, t4, t5, t6, t7) \
-  { .func = HELPER(NAME), .name = str(NAME), .flags = FLAGS, \
+  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
+    .flags = FLAGS | dh_callflag(ret), \
     .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
     | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) \
     | dh_sizemask(t5, 5) | dh_sizemask(t6, 6) | dh_sizemask(t7, 7) },
@@ -64,6 +71,7 @@
 #include "plugin-helpers.h"
 
 #undef str
+#undef DO_CIF
 #undef DEF_HELPER_FLAGS_0
 #undef DEF_HELPER_FLAGS_1
 #undef DEF_HELPER_FLAGS_2
diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index 2d483aab58..35c612f09d 100644
--- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -1,9 +1,11 @@
 #if TARGET_REGISTER_BITS == 64
 # define dh_alias_tr     i64
 # define dh_is_64bit_tr  1
+# define dh_ffitype_tr   dh_ffitype_i64
 #else
 # define dh_alias_tr     i32
 # define dh_is_64bit_tr  0
+# define dh_ffitype_tr   dh_ffitype_i32
 #endif
 #define dh_ctype_tr      target_ureg
 #define dh_is_signed_tr  0
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 6c0c849347..cae50f77eb 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -27,13 +27,19 @@
 #define dh_alias_Reg ptr
 #define dh_alias_ZMMReg ptr
 #define dh_alias_MMXReg ptr
+
 #define dh_ctype_Reg Reg *
 #define dh_ctype_ZMMReg ZMMReg *
 #define dh_ctype_MMXReg MMXReg *
+
 #define dh_is_signed_Reg dh_is_signed_ptr
 #define dh_is_signed_ZMMReg dh_is_signed_ptr
 #define dh_is_signed_MMXReg dh_is_signed_ptr
 
+#define dh_ffitype_Reg  dh_ffitype_ptr
+#define dh_ffitype_ZMMReg  dh_ffitype_ptr
+#define dh_ffitype_MMXReg  dh_ffitype_ptr
+
 DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psllw, SUFFIX), void, env, Reg, Reg)
diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 77808497a9..672c99d5de 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -18,6 +18,7 @@ DEF_HELPER_4(cas2l_parallel, void, env, i32, i32, i32)
 #define dh_alias_fp ptr
 #define dh_ctype_fp FPReg *
 #define dh_is_signed_fp dh_is_signed_ptr
+#define dh_ffitype_fp dh_ffitype_ptr
 
 DEF_HELPER_3(exts32, void, env, fp, s32)
 DEF_HELPER_3(extf32, void, env, fp, f32)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6a4dccf70c..bbd4700064 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -108,10 +108,12 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 #define dh_alias_avr ptr
 #define dh_ctype_avr ppc_avr_t *
 #define dh_is_signed_avr dh_is_signed_ptr
+#define dh_ffitype_avr dh_ffitype_ptr
 
 #define dh_alias_vsr ptr
 #define dh_ctype_vsr ppc_vsr_t *
 #define dh_is_signed_vsr dh_is_signed_ptr
+#define dh_ffitype_vsr dh_ffitype_ptr
 
 DEF_HELPER_3(vavgub, void, avr, avr, avr)
 DEF_HELPER_3(vavguh, void, avr, avr, avr)
@@ -696,6 +698,7 @@ DEF_HELPER_3(store_601_batu, void, env, i32, tl)
 #define dh_alias_fprp ptr
 #define dh_ctype_fprp ppc_fprp_t *
 #define dh_is_signed_fprp dh_is_signed_ptr
+#define dh_ffitype_fprp dh_ffitype_ptr
 
 DEF_HELPER_4(dadd, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(daddq, void, env, fprp, fprp, fprp)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2991112829..6382112215 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -66,6 +66,10 @@
 #include "exec/log.h"
 #include "sysemu/sysemu.h"
 
+#ifdef CONFIG_TCG_INTERPRETER
+#include <ffi.h>
+#endif
+
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
@@ -1082,6 +1086,9 @@ void tcg_pool_reset(TCGContext *s)
 
 typedef struct TCGHelperInfo {
     void *func;
+#ifdef CONFIG_TCG_INTERPRETER
+    ffi_cif *cif;
+#endif
     const char *name;
     unsigned flags;
     unsigned sizemask;
@@ -1089,6 +1096,10 @@ typedef struct TCGHelperInfo {
 
 #include "exec/helper-proto.h"
 
+#ifdef CONFIG_TCG_INTERPRETER
+#include "exec/helper-ffi.h"
+#endif
+
 static const TCGHelperInfo all_helpers[] = {
 #include "exec/helper-tcg.h"
 };
@@ -1136,6 +1147,15 @@ void tcg_context_init(TCGContext *s)
                             (gpointer)&all_helpers[i]);
     }
 
+#ifdef CONFIG_TCG_INTERPRETER
+    for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
+        ffi_cif *cif = all_helpers[i].cif;
+        ffi_status ok = ffi_prep_cif(cif, FFI_DEFAULT_ABI, cif->nargs,
+                                     cif->rtype, cif->arg_types);
+        tcg_debug_assert(ok == FFI_OK);
+    }
+#endif
+
     tcg_target_init(s);
     process_op_defs(s);
 
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
-- 
2.25.1


