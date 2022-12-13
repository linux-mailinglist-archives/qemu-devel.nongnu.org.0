Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4164964BE75
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmz-0000ik-Nw; Tue, 13 Dec 2022 16:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmx-0000hD-1D
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:11 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmv-0003D0-DP
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:10 -0500
Received: by mail-oi1-x236.google.com with SMTP id l127so1028567oia.8
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7o/uTcMX+wfPe8sHfpNtvUDYBEo1al5HudozA0YE4Gk=;
 b=xKI1dESWd2pYyhQUd6WIcEc11vhstWeuqvoC4ADEoizfZaQp4fhZtQIGU5C7EW9lxC
 W0XtoyVsl99lAUdqMLcskX6a4yh65clr4GnEOya7ry+8gRMgGykNB/j2L9g9l0aovrZF
 Pbt0vY3vFmPb607r84Wed3xlB2xXcL4P3jM9mHIpIoKhqnHw8P40oYsZ2xjgVrH0cLfW
 Sh0215CnMGcqGI7sZZJxTFVmID7JwpUGqx1VCROGW6CBDcpNA+Fwam9/el7mAD71KUaN
 Y/VRRG9KtRYpPdY+19+XPyejEfCItYYA+4a/VjnzpYqdqdAydroGVdL5FJNxmiT7fBqa
 reSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7o/uTcMX+wfPe8sHfpNtvUDYBEo1al5HudozA0YE4Gk=;
 b=7WO1wBp/aaSIDYf/Mh05GsiudbssRaIX8++2fwgjNQDvY7TBglkmEMvl4/Fm/QqrAI
 0KJXsRRi824NkXNWDrCYHPR8AIbh9y96Vrsbimx5FvRu9bwIbst4/7UzeO1yp6fhmy3m
 VotP0/L6bMIVddcgfy5MjWX4DUFjZIGVoy3yRjjOleS3ZP45TORN1cXMbGx62hiwZHR/
 9Ugm0933n+Ty3i/KRAClr+QxUeXHbe0FaYYqeRekQQUCTR8mENsP5k5PzrJcERqDq5r1
 CcWtv1S64fi/+xyaLZf/vsLpapHsmUqNQe2urDhZ5o8/5yfeRGP4eKtGgTIerJgQrfpO
 OA3g==
X-Gm-Message-State: ANoB5pmdU3pVPBtR+xgnWRI7BcTynxJ3rzGvapZvlGnI9DLvK9UUnT2F
 Ax6UuOV6mQEwkNa+D5KhoWKqYZGLMSGXsqemT8c=
X-Google-Smtp-Source: AA0mqf7sEEzmlRLAAQP9PBSNUcFOdoKkpkZs63Mc0kuB5zYarUiijHnzhW65LPXz7J6wYtOh9pXwuQ==
X-Received: by 2002:a05:6808:2085:b0:35e:915c:f0b4 with SMTP id
 s5-20020a056808208500b0035e915cf0b4mr5552667oiw.16.1670966768708; 
 Tue, 13 Dec 2022 13:26:08 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 24/27] tcg: Factor init_ffi_layouts() out of
 tcg_context_init()
Date: Tue, 13 Dec 2022 15:25:38 -0600
Message-Id: <20221213212541.1820840-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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


