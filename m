Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE53659398
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2ud-0006Wk-KE; Thu, 29 Dec 2022 19:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uU-0006Li-Ij
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:11 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uQ-0004EF-EL
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:05 -0500
Received: by mail-pf1-x429.google.com with SMTP id k19so5864406pfg.11
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCLzxn0q0XTdpTpZ+mEjL5EuaQDV+OhjoinCv0kOApo=;
 b=hsq9XH4SOumvEOfb8I1y37Ee+9ZWTSvt78BVA5kJCIESP3QZVoZIm2YDnbLl26e81L
 VMDU/3rjMKGCRSRgzUU16wsgXnAJs31m7gw3p4cIsqbhFCnJx1QbTLffOpmvsx1fTkVu
 tlpOKLtabVVJxPyqxVKEfEstK7xMfozcURz9QABMzpnEMTG49EgovJnV+iQDvZ5lUzNu
 oKPqlGmFQRCL/cwnABP98zS9VktMv+JTKbLsHWdpi7LEh0a1tnHtyBCiR8KxoGvRuGvD
 bt6DIAjy4QjCzDaTVGdDMA9I4gcEO6vnpiOXcv0cfh6vdNr45WaaB7zzcSsWHi1iWypt
 80HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCLzxn0q0XTdpTpZ+mEjL5EuaQDV+OhjoinCv0kOApo=;
 b=UMLneP2vf1Yz3ekhO9PDUAWpDcAcK2qEfHAH1nB3q9RNpmdE7DOe41dOZjqIq6P1Z+
 slzvBM9GcBKB0eJ9dG0+IymhZVn3EFd7t5qd9UaxyU8FT7cQ+A9yxpPY1HZNpeMLs5yf
 eXLJH3DP/BUaILTbeIDpqqVWvh15iy67W461+EMCOEGFdG6aXKEdtTeWR8ruU4+cUHZ7
 dNbaJYeJkeTaHvPdxtkPkJeSansI7R3cLx/Srskx3HgNZj7lIQhuYhi4G/tAtPDZVUne
 D0Y7+HUgkFhajexTS1OjV0OVqY4wF8Da79KMYhQi8Ov+WpEoDVgsPQaONx+e7qB4XBMM
 lWmA==
X-Gm-Message-State: AFqh2koenLIIJW/53zZPe3rw1szta63sBoVAjoSTPGaFdzwEW8tlaCvs
 UnDL3AWNFlre+q6HansjpHuzk+suuwtbnF94
X-Google-Smtp-Source: AMrXdXs3JZljTZ5EggZ9ZdoOT+7ETdRqj+fK0kL/YfVln9PJSYfCPV7chR5mwlANmK+CET9UIfy/dw==
X-Received: by 2002:a05:6a00:168d:b0:577:2a9:ec82 with SMTP id
 k13-20020a056a00168d00b0057702a9ec82mr38207348pfc.5.1672358761045; 
 Thu, 29 Dec 2022 16:06:01 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:06:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 41/47] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Thu, 29 Dec 2022 16:02:15 -0800
Message-Id: <20221230000221.2764875-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
index cfc0280883..76cf26870c 100644
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
 
@@ -4388,12 +4391,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


