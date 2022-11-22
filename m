Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02374634356
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXh5-0001Rb-03; Tue, 22 Nov 2022 13:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXgy-0001N3-4I
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXgw-0000MY-Ev
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id t4so11301593wmj.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dxHXsv2E4iYr9vm2mCwNgEjbUPevhHxvL9iTZPxK6ik=;
 b=J36gG8+li/1U5SvhnXHxVbbqoz7dwjLfSuNtG2kwOYFhixDNle0ehgtiNXgWjZZrH+
 fEF+F7Ndtz/Oa94AM8b8Ulbo3ppe+xt5TpuSm7Sgqf4pWnxyAEW+kasAKbzBmj6Mbqm/
 hY326979HKVHTs+T0Ww+VUaNXAt0Xnv1nB+O4g7kv05jp50XmA2GJ1Y0LbI8St6d+Q5W
 dciKyXQHR4oHJis8r5PTp8HKsj1y7uUKaFCTKog5Ljz4i1Q5Ean2mJe/vwMG0me0gj5u
 nC5aOWoh60zNGJTwh9zra7FR9nVi5RWrlfq5tXHHY91cAJIENtXVdKb03t57JWDTxCcR
 gTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dxHXsv2E4iYr9vm2mCwNgEjbUPevhHxvL9iTZPxK6ik=;
 b=kGRlKB341ckKh7sQvG53Gcs5WzPVn23G2BAeb06l5r+LF9ycAr3I87WZP2LaFXHEki
 3XkgC5+hf/KU99QSRoeoG/K0I2Iq60NTGkRtKtxfctSrdntZxGdQno9PlyD4OhokOKFB
 KwPDpw2LPnCPaKtgvz35NP4DKSKtoF2Rl/Q6h0v1/Gwtq8sg6Y0mOPunB10+Rkcuwg7f
 7RscfnmHhRG5TUV6q7VMa9kUcJffToK1EFZ4fMb6KQblRdvPiqHS9cy7Jad5Vhem+1H0
 OVg66JNUdPMBvMPs84vxJzs2AN7HVl1G6zWTqK2B/yrJzsYvKjJ7blJ+PhEadSqMdkex
 nypw==
X-Gm-Message-State: ANoB5pkkgxovnnjFnVqlckECMS6tL6YuVom1BOA+acFxC2sSGP0ywciC
 3MqJgfMpFYrzZjPqLsY/+0EK8yA3Mr/lzg==
X-Google-Smtp-Source: AA0mqf6g0v+6kq6Ozoge9Zo0LwcBTF2lHhCz1bFGoy1dO2Rrh65usbV/jIYlltPl6BL455daW+hrUw==
X-Received: by 2002:a05:600c:538d:b0:3d0:47c:9fe9 with SMTP id
 hg13-20020a05600c538d00b003d0047c9fe9mr3568654wmb.40.1669140496460; 
 Tue, 22 Nov 2022 10:08:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adffec2000000b00241d544c9b1sm7758916wrs.90.2022.11.22.10.08.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Nov 2022 10:08:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] tcg: Factor init_ffi_layouts() out of tcg_context_init()
Date: Tue, 22 Nov 2022 19:08:03 +0100
Message-Id: <20221122180804.938-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122180804.938-1-philmd@linaro.org>
References: <20221111074101.2069454-27-richard.henderson@linaro.org>
 <20221122180804.938-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/tcg.c | 83 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 39 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8aa6fc9a25..9b24b4d863 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -572,7 +572,49 @@ static ffi_type *typecode_to_ffi(int argmask)
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
@@ -753,44 +795,7 @@ static void tcg_context_init(unsigned max_cpus)
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
2.38.1


