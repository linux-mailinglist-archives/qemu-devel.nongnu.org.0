Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B260F64BE9A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:39:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cn2-0000ju-6o; Tue, 13 Dec 2022 16:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmy-0000hy-36
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:12 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmw-0003DK-G7
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:11 -0500
Received: by mail-oi1-x231.google.com with SMTP id m204so1038543oib.6
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejdHuoy1Jq/BbeHpGWM1PuHE72TqekmQLGqKh44eCOc=;
 b=keSGhGgYSvSljmvxnViZ+P/5XEkv4WewGZFhZ2Bc6QpUH/DGHU2C2vmtaKI9EY3K3v
 eQnrXVV2j2hwXRMAGFWFYlAG4TCXHnUvn6agHYtYrvbsq80EOPVXXo+F6DUFGlVA5P6F
 HdVmL+cXsoI5ubkhIphAZhujAM5fAHeOhmO41EG+ZcbKHAOL8DVyFA02zI3flHTFhQ/4
 XcToNTvWFZts0v+truFeMK3yaFvIq0Q3CbbXh9APni2dFU4gQNJf8huyIVG5+QDqXnRJ
 YOEyhjuYVmdFymIwKPw7vZNmOEvkCBMsHtm07LMP3JECX8IM6cRL6UuBuXHIZQYiuKst
 0Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejdHuoy1Jq/BbeHpGWM1PuHE72TqekmQLGqKh44eCOc=;
 b=cu4zUqnPDY/0ePWkDx7DOBiJC5VCmQxjJV9OCDN4VD32hu7Iw4dfnaLOOrFHYreM9l
 F4fmFYvmgS3ZWqb8iSlN4OVFC48S4zuldVALr+BFlBmxLwy4d5CmNJ/wQkiwiqoVBefP
 cgGslnGDZmbwOF4SPNZZ6iE+cT4U2/Vzk5iNU4M0pTdD1RX/L0201snYyAD+ZIY0o9Cp
 hvirC0GPfdo95MnaRwDAtluP0DZtpmuV/ibe9+OFFL1cpB+7mv4Q6QI7oPzgxRGurc0e
 cjU9PfaXEHAoQHcx2PQH5OnC6op5DQCPwBmLece0fCd8P/rNVuTHGQxQy5ovDBAwuTRh
 Q79Q==
X-Gm-Message-State: ANoB5pkgCe5QdRfyGbyPoeLnz6mdBZR4VMcZNwZ87vLI38LoJ3Zzxaa2
 gx5syJ/X5VZQJLNtqCW/ZwiZOBLKze/wb8YWvSw=
X-Google-Smtp-Source: AA0mqf7wY4HT7gAGb91EDYKLFPPadIIxTN6WxLIe+3ZrgrkZQEOinB/7jCUMm5VMEziPvAc+7hZvcQ==
X-Received: by 2002:a05:6808:1520:b0:35b:e67:40b9 with SMTP id
 u32-20020a056808152000b0035b0e6740b9mr11820094oiw.45.1670966769798; 
 Tue, 13 Dec 2022 13:26:09 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 25/27] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Tue, 13 Dec 2022 15:25:39 -0600
Message-Id: <20221213212541.1820840-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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


