Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5DE36FBBC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:48:42 +0200 (CEST)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTVZ-0003Ff-6L
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBT-0005m7-GK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:27:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBN-0003uV-8y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:27:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n2so17423799wrm.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GPn2l19Tl97twEGYdelqET0yx7jf0VXXEvaoWPFd1+c=;
 b=scn6RxAs73iH840hhFAZQRgVRIU6uz48PNS+th+aQ+B5Jq0oux5SFB8htU5RsJfmfz
 vxvZiDm0S+hON4WCtEexzJiVCExvDVhGqUXP/+ZCh6UY0JRjErKu0iDVAf03xgAd3gy2
 BC0ye6eahaxnZcIMd2NV6mULBCieTLNWInkL2Pl7RD+MxBKF/wVOLzksABVYsXgzscTb
 vxCmqp/4xdqoHfF2vnJ/yD823dXfFh7j2bUOxT1SkJIYSznqDlhdzQGAUgu1++lT0kpa
 Zzoi+keuFF8QcW/HhEp4U7TxLVSpB8FoplyV+nt3+KL5l88UsvZJPGPa66KKD0YVylJX
 s9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPn2l19Tl97twEGYdelqET0yx7jf0VXXEvaoWPFd1+c=;
 b=F91XbK487mFt0jy4aKf1WbUmTvO52rbDywg/Skjr/KeXtT9OFv4vAsGvdmBDpI4Jsh
 TvZHSbQdn+8oShgBQ/7B8njkQkuics1oDriA/jU54I5IeF7fa37JdiNABMC5ZqXZGQjd
 /r86h6woFl+MqItxED90Yjv9ziWdy9ANaq9xGbPKD210rXCyIeDqpRNyrnyqmrdGo0c4
 FWE7bWV6C3kT5TJj4/VrCeZRglx5dRjHbFQPFNedN9fESMUbclXrZbwyiUqoHGwqqdQ6
 yeCvQj45WnFguPbNcg5YfP1BkHpW1g6A3EeFDRUs6jReUWLUiEZZnDI22x2f+pDH1/f9
 X+dA==
X-Gm-Message-State: AOAM5330rZTosySWkLw6ipPS9fdWjZ4RfucEFzAmT2fEyfZIb3ZPX281
 htMowHolAQetAc5+anEqdyeIm3wAXTUaJfPm
X-Google-Smtp-Source: ABdhPJzIvtUF+MZvA8F//80+cGKzLSCfvLpk5qG36aJSCI67EbBF+jZUxt9x5SXj8LDomFiviDOP+w==
X-Received: by 2002:a5d:6510:: with SMTP id x16mr6939384wru.345.1619789267298; 
 Fri, 30 Apr 2021 06:27:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/13] target/arm: Move gen_aa32 functions to
 translate-a32.h
Date: Fri, 30 Apr 2021 14:27:32 +0100
Message-Id: <20210430132740.10391-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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


