Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12338681D48
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1J-0001rY-Dl; Mon, 30 Jan 2023 16:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1G-0001rE-UG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:48:54 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1E-0005Zl-VB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:48:54 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so5892136pjb.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYhih3WzBvljJJYreEPqLN+cqoryMajrlaD+6+DuEUE=;
 b=aOaD6hhCyCDgJ9fBD1H14xElnrVJ9c/h/TzTjC4s3LybO4+F2czuY24sGtMFrjDYmG
 yJmDhBOGYskjaIDduxfKnVaiBUKWS5gj2h+NxDhGZ67WH/cSv2K4CPTX1oyy9MSrsQHr
 8auVZP0FIimBmnDpb4tbJ7OSxm3FI5vI2aE7unI/mdA5KBBn7RyROBn18dvzM+fiUehr
 K8M25c+egsRlNL+2abMMyqIyRa95WeKTFcX9XslmNy4aV2DW/NpT+OHAEDHd4CI5NNI0
 ILnFuu/Bthn6jz+lAHwFxhN/X/WmNryGYNO+m6bTyMnZCp47f0ezAvgaflbbc9cc52x6
 fNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYhih3WzBvljJJYreEPqLN+cqoryMajrlaD+6+DuEUE=;
 b=Rfr4T/8vVJN+HR8jmp27uj6EIYy8LHG9JJrULWG5ltnQEtYcZw0xILHNcU0YAHiox5
 iqINKJsxUANuW+yrfHczQhKaKpCP39YEVxvbuhnCik77wyH4G7qeDvRGbsTy2dhi3B8F
 H/LzWC2c6JcbcNCdTKAdaY3vdXtrDA25ke+yPbs7ZlAJ31d7BlWfpMXFAhXSEeat2gkl
 +6p6DRuXGou8WAHKXWvBXkCEgZH3BeMZiZK6wrdHzDUqks8Z8u5pf+Zq3gn31SLOqWpg
 cYPpvFoTrbT0pNubagwZfNZWXGc5YIfhhtgrkPW2vBkoLNHrbj4wZtrQz/y3Ru2AIs78
 4Hmg==
X-Gm-Message-State: AO0yUKVUZCY8eQG6pxapclKZSAxybAlE+kzS7Clqhurp4VZkS4/bT3JK
 RiAZkwKWI4LdotmD5sAzgywHtbgiKzHKjxOp
X-Google-Smtp-Source: AK7set/cp0uoSOWAACKAvftEFgXaWrS2iEyyLyYb3GCLDYNV+Q1pzhkrkfEo8JM4gw3tIqS1ekDm6A==
X-Received: by 2002:a17:90b:4b46:b0:226:3a7c:f248 with SMTP id
 mi6-20020a17090b4b4600b002263a7cf248mr10997797pjb.24.1675115329745; 
 Mon, 30 Jan 2023 13:48:49 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:48:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 01/36] tcg: Define TCG_TYPE_I128 and related helper macros
Date: Mon, 30 Jan 2023 11:48:09 -1000
Message-Id: <20230130214844.1158612-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Begin staging in support for TCGv_i128 with Int128.
Define the type enumerator, the typedef, and the
helper-head.h macros.

This cannot yet be used, because you can't allocate
temporaries of this new type.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |  7 +++++++
 include/tcg/tcg.h          | 17 ++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index bc6698b19f..b8d1140dc7 100644
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
index 9a0ae7d20b..8b7e61e7a5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -270,6 +270,7 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
+    TCG_TYPE_I128,
 
     TCG_TYPE_V64,
     TCG_TYPE_V128,
@@ -351,13 +352,14 @@ typedef tcg_target_ulong TCGArg;
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
 
@@ -377,6 +379,7 @@ typedef tcg_target_ulong TCGArg;
 
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
+typedef struct TCGv_i128_d *TCGv_i128;
 typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
-- 
2.34.1


