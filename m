Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6D50BF53
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:09:45 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxiz-00013y-3G
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHY-00081n-HE
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:24 -0400
Received: from rev.ng ([5.9.113.41]:47367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHU-000654-LX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BNXKcnMArWr4pNmAva85EZjIQFyNvXGlQLE8e0VGUBE=; b=TPwyfHwKgCiS6PIUJoXa0RBbmT
 9iWD6JIRHdHV7M3av3HFCQy/kHaQZLM0bkfmWKaEuG5ZMLLxzczkm2x84C+jfK+tkrgZczqZbx6YA
 +u6D8afqausnkZOAhloMVMyAksRMAWBuS3KYQzTaviuJC/PBJgN5PeiDdP50rzgnLU7I=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 03/12] target/hexagon: make slot number an unsigned
Date: Fri, 22 Apr 2022 19:40:50 +0200
Message-Id: <20220422174059.4304-4-anjo@rev.ng>
In-Reply-To: <20220422174059.4304-1-anjo@rev.ng>
References: <20220422174059.4304-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/genptr.c | 24 +++++++++++++-----------
 target/hexagon/macros.h |  2 +-
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index cd6af4bceb..df126de55b 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -30,7 +30,8 @@
 #include "gen_tcg.h"
 #include "gen_tcg_hvx.h"
 
-static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
+static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
+                                                uint32_t slot)
 {
     TCGv zero = tcg_constant_tl(0);
     TCGv slot_mask = tcg_temp_new();
@@ -62,7 +63,8 @@ static inline void gen_log_reg_write(int rnum, TCGv val)
     }
 }
 
-static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
+static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val,
+                                              uint32_t slot)
 {
     TCGv val32 = tcg_temp_new();
     TCGv zero = tcg_constant_tl(0);
@@ -394,7 +396,7 @@ static inline void gen_store_conditional8(DisasContext *ctx,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
-static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
+static inline void gen_store32(TCGv vaddr, TCGv src, int width, uint32_t slot)
 {
     tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
     tcg_gen_movi_tl(hex_store_width[slot], width);
@@ -402,49 +404,49 @@ static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
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
     TCGv tmp = tcg_constant_tl(src);
     gen_store1(cpu_env, vaddr, tmp, ctx, slot);
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
     TCGv tmp = tcg_constant_tl(src);
     gen_store2(cpu_env, vaddr, tmp, ctx, slot);
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
     TCGv tmp = tcg_constant_tl(src);
     gen_store4(cpu_env, vaddr, tmp, ctx, slot);
 }
 
 static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
-                              DisasContext *ctx, int slot)
+                              DisasContext *ctx, uint32_t slot)
 {
     tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
     tcg_gen_movi_tl(hex_store_width[slot], 8);
@@ -453,7 +455,7 @@ static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
 }
 
 static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
-                               DisasContext *ctx, int slot)
+                               DisasContext *ctx, uint32_t slot)
 {
     TCGv_i64 tmp = tcg_constant_i64(src);
     gen_store8(cpu_env, vaddr, tmp, ctx, slot);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index a78e84faa4..5ea2d54ebe 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -185,7 +185,7 @@
 #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
 
 #ifdef QEMU_GENERATE
-static inline void gen_pred_cancel(TCGv pred, int slot_num)
+static inline void gen_pred_cancel(TCGv pred, uint32_t slot_num)
  {
     TCGv slot_mask = tcg_temp_new();
     TCGv tmp = tcg_temp_new();
-- 
2.35.1


