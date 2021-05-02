Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B77370FF4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:59:34 +0200 (CEST)
Received: from localhost ([::1]:56628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLzp-0000ux-Qt
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxv-0007V0-3x
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:35 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxq-0000Vl-Sb
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:34 -0400
Received: by mail-pg1-x535.google.com with SMTP id d10so2477034pgf.12
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oG3FT91MlimZN1EhoCocvC8YpQvEz3CsFAvv5nePBiE=;
 b=M23J2o92d2WUoqhVhjeJ8UP3FbssFMN08B+mND5kagLyFekOa9Vut2Exarz5hNp5r8
 6zery8uzZIM3BGO46GiPwIRl0F34ECzJPnba0goUm6IEDMS0Itf/YreQUIfS19ItOaor
 8ijDjHHBGkE/PlrhiAyhG8ptxZ1Zja6AV/XXjtL3rWXrAjODgnVVRmMVb3s901Q+C42s
 xlZEO9Dq6lSkTOFV4bDYOOf+Ty6lWXCYD9NvBRLLY5DQx4V8+xonTJ86B7QX5GE+prjW
 9Jh18hzlGNZ77Kf1ROGW6oMIw8BEn/E2nPiID1fBnY2M7HYwHOZWz9un8aoW0MnJ/oPS
 6y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oG3FT91MlimZN1EhoCocvC8YpQvEz3CsFAvv5nePBiE=;
 b=Y6fF41xE0RjVSSva6e//hpTqg8+OFW4rPob0zuf/zm7Of8Mx7m97vVXwQfsG5zZynw
 zGoTT+YbRpco03waw9iti1u1zpr7EYLr9ULZFt+Cg1bCO+NHApX5UW3cO4WGzxz1NtBl
 +FacCLvpSVATckv4Pk9KBN0I77TYLNA8TGLgCb+VK1CdY/VpZXsxX460SUv/UVuTM2Wc
 aplOwtnbZpdwbPAQXlO5gvmLOzy9JIYkRa+4gPbElrsrBrvVafqzTk5qjVbOZiQsqied
 XpaOAGalwVW8+JOMwW6/VQUsQqSYa5i0tKEWXjU0wjB+FwbUq53vvX0AU3Ctkzkmle+a
 O1gA==
X-Gm-Message-State: AOAM530brD+uXz2WJ4GXVHEqJpXG+72hYMxWnSEwBbGnCOxhVoc1WXJX
 9tResS0bpadvOC+qiJT+rn0cy5W6nRVZRg==
X-Google-Smtp-Source: ABdhPJwo15OPoZSIOoeWibSRjGafIeVEn0U2YIdrUb13xWQbCYVMc9f3FvlrjAxAVbgLE+YC7XXh4w==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr15459760pgm.444.1619999849504; 
 Sun, 02 May 2021 16:57:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/26] tcg: Combine dh_is_64bit and dh_is_signed to
 dh_typecode
Date: Sun,  2 May 2021 16:57:02 -0700
Message-Id: <20210502235727.1979457-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

We will shortly be interested in distinguishing pointers
from integers in the helper's declaration, as well as a
true void return.  We currently have two parallel 1 bit
fields; merge them and expand to a 3 bit field.

Our current maximum is 7 helper arguments, plus the return
makes 8 * 3 = 24 bits used within the uint32_t typemask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h   | 37 +++++--------------
 include/exec/helper-tcg.h    | 34 ++++++++---------
 target/hppa/helper.h         |  3 --
 target/i386/ops_sse_header.h |  3 --
 target/m68k/helper.h         |  1 -
 target/ppc/helper.h          |  3 --
 tcg/tcg.c                    | 71 +++++++++++++++++++++---------------
 7 files changed, 67 insertions(+), 85 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 3094c7946d..b974eb394a 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -85,32 +85,14 @@
 #define dh_retvar_ptr tcgv_ptr_temp(retval)
 #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
 
