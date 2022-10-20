Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D6606300
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:27:51 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWWU-0000on-JM
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:27:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWTW-0004Ml-Ca
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7q-00057G-NB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:16 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7o-00014g-PQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:14 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n7so20094720plp.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iYJhauynhfuiRgcS6ZAcuFmLKCeu2n5wdlAO19SGt4M=;
 b=rKkTXX5ElIrCaMX5WpFdIlCEq+O6NP5IfhWlAdIMJ+1Jj1R1HDBLnZrhkKW1weRvRA
 zU1N9dYoQDdrTRr6ZM7LxcKlgzSPZAf49w1xYKMAmONBdyhgIFulgwP04iN3gwpcOPK5
 YrgKwc5NxVO/ci8vHH/gk/VAkqnu7hxydN9s90wVRZZZPiI1Yn0zYYEt5qLnJ+4Adh8x
 WwkqRPn7ho4e7awSnA0mmULJZEKLY1lAG0Myykf+LWM+BKQaDgbFR2vvldlsKa5eFpz8
 TjywtTaeOGEXMeA0TklctRlk5tR6S6EyEvDVqf9WALgiGufxk6MOSQqT9XOYIVn+XF8R
 QvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYJhauynhfuiRgcS6ZAcuFmLKCeu2n5wdlAO19SGt4M=;
 b=txwHQE5MwgeUAWxcH5KTIi/BNQJ7bC2HjXVelYJIQ9+VhbBtBacyN/82+iXAc7F6UQ
 XphyM+1DufxUtYftNyzqoeShKU8BFpZaIHfWxDhg8cK70dQsu9F9dRC8tTz52EwX6tjm
 oExs6W8Q2Dk+i8vF8VdcB+pOnKhs6RZ6InYS0QwCpV5h2isxp/hRuw4vvqQndpgVlgIU
 Fffo317rv1uKkAqD1io5ISJ0sib4n55JuoA3040/3o74xgKlcd9YgZ2vuzSfs+JNoU+u
 rXRMWMIZnx/xxz/86TixqZFECUuuyWjuJ2XGQ8HGwy1W8S68AS7znKFcHy/+gekJPPba
 ZgVA==
X-Gm-Message-State: ACrzQf0MIzcJ22BLDOc18CSVbLXeyjpsQHuVKwYHoRQ36x4p9pCsbHNK
 jckped7cZAzi6WuJymhELFPXpwfxhDD3QBXM
X-Google-Smtp-Source: AMsMyM6vT1NWjeCMy8cXuH1Shuxvn8yKFFX18jyfk8VeWU0vZhmyBShB/eq4YEouYMfyamT3x9Hugw==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr13596263plb.60.1666266851497; 
 Thu, 20 Oct 2022 04:54:11 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/31] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Thu, 20 Oct 2022 21:52:30 +1000
Message-Id: <20221020115242.2301066-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
index 31ddace5e5..1602ee78d3 100644
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
@@ -4385,12 +4403,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


