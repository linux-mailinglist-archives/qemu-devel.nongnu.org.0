Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B735E384
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:11:11 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLd8-0000Fp-2l
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaT-0006E9-DR
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaM-0006tC-0U
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id k26so589357wrc.8
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0ZGdNnOiGwNj8lQaOaIdMrMwuGDxlAwHGTtG4I3LmxA=;
 b=HwgyFdPQ4/h8kqEqDsy/hckVOkWdsDk4pk9U4/4dAMZOc5/VTAwUpIjSEBRwI5R/xJ
 l8GRPM0aFhiub4lXtHY0ybeEY7UNaUIbrX4FQ4E1mFZCsu/hJX0Dh6BU/57hCfvyXQqa
 5GHLyWnsRwvofJ6VoDyT36qx/invI/CQsvzWByalXg0r/lLT55j3uDDbJ2SB0dYf0gsw
 IN533wqdrTvG+huH6d7P6PwO7f9B4uDlm9o4tGdlATwqp2VzVmElNmSpa9XCJA2gZNVA
 gVMRnNN8TquKYDE+SKyvWENVpLe3aHVqs8d0W4eISZmA28yWXQksUoN3VceMkrNYxNcq
 +QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ZGdNnOiGwNj8lQaOaIdMrMwuGDxlAwHGTtG4I3LmxA=;
 b=E4ODzrAFFKjILZEu30lTu7dU2q4KhjBLYCn+qKPGgczUwA4JhoNllvwwBJki1eX7HO
 vHe9lcPsYtGM1dpdkW4LxCXRnSTDCfcVH+Ul67Q4Con3eZFBWiHyEwI34kZejgwMzRpX
 PeFyKOQbWy0oXl/mNxMMUeJY+u0STmB/KoSMfIOVdj6xLzXTceRAv/0VzUOkx/rlP2Mr
 AckN3KpMJALgnpJdiip1bMPl/frKrFWEKPQn/EK5NFzVOTAs8Fv6XSdzu5+2Dm7SBPlf
 RCjooVGoa7GGlXYrcNR5iHDbN9q8bEh2YFrtqp2FrN1L/0ko8XnZlD0GoPeBCTrbiETT
 Tv2w==
X-Gm-Message-State: AOAM532ueeOs+p0ti03+00rtGQmhhFuBBqzAlioJuqzDfbiunSlpT0DE
 YBjWro/k5mqdzvYYx54qvz9p1nMyrC4D6jmM
X-Google-Smtp-Source: ABdhPJxVdme9WUY/XWjmG1KKySaGZZ2rq28Kw6NW1dV/j2eqfqIFqY9IUBVxAdbZTZSXqfi4AwWCXw==
X-Received: by 2002:adf:e50a:: with SMTP id j10mr290376wrm.394.1618330096639; 
 Tue, 13 Apr 2021 09:08:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/13] target/arm: Move gen_aa32 functions to translate-a32.h
Date: Tue, 13 Apr 2021 17:07:51 +0100
Message-Id: <20210413160759.5917-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the various gen_aa32* functions and macros out of translate.c
and into translate-a32.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 44 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c     | 49 +++++++-------------------------------
 2 files changed, 52 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index cb451f70a42..e0e03245f6f 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -57,4 +57,48 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+
+#define DO_GEN_LD(SUFF, OPC)                                             \
+static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 a32, int index)            \
+{                                                                        \
+    gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
+}
+
+#define DO_GEN_ST(SUFF, OPC)                                             \
+static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 a32, int index)            \
+{                                                                        \
+    gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
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
+
+static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 a32, int index)
+{
+    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
+}
+
+static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 a32, int index)
+{
+    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
+}
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 168427159ab..fd248b101f2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -879,8 +879,8 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
     return addr;
 }
 
-static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr;
 
@@ -894,8 +894,8 @@ static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr;
 
@@ -909,20 +909,6 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-#define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}
-
-#define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}
-
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
 {
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
@@ -931,8 +917,8 @@ static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
     }
 }
 
-static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
@@ -940,14 +926,8 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
-                                 TCGv_i32 a32, int index)
-{
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
-}
-
-static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
@@ -963,19 +943,6 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
-                                 TCGv_i32 a32, int index)
-{
-    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
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


