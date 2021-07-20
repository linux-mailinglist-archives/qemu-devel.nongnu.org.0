Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77AE3CF9B5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:36:37 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ozE-0004Xc-Mi
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m5otl-0004Vv-AZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:30:57 -0400
Received: from rev.ng ([5.9.113.41]:59983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1m5oth-0004ei-7m
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g7K7ah7dzgA9qNNeIHcq61tdQ4zff5490T//67zBwbg=; b=O06w+rw40cd6NYuiXpsdKIo4n7
 q3Vpu7jEzzrpEzyWJBiTGbjQgyTZOxec/sz6gSSU7IWq/CGdE9ayRZ7n1b3GQqAO+D3IC9mh2g4Kw
 Ll8yqR2m8lFnisciAtaof3oTaOu0UK49/XYiNC4kFF8X6xSiPQ98wyFKv1BR4w6uUDPY=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 richard.henderson@linaro.org, Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v6 03/12] target/hexagon: make slot number an unsigned
Date: Tue, 20 Jul 2021 14:30:22 +0200
Message-Id: <20210720123031.1101682-4-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-1-ale.qemu@rev.ng>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/macros.h |  2 +-
 target/hexagon/genptr.c | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 094b8dabb5..cd4f878fcf 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -185,7 +185,7 @@
 #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
 
 #ifdef QEMU_GENERATE
-static inline void gen_pred_cancel(TCGv pred, int slot_num)
+static inline void gen_pred_cancel(TCGv pred, uint32_t slot_num)
  {
     TCGv slot_mask = tcg_const_tl(1 << slot_num);
     TCGv tmp = tcg_temp_new();
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 7333299615..2c7f4136b5 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -27,7 +27,8 @@
 #undef QEMU_GENERATE
 #include "gen_tcg.h"
 
-static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
+static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
+                                                uint32_t slot)
 {
     TCGv zero = tcg_const_tl(0);
     TCGv slot_mask = tcg_temp_new();
@@ -60,7 +61,8 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
     }
 }
 
-static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
+static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val,
+                                              uint32_t slot)
 {
     TCGv val32 = tcg_temp_new();
     TCGv zero = tcg_const_tl(0);
@@ -379,7 +381,7 @@ static inline void gen_store_conditional8(DisasContext *ctx,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
-static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
+static inline void gen_store32(TCGv vaddr, TCGv src, int width, uint32_t slot)
 {
     tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
     tcg_gen_movi_tl(hex_store_width[slot], width);
@@ -387,14 +389,14 @@ static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
 }
 
 static inline void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv src,
-                              DisasContext *ctx, int slot)
+                              DisasContext *ctx, uint32_t slot)
 {
     gen_store32(vaddr, src, 1, slot);
     ctx->store_width[slot] = 1;
 }
 
 static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
-                               DisasContext *ctx, int slot)
+                               DisasContext *ctx, uint32_t slot)
 {
     TCGv tmp = tcg_const_tl(src);
     gen_store1(cpu_env, vaddr, tmp, ctx, slot);
@@ -402,14 +404,14 @@ static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
 }
 
 static inline void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src,
-                              DisasContext *ctx, int slot)
+                              DisasContext *ctx, uint32_t slot)
 {
     gen_store32(vaddr, src, 2, slot);
     ctx->store_width[slot] = 2;
 }
 
 static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
-                               DisasContext *ctx, int slot)
+                               DisasContext *ctx, uint32_t slot)
 {
     TCGv tmp = tcg_const_tl(src);
     gen_store2(cpu_env, vaddr, tmp, ctx, slot);
@@ -417,14 +419,14 @@ static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
 }
 
 static inline void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src,
-                              DisasContext *ctx, int slot)
+                              DisasContext *ctx, uint32_t slot)
 {
     gen_store32(vaddr, src, 4, slot);
     ctx->store_width[slot] = 4;
 }
 
 static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
-                               DisasContext *ctx, int slot)
+                               DisasContext *ctx, uint32_t slot)
 {
     TCGv tmp = tcg_const_tl(src);
     gen_store4(cpu_env, vaddr, tmp, ctx, slot);
@@ -432,7 +434,7 @@ static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
 }
 
 static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
-                              DisasContext *ctx, int slot)
+                              DisasContext *ctx, uint32_t slot)
 {
     tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
     tcg_gen_movi_tl(hex_store_width[slot], 8);
@@ -441,7 +443,7 @@ static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
 }
 
 static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
-                               DisasContext *ctx, int slot)
+                               DisasContext *ctx, uint32_t slot)
 {
     TCGv_i64 tmp = tcg_const_i64(src);
     gen_store8(cpu_env, vaddr, tmp, ctx, slot);
-- 
2.32.0


