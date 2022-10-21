Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D260720F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:22:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnIr-0005hV-64
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:22:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHm-0003LX-LR
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHc-0003HH-85
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:32 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHa-0005pw-Cx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id d24so1584851pls.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SfazqaVq/Md711XTgHXaB4eXQUcEJfZf9rE0mqnfz88=;
 b=bX8u8yMMLpscGHMN3svAsaWpB5mG6Rwt+7dnXucOIwfjlS7erxhpRNQIwc/AG++tnk
 8TX6b4dOjIBocV2Kd4oM1OPTj2KiRXoxotqW/zWWX5eWSsdn7OArL4nFAjybw/zucPCF
 TKpBrhEHBQer1bolMwwwMhrR4fnKXE+v3q15TTZFyCWB5j+8cCs+Mo3P4m5ShhTECBWd
 Ps/v8v/OlDah3bohctPu1P+94CowCE/VSuC6LYpff2C4rcvHIchACzIM4vCeTMlJp8fd
 XGmrau/0B0pXoZF4ZtN6coRHPDQNIdIcOtcPxcPu/Ijts2fFuoXIM7aeXHQT9KxM9Dg/
 8iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SfazqaVq/Md711XTgHXaB4eXQUcEJfZf9rE0mqnfz88=;
 b=wph0EcaHAzTo1x5lFXrQ54Gc4Q9kZO5eJePEyiwwCD2tbqriPb3sDjbrawfjXUMxpA
 nkiGhvLLicJtp6IA/b+inQiJjSsuMyvD/tHROfbRcJUV4Fxg2BpJRPi2L0Pk0aMrvGN1
 P3yAeI9sMGJPEmJOgF2eqaWzatNjDjELQ4clPyOccHt0R7Icg+znoBA7U/E4/JbNI0Xj
 ZqYEcdcquhBrkq1ONc/1TuoN2xJNGd2GD6oHQosSxHzEn6X4VORCPsAPF32aHwTIZPsH
 GAyG9KuWhlv5CBUQArPX5ql34tHuvMKGBQ4nkyEe2yGabbtmKdOnyOyZgeYpf6b+1Jme
 AhhA==
X-Gm-Message-State: ACrzQf1v/QyHZ7pKl/rFv0W9qb5dCVinwHPGRM0G0Un+y4FYiGrnkHRw
 bOaJ8zl3duK6WtD9fzy876gIveMZsDS0xKkm
X-Google-Smtp-Source: AMsMyM6s9/Ai85Fa1KuPZUkyU5ivbfyyIHMWP1w0RFumg1/b+3EHU3WTH2C/kGwHjt8Z9WoTvidbTQ==
X-Received: by 2002:a17:90a:ad08:b0:212:d5f1:e0c6 with SMTP id
 r8-20020a17090aad0800b00212d5f1e0c6mr298457pjq.228.1666336648587; 
 Fri, 21 Oct 2022 00:17:28 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/36] tcg: Define TCG_TYPE_I128 and related helper macros
Date: Fri, 21 Oct 2022 17:15:36 +1000
Message-Id: <20221021071549.2398137-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Begin staging in support for TCGv_i128 with Int128.
Define the type enumerator, the typedef, and the
helper-head.h macros.

This cannot yet be used, because you can't allocate
temporaries of this new type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |  7 +++++++
 include/tcg/tcg.h          | 28 ++++++++++++++--------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index e242fed46e..9753df8e80 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -26,6 +26,7 @@
 #define dh_alias_int i32
 #define dh_alias_i64 i64
 #define dh_alias_s64 i64
+#define dh_alias_i128 i128
 #define dh_alias_f16 i32
 #define dh_alias_f32 i32
 #define dh_alias_f64 i64
@@ -40,6 +41,7 @@
 #define dh_ctype_int int
 #define dh_ctype_i64 uint64_t
 #define dh_ctype_s64 int64_t
+#define dh_ctype_i128 Int128
 #define dh_ctype_f16 uint32_t
 #define dh_ctype_f32 float32
 #define dh_ctype_f64 float64
@@ -71,6 +73,7 @@
 #define dh_retvar_decl0_noreturn void
 #define dh_retvar_decl0_i32 TCGv_i32 retval
 #define dh_retvar_decl0_i64 TCGv_i64 retval