-#define dh_is_64bit_void 0
-#define dh_is_64bit_noreturn 0
-#define dh_is_64bit_i32 0
-#define dh_is_64bit_i64 1
-#define dh_is_64bit_ptr (sizeof(void *) == 8)
-#define dh_is_64bit_cptr dh_is_64bit_ptr
-#define dh_is_64bit(t) glue(dh_is_64bit_, dh_alias(t))
-
-#define dh_is_signed_void 0
-#define dh_is_signed_noreturn 0
-#define dh_is_signed_i32 0
-#define dh_is_signed_s32 1
-#define dh_is_signed_i64 0
-#define dh_is_signed_s64 1
-#define dh_is_signed_f16 0
-#define dh_is_signed_f32 0
-#define dh_is_signed_f64 0
-#define dh_is_signed_tl  0
-#define dh_is_signed_int 1
-/* ??? This is highly specific to the host cpu.  There are even special
-   extension instructions that may be required, e.g. ia64's addp4.  But
-   for now we don't support any 64-bit targets with 32-bit pointers.  */
-#define dh_is_signed_ptr 0
-#define dh_is_signed_cptr dh_is_signed_ptr
-#define dh_is_signed_env dh_is_signed_ptr
-#define dh_is_signed(t) dh_is_signed_##t
+#define dh_typecode_void 0
+#define dh_typecode_noreturn 0
+#define dh_typecode_i32 2
+#define dh_typecode_s32 3
+#define dh_typecode_i64 4
+#define dh_typecode_s64 5
+#define dh_typecode_ptr 6
+#define dh_typecode(t) glue(dh_typecode_, dh_alias(t))
 
 #define dh_callflag_i32  0
 #define dh_callflag_s32  0
@@ -126,8 +108,7 @@
 #define dh_callflag_noreturn TCG_CALL_NO_RETURN
 #define dh_callflag(t) glue(dh_callflag_, dh_alias(t))
 
-#define dh_sizemask(t, n) \
-  ((dh_is_64bit(t) << (n*2)) | (dh_is_signed(t) << (n*2+1)))
+#define dh_typemask(t, n)  (dh_typecode(t) << (n * 3))
 
 #define dh_arg(t, n) \
   glue(glue(tcgv_, dh_alias(t)), _temp)(glue(arg, n))
diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
index 27870509a2..32dfe94903 100644
--- a/include/exec/helper-tcg.h
+++ b/include/exec/helper-tcg.h
@@ -13,50 +13,50 @@
 #define DEF_HELPER_FLAGS_0(NAME, FLAGS, ret) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) },
+    .typemask = dh_typemask(ret, 0) },
 
 #define DEF_HELPER_FLAGS_1(NAME, FLAGS, ret, t1) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) },
 
 #define DEF_HELPER_FLAGS_2(NAME, FLAGS, ret, t1, t2) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
-    | dh_sizemask(t2, 2) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) \
+    | dh_typemask(t2, 2) },
 
 #define DEF_HELPER_FLAGS_3(NAME, FLAGS, ret, t1, t2, t3) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
-    | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) \
+    | dh_typemask(t2, 2) | dh_typemask(t3, 3) },
 
 #define DEF_HELPER_FLAGS_4(NAME, FLAGS, ret, t1, t2, t3, t4) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
-    | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) \
+    | dh_typemask(t2, 2) | dh_typemask(t3, 3) | dh_typemask(t4, 4) },
 
 #define DEF_HELPER_FLAGS_5(NAME, FLAGS, ret, t1, t2, t3, t4, t5) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
-    | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) \
-    | dh_sizemask(t5, 5) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) \
+    | dh_typemask(t2, 2) | dh_typemask(t3, 3) | dh_typemask(t4, 4) \
+    | dh_typemask(t5, 5) },
 
 #define DEF_HELPER_FLAGS_6(NAME, FLAGS, ret, t1, t2, t3, t4, t5, t6) \
   { .func = HELPER(NAME), .name = str(NAME), \
     .flags = FLAGS | dh_callflag(ret), \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
-    | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) \
-    | dh_sizemask(t5, 5) | dh_sizemask(t6, 6) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) \
+    | dh_typemask(t2, 2) | dh_typemask(t3, 3) | dh_typemask(t4, 4) \
+    | dh_typemask(t5, 5) | dh_typemask(t6, 6) },
 
 #define DEF_HELPER_FLAGS_7(NAME, FLAGS, ret, t1, t2, t3, t4, t5, t6, t7) \
   { .func = HELPER(NAME), .name = str(NAME), .flags = FLAGS, \
-    .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) \
-    | dh_sizemask(t2, 2) | dh_sizemask(t3, 3) | dh_sizemask(t4, 4) \
-    | dh_sizemask(t5, 5) | dh_sizemask(t6, 6) | dh_sizemask(t7, 7) },
+    .typemask = dh_typemask(ret, 0) | dh_typemask(t1, 1) \
+    | dh_typemask(t2, 2) | dh_typemask(t3, 3) | dh_typemask(t4, 4) \
+    | dh_typemask(t5, 5) | dh_typemask(t6, 6) | dh_typemask(t7, 7) },
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index 2d483aab58..0a629ffa7c 100644
--- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -1,12 +1,9 @@
 #if TARGET_REGISTER_BITS == 64
 # define dh_alias_tr     i64
