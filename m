Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC959634355
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXh8-0001So-KF; Tue, 22 Nov 2022 13:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXh2-0001Nv-NN
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXh1-0000NU-2a
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v7so11340304wmn.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7tm1bhBcyuyPxnOlxXqA0DnnV9CFx9sxG0g/SSnkGA=;
 b=LJ+W+Pum0r5pudghn5r+NXFW4czYWWDGUlcygL/BdM9atcw2EY8FePsCv52yHFhRQM
 VGP+gq234eplFgthC5GRTdgWjHzry9luIdjJDrWB7xaheHfelnjZ5fUX/q4X0DSV80AL
 w7lQri4jHWHdS8mVdVU1mAIex8zNczKTjx+JmdiKI3MUJnYWV4YosJovJNbM8w+iYbqK
 1pGjLiIlEvrU9uwfdwaKSbzLCWdutFE7e28mSrCuW7uBQ7gqVWPaNJi9Vjwx6RYYeDVE
 WkkKRN3i7tTfMtjk3+D5LvwgD66jFcWETpckdlc0OK/U7MNBfeaZhwNvVkfSWwCS5dgP
 kBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7tm1bhBcyuyPxnOlxXqA0DnnV9CFx9sxG0g/SSnkGA=;
 b=i2JG2xmouQDztXwla/6Suig/XmDjTskZJq0QyDL2eVSIyCKueVUfZPt5WVTzNmbxaX
 0ptAiN4RIgDqScfvN7k0YJKr16yO5qqilNp0UvswrEYGDY6jPpr722STo9IuPVXdHx3k
 FSQ0kH9fZHB0hUeOIfx+XkA7fogHCq2xzsog0zgl3VyXvZMe1c3wxVA6VBkHy1XbyKkg
 R5WlkvNMYh5NmtjtUYiE3wE2H0ZPM2Y02+lfSStdBUmE6uAHh07hsCgwIxxQcFs6SPcL
 gBxKHu96fZ2+O1HsIg5YCGyspKyTK45N88H9tJyDAvFOOpoOJw/m6wDVzxmt9kYFfDDp
 Gwvg==
X-Gm-Message-State: ANoB5pn77GwxXb29UmaMx+Jh4TxcOWd8sEjPz8PXQHxQHlSstHkHXmwg
 y0q5xyvMl0DCqZpJDnpVK6ej2y+5cCWj2A==
X-Google-Smtp-Source: AA0mqf78hYl6IcfTkmBVoCxb392OuiP0zp1Oh3B+aRK6+DzocQpr4BWRNE/0YJwE8Hd50aONPeIpBQ==
X-Received: by 2002:a05:600c:a41:b0:3cf:895a:b22b with SMTP id
 c1-20020a05600c0a4100b003cf895ab22bmr4601445wmq.81.1669140501234; 
 Tue, 22 Nov 2022 10:08:21 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003a3170a7af9sm18859201wmo.4.2022.11.22.10.08.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Nov 2022 10:08:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] tcg: Move ffi_cif pointer into TCGHelperInfo
Date: Tue, 22 Nov 2022 19:08:04 +0100
Message-Id: <20221122180804.938-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122180804.938-1-philmd@linaro.org>
References: <20221111074101.2069454-27-richard.henderson@linaro.org>
 <20221122180804.938-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Instead of requiring a separate hash table lookup,
put a pointer to the CIF into TCGHelperInfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/tcg-internal.h |  7 +++++++
 tcg/tcg.c          | 26 ++++++++++++++------------
 2 files changed, 21 insertions(+), 12 deletions(-)

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
index 9b24b4d863..d6a3036412 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -552,8 +552,6 @@ static TCGHelperInfo all_helpers[] = {
 static GHashTable *helper_table;
 
 #ifdef CONFIG_TCG_INTERPRETER
-static GHashTable *ffi_table;
-
 static ffi_type *typecode_to_ffi(int argmask)
 {
     switch (argmask) {
@@ -576,9 +574,11 @@ static ffi_type *typecode_to_ffi(int argmask)
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
@@ -586,8 +586,11 @@ static void init_ffi_layouts(void)
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
 
@@ -611,8 +614,12 @@ static void init_ffi_layouts(void)
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
 
@@ -4413,12 +4420,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
2.38.1


