Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12D65939E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2uc-0006Vd-Rz; Thu, 29 Dec 2022 19:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uV-0006Lo-GF
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:11 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uQ-0004E7-6L
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:05 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a184so2793153pfa.9
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrKLqLX2qUBb8CbspI2Ok/FI/tOS0JvQAeneXvCOOoQ=;
 b=qvenLfyQYHr9v8Rfw76KwcyodEmF4V76zETg/4qlZL8PlkG3ZZu/cAbbxzkksEY1QL
 5nMeNYAQfByRj6legKSY14vG1Tz9MWFD6hbD73vOw5gWhhueF/O2Jumd8Eht69EPyryq
 FUN/nLTv8Cbf8GvEbEl7mYZRz9GNzoFVh0LMvSqAuBWTJPU7Gm/o90PJlgN0eKA5Ng/T
 +pKssxq/awbcTAI7Pk3eAltS7w0nyBav9NqK8G+tBNdthHw0dW3mNCDoiTBxPa8kmE2/
 5+Pxmq4zuHus3gPwvZXQ7PQJCjJ6osoyzWmgk9hr+WSjgZ6nSGeFoZRD156zu58vP9RQ
 xjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrKLqLX2qUBb8CbspI2Ok/FI/tOS0JvQAeneXvCOOoQ=;
 b=X6eU+2MkZ1/7tFUJj7SE+O2OT3IKwfrlnks7cgNqrcl0Ip2Z2aio55lmiQgOepKo1u
 Xvl5kcPWE6xo1zDDy0Jd+/QmiDpyed5hiYFA+HfB/Irv7XN1SHPZnKEIWoFsMA9QYkGv
 OTCI2QxtivZJA9eyQ7Os5MG6osQ26fBRErz8DOGDjHsG5ixxFW8MPm3Swm9n/Vjz7CDm
 l5lSXoXYElFFLShPByz3k0y/o8/Erm96JNeHbngG0NtvMFLX3GCNI+xnm8SjhgGoSbCD
 fCygHouT7iGcq1O/y7z6mMMwQ/fgDZzcwzkFgFPQ0vsvFzOjqHx5qGE8iDVnTf3YJeRT
 MjUw==
X-Gm-Message-State: AFqh2kpT3RbFiCncbXXX5CwYNtvqNCp9dv3lSKI3IKmNzRiJXorPQfLW
 RrZvyKW7b2WqoHkDWgZClXKvT1XEM9mgEDVt
X-Google-Smtp-Source: AMrXdXtGpesbv0OdhpW8bGowUkModGx762VLpmmVlVklYFKk7+R15E5qFA7b+cr/e17/mPrrNVnmgg==
X-Received: by 2002:a05:6a00:4c84:b0:577:c181:bd61 with SMTP id
 eb4-20020a056a004c8400b00577c181bd61mr32512103pfb.20.1672358760115; 
 Thu, 29 Dec 2022 16:06:00 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:05:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 40/47] tcg: Factor init_ffi_layouts() out of tcg_context_init()
Date: Thu, 29 Dec 2022 16:02:14 -0800
Message-Id: <20221230000221.2764875-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
index 60a745c9cd..cfc0280883 100644
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


