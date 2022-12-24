Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0462655BF2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:13:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9ES6-0007OQ-Ii; Sat, 24 Dec 2022 19:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERt-0007NF-Au
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:06 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERr-0000hV-2L
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:05 -0500
Received: by mail-pj1-x1029.google.com with SMTP id v23so7965251pju.3
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 16:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBljFhYIHpDHYp33JDsunVI9K3ZsXt/tBvc3MWwAFFM=;
 b=x6hPkZedHFS9asNrOOvRyaILARQszcH/ErxYSNFWPCWyt/1OBl7hCyRn4QTfLxm37X
 0NJy47FN+xlkbgsVK3uhivLU2tsYFcaJ7iQ2I1ieE2dOA1VKQAkYx3SLy+TxY192rnww
 qdFoVmU2O1NlHOh1CENtx+QXtafQ+we8yY1v+m+Ld0xP9nI/ql10u/ALC1SFwNdpodaQ
 HA/0ySRSLpDP2FVQitGq+ubYZwXNWW/zW5Vuk+obAfp4NtoI09rKiwqg0TMfHwecXjr9
 N09RI9l+ErzsbyhWgJJE1QPJv2LAzh7BCziPCdx58wSDM3CAMf6h2I3UnoQh4jEz2tvD
 ID8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OBljFhYIHpDHYp33JDsunVI9K3ZsXt/tBvc3MWwAFFM=;
 b=HV0bm6hfiAtq6rEJtLZjIirKgrzxCz6s9X8rPurqyhi6Ha4o/kuVMrLmHln6pfdIBp
 6jnRDntfs89gQztex9befQV9AAdYLudTmBsinpz1Z4I0M3WmHZtAyuSQVklGOHtXgG/n
 G4blSadNIhMDBB3jBHTTdc6o+oUI1mJVF5VTtQUYv3fYyyzvERPCnhdUwtmT6uQ7xHsI
 YaTSYvPtr2oQxg7S+hHdWK4skzA80obtonTKwETJmQYP52U0fhOCZr+DVr6haw39dU+d
 CoJbEP1QKIz7dreFh403I3QX+Rkk3k2FxMsTsmUgy41ubg7Eb7qWoLdFVHbI9lrqZ/yf
 okOg==
X-Gm-Message-State: AFqh2krVGoEN+TyVet/2Up3nMj5x47Y/WIfyFBG1noIN1fLToEvd2WDr
 nPIBKbPxpY2L6X1Amswet1ZVQZLG6xJyNMnE
X-Google-Smtp-Source: AMrXdXspavDN86zA6c1xeDvKlrN7q5Ulz+mlQT8tRVCv+gmv4p/jf828qbU8TsvfmE7fM+aCcTV2xw==
X-Received: by 2002:a17:90a:8b14:b0:219:752e:c071 with SMTP id
 y20-20020a17090a8b1400b00219752ec071mr31651582pjn.6.1671926460733; 
 Sat, 24 Dec 2022 16:01:00 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 e32-20020a630f20000000b00478fd9bb6c7sm4161280pgl.75.2022.12.24.16.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 16:01:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 40/43] tcg: Factor init_ffi_layouts() out of
 tcg_context_init()
Date: Sat, 24 Dec 2022 15:57:17 -0800
Message-Id: <20221224235720.842093-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221122180804.938-3-philmd@linaro.org>
---
 tcg/tcg.c | 83 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 39 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 46cce228a0..3c3bb2d422 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -573,7 +573,49 @@ static ffi_type *typecode_to_ffi(int argmask)
     }
     g_assert_not_reached();
 }
-#endif
+
+static void init_ffi_layouts(void)
+{
+    /* g_direct_hash/equal for direct comparisons on uint32_t.  */
+    ffi_table = g_hash_table_new(NULL, NULL);
+    for (int i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
+        uint32_t typemask = all_helpers[i].typemask;
+        gpointer hash = (gpointer)(uintptr_t)typemask;
+        struct {
+            ffi_cif cif;
+            ffi_type *args[];
+        } *ca;
+        ffi_status status;
+        int nargs;
+
+        if (g_hash_table_lookup(ffi_table, hash)) {
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
+            for (int j = 0; j < nargs; ++j) {
+                int typecode = extract32(typemask, (j + 1) * 3, 3);
+                ca->args[j] = typecode_to_ffi(typecode);
+            }
+        }
+
+        status = ffi_prep_cif(&ca->cif, FFI_DEFAULT_ABI, nargs,
+                              ca->cif.rtype, ca->cif.arg_types);
+        assert(status == FFI_OK);
+
+        g_hash_table_insert(ffi_table, hash, (gpointer)&ca->cif);
+    }
+}
+#endif /* CONFIG_TCG_INTERPRETER */
 
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
@@ -768,44 +810,7 @@ static void tcg_context_init(unsigned max_cpus)
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
-        ca->cif.rtype = typecode_to_ffi(typemask & 7);
-        ca->cif.nargs = nargs;
-
-        if (nargs != 0) {
-            ca->cif.arg_types = ca->args;
-            for (int j = 0; j < nargs; ++j) {
-                int typecode = extract32(typemask, (j + 1) * 3, 3);
-                ca->args[j] = typecode_to_ffi(typecode);
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
-- 
2.34.1