-# define dh_is_64bit_tr  1
 #else
 # define dh_alias_tr     i32
-# define dh_is_64bit_tr  0
 #endif
 #define dh_ctype_tr      target_ureg
-#define dh_is_signed_tr  0
 
 DEF_HELPER_2(excp, noreturn, env, int)
 DEF_HELPER_FLAGS_2(tsv, TCG_CALL_NO_WG, void, env, tr)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 6c0c849347..e68af5c403 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -30,9 +30,6 @@
 #define dh_ctype_Reg Reg *
 #define dh_ctype_ZMMReg ZMMReg *
 #define dh_ctype_MMXReg MMXReg *
-#define dh_is_signed_Reg dh_is_signed_ptr
-#define dh_is_signed_ZMMReg dh_is_signed_ptr
-#define dh_is_signed_MMXReg dh_is_signed_ptr
 
 DEF_HELPER_3(glue(psrlw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psraw, SUFFIX), void, env, Reg, Reg)
diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 77808497a9..9842eeaa95 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -17,7 +17,6 @@ DEF_HELPER_4(cas2l_parallel, void, env, i32, i32, i32)
 
 #define dh_alias_fp ptr
 #define dh_ctype_fp FPReg *
-#define dh_is_signed_fp dh_is_signed_ptr
 
 DEF_HELPER_3(exts32, void, env, fp, s32)
 DEF_HELPER_3(extf32, void, env, fp, f32)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6a4dccf70c..9d45b62f40 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -107,11 +107,9 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 
 #define dh_alias_avr ptr
 #define dh_ctype_avr ppc_avr_t *
-#define dh_is_signed_avr dh_is_signed_ptr
 
 #define dh_alias_vsr ptr
 #define dh_ctype_vsr ppc_vsr_t *
-#define dh_is_signed_vsr dh_is_signed_ptr
 
 DEF_HELPER_3(vavgub, void, avr, avr, avr)
 DEF_HELPER_3(vavguh, void, avr, avr, avr)
@@ -695,7 +693,6 @@ DEF_HELPER_3(store_601_batu, void, env, i32, tl)
 
 #define dh_alias_fprp ptr
 #define dh_ctype_fprp ppc_fprp_t *
