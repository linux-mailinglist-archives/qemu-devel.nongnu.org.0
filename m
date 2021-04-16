Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779536285C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:11:03 +0200 (CEST)
Received: from localhost ([::1]:59838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTrp-0006nG-PS
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThj-0003jH-88
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:35 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThQ-0004Kd-BK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:34 -0400
Received: by mail-pg1-x532.google.com with SMTP id f29so19813372pgm.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JYXrsziQJ+2kkGBxoTfc1nhhgeCmFg+itswQ++dMS0=;
 b=MMXATsoTqhVtFU/Z+UvY//C4A0uGt6ec7aguA5lEu7IbdJt6zRnP2KqrYQQYdaQHN2
 +AUks5fcaGEyoLgKW97iRMRkskzLzrmuJmYy0uwRMPtgaF/jvu5bAt9iJokz7P936Eel
 Wt8MngAmP6zsg1Pm5q4NUJ9igeO8aVcE2cFWcn/8gkce8HslWsgKjy+IQJtaAwEjg7D0
 GIMHoV5eoG4x6rWYWKnTRWSWNYek5/hVmyU13eeNW9eQBMX9mUh62LZGc205N2Y1u64/
 hBN4X8993EzPQuggOiE3ihsCiPW9zd7i9+AUwKQ0hYFfPKsO5QnadQF/L3L4ujTOGR9O
 IhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JYXrsziQJ+2kkGBxoTfc1nhhgeCmFg+itswQ++dMS0=;
 b=rHbxGKyAz8YGCgrEE25RnR3xx+6dmwzRBQmL4+3o94ahlITvChjZ1NdGj2Pug4Uycd
 l88qaNgm6GnwA53Wy0Lt1hB0VulE+eRQ12phRxF7sUO5tp+vf1cpFDGI6S3KNpBh8bDG
 4Z8OhWTk1qQR8kUmYpH17Rgnx4CYrLnZhRjTAWkE+dLYVwpqhQa4nsjbthydJxRSqrt9
 2OZUpPl+dS0vW0tSuOZHgZUZhZ0HuVQVSV7l6JSplMlbbHRSTZLKKhAWkk3gzN1C1JJ+
 jfEwJ+/3UU/9s3x/vN3mIk2zACxQCm5nNu/bFw15eEmZr2LoE+3pxOhGRYAkx3DL1v/+
 cETQ==
X-Gm-Message-State: AOAM53341q8lmUPZusn06d70oATlJ6Hd7hbW1tariXJygVC7s5TpFrGq
 kzwGBbZPOPRGx1ryBrbvKiOChKtLuj7ixg==
X-Google-Smtp-Source: ABdhPJwaP64xbyG5F53d8gJqW8NQos4e+6IVYcAsuXmsEE++zmEd+VVvKmgYkLu9p/kZAz1lqR3OxA==
X-Received: by 2002:a65:6095:: with SMTP id t21mr456207pgu.383.1618599613146; 
 Fri, 16 Apr 2021 12:00:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/30] target/arm: Adjust gen_aa32_{ld,
 st}_i64 for align+endianness
Date: Fri, 16 Apr 2021 11:59:42 -0700
Message-Id: <20210416185959.1520974-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adjust the interface to match what has been done to the
TCGv_i32 load/store functions.

This is less obvious, because at present the only user of
these functions, trans_VLDST_multiple, also wants to manipulate
the endianness to speed up loading multiple bytes.  Thus we
retain an "internal" interface which is identical to the
current gen_aa32_{ld,st}_i64 interface.

The "new" interface will gain users as we remove the legacy
interfaces, gen_aa32_ld64 and gen_aa32_st64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c          | 78 +++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  6 ++-
 2 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 52b9ca502e..7472e98f09 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -949,6 +949,37 @@ static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
     tcg_temp_free(addr);
 }
 
+static void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+
+    tcg_gen_qemu_ld_i64(val, addr, index, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+    tcg_temp_free(addr);
+}
+
+static void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_rotri_i64(tmp, val, 32);
+        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
+        tcg_temp_free_i64(tmp);
+    } else {
+        tcg_gen_qemu_st_i64(val, addr, index, opc);
+    }
+    tcg_temp_free(addr);
+}
+
 static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
@@ -961,6 +992,18 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     gen_aa32_st_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
+static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                            int index, MemOp opc)
+{
+    gen_aa32_ld_internal_i64(s, val, a32, index, finalize_memop(s, opc));
+}
+
+static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                            int index, MemOp opc)
+{
+    gen_aa32_st_internal_i64(s, val, a32, index, finalize_memop(s, opc));
+}
+
 #define DO_GEN_LD(SUFF, OPC)                                            \
     static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
                                          TCGv_i32 a32, int index)       \
@@ -975,47 +1018,16 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
-{
-    TCGv addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_ld_i64(val, addr, index, opc);
-
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-
-    tcg_temp_free(addr);
-}
-
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
-}
-
-static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
-{
-    TCGv addr = gen_aa32_addr(s, a32, opc);
-
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_rotri_i64(tmp, val, 32);
-        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-        tcg_temp_free_i64(tmp);
-    } else {
-        tcg_gen_qemu_st_i64(val, addr, index, opc);
-    }
-    tcg_temp_free(addr);
+    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
+    gen_aa32_st_i64(s, val, a32, index, MO_Q);
 }
 
 DO_GEN_LD(8u, MO_UB)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index c82aa1412e..18d9042130 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -494,11 +494,13 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
+                                             endian | size);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
+                                             endian | size);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
             }
-- 
2.25.1


