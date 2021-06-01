Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D83F397608
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:04:10 +0200 (CEST)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5w9-0005LO-BT
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tN-0002Cw-6Y
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:17 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:38450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tI-0002SN-Ot
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:16 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b25so15645391iot.5
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ND6uEYhflqUThkKzUpQL4wLnzSOx0ur3u4gNYBO/EOw=;
 b=sJ7ZDLhkPMrndK2hAYTJOm8FZ77T5LxjoJ9uHjGC1wE3mJeY7swlZ4TVHvqzmIZsX7
 qgiw+Ri3B8yvxImIBdDUsbILKXYdqzzJj/0BFmEN1cACS8CLQuUGO4vIZXCYV1NwD29k
 i+GZtJH/pC+TejBzQyyGIt4I5tmnVaPTCIZn5IrM3SGqUSdjG2Ni6uPkSlpSmjyvPiQS
 4VWrRr/7ogxSzo7VacMqIfRlEMPv9EBefMiPm7E9KCAw9pzhmuyKnEmtsaxiZHbkyQSr
 rYNeit2HnNnJi47BuPKj3ETa08EkhzSsz7GmhRx06Otm70k9gWQKf8JLjaPE5jMWH8Oh
 BY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ND6uEYhflqUThkKzUpQL4wLnzSOx0ur3u4gNYBO/EOw=;
 b=Qfe69OJLJd+sD6jVcvvSAgmk3LTsS1TC4zZ2RCHtVNt1TcXduChlJpBQY9rsVANSKd
 7yQCY69Tg4VKJ1m1O2q7p40CZr6MQ+ruUW1ypbIel6y2KD1wXEmPZEbMbSOVxANRS+QN
 RHzjVbkf4+zw5+7YSv8wuSJF57Q6pKNquHfTfA/QtbTNg9N6JqXugom8c8KGy3b2qRJf
 xX/MEaWfsu2FhaKz8CGvHpcsrn55W9S500OudJqhN6U4NtagsEQ0Q5fyYxuQ4tYxR8xc
 nE3KrXl6rWlkartjTU+sBEZGAT2ntaFpHTDbchHSG4j48PnxaCg6EsOevG+s9AeQSr7H
 7+/A==
X-Gm-Message-State: AOAM5311nUy9DeVUKB6zGPPVR7x+J3pf3vTbWwWrSZHv4gstfHbr4TVQ
 y9qiZ4Ne2n6NHdrqyc11SPIUF7lrR4fSAltf
X-Google-Smtp-Source: ABdhPJz9XvvLvEt450qGGlp3YnP79lKF3iOZKIbYdRuOZPhJaqO0fKO302kfD528UFD90xT+WlnXBQ==
X-Received: by 2002:a6b:5112:: with SMTP id f18mr11186226iob.142.1622559671358; 
 Tue, 01 Jun 2021 08:01:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/27] tcg: Combine dh_is_64bit and dh_is_signed to
 dh_typecode
Date: Tue,  1 Jun 2021 08:00:40 -0700
Message-Id: <20210601150106.12761-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly be interested in distinguishing pointers
from integers in the helper's declaration, as well as a
true void return.  We currently have two parallel 1 bit
fields; merge them and expand to a 3 bit field.

Our current maximum is 7 helper arguments, plus the return
makes 8 * 3 = 24 bits used within the uint32_t typemask.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 6888514635..16cd318b83 100644
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
index ea9f2a236c..c3cb9f1c3f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -108,11 +108,9 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 
 #define dh_alias_avr ptr
 #define dh_ctype_avr ppc_avr_t *
-#define dh_is_signed_avr dh_is_signed_ptr
 
 #define dh_alias_vsr ptr
 #define dh_ctype_vsr ppc_vsr_t *
-#define dh_is_signed_vsr dh_is_signed_ptr
 
 DEF_HELPER_3(vavgub, void, avr, avr, avr)
 DEF_HELPER_3(vavguh, void, avr, avr, avr)
@@ -696,7 +694,6 @@ DEF_HELPER_3(store_601_batu, void, env, i32, tl)
 
 #define dh_alias_fprp ptr
 #define dh_ctype_fprp ppc_fprp_t *
-#define dh_is_signed_fprp dh_is_signed_ptr
 
 DEF_HELPER_4(dadd, void, env, fprp, fprp, fprp)
 DEF_HELPER_4(daddq, void, env, fprp, fprp, fprp)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index db806a6658..5c9a89d22d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1087,7 +1087,7 @@ typedef struct TCGHelperInfo {
     void *func;
     const char *name;
     unsigned flags;
-    unsigned sizemask;
+    unsigned typemask;
 } TCGHelperInfo;
 
 #include "exec/helper-proto.h"
@@ -1962,13 +1962,13 @@ bool tcg_op_supported(TCGOpcode op)
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
@@ -1981,36 +1981,41 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
@@ -2029,7 +2034,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     if (ret != NULL) {
 #if defined(__sparc__) && !defined(__arch64__) \
     && !defined(CONFIG_TCG_INTERPRETER)
-        if (orig_sizemask & 1) {
+        if ((typemask & 6) == dh_typecode_i64) {
             /* The 32-bit ABI is going to return the 64-bit value in
                the %o0/%o1 register pair.  Prepare for this by using
                two return temporaries, and reassemble below.  */
@@ -2043,7 +2048,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
             nb_rets = 1;
         }
 #else
-        if (TCG_TARGET_REG_BITS < 64 && (sizemask & 1)) {
+        if (TCG_TARGET_REG_BITS < 64 && (typemask & 6) == dh_typecode_i64) {
 #ifdef HOST_WORDS_BIGENDIAN
             op->args[pi++] = temp_arg(ret + 1);
             op->args[pi++] = temp_arg(ret);
@@ -2064,7 +2069,9 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
     real_args = 0;
     for (i = 0; i < nargs; i++) {
-        int is_64bit = sizemask & (1 << (i+1)*2);
+        int argtype = extract32(typemask, (i + 1) * 3, 3);
+        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
+
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
 #ifdef TCG_TARGET_CALL_ALIGN_ARGS
             /* some targets want aligned 64 bit args */
@@ -2109,7 +2116,9 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
@@ -2117,7 +2126,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
             real_args++;
         }
     }
-    if (orig_sizemask & 1) {
+    if ((orig_typemask & 6) == dh_typecode_i64) {
         /* The 32-bit ABI returned two 32-bit pieces.  Re-assemble them.
            Note that describing these as TCGv_i64 eliminates an unnecessary
            zero-extension that tcg_gen_concat_i32_i64 would create.  */
@@ -2127,8 +2136,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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


