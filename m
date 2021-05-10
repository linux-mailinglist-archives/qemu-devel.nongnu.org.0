Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20C1378C49
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:32:05 +0200 (CEST)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg54v-0005fl-0P
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z2-0005ij-8e
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yz-0003BJ-3H
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id v12so16410741wrq.6
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F/y3Y82w4iYTV52gBLNIxeh3URAI90qoJNd+VV3fQQQ=;
 b=Z2UCd05yActMDhadWNFix+hksBPqUggmjdb0G8qWMNZ0rQ/OM+X48dfNv+TOG/8EU7
 jnAIpTkAzJKKfZQ5btDTax2IDRx6lCR2cIJWKnm13pYWG474ETwGqg4DQ6HVOaY/928x
 tPCTAcNVgVyL3qpTXpnNH0yvhI+a3j9DRgH0yqyl6L5E4e9DZB4QO62VtPhLqLNRN/t/
 AwSgcyfGr/Qyc4XS7Gis+Skyl3H5DD3NwbFP7PkeKzBx5G/t0sdNh4d7hgXL5jzGWRqE
 HG/TocFQemWTy5AZwP4QjQLjBK+MjOHl8OOxfCJk5ksHmz9w3gD0JV0WDcm3a8oMZ8Ro
 K//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/y3Y82w4iYTV52gBLNIxeh3URAI90qoJNd+VV3fQQQ=;
 b=EULARLTxd6Oyai/v1p8PBd1k1owjGB9lGKg7qKrLqao8MhdA522AIV7p+cXpaF4Jew
 o9ZYvyEI1PvaT2CAREn8AYmhBvei0cPp5i3iJyYpoYj6oCPeT5v72qmbP9qNdIOFgJzk
 oH3+j69fc11LQbUbya6kcDLvUwQfS/sk5BbosWFycYIZu2pWk66XcSl/aCbRIjWZCygs
 CV5RQ2F4VnC965LJqMy3a5vUuBoBWXOPCQW7VaYqzI91XVEkDRrcywtfNuooCOOMhslN
 cGI7E0mcPHlYVvpC8IfWA3tJnUs94ZhLGpLBca8bUudq//vccetjdtBfV4ifMFR7mkVn
 Omfg==
X-Gm-Message-State: AOAM5335Y+kK07hDqg6k05k0Pk1+ACBZtCg5gkZQEtnQSLS3KqpltP76
 M0fD52vCk0CipPN1Q5cMT3M9PWkeK48Ssw==
X-Google-Smtp-Source: ABdhPJxircdWVUHtVzqSst3G0vPEgE4YDLcz2/Jxy/kp+Dtdcgjep7BNW50MUEAYb8QACvTFrA+F8g==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr30692188wrs.343.1620649555799; 
 Mon, 10 May 2021 05:25:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/26] target/arm: Move gen_aa32 functions to translate-a32.h
Date: Mon, 10 May 2021 13:25:30 +0100
Message-Id: <20210510122548.28638-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the various gen_aa32* functions and macros out of translate.c
and into translate-a32.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210430132740.10391-6-peter.maydell@linaro.org
---
 target/arm/translate-a32.h | 53 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate.c     | 51 ++++++++++++------------------------
 2 files changed, 69 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index cb451f70a42..522aa83636a 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -57,4 +57,57 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
+                              TCGv_i32 a32, int index, MemOp opc);
+void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
+                              TCGv_i32 a32, int index, MemOp opc);
+void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
+                              TCGv_i32 a32, int index, MemOp opc);
+void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
+                              TCGv_i32 a32, int index, MemOp opc);
+void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+
+#define DO_GEN_LD(SUFF, OPC)                                            \
+    static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
+                                         TCGv_i32 a32, int index)       \
+    {                                                                   \
+        gen_aa32_ld_i32(s, val, a32, index, OPC);                       \
+    }
+
+#define DO_GEN_ST(SUFF, OPC)                                            \
+    static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val, \
+                                         TCGv_i32 a32, int index)       \
+    {                                                                   \
+        gen_aa32_st_i32(s, val, a32, index, OPC);                       \
+    }
+
+static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 a32, int index)
+{
+    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
+}
+
+static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 a32, int index)
+{
+    gen_aa32_st_i64(s, val, a32, index, MO_Q);
+}
+
+DO_GEN_LD(8u, MO_UB)
+DO_GEN_LD(16u, MO_UW)
+DO_GEN_LD(32u, MO_UL)
+DO_GEN_ST(8, MO_UB)
+DO_GEN_ST(16, MO_UW)
+DO_GEN_ST(32, MO_UL)
+
+#undef DO_GEN_LD
+#undef DO_GEN_ST
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 46f6dfcf421..5113cd2fea6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -899,24 +899,24 @@ static TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
  * Internal routines are used for NEON cases where the endianness
  * and/or alignment has already been taken into account and manipulated.
  */
-static void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
-                                     TCGv_i32 a32, int index, MemOp opc)
+void gen_aa32_ld_internal_i32(DisasContext *s, TCGv_i32 val,
+                              TCGv_i32 a32, int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i32(val, addr, index, opc);
     tcg_temp_free(addr);
 }
 
-static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
-                                     TCGv_i32 a32, int index, MemOp opc)
+void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
+                              TCGv_i32 a32, int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_st_i32(val, addr, index, opc);
     tcg_temp_free(addr);
 }
 
-static void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
-                                     TCGv_i32 a32, int index, MemOp opc)
+void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
+                              TCGv_i32 a32, int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
@@ -929,8 +929,8 @@ static void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
     tcg_temp_free(addr);
 }
 
-static void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
-                                     TCGv_i32 a32, int index, MemOp opc)
+void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
+                              TCGv_i32 a32, int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
@@ -946,26 +946,26 @@ static void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
     tcg_temp_free(addr);
 }
 
-static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     gen_aa32_ld_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
-static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     gen_aa32_st_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
-static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     gen_aa32_ld_internal_i64(s, val, a32, index, finalize_memop(s, opc));
 }
 
-static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     gen_aa32_st_internal_i64(s, val, a32, index, finalize_memop(s, opc));
 }
@@ -984,25 +984,6 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
-                                 TCGv_i32 a32, int index)
-{
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
-}
-
-static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
-                                 TCGv_i32 a32, int index)
-{
-    gen_aa32_st_i64(s, val, a32, index, MO_Q);
-}
-
-DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16u, MO_UW)
-DO_GEN_LD(32u, MO_UL)
-DO_GEN_ST(8, MO_UB)
-DO_GEN_ST(16, MO_UW)
-DO_GEN_ST(32, MO_UL)
-
 static inline void gen_hvc(DisasContext *s, int imm16)
 {
     /* The pre HVC helper handles cases when HVC gets trapped
-- 
2.20.1


