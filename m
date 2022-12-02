Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CCE63FFFD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:52:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymq-0002kq-9E; Fri, 02 Dec 2022 00:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymn-0002jw-Qr
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:33 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymm-0003Qb-5N
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:33 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so4175918pjd.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7o/uTcMX+wfPe8sHfpNtvUDYBEo1al5HudozA0YE4Gk=;
 b=ts19xmp7rCyRWF+QdgZ/WVNSAxs4s6r7VeE5u/vCLEKpAhYt/NkYdeiWeXhXqjpbKT
 jpU92ktuC41AoxQf3slwIYmkMYkoxmXqhnp+w5DVP+S+pDExZXKdziTUgfq9J6DtS57R
 9QgDqUwMqlyxXxvWqf3yugRd1lki4VMVdPUasykUoJdrksMFNnBRPQf7tZqD0Qd0XBSr
 hHXgqRTmf28eu2jvEF7jNSDGDATlpWz7P2X0JQiwvYsjAPKFksCzt9t1ilJudgLqBh/x
 mVRh75QZDH4ttnTYrixh81LInC3G+YYRNkLes7AEC40EvG4yDCIlQFBFy4jvuFka+I7r
 Kx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7o/uTcMX+wfPe8sHfpNtvUDYBEo1al5HudozA0YE4Gk=;
 b=M/GlVPwY3MZ5SnW1MaoJyFN2eQq0S3dxF+ONEa3ilkD4fUgW/p2qr5OWwThZIbQfKP
 mtbF7/t1ee/EHR+iAHOLVYuW4nhQkmBAmq1o5/RoDuhXXb0X9zOFwe2O5HiRSze6NCKF
 yhBOyhWq0plCdIvl6p4SSIFxvX3TJIhO3D8BLO7hOfpUMgT8xQPOWwXetN+ZdHVdM1kS
 /sKhoZJExSoGzGIDMpwqiTOZ4UNj/QPy7Vx4WPxGYDXRe4CnAHWUjFIElHXOFvlMmI+F
 jXSXpG+6039zc/TSEMF4LMsIQZQuXe11odaNK9ipVAdi2bAclJn9wZW5V8U018fEqMzQ
 zeaw==
X-Gm-Message-State: ANoB5pm7WzawoL8SmKxdfvCB3fnTD/5QeVaoW0DQYEKJUziJENNNk7Mt
 NCBNzqMxNctE4fg8RaxH1Kici5GylURpxpjk
X-Google-Smtp-Source: AA0mqf6hFgCW0YDzNe2JEKsfQDhG61Yt5ArpK+cKVrmK3tRsVAGFGQVyeBjgY1A+bJJSggKZztQFeg==
X-Received: by 2002:a17:90a:df8f:b0:219:20ed:101e with SMTP id
 p15-20020a17090adf8f00b0021920ed101emr30579685pjv.215.1669959630834; 
 Thu, 01 Dec 2022 21:40:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 31/34] tcg: Factor init_ffi_layouts() out of
 tcg_context_init()
Date: Thu,  1 Dec 2022 21:39:55 -0800
Message-Id: <20221202053958.223890-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
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


