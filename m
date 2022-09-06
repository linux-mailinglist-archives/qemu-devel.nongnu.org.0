Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBDC5AE7F2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:23:43 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXcE-0005a1-By
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVfB-00042t-J1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVer-0005I7-QT
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:36 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso7164995wmb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Gr6TMe79rykpbY2OKJne6en+l9Uwyaw66b30AMqDeL0=;
 b=xcjngtZW+vnGxphvnbMAOc4ih10Jzluqy94s4WQYFhgoz7IESYS2Qnfamb3oIvNcYF
 dC62y610gzWdff+oezhWy2O0A1q4c0QvmYOkSz4+34GXPfPcHE0GB8yv8DT+9hyaxOXY
 xLW8Kpt2pu0/FJ4pp4JTspbNk/iKUWGXaW6vQSSdAz1fV6lww0lLIT62T3oamDAxEU4X
 TKD1u0lPOTHZYnyAulEnHC7iS59lcGgmy0yslSxhRe43QRwCiziu0gAttvQLNtBFiLg8
 Y+bQ13sonw382mPY4TGM5pae0BuZ6ImoZF/mLqqmYBhXxN8DVlbWqanwEk78NkO+Hiic
 rVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Gr6TMe79rykpbY2OKJne6en+l9Uwyaw66b30AMqDeL0=;
 b=avq0snK+TXzGG9/it0LK5lXkmaYL4S6sZ/VoXSw4TEqLZ13yrsvn6p88iPsltfF26Z
 ROMZfWHDILBr3CBZrwfAdc0bWk5vVBdkQHnIVaEi3eE76gGJI1hP90HStJveiIen/0lx
 5MoZzWlsI+wGvP/6IG5tqsCoQoi+o24eA2oFbz4kVtc+eB2XC3OAHi8f6P49hjAiW6O6
 RkGdPgGZBadJJdTi+rXIXjy22QwqNwCkwNIxqktCKOqAPpDhAX2zjLov+Q9PbuSCTIrm
 Wys6EUlZEimcHyGjoX7ucZWcBotnqIn5bdMHYoN+x6i0klngDZOcUBAPesl1p2UGcGZY
 BIZw==
X-Gm-Message-State: ACgBeo0b/5PAE9DWSGXXbxqVgZc/6dTvCVtIyT0wgjSCiLK2P7+2GTtO
 5mppaVE8PHvBLr45NFp3q3e31ZPXIDpyl8VI
X-Google-Smtp-Source: AA6agR7OCijM/VtJy6COAz6iu9vfVrRIskd0qaVf04NmFrWq3xCh6569qgw5qk8cEhqAPbiJP4etOg==
X-Received: by 2002:a05:600c:1d9a:b0:3a6:248:1440 with SMTP id
 p26-20020a05600c1d9a00b003a602481440mr13886684wms.196.1662459493134; 
 Tue, 06 Sep 2022 03:18:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 23/26] tcg: Pass TCGTempKind to tcg_temp_new_internal
Date: Tue,  6 Sep 2022 11:17:44 +0100
Message-Id: <20220906101747.344559-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 14 +++++++-------
 tcg/tcg.c         | 20 +++++++++++++++-----
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 26a70526f1..42f39bcf54 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -846,7 +846,7 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
                                      intptr_t, const char *);
-TCGTemp *tcg_temp_new_internal(TCGType, bool);
+TCGTemp *tcg_temp_new_internal(TCGType, TCGTempKind kind);
 void tcg_temp_free_internal(TCGTemp *);
 TCGv_vec tcg_temp_new_vec(TCGType type);
 TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match);
@@ -880,13 +880,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_NORMAL);
     return temp_tcgv_i32(t);
 }
 
 static inline TCGv_i32 tcg_temp_local_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_LOCAL);
     return temp_tcgv_i32(t);
 }
 
@@ -899,13 +899,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_NORMAL);
     return temp_tcgv_i64(t);
 }
 
 static inline TCGv_i64 tcg_temp_local_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_LOCAL);
     return temp_tcgv_i64(t);
 }
 
@@ -918,13 +918,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_NORMAL);
     return temp_tcgv_ptr(t);
 }
 
 static inline TCGv_ptr tcg_temp_local_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_LOCAL);
     return temp_tcgv_ptr(t);
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 11bdb96dd1..2bfba860d4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -942,14 +942,24 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     return ts;
 }
 
-TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
+TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
-    k = type + (temp_local ? TCG_TYPE_COUNT : 0);
+    switch (kind) {
+    case TEMP_NORMAL:
+        k = 0;
+        break;
+    case TEMP_LOCAL:
+        k = TCG_TYPE_COUNT;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    k += type;
+
     idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
     if (idx < TCG_MAX_TEMPS) {
         /* There is already an available temp with the right type.  */
@@ -1008,7 +1018,7 @@ TCGv_vec tcg_temp_new_vec(TCGType type)
     }
 #endif
 
-    t = tcg_temp_new_internal(type, 0);
+    t = tcg_temp_new_internal(type, TEMP_NORMAL);
     return temp_tcgv_vec(t);
 }
 
@@ -1019,7 +1029,7 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 
     tcg_debug_assert(t->temp_allocated != 0);
 
-    t = tcg_temp_new_internal(t->base_type, 0);
+    t = tcg_temp_new_internal(t->base_type, TEMP_NORMAL);
     return temp_tcgv_vec(t);
 }
 
-- 
2.34.1


