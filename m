Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF84AF7F8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:23:00 +0100 (CET)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqgF-00005T-FO
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNS-0005zz-4t
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:34 -0500
Received: from rev.ng ([5.9.113.41]:53463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nHqNO-0004XJ-4j
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fP2xRBXaSEHkfgLHjyAqV/vG+azvM+UPIXbQdQUcDOM=; b=xcYzMEzRnbYOQm+k7Ld74uwOZv
 vcmPUj1y9qx5KxY2tI2MAWK95ttzoY8t71X/vGqyu5Fv1+36FUP0VwOKYS9qmirjxhylbL5F0TV6+
 3bdYKoykOE5cGdtAfWhCatjdnXVOJonZ+elUSn+2s9HX+YA1UMwgGB62p3TUh6UOhxFI=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v8 03/12] target/hexagon: make slot number an unsigned
Date: Wed,  9 Feb 2022 18:03:03 +0100
Message-Id: <20220209170312.30662-4-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-1-anjo@rev.ng>
References: <20220209170312.30662-1-anjo@rev.ng>
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
index 4419d30e23..2f73300c90 100644
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
@@ -390,7 +392,7 @@ static inline void gen_store_conditional8(DisasContext *ctx,
     tcg_gen_movi_tl(hex_llsc_addr, ~0);
 }
 
-static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
+static inline void gen_store32(TCGv vaddr, TCGv src, int width, uint32_t slot)
 {
     tcg_gen_mov_tl(hex_store_addr[slot], vaddr);
     tcg_gen_movi_tl(hex_store_width[slot], width);
@@ -398,49 +400,49 @@ static inline void gen_store32(TCGv vaddr, TCGv src, int width, int slot)
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
@@ -449,7 +451,7 @@ static inline void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src,
 }
 
 static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
-                               DisasContext *ctx, int slot)
+                               DisasContext *ctx, uint32_t slot)
 {
     TCGv_i64 tmp = tcg_constant_i64(src);
     gen_store8(cpu_env, vaddr, tmp, ctx, slot);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 19d103cad5..3a64357090 100644
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
2.34.1