-#define dh_is_signed_fprp dh_is_signed_ptr
 
 DEF_HELPER_4(dadd, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(daddq, void, env, fprp, fprp, fprp)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1fbe0b686d..3c7c9a5517 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1089,7 +1089,7 @@ typedef struct TCGHelperInfo {
     void *func;
     const char *name;
     unsigned flags;
-    unsigned sizemask;
+    unsigned typemask;
 } TCGHelperInfo;
 
 #include "exec/helper-proto.h"
@@ -1964,13 +1964,13 @@ bool tcg_op_supported(TCGOpcode op)
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 {
     int i, real_args, nb_rets, pi;
-    unsigned sizemask, flags;
+    unsigned typemask, flags;
     TCGHelperInfo *info;
     TCGOp *op;
 
     info = g_hash_table_lookup(helper_table, (gpointer)func);
     flags = info->flags;
-    sizemask = info->sizemask;
+    typemask = info->typemask;
 
 #ifdef CONFIG_PLUGIN
     /* detect non-plugin helpers */
@@ -1983,36 +1983,41 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     && !defined(CONFIG_TCG_INTERPRETER)
     /* We have 64-bit values in one register, but need to pass as two
        separate parameters.  Split them.  */
-    int orig_sizemask = sizemask;
+    int orig_typemask = typemask;
     int orig_nargs = nargs;
     TCGv_i64 retl, reth;
     TCGTemp *split_args[MAX_OPC_PARAM];
 
     retl = NULL;
     reth = NULL;
-    if (sizemask != 0) {
-        for (i = real_args = 0; i < nargs; ++i) {
-            int is_64bit = sizemask & (1 << (i+1)*2);
-            if (is_64bit) {
-                TCGv_i64 orig = temp_tcgv_i64(args[i]);
-                TCGv_i32 h = tcg_temp_new_i32();
-                TCGv_i32 l = tcg_temp_new_i32();
-                tcg_gen_extr_i64_i32(l, h, orig);
-                split_args[real_args++] = tcgv_i32_temp(h);
-                split_args[real_args++] = tcgv_i32_temp(l);
-            } else {
-                split_args[real_args++] = args[i];
-            }
+    typemask = 0;
+    for (i = real_args = 0; i < nargs; ++i) {
+        int argtype = extract32(orig_typemask, (i + 1) * 3, 3);
+        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
+
+        if (is_64bit) {
+            TCGv_i64 orig = temp_tcgv_i64(args[i]);
+            TCGv_i32 h = tcg_temp_new_i32();
+            TCGv_i32 l = tcg_temp_new_i32();
+            tcg_gen_extr_i64_i32(l, h, orig);
+            split_args[real_args++] = tcgv_i32_temp(h);
+            typemask |= dh_typecode_i32 << (real_args * 3);
+            split_args[real_args++] = tcgv_i32_temp(l);
+            typemask |= dh_typecode_i32 << (real_args * 3);
+        } else {
+            split_args[real_args++] = args[i];
+            typemask |= argtype << (real_args * 3);
         }
-        nargs = real_args;
-        args = split_args;
-        sizemask = 0;
     }
+    nargs = real_args;
+    args = split_args;
 #elif defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
     for (i = 0; i < nargs; ++i) {
-        int is_64bit = sizemask & (1 << (i+1)*2);
-        int is_signed = sizemask & (2 << (i+1)*2);
-        if (!is_64bit) {
+        int argtype = extract32(typemask, (i + 1) * 3, 3);
+        bool is_32bit = (argtype & ~1) == dh_typecode_i32;
+        bool is_signed = argtype & 1;
+
+        if (is_32bit) {
             TCGv_i64 temp = tcg_temp_new_i64();
             TCGv_i64 orig = temp_tcgv_i64(args[i]);
             if (is_signed) {
@@ -2031,7 +2036,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     if (ret != NULL) {
 #if defined(__sparc__) && !defined(__arch64__) \
     && !defined(CONFIG_TCG_INTERPRETER)
-        if (orig_sizemask & 1) {
+        if ((typemask & 6) == dh_typecode_i64) {
             /* The 32-bit ABI is going to return the 64-bit value in
                the %o0/%o1 register pair.  Prepare for this by using
                two return temporaries, and reassemble below.  */
@@ -2045,7 +2050,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
             nb_rets = 1;
         }
 #else
-        if (TCG_TARGET_REG_BITS < 64 && (sizemask & 1)) {
+        if (TCG_TARGET_REG_BITS < 64 && (typemask & 6) == dh_typecode_i64) {
 #ifdef HOST_WORDS_BIGENDIAN
             op->args[pi++] = temp_arg(ret + 1);
             op->args[pi++] = temp_arg(ret);
@@ -2066,7 +2071,9 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
     real_args = 0;
     for (i = 0; i < nargs; i++) {
-        int is_64bit = sizemask & (1 << (i+1)*2);
+        int argtype = extract32(typemask, (i + 1) * 3, 3);
+        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
+
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
 #ifdef TCG_TARGET_CALL_ALIGN_ARGS
             /* some targets want aligned 64 bit args */
@@ -2111,7 +2118,9 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     && !defined(CONFIG_TCG_INTERPRETER)
     /* Free all of the parts we allocated above.  */
     for (i = real_args = 0; i < orig_nargs; ++i) {
-        int is_64bit = orig_sizemask & (1 << (i+1)*2);
+        int argtype = extract32(orig_typemask, (i + 1) * 3, 3);
+        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
+
         if (is_64bit) {
             tcg_temp_free_internal(args[real_args++]);
             tcg_temp_free_internal(args[real_args++]);
@@ -2119,7 +2128,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
             real_args++;
         }
     }
-    if (orig_sizemask & 1) {
+    if ((orig_typemask & 6) == dh_typecode_i64) {
         /* The 32-bit ABI returned two 32-bit pieces.  Re-assemble them.
            Note that describing these as TCGv_i64 eliminates an unnecessary
            zero-extension that tcg_gen_concat_i32_i64 would create.  */
@@ -2129,8 +2138,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     }
 #elif defined(TCG_TARGET_EXTEND_ARGS) && TCG_TARGET_REG_BITS == 64
     for (i = 0; i < nargs; ++i) {
-        int is_64bit = sizemask & (1 << (i+1)*2);
-        if (!is_64bit) {
+        int argtype = extract32(typemask, (i + 1) * 3, 3);
+        bool is_32bit = (argtype & ~1) == dh_typecode_i32;
+
+        if (is_32bit) {
             tcg_temp_free_internal(args[i]);
         }
     }
-- 
2.25.1


