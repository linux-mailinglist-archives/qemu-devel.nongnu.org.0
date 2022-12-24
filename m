Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68F655BF6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:14:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9ESA-0007Tm-CA; Sat, 24 Dec 2022 19:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERw-0007NU-K3
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:12 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERr-0000hZ-It
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:05 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so8005198pjm.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 16:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Nqeff2807DVtWliN4Uc1oaHcrsPV+f3YmdHy8haHjQ=;
 b=dIQnzHCRWDjan+wO5SHBrNxzp8J8c89TtyTP+UFY2QYMUsbtyAkpsCApUEkNrzL6F4
 axoXvrakgpk27Xy4bu4YO63rMIocmUNwfolRzXth0zT+K7l6/JtkD3pbFbtd6dQtQe+i
 TB61S1ooEng97R/uLMvAbB+oMIjCFCJv7H4JHuhBh7Fp6RgVybn33YFArVOTI8BRnxtD
 9CL6xss/GefAaG6u9994B2vMb1Et8OX5OvEd1kQqtpE4JbVLHimFZmemSl8+aQzN5W9s
 HKLgYEjHSAcn4OiHqGM1YdPFAZDxdq1vR9lBbEbwjli0IQ4jHePXpjLz3KY4YQRQEy1O
 oYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Nqeff2807DVtWliN4Uc1oaHcrsPV+f3YmdHy8haHjQ=;
 b=KhrYbzbm0kb6be7U+F7YKY1rj5OXca3H0hBVlIHUtvyVOYIxEe1fOJazYWRpY8VF08
 fmfbqkbfX/BPepPFP+VQlQ8LPT4Nhjd+HhOeSVeKhLuz3kFPaZOIYkqJ32m9Dgse7DlQ
 eVAvSlwN5JvFXWkMEohKYrDtNLbax9LKsPNEmnc5ZRtpAzHoLf2zwo9Vtsm6Byrgd1Zh
 GfVqxQ8sbncdMG0TQbVw0zzx8QTndKrkdx06CjI4okojYkW+7gUAeiJ6TXalxO2cu/cc
 83K09mU+IdijgwNeE82UjSDyJerVutKhH9xeSBDrIew3Fu7Lr81Pi+76p/ebzqGiLHpd
 1j6g==
X-Gm-Message-State: AFqh2krE3xun5tgDhrO1tt6DJGuXi1ok0sPq349nmFtLJN0mD6yzT7WY
 sAt+ChmhPuVRF4MOVAjaZD7oo4qDjjpmaQm8
X-Google-Smtp-Source: AMrXdXt9gug2ACS6a7ImV++uJyCek5xEDFgW73vyW31q2oLEgG9P2EKGK33FL0U7L12faY/evOqzKA==
X-Received: by 2002:a05:6a20:4f02:b0:ad:ccea:73b4 with SMTP id
 gi2-20020a056a204f0200b000adccea73b4mr15412288pzb.42.1671926461755; 
 Sat, 24 Dec 2022 16:01:01 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 e32-20020a630f20000000b00478fd9bb6c7sm4161280pgl.75.2022.12.24.16.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 16:01:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 41/43] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Sat, 24 Dec 2022 15:57:18 -0800
Message-Id: <20221224235720.842093-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
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

Instead of requiring a separate hash table lookup,
put a pointer to the CIF into TCGHelperInfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221122180804.938-4-philmd@linaro.org>
---
 tcg/tcg-internal.h |  7 +++++++
 tcg/tcg.c          | 30 ++++++++++++++----------------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index c7e87e193d..6e50aeba3a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -25,6 +25,10 @@
 #ifndef TCG_INTERNAL_H
 #define TCG_INTERNAL_H
 
+#ifdef CONFIG_TCG_INTERPRETER
+#include <ffi.h>
+#endif
+
 #define TCG_HIGHWATER 1024
 
 /*
@@ -57,6 +61,9 @@ typedef struct TCGCallArgumentLoc {
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
+#ifdef CONFIG_TCG_INTERPRETER
+    ffi_cif *cif;
+#endif
     unsigned typemask           : 32;
     unsigned flags              : 8;
     unsigned nr_in              : 8;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3c3bb2d422..9092473cf0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -62,10 +62,6 @@
 #include "tcg/tcg-ldst.h"
 #include "tcg-internal.h"
 
-#ifdef CONFIG_TCG_INTERPRETER
-#include <ffi.h>
-#endif
-
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
 static void tcg_target_init(TCGContext *s);
@@ -553,8 +549,6 @@ static TCGHelperInfo all_helpers[] = {
 static GHashTable *helper_table;
 
 #ifdef CONFIG_TCG_INTERPRETER
-static GHashTable *ffi_table;
-
 static ffi_type *typecode_to_ffi(int argmask)
 {
     switch (argmask) {
@@ -577,9 +571,11 @@ static ffi_type *typecode_to_ffi(int argmask)
 static void init_ffi_layouts(void)
 {
     /* g_direct_hash/equal for direct comparisons on uint32_t.  */
-    ffi_table = g_hash_table_new(NULL, NULL);
+    GHashTable *ffi_table = g_hash_table_new(NULL, NULL);
+
     for (int i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
-        uint32_t typemask = all_helpers[i].typemask;
+        TCGHelperInfo *info = &all_helpers[i];
+        unsigned typemask = info->typemask;
         gpointer hash = (gpointer)(uintptr_t)typemask;
         struct {
             ffi_cif cif;
@@ -587,8 +583,11 @@ static void init_ffi_layouts(void)
         } *ca;
         ffi_status status;
         int nargs;
+        ffi_cif *cif;
 
-        if (g_hash_table_lookup(ffi_table, hash)) {
+        cif = g_hash_table_lookup(ffi_table, hash);
+        if (cif) {
+            info->cif = cif;
             continue;
         }
 
@@ -612,8 +611,12 @@ static void init_ffi_layouts(void)
                               ca->cif.rtype, ca->cif.arg_types);
         assert(status == FFI_OK);
 
-        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
+        cif = &ca->cif;
+        info->cif = cif;
+        g_hash_table_insert(ffi_table, hash, (gpointer)cif);
     }
+
+    g_hash_table_destroy(ffi_table);
 }
 #endif /* CONFIG_TCG_INTERPRETER */
 
@@ -4385,12 +4388,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 
 #ifdef CONFIG_TCG_INTERPRETER
-    {
-        gpointer hash = (gpointer)(uintptr_t)info->typemask;
-        ffi_cif *cif = g_hash_table_lookup(ffi_table, hash);
-        assert(cif != NULL);
-        tcg_out_call(s, tcg_call_func(op), cif);
-    }
+    tcg_out_call(s, tcg_call_func(op), info->cif);
 #else
     tcg_out_call(s, tcg_call_func(op));
 #endif
-- 
2.34.1


