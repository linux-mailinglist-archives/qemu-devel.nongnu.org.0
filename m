Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36029655BE3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP1-0002nU-Ii; Sat, 24 Dec 2022 18:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOv-0002aI-Jk
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:58:02 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOt-0006NW-UN
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:58:01 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so11950141pjp.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kRUHzLHjPRludB9lggQQFcCT178U0N5vVARh39rZgA=;
 b=DtP4qs0/jieOPAziMg7vW2olieGnLGcKLSs5f/Jxs0WmdQuM84bYy0L9EXM2odBMX6
 izaeyklfE1x1Iy30+aUdYTwhScwdvsEWR0Q6oZhvHw0jXaIt4ANYUZ2I95yohwLOFAU1
 QFHJuTJqeFbQM71VjDASuSZv1oMdq5F9rS4IhSo4SGN/lRF+Vwx2UsuOVTiW5bnDfjX6
 XREzvwVhKNXhNSNtCVkojx2Y4XBgyNqhkvi+GnPUC4SauafJXLMuS8CTDcbghjWznfSN
 JbUFRoWa/mO5Kmp5M7g8FoEreGalD9BiSs/VneH8a0Q1h7pcTtrHa4rjwYtXXbbV8mCD
 x2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kRUHzLHjPRludB9lggQQFcCT178U0N5vVARh39rZgA=;
 b=76bFmVBMyGsu+uy+vfnw0s77Z3O/NPvHTPFBWBy0uZl0t7CcPd/cCBFMwco2wmteLs
 DwalJ3Mr71KC1frju4ZU6G6nEwk67VGsUp3UDj78HDH7bpN9zQk8vCIPMpLkIAAHpKm4
 J8HmlskGGTL8+tnDy4GCgNAfUtK4JoNhinyNWsjDMawgqqcWLnD61pJsmrWqG+rDBaak
 Q+k7NuHT7fb/SGU7npI1vZLs9beA2XQsZZsZv4EicVvGAXqi5S0c6qne+Y3+ei+shqFg
 /F/OInZfi/twkySd1vtL9+YyhJ/BFfTv/30FuIvz+9oDJZS5DgUFKKRD1bkPVW9JlPqi
 g0qA==
X-Gm-Message-State: AFqh2kqaxZ/rkXajE0gdrTtsFPzjs9ZLfR2mPG7ic+ajAANF1QkOjDvj
 0KK+Lkc2pze8c/4ilaVLInE8r3+5QOMsrD6N
X-Google-Smtp-Source: AMrXdXtgd345lvvbKlTHcykYWrlmbdjXrUUvWRAiCWbNn58PXJ494dD7UoXpyLwWE1jQxEsLuMmNDw==
X-Received: by 2002:a17:903:32c3:b0:189:7819:e5c with SMTP id
 i3-20020a17090332c300b0018978190e5cmr21133237plr.6.1671926279146; 
 Sat, 24 Dec 2022 15:57:59 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 39/43] tcg: Convert typecode_to_ffi from array to function
Date: Sat, 24 Dec 2022 15:57:16 -0800
Message-Id: <20221224235720.842093-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In the unlikely case of invalid typecode mask, the function
will abort instead of returning a NULL pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221122180804.938-2-philmd@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 74f7491d73..46cce228a0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -555,14 +555,24 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static GHashTable *ffi_table;
 
-static ffi_type * const typecode_to_ffi[8] = {
-    [dh_typecode_void] = &ffi_type_void,
-    [dh_typecode_i32]  = &ffi_type_uint32,
-    [dh_typecode_s32]  = &ffi_type_sint32,
-    [dh_typecode_i64]  = &ffi_type_uint64,
-    [dh_typecode_s64]  = &ffi_type_sint64,
-    [dh_typecode_ptr]  = &ffi_type_pointer,
-};
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
 #endif
 
 typedef struct TCGCumulativeArgs {
@@ -779,14 +789,14 @@ static void tcg_context_init(unsigned max_cpus)
         nargs = DIV_ROUND_UP(nargs, 3);
 
         ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
-        ca->cif.rtype = typecode_to_ffi[typemask & 7];
+        ca->cif.rtype = typecode_to_ffi(typemask & 7);
         ca->cif.nargs = nargs;
 
         if (nargs != 0) {
             ca->cif.arg_types = ca->args;
             for (int j = 0; j < nargs; ++j) {
                 int typecode = extract32(typemask, (j + 1) * 3, 3);
-                ca->args[j] = typecode_to_ffi[typecode];
+                ca->args[j] = typecode_to_ffi(typecode);
             }
         }
 
-- 
2.34.1


