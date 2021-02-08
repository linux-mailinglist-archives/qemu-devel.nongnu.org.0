Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F1D31293B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:15:54 +0100 (CET)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x1l-0007O6-OB
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRq-0001mz-Dm
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:46 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRm-0005tr-HH
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id cl8so7403800pjb.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=grvYIe5/Gge3fEjJZ+Bf2tCoajmCwbWXSaPGURmUcZ8=;
 b=gL1pLnpDesm63sifvKLPt+YEL0u3sDFCOyQ+s4jj3qE197VuPG6Q/SuLkvUlelFK5f
 aBiWtxdNznDBRAqe45Vx6OGps+NM5toPgGkkSHYXPeSEI77tjzplqGPnRKBYzBwSyWmQ
 19QFg9ecROe4cUCDpLcMNcRXa9ZRlnTyrG5EUxBvHa4y3kYUaGU+M+oBxUURKn4qUtV3
 7MQ3gHwsQR5qLYTO2MeQQCsKICEbYY6NvHVFoUXQe7jejylPyC49++bbJHYUzgvn/haO
 uaQjr5MyH+ri9PaHX5kOMTsfc+BGaB/PmoPViol7dEHWwkfSNXiGafkWgLo31bD5g6up
 yDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grvYIe5/Gge3fEjJZ+Bf2tCoajmCwbWXSaPGURmUcZ8=;
 b=LS10y7bgyvUncOcNMtnMKYlNlhVcfhH4t626OzzeyAbGYIy9JjSIWGHFBOy27ksgDN
 NJzZqStfEOqjUD0FcB907zyCxll1QVDIUU8pLUQaSy4u3HjrE08xKw9/9Kj1v1SGgk3o
 jeBNFuF9LXxYj4R6cD492VF768qPLXzlxaULNQFcFSGiOY4P2w7Pn9A+wmLPGeEIMuSC
 J/oif381cTSTgebVRIlaeGJibYlSyodMoBIumpvYF1265Va2ssIkDPKR/84NQ2yeedfy
 eEGGDtbHup9CU2dXoHvXQ8UqCevEuzmMWtInWzEd3BSO+Kv2fSX4OZSZBozS+XiPIxPe
 tEGw==
X-Gm-Message-State: AOAM531hziAf7AEx9tH/sHrRwsRuJDEYTF34dsgYuh5n2GxjTr/2Cjek
 Vrw09hNdICxmUNbPPIgeaIWsfUhR9Xq6TQ==
X-Google-Smtp-Source: ABdhPJx0vDt83ldblRNu8Q1bMgVkfNArUCtJm2ZZJ47vZc6pcf4Xs65FZsi4tJHrNRqE8O/wTAnoOw==
X-Received: by 2002:a17:90a:9414:: with SMTP id
 r20mr14962341pjo.158.1612751919644; 
 Sun, 07 Feb 2021 18:38:39 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 37/70] tcg: Build ffi data structures for helpers
Date: Sun,  7 Feb 2021 18:37:19 -0800
Message-Id: <20210208023752.270606-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: sw@weilnetz.de
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
index 475d8a94ea..fc08f15a00 100644
--- a/meson.build
+++ b/meson.build
@@ -1901,7 +1901,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
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
index 0d7602abbe..45fc1a77bd 100644
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


