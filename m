Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE5659396
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sT-0003xE-Li; Thu, 29 Dec 2022 19:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rY-00039T-DU
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:08 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rU-0002gz-1b
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:03 -0500
Received: by mail-pj1-x102d.google.com with SMTP id fy4so20831579pjb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+c5n6Q4tzmAUtv0QiXx7/gXm6QqnenrSZcl7NsT1wsY=;
 b=e073BsL5ytf6Jl2kNwBkcUtEjdfrYwWmi2ZxgCHZkCQMa2H09xMUo37EWzOI/Ha6hr
 6KM9IGcf1WWZfIq9GxML/Dzk0dnvCgSKX/qfBHPvDtsdulOvZsweTN0S0veDyfnT+WRK
 8dsbuPsGpgokwZVwCNBxpsf+myu38Ry/lL80o+aShCYhDFtiFdXxgu7Ro8OYO6TUQoAU
 VYzZF2l1Yhke4kZr+kCUREW41334+IjMaFUT14WdTdrL+qjGIw6LnUpaY4Iz9SpRQ5pe
 P/XM1IAlIt7D2HmUlPr20hmEgS0SYDpYmBs+m/zE8E6s1+eODLFW2+cgoE2beO5Ibs8B
 Pf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+c5n6Q4tzmAUtv0QiXx7/gXm6QqnenrSZcl7NsT1wsY=;
 b=D3xueuPidNZGrz4av81jbxWU1YzQkTBNsq+M9hKyVhk7gtu/NxHERUqbyNVc/fqbbK
 ERLTKEtV7ul+7dWTmWdBWqG4Y5xuTWe8UdTvo20J6Qv6HFeQvo338ITagwQRDFC0BWOW
 SnJU5ggGOsGFqzkDVo0nSSsXPMrK+1o0L1z0KilNfACoKKEQ1MvPQNIDX6F7EBa3EMyF
 8HvkqL6LGLjiAuFgiXdlHcESnCC84qbi4aTvzTlyN7xrz8PBPlXTjnNd83PWjnTKSjSh
 NDCtq9QLrZFOcfvOpcm3zl2HZ6S0aruXZ5JnSeEMaHsVPLrHYXn++bXy5Qj7TIkwQfN1
 UsmQ==
X-Gm-Message-State: AFqh2kqsw8VCIh94vJpPrnVXi8qARSrZ++GBYWaraM5wD3oJYpueWQoI
 ZQYgiLo/+WPRUTnS5JgX/YRcLiJPqL5EfCJ4
X-Google-Smtp-Source: AMrXdXsCJonJXnvEI+u2oZRLBEG4BKbGqojSBcRfW8n308Z29s6rFtxyexSeTVc4R+RfBASOzuqMww==
X-Received: by 2002:a17:902:8f86:b0:191:282:5d6c with SMTP id
 z6-20020a1709028f8600b0019102825d6cmr35485770plo.61.1672358578743; 
 Thu, 29 Dec 2022 16:02:58 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/47] tcg: Convert typecode_to_ffi from array to function
Date: Thu, 29 Dec 2022 16:02:13 -0800
Message-Id: <20221230000221.2764875-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In the unlikely case of invalid typecode mask, the function
will abort instead of returning a NULL pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221122180804.938-2-philmd@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0976cfb215..60a745c9cd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -555,14 +555,24 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static GHashTable *ffi_table;
 
-static ffi_type * const typecode_to_ffi[8] = {
-    [dh_typecode_void] = &ffi_type_void,
-    [dh_typecode_i32]  = &ffi_type_uint32,
-    [dh_typecode_s32]  = &ffi_type_sint32,
-    [dh_typecode_i64]  = &ffi_type_uint64,
-    [dh_typecode_s64]  = &ffi_type_sint64,
-    [dh_typecode_ptr]  = &ffi_type_pointer,
-};
+static ffi_type *typecode_to_ffi(int argmask)
+{
+    switch (argmask) {
+    case dh_typecode_void:
+        return &ffi_type_void;
+    case dh_typecode_i32:
+        return &ffi_type_uint32;
+    case dh_typecode_s32:
+        return &ffi_type_sint32;
+    case dh_typecode_i64:
+        return &ffi_type_uint64;
+    case dh_typecode_s64:
+        return &ffi_type_sint64;
+    case dh_typecode_ptr:
+        return &ffi_type_pointer;
+    }
+    g_assert_not_reached();
+}
 #endif
 
 typedef struct TCGCumulativeArgs {
@@ -779,14 +789,14 @@ static void tcg_context_init(unsigned max_cpus)
         nargs = DIV_ROUND_UP(nargs, 3);
 
         ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
-        ca->cif.rtype = typecode_to_ffi[typemask & 7];
+        ca->cif.rtype = typecode_to_ffi(typemask & 7);
         ca->cif.nargs = nargs;
 
         if (nargs != 0) {
             ca->cif.arg_types = ca->args;
             for (int j = 0; j < nargs; ++j) {
                 int typecode = extract32(typemask, (j + 1) * 3, 3);
-                ca->args[j] = typecode_to_ffi[typecode];
+                ca->args[j] = typecode_to_ffi(typecode);
             }
         }
 
-- 
2.34.1


