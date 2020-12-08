Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E665F2D31C2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:10:04 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhR5-0006CH-VU
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIv-0007Xg-MP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:37 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:34569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIq-0006LZ-Uj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:37 -0500
Received: by mail-oi1-x22b.google.com with SMTP id s75so17233527oih.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wXxlIHEHV0RVDyckAtbEiZsJCIXIPBDl5ZKGc44kZZY=;
 b=HLjHtvA0lWB8x7nePXTlbZplRmtil20swZHbwsJjXiZBDzVJjtx7j4FF/9VViwRd/Q
 Pvk6c4hbY+ozKQ2FcNkg1H8s+/9LOTB+d+RXw1QUdfR2VeB0Ltx02UWxbJ2EjSfFQERE
 uG609SXQg36wYiRUFE4q1Skt4AKKTrB1JLtIscMGOFurQ6m1O1r60pOXRU3snqqUcVNc
 IqmX74DA2niLK6cJn4t71DT22W/DM1KDHZqoCl8jGCtIngGEMQ3vppiWl6KDcAzC4GVe
 voaaDauT6ntGVRyFbQTwnd6uLZ3sWUP7Wy+Ggk3Lra8my/MYT8vhuuUqrs/TKI763r7B
 SrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wXxlIHEHV0RVDyckAtbEiZsJCIXIPBDl5ZKGc44kZZY=;
 b=GAV3HDCTdNlLNc2adAOT4pV3+SlXayKaFZ9SQ0YGq1bS8axgV3K2lEv6eiJkJ2C7bP
 wNhRyh+OgHkxTcCtaQ3de2S8O5ZwbYK8DaVyR0YWLaCetYYXCu37B0Z5DvNWgxvlrN+P
 xJFf9REH5/X3LDO22V7cdJZCbrYHUnxqJ41s2829xM5aqV0Cf1J1g1P0uWckucWnVtTZ
 XEH/mksUpTzuYr+mZCnO5tXXrOAcebTH2ScscZa7oXghnPIbizTObXgewGjo5uDQG5Cq
 9AqS29Cn74SLJVduPjNjckwMMi8/qXYsbz1EBWLj+xzIuwSWJ8jj7JBhiAMQGjMbgqCs
 DiVg==
X-Gm-Message-State: AOAM533SmM07r+RdqWQEae+AYH/bauzNjQLvzjOwRIO9kO3OWd6Qqzle
 8I72/6gQyV4eGanyfuMFGa1WUcHcxZYlGQNj
X-Google-Smtp-Source: ABdhPJwqzvjWftluD5JRXoYAVJAa0MvQFtrbeYeBMdKEVnSjtRcXf1DVeAJZ0qQfvugyUOy3UWpcNQ==
X-Received: by 2002:aca:bb0b:: with SMTP id l11mr3630747oif.16.1607450489984; 
 Tue, 08 Dec 2020 10:01:29 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] target/arm: Adjust gen_aa32_{ld,
 st}_i64 for align+endianness
Date: Tue,  8 Dec 2020 12:01:00 -0600
Message-Id: <20201208180118.157911-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c          | 78 +++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  6 ++-
 2 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ef9192cf6b..f6007c23a6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -916,6 +916,37 @@ static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
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
@@ -928,6 +959,18 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
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
@@ -942,47 +985,16 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
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