+#define dh_retval_decl0_i128 TCGv_i128 retval
 #define dh_retvar_decl0_ptr TCGv_ptr retval
 #define dh_retvar_decl0(t) glue(dh_retvar_decl0_, dh_alias(t))
 
@@ -78,6 +81,7 @@
 #define dh_retvar_decl_noreturn
 #define dh_retvar_decl_i32 TCGv_i32 retval,
 #define dh_retvar_decl_i64 TCGv_i64 retval,
+#define dh_retvar_decl_i128 TCGv_i128 retval,
 #define dh_retvar_decl_ptr TCGv_ptr retval,
 #define dh_retvar_decl(t) glue(dh_retvar_decl_, dh_alias(t))
 
@@ -85,6 +89,7 @@
 #define dh_retvar_noreturn NULL
 #define dh_retvar_i32 tcgv_i32_temp(retval)
 #define dh_retvar_i64 tcgv_i64_temp(retval)
+#define dh_retvar_i128 tcgv_i128_temp(retval)
 #define dh_retvar_ptr tcgv_ptr_temp(retval)
 #define dh_retvar(t) glue(dh_retvar_, dh_alias(t))
 
@@ -95,6 +100,7 @@
 #define dh_typecode_i64 4
 #define dh_typecode_s64 5
 #define dh_typecode_ptr 6
+#define dh_typecode_i128 7
 #define dh_typecode_int dh_typecode_s32
 #define dh_typecode_f16 dh_typecode_i32
 #define dh_typecode_f32 dh_typecode_i32
@@ -104,6 +110,7 @@
 
 #define dh_callflag_i32  0
 #define dh_callflag_i64  0
+#define dh_callflag_i128 0
 #define dh_callflag_ptr  0
 #define dh_callflag_void 0
 #define dh_callflag_noreturn TCG_CALL_NO_RETURN
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8d0626c797..88fb4f1d17 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -38,18 +38,15 @@
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
 
-#if HOST_LONG_BITS == 32
 #define MAX_OPC_PARAM_PER_ARG 2
-#else
-#define MAX_OPC_PARAM_PER_ARG 1
-#endif
 #define MAX_OPC_PARAM_IARGS 7
 #define MAX_OPC_PARAM_OARGS 1
 #define MAX_OPC_PARAM_ARGS (MAX_OPC_PARAM_IARGS + MAX_OPC_PARAM_OARGS)
 
-/* A Call op needs up to 4 + 2N parameters on 32-bit archs,
- * and up to 4 + N parameters on 64-bit archs
- * (N = number of input arguments + output arguments).  */
+/*
+ * A Call op needs up to 4 + 2N parameters.
+ * (N = number of input arguments + output arguments).
+ */
 #define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
 
 #define CPU_TEMP_BUF_NLONGS 128
@@ -289,6 +286,7 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
+    TCG_TYPE_I128,
 
     TCG_TYPE_V64,
     TCG_TYPE_V128,
@@ -370,13 +368,14 @@ typedef tcg_target_ulong TCGArg;
    in tcg/README. Target CPU front-end code uses these types to deal
    with TCG variables as it emits TCG code via the tcg_gen_* functions.
    They come in several flavours:
-    * TCGv_i32 : 32 bit integer type
-    * TCGv_i64 : 64 bit integer type
-    * TCGv_ptr : a host pointer type
-    * TCGv_vec : a host vector type; the exact size is not exposed
-                 to the CPU front-end code.
-    * TCGv : an integer type the same size as target_ulong
-             (an alias for either TCGv_i32 or TCGv_i64)
+    * TCGv_i32  : 32 bit integer type
+    * TCGv_i64  : 64 bit integer type
+    * TCGv_i128 : 128 bit integer type
+    * TCGv_ptr  : a host pointer type
+    * TCGv_vec  : a host vector type; the exact size is not exposed
+                  to the CPU front-end code.
+    * TCGv      : an integer type the same size as target_ulong
+                  (an alias for either TCGv_i32 or TCGv_i64)
    The compiler's type checking will complain if you mix them
    up and pass the wrong sized TCGv to a function.
 
@@ -396,6 +395,7 @@ typedef tcg_target_ulong TCGArg;
 
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
+typedef struct TCGv_i128_d *TCGv_i128;
 typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
-- 
2.34.1


