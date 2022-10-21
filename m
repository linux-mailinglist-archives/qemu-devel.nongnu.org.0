Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B34607278
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:36:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnW8-0004bs-94
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:36:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHm-0003Ky-3U
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHW-0003Fu-V1
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:31 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHU-0005pB-BO
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id n7so1594877plp.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+auU7PVqmG99ktmS6b3UEAfMFz0jKVdnqCCXndsje+Q=;
 b=Sl3EGQqxzdxMl403t1ZqDWlfhxS8htbbS1vuoGSurjKy1acoqEZ5jYFyds0bDN3y+J
 YInnz4xJOc499dIWSXa6AcmoHgSwCVdwIhSpSX5waToR0SF7D4pJZ1GPhY/qIozh1/Bk
 ROwS809d8nZI/wbKJDlGvzO/rXFiuYsnOCyrDtoXHJ2LH6nAAt1zrPVnU9xayujDV/Ua
 7ICbW4n45fSv7zxqbODUq5B0CP+fQbmqsrdA3ZKLZg3OEGWH8vpVeRx2NLa4fGghViRy
 +m0oQbIP5Qx0OPDCTPEECbtwyiFKUrFjxRKuMuI4cMneAuAGSDjTbsS4coXb+Nf5B8ol
 BbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+auU7PVqmG99ktmS6b3UEAfMFz0jKVdnqCCXndsje+Q=;
 b=Ko9kXhsroOv1faWOxtaVA/iV0rpsdCo8EKRmCw7grW7nr69gbYIR8j6CSu2DdebNET
 q2+p5N//3GrW6w4r+qGUcuu38KXb9PZo0rFFJb9kTTMBPAk2YwVsR+GwfLFEDXCAcf2/
 w2hAGn+zdQULt+I/vixgv2s8ZW0nOjrGwzHXmGiSjw0c+/0pOQ7/U/q62k/lG4J88FNc
 NEgL2+pS118nBw0UmhMjdKSqQBF67x3xUJxct6MA5ATaBJXGwQO2KZmxnLq1DyGyghg8
 H9ihBcIW0F6ruv+8sCyDskrZh3XXJx4ovtcXEmnxRXP/5von5bZH187+eJPSAZ+Bz1d4
 4O5g==
X-Gm-Message-State: ACrzQf3qhrQsoWZJ4tCNo7X10DNLwLfGGiJg+69caGkI3R6EHcXH0Npj
 Tl0tqgJo1T8HC7vlYOpz9WtYJ65gBc5LbHxr
X-Google-Smtp-Source: AMsMyM6dx5ZqjEK4Xi5ENJZybd7I86IGoFg9mvZQ4+j2AParnSkf+ssYERkhjJ9+dJ9mH0DrGrpDrg==
X-Received: by 2002:a17:90b:3588:b0:20b:590:46a2 with SMTP id
 mm8-20020a17090b358800b0020b059046a2mr20463567pjb.14.1666336642846; 
 Fri, 21 Oct 2022 00:17:22 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/36] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Fri, 21 Oct 2022 17:15:34 +1000
