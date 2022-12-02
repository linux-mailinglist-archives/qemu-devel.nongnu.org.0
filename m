Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7F63FFF4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0yms-0002lC-0E; Fri, 02 Dec 2022 00:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymo-0002kQ-Pt
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:34 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymn-0003Qo-5g
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 x13-20020a17090a46cd00b00218f611b6e9so4207076pjg.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejdHuoy1Jq/BbeHpGWM1PuHE72TqekmQLGqKh44eCOc=;
 b=qhI9wcHLRy5JpljdxBlN3wmzQ1PPS9QTfjoJvtxIkSCugoBT7g25w9E/XVA+5RuWy7
 sLKT3lhvcPHrN0q0B6QY2JNPbsDKR1wsaAIPDStFDBQM5gelmI1b21n5a31iPYW6oFEB
 bljpNeBgfLdU5sqHdAA9VZen+/J/5ZCFfUpxM+gnPE/cyWp65A+bXj8xd+LwrfMTYAj3
 icHqztKT6jmlkylMo/OeMpv0+w74KXE2fppdFlWNUSi0JGPfVnBUPhO4EY+SN1oeM1m8
 Pbl1SBzsIalsGHARU9D9Adx0Pp2bjqHKCki1RROTyOGOQuwpjG8shwmjVKSX5jySL32S
 q9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejdHuoy1Jq/BbeHpGWM1PuHE72TqekmQLGqKh44eCOc=;
 b=503YJ8UX4Pq/m03iF4pT983wDUe7oJXbJIeiuy+8QHO+TFxI26E/wbRYXzqgRlA0xU
 H7RaWF4K/7KskNZStMTw8MyJKJo+p8wtob8hxG98X5MvlDt8tRU2lvZ0ovQ5/d3LhEg5
 ZZ7pT1g7fUbyqZDtcXmmD4AxMGX3AXXURiiSPvGOIPde7LqkGXWDE6y+ZAkceyiswam+
 ZnadAwVQHgnI8hxM3D/QVxljZ65uQaRZwHqtrmh7NhiqMEVacn+7mvALnhwVsFKtlq9f
 jTJaEZNXKlBv2cd7Q8292iPATvoJ/+XqQnDMJpD0jGUEUj2SqpRWkRM9D4vrQ8hl1YPQ
 O9Cw==
X-Gm-Message-State: ANoB5plNAQMWSiQLjG/O4Wezda9KQXuVK9A6qI2x2t/TSu7EnGe688bh
 i6FBwsWajVj+QjW9/gqLnBcrJu4YJ8LI7Xy9
X-Google-Smtp-Source: AA0mqf4q5U0mXGUQkrYBQbabYrvcxfsaPhyoBSPtz7FNl8VL3aaiM0DY7AQJb3pJuBCDE5GME5WSBA==
X-Received: by 2002:a17:902:b707:b0:189:5f3c:fb25 with SMTP id
 d7-20020a170902b70700b001895f3cfb25mr39437695pls.123.1669959631925; 
 Thu, 01 Dec 2022 21:40:31 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 32/34] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Thu,  1 Dec 2022 21:39:56 -0800
Message-Id: <20221202053958.223890-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


