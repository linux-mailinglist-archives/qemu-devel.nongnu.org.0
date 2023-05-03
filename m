Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1D6F51AF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:34:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tQ-0004A3-Ol; Wed, 03 May 2023 03:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tK-0003W8-Rv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tH-0005aH-3V
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso30142265e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098825; x=1685690825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3ZFQS5rE664j/lAhJxfeYaqlwiJX/ioU9KxhK6ybMQ=;
 b=Eorfodf8Xn01Sxq6UctgRwoLwZu/t61I9R4+tfFV5JHolMfAT1EKpMITzeX8y3St8H
 DNMNzgbXMfNeBLXhQyM0gDUl2FI7tqtzkDe8hXZ5ALexePXatFceZ8iOSsYkp+MV+WOg
 CJS5cjbl7iEyZ+ofagEFv0dnDMKz8mBaNuLeMxkME6Z4fPCHXgNz9LYuz3161/iXpVu/
 Dy+Ql3l14yhA8U7KuPvF3jCSHWvyXffR4n2Jp+GN7JwFdJaugfqIj8Sh2/Q/PD5Rb+GS
 nZuLvAd1WN4xOAZx9cz5qiv/pkkHimUNslp9EsdONRuH0y5zkM5/e+U0Yd/tTeyOHTJM
 s2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098825; x=1685690825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3ZFQS5rE664j/lAhJxfeYaqlwiJX/ioU9KxhK6ybMQ=;
 b=I6/eilIhtl58aH8OWhP9umYZWWCZPDVw8HbvUrByMQTTYZyk9KyCvE+jZHtDdKx4ul
 gPmATsk+6xuAgA8KwTHT/iTqwX6g3dHuNYpyItxOhYoFtyTWAlz2rB4l7mQmDkkb5Opv
 ZFQ2rzhNeV3BbBSdHkhJ9OgWzFZ56W/W/cym3y2/soQuI0Ghd2opeYTUDc9Mz4gwThre
 LojyOLvIDnsdJxYBCV07R/ZZVPhO+I7HHg6wcNCz4mPqhcPRp8db+elwrIY4gBVNaVWk
 QjOtS08g8uj+SOcfXLpiYGHrUJHLzCdKtl/O1xR37gIym3Z5M0q5OVq/k8VJ5ZQEooWE
 chSg==
X-Gm-Message-State: AC+VfDwwEr/d3YNBtiZkmnsCP5NvOqNOZRYGhUgpuJT7jh3pe4C5vYsQ
 CYg2zWtbunyddlesX/1LdbA1FaP4aZw92yVeghzi8Q==
X-Google-Smtp-Source: ACHHUZ6ujGRl9AjozU5Gcqmc79VpsP0dKRByiy8nsPlP6v/lyzMCdlk45ngS04ZQM2RFEmY80D99Yg==
X-Received: by 2002:a1c:f20b:0:b0:3f3:1299:5625 with SMTP id
 s11-20020a1cf20b000000b003f312995625mr13831309wmc.30.1683098825619; 
 Wed, 03 May 2023 00:27:05 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 43/84] tcg: Move TCGv, dup_const_tl definitions to tcg-op.h
Date: Wed,  3 May 2023 08:22:50 +0100
Message-Id: <20230503072331.1747057-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These two items are the last uses of TARGET_LONG_BITS within tcg.h,
and are more in common with the other "_tl" definitions within that file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h        | 15 ++++++++++++++-
 include/tcg/tcg.h           | 19 -------------------
 target/mips/tcg/translate.h |  1 +
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 844c666374..b8f0599f3c 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -808,19 +808,23 @@ static inline void tcg_gen_plugin_cb_end(void)
 }
 
 #if TARGET_LONG_BITS == 32
+typedef TCGv_i32 TCGv;
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_mem_new tcg_global_mem_new_i32
 #define tcg_temp_free tcg_temp_free_i32
 #define tcgv_tl_temp tcgv_i32_temp
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
-#else
+#elif TARGET_LONG_BITS == 64
+typedef TCGv_i64 TCGv;
 #define tcg_temp_new() tcg_temp_new_i64()
 #define tcg_global_mem_new tcg_global_mem_new_i64
 #define tcg_temp_free tcg_temp_free_i64
 #define tcgv_tl_temp tcgv_i64_temp
 #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
 #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
+#else
+#error Unhandled TARGET_LONG_BITS value
 #endif
 
 void tcg_gen_qemu_ld_i32_chk(TCGv_i32, TCGTemp *, TCGArg, MemOp, TCGType);
@@ -1182,6 +1186,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_atomic_umax_fetch_tl tcg_gen_atomic_umax_fetch_i64
 #define tcg_gen_dup_tl_vec  tcg_gen_dup_i64_vec
 #define tcg_gen_dup_tl tcg_gen_dup_i64
+#define dup_const_tl dup_const
 #else
 #define tcg_gen_movi_tl tcg_gen_movi_i32
 #define tcg_gen_mov_tl tcg_gen_mov_i32
@@ -1296,6 +1301,14 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_atomic_umax_fetch_tl tcg_gen_atomic_umax_fetch_i32
 #define tcg_gen_dup_tl_vec  tcg_gen_dup_i32_vec
 #define tcg_gen_dup_tl tcg_gen_dup_i32
+
+#define dup_const_tl(VECE, C)                                      \
+    (__builtin_constant_p(VECE)                                    \
+     ? (  (VECE) == MO_8  ? 0x01010101ul * (uint8_t)(C)            \
+        : (VECE) == MO_16 ? 0x00010001ul * (uint16_t)(C)           \
+        : (VECE) == MO_32 ? 0x00000001ul * (uint32_t)(C)           \
+        : (qemu_build_not_reached_always(), 0))                    \
+     :  (target_long)dup_const(VECE, C))
 #endif
 
 #if UINTPTR_MAX == UINT32_MAX
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b3e8d78907..8bbd512555 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -357,13 +357,6 @@ typedef struct TCGv_i128_d *TCGv_i128;
 typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
-#if TARGET_LONG_BITS == 32
-#define TCGv TCGv_i32
-#elif TARGET_LONG_BITS == 64
-#define TCGv TCGv_i64
-#else
-#error Unhandled TARGET_LONG_BITS value
-#endif
 
 /* call flags */
 /* Helper does not read globals (either directly or through an exception). It
@@ -1165,18 +1158,6 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
-#if TARGET_LONG_BITS == 64
-# define dup_const_tl  dup_const
-#else
-# define dup_const_tl(VECE, C)                                     \
-    (__builtin_constant_p(VECE)                                    \
-     ? (  (VECE) == MO_8  ? 0x01010101ul * (uint8_t)(C)            \
-        : (VECE) == MO_16 ? 0x00010001ul * (uint16_t)(C)           \
-        : (VECE) == MO_32 ? 0x00000001ul * (uint32_t)(C)           \
-        : (qemu_build_not_reached_always(), 0))                    \
-     :  (target_long)dup_const(VECE, C))
-#endif
-
 #ifdef CONFIG_DEBUG_TCG
 void tcg_assert_listed_vecop(TCGOpcode);
 #else
diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 69f85841d2..fa8bf55209 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -10,6 +10,7 @@
 
 #include "qemu/log.h"
 #include "exec/translator.h"
+#include "tcg/tcg-op.h"
 
 #define MIPS_DEBUG_DISAS 0
 
-- 
2.34.1


