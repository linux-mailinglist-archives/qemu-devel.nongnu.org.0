Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC245364B3B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:39:03 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYafe-0006EJ-S9
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQb-0007Py-MM
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:29 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQZ-0002ai-3v
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:29 -0400
Received: by mail-qt1-x82a.google.com with SMTP id y12so27135541qtx.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLC+ctpxmYYJKrv9PKF8N96KFgvrETqKbNbjpw6oTm4=;
 b=kZ3Sy8zY2Y3D0Dl5ic/iomVvS1oYmIpYCXGM/3vuF1aBcUofnF7A0Mr7xEaac2NCwf
 tcno81VSDmMDWltoAeMAVCJ4Afq0UcQ0MOb/fiwom2IJPZ2qxrAnRQIdaX3qXQ61tHMI
 RAhyyhi4QaH4x2B9A2VKhWFcvOJAK5FOUyRQb2vzrxBXvSN/NuMuCSWxi6HZqJ7dHLba
 /GAakTJH3GOYnWYtT4eAMhwjKo4hlZtJ9YzK2b1iU3V1mihK2o6jLgJovYE6lg+Yq69e
 EUZ2GpBeKq2ejQwMGr7Lcj87J1dItVDQbnZMGZ3lcoD+CIa7HLd65bo8n38gg71xvKO7
 EqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLC+ctpxmYYJKrv9PKF8N96KFgvrETqKbNbjpw6oTm4=;
 b=EhEdXVG0Sn1Iv+cUR43tDozAAWq3USqzh6LP1Bwt+8kXU9+1jm9J6ABNPkYa7ix5zv
 uj9+jkln7m4kKrs1FDdon3ZiuryEj3s8qwv+04G7ztCOtcC9fKo264qIBeBqs7ZqD/Hw
 RajUI7s4Guli6hVEKji/pKfY6H1TvcxH6KDmZDVkfTSe4r8O6DKlrnY0DSB49lmeGnap
 9mypZZKgGu6J/ORrDWU3Iz2g3l5Q5TFd6vvHr4Pn1bbyCLyJ6PTyx0O/FSwejesTMLEJ
 kQkg0ggYUg39vSh73tzApNHx1yXseDsMRClPqXG8sKyIvQRW5Q2Nt4hUYG9b3w92asGu
 Nr4Q==
X-Gm-Message-State: AOAM532lDGX03M4I4fQ6ZXudg719sKKTSuHgotXgrLcoxWmqxmvXUYrv
 pkBGbPyYgERDOwDbTuqLN0k9RxgHE1RUG7nH
X-Google-Smtp-Source: ABdhPJxOrVWph9JXX3EMY5Xm/YkaMXva60KwDYTAcStW5JqBduG5MdtCoZ92Z02lUy1/3BcmIpaNbg==
X-Received: by 2002:ac8:5fc4:: with SMTP id k4mr13695336qta.124.1618863806178; 
 Mon, 19 Apr 2021 13:23:26 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/31] target/arm: Adjust gen_aa32_{ld,
 st}_i64 for align+endianness
Date: Mon, 19 Apr 2021 13:22:40 -0700
Message-Id: <20210419202257.161730-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index d37a3dfa4a..6171347d6d 100644
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