Message-Id: <20221021071549.2398137-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Instead of requiring a separate hash table lookup,
put a pointer to the CIF into TCGHelperInfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |   7 +++
 tcg/tcg.c          | 129 +++++++++++++++++++++++++--------------------
 2 files changed, 78 insertions(+), 58 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 097fef2325..696dc66ada 100644
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
@@ -54,6 +58,9 @@ typedef struct TCGCallArgumentLoc {
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
index 713e692621..a3a6968f76 100644
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
@@ -552,17 +548,76 @@ static TCGHelperInfo all_helpers[] = {
 static GHashTable *helper_table;
 
 #ifdef CONFIG_TCG_INTERPRETER
-static GHashTable *ffi_table;
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
 
-static ffi_type * const typecode_to_ffi[8] = {
-    [dh_typecode_void] = &ffi_type_void,
-    [dh_typecode_i32]  = &ffi_type_uint32,
-    [dh_typecode_s32]  = &ffi_type_sint32,
-    [dh_typecode_i64]  = &ffi_type_uint64,
-    [dh_typecode_s64]  = &ffi_type_sint64,
-    [dh_typecode_ptr]  = &ffi_type_pointer,
-};
-#endif
+static void init_ffi_layouts(void)
+{
+    /* g_direct_hash/equal for direct comparisons on uint32_t.  */
+    GHashTable *ffi_table = g_hash_table_new(NULL, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
+        TCGHelperInfo *info = &all_helpers[i];
+        unsigned typemask = info->typemask;
+        gpointer hash = (gpointer)(uintptr_t)typemask;
+        struct {
+            ffi_cif cif;
+            ffi_type *args[];
+        } *ca;
+        ffi_status status;
+        int nargs;
+        ffi_cif *cif;
+
+        cif = g_hash_table_lookup(ffi_table, hash);
+        if (cif) {
+            info->cif = cif;
+            continue;
+        }
+
+        /* Ignoring the return type, find the last non-zero field. */
+        nargs = 32 - clz32(typemask >> 3);
+        nargs = DIV_ROUND_UP(nargs, 3);
+
+        ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
+        ca->cif.rtype = typecode_to_ffi(typemask & 7);
+        ca->cif.nargs = nargs;
+
+        if (nargs != 0) {
+            ca->cif.arg_types = ca->args;
+            for (i = 0; i < nargs; ++i) {
+                int typecode = extract32(typemask, (i + 1) * 3, 3);
+                ca->args[i] = typecode_to_ffi(typecode);
+            }
+        }
+
+        status = ffi_prep_cif(&ca->cif, FFI_DEFAULT_ABI, nargs,
+                              ca->cif.rtype, ca->cif.arg_types);
+        assert(status == FFI_OK);
+
+        cif = &ca->cif;
+        info->cif = cif;
+        g_hash_table_insert(ffi_table, hash, (gpointer)cif);
+    }
+
+    g_hash_table_destroy(ffi_table);
+}
+#endif /* CONFIG_TCG_INTERPRETER */
 
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
@@ -765,44 +820,7 @@ static void tcg_context_init(unsigned max_cpus)
     }
 
 #ifdef CONFIG_TCG_INTERPRETER
-    /* g_direct_hash/equal for direct comparisons on uint32_t.  */
-    ffi_table = g_hash_table_new(NULL, NULL);
-    for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
-        struct {
-            ffi_cif cif;
-            ffi_type *args[];
-        } *ca;
-        uint32_t typemask = all_helpers[i].typemask;
-        gpointer hash = (gpointer)(uintptr_t)typemask;
-        ffi_status status;
-        int nargs;
-
-        if (g_hash_table_lookup(ffi_table, hash)) {
-            continue;
-        }
-
-        /* Ignoring the return type, find the last non-zero field. */
-        nargs = 32 - clz32(typemask >> 3);
-        nargs = DIV_ROUND_UP(nargs, 3);
-
-        ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
-        ca->cif.rtype = typecode_to_ffi[typemask & 7];
-        ca->cif.nargs = nargs;
-
-        if (nargs != 0) {
-            ca->cif.arg_types = ca->args;
-            for (i = 0; i < nargs; ++i) {
-                int typecode = extract32(typemask, (i + 1) * 3, 3);
-                ca->args[i] = typecode_to_ffi[typecode];
-            }
-        }
-
-        status = ffi_prep_cif(&ca->cif, FFI_DEFAULT_ABI, nargs,
-                              ca->cif.rtype, ca->cif.arg_types);
-        assert(status == FFI_OK);
-
-        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
-    }
+    init_ffi_layouts();
 #endif
 
     tcg_target_init(s);
@@ -4387,12 +4405,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


