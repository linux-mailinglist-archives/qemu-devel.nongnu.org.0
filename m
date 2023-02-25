Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B036A2800
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:00:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQG-0001h4-J6; Sat, 25 Feb 2023 04:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqQ5-00019P-4D
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:41 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPy-00059S-SJ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:38 -0500
Received: by mail-pg1-x529.google.com with SMTP id d6so921218pgu.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
 b=pWQzIl6uOwBg4z8J1WTkYaKEWIfTw30phU0liJthKWOLdX8iIzHkHQ9PtyFXvcIfjY
 H64f7nGfmqKSAqnYJ6ZC62VVZAlV++s8InT0JJ1pMHAWNpgY9YKhGtSGTnFG/3qWi+rf
 bq76vB1MiaBBJ+c1afcBuExtGn0ZVghbr8W2bnNSnEJWD3DAHblpV+Th0YnoJb0D4oic
 P4QyCUYpVlOHndFazx4aYvWtVcvTOl9RKWbkMJQ8bWxgXxDTBSqvxVE6d3XhaUeNCRaP
 hQgkLk6W8wkJmTugrtp63j2tGgYE/Bh1P2dx+Wds/EwYPcGUYU1gj/deW+eseY0zMFhH
 APjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muKWZigrTG0gZJODOQUV3tX7j3/M0bbzqhpHMPJfkYo=;
 b=xCy5AnRGNm0/q1ufiE5bj26OuIWLO7GSdt2UpfxEIeFb4bNhwgFoclCC8hqQHvLhuJ
 jyqGFKi6RylPsfcbyUDqdah6m6SI8WoS1VTB3Cx8I1dAtNxX+RAj+wiH3RfIEh0n2x9H
 2P/O/XzOI5pC9L+hpzYmbyEuUDYbTHRkzQkEi0/LAQ9UcVuHax6HmDBy2ZAKccZLOuhu
 4zTqkt3txLKUvIt25nVC9j+w4siPtosqjZpawopvnL6i6O3yJTlsq0CKbqsI+WQ4y0Gp
 U6bSjK/8+On4bvN2rm1bojR3RRCi1i+LOl/sA0hIx0zeJOnxBGO7SE9rtDXSJKiBnYdn
 Pbtg==
X-Gm-Message-State: AO0yUKUU+9oxgbnz6f7tAzEGgo9aTIpe+dSOruudoVVcn4DLebEsNE78
 VQNw2vEe5ukEvSAyo/uMaMNY8iyBrt2frjsm82E=
X-Google-Smtp-Source: AK7set8cMnXlERypjmaLBOP+ZbI/+NPdzCBgxrbTsuR+Uo9dmux2se9IO+LYe0riO/XmOYbS24WGuw==
X-Received: by 2002:a05:6a00:2da7:b0:5a8:9858:750a with SMTP id
 fb39-20020a056a002da700b005a89858750amr2107258pfb.13.1677315632120; 
 Sat, 25 Feb 2023 01:00:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 29/30] tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
Date: Fri, 24 Feb 2023 22:59:44 -1000
Message-Id: <20230225085945.1798188-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

These symbols are now unused.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  2 --
 include/tcg/tcg.h    | 28 ----------------------------
 tcg/tcg.c            | 16 ----------------
 3 files changed, 46 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 66b1461caa..353d430a63 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -828,14 +828,12 @@ static inline void tcg_gen_plugin_cb_end(void)
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_mem_new tcg_global_mem_new_i32
-#define tcg_temp_local_new() tcg_temp_local_new_i32()
 #define tcg_temp_free tcg_temp_free_i32
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
 #else
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_mem_new tcg_global_mem_new_i64
-#define tcg_temp_local_new() tcg_temp_local_new_i64()
 #define tcg_temp_free tcg_temp_free_i64
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2e220d4040..7e2b954dbc 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -905,12 +905,6 @@ static inline TCGv_i32 tcg_temp_new_i32(void)
     return temp_tcgv_i32(t);
 }
 
-static inline TCGv_i32 tcg_temp_local_new_i32(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
-    return temp_tcgv_i32(t);
-}
-
 static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -931,12 +925,6 @@ static inline TCGv_i64 tcg_temp_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
-static inline TCGv_i64 tcg_temp_local_new_i64(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
-    return temp_tcgv_i64(t);
-}
-
 /* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
 static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 {
@@ -950,12 +938,6 @@ static inline TCGv_i128 tcg_temp_new_i128(void)
     return temp_tcgv_i128(t);
 }
 
-static inline TCGv_i128 tcg_temp_local_new_i128(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
-    return temp_tcgv_i128(t);
-}
-
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
@@ -976,12 +958,6 @@ static inline TCGv_ptr tcg_temp_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
-static inline TCGv_ptr tcg_temp_local_new_ptr(void)
-{
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
-    return temp_tcgv_ptr(t);
-}
-
 #if defined(CONFIG_DEBUG_TCG)
 /* If you call tcg_clear_temp_count() at the start of a section of
  * code which is not supposed to leak any TCG temporaries, then
@@ -1084,8 +1060,6 @@ void tcg_optimize(TCGContext *s);
 /* Allocate a new temporary and initialize it with a constant. */
 TCGv_i32 tcg_const_i32(int32_t val);
 TCGv_i64 tcg_const_i64(int64_t val);
-TCGv_i32 tcg_const_local_i32(int32_t val);
-TCGv_i64 tcg_const_local_i64(int64_t val);
 TCGv_vec tcg_const_zeros_vec(TCGType);
 TCGv_vec tcg_const_ones_vec(TCGType);
 TCGv_vec tcg_const_zeros_vec_matching(TCGv_vec);
@@ -1113,11 +1087,9 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
-# define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
-# define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i64((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 758b2a3e06..b65f2ffdbe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1476,22 +1476,6 @@ TCGv_i64 tcg_const_i64(int64_t val)
     return t0;
 }
 
-TCGv_i32 tcg_const_local_i32(int32_t val)
-{
-    TCGv_i32 t0;
-    t0 = tcg_temp_local_new_i32();
-    tcg_gen_movi_i32(t0, val);
-    return t0;
-}
-
-TCGv_i64 tcg_const_local_i64(int64_t val)
-{
-    TCGv_i64 t0;
-    t0 = tcg_temp_local_new_i64();
-    tcg_gen_movi_i64(t0, val);
-    return t0;
-}
-
 #if defined(CONFIG_DEBUG_TCG)
 void tcg_clear_temp_count(void)
 {
-- 
2.34.1


