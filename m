Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6536A6643
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCip-0004B1-TX; Tue, 28 Feb 2023 22:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCih-0003XY-D8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:31 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCif-0004Jn-Fg
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:31 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so48363pjn.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3ZzIN9qhqBpTch4v0UAuYxztxGgmDml1rfPfM+OifU=;
 b=aB9X188Mnjtt6TuBMQQF1jCTz4Q7oD0Pq6iAynCwGILj0+bVJI4ixFbQau21ySfHhI
 36tRdqQOG9StHF/FUVnfvEJv+Nv0no2ofD1HZ0p87aztIUJvTFaiwF9BjI/7T3HXmgzd
 PUq2B6YUT6hHCzTEW5G/LYemmmr91m5CNFKfqptZSymms5q8YpRBVhq4/LVRIYEdL05Q
 rFBIaJcfMqFhN8DP2IwFvpWUKJPFegJagbsjuGhSqRvbBJT4dGOM2Qv30fylwF8h9E6I
 5LcJGuHSzSdpHcoQk0czWIIoBVhPwmMBJsZZBedS70Nhk0Eu+yB3vxwQtlpwSKbK6qsM
 DoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3ZzIN9qhqBpTch4v0UAuYxztxGgmDml1rfPfM+OifU=;
 b=nlykb1Y0chIisxlO/okRKmxfgyuc3ZwRhV6H17tmyn8g/lcd4v2wV9sQUkTzA9L9vY
 3RRrNdYLHe2yB8v8hwgKtsM/jCdFVA0VoTSFj0js5Qh+MulPww7Z5C4NuBlBaLYYmQPo
 IYvTDSYbMAsRaK8ipTdLL0c/VG6tL+gpUwcgPDpSnuU0/b5jcKx4ROuwPPgfL74AdnFh
 l1Y7chm4eiYibMywXD7TkzeJSS2WLT1ed+R0BcjNDIDIjmS9SV75V0MhIRB9eKbDJjhT
 TvU7EGxRmKTDCqQR8aNwx4EDqSfXeOTQHN2qE+iE8ESN4LtJRNLkjq83jt15dgEz3FW7
 mdtw==
X-Gm-Message-State: AO0yUKVfw/Tyl1MsFEhDB7iiqfNM0HZ3N6ngj44lQo5J8YMHH2YyuDlW
 5/Ntzym6AcAwgnDxc09SMv7lftUWhbhbd18XkHA=
X-Google-Smtp-Source: AK7set8BruhL5f6fbYG20L8EjhvZkEAJEvUYFkK+gWEUBBbmlkfiPKe0f+nMqg348imBZ1re87tggQ==
X-Received: by 2002:a17:902:a98c:b0:19d:19fb:55fd with SMTP id
 bh12-20020a170902a98c00b0019d19fb55fdmr4064152plb.20.1677639688678; 
 Tue, 28 Feb 2023 19:01:28 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 61/62] tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
Date: Tue, 28 Feb 2023 16:56:42 -1000
Message-Id: <20230301025643.1227244-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index 7f4d2f1920..5cccc06ae3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1475,22 +1475,6 @@ TCGv_i64 tcg_const_i64(int64_t val)
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


